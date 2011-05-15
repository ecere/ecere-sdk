namespace gui;

import "Window"

// Key to character mapping
static byte characters[2][128] =
{
   {
      128,128,'1','2','3','4','5','6','7','8','9','0','-','=',128,128,
      'q','w','e','r','t','y','u','i','o','p','[',']',128,128,'a','s',
      'd','f','g','h','j','k','l',';','\'','`',128,'\\','z','x','c','v',
      'b','n','m',',','.','/',128,'*',128,' ',128,128,128,128,128,128,
      128,128,128,128,128,128,128,'7','8','9','-','4','5','6','+','1',
      '2','3','0',128,128,128,128,128,128,128,128,128,128,128,128,128,
      128,128,'/',128,128,128,128,128,128,128,128,128,128,128,128,128,
      128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
   },
   {
      128,128,'!','@','#','$','%','^','&','*','(',')','_','+',128,128,
      'Q','W','E','R','T','Y','U','I','O','P','{','}',128,128,'A','S',
      'D','F','G','H','J','K','L',':','"','~',128,'|','Z','X','C','V',
      'B','N','M','<','>','?',128,'*',128,' ',128,128,128,128,128,128,
      128,128,128,128,128,128,128,'7','8','9','-','4','5','6','+','1',
      '2','3','0',128,128,128,128,128,128,128,128,128,128,128,128,128,
      128,128,'/',128,128,128,128,128,128,128,128,128,128,128,128,128,
      128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
   }
};

public struct Joystick
{
   int x,y,z;
   int rx,ry,rz;
   uint buttons;
//   int slider[2];
//   uint pov[4];
};

public class Interface
{
public:
   class_data char * name;

   class_property char * name
   {
      set { class_data(name) = value; }
      get { return class_data(name); }
   }

   // --- User Interface System ---
   virtual bool ::Initialize();
   virtual void ::Terminate();
   virtual bool ::ProcessInput(bool processAll);
   virtual void ::Wait();
   virtual void ::Lock(Window window);
   virtual void ::Unlock(Window window);
   virtual void ::SetTimerResolution(uint hertz);

   virtual char ** ::GraphicsDrivers(int * numDrivers);
   virtual void ::EnsureFullScreen(bool * fullScreen);
   virtual void ::GetCurrentMode(bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate);
   virtual bool ::ScreenMode(bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode);

   // --- Window Creation ---
   virtual void * ::CreateRootWindow(Window window);
   virtual void ::DestroyRootWindow(Window window);

