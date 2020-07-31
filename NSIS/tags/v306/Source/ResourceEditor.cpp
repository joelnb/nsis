/*
 * ResourceEditor.cpp
 * 
 * This file is a part of NSIS.
 * 
 * Copyright (C) 2002-2020 Amir Szekely <kichik@users.sourceforge.net>
 * 
 * Licensed under the zlib/libpng license (the "License");
 * you may not use this file except in compliance with the License.
 * 
 * Licence details can be found in the file COPYING.
 * 
 * This software is provided 'as-is', without any express or implied
 * warranty.
 *
 * Reviewed for Unicode support by Jim Park -- 08/21/2007
 */

#include "ResourceEditor.h"
#include "util.h"
#include "winchar.h"
#include <queue>
#include <cassert>
#include "tchar.h"
#include "utf.h"
#include "BinInterop.h"
using namespace std;

//////////////////////////////////////////////////////////////////////
// Utilities
//////////////////////////////////////////////////////////////////////

#define WCHARPTR2WINWCHARPTR(s) ( (WINWCHAR*) (s) ) // Only for WinSDK structs like IMAGE_RESOURCE_DIR_STRING_U where we cannot change the WCHAR type!
#define RALIGN(dwToAlign, dwAlignOn) ((dwToAlign%dwAlignOn == 0) ? dwToAlign : dwToAlign - (dwToAlign%dwAlignOn) + dwAlignOn)
#define ALIGN(dwToAlign, dwAlignOn) dwToAlign = RALIGN((dwToAlign), (dwAlignOn))

static inline DWORD ConvertEndianness(DWORD d) { return FIX_ENDIAN_INT32(d); }
static inline WORD ConvertEndianness(WORD w) { return FIX_ENDIAN_INT16(w); }

PIMAGE_NT_HEADERS CResourceEditor::GetNTHeaders(BYTE* pbPE) {
  // Get dos header
  PIMAGE_DOS_HEADER dosHeader = (PIMAGE_DOS_HEADER) pbPE;
  if (dosHeader->e_magic != IMAGE_DOS_SIGNATURE)
    throw runtime_error("PE file contains invalid DOS header");

  // Get NT headers
  PIMAGE_NT_HEADERS ntHeaders = (PIMAGE_NT_HEADERS)(pbPE + ConvertEndianness((DWORD)dosHeader->e_lfanew));
  if (ntHeaders->Signature != IMAGE_NT_SIGNATURE)
    throw runtime_error("PE file missing NT signature");

  // Make sure this is a supported PE format
  const WORD ohm = *GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, Magic);
  if (ohm != IMAGE_NT_OPTIONAL_HDR32_MAGIC && ohm != IMAGE_NT_OPTIONAL_HDR64_MAGIC)
    throw runtime_error("Unsupported PE format");

  return ntHeaders;
}

PRESOURCE_DIRECTORY CResourceEditor::GetResourceDirectory(
  BYTE* pbPE,
  DWORD dwSize,
  PIMAGE_NT_HEADERS ntHeaders,
  DWORD *pdwResSecVA /*=NULL*/,
  DWORD *pdwSectionIndex /*=NULL*/
) {
  PIMAGE_DATA_DIRECTORY dataDirectory = *GetMemberFromPEOptHdr(ntHeaders->OptionalHeader, DataDirectory);
  DWORD dwNumberOfRvaAndSizes = *GetMemberFromPEOptHdr(ntHeaders->OptionalHeader, NumberOfRvaAndSizes);
  
  if (ConvertEndianness(dwNumberOfRvaAndSizes) <= IMAGE_DIRECTORY_ENTRY_RESOURCE)
    throw runtime_error("No resource section found");
  // Get resource section virtual address
  DWORD dwResSecVA = ConvertEndianness(dataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].VirtualAddress);
  // Pointer to the sections headers array
  PIMAGE_SECTION_HEADER sectionHeadersArray = IMAGE_FIRST_SECTION(ntHeaders);

  DWORD dwSectionIndex = (DWORD) -1;

  // Find resource section index in the array
  for (int i = 0; i < ConvertEndianness(ntHeaders->FileHeader.NumberOfSections); i++) {
    if (dwResSecVA == ConvertEndianness(sectionHeadersArray[i].VirtualAddress)) {
      // Remember resource section index
      dwSectionIndex = i;
      // Check for invalid resource section pointer
      if (!sectionHeadersArray[i].PointerToRawData)
        throw runtime_error("Invalid resource section pointer");

      break;
    }

    // Invalid section pointer (goes beyond the PE image)
    if (ConvertEndianness(sectionHeadersArray[i].PointerToRawData) > dwSize)
      throw runtime_error("Invalid section pointer");
  }

  // No resource section...
  if (dwSectionIndex == (DWORD) -1)
    throw runtime_error("PE file doesn't contain any resource section");

  // Return extra parameters
  if (pdwSectionIndex)
    *pdwSectionIndex = dwSectionIndex;
  if (pdwResSecVA)
    *pdwResSecVA = dwResSecVA;

  // Pointer to section data, the first resource directory
  DWORD dwResSecPtr = ConvertEndianness(sectionHeadersArray[dwSectionIndex].PointerToRawData);
  return PRESOURCE_DIRECTORY(pbPE + dwResSecPtr);
}

static int ParseSimpleInt(const TCHAR*parse, int*success)
{
  int base = 0, num;
  TCHAR *end;
  if (parse[0] == _T('0') && (parse[1] >= _T('0') && parse[1] <= _T('9'))) base = 10; // Avoid evil octal
  num = (int)_tcstoul(parse, &end, base);
  if (success) *success = !(int)(*end);
  return num;
}

const TCHAR* CResourceEditor::ParseResourceTypeString(const TCHAR*Str)
{
  if (Str[0] == _T('#')) // Special character used by KERNEL32!FindResource
  {
    ++Str;
    if (!_tcsicmp(Str, _T("Bitmap"))) return (TCHAR*) RT_BITMAP;
    if (!_tcsicmp(Str, _T("IconImage"))) return (TCHAR*) RT_ICON;
    if (!_tcsicmp(Str, _T("Icon"))) return (TCHAR*) RT_GROUP_ICON;
    if (!_tcsicmp(Str, _T("CursorImage"))) return (TCHAR*) RT_CURSOR;
    if (!_tcsicmp(Str, _T("Cursor"))) return (TCHAR*) RT_GROUP_CURSOR;
    if (!_tcsicmp(Str, _T("Dialog"))) return (TCHAR*) RT_DIALOG;
    if (!_tcsicmp(Str, _T("Menu"))) return (TCHAR*) MAKEINTRESOURCE(4);
    if (!_tcsicmp(Str, _T("Version"))) return (TCHAR*) RT_VERSION;
    if (!_tcsicmp(Str, _T("HTML"))) return (TCHAR*) MAKEINTRESOURCE(23);
    if (!_tcsicmp(Str, _T("Manifest"))) return (TCHAR*) MAKEINTRESOURCE(24);
    int succ, num = ParseSimpleInt(Str, &succ);
    return succ && IS_INTRESOURCE(num) ? (TCHAR*) MAKEINTRESOURCE(num) : NULL;
  }
  return *Str ? Str : NULL;
}

#include "exehead/resource.h" // IDI_ICON2
#include "exehead/config.h" // NSIS_DEFAULT_LANG
const TCHAR* CResourceEditor::ParseResourceNameString(const TCHAR*Str) {
  if (Str[0] == _T('#'))
  {
    ++Str;
    if (!_tcsicmp(Str, _T("Version"))) return (TCHAR*) MAKEINTRESOURCE(1);
    if (!_tcsicmp(Str, _T("Icon"))) return (TCHAR*) MAKEINTRESOURCE(IDI_ICON2);
    int succ, num = ParseSimpleInt(Str, &succ);
    return succ && IS_INTRESOURCE(num) ? (TCHAR*) MAKEINTRESOURCE(num) : NULL;
  }
  return EditorSupportsStringNames() && *Str ? Str : NULL;
}

