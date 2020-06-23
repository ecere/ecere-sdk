import "ecere"

class LinkLabel : Label
{
   char * url;
   public property const char * url
   {
      set { delete url; url = CopyString(value); }
      get { return url; }
   }
   ~LinkLabel() { delete url; }
   font = { "Incosolata", 10, bold = true, underline = true };
   foreground = blue;
   cursor = ((GuiApplication)__thisModule.application).GetCursor(hand);

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(url) ShellOpen(url);
      return true;
   }
};

class About : Window
{
   caption = "Link Demo";
   hasClose = true;
   size = { 200, 80 };

   LinkLabel
   {
      this, position = { 10,  10 };
      caption = "www.ecere.com";
      url = "http://www.ecere.com/";
   };
}

About about {};
