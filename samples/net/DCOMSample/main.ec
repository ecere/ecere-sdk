import "ecere"

import remote "Server"

ChatConnection connection;

class Form1 : Window
{
   text = "Server";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   EditBox log { this, size = { 598, 323 }, position = { 16, 56 }, multiLine = true };
   EditBox serverAddress { this, contents = "localhost", size = { 182, 27 }, position = { 360, 16 } };
   Button btnConnect
   {
      this, text = "Connect", position = { 560, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         connection = ChatConnection
         {
            void NotifyMessage(String msg)
            {
               form1.log.PutS(" < ");
               form1.log.PutS(msg);
               form1.log.PutS("\n");
            }

            void OnDisconnect(int code)
            {
               DCOMClientObject::OnDisconnect(code);
               if(form1)
                  form1.btnSend.disabled = true;
            }
         };
         if(connection.Connect(serverAddress.contents, 1494))
         {
            connection.Join();
            btnSend.disabled = false;
         }
         return true;
      }
   };
   Button btnHost 
   {      
      this, text = "Host", position = { 32, 16 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         chatService.Start();
         return true;
      }
   };
   EditBox message { this, size = { 510, 43 }, position = { 16, 400 } };
   Button btnSend 
   {      
      this, text = "Send", isDefault = true, size = { 60, 37 }, position = { 552, 400 };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(serverConnection)
            SendBackMessage(message.contents);
         else
            connection.SendMessage(message.contents);
         log.PutS(" > ");
         log.PutS(message.contents);
         log.PutS("\n");
         message.Clear();
         return true;
      }
   };
}

Form1 form1 {};

DCOMService chatService { port = 1494 };