LANGID CResourceEditor::ParseResourceLangString(const TCHAR*Str) {
  if (!_tcsicmp(Str, _T("Any"))) return ANYLANGID;
  if (!_tcsicmp(Str, _T("All"))) return ALLLANGID;
  if (!_tcsicmp(Str, _T("Neutral"))) return 0x0000; //MAKELANGID(0, 0);
  if (!_tcsicmp(Str, _T("Default"))) return NSIS_DEFAULT_LANG;
  int succ, num = ParseSimpleInt(Str, &succ);
  return succ ? num : INVALIDLANGID;
}

LANGID CResourceEditor::ParseResourceTypeNameLangString(const TCHAR**Type, const TCHAR**Name, const TCHAR*Lang) {
  if (!(*Type = ParseResourceTypeString(*Type))) return INVALIDLANGID;
  if (!(*Name = ParseResourceNameString(*Name))) return INVALIDLANGID;
  return ParseResourceLangString(Lang);
}

template<class T> static WORD GetDependentType(T Type)
{
  if (!IS_INTRESOURCE((size_t) Type)) return 0;
  if (MAKEINTRESOURCE((size_t) Type) == RT_GROUP_ICON) return (WORD)(size_t) RT_ICON;
  if (MAKEINTRESOURCE((size_t) Type) == RT_GROUP_CURSOR) return (WORD)(size_t) RT_CURSOR;
  return 0;
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// CResourceEditor
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CResourceEditor::CResourceEditor(void* pbPE, int iSize, bool bKeepData /*=true*/) {
  // Copy the data pointer
  m_pbPE = (BYTE*) pbPE;
  m_iSize = iSize;
  m_bKeepData = bKeepData;

  // Get NT headers
  m_ntHeaders = GetNTHeaders(m_pbPE);

  // No check sum support yet...
  DWORD* pdwCheckSum = GetCommonMemberFromPEOptHdr(m_ntHeaders->OptionalHeader, CheckSum);
  if (*pdwCheckSum)
  {
    // clear checksum (should be [re]calculated after all changes done)
    pdwCheckSum = 0;
    //throw runtime_error("CResourceEditor doesn't yet support check sum");
  }

  // Get resource section virtual address, resource section index and pointer to resource directory
  PRESOURCE_DIRECTORY rdRoot = GetResourceDirectory(m_pbPE, iSize, m_ntHeaders, &m_dwResourceSectionVA, &m_dwResourceSectionIndex);

  // Scan the resource directory
  m_cResDir = ScanDirectory(rdRoot, rdRoot);
}

CResourceEditor::~CResourceEditor() {
  delete m_cResDir;
}

//////////////////////////////////////////////////////////////////////
// Methods
//////////////////////////////////////////////////////////////////////

#define FINDRESOURCE_NAME_FIRSTITEM ( (WINWCHAR*)(~(size_t)0) )

CResourceDirectoryEntry* CResourceEditor::FindResourceLanguageDirEntryW(const WINWCHAR* Type, const WINWCHAR* Name, LANGID Language) {
  int i = m_cResDir->Find(Type);
  if (-1 != i) {
    CResourceDirectory* pND = m_cResDir->GetEntry(i)->GetSubDirectory();
    i = FINDRESOURCE_NAME_FIRSTITEM == Name ? 0 : pND->Find(Name);
    if (-1 != i) {
      CResourceDirectory* pLD = pND->GetEntry(i)->GetSubDirectory();
      i = ANYLANGID == Language ? 0 : pLD->Find(Language);
      if (-1 != i)
        return pLD->GetEntry(i);
    }
  }
  return 0;
}

CResourceDataEntry* CResourceEditor::FindResource(const WINWCHAR* Type, const WINWCHAR* Name, LANGID Language) {
  CResourceDirectoryEntry*pRDE = FindResourceLanguageDirEntryW(Type, Name, Language);
  return pRDE ? pRDE->GetDataEntry() : 0;
}

// Adds/Replaces/Removes a simple resource.
// If lpData is 0 UpdateResource removes the resource.
bool CResourceEditor::UpdateResourceW(const WINWCHAR* szType, WINWCHAR* szName, LANGID wLanguage, BYTE* lpData, DWORD dwSize, TYPEMANIPULATION Manip) {
  CResourceDirectory* nameDir = 0;
  CResourceDirectory* langDir = 0;
  CResourceDataEntry* data = 0;
  IMAGE_RESOURCE_DIRECTORY rd = {0, /*time(0),*/};
  int iTypeIdx = -1, iNameIdx = -1, iLangIdx = -1;

  iTypeIdx = m_cResDir->Find(szType);
  if (iTypeIdx > -1) {
    nameDir = m_cResDir->GetEntry(iTypeIdx)->GetSubDirectory();
    iNameIdx = nameDir->Find(szName);
    if (iNameIdx > -1) {
      langDir = nameDir->GetEntry(iNameIdx)->GetSubDirectory();
      iLangIdx = langDir->Find(wLanguage);
      if (iLangIdx > -1) {
        data = langDir->GetEntry(iLangIdx)->GetDataEntry();
      }
    }
  }

  bool deleteoperation = !lpData, success = true, handlecomplexicon = false;
  WORD dependenttype = GetDependentType(szType);

  if (dependenttype && Manip != TM_RAW) {
    if (Manip == TM_AUTO && ((size_t) szType == (size_t) RT_GROUP_ICON || (size_t) szType == (size_t) RT_GROUP_CURSOR))
      Manip = TM_ICON;

    if (Manip & TM_ICON)
      handlecomplexicon = true;

    if (handlecomplexicon && !deleteoperation)
      if (Manip == TM_AUTO || (Manip & TM_ICONRSRC))
        return false; // It is impossible to add a resource icon from a plain data buffer because it doesn't use offsets for the images

    if ((size_t) szType == (size_t) RT_GROUP_ICON && (size_t) szName == (size_t) IDI_ICON2)
      return false; // The main icon is special, don't allow high-level RT_GROUP_ICON updates to touch RT_ICON.
  }

  if (lpData && Manip == TM_AUTO && (size_t) szType == (size_t) RT_BITMAP)
  {
    if (IsBMPFile(lpData, dwSize))
    {
      lpData += 14, dwSize -= 14; // Remove BITMAPFILEHEADER (blogs.msdn.microsoft.com/oldnewthing/20091211-00/?p=15693#)
      Manip = TM_RAW;
    }
  }

  if (!deleteoperation) {
    // Replace/Add the resource
    if (handlecomplexicon) {
      if (data)
        DeleteIconImagesW(szType, szName, wLanguage); // Delete the RT_ICONs that belong to the RT_GROUP_ICON we are replacing
      return AddExtraIconFromFile(szType, szName, wLanguage, lpData, dwSize); // Add RT_GROUP_ICON and RT_ICONs
    }

    if (data) {
      data->SetData(lpData, dwSize);
      return true;
    }

    if (!nameDir) {
      // Type doesn't yet exist
      nameDir = new CResourceDirectory(&rd);
      CResourceDirectoryEntry *pRDE = new CResourceDirectoryEntry(szType, nameDir);
      if (!m_cResDir->AddEntry(pRDE)) delete pRDE;
    }
    if (!langDir) {
      // Name doesn't yet exist
      langDir = new CResourceDirectory(&rd);
      CResourceDirectoryEntry *pRDE = new CResourceDirectoryEntry(szName, langDir);
      if (!nameDir->AddEntry(pRDE)) delete pRDE;
    }
    if (!data) {
      // Language doesn't yet exist, hence data nither
      data = new CResourceDataEntry(lpData, dwSize);
      CResourceDirectoryEntry *pRDE = new CResourceDirectoryEntry(MAKEINTRESOURCEWINW(wLanguage), data);
      if (!langDir->AddEntry(pRDE)) delete pRDE;
    }
  }
  else if (data) {
    if (handlecomplexicon) {
      success = DeleteIconImagesW(szType, szName, wLanguage); // Delete the RT_ICONs that belong to the RT_GROUP_ICON we are deleting
    }
    // Delete the resource
    delete data;
    langDir->RemoveEntry(iLangIdx);
    // Delete directories holding the resource if empty
    if (!langDir->CountEntries()) {
      delete langDir;
      nameDir->RemoveEntry(iNameIdx);
      if (!nameDir->CountEntries()) {
        delete nameDir;
        m_cResDir->RemoveEntry(iTypeIdx);
      }
    }
  }
  else
    success = false;
  return success;
}

#ifndef _UNICODE
static WINWCHAR* ResStringToUnicode(const char *szString) {
  if (IS_INTRESOURCE(szString)) return MAKEINTRESOURCEWINW((ULONG_PTR)szString);
  WINWCHAR *s = WinWStrDupFromTChar(szString);
  if (!s) throw std::bad_alloc();
  return s;
}
static void FreeUnicodeResString(WINWCHAR* szwString) {
  if (!IS_INTRESOURCE(szwString)) free(szwString);
}
#else
#ifndef _WIN32
static WINWCHAR* ResStringToUnicode(const TCHAR *s) {
  if (IS_INTRESOURCE(s)) return MAKEINTRESOURCEWINW((ULONG_PTR)s);
  WCToUTF16LEHlpr cnv;
  if (!cnv.Create(s)) throw std::runtime_error("Unicode conversion failed");
  return (WINWCHAR*) cnv.Detach();
}
static void FreeUnicodeResString(WINWCHAR* s) {
  if (!IS_INTRESOURCE(s)) free(s);
}
#endif // ~_WIN32
#endif // ~_UNICODE

CResourceDirectoryEntry* CResourceEditor::FindResourceLanguageDirEntryT(const TCHAR* Type, const TCHAR* Name, LANGID Language) {
  assert(!EditorSupportsStringNames() && sizeof(Name));
#if defined(_WIN32) && defined(_UNICODE)
  return FindResourceLanguageDirEntryW((WINWCHAR*)Type, (WINWCHAR*)Name, Language);
#else
  WINWCHAR* szwType = ResStringToUnicode(Type); 
  CResourceDirectoryEntry* result = FindResourceLanguageDirEntryW(szwType, (WINWCHAR*)Name, Language);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

bool CResourceEditor::UpdateResourceT(const TCHAR* szType, WORD szName, LANGID wLanguage, BYTE* lpData, DWORD dwSize, TYPEMANIPULATION Manip) {
  assert(!EditorSupportsStringNames() && sizeof(szName));
#if defined(_WIN32) && defined(_UNICODE)
  return UpdateResourceW((WINWCHAR*)szType, MAKEINTRESOURCEWINW(szName), wLanguage, lpData, dwSize, Manip);
#else
  WINWCHAR* szwType = ResStringToUnicode(szType); 
  bool result = UpdateResourceW(szwType, MAKEINTRESOURCEWINW(szName), wLanguage, lpData, dwSize, Manip);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

bool CResourceEditor::UpdateResourceT(const TCHAR* szType, WORD szName, LANGID wLanguage, FILE*Data, TYPEMANIPULATION Manip) {
  assert(!EditorSupportsStringNames() && sizeof(szName));
  bool result = false;
  unsigned long size;
  BYTE *data = alloc_and_read_file(Data, size);
  if (!data)
    return false;
  WORD dependenttype = GetDependentType(szType);
  if (Manip == TM_AUTO)
    if (dependenttype && IsICOCURFile(data, size))
      Manip = TM_ICONFILE;
  result = UpdateResourceT(szType, szName, wLanguage, data, size, Manip);
  free(data);
  return result;
}

bool CResourceEditor::DeleteResourceT(const TCHAR* szType, WORD szName, LANGID wLanguage, TYPEMANIPULATION Manip) {
  if (wLanguage != ALLLANGID)
    return UpdateResourceT(szType, szName, wLanguage, 0, 0, Manip);

  assert(!EditorSupportsStringNames() && sizeof(szName));
  const TCHAR *name = (const TCHAR*) MAKEINTRESOURCE(szName);
  unsigned int deleted = 0;
  for (;; ++deleted) {
    CResourceDirectoryEntry*pDir = FindResourceLanguageDirEntryT(szType, name, ANYLANGID);
    if (!pDir || !UpdateResourceT(szType, szName, pDir->GetId(), 0, 0, Manip)) break;
  }
  return deleted != 0;
}

// Returns a copy of the requested resource
// Returns 0 if the requested resource can't be found
BYTE* CResourceEditor::GetResourceW(const WINWCHAR* szType, WINWCHAR* szName, LANGID wLanguage) {
  CResourceDataEntry* data = FindResource(szType, szName, wLanguage);
  return DupData(data);
}

BYTE* CResourceEditor::GetResourceT(const TCHAR* szType, WORD szName, LANGID wLanguage) {
  assert(!EditorSupportsStringNames() && sizeof(szName));
#if defined(_WIN32) && defined(_UNICODE)
  return GetResourceW((WINWCHAR*)szType, MAKEINTRESOURCEWINW(szName), wLanguage);
#else
  WINWCHAR* szwType = ResStringToUnicode(szType);
  BYTE* result = GetResourceW(szwType, MAKEINTRESOURCEWINW(szName), wLanguage);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

// Returns the size of the requested resource
// Returns -1 if the requested resource can't be found
int CResourceEditor::GetResourceSizeW(const WINWCHAR* szType, WINWCHAR* szName, LANGID wLanguage) {
  CResourceDataEntry* data = FindResource(szType, szName, wLanguage);
  return data ? data->GetSize() : -1;
}

int CResourceEditor::GetResourceSizeT(const TCHAR* szType, WORD szName, LANGID wLanguage) {
  assert(!EditorSupportsStringNames());
#if defined(_WIN32) && defined(_UNICODE)
  return GetResourceSizeW((WINWCHAR*)szType, MAKEINTRESOURCEWINW(szName), wLanguage);
#else
  WINWCHAR* szwType = ResStringToUnicode(szType);
  int result = GetResourceSizeW(szwType, MAKEINTRESOURCEWINW(szName), wLanguage);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

bool CResourceEditor::ResourceExistsT(const TCHAR* szType, WORD szName, LANGID wLanguage, LANGID*pFoundLanguage) {
  assert(!EditorSupportsStringNames() && sizeof(szName));
  const TCHAR *name = (const TCHAR*) MAKEINTRESOURCE(szName);
  if (wLanguage == ALLLANGID) wLanguage = ANYLANGID;
  CResourceDirectoryEntry *pRDE = FindResourceLanguageDirEntryT(szType, name, wLanguage);
  if (pFoundLanguage) *pFoundLanguage = pRDE ? pRDE->GetId() : INVALIDLANGID;
  return pRDE != 0;
}

// Returns the offset of the requested resource in the original PE
// Returns -1 if the requested resource can't be found
DWORD CResourceEditor::GetResourceOffsetW(const WINWCHAR* szType, WINWCHAR* szName, LANGID wLanguage) {
  CResourceDataEntry* data = FindResource(szType, szName, wLanguage);
  return data ? data->GetOffset() : DWORD(-1);
}

DWORD CResourceEditor::GetResourceOffsetT(const TCHAR* szType, WORD szName, LANGID wLanguage) {
  assert(!EditorSupportsStringNames() && sizeof(szName));
#if defined(_WIN32) && defined(_UNICODE)
  return GetResourceOffsetW((WINWCHAR*)szType, MAKEINTRESOURCEWINW(szName), wLanguage);
#else
  WINWCHAR* szwType = ResStringToUnicode(szType);
  DWORD result = GetResourceOffsetW(szwType, MAKEINTRESOURCEWINW(szName), wLanguage);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

// Returns a copy of the resource data from the first resource of a specific type
BYTE* CResourceEditor::GetFirstResourceW(const WINWCHAR* szType, size_t&cbData) {
  CResourceDataEntry *pDE = FindResource(szType, FINDRESOURCE_NAME_FIRSTITEM, ANYLANGID);
  if (pDE)
  {
    cbData = pDE->GetSize();
    return DupData(pDE);
  }
  return NULL;
}

BYTE* CResourceEditor::GetFirstResourceT(const TCHAR* szType, size_t&cbData) {
#if defined(_WIN32) && defined(_UNICODE)
  return GetFirstResourceW((WINWCHAR*)szType, cbData);
#else
  WINWCHAR* szwType = ResStringToUnicode(szType);
  BYTE* result = GetFirstResourceW(szwType, cbData);
  FreeUnicodeResString(szwType);
  return result;
#endif
}

BYTE* CResourceEditor::DupData(CResourceDataEntry*pDE) {
  if (!m_bKeepData)
    throw runtime_error("Can't get resource data when bKeepData is false");
  if (pDE)
  {
    size_t cb = pDE->GetSize();
    BYTE* p = new BYTE[cb]; // Free with FreeResource()
    if (p) CopyMemory(p, pDE->GetData(), cb);
    return p;
  }
  return NULL;
}

void CResourceEditor::FreeResource(BYTE* pbResource)
{
  if (pbResource)
    delete [] pbResource;
}

// Saves the edited PE into a buffer and returns it.
DWORD CResourceEditor::Save(BYTE* pbBuf, DWORD &dwSize) {
  if (!m_bKeepData)
    throw runtime_error("Can't Save() when bKeepData is false");

  unsigned int i;
  DWORD dwReqSize, temp32;

  temp32 = *GetCommonMemberFromPEOptHdr(m_ntHeaders->OptionalHeader, FileAlignment);
  const DWORD dwFileAlign = ConvertEndianness(temp32);
  temp32 = *GetCommonMemberFromPEOptHdr(m_ntHeaders->OptionalHeader, SectionAlignment);
  const DWORD dwSecAlign = ConvertEndianness(temp32);

  DWORD dwRsrcSize = m_cResDir->GetSize(); // Size of new resource section
  DWORD dwRsrcSizeAligned = RALIGN(dwRsrcSize, dwFileAlign); // Align it to FileAlignment

  // Calculate the total new PE size
  DWORD dwOldRsrcSize = ConvertEndianness(IMAGE_FIRST_SECTION(m_ntHeaders)[m_dwResourceSectionIndex].SizeOfRawData);
  dwReqSize = m_iSize - dwOldRsrcSize + dwRsrcSizeAligned;

  if (!pbBuf || dwSize < dwReqSize)
    return dwReqSize;

  // Use buffer
  BYTE* pbNewPE = pbBuf;
  dwSize = dwReqSize;
  // Fill buffer with zeros
  ZeroMemory(pbNewPE, dwSize);

  BYTE* seeker = pbNewPE;
  BYTE* oldSeeker = m_pbPE;

  PIMAGE_SECTION_HEADER old_sectionHeadersArray = IMAGE_FIRST_SECTION(m_ntHeaders);

  DWORD dwHeaderSize = ConvertEndianness(old_sectionHeadersArray[m_dwResourceSectionIndex].PointerToRawData);
  WORD wNumberOfSections = ConvertEndianness(m_ntHeaders->FileHeader.NumberOfSections);

  // Copy everything until the resource section (including headers and everything that might come after them)
  // We don't use SizeOfHeaders because sometimes (using VC6) it can extend beyond the first section
  // or (Borland) there could be some more information between the headers and the first section.
  CopyMemory(seeker, oldSeeker, dwHeaderSize);

  // Skip the headers and whatever comes after them
  seeker += dwHeaderSize;
  oldSeeker += dwHeaderSize;

  // Get new nt headers pointer
  PIMAGE_NT_HEADERS ntHeaders = GetNTHeaders(pbNewPE);
  // Get a pointer to the new section headers
  PIMAGE_SECTION_HEADER sectionHeadersArray = IMAGE_FIRST_SECTION(ntHeaders);

  // Skip the resource section in the old PE seeker.
  oldSeeker += dwOldRsrcSize;

  // Save the old virtual size of the resource section
  DWORD dwNewVirtualSize = RALIGN(dwRsrcSize, dwSecAlign);
  DWORD dwOldVirtualSize = ConvertEndianness(sectionHeadersArray[m_dwResourceSectionIndex].Misc.VirtualSize);
  ALIGN(dwOldVirtualSize, dwSecAlign);
  DWORD dwVAAdjustment = dwNewVirtualSize - dwOldVirtualSize;

  // Set the new size of the resource section (size aligned to FileAlignment)
  sectionHeadersArray[m_dwResourceSectionIndex].SizeOfRawData = ConvertEndianness(dwRsrcSizeAligned);
  // Set the virtual size as well (in memory)
  sectionHeadersArray[m_dwResourceSectionIndex].Misc.VirtualSize = ConvertEndianness(dwRsrcSize);
  (*GetMemberFromPEOptHdr(ntHeaders->OptionalHeader, DataDirectory))[IMAGE_DIRECTORY_ENTRY_RESOURCE].Size = ConvertEndianness(dwRsrcSize);

  // Set the new virtual size of the image
  DWORD* pdwSizeOfImage = GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, SizeOfImage);
  *pdwSizeOfImage = AlignVA(*GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, SizeOfHeaders));
  for (i = 0; i < wNumberOfSections; i++) {
    DWORD dwSecSize = ConvertEndianness(sectionHeadersArray[i].Misc.VirtualSize);
    *pdwSizeOfImage = AlignVA(AdjustVA(*pdwSizeOfImage, dwSecSize));
  }

  // Set the new AddressOfEntryPoint if needed
  DWORD* pdwAddressOfEntryPoint = GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, AddressOfEntryPoint);
  if (ConvertEndianness(*pdwAddressOfEntryPoint) > m_dwResourceSectionVA)
    *pdwAddressOfEntryPoint = AdjustVA(*pdwAddressOfEntryPoint, dwVAAdjustment);

  // Set the new BaseOfCode if needed
  DWORD* pdwBaseOfCode = GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, BaseOfCode);
  if (ConvertEndianness(*pdwBaseOfCode) > m_dwResourceSectionVA)
    *pdwBaseOfCode = AdjustVA(*pdwBaseOfCode, dwVAAdjustment);

  // Set the new BaseOfData if needed
  if (*GetCommonMemberFromPEOptHdr(ntHeaders->OptionalHeader, Magic) == IMAGE_NT_OPTIONAL_HDR32_MAGIC) {
    DWORD* pdwBaseOfData = &((PIMAGE_OPTIONAL_HEADER32)&ntHeaders->OptionalHeader)->BaseOfData;
    if (ConvertEndianness(*pdwBaseOfData) > m_dwResourceSectionVA)
      *pdwBaseOfData = AdjustVA(*pdwBaseOfData, dwVAAdjustment);
  }

  // Refresh the headers of the sections that come after the resource section, and the data directory
  DWORD dwNumberOfRvaAndSizes = *GetMemberFromPEOptHdr(ntHeaders->OptionalHeader, NumberOfRvaAndSizes);
  PIMAGE_DATA_DIRECTORY pDataDirectory = *GetMemberFromPEOptHdr(ntHeaders->OptionalHeader, DataDirectory);
  for (i = m_dwResourceSectionIndex + 1; i < wNumberOfSections; i++) {
    if (sectionHeadersArray[i].PointerToRawData) {
      AdjustVA(sectionHeadersArray[i].PointerToRawData, dwRsrcSizeAligned - dwOldRsrcSize);
    }

    // We must find the right data directory entry before we change the virtual address
    unsigned int uDataDirIdx = 0;
    for (unsigned int j = 0; j < ConvertEndianness(dwNumberOfRvaAndSizes); j++)
      if (pDataDirectory[j].VirtualAddress == sectionHeadersArray[i].VirtualAddress)
        uDataDirIdx = j;

    sectionHeadersArray[i].VirtualAddress = AdjustVA(sectionHeadersArray[i].VirtualAddress, dwVAAdjustment);

    // Change the virtual address in the data directory too
    if (uDataDirIdx)
      pDataDirectory[uDataDirIdx].VirtualAddress = sectionHeadersArray[i].VirtualAddress;
  }

  // Write the resource section
  WriteRsrcSec(seeker);
  // Advance the pointer
  seeker += dwRsrcSizeAligned;

  // Copy everything that comes after the resource section (other sections and tacked data)
  size_t cbLeft = m_iSize - (oldSeeker - m_pbPE);
  if (cbLeft)
    CopyMemory(seeker, oldSeeker, cbLeft);

  seeker += cbLeft;
  oldSeeker += cbLeft;

  /**********************************************************
   * To add checksum to the header use MapFileAndCheckSum
   **********************************************************/

  // From now on, we are working on the new PE
  // Freeing the old PE memory is up to the user
  m_pbPE = pbNewPE;
  m_iSize = dwSize;
  m_ntHeaders = ntHeaders;
  // We just wrote the resource section according to m_cResDir, so we don't need to rescan
  // m_dwResourceSectionIndex and m_dwResourceSectionVA have also been left unchanged as
  // we didn't move the resources section

  return 0;
}

// This function scans exe sections and after find a match with given name
// increments it's virtual size (auto fixes image size based on section alignment, etc)
// Jim Park: The section name must be ASCII code. Do not TCHAR this stuff.
bool CResourceEditor::SetPESectionVirtualSize(const char* pszSectionName, DWORD newsize)
{
  PIMAGE_SECTION_HEADER sectionHeadersArray = IMAGE_FIRST_SECTION(m_ntHeaders);

  // Refresh the headers of the sections that come after the resource section, and the data directory
  for (int i = 0; i < ConvertEndianness(m_ntHeaders->FileHeader.NumberOfSections); i++) {
    if (!strcmp((LPCSTR)sectionHeadersArray[i].Name, pszSectionName)) {
      sectionHeadersArray[i].Misc.VirtualSize = AlignVA(ConvertEndianness(newsize));

      sectionHeadersArray[i].Characteristics &= ConvertEndianness((DWORD) ~IMAGE_SCN_MEM_DISCARDABLE);

      // now fix any section after
      for (int k = i + 1; k < ConvertEndianness(m_ntHeaders->FileHeader.NumberOfSections); k++, i++) {
        DWORD dwLastSecVA = ConvertEndianness(sectionHeadersArray[i].VirtualAddress);
        DWORD dwLastSecSize = ConvertEndianness(sectionHeadersArray[i].Misc.VirtualSize);
        DWORD dwSecVA = AlignVA(ConvertEndianness(dwLastSecVA + dwLastSecSize));

        sectionHeadersArray[k].VirtualAddress = dwSecVA;

        if (m_dwResourceSectionIndex == (DWORD) k)
        {
          // fix the resources virtual address if it changed
          PIMAGE_DATA_DIRECTORY pDataDirectory = *GetMemberFromPEOptHdr(m_ntHeaders->OptionalHeader, DataDirectory);
          pDataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].VirtualAddress = dwSecVA;
          m_dwResourceSectionVA = ConvertEndianness(dwSecVA);
        }
      }

      return true;
    }
  }

  return false;
}

static char* GetFirstICOCURGroupEntry(const void*headerdata, WORD*pImgType, WORD*pCount) {
  WORD *p16 = (WORD*) headerdata;
  if (IsICOCURFile(headerdata)) { // The first 6+ bytes of the resource format matches the file format
    if (pImgType)
      *pImgType = FIX_ENDIAN_INT16(p16[1]) == 2 ? (WORD)(size_t) RT_CURSOR : (WORD)(size_t) RT_ICON;
    if (pCount)
      *pCount = FIX_ENDIAN_INT16(p16[2]);
    return ((char*) headerdata) + 6;
  }
  return 0;
}

bool CResourceEditor::DeleteIconImages(const CResourceDirectoryEntry& LangDir) {
  WORD imgType, count, *pRGE = (WORD*) GetFirstICOCURGroupEntry(LangDir.GetDataEntry()->GetData(), &imgType, &count);
  if (!pRGE)
    return false;
  for (unsigned int i = 0, cbRGE = 14; i < count; ++i, pRGE += cbRGE / sizeof(*pRGE))
    if (!DeleteResource(MAKEINTRESOURCE(imgType), FIX_ENDIAN_INT16(pRGE[6]), LangDir.GetId()))
      return false;
  return true;
}

bool CResourceEditor::DeleteIconImagesW(const WINWCHAR* OwnerType, WINWCHAR* Name, LANGID LangId) {
  CResourceDirectoryEntry*pLangDir = FindResourceLanguageDirEntryW(OwnerType, Name, LangId);
  return pLangDir ? DeleteIconImages(*pLangDir) : false;
}

static WORD FindFreeIconImageId(CResourceEditor& re, WORD ImgType) {
  for (unsigned int i = MAIN_ICON_LAST_IMAGE + 1; i <= 0xffff; ++i)
    if (!re.ResourceExists(MAKEINTRESOURCE(ImgType), (WORD) i, CResourceEditor::ANYLANGID))
      return (WORD) i;
  return 0;
}

bool CResourceEditor::AddExtraIconFromFile(const WINWCHAR* Type, WINWCHAR* Name, LANGID LangId, BYTE* Data, DWORD Size) {
  typedef struct { BYTE Width, Height, Palette, Reserved; WORD Planes, BPP; UINT32 Size, Offset; } FILEICOGROUPENTRY;
  typedef struct { BYTE Width, Height, Palette, Reserved; WORD Planes, BPP, SizeLo, SizeHi, Id; } RSRCICOGROUPENTRY;
  typedef struct { WORD Width, Height;                    WORD Planes, BPP, SizeLo, SizeHi, Id; } RSRCCURGROUPENTRY; //msdn.microsoft.com/en-us/library/windows/desktop/ms648011(v=vs.85).aspx
  assert(sizeof(RSRCICOGROUPENTRY) == 12+2 && sizeof(FILEICOGROUPENTRY) == 12+4);
  assert(sizeof(RSRCICOGROUPENTRY) == sizeof(RSRCCURGROUPENTRY));

  WORD failed = 0, count, imgType, imgId;
  FILEICOGROUPENTRY *pSrcFGE = (FILEICOGROUPENTRY*) GetFirstICOCURGroupEntry(Data, &imgType, &count);
  if (!pSrcFGE)
    return false;

  unsigned int cbDstGrp = 6 + (count * sizeof(RSRCICOGROUPENTRY));
  BYTE *pDstGrp = new BYTE[cbDstGrp], isCursor = MAKEINTRESOURCE(imgType) == RT_CURSOR;
  memcpy(pDstGrp, Data, 6);
  RSRCICOGROUPENTRY *pDstRGE = (RSRCICOGROUPENTRY*) (((char*) pDstGrp) + 6);

  for (unsigned int i = 0; i < count; ++i) {
    if (!(imgId = FindFreeIconImageId(*this, imgType)))
      goto fail;
    memcpy(&pDstRGE[i], &pSrcFGE[i], sizeof(RSRCICOGROUPENTRY)); // Copy the image information
    pDstRGE[i].Id = FIX_ENDIAN_INT16(imgId);                     // and assign the new resource id
    UINT32 imgSize = FIX_ENDIAN_INT32(pSrcFGE[i].Size);
    BYTE *pImg = (BYTE*) (((char*) Data) + FIX_ENDIAN_INT32(pSrcFGE[i].Offset)), *pCursor = 0;

    if (isCursor) { // We must prepend the hotspot to the image data and change the group entry
      GENERICIMAGEINFO info;
      if (/*!IsPNGFile(pImg, imgSize, &info) &&*/ !GetDIBHeaderInfo(pImg, imgSize, info)) // Are PNG cursor images allowed?
        goto fail;
      //if (info.IsTopDownBitmap() && isDib)
      //  goto fail; // Are TopDown DIBs allowed? Probably not but we play it safe.

      typedef struct { WORD x, y; } CURSORIMGHDR; //msdn.microsoft.com/en-us/library/windows/desktop/ms648017(v=vs.85).aspx
      pCursor = new BYTE[imgSize + 4];
      CURSORIMGHDR *pLH = (CURSORIMGHDR*) pCursor;
      pLH->x = pSrcFGE[i].Planes, pLH->y = pSrcFGE[i].BPP;
      memcpy(pCursor + sizeof(CURSORIMGHDR), pImg, imgSize);
      pImg = pCursor, imgSize += 4; // Our new image data is ready

      RSRCCURGROUPENTRY *pCGE = (RSRCCURGROUPENTRY*) &pDstRGE[i];
      pCGE->Width = FIX_ENDIAN_INT16(info.Width > 0xffff ? 0 : (WORD) info.Width);
      pCGE->Height = FIX_ENDIAN_INT16(info.Height > 0xffff ? 0 : (WORD) info.Height);
      pCGE->Planes = FIX_ENDIAN_INT16(info.Planes), pCGE->BPP = FIX_ENDIAN_INT16(info.BPP);
      ((FILEICOGROUPENTRY*)pCGE)->Size = FIX_ENDIAN_INT32(imgSize); // The size of the image data has changed
    }

    bool succ = UpdateResource(MAKEINTRESOURCE(imgType), imgId, LangId, pImg, imgSize);
    if (pCursor)
      delete [] pCursor;
    if (!succ)
      goto fail;
  }
  if (!UpdateResourceW(Type, Name, LangId, pDstGrp, cbDstGrp))
    fail: ++failed;

  delete [] pDstGrp;
  return !failed;
}

//////////////////////////////////////////////////////////////////////
// Private Methods
//////////////////////////////////////////////////////////////////////

// This function scans a given resource directory and returns a CResourceDirectory object
// rdRoot must point to the root directory of the resource section
CResourceDirectory* CResourceEditor::ScanDirectory(PRESOURCE_DIRECTORY rdRoot, PRESOURCE_DIRECTORY rdToScan) {
  // Create CResourceDirectory from rdToScan
  CResourceDirectory* rdc = new CResourceDirectory(PIMAGE_RESOURCE_DIRECTORY(rdToScan));
  WINWCHAR* szName;
  PIMAGE_RESOURCE_DATA_ENTRY rde = NULL;

  // Go through all entries of this resource directory
  int entries = ConvertEndianness(rdToScan->Header.NumberOfNamedEntries);
  entries += ConvertEndianness(rdToScan->Header.NumberOfIdEntries);

  for (int i = 0; i < entries; i++) {
    MY_IMAGE_RESOURCE_DIRECTORY_ENTRY rd = rdToScan->Entries[i];
    rd.UOffset.OffsetToData = ConvertEndianness(rd.UOffset.OffsetToData);
    rd.UName.Name = ConvertEndianness(rd.UName.Name);

    // If this entry points to data entry get a pointer to it
    if (!rd.UOffset.DirectoryOffset.DataIsDirectory)
      rde = PIMAGE_RESOURCE_DATA_ENTRY(rd.UOffset.OffsetToData + (BYTE*)rdRoot);

    // If this entry has a name, translate it from Unicode
    if (rd.UName.NameString.NameIsString) {
      PIMAGE_RESOURCE_DIR_STRING_U rds = PIMAGE_RESOURCE_DIR_STRING_U(rd.UName.NameString.NameOffset + (char*)rdRoot);

      size_t nameSize = ConvertEndianness(rds->Length);
      szName = new WINWCHAR[nameSize+1];
      WinWStrNCpy(szName, WCHARPTR2WINWCHARPTR(rds->NameString), nameSize);
      szName[nameSize] = 0;
    }
    // Else, set the name to this entry's id
    else
      szName = MAKEINTRESOURCEWINW(ConvertEndianness(rdToScan->Entries[i].UName.Id));

    if (rd.UOffset.DirectoryOffset.DataIsDirectory)
    {
      CResourceDirectoryEntry *pRDE = new CResourceDirectoryEntry(
        szName,
        ScanDirectory(
          rdRoot,
          PRESOURCE_DIRECTORY(rd.UOffset.DirectoryOffset.OffsetToDirectory + (LPBYTE)rdRoot)
        )
      );
      if (!rdc->AddEntry(pRDE)) delete pRDE;
    }
    else
    {
      LPBYTE pbData = (LPBYTE)rdRoot + ConvertEndianness(rde->OffsetToData) - m_dwResourceSectionVA;
      DWORD dwOffset = DWORD(pbData - m_pbPE);

      if (m_bKeepData)
      {
        if (dwOffset > DWORD(m_iSize))
        {
          throw runtime_error("Invalid resource entry data pointer, possibly compressed resources");
        }
      }
      else
      {
        pbData = m_pbPE; // dummy pointer to "nothing"
      }
      CResourceDirectoryEntry *pRDE = new CResourceDirectoryEntry(
        szName,
        new CResourceDataEntry(
          pbData,
          ConvertEndianness(rde->Size),
          ConvertEndianness(rde->CodePage),
          dwOffset
        )
      );
      if (!rdc->AddEntry(pRDE)) delete pRDE;
    }

    // Delete the dynamicly allocated name if it is a name and not an id
    if (!IS_INTRESOURCE(szName))
      delete [] szName;
  }

  return rdc;
}

// This function writes into a given place in memory (pbRsrcSec) the edited resource section
void CResourceEditor::WriteRsrcSec(BYTE* pbRsrcSec) {
  BYTE* seeker = pbRsrcSec;

  queue<CResourceDirectory*> qDirs; // Used to scan the tree by level
  queue<CResourceDataEntry*> qDataEntries; // Used for writing the data entries
  queue<CResourceDataEntry*> qDataEntries2; // Used for writing raw resources data
  queue<CResourceDirectoryEntry*> qStrings; // Used for writing resources' names

  qDirs.push(m_cResDir);

  while (!qDirs.empty()) {
    CResourceDirectory* crd = qDirs.front();

    IMAGE_RESOURCE_DIRECTORY rdDir = crd->GetInfo();

    rdDir.NumberOfNamedEntries = ConvertEndianness(rdDir.NumberOfNamedEntries);
    rdDir.NumberOfIdEntries = ConvertEndianness(rdDir.NumberOfIdEntries);

    CopyMemory(seeker, &rdDir, sizeof(IMAGE_RESOURCE_DIRECTORY));
    crd->m_ulWrittenAt = (ULONG_PTR)(seeker);
    seeker += sizeof(IMAGE_RESOURCE_DIRECTORY);

    for (unsigned int i = 0; i < crd->CountEntries(); i++) {
      if (crd->GetEntry(i)->HasName())
        qStrings.push(crd->GetEntry(i));
      if (crd->GetEntry(i)->IsDataDirectory())
        qDirs.push(crd->GetEntry(i)->GetSubDirectory());
      else {
        qDataEntries.push(crd->GetEntry(i)->GetDataEntry());
        qDataEntries2.push(crd->GetEntry(i)->GetDataEntry());
      }

      MY_IMAGE_RESOURCE_DIRECTORY_ENTRY rDirE;
      ZeroMemory(&rDirE, sizeof(rDirE));
      rDirE.UOffset.DirectoryOffset.DataIsDirectory = crd->GetEntry(i)->IsDataDirectory();
      rDirE.UName.Id = crd->GetEntry(i)->HasName() ? 0 : crd->GetEntry(i)->GetId();
      rDirE.UName.Id = ConvertEndianness(rDirE.UName.Id);
      rDirE.UName.NameString.NameIsString = (crd->GetEntry(i)->HasName()) ? 1 : 0;

      CopyMemory(seeker, &rDirE, sizeof(MY_IMAGE_RESOURCE_DIRECTORY_ENTRY));
      crd->GetEntry(i)->m_ulWrittenAt = (ULONG_PTR)(seeker);
      seeker += sizeof(MY_IMAGE_RESOURCE_DIRECTORY_ENTRY);
    }
    qDirs.pop();
  }

  /*
   * Write IMAGE_RESOURCE_DATA_ENTRYs.  
   */
  while (!qDataEntries.empty()) {
    CResourceDataEntry* cRDataE = qDataEntries.front();
    IMAGE_RESOURCE_DATA_ENTRY rDataE = {0,};
    rDataE.CodePage = ConvertEndianness(cRDataE->GetCodePage());
    rDataE.Size = ConvertEndianness(cRDataE->GetSize());

    CopyMemory(seeker, &rDataE, sizeof(IMAGE_RESOURCE_DATA_ENTRY));
    cRDataE->m_ulWrittenAt = (ULONG_PTR)(seeker);
    seeker += sizeof(IMAGE_RESOURCE_DATA_ENTRY);

    qDataEntries.pop();
  }

  /*
   * Write strings
   */
  while (!qStrings.empty()) {
    CResourceDirectoryEntry* cRDirE = qStrings.front();

    size_t resdirstr = (size_t)(seeker - pbRsrcSec);
    assert(RALIGN(resdirstr, 4) == resdirstr); // PE spec says these are ?machine? word aligned
    PMY_IMAGE_RESOURCE_DIRECTORY_ENTRY(cRDirE->m_ulWrittenAt)->UName.NameString.NameOffset = ConvertEndianness((DWORD) resdirstr);

    const WINWCHAR* szName = cRDirE->GetName();
    WORD iLen = (WORD) (WinWStrLen(szName)); // No terminator
    *(WORD*)seeker = ConvertEndianness(iLen);
    CopyMemory(seeker + sizeof(WORD), szName, iLen * sizeof(WINWCHAR));

    seeker += RALIGN(sizeof(WORD) + (iLen * sizeof(WINWCHAR)), 4);

    qStrings.pop();
  }

  /*
   * Write raw resource data and set offsets in IMAGE_RESOURCE_DATA_ENTRYs.
   */
  while (!qDataEntries2.empty()) {
    CResourceDataEntry* cRDataE = qDataEntries2.front();
    CopyMemory(seeker, cRDataE->GetData(), cRDataE->GetSize());
    PIMAGE_RESOURCE_DATA_ENTRY(cRDataE->m_ulWrittenAt)->OffsetToData = ConvertEndianness((DWORD)(seeker - pbRsrcSec) + m_dwResourceSectionVA);

    seeker += RALIGN(cRDataE->GetSize(), 8);

    qDataEntries2.pop();
  }

  /*
   * Set all of the directory entries offsets.
   */
  SetOffsets(m_cResDir, (ULONG_PTR)(pbRsrcSec));
}

// Sets the offsets in directory entries
void CResourceEditor::SetOffsets(CResourceDirectory* resDir, ULONG_PTR newResDirAt) {
  for (unsigned int i = 0; i < resDir->CountEntries(); i++) {
    PMY_IMAGE_RESOURCE_DIRECTORY_ENTRY rde = PMY_IMAGE_RESOURCE_DIRECTORY_ENTRY(resDir->GetEntry(i)->m_ulWrittenAt);
    if (resDir->GetEntry(i)->IsDataDirectory()) {
      rde->UOffset.DirectoryOffset.DataIsDirectory = 1;
      rde->UOffset.DirectoryOffset.OffsetToDirectory = resDir->GetEntry(i)->GetSubDirectory()->m_ulWrittenAt - newResDirAt;
      rde->UOffset.OffsetToData = ConvertEndianness(rde->UOffset.OffsetToData);
      SetOffsets(resDir->GetEntry(i)->GetSubDirectory(), newResDirAt);
    }
    else {
      rde->UOffset.OffsetToData = ConvertEndianness((DWORD)(resDir->GetEntry(i)->GetDataEntry()->m_ulWrittenAt - newResDirAt));
    }
  }
}

// Adjusts a virtual address by a specific amount
DWORD CResourceEditor::AdjustVA(DWORD dwVirtualAddress, DWORD dwAdjustment) {
  dwVirtualAddress = ConvertEndianness(dwVirtualAddress);
  dwVirtualAddress += dwAdjustment;
  dwVirtualAddress = ConvertEndianness(dwVirtualAddress);

  return dwVirtualAddress;
}

// Aligns a virtual address to the section alignment
DWORD CResourceEditor::AlignVA(DWORD dwVirtualAddress) {
  DWORD temp32 = *GetCommonMemberFromPEOptHdr(m_ntHeaders->OptionalHeader, SectionAlignment);
  DWORD dwAlignment = ConvertEndianness(temp32);

  dwVirtualAddress = ConvertEndianness(dwVirtualAddress);
  dwVirtualAddress = RALIGN(dwVirtualAddress, dwAlignment);
  dwVirtualAddress = ConvertEndianness(dwVirtualAddress);

  return dwVirtualAddress;
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// CResourceDirectory
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CResourceDirectory::CResourceDirectory(PIMAGE_RESOURCE_DIRECTORY prd) {
  m_rdDir = *prd;
  m_rdDir.NumberOfIdEntries = 0;
  m_rdDir.NumberOfNamedEntries = 0;
}

CResourceDirectory::~CResourceDirectory() {
  Destroy();
}

//////////////////////////////////////////////////////////////////////
// Methods
//////////////////////////////////////////////////////////////////////

IMAGE_RESOURCE_DIRECTORY CResourceDirectory::GetInfo() {
  return m_rdDir;
}

CResourceDirectoryEntry* CResourceDirectory::GetEntry(unsigned int i) {
  if (m_vEntries.size() < i)
    return 0;
  return m_vEntries[i];
}

// This function inserts a new directory entry
// It also keeps the directory entries sorted
bool CResourceDirectory::AddEntry(CResourceDirectoryEntry* entry) {
  int i = 0;
  if (entry->HasName()) {
    const WINWCHAR* szEntName = entry->GetName();
    for (i = 0; i < m_rdDir.NumberOfNamedEntries; i++) {
      const WINWCHAR* szName = m_vEntries[i]->GetName();
      int cmp = WinWStrCmp(szName, szEntName);
      if (cmp == 0)
        return false;
      if (cmp > 0)
        break;
    }
    m_rdDir.NumberOfNamedEntries++;
  }
  else {
    for (i = m_rdDir.NumberOfNamedEntries; i < m_rdDir.NumberOfNamedEntries+m_rdDir.NumberOfIdEntries; i++) {
      if (m_vEntries[i]->GetId() == entry->GetId()) return false;
      if (m_vEntries[i]->GetId() > entry->GetId()) break;
    }
    m_rdDir.NumberOfIdEntries++;
  }
  m_vEntries.insert(m_vEntries.begin() + i, entry);
  return true;
}

void CResourceDirectory::RemoveEntry(int i) {
  if (m_vEntries[i]->HasName())
    m_rdDir.NumberOfNamedEntries--;
  else
    m_rdDir.NumberOfIdEntries--;
  delete m_vEntries[i];
  m_vEntries.erase(m_vEntries.begin() + i);
}

unsigned int CResourceDirectory::CountEntries() {
  return truncate_cast(unsigned int,m_vEntries.size());
}

// Returns the index of a directory entry with the specified name
// Name can be a string or an id
// Returns -1 if can not be found
int CResourceDirectory::Find(const WINWCHAR* szName) {
  if (IS_INTRESOURCE(szName))
    return Find((WORD) (ULONG_PTR) szName);
  else
    if (szName[0] == L'#')
      return Find(WORD(WinWStrToInt(szName + 1)));

  for (unsigned int i = 0; i < m_vEntries.size(); i++) {
    if (!m_vEntries[i]->HasName())
      continue;

    const WINWCHAR* szEntName = m_vEntries[i]->GetName();
    int cmp = WinWStrCmp(szName, szEntName);
    if (!cmp)
      return i;
  }
  return -1;
}

// Returns the index of a directory entry with the specified id
// Returns -1 if can not be found
int CResourceDirectory::Find(WORD wId) {
  for (unsigned int i = 0; i < m_vEntries.size(); i++) {
    if (m_vEntries[i]->HasName()) continue;
    if (wId == m_vEntries[i]->GetId()) return i;
  }
  return -1;
}

// Get the size of this resource directory (including all of its children)
DWORD CResourceDirectory::GetSize() {
  DWORD dwSize = sizeof(IMAGE_RESOURCE_DIRECTORY);
  for (unsigned int i = 0; i < m_vEntries.size(); i++) {
    dwSize += sizeof(MY_IMAGE_RESOURCE_DIRECTORY_ENTRY);
    if (m_vEntries[i]->HasName())
      dwSize += sizeof(IMAGE_RESOURCE_DIR_STRING_U) + (m_vEntries[i]->GetNameLength()+1)*sizeof(WINWCHAR);
    if (m_vEntries[i]->IsDataDirectory())
      dwSize += m_vEntries[i]->GetSubDirectory()->GetSize();
    else {
      DWORD dwAligned = m_vEntries[i]->GetDataEntry()->GetSize();
      ALIGN(dwAligned, 8);
      dwSize += sizeof(IMAGE_RESOURCE_DATA_ENTRY) + dwAligned;
    }
  }
  return dwSize;
}

// Destroys this directory and all of its children
void CResourceDirectory::Destroy() {
  for (unsigned int i = 0; i < m_vEntries.size(); i++) {
    if (m_vEntries[i]->IsDataDirectory()) {
      m_vEntries[i]->GetSubDirectory()->Destroy();
      delete m_vEntries[i]->GetSubDirectory();
    }
    else
      delete m_vEntries[i]->GetDataEntry();
    delete m_vEntries[i];
  }
  m_vEntries.clear();
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// CResourceDirectoryEntry
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CResourceDirectoryEntry::CResourceDirectoryEntry(const WINWCHAR* szName, CResourceDirectory* rdSubDir) {
  if (IS_INTRESOURCE(szName)) {
    m_bHasName = false;
    m_szName = 0;
    m_wId = (WORD) (ULONG_PTR) szName;
  }
  else {
    m_bHasName = true;
    m_szName = WinWStrDupFromWinWStr(szName);
  }
  m_bIsDataDirectory = true;
  m_rdSubDir = rdSubDir;
}

CResourceDirectoryEntry::CResourceDirectoryEntry(const WINWCHAR* szName, CResourceDataEntry* rdeData) {
  if (IS_INTRESOURCE(szName)) {
    m_bHasName = false;
    m_szName = 0;
    m_wId = (WORD) (ULONG_PTR) szName;
  }
  else {
    m_bHasName = true;
    m_szName = WinWStrDupFromWinWStr(szName);
  }
  m_bIsDataDirectory = false;
  m_rdeData = rdeData;
}

CResourceDirectoryEntry::~CResourceDirectoryEntry() {
  if (m_bHasName)
    free(m_szName);
}

//////////////////////////////////////////////////////////////////////
// Methods
//////////////////////////////////////////////////////////////////////

bool CResourceDirectoryEntry::HasName() const {
  return m_bHasName;
}

// Don't forget to free the memory used by the string after usage!
const WINWCHAR* CResourceDirectoryEntry::GetName() const {
  return m_bHasName ? m_szName : 0;
}

int CResourceDirectoryEntry::GetNameLength() const {
  return (int) WinWStrLen(m_szName);
}

WORD CResourceDirectoryEntry::GetId() const {
  return m_bHasName ? 0 : m_wId;
}

bool CResourceDirectoryEntry::IsDataDirectory() const {
  return m_bIsDataDirectory;
}

CResourceDirectory* CResourceDirectoryEntry::GetSubDirectory() const {
  if (!m_bIsDataDirectory)
    return NULL;
  return m_rdSubDir;
}

CResourceDataEntry* CResourceDirectoryEntry::GetDataEntry() const {
  if (m_bIsDataDirectory)
    return NULL;
  return m_rdeData;
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// CResourceDataEntry
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CResourceDataEntry::CResourceDataEntry(BYTE* pbData, DWORD dwSize, DWORD dwCodePage, DWORD dwOffset) {
  m_pbData = 0;
  SetData(pbData, dwSize, dwCodePage);
  m_dwOffset = dwOffset;
}

CResourceDataEntry::~CResourceDataEntry() {
  if (m_pbData)
    delete [] m_pbData;
}

//////////////////////////////////////////////////////////////////////
// Methods
//////////////////////////////////////////////////////////////////////

// To save memory this function doesn't give you a copy of the data
// Don't mess with the data returned from this function!
BYTE* CResourceDataEntry::GetData() {
  return m_pbData;
}

void CResourceDataEntry::SetData(BYTE* pbData, DWORD dwSize) {
  SetData(pbData, dwSize, m_dwCodePage);
}

void CResourceDataEntry::SetData(BYTE* pbData, DWORD dwSize, DWORD dwCodePage) {
  if (m_pbData) delete [] m_pbData;
  m_pbData = new BYTE[dwSize];
  CopyMemory(m_pbData, pbData, dwSize);
  m_dwSize = dwSize;
  m_dwCodePage = dwCodePage;
  m_dwOffset = DWORD(-1); // unset
}

DWORD CResourceDataEntry::GetSize() {
  return m_dwSize;
}

DWORD CResourceDataEntry::GetCodePage() {
  return m_dwCodePage;
}

DWORD CResourceDataEntry::GetOffset() {
  return m_dwOffset;
}
