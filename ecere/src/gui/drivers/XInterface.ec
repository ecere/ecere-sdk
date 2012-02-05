namespace gui::drivers;

import "instance"
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
import "OpenGLDisplayDriver"
#endif

#if (defined(__unix__) || defined(__APPLE__)) && !defined(ECERE_MINIGLX)

default:
#define uint _uint
#define property _property
#define new _new
#define class _class

#ifdef __linux__
#include <linux/joystick.h>
#endif
#include <sys/param.h>
#ifdef BSD
#include <stdlib.h>
#else
#include <malloc.h>
#endif
#include <unistd.h>

//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>

#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode
#define Picture   X11Picture

#include <X11/Xatom.h>
#include <X11/Xlib.h>
#include <X11/Xresource.h>
#include <X11/Xutil.h>
#include <X11/XKBlib.h>
#include <X11/keysym.h>
#include <sys/fcntl.h>
#include <GL/glx.h>
#include <X11/extensions/Xrender.h>
#include <X11/extensions/XShm.h>

#undef Picture
#undef Window
#undef Cursor
#undef Font
#undef Display
#undef Time
#undef KeyCode
#undef uint

#undef new
#undef property
#undef class
private:

import "Interface"
import "XDisplayDriver"

// These are the events we care about
#define EVENT_MASK StructureNotifyMask | \
      ButtonPressMask | ButtonReleaseMask | PointerMotionMask | \
      KeyPressMask | KeyReleaseMask | ExposureMask | FocusChangeMask

void * xGlobalDisplay;
static XIM im;
// static XIC ic;
static XContext windowContext;
static Window lastActive;

static char * clipBoardData;

static Thread /* xThread, */ timerThread;
static bool xTerminate;
static Semaphore xSemaphore { };
static Mutex xMutex { };
static bool fullScreenMode;
static int desktopX = 0, desktopY = 0, desktopW = 0, desktopH = 0;
int confineWindow;
static int nullCursor;
static X11Window capturedWindow = None;
static Window restrictedWindow = null;
static bool gotAnXEvent = false;
static XEvent xEvent;
static int joystickFD[4];
static X11Window activeWindow;

static enum AtomIdents {clipboard, multiple, targets, utf8_string, wm_delete_window, wm_hints, wm_name, wm_protocols, wm_state, wm_take_focus, wm_transient_for, _motif_wm_hints, _net_active_window, _net_current_desktop, _net_number_of_desktops, _net_wm_icon, _net_wm_name, _net_wm_pid, _net_wm_state, _net_wm_state_demands_attention, _net_wm_state_hidden, _net_wm_user_time, _net_wm_window_type, _net_wm_window_type_desktop, _net_wm_window_type_dialog, _net_wm_window_type_dock, _net_wm_window_type_dropdown_menu, _net_wm_window_type_menu, _net_wm_window_type_normal, _net_wm_window_type_popup_menu, _net_wm_window_type_splash, _net_wm_window_type_toolbar, _net_wm_window_type_utility, _net_workarea, app_selection };

static Atom atoms[AtomIdents];

static const char *atomNames[AtomIdents] = {
   "CLIPBOARD", //clipboard
   "MULTIPLE", //multiple
   "TARGETS", //targets
   "UTF8_STRING", //utf8_string
   "WM_DELETE_WINDOW", //wm_delete_window
   "WM_HINTS", //wm_hints
   "WM_NAME", //wm_name
   "WM_PROTOCOLS", //wm_protocols
   "WM_STATE", //wm_state
   "WM_TAKE_FOCUS", //wm_take_focus
   "WM_TRANSIENT_FOR", //wm_transient_for
   "_MOTIF_WM_HINTS", //_motif_wm_hints
   "_NET_ACTIVE_WINDOW", //_net_active_window
   "_NET_CURRENT_DESKTOP", //_net_current_desktop
   "_NET_NUMBER_OF_DESKTOPS", //_net_number_of_desktops
   "_NET_WM_ICON", //_net_wm_icon
   "_NET_WM_NAME", //_net_wm_name
   "_NET_WM_PID", //_net_wm_pid
   "_NET_WM_STATE", //_net_wm_state
   "_NET_WM_STATE_DEMANDS_ATTENTION", //_net_wm_state_demands_attention
   "_NET_WM_STATE_HIDDEN", //_net_wm_state_hidden
   "_NET_WM_USER_TIME", //_net_wm_user_time
   "_NET_WM_WINDOW_TYPE", //_net_wm_window_type
   "_NET_WM_WINDOW_TYPE_DESKTOP", //_net_wm_window_type_desktop
   "_NET_WM_WINDOW_TYPE_DIALOG", //_net_wm_window_type_dialog
   "_NET_WM_WINDOW_TYPE_DOCK", //_net_wm_window_type_dock
   "_NET_WM_WINDOW_TYPE_DROPDOWN_MENU", //_net_wm_window_type_dropdown_menu
   "_NET_WM_WINDOW_TYPE_MENU", //_net_wm_window_type_menu
   "_NET_WM_WINDOW_TYPE_NORMAL", //_net_wm_window_type_normal
   "_NET_WM_WINDOW_TYPE_POPUP_MENU", //_net_wm_window_type_popup_menu
   "_NET_WM_WINDOW_TYPE_SPLASH", //_net_wm_window_type_splash
   "_NET_WM_WINDOW_TYPE_TOOLBAR", //_net_wm_window_type_toolbar
   "_NET_WM_WINDOW_TYPE_UTILITY", //_net_wm_window_type_utility
   "_NET_WORKAREA",  //_net_workarea
   "APP_SELECTION"
};

static bool autoRepeatDetectable;
static bool setICPosition;
int xSystemDepth;
PixelFormat xSystemPixelFormat;
Visual * xSystemVisual;
bool xSharedMemory;

static Time timeStamp;

class XWindowData : struct
{
public:
   XVisualInfo * visual;
   XIC ic;
   bool laterFocus;
};

static Visual * FindFullColorVisual(X11Display *dpy, int * depth)
{
   XVisualInfo vinfo;
   XVisualInfo *vinfo_ret;
   int numitems;
  
   vinfo._class = TrueColor;
   vinfo_ret = XGetVisualInfo(dpy, VisualClassMask, &vinfo, &numitems);
   if(numitems)
   {
      int maxdepth = 0;
      while(numitems > 0)
      {
         if(vinfo_ret[numitems-1].depth > maxdepth)
            maxdepth = vinfo_ret[numitems-1].depth;
         numitems--;
      }
      XFree((void *) vinfo_ret);
      if(maxdepth >= 16)
      {
         if(XMatchVisualInfo(dpy, DefaultScreen(dpy), maxdepth, TrueColor, &vinfo))
         {
            *depth = maxdepth;
            return vinfo.visual;
         }
      }
   } 
   return null;
}
/*
_NET_WM_STATE_MODAL, ATOM
_NET_WM_STATE_STICKY, ATOM
_NET_WM_STATE_MAXIMIZED_VERT, ATOM
_NET_WM_STATE_MAXIMIZED_HORZ, ATOM
_NET_WM_STATE_SHADED, ATOM
_NET_WM_STATE_SKIP_TASKBAR, ATOM
_NET_WM_STATE_SKIP_PAGER, ATOM
_NET_WM_STATE_HIDDEN, ATOM
_NET_WM_STATE_FULLSCREEN, ATOM
_NET_WM_STATE_ABOVE, ATOM
_NET_WM_STATE_BELOW, ATOM
_NET_WM_STATE_DEMANDS_ATTENTION, ATOM
*/


static void RepositionDesktop(bool updateChildren)
{
   int x = 0, y = 0;
   int w, h;
   Screen * x_screen = XDefaultScreenOfDisplay(xGlobalDisplay);
   X11Window x_root;
   int current = 0;   
   char *data = null;
   int format, len, fill;
   Atom type;

   w = XDisplayWidth(xGlobalDisplay, DefaultScreen(xGlobalDisplay));
   h = XDisplayHeight(xGlobalDisplay, DefaultScreen(xGlobalDisplay));
   x_root = XRootWindowOfScreen(x_screen);
   
   if(atoms[_net_number_of_desktops] != None)
   {
      if(XGetWindowProperty(xGlobalDisplay, x_root, atoms[_net_number_of_desktops], 0, 1, False,
                            XA_CARDINAL, &type, &format, &len, &fill,
                            &data) != Success)
      {
         printf("cant get xa desktops property\n");
      }
      
      if(data)
      {
         int desktops = 0;
         desktops = *(int *)data;

         //printf("_NET_NUMBER_OF_DESKTOPS is %d\n", desktops);

         XFree(data);
         data = null;
      }
   }
   
   if(atoms[_net_current_desktop] != None)
   {   
      if(XGetWindowProperty(xGlobalDisplay, x_root, atoms[_net_current_desktop], 0, 1, False,
                            XA_CARDINAL, &type, &format, &len, &fill,
                            &data) != Success)
      {
         printf("cant get xa current property\n");
      }
      
      if(data)
      {
         current = *(int *)data;
         XFree(data);
         data = null;

         //printf("_NET_CURRENT_DESKTOP is %d\n", current);
      }
   }   
   if(atoms[_net_workarea] != None)
   {
      int *workareas;

      if(XGetWindowProperty(xGlobalDisplay, x_root, atoms[_net_workarea], 0, (4 * 32),
                            False, AnyPropertyType, &type, &format, &len,
                            &fill, &data) != Success)
      {
         //printf("warning\n");
      }
      
      /*
      if(type == None || format == 0)
         printf("warning\n");

      if(fill)
         printf("warning\n");
      
      if(len % 4)
         printf("warning\n");
      */
  
      if(data)
      {
         workareas = (int *)data;
     
         x = workareas[current * 4];
         y = workareas[current * 4 + 1];
         w = workareas[current * 4 + 2];
         h = workareas[current * 4 + 3];   

         //printf("_NET_WORKAREA is x = %d, y = %d, w = %d, h = %d\n", x, y, w, h);
      }
      //   printf("Work Area width: %d, height %d\n", w, h);
   }
   
   if(desktopX != x || desktopY != y || desktopW != w || desktopH != h)
   {
      guiApp.SetDesktopPosition(x, y, w, h, updateChildren);
      desktopX = x;
      desktopY = y;
      desktopW = w;
      desktopH = h;
   }
}

/****************************************************************************
   /// PRIVATE UTILITY FUNCTIONS /////////////
****************************************************************************/
// --- Keyboard Input ---
#define KEYCODE_HOME    0x59
#define KEYCODE_UP      0x5A
#define KEYCODE_PGUP    0x5B
#define KEYCODE_LEFT    0x5C
#define KEYCODE_RIGHT   0x5E
#define KEYCODE_END     0x5F
#define KEYCODE_DOWN    0x60
#define KEYCODE_PGDWN   0x61
#define KEYCODE_INS     0x62
#define KEYCODE_DEL     0x63
#define KEYCODE_SLASH   0x68

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;
private:

