// Lang.h by Amir Szekely 3rd August 2002

#ifndef ___NLF___H_____
#define ___NLF___H_____

#include "exehead/fileform.h"
#include <StdExcept>
using namespace std;

struct langstring {
  int name;
  int index;
};

class LangStringList : public SortedStringListND<struct langstring>
{
  public:
    LangStringList()
    {
      index = 0;
    }
    ~LangStringList() { }

    int add(const char *name)
    {
      int pos=SortedStringListND<struct langstring>::add(name);
      if (pos == -1) return -1;

      ((struct langstring*)gr.get())[pos].index = index;

      int temp = index;
      index++;

      return temp;
    }

    int get(char *name)
    {
      int v=SortedStringListND<struct langstring>::find(name);
      if (v==-1) return -1;
      return ((struct langstring*)gr.get())[v].index;
    }

    int getnum()
    {
      return index;
    }

    char *idx2name(int idx)
    {
      struct langstring *data=(struct langstring *)gr.get();
      
      for (int i = 0; i < index; i++)
      {
        if (data[i].index == idx)
        {
          return ((char*)strings.get() + data[i].name);
        }
      }

      return NULL;
    }

  private:
    int index;
};

class NLF;

struct StringTable {
  LANGID lang_id;
  int dlg_offset;
  common_strings common;
  common_strings ucommon;
  installer_strings installer;
  uninstall_strings uninstall;
  TinyGrowBuf user_strings;
  TinyGrowBuf user_ustrings;

  NLF *nlf;
};

#define NLF_VERSION 5

enum {
  NLF_BRANDING,
  NLF_CAPTION,
  NLF_UCAPTION,
  NLF_SUBCAPTION_LICENSE,
  NLF_SUBCAPTION_OPTIONS,
  NLF_SUBCAPTION_DIR,
  NLF_SUBCAPTION_INSTFILES,
  NLF_SUBCAPTION_COMPLETED,
  NLF_USUBCAPTION_CONFIRM,
  NLF_USUBCAPTION_INSTFILES,
  NLF_USUBCAPTION_COMPLETED,
  NLF_BTN_BACK,
  NLF_BTN_NEXT,
  NLF_BTN_LICENSE,
  NLF_BTN_LICENSE_AGREE,
  NLF_BTN_LICENSE_DISAGREE,
  NLF_BTN_INSTALL,
  NLF_BTN_UNINSTALL,
  NLF_BTN_CANCEL,
  NLF_BTN_CLOSE,
  NLF_BTN_BROWSE,
  NLF_BTN_DETAILS,
  NLF_DEF_NAME,
  NLF_COMPLETED,
  NLF_COMP_CUSTOM,
  NLF_COMP_SUBTEXT1,
  NLF_COMP_SUBTEXT1_NO_INST_TYPES,
  NLF_COMP_SUBTEXT2,
  NLF_DIR_SUBTEXT,
  NLF_SPACE_AVAIL,
  NLF_SPACE_REQ,
  NLF_UNINST_SUBTEXT,
  NLF_FILE_ERROR,
  NLF_FILE_ERROR_NOIGNORE,
  NLF_CANT_WRITE,
  NLF_COPY_FAILED,
  NLF_COPY_TO,
  NLF_REGISTERING,
  NLF_UNREGISTERING,
  NLF_SYMBOL_NOT_FOUND,
  NLF_COULD_NOT_LOAD,
  NLF_CREATE_DIR,
  NLF_CREATE_SHORTCUT,
  NLF_CREATED_UNINST,
  NLF_DEL_FILE,
  NLF_DEL_ON_REBOOT,
  NLF_ERR_CREATING_SHORTCUT,
  NLF_ERR_CREATING,
  NLF_ERR_DECOMPRESSING,
  NLF_ERR_REG_DLL,
  NLF_EXEC_SHELL,
  NLF_EXEC,
  NLF_EXTRACT,
  NLF_ERR_WRITING,
  NLF_INST_CORRUPTED,
  NLF_NO_OLE,
  NLF_OUTPUT_DIR,
  NLF_REMOVE_DIR,
  NLF_RENAME_ON_REBOOT,
  NLF_RENAME,
  NLF_SKIPPED,
  NLF_COPY_DETAILS,
  NLF_LOG_INSTALL_PROCESS,
  NLF_BYTE,
  NLF_KILO,
  NLF_MEGA,
  NLF_GIGA,

  NLF_STRINGS,

  SLANG_NAME,
  SLANG_COMP_TEXT,
  SLANG_LICENSE_TEXT,
  SLANG_LICENSE_DATA,
  SLANG_DIR_TEXT,
  SLANG_UNINST_TEXT
};

extern char *english_strings[NLF_STRINGS];

// NSIS Language File parser
class NLF {
  public:
    NLF(char *filename);
    ~NLF();

    char         *GetString(int idx);

    char         *m_szName;

    LANGID        m_wLangId;
    char         *m_szFont;
    int           m_iFontSize;
    unsigned int  m_uCodePage;
  
  private:
    char         *m_szStrings[NLF_STRINGS];
};

#endif
