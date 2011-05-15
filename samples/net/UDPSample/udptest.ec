import "ecere"

class MySocket : Socket
{
   void OnConnect()
   {
      printf("Connected!\n");
   }
   
}

MySocket socket { };

class UDPTest : GuiApplication
{
   bool Init()
   {
      socket.DatagramHost(100);
      return true;
   }
}

class Test : Window
{
   text = "Test";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Button button1
   {
      this, text = "Connect", position = { 288, 128 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         MySocket socket { };
         socket.DatagramConnect("localhost", 100);
         return true;
      }
   };
}

Test test { };