static bool ProcessKeyMessage(Window window, uint keyCode, int release, XKeyEvent * event)
{
   bool result = true;
   Key code;
   unichar ch = 0;
   KeySym keysym = NoSymbol;
   Status status;
   int buflength = 0;
   static int bufsize = 16;
   static char *buf = NULL;
   XWindowData windowData = window.windowData;
   Key key = 0;

   if(window.destroyed) return;

   // Logf("Got 0x%x (%d)\n", keyCode, key);

   // Translate the key code
   /*
   key = key - 8;
   //Logf("Got 0x%x (%d)\n", key, key);
   
   switch(key)
   {
      case KEYCODE_HOME: key = home; break;
      case KEYCODE_UP: key = up; break;
      case KEYCODE_PGUP: key = pageUp; break;
      case KEYCODE_LEFT: key = left; break;
      case KEYCODE_RIGHT: key = right; break;
      case KEYCODE_END: key = end; break;
      case KEYCODE_DOWN: key = down; break;
      case KEYCODE_PGDWN: key = pageDown; break;
      case KEYCODE_INS: key = insert; break;
      case KEYCODE_DEL: key = del; break;
      case KEYCODE_SLASH: key = keyPadSlash; break;
   }
  
   ch = (byte)Interface::TranslateKey(key, event->state & ShiftMask);
   */
/*
   if(release)
      Logf("Key up:   %3d (%2x)\n", key, key);
   else
      Logf("Key down: %3d (%2x)\n", key, key);
*/

   if(!buf)
      buf = malloc(bufsize);
   if(windowData && windowData.ic)
   { 
      buflength = XmbLookupString(windowData.ic, event, buf, bufsize, &keysym, &status);
      if (status == XBufferOverflow)
      {
         buf = realloc(buf, (bufsize = buflength));
         buflength = XmbLookupString(windowData.ic, event, buf, bufsize, &keysym, &status);
      }
      if(status != XLookupKeySym && status != XLookupBoth && release == 1)
         keysym = XLookupKeysym(event, 0);
   }
   else
   {
      keysym = XLookupKeysym(event, 0);
   }

   // printf("Got keysym %d (%x)\n", keysym, keysym);
   if(keysym != NoSymbol) //status == XLookupKeySym || status == XLookupBoth)
   {
      switch(keysym)
      {
         case XK_BackSpace:   key = backSpace; break;
         case XK_ISO_Left_Tab: key = tab; break;
         case XK_Tab:         key = tab; break;
         // case XK_Linefeed:
         // case XK_Clear:
         case XK_Return:      key = enter; break;
         case XK_Pause:       key = pauseBreak; break;
         case XK_Scroll_Lock: key = scrollLock; break;
         case XK_Sys_Req:     key = printScreen; break;
         case XK_Escape:      key = escape; break;
         case XK_Delete:      key = del; break;

         case XK_Home:        key = home; break;
         case XK_Left:        key = left; break;
         case XK_Up:          key = up; break;
         case XK_Right:       key = right; break;
         case XK_Down:        key = down; break;
         // case XK_Prior:
         case XK_Page_Up:     key = pageUp; break;
         // case XK_Next:
         case XK_Page_Down:   key = pageDown; break;
         case XK_End:         key = end; break;
         // case XK_Begin:

         // case XK_Select:
         // case XK_Print: 
         // case XK_Execute:
         case XK_Insert:      key = insert; break;
         // case XK_Undo:
         // case XK_Redo:
         // case XK_Menu:
         // case XK_Find:
         // case XK_Cancel:
#ifdef __APPLE__
         case XK_Help:     key = insert; break;
#endif
         // case XK_Break:
#ifdef __APPLE__
         case XK_Mode_switch: key = leftAlt; break;
#endif
         // case XK_script_switch:
         case XK_Num_Lock:    key = numLock; break;

         // case XK_KP_Space: 
         // case XK_KP_Tab:
         case XK_KP_Enter:    key = keyPadEnter; break;
         // case XK_KP_F1:
         // case XK_KP_F2:
         // case XK_KP_F3:
         // case XK_KP_F4:
         case XK_KP_Home:     key = keyPadHome; break;
         case XK_KP_Left:     key = keyPadLeft; break;
         case XK_KP_Up:       key = keyPadUp; break;
         case XK_KP_Right:    key = keyPadRight; break;
         case XK_KP_Down:     key = keyPadDown; break;
         // case XK_KP_Prior:
         case XK_KP_Page_Up:  key = keyPadPageUp; break;
         // case XK_KP_Next:
         case XK_KP_Page_Down:key = keyPadPageDown; break;
         case XK_KP_End:      key = keyPadEnd; break;
         // case XK_KP_Begin:
         case XK_KP_Insert:   key = keyPadInsert; break;
         case XK_KP_Delete:   key = keyPadDelete; break;
         // case XK_KP_Equal:
         case XK_KP_Multiply: key = keyPadStar; break;
         case XK_KP_Add:      key = keyPadPlus; break;
         case XK_KP_Separator:key = keyPadDelete; break;
         case XK_KP_Subtract: key = keyPadMinus; break;
         // case XK_KP_Decimal: 
         case XK_KP_Divide:   key = keyPadSlash; break;

         case XK_KP_0:  key = keyPad0; break;
         case XK_KP_1:  key = keyPad1; break;
         case XK_KP_2:  key = keyPad2; break;
         case XK_KP_3:  key = keyPad3; break;
         case XK_KP_4:  key = keyPad4; break;
         case XK_KP_5:  key = keyPad5; break;
         case XK_KP_6:  key = keyPad6; break;
         case XK_KP_7:  key = keyPad7; break;
         case XK_KP_8:  key = keyPad8; break;
         case XK_KP_9:  key = keyPad9; break;

         case XK_F1: key = f1; break;
         case XK_F2: key = f2; break;
         case XK_F3: key = f3; break;
         case XK_F4: key = f4; break;
         case XK_F5: key = f5; break;
         case XK_F6: key = f6; break;
         case XK_F7: key = f7; break;
         case XK_F8: key = f8; break;
         case XK_F9: key = f9; break;
         case XK_F10: key = f10; break;
         case XK_F11: key = f11; break;
         //case XK_L1:
         case XK_F12: key = f12; break;
         /*
         case XK_L2:
         case XK_F13:
         case XK_L3:
         case XK_F14:
         case XK_L4:
         case XK_F15:
         case XK_L5:
         case XK_F16:
         case XK_L6:
         case XK_F17:
         case XK_L7:
         case XK_F18:
         case XK_L8:
         case XK_F19:
         case XK_L9:
         case XK_F20:
         case XK_L10:
         case XK_F21:
         case XK_R1:
         case XK_F22:
         case XK_R2:
         case XK_F23:
         case XK_R3:
         case XK_F24:
         case XK_R4:
         case XK_F25:
         case XK_R5:
         case XK_F26:
         case XK_R6:
         case XK_F27:
         case XK_R7:
         case XK_F28:
         case XK_R8:
         case XK_F29:
         case XK_R9:
         case XK_F30:
         case XK_R10:
         case XK_F31:
         case XK_R11:
         case XK_F32:
         case XK_R12:
         case XK_F33:
         case XK_R13:
         case XK_F34:
         case XK_R14:
         case XK_F35:
         case XK_R15:
         */
         case XK_Shift_L: key = leftShift; break;
         case XK_Shift_R: key = rightShift; break;
         case XK_Control_L: key = leftControl; break;
         case XK_Control_R: key = rightControl; break;
         case XK_Caps_Lock: key = capsLock; break;
         // case XK_Shift_Lock: 
         // case XK_Meta_L:
         // case XK_Meta_R:
         case XK_Alt_L: key = leftAlt; break;
         case XK_Alt_R: key = rightAlt; break;
         // case XK_Super_L:
         // case XK_Super_R:
         // case XK_Hyper_L:
         // case XK_Hyper_R:

         case XK_space: key = space; break;
         case XK_exclam: key = bang; break;
         case XK_quotedbl: key = doubleQuote; break;
         case XK_numbersign: key = pound; break;
         case XK_dollar: key = dollar; break;
         case XK_percent: key = percent; break;
         case XK_ampersand: key = ampersand; break;
         case XK_apostrophe: key = quote; break;
         // case XK_quoteright: key = quote; break;
         case XK_parenleft: key = leftParanthesis; break;
         case XK_parenright: key = rightParanthesis; break;
         case XK_asterisk: key = star; break;
         case XK_plus: key = plus; break;
         case XK_comma: key = comma; break;
         case XK_minus: key = minus; break;
         case XK_period: key = period; break;
         case XK_slash: key = slash; break;
         case XK_0: key = k0; break;
         case XK_1: key = k1; break;
         case XK_2: key = k2; break;
         case XK_3: key = k3; break;
         case XK_4: key = k4; break;
         case XK_5: key = k5; break;
         case XK_6: key = k6; break;
         case XK_7: key = k7; break;
         case XK_8: key = k8; break;
         case XK_9: key = k9; break;
         case XK_colon: key = colon; break;
         case XK_semicolon: key = semicolon; break;
         case XK_less: key = smallerThan; break;
         case XK_equal: key = equal; break;
         case XK_greater: key = greaterThan; break;
         case XK_question: key = questionMark; break;
         case XK_at: key = ampersand; break;
         case XK_A: key = a; break;
         case XK_B: key = b; break;
         case XK_C: key = c; break;
         case XK_D: key = d; break;
         case XK_E: key = e; break;
         case XK_F: key = f; break;
         case XK_G: key = g; break;
         case XK_H: key = h; break;
         case XK_I: key = i; break;
         case XK_J: key = j; break;
         case XK_K: key = k; break;
         case XK_L: key = l; break;
         case XK_M: key = m; break;
         case XK_N: key = n; break;
         case XK_O: key = o; break;
         case XK_P: key = p; break;
         case XK_Q: key = q; break;
         case XK_R: key = r; break;
         case XK_S: key = s; break;
         case XK_T: key = t; break;
         case XK_U: key = u; break;
         case XK_V: key = v; break;
         case XK_W: key = w; break;
         case XK_X: key = x; break;
         case XK_Y: key = y; break;
         case XK_Z: key = z; break;
         case XK_bracketleft: key = leftBracket; break;
         case XK_backslash: key = backSlash; break;
         case XK_bracketright: key = rightBracket; break;
         case XK_asciicircum: key = circumflex; break;
         case XK_underscore: key = underscore; break;
         // case XK_grave: key = backQuote; break;
         case XK_quoteleft: key = backQuote; break;
         case XK_a: key = a; break;
         case XK_b: key = b; break;
         case XK_c: key = c; break;
         case XK_d: key = d; break;
         case XK_e: key = e; break;
         case XK_f: key = f; break;
         case XK_g: key = g; break;
         case XK_h: key = h; break;
         case XK_i: key = i; break;
         case XK_j: key = j; break;
         case XK_k: key = k; break;
         case XK_l: key = l; break;
         case XK_m: key = m; break;
         case XK_n: key = n; break;
         case XK_o: key = o; break;
         case XK_p: key = p; break;
         case XK_q: key = q; break;
         case XK_r: key = r; break;
         case XK_s: key = s; break;
         case XK_t: key = t; break;
         case XK_u: key = u; break;
         case XK_v: key = v; break;
         case XK_w: key = w; break;
         case XK_x: key = x; break;
         case XK_y: key = y; break;
         case XK_z: key = z; break;
         case XK_braceleft: key = leftBracket; break;
         case XK_bar: key = pipe; break;
         case XK_braceright: key = rightBracket; break;
         case XK_asciitilde: key = tilde; break;
      }
   }
   if(!windowData.ic)
   {
      ch = (byte)Interface::TranslateKey(key, event->state & ShiftMask);
      if(ch == 128) ch = 0;
   }
   code = key;
   if(keysym == XK_ISO_Left_Tab)
      code.shift = true;
   if(key != leftShift && key != rightShift && event->state & ShiftMask)
      code.shift = true;
   if(key != leftControl && key != rightControl && event->state & ControlMask)
      code.ctrl = true;
   if(key != leftAlt && key != rightAlt && event->state & Mod1Mask)
      code.alt = true;

#ifdef __APPLE__
   if(key != leftAlt && key != rightAlt && event->state & (1<<13))
   {
      code.alt = true;
      /*buflength = 0;
      ch = 0;*/
   } 
#endif

   // Logf("Key Message: %s, keysym: 0x%x, key: %d state: %d, ch: %c\n", release ? ((release == 2) ? "REPEAT" : "KeyRelease") : "KeyPress", keysym, key, event->state, (byte)ch);

   incref window;
   if(release == 1)
   {
      int numBytes;
      if(windowData && windowData.ic) ch = buflength ? UTF8GetChar(buf, &numBytes) : 0;
      // printf("Release! %d %d %d\n", keysym, code, ch);
      result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, code, ch);
   }
   else
   {
      int c;
      if(release == 0)
      {
         if(windowData.ic && buflength)
         {
            for(c = 0; c<buflength;)
            {
               int numBytes;
               ch = UTF8GetChar(buf + c, &numBytes);
               if(!numBytes) c = buflength;
               result = window.KeyMessage((c == 0) ? 
                  __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown : __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit,
                  (c == 0) ? code : 0, ch);
               c += numBytes;
            }
         }
         else
            result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, code, ch);
      }
      else if(key<128)
      {
         if(buflength && windowData.ic)
            for(c = 0; c<buflength;)
            {
               int numBytes;
               ch = UTF8GetChar(buf + c, &numBytes);
               if(!numBytes) c = buflength;
               result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, code, ch);
               c += numBytes;
            }
         else
            result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, code, ch);
      } 
   }
   delete window;
            
   return result;
}
/*
static uint E_CALL XEventThread(void * data)
{
   for(;;)
   {
      XEvent e;
      xSemaphore.Wait();
      if(xTerminate) break;
      if(!gotAnXEvent)
      {
         XPeekEvent(xGlobalDisplay, &e);
         gotAnXEvent = true;
         guiApp.SignalEvent();
      }
   }
   return 0;
}
*/

