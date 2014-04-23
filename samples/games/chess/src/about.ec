import "chess.ec"

class AboutChess : Window
{
   background = black; 
   foreground = white, size = Size { 440, 200 }, hasClose = true,
   text = APPNAME;

   Button ok
   {
      this, isDefault = true, text = "OK", 
      anchor = { bottom = 10 }, size = { 80 };

      NotifyClicked = ButtonCloseDialog;
   };

   Picture picture
   {
      this, position = { 0, 10 }, image = { ":aboutPic.jpg" },
      size = { 180, 130 }
   };

   void OnRedraw(Surface surface)
   {
      surface.WriteTextf(200, 30, "Copyright (c) 1996-2005");
      surface.WriteTextf(200, 50, "   Jerome Jacovella-St-Louis");
      surface.WriteTextf(200, 70, "Models Copyright (c) 2004");
      surface.WriteTextf(200, 90, "   Gaetan Loyer");
   }
}