   // --- Window manipulation ---
   virtual void ::SetRootWindowCaption(Window window, char * name);
   virtual void ::PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize);
   virtual void ::OffsetWindow(Window window, int * x, int * y);
   virtual void ::UpdateRootWindow(Window window);
   virtual void ::SetRootWindowState(Window window, WindowState state, bool visible);
   virtual void ::ActivateRootWindow(Window window);
   virtual void ::OrderRootWindow(Window window, bool topMost);
   virtual void ::SetRootWindowColor(Window window);
   virtual void ::FlashRootWindow(Window window);

   // --- Mouse-based window movement ---
   virtual void ::StartMoving(Window window, int x, int y, bool fromKeyBoard);
   virtual void ::StopMoving(Window window);

   // --- Mouse manipulation ---
   virtual void ::GetMousePosition(int *x, int *y);
   virtual void ::SetMousePosition(int x, int y);
   virtual void ::SetMouseRange(Window window, Box box);
   virtual void ::SetMouseCapture(Window window);

   // --- Mouse cursor ---
   virtual void ::SetMouseCursor(SystemCursor cursor);

   // --- Caret manipulation ---
   virtual void ::SetCaret(int caretX, int caretY, int size);

   // --- Clipboard manipulation ---
   virtual void ::ClearClipboard();
   virtual bool ::AllocateClipboard(ClipBoard clipBoard, uint size);
   virtual bool ::SaveClipboard(ClipBoard clipBoard);
   virtual bool ::LoadClipboard(ClipBoard clipBoard);
   virtual void ::UnloadClipboard(ClipBoard clipBoard);

   // --- State based input ---
   virtual bool ::AcquireInput(Window window, bool state);
   virtual bool ::GetMouseState(MouseButtons * buttons, int * x, int * y);
   virtual bool ::GetJoystickState(int device, Joystick joystick);
   virtual bool ::GetKeyState(Key key);

   virtual bool ::SetIcon(Window window, BitmapResource icon);
   virtual void ::GetScreenArea(Window window, Box box);

   Key ::GetExtendedKey(Key key)
   {
      switch(key)
      {
         case keyPadHome:     return home;
         case keyPadUp:       return up;
         case keyPadPageUp:   return pageUp;
         case keyPadLeft:     return left;
         case keyPadRight:    return right;
         case keyPadEnd:      return end;
         case keyPadDown:     return down;
         case keyPadPageDown: return pageDown;
         case keyPadInsert:   return insert;
         case keyPadDelete:   return del;
         case enter:          return keyPadEnter;
         case leftControl:    return rightControl;
         case leftAlt:        return rightAlt;
         case slash:          return keyPadSlash;
         case numLock:        return numLock;
         case scrollLock:     return pauseBreak;
      }
      return 0;
   }

   void ::WriteKeyedTextDisabled(Surface surface, int x, int y, char *text, Key hotKey, bool disabled)
   {
      if(text)
      {
         char * tab = strstr(text, "\t");
         bool opacity = surface.textOpacity;
         if(guiApp.textMode)
         {
            disabled = false;
            surface.SetForeground(guiApp.currentSkin.disabledFrontColor);
         }
         if(tab)
         {
            int len = strlen(tab+1),tw;
            surface.TextExtent(tab+1, strlen(tab + 1), &tw, null);

            if(disabled)
            {
               surface.SetForeground(guiApp.currentSkin.disabledBackColor);
               surface.WriteText(x+1,y+1, text,tab-text);
               surface.WriteText(surface.width - 3 - tw - 12 + 1, y + 1,tab+1,len);
               surface.SetForeground(guiApp.currentSkin.disabledFrontColor );
               
               surface.TextOpacity(false);
            }
            surface.TextOpacity(false);
            surface.WriteText(x,y, text,tab-text);
            surface.WriteText(surface.width - 3 - tw - 12, y,tab+1,len);
            surface.TextOpacity(opacity);
         }
         else
         {
            if(disabled)
            {
               surface.SetForeground(guiApp.currentSkin.disabledBackColor);
               surface.WriteText(x+1,y+1, text,strlen(text));
               surface.SetForeground(guiApp.currentSkin.disabledFrontColor);
               surface.TextOpacity(false);
            }
            surface.WriteText(x,y, text, strlen(text));
            surface.TextOpacity(opacity);
         }
         if(hotKey)
         {
            char ch;
            int c;
            bool firstLetter;
            char * tab = strchr(text, '\t');
            
            // Look for an uppercase letter starting a word
            firstLetter = true;
            ch = isalpha(characters[1][hotKey.code]) ? characters[1][hotKey.code] : characters[0][hotKey.code];
            for(c = 0; text[c] && text[c] != '\t'; c++)
            {
               if(toupper(text[c]) == ch && firstLetter)
                  break;
               else if(text[c] == ' ')
                  firstLetter = true;
               else
                  firstLetter = false;
            }

            // Look for an uppercase letter anywhere
            if(!text[c] || text[c] == '\t')
            {
               char * string = strchr(text, ch);
               if(string && (!tab || string < tab)) c = string - text;
            }

            // Look for a lowercase letter starting a word
            if(!text[c] || text[c] == '\t')
            {
               firstLetter = true;
               ch = characters[0][hotKey.code];
               for(c = 0; text[c] && text[c] != '\t'; c++)
               {
                  if(tolower(text[c]) == ch && firstLetter)
                     break;
                  else if(text[c] == ' ')
                     firstLetter = true;
                  else
                     firstLetter = false;
               }
            }

            // Look for a lowercase letter anywhere
            if(!text[c] || text[c] == '\t')
            {
               char * string = strchr(text, characters[0][hotKey.code]);
               if(string && (!tab || string < tab)) c = string - text;
            }

            if(text[c] && text[c] != '\t')
            {
               int tw, cw, ch;
               surface.TextExtent(text, (int)c, &tw, null);
               surface.TextExtent(text + c, 1, &cw, &ch);
               if(!guiApp.textMode)
               {
                  if(disabled)
                  {
                     surface.SetForeground(guiApp.currentSkin.disabledBackColor);
                     surface.HLine(x + tw + 1, x + tw + cw-1 + 1, y + ch-1 + 1);
                     surface.SetForeground(guiApp.currentSkin.disabledFrontColor);
                  }
                  surface.HLine(x + tw, x + tw + cw-1, y + ch-1);
               }
               else
               {
                  surface.SetForeground(Color { 255,255,85 });
                  surface.WriteText(x + c * textCellW, y, text + c, 1);
               }
            }
         }
      }
   }

   void ::WriteKeyedText(Surface surface, int x, int y, char *text, Key hotKey)
   {
      WriteKeyedTextDisabled(surface, x, y, text, hotKey, false);
   }

   char ::TranslateKey(Key key, bool shift)
   {
      return characters[shift][key];
   }
};