static Bool EventChecker(void *display, XEvent *event, char * data)
{
   return (!data || (event->type == (int) data)) && event->type != NoExpose && event->type != GraphicsExpose;
}

static Bool ConfigureNotifyChecker(void *display, XConfigureEvent *event, char * data)
{
   return (!data || ((event->window == (int) data)) && event->type == ConfigureNotify;
}

static uint timerDelay = MAXINT;
#define RESOLUTION   (18.2 * 100)
static uint XTimerThread(Thread thread)
{
   int s = ConnectionNumber(xGlobalDisplay);
   /*
   Time lastTime, thisTime;
   lastTime = GetTime();
   */
   for(;;)
   {
      int result;
      bool waitSemaphore = false;
      fd_set readSet, writeSet, exceptSet;
      struct timeval tv = { (timerDelay == MAXINT) ? 0 : (timerDelay / 1000000), (timerDelay == MAXINT) ? (int)(1000000 / 18.2) : (timerDelay % 1000000) };
      
      if(xTerminate) break;
      FD_ZERO(&readSet);
      FD_ZERO(&writeSet);
      FD_ZERO(&exceptSet);
      FD_SET(s, &readSet);
      FD_SET(s, &exceptSet);
      xMutex.Wait();
      if(select(s + 1, &readSet, null, null, &tv))
      {
         if(FD_ISSET(s, &readSet))
            gotAnXEvent = true;
      }
      xMutex.Release();
      guiApp.SignalEvent();  
      xSemaphore.Wait();

#if 0
      XEvent e;
      Sleep(1.0 / RESOLUTION);
      thisTime = GetTime();
      if(xTerminate) break;
      if(thisTime - lastTime > (1.0 / 18.2))
      {
         guiApp.SignalEvent();
         lastTime = thisTime;
      }
      else
      {
         xMutex.Wait();
         if(!gotAnXEvent)
         {
            XLockDisplay(xGlobalDisplay);
            if(XCheckIfEvent(xGlobalDisplay, &xEvent, EventChecker, null))
            {
               gotAnXEvent = true;
               guiApp.SignalEvent();
            }
            XUnlockDisplay(xGlobalDisplay);
         }
         xMutex.Release();
      }
#endif
   }
   return 0;
}

static int MyXErrorHandler(X11Display * display, XErrorEvent * event)
{
   char buffer[1024];
   if(xGlobalDisplay)
      XGetErrorText(xGlobalDisplay, event->error_code, buffer, sizeof(buffer));
   Logf("X Error: %s\n", buffer);
   return 0;
}

static int MyXIOErrorHandler(X11Display * display)
{
   Log("X IO Error\n");
   return 0;
}

// Motif Hints (to get rid of the decorations)
#define MWM_HINTS_FUNCTIONS   (1L << 0)
#define MWM_HINTS_DECORATIONS (1L << 1)
#define MWM_HINTS_INPUT_MODE  (1L << 2)
#define MWM_HINTS_STATUS      (1L << 3)

#define MWM_DECOR_ALL         (1L << 0)
#define MWM_DECOR_BORDER      (1L << 1)
#define MWM_DECOR_RESIZEH     (1L << 2)
#define MWM_DECOR_TITLE       (1L << 3)
#define MWM_DECOR_MENU        (1L << 4)
#define MWM_DECOR_MINIMIZE    (1L << 5)
#define MWM_DECOR_MAXIMIZE    (1L << 6)

#define MWM_FUNC_ALL (1L << 0)
#define MWM_FUNC_RESIZE (1L << 1)
#define MWM_FUNC_MOVE (1L << 2)
#define MWM_FUNC_MINIMIZE (1L << 3)
#define MWM_FUNC_MAXIMIZE (1L << 4)
#define MWM_FUNC_CLOSE (1L << 5)

struct MWM_Hints
{
  uint flags;
  uint functions;
  uint decorations;
  int inputMode;
  uint status;
};

static void WaitForViewableWindow(Window window)
{
   //int attempts = 0;
   //Logf("Wait for viewable %s\n", window.name);
   XFlush(xGlobalDisplay);
   //while(attempts++ < 40) 
   while(true)
   {
      XWindowAttributes attributes = { 0 };
      int result;
      if(!XGetWindowAttributes(xGlobalDisplay, (int)window.windowHandle, &attributes))
         break;
      if(attributes.map_state == IsViewable)
         break;
      else
         Sleep(1.0 / RESOLUTION);
   }
}

/****************************************************************************
   /// DRIVER IMPLEMENTATION /////////////
****************************************************************************/

/*static */class HiResTimer : Thread
{
   bool terminate;
   uint delay;
   
   void Stop()
   {
      if(started)
      {
         terminate = true;
         Wait();
      }
   }
   
   uint Main()
   {
      while(!terminate)
      {
         //usleep(delay);
         // Sleep(delay / 1000000.0);
         struct timeval tv = { delay / 1000000, delay % 1000000 };
         select(0,null,null,null, &tv);
         guiApp.SignalEvent();
      }
      return 0;
   }
};

static HiResTimer hiResTimer { };

default:

#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/signal.h>
#include <locale.h>


private:

#ifndef SHM_STAT
#define SHM_STAT  13
#define SHM_INFO  14
#endif

static int terminatePid;

static void SigIntHandler(int value)
{
   // printf("SigHandler %d\n", getpid());
   if(!terminatePid || terminatePid == getpid())
   {
      terminateX++;
      terminatePid = getpid();
      // printf("terminateX now equals %d\n", terminateX);
      if(guiApp && guiApp.semaphore)
         guiApp.semaphore.Release();
   }
   /*
   struct shmid_ds info;
	int maxid = shmctl (0, SHM_INFO, &info);
   int pid = getpgrp();
   int thisPid = getpid();
   //if(thisPid == pid)
   /*
   {
      if(maxid >= 0)
      {
         int id;
	      for(id = 0; id <= maxid; id++)
         {
	         struct shmid_ds shmseg;
            int shmid;
		      if((shmid = shmctl(id, SHM_STAT, &shmseg)) >= 0)
            {
               if(shmseg.shm_cpid == pid || shmseg.shm_cpid == thisPid)
               {
                  printf("%d (%d) belongs to us (%d)\n", shmid, id, shmseg.shm_cpid);
                  shmctl(shmid, IPC_RMID, 0);
               }
            }
         }
      }
      exit(0);
   }
   */
   /*else if(guiApp.desktop)
      guiApp.desktop.Destroy(0);*/
}

class XInterface : Interface
{
   class_property(name) = "X";

   // --- User Interface System ---
   bool Initialize()
   {
      setlocale(LC_ALL, "en_US.UTF-8");
      XInitThreads();
      XSupportsLocale();
      XSetLocaleModifiers("");
      XSetErrorHandler(MyXErrorHandler);
      XSetIOErrorHandler(MyXIOErrorHandler);
#ifndef __APPLE__
      signal(SIGINT, SigIntHandler);
#endif
      xTerminate = false;
      xGlobalDisplay = XOpenDisplay(null);

   	joystickFD[0] = open("/dev/js0", O_RDONLY);
      joystickFD[1] = open("/dev/js1", O_RDONLY);
      joystickFD[2] = open("/dev/js2", O_RDONLY);
      joystickFD[3] = open("/dev/js3", O_RDONLY);
    
      if(xGlobalDisplay)
      {
         XWindowAttributes attributes = { 0 };
         XGetWindowAttributes(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), &attributes);
         xSystemDepth = attributes.depth;
         xSystemVisual = attributes.visual;
         switch(xSystemDepth)
         {
            case 32: case 24: xSystemPixelFormat = pixelFormat888; break;
            case 16:
            case 15:
            {
               XVisualInfo vinfo;
               XVisualInfo *vinfo_ret;
               int numitems;
              
               vinfo.visualid = XVisualIDFromVisual(xSystemVisual);
               vinfo_ret = XGetVisualInfo(xGlobalDisplay, VisualIDMask, &vinfo, &numitems);
               if(numitems)
               {
                  xSystemPixelFormat = (vinfo_ret->green_mask == 0x3E0) ? pixelFormat555 : pixelFormat565;
                  /*
                  if(GetXRenderFormat(xSystemPixelFormat, 0))
                  {
                     // printf("Got X Render format %d\n", xSystemPixelFormat);
                     break;
                  }
                  else
                     printf("No X Format?\n");
                  xSystemPixelFormat = (xSystemPixelFormat == pixelFormat555) ? pixelFormat565 : pixelFormat555;
                  vinfo = *vinfo_ret;
                  // vinfo._class = DirectColor;
                  vinfo.visualid = 0;
                  vinfo.bits_per_rgb = 5;
                  vinfo.depth = xSystemDepth;
                  vinfo.green_mask = (xSystemPixelFormat == pixelFormat555) ? 0x3E0 : 0x7E0;
                  vinfo.red_mask   = (xSystemPixelFormat == pixelFormat555) ? 0x7C00 : 0xF800;
                  XFree((void *) vinfo_ret);
                  if(XMatchVisualInfo(xGlobalDisplay, DefaultScreen(xGlobalDisplay), vinfo.depth, vinfo._class, &vinfo))
                  //vinfo_ret = XGetVisualInfo(xGlobalDisplay, VisualDepthMask|VisualRedMaskMask|VisualGreenMaskMask|VisualBlueMaskMask, &vinfo, &numitems);
                  //if(vinfo_ret)
                  {
                     //vinfo = *vinfo_ret;
                     if(GetXRenderFormat(xSystemPixelFormat, 0))
                     {
                        // printf("Got X Render format %d (second try)\n", xSystemPixelFormat);
                        // printf("red mask: %x, green mask: %x, blue mask: %x\n", vinfo.red_mask,vinfo.green_mask, vinfo.blue_mask);
                     }
                     xSystemVisual = vinfo.visual;
                  }
                  else
                     printf("Could not get a 555 visual\n");
                  */
               } 
               break;
            }
         }
         // printf("Got a depth of %d\n", xSystemDepth);

         {  
            int major, minor, pixmaps;
            xSharedMemory = XShmQueryExtension(xGlobalDisplay) && XShmQueryVersion(xGlobalDisplay, &major, &minor, &pixmaps) && pixmaps;
         }  

         // printf("Opening IM\n");
         im = XOpenIM(xGlobalDisplay, null, null, null);
         // if(im)
         {
            XColor fore = { 0 }, back = { 0 };
            Pixmap pixmap = XCreatePixmap(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), 1, 1, 1);
            Pixmap mask = XCreatePixmap(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), 1, 1, 1);
            XSetWindowAttributes attributes = { 0 };

            XkbSetDetectableAutoRepeat(xGlobalDisplay, True, &autoRepeatDetectable);

            XInternAtoms(xGlobalDisplay, (char**)atomNames, AtomIdents::enumSize, False, atoms);
            
            {
               Atom protocols[2] = { atoms[wm_delete_window], atoms[wm_take_focus] };

               XSetWMProtocols(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), protocols, 2);
            }

            /*
            if(atoms[_net_workarea] == None)
               printf("Warning: _NET_WORKAREA extension not supported\n");
            */

            attributes.override_redirect = True;
            if(!windowContext)
            {
               windowContext = XUniqueContext();
            }

            nullCursor = XCreatePixmapCursor(xGlobalDisplay, pixmap, mask, &fore, &back, 0, 0);
            confineWindow = XCreateWindow(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay),
               0,0,1,1,0, CopyFromParent, InputOnly, xSystemVisual /*CopyFromParent*/, CWOverrideRedirect, &attributes);


            // IM initialization
            {
               /*ic = XCreateIC(im, XNInputStyle,
                  XIMPreeditNothing | XIMStatusNothing,
                  // XIMPreeditNone | XIMStatusNone | XIMPreeditPosition | XIMStatusArea | XIMPreeditArea | XIMStatusArea | XIMPreeditNothing | XIMStatusNothing,
                  XNClientWindow, confineWindow, XNFocusWindow, confineWindow, 0);
                  */

               /*
               XIMStyles *IMcando;
               XIMStyle  clientCanDo; 
               XIMStyle  styleWeWillUse = null;
               int i;
               XVaNestedList arglist;
               unsigned long imEventMask;

               XGetImValues(im, XNQueryInputStyle, &IMcando, null);
               XSetICFocus(ic);
               clientCanDo =
                  XIMPreeditNone | XIMStatusNone |
                  XIMPreeditPosition | XIMStatusArea |
                  XIMPreeditArea | XIMStatusArea |
                  XIMPreeditNothing | XIMStatusNothing;
               
               for(i=0; i<IMcando->count_styles; i++)
               {
                   XIMStyle tmpStyle;
                   tmpStyle = IMcando->support_styles[i];
                   if ( ((tmpStyle & clientCanDo) == tmpStyle) && prefer(tmpStyle, styleWeWillUse) )
                     styleWeWillUse = tmpStyle;
               }
               if(styleWeWillUse = null)
                   exit_with_error();
               XFree(IMcando);

               arglist = XVaCreateNestedList(0, XNFontSet, fontset,
                                          XNForeground,
                                          WhitePixel(xGlobalDisplay, screen),
                                          XNBackground,
                                          BlackPixel(xGlobalDisplay, screen),
                                          NULL);
               ic = XCreateIC(im, XNInputStyle, styleWeWillUse,
                             XNClientWindow, window, XNFocusWindow, window,
                             XNStatusAttributes, arglist,
                             XNPreeditAttributes, arglist, NULL);
               XFree(arglist);
               if (ic == null)
                   exit_with_error();

               XGetWindowAttributes(xGlobalDisplay, win, &winAtts);
               XGetICValues(ic, XNFilterEvents, &imEventMask, null);
               imEventMask |= winAtts.your_event_mask;
               XSelectInput(xGlobalDisplay, window, imEventMask);
               XSetICFocus(ic);
               */
            }
            
            xMutex.Wait();
            timerThread = Thread { };
            incref timerThread;
            timerThread.Main = XTimerThread;
            timerThread.Create();

            return true;
         }   
      }
      return false;
   }

   void Terminate()
   {
      XEvent e = { 0 };
      xTerminate = true;

      // WHY WAS THIS COMMENTED HERE?
      // Probably because it was causing crashes, the proper fix should now be in DestroyRootWindow
      delete lastActive;

      xMutex.Release();
      xSemaphore.Release();

      timerThread.Wait();
      delete timerThread;
      hiResTimer.Stop();

      //XPutBackEvent(xGlobalDisplay, &e);
      // xThread.Wait();
      // delete xThread;

      /*if(windowData && windowData.ic)
      {
         XDestroyIC(windowData.ic);
         windowData.ic = null;
      }*/
      if(im)
      {
         XCloseIM(im);
         im = null;
      }
      XCloseDisplay(xGlobalDisplay);
      xGlobalDisplay = null;

      if(joystickFD[0]) close(joystickFD[0]);
      if(joystickFD[1]) close(joystickFD[1]);
      if(joystickFD[2]) close(joystickFD[2]);
      if(joystickFD[3]) close(joystickFD[3]);
   }

   #define DBLCLICK_DELAY  300   // 0.3 second
   #define DBLCLICK_DELTA  1

   bool ProcessInput(bool processAll)
   {
      bool eventAvailable = false;
      XEvent e;

      if(!fullScreenMode) RepositionDesktop(true);
      //xMutex.Wait();
//*      XLockDisplay(xGlobalDisplay);
      while(!xTerminate && (/*gotAnXEvent || */XCheckIfEvent(xGlobalDisplay, &e, EventChecker, null)))
      {
         Window window = null;
         XAnyEvent * thisEvent = (XAnyEvent *)&e;
         // printf("Got an event: %d\n", thisEvent->type);

         //if(gotAnXEvent) { thisEvent = (XAnyEvent *)&xEvent; gotAnXEvent = false; }

         if(im && XFilterEvent((union _XEvent *)thisEvent, None))
            continue;
         eventAvailable = true;
         XFindContext(xGlobalDisplay, thisEvent->window, windowContext, (XPointer *) &window);
         if(window)
         {
            static uint lastKeyCode = 0;
            switch(thisEvent->type)
            {
               case KeyPress:
               {
                  XKeyEvent * event = (XKeyEvent *) thisEvent;
                  //*XUnlockDisplay(xGlobalDisplay);
                  ProcessKeyMessage(window, event->keycode, (event->keycode == lastKeyCode) ? 2 : 0, event);
                  //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                  lastKeyCode = event->keycode;
                  break;
               }
               case KeyRelease:
               {
                  XKeyEvent * event = (XKeyEvent *) thisEvent;
                  XEvent nextEvent;
                  lastKeyCode = 0;
                  if(!autoRepeatDetectable && XCheckIfEvent(xGlobalDisplay, (XEvent *)&nextEvent, EventChecker, (void *)KeyPress))
                  {
                     if(im && XFilterEvent(&nextEvent, None))
                        break;

                     if(((XKeyEvent *)&nextEvent)->keycode == event->keycode)
                     {
                        //*XUnlockDisplay(xGlobalDisplay);
                        ProcessKeyMessage(window, event->keycode, 2, event);
                     }
                     else
                     {
                        //*XUnlockDisplay(xGlobalDisplay);
                        // printf("Keycode not the same :(\n");
                        ProcessKeyMessage(window, event->keycode, 1, event);
                        ProcessKeyMessage(window, ((XKeyEvent *)&nextEvent)->keycode, 0, (XKeyEvent *)&nextEvent);
                     }
                  }
                  else
                  {
                     //*XUnlockDisplay(xGlobalDisplay);
                     // printf("No KeyPress ahead\n");
                     ProcessKeyMessage(window, event->keycode, 1, event);
                  }
                  //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                  break;
               }
               case ButtonPress:
               {
                  XButtonEvent * event = (XButtonEvent *) thisEvent;

                  static double lastTime[3];
                  static Window lastWindow[3];
                  static Point lastPos[3];

                  Modifiers keyFlags = 0;
                  bool doubleClick;
                  uint button, buttonDouble, whichButton;
                  uint buttonMask;

                  if(event->button == Button1)
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
                     buttonDouble = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
                     whichButton = 0;
                     buttonMask = Button1Mask;
                     keyFlags.left = true;
                  }
                  else if(event->button == Button3)
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
                     buttonDouble = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
                     whichButton = 2;
                     buttonMask = Button3Mask;
                     keyFlags.right = true;
                  }
                  else
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
                     buttonDouble = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick;
                     whichButton = 1;
                     buttonMask = Button2Mask;
                     keyFlags.middle = true;
                  }
                  if(event->state & buttonMask)
                     break;

                  doubleClick = event->time - lastTime[whichButton] < DBLCLICK_DELAY &&
                     window == lastWindow[whichButton] &&
                     Abs(event->x_root - lastPos[whichButton].x) < DBLCLICK_DELTA &&
                     Abs(event->y_root - lastPos[whichButton].y) < DBLCLICK_DELTA;
                  lastTime[whichButton] = doubleClick ? 0 : event->time;
                  lastWindow[whichButton] = window;
                  lastPos[whichButton].x = event->x_root;
                  lastPos[whichButton].y = event->y_root;

                  if(event->state & ShiftMask)     keyFlags.shift = true;
                  if(event->state & ControlMask)   keyFlags.ctrl = true;
                  if(event->state & Mod1Mask)      keyFlags.alt = true;
                  if(event->state & Button1Mask)   keyFlags.left = true;
                  if(event->state & Button2Mask)   keyFlags.middle = true;
                  if(event->state & Button3Mask)   keyFlags.right = true;
                  //*XUnlockDisplay(xGlobalDisplay);

                  incref window;
                  if(event->button == Button4 || event->button == Button5)
                  {
                     window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, (event->button == Button4) ? wheelUp : wheelDown, 0);
                  }
                  else
                  {
                     if(doubleClick)
                     {
                        if(!window.MouseMessage(buttonDouble, event->x_root, event->y_root, &keyFlags, false, true))
                        {
                           //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                           delete window;
                           break;
                        }
                     }
                     window.MouseMessage(button, event->x_root, event->y_root, &keyFlags, false, /*doubleClick? false : */true);
                  }
                  //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                  delete window;
                  break;
               }
               case ButtonRelease:
               {
                  Modifiers keyFlags = 0;
                  XButtonEvent * event = (XButtonEvent *) thisEvent;
                  uint button;
                  uint buttonMask;
                  if(event->button == Button1)
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
                     buttonMask = Button1Mask;
                  }
                  else if(event->button == Button3)
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;
                     buttonMask = Button3Mask;
                  }
                  else
                  {
                     button = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp;
                     buttonMask = Button2Mask;
                  }
                  if(!(event->state & buttonMask)) break;
                  if(event->state & ShiftMask)     keyFlags.shift = true;
                  if(event->state & ControlMask)   keyFlags.ctrl = true;
                  if(event->state & Mod1Mask)      keyFlags.alt = true;
                  if(event->state & Button1Mask)   keyFlags.left = true;
                  if(event->state & Button2Mask)   keyFlags.middle = true;
                  if(event->state & Button3Mask)   keyFlags.right = true;
                  //*XUnlockDisplay(xGlobalDisplay);
                  incref window;
                  window.MouseMessage(button, event->x_root, event->y_root, &keyFlags, false, false);
                  delete window;
                  //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                  break;
               }
               case MotionNotify:
               { 
                  static uint lastTime = 0;
                  XMotionEvent * event = (XMotionEvent *) thisEvent;
                  while(XCheckIfEvent(xGlobalDisplay, (XEvent *)thisEvent, EventChecker, (void *)MotionNotify));
                  // if(event->time - lastTime > 15)
                  {
                     Modifiers keyFlags = 0;
                     
                     if(event->state & ShiftMask)     keyFlags.shift = true;
                     if(event->state & ControlMask)   keyFlags.ctrl = true;
                     if(event->state & Mod1Mask)      keyFlags.alt = true;
                     if(event->state & Button1Mask)   keyFlags.left = true;
                     if(event->state & Button2Mask)   keyFlags.middle = true;
                     if(event->state & Button3Mask)   keyFlags.right = true;
                     //*XUnlockDisplay(xGlobalDisplay);
                     incref window;
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove,
                        event->x_root, event->y_root, &keyFlags, false, false);
                     delete window;
                     //*if(xGlobalDisplay) XLockDisplay(xGlobalDisplay);
                     lastTime = event->time;
                  }
                  break;
               }
               case Expose:
               {
                  XExposeEvent * event = (XExposeEvent *) thisEvent;
                  Box box;
                  box.left = event->x - window.clientStart.x;
                  box.top = event->y - window.clientStart.y;
                  box.right = box.left + event->width - 1;
                  box.bottom = box.top + event->height - 1;
                  window.Update(box);
                  box.left   += window.clientStart.x;
                  box.top    += window.clientStart.y;
                  box.right  += window.clientStart.x;
                  box.bottom += window.clientStart.y;
                  window.UpdateDirty(box);
                  break;
               }
               case SelectionRequest:
               {
   	            XSelectionRequestEvent *req = (XSelectionRequestEvent *) thisEvent;
   	            XEvent respond;
   		         if(req->target == atoms[targets] && clipBoardData)
                  {
                     Atom * supportedTargets = new Atom[4];
                     supportedTargets[0] = atoms[targets];
                     supportedTargets[1] = atoms[multiple];
                     supportedTargets[2] = XA_STRING;
                     supportedTargets[3] = atoms[utf8_string];
                     XChangeProperty(xGlobalDisplay,req->requestor, req->_property,
   				         XA_ATOM,32,PropModeReplace, (byte *) supportedTargets, 4*sizeof(Atom));
                     respond.xselection._property = req->_property;
                     delete supportedTargets;
                  }
                  else if((req->target == XA_STRING || req->target == atoms[utf8_string]) && clipBoardData)
   		         {
                     Atom _property = (req->_property == None) ? req->target : req->_property;
   			         XChangeProperty(xGlobalDisplay,req->requestor, _property,
   				         req->target/*req->_property*/,8,PropModeReplace, (byte *) clipBoardData, strlen(clipBoardData));
   			         respond.xselection._property = _property;
   		         }
                  else
   			         respond.xselection._property = None;
   	 	         
                  respond.xselection.type = SelectionNotify;
   		         respond.xselection.display = req->display;
   		         respond.xselection.requestor = req->requestor;
   		         respond.xselection.selection =req->selection;
   		         respond.xselection.target = req->target;
   		         respond.xselection.time = CurrentTime;
   		         XSendEvent(xGlobalDisplay, req->requestor,0,0,&respond);
                  break;
               }
               case SelectionClear:
               {
                  delete clipBoardData;
                  break;
               }
               case FocusIn:
               {
                  XFocusChangeEvent *event = (XFocusChangeEvent *) thisEvent;
                  Window modalRoot = window.FindModal();
                  XWindowData windowData;
                  activeWindow = (uint)window.windowHandle;

                  if(window.parent && window == window.parent.activeChild) break;
                  incref window;
                  //if(window.creationActivation == activate)
                  {
                     if(modalRoot)
                        modalRoot.ExternalActivate(true, true, window, null); // lastActive);
                     else
                        window.ExternalActivate(true, true, window, null); // lastActive); 
                  } 
                  windowData = modalRoot ? modalRoot.windowData : window.windowData;
                  if(windowData && windowData.ic)
                  {
                     // XSetICValues(ic, XNClientWindow, window.windowHandle, XNFocusWindow, window.windowHandle, 0);
                     XSetICFocus(windowData.ic);
                  }
                  //delete lastActive;
                  //lastActive = window;
                  //incref lastActive;
                  delete window;
                  break;
               }
               case FocusOut:
               {
#ifdef _DEBUG
                  //printf("Processing a FocusOut Event for %s (%x)\n", window._class.name, window);
#endif

                  if(XCheckTypedWindowEvent(xGlobalDisplay, thisEvent->window, FocusIn, (XEvent *)thisEvent))
                  {
                     break;
                  }
                  if(thisEvent->window == activeWindow)
                     activeWindow = (uint)null;
#if 0
                  if(XCheckTypedEvent(xGlobalDisplay, FocusIn, (XEvent *)thisEvent))
                  {
                     if(XCheckTypedWindowEvent(xGlobalDisplay, thisEvent->window, FocusOut, (XEvent *)thisEvent))
                     {
                        XFocusChangeEvent *event = (XFocusChangeEvent *) thisEvent;
                        
                        XFindContext(xGlobalDisplay, thisEvent->window, windowContext, (XPointer *) &window);
                        if(window)
                        {
                           Window windowCopy = window;
                           XWindowData windowData;
                           if(windowCopy == windowCopy.parent.activeChild) break;
                           incref windowCopy;
                           windowCopy.ExternalActivate(true, true,  windowCopy, lastActive);

                           windowData = windowCopy.windowData;
                           if(windowData && windowData.ic)
                              XSetICFocus(windowData.ic);

                           delete lastActive;
                           lastActive = windowCopy;
                           incref lastActive;
                           delete windowCopy;
                        }

                        // XFindContext(xGlobalDisplay, thisEvent->window, windowContext, (XPointer *) &window);
                        if(window)
                        {
                           if(window != window.parent.activeChild) break;
                           incref window;
                           window.ExternalActivate(false, true,  window, lastActive);
                           delete window;
                        }
                     }
                     else
                     {
                        XWindowData windowData;
                        XFindContext(xGlobalDisplay, thisEvent->window, windowContext, (XPointer *) &window);
                        
                        if(window)
                        {
                           XFocusChangeEvent *event = (XFocusChangeEvent *) thisEvent;
                           Window modalRoot = window.FindModal();

                           incref window;
                           if(modalRoot)
                           {
                              modalRoot.ExternalActivate(true, true, window, lastActive);
                           }
                           else
                           {
                              window.ExternalActivate(true, true, window, lastActive);
                           }
                           windowData = modalRoot ? modalRoot.windowData : window.windowData;
                           if(windowData && windowData.ic)
                              XSetICFocus(windowData.ic);

                           delete lastActive;
                           lastActive = window;
                           incref lastActive;
                           delete window;
                        }
                     }
                  }
                  else
#endif
                  {
                     XFocusChangeEvent *event = (XFocusChangeEvent *) thisEvent;
                     if(window != window.parent.activeChild && window != guiApp.interimWindow) break;
                     incref window;

#ifdef _DEBUG
                     //printf("Deactivating %s\n", window._class.name);
#endif

                     if(!window.ExternalActivate(false, true, window, null /*lastActive*/))
                     {
                        XCheckTypedEvent(xGlobalDisplay, /*thisEvent->window, */ButtonPress, (XEvent *)thisEvent);
                     }
                     
                     //delete lastActive;
                     /*
                     lastActive = window;
                     incref lastActive;
                     */
                     delete window;
                  }
                  break;
               }
               case ConfigureNotify:
               {
                  XConfigureEvent * event = (XConfigureEvent *) thisEvent;
                  while(XCheckIfEvent(xGlobalDisplay, (XEvent *)thisEvent, (void *)ConfigureNotifyChecker, (void *)window.windowHandle));
                  //if(event->x - desktopX != window.position.x || event->y - desktopY != window.position.y || event->width != window.size.w || event->height != window.size.h)

                  // TODO: Support _NET_REQUEST_FRAME_EXTENTS message / _NET_FRAME_EXTENTS property for decoration size awareness

                  window.ExternalPosition(event->x - desktopX, event->y - desktopY, event->width, event->height);
                  break;
               }
               case ClientMessage:
               {
                  XClientMessageEvent * event = (XClientMessageEvent *) thisEvent;

                  if(event->data.l[0] == atoms[wm_delete_window])
                  {
                     window.Destroy(0);
                  }

                  if(event->data.l[0] == atoms[wm_take_focus])
                  {
                     Window modalRoot;
                     XWindowData windowData;
                     bool laterFocus;
                     activeWindow = (uint)window.windowHandle;

                     timeStamp = event->data.l[1];
                     
                     windowData = window.windowData;
                     laterFocus = windowData.laterFocus;
                     windowData.laterFocus = true;

#ifdef _DEBUG
                     //printf("Processing a ClientMessage WM_TAKE_FOCUS Event for %s (%x)\n", window._class.name, window);
#endif
                     if(guiApp.interimWindow && guiApp.interimWindow.created && window != guiApp.interimWindow) break; //window == window.parent.activeChild) break;
                     // if(window == window.parent.activeChild) break;
                     incref window;
   
                     {
                        XEvent checkEvent;
                        //XFlush(xGlobalDisplay);
                        while(XCheckTypedEvent(xGlobalDisplay, FocusOut, &checkEvent))
                        {
                           XFocusChangeEvent *event = (XFocusChangeEvent *) &checkEvent;
                           Window window;
                           XFindContext(xGlobalDisplay, event->window, windowContext, (XPointer *) &window);
                           if(window != window.parent.activeChild) break;
                           incref window;

      #ifdef _DEBUG
                           //printf("Found a FocusOut ahead, deactivating %s (%d)\n", window._class.name, window);
      #endif

                           if(!window.ExternalActivate(false, true, window, null /*lastActive*/))
                           {
                              XCheckTypedEvent(xGlobalDisplay, /*thisEvent->window, */ButtonPress, (XEvent *)thisEvent);
                           }
                           delete lastActive;
                           delete window;
                        }
                     }

                     modalRoot = window.FindModal();
                     windowData = modalRoot ? modalRoot.windowData : window.windowData;
                     if(windowData)
                     {
                        if(laterFocus || (modalRoot ? modalRoot : window).creationActivation == activate)
                        {
                           if(modalRoot)
                           {
                              XRaiseWindow(xGlobalDisplay, (int)modalRoot.windowHandle);
                              WaitForViewableWindow(modalRoot);
                              if(atoms[_net_active_window])
                              {
                                 XClientMessageEvent event = { 0 };
                                 event.type = ClientMessage;
                                 event.message_type = atoms[_net_active_window];
                                 event.display = xGlobalDisplay;
                                 event.serial = 0;
                                 event.window = (uint)modalRoot.windowHandle;
                                 event.send_event = 1;
                                 event.format = 32;
                                 event.data.l[0] = 0;
                                 /*
                                 event.data.l[0] = 1;
                                 event.data.l[1] = atoms[_net_wm_user_time];
                                 event.data.l[2] = activeWindow; //guiApp.desktop.activeChild.windowHandle;
                                 */
#ifdef _DEBUG
                                 //printf("(ClientMessage - %s) Setting _NET_ACTIVE_WINDOW for %s (%x)\n", window._class.name, modalRoot._class.name, modalRoot);
#endif

                                 XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, (union _XEvent *)&event);
                                 XSetInputFocus(xGlobalDisplay, (int)modalRoot.windowHandle, RevertToPointerRoot, (uint)timeStamp);

                                 //XFlush(xGlobalDisplay);
                                 //printf("Done.\n");
                              }
                           }
                           else
                           {
                              XSetInputFocus(xGlobalDisplay, (int)window.windowHandle, RevertToPointerRoot, (uint)timeStamp);
                              window.ExternalActivate(true, true, window, null); // lastActive); 
                              if(windowData && windowData.ic)
                              {
                                 // XSetICValues(ic, XNClientWindow, window.windowHandle, XNFocusWindow, window.windowHandle, 0);
                                 //XSetICFocus(windowData.ic);
                              }
                           }
                        }
                        windowData.laterFocus = true;
                        delete lastActive;
                        lastActive = window;
                        incref lastActive;
                     }
                     delete window;
                  }
                  break;
               }
            }
            if(!processAll) break;
         }
      }
      //*if(xGlobalDisplay) XUnlockDisplay(xGlobalDisplay);
      //xMutex.Release();
      if(!eventAvailable)
         return false;
      return true;
   }

   void Wait()
   {
      gotAnXEvent = false;
      xMutex.Release();
      xSemaphore.Release();
      guiApp.WaitEvent();
      xMutex.Wait();
   }

   void Lock(Window window)
   {
      //*XLockDisplay(xGlobalDisplay);
   }

   void Unlock(Window window)
   {
      //*XUnlockDisplay(xGlobalDisplay);
   }

   char ** GraphicsDrivers(int * numDrivers)
   {
      static char *graphicsDrivers[] = { "X", "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (char **)graphicsDrivers;
   }

   void GetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate)
   {
      *fullScreen = fullScreenMode;
   }

   void EnsureFullScreen(bool *fullScreen)
   {

   }

   bool ScreenMode(bool fullScreen, int resolution, int colorDepth, int refreshRate, bool * textMode)
   {
      bool result = true;

      fullScreenMode = fullScreen;

      if(fullScreen)
      {

      }
      else
      {
         static bool firstTime = true;
         firstTime = false;
         desktopX = desktopY = desktopW = desktopH = 0;

         RepositionDesktop(false);
      }
      return result;
   }

   // --- Window Creation ---
   void * CreateRootWindow(Window window)
   {
      X11Window windowHandle;
      XSetWindowAttributes attributes = { 0 };
      XVisualInfo * visualInfo = null;
      int depth;
      Visual * visual;
      XIC ic = null;
      unsigned int mask = EVENT_MASK;

      attributes.override_redirect = window.interim ? True : False;
      attributes.event_mask = EVENT_MASK;
      //printf("%s\n", guiApp.defaultDisplayDriver);
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
      if(window.dispDriver == class(OpenGLDisplayDriver) || !strcmp(guiApp.defaultDisplayDriver, "OpenGL"))
      {
         int samples;
         bool alpha = true;
         for(samples = 4;; samples /= 2)
         {
            bool found = false;
            int attrib[30] =
            {
               GLX_RENDER_TYPE, GLX_RGBA_BIT,
               GLX_DRAWABLE_TYPE, GLX_WINDOW_BIT,
               GLX_DOUBLEBUFFER, True,
               GLX_DEPTH_SIZE, 1,
               GLX_RED_SIZE, 1,
               GLX_GREEN_SIZE, 1,
               GLX_BLUE_SIZE, 1
            };
            int numAttribs = 14;
            
            GLXFBConfig *fbconfigs = null, fbconfig;
            int numfbconfigs;
            int i;
            //printf("Samples = %d, alpha = %d\n", samples, alpha);
            if(alpha)
            {
               attrib[numAttribs++] = GLX_ALPHA_SIZE;
               attrib[numAttribs++] = 1;
            }
            if(samples)
            {
               attrib[numAttribs++] = GLX_SAMPLE_BUFFERS_ARB;
               attrib[numAttribs++] = GL_TRUE;
               attrib[numAttribs++] = GLX_SAMPLES_ARB;
               attrib[numAttribs++] = samples;
            }
            attrib[numAttribs] = None;

            // visualInfo = glXChooseVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrib);

            //printf("Trying %d samples...\n", samples);
            fbconfigs = glXChooseFBConfig(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrib, &numfbconfigs);
            if(fbconfigs)
            {
               for (i = 0; i < numfbconfigs; i++)
               {
                  XRenderPictFormat * format;
                  visualInfo = glXGetVisualFromFBConfig(xGlobalDisplay, fbconfigs[i]);
                  if (!visualInfo) continue;
                  if(window.alphaBlend)
                  {
                     format = XRenderFindVisualFormat(xGlobalDisplay, visualInfo->visual);
                     if (!format) { XFree(visualInfo); continue; }
                     if(format->direct.alphaMask > 0)
                     {
                        //printf("Found what we're looking for (alphaBlend)\n");
                        fbconfig = fbconfigs[i];
                        found = true;
                        break;
                     }
                  }
                  else
                  {
                     //printf("Found what we're looking for\n");
                     found = true;
                     break;
                  }
               }
               if (i == numfbconfigs)
               {
                  fbconfig = fbconfigs[0];
                  visualInfo = glXGetVisualFromFBConfig(xGlobalDisplay, fbconfig);
               }
            }
            if(fbconfigs)
               XFree(fbconfigs);
            if(found || (!samples && !alpha))
            {
               //printf("Stopping now\n");
               break;
            }
            else
               XFree(visualInfo);
            if(samples == 1) samples = 0;
            else if(!samples) alpha = false;
         }
      } 
#endif
      depth = visualInfo ? visualInfo->depth : (window.alphaBlend ? 32 : xSystemDepth);
      visual = visualInfo ? visualInfo->visual : (window.alphaBlend ? FindFullColorVisual (xGlobalDisplay, &depth) : xSystemVisual);
      // printf("visual: %d, depth: %d\n", visual, depth);

      if(visual)
      {
         attributes.colormap = XCreateColormap(xGlobalDisplay, XRootWindow(xGlobalDisplay, DefaultScreen(xGlobalDisplay)), visual, AllocNone);
         attributes.border_pixel = 0;
      }
      else
         return null;

      if(fullScreenMode)
      {
         windowHandle = XCreateWindow(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay),
            0,0,guiApp.desktop.size.w,guiApp.desktop.size.h,0, depth, InputOutput, visual ? visual : CopyFromParent, 
            CWEventMask | (visual ? (CWColormap | CWBorderPixel) : 0)/*| CWOverrideRedirect*/, &attributes);
      }
      /*
         Unsupported for now...
      else if(window.systemParent)
      {

      }
      */
      else
      {
         if(window.windowHandle)
            windowHandle = (int)window.windowHandle;
         else
         {
            X11Window parentWindow = (uint)null;

            if(window.master.rootWindow && window.master.rootWindow != guiApp.desktop && (window._isModal || window.style.interim))
            {
               Window master = window.master;
               Window rootWindow = master.rootWindow;

               parentWindow = rootWindow.is3D ? (uint)rootWindow.parent.windowHandle : (uint)rootWindow.windowHandle;

               // parentWindow = window.master.rootWindow.is3D ? window.master.rootWindow.parent.windowHandle : window.master.rootWindow.windowHandle;
            }
            if(window.style.showInTaskBar)
               parentWindow = (uint)null;

            windowHandle = XCreateWindow(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), 
               0,0,1,1,0, depth, InputOutput, visual ? visual : CopyFromParent, 
               CWEventMask | CWOverrideRedirect | (visual ? (CWColormap | CWBorderPixel) : 0), &attributes);

            if(parentWindow && window.interim)
            {
               //printf("Setting WM_TRANSIENT_FOR of %s to %s\n", window._class.name, window.master.rootWindow._class.name);
               XSetTransientForHint(xGlobalDisplay, windowHandle, parentWindow);
               //XFlush(xGlobalDisplay);
               //printf("Done.\n");
               //XChangeProperty(xGlobalDisplay, windowHandle, atoms[wm_transient_for], XA_WINDOW, 32, PropModeReplace, (unsigned char*)&parentWindow, 1);
            }

            {
#if defined(__APPLE__)
               Atom hints[2] =
               {
                  parentWindow ? atoms[_net_wm_window_type_popup_menu] : atoms[_net_wm_window_type_normal]
               };
               
               XChangeProperty(xGlobalDisplay, windowHandle, atoms[_net_wm_window_type], XA_ATOM, 32,
                  PropModeReplace, (unsigned char*)&hints, 1);
#else
               Atom hints[2] =
               {
                  parentWindow ? atoms[_net_wm_window_type_menu] : atoms[_net_wm_window_type_normal],
                  parentWindow ? atoms[_net_wm_window_type_popup_menu] : 0
               };
               XChangeProperty(xGlobalDisplay, windowHandle, atoms[_net_wm_window_type], XA_ATOM, 32,
                  PropModeReplace, (unsigned char*)&hints, parentWindow ? 2 : 1);
#endif
               {
                  XWMHints xwmHints;
                  xwmHints.flags = InputHint;
                  xwmHints.input = 0;
                  XSetWMHints(xGlobalDisplay, windowHandle, &xwmHints);
               }
               {
                  Atom protocols[2] = { atoms[wm_delete_window], atoms[wm_take_focus] };
                  XSetWMProtocols(xGlobalDisplay, windowHandle, protocols, 2);
               }
            }
         }
      }

      if(!ic && im)
      {
         char fontString[1024] = "--helvetica-*-r-*-*-*-120-*-*-*-*-*-*,-misc-fixed-*-r-*-*-*-130-*-*-*-*-*-*";
         XPoint cursor_location = { 0, 0 };
         char **missing_charsets;
         int num_missing_charsets = 0;
         char *default_string;
         XFontSet fontset;
         XRectangle area = { 0, 0,  400, 400 };         
         XVaNestedList argList;

         // sprintf(fontString, "-*-%s-*-r-*-*-*-%d-*-*-*-*-*-*", "Helvetica" /*window.font.faceName*/, (int)(window.font.size * 20));
         fontset = XCreateFontSet(xGlobalDisplay, fontString, &missing_charsets, &num_missing_charsets, &default_string);
         argList = XVaCreateNestedList(0,
                                       XNSpotLocation, &cursor_location, 
                                       //XNArea, &area,
                                       XNFontSet, fontset,/*
                                       XNForeground,
                                       WhitePixel(xGlobalDisplay, DefaultScreen(xGlobalDisplay)),
                                       XNBackground,
                                       BlackPixel(xGlobalDisplay, DefaultScreen(xGlobalDisplay)),*/
                                       NULL);
         ic = XCreateIC(im, XNInputStyle,
            XIMStatusNothing | XIMPreeditPosition,
            XNPreeditAttributes, argList,
            XNClientWindow, windowHandle, XNFocusWindow, windowHandle, 0);
         XFree(argList);
         // Should we free the fontset or not?
         // XFreeFontSet(xGlobalDisplay, fontset);
         if(ic)
            setICPosition = true;
         else
            ic = XCreateIC(im, XNInputStyle, XIMStatusNothing | XIMPreeditNothing, XNClientWindow, windowHandle, XNFocusWindow, windowHandle, 0);
      }
      if(ic)
      {
	      XGetICValues(ic, XNFilterEvents, &mask, NULL);
	      mask |= EVENT_MASK;
      }
      /*
      XSelectInput(xGlobalDisplay, windowHandle, mask);

      if(capturedWindow == None && !restrictedWindow)
      {
         XGrabPointer(xGlobalDisplay, (int)windowHandle, False, ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
            GrabModeAsync, restrictedWindow ? confineWindow : None, fullScreenMode ? nullCursor : None, CurrentTime);
         XUngrabPointer(xGlobalDisplay, CurrentTime);
      }
      */

      {
         if ( atoms[_motif_wm_hints] != None ) 
         {
            MWM_Hints hints
            {
               (window.nativeDecorations ? 0 : MWM_HINTS_DECORATIONS)|MWM_HINTS_FUNCTIONS,
               (window.hasClose ? MWM_FUNC_CLOSE : 0) |
               (window.hasMaximize ? MWM_FUNC_MAXIMIZE : 0) |
               (window.hasMinimize ? MWM_FUNC_MINIMIZE : 0) |
               ((window.moveable || ((BorderBits)window.borderStyle).fixed) ? MWM_FUNC_MOVE : 0) |
               (((BorderBits)window.borderStyle).sizable ? MWM_FUNC_RESIZE : 0),
                0, 0, 0
            };
            XChangeProperty(xGlobalDisplay, windowHandle, atoms[_motif_wm_hints], atoms[_motif_wm_hints], 32,
               PropModeReplace, (unsigned char*)&hints, sizeof(hints)/4);
         }
         if(atoms[_net_wm_pid] != None)
         {
            int pid = getpid();
            // printf("Setting _NET_WM_PID to %d\n", pid); 
            XChangeProperty(xGlobalDisplay, windowHandle, atoms[_net_wm_pid], XA_CARDINAL, 32,
               PropModeReplace, (unsigned char*)&pid, 1);            
         }
      }
      
      /*
      {
         Atom protocolsAtom = XInternAtom(xGlobalDisplay, "WM_PROTOCOLS", False);
         if ( protocolsAtom != None ) 
         {
            MWM_Hints hints = { MWM_HINTS_DECORATIONS|MWM_HINTS_FUNCTIONS, 0, 0, 0, 0 };
            XChangeProperty(xGlobalDisplay, windowHandle, atoms[_motif_wm_hints], atoms[_motif_wm_hints], 32,
               PropModeReplace, (unsigned char*)&hints, sizeof(hints)/4);
         }
      }*/
      // XFlush(xGlobalDisplay);
      window.windowData = XWindowData { visualInfo, ic };
      
      XSaveContext(xGlobalDisplay, windowHandle, windowContext, (XPointer)window);

      XSelectInput(xGlobalDisplay, windowHandle, mask);

      if(capturedWindow == None && !restrictedWindow)
      {
         XGrabPointer(xGlobalDisplay, (int)windowHandle, False, ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
            GrabModeAsync, restrictedWindow ? confineWindow : None, fullScreenMode ? nullCursor : None, CurrentTime);
         XUngrabPointer(xGlobalDisplay, CurrentTime);
      }
      return (void *)windowHandle;
   }

   void DestroyRootWindow(Window window)
   {
      XEvent event;

      XDeleteContext(xGlobalDisplay, (XID)window, windowContext); 
      XSaveContext(xGlobalDisplay, (int)window.windowHandle, windowContext, null);
      XDestroyWindow(xGlobalDisplay, (int)window.windowHandle);
      XSync(xGlobalDisplay, 0);
      while(XCheckWindowEvent(xGlobalDisplay, (int)window.windowHandle, 0xFFFFFFFF, &event));
      window.windowHandle = null;
      if(window.windowData)
      {
         XWindowData windowData = window.windowData;
         XFree(windowData.visual);
         if(windowData && windowData.ic)
            XDestroyIC(windowData.ic);
         delete windowData;
         // printf("Setting windowData for %s to null\n", window._class.name);
         window.windowData = null;
      }
      if(lastActive == window)
         delete lastActive;
   }

   // -- Window manipulation ---

   void SetRootWindowCaption(Window window, char * name)
   {
      if(window.windowHandle)
      {
         XChangeProperty(xGlobalDisplay, (int)window.windowHandle, atoms[_net_wm_name],
            atoms[utf8_string], 8, PropModeReplace, (byte *)name, name ? strlen(name) : 0);
         XChangeProperty(xGlobalDisplay, (int)window.windowHandle, atoms[wm_name],
            atoms[utf8_string], 8, PropModeReplace, (byte *)name, name ? strlen(name) : 0);
      }   
   }

   void PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
   {
      //Logf("Position root window %s\n", window.name);
      if(!window.parent || !window.parent.display)
      {
#if defined(__APPLE__)
         bool visible = window.visible;
         if(window.visible)
         {
            XMapWindow(xGlobalDisplay, (int)window.windowHandle);
            WaitForViewableWindow(window);
         }
#endif
         if(window.state == minimized) return;

         if(move && resize)
            XMoveResizeWindow(xGlobalDisplay, (int)window.windowHandle, x + desktopX, y + desktopY, w, h);
         else if(move)
            XMoveWindow(xGlobalDisplay, (int)window.windowHandle, x + desktopX, y + desktopY);
         else if(resize)
            XResizeWindow(xGlobalDisplay, (int)window.windowHandle, w, h);
#if defined(__APPLE__)
//         if(window.created && !visible)
  //          XUnmapWindow(xGlobalDisplay, (int)window.windowHandle);
#endif
      }
   }

   void OrderRootWindow(Window window, bool topMost)
   {

   }

   void SetRootWindowColor(Window window)
   {

   }

   void OffsetWindow(Window window, int * x, int * y)
   {

   }

   void UpdateRootWindow(Window window)
   {
      if(!window.parent || !window.parent.display)
      {
         if(window.visible)
         {
            Box box = window.box;
            box.left -= window.clientStart.x;
            box.top -= window.clientStart.y;
            box.right -= window.clientStart.x;
            box.bottom -= window.clientStart.y;
            // Logf("Update root window %s\n", window.name);
            window.Update(null);
            box.left   += window.clientStart.x;
            box.top    += window.clientStart.y;
            box.right  += window.clientStart.x;
            box.bottom += window.clientStart.y;
            window.UpdateDirty(box);
         }
      }
   }


   void SetRootWindowState(Window window, WindowState state, bool visible)
   {
      if(!window.parent || !window.parent.display)
      {
         //Logf("Set root window state %d %s\n", state, window.name);
         if(visible)
         {
            XMapWindow(xGlobalDisplay, (int)window.windowHandle);
#if defined(__APPLE__)
            WaitForViewableWindow(window);
#endif
            if(window.creationActivation == activate && state != minimized)
               ActivateRootWindow(window);
            
            if(state == minimized)
            {
               uint iconic = IconicState;
               /*
               XChangeProperty(xGlobalDisplay, window.windowHandle, atoms[_net_wm_state], XA_ATOM, 32,
                  PropModeReplace, (unsigned char*)&atoms[_net_wm_state_hidden], 1);
               */
               /*
               XChangeProperty(xGlobalDisplay, window.windowHandle, atoms[wm_state], XA_CARDINAL, 32,
                  PropModeReplace, &iconic, 1);
               */
               
               /*
               XClientMessageEvent event = { 0 };
               event.type = ClientMessage;
               event.message_type = atoms[_net_wm_state];
               event.display = xGlobalDisplay;
               event.serial = 0;
               event.window = window.windowHandle;
               event.send_event = 1;
               event.format = 32;
               event.data.l[0] = 2; // 1;
               event.data.l[1] = atoms[_net_wm_state_hidden];
               XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, &event);
               */
               /*
               XClientMessageEvent event = { 0 };
               event.type = ClientMessage;
               event.message_type = atoms[wm_state];
               event.display = xGlobalDisplay;
               event.window = window.windowHandle;
               event.send_event = 1;
               event.format = 32;
               event.data.l[0] = IconicState;
               XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, &event);
               */

               // printf("Attempting to minimize %s\n", window._class.name);
               XIconifyWindow(xGlobalDisplay, (uint)window.windowHandle, DefaultScreen(xGlobalDisplay));
            }
            else
            {
               XMoveResizeWindow(xGlobalDisplay, 
                  (int)window.windowHandle, window.position.x + desktopX, window.position.y + desktopY, window.size.w, window.size.h);
            }
         }
         else
            XUnmapWindow(xGlobalDisplay, (int)window.windowHandle);
         //XFlush(xGlobalDisplay);
      }
   }

   void FlashRootWindow(Window window)
   {
      XClientMessageEvent event = { 0 };
      // printf("Attempting to flash root window\n");
      event.type = ClientMessage;
      event.message_type = atoms[_net_wm_state];
      event.display = xGlobalDisplay;
      event.serial = 0;
      event.window = (uint)window.windowHandle;
      event.send_event = 1;
      event.format = 32;
      event.data.l[0] = 1;
      event.data.l[1] = atoms[_net_wm_state_demands_attention];
      XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, (union _XEvent *)&event);
   }

   void ActivateRootWindow(Window window)
   {
      if(!window.parent || !window.parent.display)
      {
         if(!window.style.hidden && window.created)
         {
            //printf("Activate root window %s\n", window._class.name);
            XRaiseWindow(xGlobalDisplay, (int)window.windowHandle);
            XMapWindow(xGlobalDisplay, (int)window.windowHandle);
            WaitForViewableWindow(window);
            if(atoms[_net_active_window])
            {
               XClientMessageEvent event = { 0 };
               event.type = ClientMessage;
               event.message_type = atoms[_net_active_window];
               event.display = xGlobalDisplay;
               event.serial = 0;
               event.window = (uint)window.windowHandle;
               event.send_event = 1;
               event.format = 32;
               event.data.l[0] = 0;
               
               //event.data.l[0] = 2;
               //event.data.l[1] = timeStamp;
               

               //event.data.l[1] = atoms[_net_wm_user_time];
               //event.data.l[2] = activeWindow; //guiApp.desktop.activeChild.windowHandle;
               
#ifdef _DEBUG
               //printf("(ActivateRootWindow) Setting _NET_ACTIVE_WINDOW for %s (%x)\n", window._class.name, window);
#endif
               
               XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, (union _XEvent *)&event);
//#if defined(__APPLE__)
               XSetInputFocus(xGlobalDisplay, (int)window.windowHandle, RevertToPointerRoot, CurrentTime);
//#endif
            }
            else
               XSetInputFocus(xGlobalDisplay, (int)window.windowHandle, RevertToPointerRoot, CurrentTime);
         }
      }
   }

   // --- Mouse-based window movement ---

   void StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {

   }

   void StopMoving(Window window)
   {

   }

   // -- Mouse manipulation ---

   void GetMousePosition(int *x, int *y)
   {
      int rootWindow, childWindow;
      int mx, my;
      unsigned int state;
      ((GuiApplication)__thisModule.application).Lock();
      //XLockDisplay(xGlobalDisplay);
      XQueryPointer(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), &childWindow, 
         &rootWindow, x, y, &mx, &my, &state);
      //XUnlockDisplay(xGlobalDisplay);
      ((GuiApplication)__thisModule.application).Unlock();
   }

   void SetMousePosition(int x, int y)
   {

   }

   void SetMouseRange(Window window, Box box)
   {
      ((GuiApplication)__thisModule.application).Lock();
      //XLockDisplay(xGlobalDisplay);
      if(box && box.left > 0 && box.top > 0 && 
         box.right < guiApp.desktop.clientSize.w - 1 && box.bottom < guiApp.desktop.clientSize.h - 1)
      {
         if(!window.parent || !window.parent.display)
         {
            XMoveResizeWindow(xGlobalDisplay, confineWindow, box.left + desktopX, box.top + desktopY, 
               box.right - box.left + 1, box.bottom - box.top + 1);
      
            if(!restrictedWindow)
               XMapWindow(xGlobalDisplay, confineWindow);

            XGrabPointer(xGlobalDisplay, (int) window.rootWindow.windowHandle, False,
               ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
               GrabModeAsync, confineWindow, fullScreenMode ? nullCursor : None, CurrentTime);

            restrictedWindow = window;
         }
      }
      else if(restrictedWindow)
      {
         if(capturedWindow != None)
         {
            XGrabPointer(xGlobalDisplay, (int)capturedWindow,
               False, ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
               GrabModeAsync, None, fullScreenMode ? nullCursor : None, CurrentTime);
         }
         else
            XUngrabPointer(xGlobalDisplay, CurrentTime);
         
         if(restrictedWindow)
            XUnmapWindow(xGlobalDisplay, confineWindow);

         restrictedWindow = null;
      }
      //XUnlockDisplay(xGlobalDisplay);
      ((GuiApplication)__thisModule.application).Unlock();
   }

   void SetMouseCapture(Window window)
   {
      //*XLockDisplay(xGlobalDisplay);
      if(window)
      {
         if(!window.parent || !window.parent.display)
         {
            XGrabPointer(xGlobalDisplay, (int)window.windowHandle,
               False, ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
               GrabModeAsync, restrictedWindow ? confineWindow : None, fullScreenMode ? nullCursor : None, CurrentTime);

            capturedWindow = (X11Window) window.windowHandle;
         }
      }
      else if(capturedWindow != None)
      {
         if(restrictedWindow)
            XGrabPointer(xGlobalDisplay, (int) restrictedWindow.rootWindow.windowHandle, False, 
               ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
               GrabModeAsync, confineWindow, fullScreenMode ? nullCursor : None, CurrentTime);
         else
            XUngrabPointer(xGlobalDisplay, CurrentTime);
         capturedWindow = None;
      }
      //*XUnlockDisplay(xGlobalDisplay);
   }

   // -- Mouse cursor ---

   void SetMouseCursor(int cursor)
   {
      //*XLockDisplay(xGlobalDisplay);
      if(cursor == -1)
      {
         XDefineCursor(xGlobalDisplay, (int) guiApp.desktop.windowHandle, nullCursor);
      }
      //*XUnlockDisplay(xGlobalDisplay);
   }

   // --- Caret ---

   void SetCaret(int x, int y, int size)
   {
      Window caretOwner = guiApp.caretOwner;
      Window window = caretOwner ? caretOwner.rootWindow : null;
      if(window && window.windowData && setICPosition)
      {
         XWindowData windowData = window.windowData;
         if(windowData && windowData.ic)
         {
            XPoint cursor_location =
            {
               (short)(caretOwner.caretPos.x - caretOwner.scroll.x + caretOwner.absPosition.x - window.absPosition.x),
               (short)(caretOwner.caretPos.y - caretOwner.scroll.y + caretOwner.absPosition.y - window.absPosition.y)
            };
            XVaNestedList argList = XVaCreateNestedList(0, XNSpotLocation, &cursor_location, NULL);
            XSetICValues(windowData.ic, XNPreeditAttributes, argList, 0);
         }
      }
   }  

   void ClearClipboard()
   {
      //*XLockDisplay(xGlobalDisplay);
      if(clipBoardData)
      {
         delete clipBoardData;
      	XSetSelectionOwner(xGlobalDisplay, atoms[clipboard], None, CurrentTime);
      }
      //*XUnlockDisplay(xGlobalDisplay);
   }

   bool AllocateClipboard(ClipBoard clipBoard, uint size)
   {
      bool result = false;
      if((clipBoard.text = new0 byte[size]))
         result = true;   
      return result;
   }

   bool SaveClipboard(ClipBoard clipBoard)
   {
      bool result = false;
      //*XLockDisplay(xGlobalDisplay);
      if(clipBoard.text)
      {
         Window rootWindow = guiApp.desktop;
         if(!fullScreenMode) 
         {
            for(rootWindow = rootWindow.children.first; 
               rootWindow && !rootWindow.windowHandle; 
               rootWindow = rootWindow.next);
         }
         if(clipBoardData)
            delete clipBoardData;
         else if(rootWindow)
      	   XSetSelectionOwner(xGlobalDisplay, atoms[clipboard], 
               (int) rootWindow.windowHandle, CurrentTime);
         clipBoardData = clipBoard.text;
         clipBoard.text = null;
         result = true;
      }
      //*XUnlockDisplay(xGlobalDisplay);
      return result;
   }

   bool LoadClipboard(ClipBoard clipBoard)
   {
      bool result = false;

      //*XLockDisplay(xGlobalDisplay);
      // The data is inside this client...
      if(clipBoardData)
      {
         clipBoard.text = new char[strlen(clipBoardData)+1];
         strcpy(clipBoard.text, clipBoardData);
         result = true;
      }
      // The data is with another client...
      else
      {
         Window rootWindow = guiApp.desktop;
         if(!fullScreenMode)
         {
            for(rootWindow = rootWindow.children.first; 
               rootWindow && !rootWindow.windowHandle; 
               rootWindow = rootWindow.next);
         }
         if(rootWindow)
         {
            int selAtom = atoms[clipboard];
            int owner = XGetSelectionOwner(xGlobalDisplay, selAtom);
            if(owner != None)
            {
               int atom;
               for(atom = atoms[utf8_string]; atom; atom = ((atom == atoms[utf8_string]) ? XA_STRING : 0))
               {
                  XEvent e;
                  XConvertSelection(xGlobalDisplay, selAtom, atom, atoms[app_selection] /*None*/, (int) rootWindow.windowHandle, CurrentTime);
                  XIfEvent(xGlobalDisplay, (XEvent *) &e, EventChecker, (void *)SelectionNotify);
                  if(e.type == SelectionNotify)
                  {
                     XSelectionEvent * selection = (XSelectionEvent *) &e;
                     //printf("Got a SelectionNotify with %d (%s)\n", selection->_property, XGetAtomName(xGlobalDisplay, selection->_property));
                     byte *data;
                     uint len, size = 0, dummy;
                     Atom type;
            	     int format;
                     XGetWindowProperty(xGlobalDisplay, (int) rootWindow.windowHandle, selection->_property ? selection->_property : atom, 0, 0, 0, AnyPropertyType, &type, &format, &len, &size, &data);
                     if(size > 0)
                     {
                        if(XGetWindowProperty(xGlobalDisplay, (int) rootWindow.windowHandle, selection->_property ? selection->_property : atom, 0,size,0,
                              AnyPropertyType, &type,&format,&len, &dummy, &data) == Success)
                        {
                           clipBoard.text = new char[size+1];
                           strncpy(clipBoard.text, data, size);
                           clipBoard.text[size] = '\0';
                           XFree(data);
                           result = true;
                           break;
                        }
                     }
                  }
               }
            }
         }
      }
      //*XUnlockDisplay(xGlobalDisplay);
      return result;
   }

   void UnloadClipboard(ClipBoard clipBoard)
   {
      delete clipBoard.text;
   }

   // --- State based input ---

   bool AcquireInput(Window window, bool state)
   {
      return false;
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      bool result = false;
      if(x) *x = 0;
      if(y) *y = 0;
      return result;
   }

   bool GetJoystickState(int device, Joystick joystick)
   {
      bool result = false;
   #if defined(__linux__)   
      if(joystick && device < 4)
      {
         struct JS_DATA_TYPE js = { 0 };
         memset(joystick, 0, sizeof(Joystick));
         if(joystickFD[device] && read(joystickFD[device], &js, JS_RETURN) == JS_RETURN)
         {
            joystick.buttons = js.buttons;
            joystick.x = js.x - 128;
            joystick.y = js.y - 128;
            result = true;
         }
      }
   #endif   
      return result;
   }

   bool GetKeyState(Key key)
   {
      int keyState = 0;
      return keyState;
   }

   void SetTimerResolution(uint hertz)
   {
      timerDelay = hertz ? (1000000 / hertz) : MAXINT;
      /*
      hiResTimer.Stop();
      if(hertz)
      {
         hiResTimer.delay = 1000000 / hertz;
         hiResTimer.Create();
      }
      */
   }  

   bool SetIcon(Window window, BitmapResource resource)
   {
      if(resource)
      {
         Bitmap bitmap { };
         if(bitmap.Load(resource.fileName, null, null))
         {
            uint * icon = new uint[2 + bitmap.width * bitmap.height];
            bitmap.Convert(null, pixelFormat888, null);
            icon[0] = bitmap.width;
            icon[1] = bitmap.height;
            memcpy(icon + 2, bitmap.picture, bitmap.width * bitmap.height * 4);
            XChangeProperty(xGlobalDisplay, (X11Window)window.windowHandle, atoms[_net_wm_icon],
   			  XA_CARDINAL,32,PropModeReplace, (byte *)icon, 2+bitmap.width*bitmap.height);
           delete icon;
         }
         delete bitmap;
      }
      return true;
   }
}

default dllexport void * __attribute__((stdcall)) IS_XGetDisplay()
{
   return xGlobalDisplay;
}

default dllexport void * __attribute__((stdcall)) IS_XGetWindow(Window window)
{
   return window.windowHandle ? window.windowHandle : window.rootWindow.windowHandle;
}

#endif
