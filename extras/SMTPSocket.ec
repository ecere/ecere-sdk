#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

// define app = ((MyApp)__thisModule);

class SMTPSocket : Socket
{
   bool replied;
   uint OnReceive(const byte * buffer, uint count)
   {
/*#ifdef _DEBUG
      int c;
      for(c = 0; c<count; c++)
         putch(buffer[c]);
#endif*/
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
         Process();
      replied = false;
   }
};

void SMTPSend(char * host, char * to, char * from, File file)
{
   SMTPSocket socket { };
   incref socket;

   if(socket.Connect(host, 25)) //995
   {
      socket.WaitReply();
      Log("HELO localhost\n");
      socket.SendString("HELO localhost\r\n");
      socket.WaitReply();
      Logf("MAIL from: %s\n", from);
      socket.Sendf("MAIL from: %s\r\n", from);
      socket.WaitReply();
      Logf("RCPT To: %s\n", to);
      socket.Sendf("RCPT To: %s\r\n", to);
      socket.WaitReply();
      Log("DATA\n");
      socket.SendString("DATA\r\n");
      socket.WaitReply();
      Log("Subject: Email test\n");
      Log("Mime-Version: 1.0;\n");
      Log("Content-Type: text/html; charset=\"ISO-8859-1\";\n");
      Log("Content-Transfer-Encoding: 7bit;\n");
      socket.SendString("Subject: Email test\r\n");
      socket.SendString("Mime-Version: 1.0;\r\n");
      socket.SendString("Content-Type: text/html; charset=\"ISO-8859-1\";\r\n");
      socket.SendString("Content-Transfer-Encoding: 7bit;\r\n");
      socket.SendString("\r\n");

      file.Seek(0, start);
      while(!file.Eof())
      {
         char buffer[4096];
         uint read = file.Read(buffer, 1, sizeof(buffer));
         socket.Send(buffer, read);
      }

      Log("\n.\n");
      socket.SendString("\r\n.\r\n");
      socket.WaitReply();
      Log("QUIT\n");
      socket.SendString("QUIT\r\n");
      socket.WaitReply();
      socket.Disconnect(0);
   }
   delete socket;
}

/*
class MyApp : GuiApplication
{
   void Main()
   {
      File f = FileOpen("http://server/dir/", read);
      if(f)
         Send("mail.server.ca", "user@mail.com", "user@server.com", f);
      delete f;
      getch();
   }
}
*/
