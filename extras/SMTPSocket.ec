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

void SMTPSend(const String host, int port, const String localHost, Array<String> recipients, const String from, const String fromName, const String replyTo,
   const String subject, File file, const String contentType)
{
   bool first = true;
   for(r : recipients; r)
   {
      const String to = r;
      // TOCHECK: Should we re-use the socket / not disconnect?
      SMTPSocket socket { };
      incref socket;

      if(!first) Sleep(0.1);
      first = false;

      if(socket.Connect(host, port)) //25 // 995
      {
         socket.WaitReply();
         socket.Sendf("HELO %s\r\n", localHost);
         socket.WaitReply();
         socket.Sendf("MAIL from: <%s>\r\n", from);
         socket.WaitReply();
         socket.Sendf("RCPT To: %s\r\n", to);
         socket.WaitReply();
         socket.SendString("DATA\r\n");
         socket.WaitReply();
         socket.SendString("Mime-Version: 1.0;\r\n");
         socket.Sendf("Content-Type: %s; charset=\"UTF-8\";\r\n", contentType);
         socket.SendString("Content-Transfer-Encoding: 7bit;\r\n");
         socket.Sendf("Subject: %s\r\n", subject);
         if(fromName)
            socket.Sendf("From: \"%s\" <%s>\r\n", fromName, from);
         if(replyTo)
            socket.Sendf("Reply-To: <%s>\r\n", replyTo);
         socket.SendString("\r\n");

         file.Seek(0, start);
         while(!file.Eof())
         {
            char buffer[4096];
            uint read = file.Read(buffer, 1, sizeof(buffer));
            socket.Send(buffer, read);
         }

         socket.SendString("\r\n.\r\n");
         socket.WaitReply();
         socket.SendString("QUIT\r\n");
         socket.WaitReply();
         socket.Disconnect(0);
      }
      delete socket;
   }
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
