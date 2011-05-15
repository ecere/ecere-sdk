/****************************************************************************
   ECERE Runtime Library

   Copyright (c) 2001-2008 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   console.ec - Console Dialog
****************************************************************************/
import "ecere"

#include <stdarg.h>

class Console : Window
{
   EditBox log
   {
      this,
      readOnly = true;
      multiLine = true;
      textHorzScroll = true;
      textVertScroll = true;
      autoEmpty = true;
      maxNumLines = 256;
   };
   EditBox commandBox
   {
      this, textHorzScroll = true; size.h = editHeight, anchor = { left = 0, right = 0, bottom = 0 };
   };
   virtual bool ProcessCommand(char * command);

   Bitmap bitmap;
   OldList commands;
   Item command;
   bool doneLooping;
   char currentCommand[256];
   int movement;
   bool moving;
   int actualHeight;
   double pos;
   double lastTime;
   int currentAlpha;
   bool shown;

   int separatorHeight;
   int editHeight;
   int referenceHeight;
   float speed;
   int alpha;
   char * version;
   Point verLROffset;
   Color logTextColor;
   char * bmpFile;
   Color editBackColor;
   Color editTextColor;

   Timer timer
   {
      this, delay = 0.05;

      bool DelayExpired()
      {
         double realTime, diffTime;

         realTime = GetTime();
         diffTime = realTime - lastTime;

         /* CONSOLE MOVEMENT */
         if(shown && moving)
         {
            int movement = (int)(diffTime * (movement * speed));

            if(movement)
            {
               pos += movement;
               pos = Max(pos, -size.h);
               pos = Min(pos, 0);
               if(pos == -size.h && movement == -1)
               {
                  // eWindow_Hide(window, true, false);
                  moving = false;
                  shown = false;
               }
               else if(moving)
                  Move(position.x, (int)pos, clientSize.w, clientSize.h);
               if(!pos && movement == 1)
                  moving = false;

               // Set up transparency color
               if(size.h)
                  currentAlpha = (((int)pos + size.h) * alpha / size.h);

               log.foreground = (logTextColor & 0xFFFFFF) | (currentAlpha << 24);
               if(alpha)
               {
                  commandBox.foreground = (editTextColor & 0xFFFFFF) | ((currentAlpha * 255 / alpha) << 24);
               }
               commandBox.background = (editBackColor & 0xFFFFFF) | (currentAlpha << 24);
               lastTime = realTime;
            }
         }
         return true;
      }
   };
   bool OnCreate()
   {
      if(speed)
         timer.Start();
      commands.Clear();
      commands.circ = true;
      movement = 1;
      doneLooping = true;
      log.anchor = { left = 0, top = 0, right = 0, bottom = editHeight + separatorHeight* 768/referenceHeight };
      return true;
   }

   bool OnPostCreate()
   {
      int editHeight;

      if(referenceHeight)
      {
         // h = height * 768 / referenceHeight;

         // Set up transparency color
         currentAlpha = (((int)pos + size.h) * alpha / size.h);
      }
      else
         referenceHeight = 768;

      editHeight = editHeight * 768 / referenceHeight;

      log.background = 0;

      log.foreground = (logTextColor & 0xFFFFFF) | (currentAlpha << 24);
      if(alpha)
         commandBox.foreground = (editTextColor & 0xFFFFFF) | ((currentAlpha * 255 / alpha) << 24);
      commandBox.background = (editBackColor & 0xFFFFFF) | (currentAlpha << 24);
      return true;
   }

   void OnDestroy()
   {
      commands.Free(null);
   }

   bool OnLoadGraphics()
   {
      if(bmpFile)
         bitmap.Load(bmpFile, null, displaySystem);
      return true;
   }

   void OnUnloadGraphics()
   {
      bitmap.Free();
   }

   void OnRedraw(Surface surface)
   {
      surface.SetForeground(white);
      if(bitmap)
         surface.Stretch(bitmap, 0, 0, 0, 0, clientSize.w, clientSize.h, bitmap.width, bitmap.height);
      if(referenceHeight)
      {
         surface.SetForeground((logTextColor & 0xFFFFFF) | (currentAlpha << 24));
         if(version)
            surface.WriteTextf(
               clientSize.w - verLROffset.x * 768 / referenceHeight,
               clientSize.h - verLROffset.y * 768 / referenceHeight, 
               version);
      }
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch((SmartKey)key)
      {
         case tilde:
            Toggle();
            return false;
         case enter:
         {
            Item string;
            char * lineBuffer;
            char * buffer;

            // Process Command in command edit box here
            lineBuffer = commandBox.line.text;

            if(lineBuffer && lineBuffer[0])
            {
               string = (Item)new0 byte[sizeof(class Item) + strlen(lineBuffer) + 1];
               if(string)
               {
                  commands.Add(string);
                  buffer = (char *) ((byte *) string + sizeof(class Item));
                  strcpy(buffer, lineBuffer);
                  command = commands.first;
                  doneLooping = true;
               }
               log.PutCh('\n');
               log.PutS(" > ");
               log.PutS(lineBuffer);
               if(ProcessCommand)
               {
                  if(ProcessCommand(lineBuffer))
                     return false;
               }
               if(commandBox)
                  commandBox.Clear();
            }
            break;
         }
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      char * lineBuffer = commandBox.line.text;
      char * buffer;

      switch((SmartKey)key)
      {
         case pageDown:
            log.PageDown();
            return true;
         case pageUp:
            log.PageUp();
            return false;
         case up:
            if(command)
            {
               buffer = (char *) ((byte *) command + sizeof(class Item));
               if(strcmp(buffer, lineBuffer))
               {
                  strcpy(currentCommand, lineBuffer);
               }
               if(command == commands.first && !doneLooping)
               {
                  doneLooping = true;
                  commandBox.Clear();
                  commandBox.PutS(currentCommand);
               }
               else
               {
                  doneLooping = false;
                  command = command.prev;
                  commandBox.Clear();
                  commandBox.PutS(((byte *) command) + sizeof(class Item));
               }
            }
            return false;
         case down:
            if(command)
            {
               buffer = (char *) ((byte *) command + sizeof(class Item));
               if(strcmp(buffer, lineBuffer))
               {
                  strcpy(currentCommand, lineBuffer);
               }
               if(command == commands.last && !doneLooping)
               {
                  doneLooping = true;
                  commandBox.Clear();
                  commandBox.PutS(currentCommand);
               }
               else
               {
                  doneLooping = false;
                  command = command.next;
                  commandBox.Clear();
                  commandBox.PutS(((byte *) command) + sizeof(class Item));
               }
            }
            return false;
         case tilde:
            return false;
   /*      case F6:
            return false;*/
      }
      return true;
   }

   void Toggle()
   {
      if(this)
      {
         movement = -movement;
         moving = true;
         shown = true;
         SetState(normal, true, 0);
         commandBox.Activate();
         lastTime = GetTime();
      }
   }

   void Log(char * format, ...)
   {
      if(this)
      {
         char text[MAX_F_STRING];
         va_list args;

         va_start(args, format);
         vsprintf(text, format, args);
         log.PutS(text);
         va_end(args);
      }
   }
};
