namespace gui::dialogs;

import "Window"

static class MsgLine : struct
{
   MsgLine prev, next;
   char * string;
   int len;
};

public enum MessageBoxType { ok, yesNo, okCancel, yesNoCancel };
public class MessageBox : Window
{
   background = activeBorder;
   hasClose = true;
   tabCycle = true;

public:
   property MessageBoxType type { set { style = value; } };
   property char * contents
   {
      set
      {
         FreeLines();
         if(value)
         {
            int len = strlen(value);
            int start = 0;
            int c;
            for(c = 0; c <= len; c++)
            {
               if(c == len || value[c] == '\n')
               {
                  MsgLine line { };
                  lines.Add(line);
                  if(line)
                  {
                     line.len = c - start;
                     line.string = new char[line.len+1];
                     CopyBytes(line.string, value + start, line.len);
                     line.string[line.len] = '\0';
                     start = c+1;
                  }
               }
            }
         }
      }
   }; 

private:
   MessageBoxType style;
   OldList lines;
   int totalWidth, totalHeight, lineHeight;

   ~MessageBox()
   {
      FreeLines();
   }

   bool ButtonActivate(Window control, bool active, Window previous)
   {
      control.isDefault = true;
      return true;
   }

   bool OnPostCreate()
   {
      switch(style)
      {
         case yesNo:
            Button
            {
               this, text = "No", anchor = { horz = 40, bottom = 7 }, size = { 64 }, id = DialogResult::no, hotKey = n;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();

            Button
            {
               this, isDefault = true, text = "Yes", anchor = { horz = -40, bottom = 7 }, size = { 64 }, id = DialogResult::yes, hotKey = y;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();
            break;
         case okCancel:
            Button
            {
               this, text = "Cancel", anchor = { horz = 40, bottom = 7 }, size = { 64 }, id = DialogResult::cancel, hotKey = escape;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();

            Button
            {
               this, isDefault = true, text = "OK", anchor = { horz = -40, bottom = 7 }, size = { 64 }, id = DialogResult::ok, hotKey = o;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();
            break;
         case yesNoCancel:
            Button
            {
               this, text = "No", anchor = { bottom = 7 }, size = { 64 }, id = DialogResult::no, hotKey = n;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();

            Button
            {
               this, text = "Cancel", anchor = { horz = 72, bottom = 7 }, size = { 64 }, id = DialogResult::cancel, hotKey = escape;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();

            Button
            {
               this, isDefault = true, text = "Yes", anchor = { horz = -72, bottom = 7 }, size = { 64 }, id = DialogResult::yes, hotKey = y;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();
            break;
         case ok:
            Button
            {
               this, isDefault = true, text = "OK", anchor = { bottom = 7 }, size = { 64 }, id = DialogResult::ok, hotKey = o;
               NotifyClicked = ButtonCloseDialog, NotifyActivate = ButtonActivate;
            }.Create();
            break;
      }
      return true;
   }

   bool OnResizing(int *w, int *h)
   {
      if(style == yesNoCancel)
         *w = Max(*w, Max(totalWidth, 208) + 24);
      else
         *w = Max(*w, Max(totalWidth, 144) + 24);

      *h = Max(*h, Max(totalHeight, 33) + 40);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      MsgLine line;
      int y = (clientSize.h - 33 - totalHeight) / 2;
      for(line = lines.first; line; line = line.next)
      {
         surface.WriteText((clientSize.w - totalWidth) / 2, y, line.string, line.len);
         y += lineHeight;
      }
   }

   bool OnLoadGraphics()
   {
      MsgLine line;

      totalHeight = 0;
      for(line = lines.first; line; line = line.next)
      {
         Size size;
         if(!line.string[0])
            display.FontExtent(fontObject, " ", 1, (int *)&size.w, (int *)&size.h);
         else
            display.FontExtent(fontObject, line.string, strlen(line.string), (int *)&size.w, (int *)&size.h);
         if(size.h)
            lineHeight = size.h;
         totalWidth = Max(totalWidth, size.w);
         totalHeight += size.h;
      }
      return true;
   }

   void FreeLines()
   {
      MsgLine line;
      for(line = lines.first; line; line = line.next)
         delete line.string;
      lines.Free(null);
   }
};
