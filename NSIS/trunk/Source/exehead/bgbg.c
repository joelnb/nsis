#include <windows.h>
#include "resource.h"
#include "config.h"
#include "fileform.h"
#include "state.h"
#include "ui.h"

#ifdef NSIS_SUPPORT_BGBG

static int m_color1, m_color2, m_textcolor;

static LRESULT CALLBACK BG_WndProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
  switch (uMsg)
  {
    case WM_PAINT:
      {
        static PAINTSTRUCT ps;
        HDC hdc=BeginPaint(hwnd,&ps);
        RECT r;
        int y,ry;
        GetClientRect(hwnd,&r);
        // this portion by Drew Davidson, drewdavidson@mindspring.com
        ry=r.bottom;
        y=0; //r.top

        // JF: made slower, reduced to 4 pixels high, because I like how it looks better/
        while (y < r.bottom)
        {
          int rv,gv,bv;
		      RECT rect;
		      HBRUSH brush;
          rv = (GetRValue(m_color2) * y + GetRValue(m_color1) * ry) / r.bottom;
          gv = (GetGValue(m_color2) * y + GetGValue(m_color1) * ry) / r.bottom;
          bv = (GetBValue(m_color2) * y + GetBValue(m_color1) * ry) / r.bottom;
		      brush = CreateSolidBrush(RGB(rv,gv,bv));
		      SetRect(&rect, 0 /*r.left*/, y, r.right, y+4);
		      // note that we don't need to do "SelectObject(hdc, brush)"
		      // because FillRect lets us specify the brush as a parameter.
		      FillRect(hdc, &rect, brush);
		      DeleteObject(brush);
          ry-=4;
          y+=4;
        }

        if (m_textcolor != -1)
        {
          HFONT newFont, oldFont;
          newFont = CreateFont(40,0,0,0,FW_BOLD,TRUE,FALSE,FALSE,DEFAULT_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"Garamond");
          if (newFont)
          {
            static char buf[256];
            r.left+=16;
            r.top+=8;
            GetWindowText(hwnd,buf,sizeof(buf));
            SetBkMode(hdc,TRANSPARENT);
            SetTextColor(hdc,m_textcolor);
            oldFont = SelectObject(hdc,newFont);
            DrawText(hdc,buf,-1,&r,DT_TOP|DT_LEFT|DT_SINGLELINE|DT_NOPREFIX);
            SelectObject(hdc,oldFont);
            DeleteObject(newFont);
          }
        }
        EndPaint(hwnd,&ps);
      }
    return 0;
  }
  return DefWindowProc(hwnd,uMsg,wParam,lParam);
}


HWND NSISCALL bgWnd_Init()
{
  RECT vp;
  static WNDCLASS wc;
	wc.lpfnWndProc = BG_WndProc;
	wc.hInstance = g_hInstance;
	wc.hIcon = g_hIcon;
	wc.hCursor = LoadCursor(NULL,IDC_ARROW);
	wc.lpszClassName = "_Nb";

  if (!RegisterClass(&wc)) return 0;

  m_color1=g_inst_cmnheader->bg_color1;
  m_color2=g_inst_cmnheader->bg_color2;
  m_textcolor=g_inst_cmnheader->bg_textcolor;

  SystemParametersInfo(SPI_GETWORKAREA, 0, &vp, 0);

  return CreateWindow("_Nb","",WS_OVERLAPPED|WS_THICKFRAME|WS_CAPTION|WS_SYSMENU|WS_MAXIMIZEBOX|WS_MINIMIZEBOX,
    vp.left,vp.top,vp.right-vp.left,vp.bottom-vp.top,GetDesktopWindow(),NULL,g_hInstance,NULL);
}


#endif //NSIS_SUPPORT_BGBG
