import "ecere"

import remote "Server"

ChatConnection connection;

class Form1 : Window
{
   caption = $"Server";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   minClientSize = { 340, 200 };
   clientSize = { 640, 460 };

   EditBox log { this, anchor = { left = 16, top = 56, right = 26, bottom = 81 }, multiLine = true };
   EditBox serverAddress { this, size = { 182, 27 }, anchor = { top = 16, right = 98 }, contents = "localhost" };
   Button btnConnect
   {
      this, caption = $"Connect", anchor = { top = 24, right = 28 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         connection = ChatConnection
         {
            void NotifyMessage(const String msg)
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
   EditBox message { this, size = { 510, 43 }, anchor = { left = 16, right = 114, bottom = 17 } };
   Button btnSend
   {
      this, caption = $"Send", isDefault = true, size = { 60, 37 }, anchor = { right = 28, bottom = 23 }, disabled = true;

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
