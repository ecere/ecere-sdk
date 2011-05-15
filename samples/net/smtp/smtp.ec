import "ecere"

define app = ((MyApp)__thisModule);

class SMTPSocket : Socket
{
   bool replied;
   uint OnReceive(const byte * buffer, uint count)
   {
      int c;
      for(c = 0; c<count; c++)
      {
         //putch(buffer[c]);
         putc(buffer[c]);
      }
      replied = true;
      return count;
   }
   void OnDisconnect(int code)
   {
      replied = true;      
   }
   void WaitReply()
   {
      while(!replied)
      {
         app.WaitNetworkEvent();
         app.ProcessNetworkEvents();
      }
      replied = false;
   }
};

void Send(char * host, char * to, char * from, File file)
{
   SMTPSocket socket { };
   incref socket;

   if(socket.Connect(host, 25))
   {
      socket.WaitReply();
      socket.SendString("HELO localhost\n");
      socket.WaitReply();
      socket.Sendf("MAIL from: %s\n", from); 
      socket.WaitReply();
      socket.Sendf("RCPT To: %s\n", to); 
      socket.WaitReply();
      socket.SendString("DATA\n"); 
      socket.WaitReply();
      socket.SendString("Subject: Email test\n");
      socket.SendString("Content-Type: text/html; charset=Windows-1252\n");
     
      file.Seek(0, start);
      while(!file.Eof())
      {
         char buffer[4096];
         uint read = file.Read(buffer, 1, sizeof(buffer));
         socket.Send(buffer, read);
      }
      socket.SendString("\r\n");
      socket.SendString(".\r\n");
      socket.WaitReply();
      socket.SendString("QUIT\r\n");
      socket.Disconnect(0);
   }
   delete socket;
}

class MyApp : GuiApplication
{
   void Main()
   {
      File f = FileOpen("http://www.ecere.com/", read);
      if(f)
         Send("mail.mailserver.com", "destaddress@destdomain.com", "srcaddress@srcdomain.com", f);
      delete f;
      getch();
   }   
}
