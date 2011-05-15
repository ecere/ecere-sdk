import "ecere"

class AddThread : Thread
{
   char string[400];
   Seconds delay;

   uint Main()
   {
      Sleep(delay);
      myApp.Lock();
      // MessageBox {}.Modal();
      form1.AddString(string);
      myApp.Unlock();
      return 0;
   }

   void AddItem(char * string, Seconds delay)
   {
      this.delay = delay;
      strcpy(this.string,string);
      Create();
   }
}

class AddPacket : Packet
{
   Seconds delay;
   char string[1];
   // Data follows...
}

class MySocket : Socket
{
   void OnReceivePacket(Packet packet)
   {
      AddPacket addPacket = (AddPacket)packet;
      AddThread{}.AddItem(addPacket.string, addPacket.delay);
   }

   void AddItem(char * string, Seconds delay)
   {
      int len = strlen(string);
      uint size = sizeof(class AddPacket) + len;
      AddPacket packet = (AddPacket)new byte[size];

      packet.size = size;
      packet.delay = delay;
      CopyBytes(packet.string, string, len+1);     
      SendPacket(packet);

      delete packet;
   }
}

class MyServer : Service
{
   void OnAccept()
   {
      MySocket { this };
   }
}

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = Size { 640, 480 };

   Button deleteBtn
   {
      this, text = "Delete", hotKey = del, size = Size { 51, 21 }, position = Point { 424, 152 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         listBox1.DeleteRow(listBox1.currentRow);
         listBox1.Activate();
         return true;
      }
   };
   Button addBtn
   {
      parent = this, text = "Add", isDefault = true, size = Size { 31, 21 }, position = Point { 432, 120 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         socket.AddItem(editBox1.contents, 2);
         //editBox1.Clear();
         return true;
      }
   };
   Button addBtn2
   {
      this, text = "Add2", position = Point { 496, 120 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         socket2.AddItem(editBox1.contents, 0);
         //editBox1.Clear();
         return true;
      }
   };
   ListBox listBox1 
   {
      this, alwaysHighLight = true, text = "listBox1", hasVertScroll = true, size = Size { 172, 268 }, position = Point { 56, 72 };

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         deleteBtn.disabled = row ? false : true;
         return true;
      }
   };
   EditBox editBox1 { parent = this, text = "What to add", contents = "Value", hotKey = w, size = Size { 84, 19 }, position = Point { 304, 120 } };
   Label label1 { labeledWindow = editBox1, parent = this, size = Size { 68, 13 }, position = Point { 304, 96 } };
   MySocket socket {};
   MySocket socket2 {};

   void AddString(char * string)
   {
      DataRow row = null;
      
      /*for(row = listBox1.firstRow; row; row = row.next)
         if(!strcmp(row.string, string))
            break;*/
      if(!row)
      {
         listBox1.AddString(string);
      }
      else
      {
         char temp[256];
         sprintf(temp, "Error: The value \"%s\" is already in the list!", string);
         MessageBox { text = "Test App", contents = temp }.Create();
      }
   }

   bool OnCreate()
   {
      socket.Connect("localhost", 1234);
      socket2.Connect("localhost", 1234);
      return true;
   }
}

Form1 form1 {};

MyServer server { port = 1234 };

class MyApplication : GuiApplication
{
   bool Init()
   {
      myApp = this;
      server.Start();
      return true;
   }
}

MyApplication myApp;
