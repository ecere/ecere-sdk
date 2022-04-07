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

import "base64"

static void emailFile(SMTPSocket socket, File file, const String contentType, const String fileName)
{
   bool base64 = !contentType || (strcmpi(contentType, "text/plain") && strcmpi(contentType, "text/html"));
   TempFile base64TmpFile = null;

   socket.Sendf("Content-Type: %s; charset=UTF-8%s%s%s\r\n", contentType,
      fileName ? "; name=\"" : "", fileName ? fileName : "", fileName ? "\"" : "");
   if(fileName)
      socket.Sendf("Content-Disposition: attachment; filename=\"%s\"\r\n", fileName);
   socket.Sendf("Content-Transfer-Encoding: %s\r\n\r\n", base64 ? "base64" : "7bit");

   if(base64)
   {
      byte * inBuffer = null;
      uint inSize, outSize;
      bool freeInBuffer = false;

      base64TmpFile = { };

      if(eClass_IsDerived(file._class, class(TempFile)))
      {
         TempFile tf = (TempFile)file;
         inSize = tf.size;
         inBuffer = tf.buffer;
      }
      else
      {
         inSize = (uint)file.GetSize();
         inBuffer = new byte[inSize];
         freeInBuffer = true;
         file.Seek(0, start);
         file.Read(inBuffer, 1, inSize);
      }

      outSize = (inSize / 3) * 4;
      base64TmpFile.buffer = new byte[outSize + 4];
      base64TmpFile.size = Base64Encode(inBuffer, inSize, (char *)base64TmpFile.buffer);

      if(freeInBuffer) delete inBuffer;

      file = base64TmpFile;
   }

   file.Seek(0, start);
   while(!file.Eof())
   {
      char buffer[998];
      uint read = file.GetLineEx(buffer, 998, null);
      socket.Send(buffer, read);
      if(!file.Eof())
         socket.Send("\r\n", 2);
   }

   delete base64TmpFile;
}

bool SMTPSend(const String host, int port, const String localHost, Array<String> recipients, const String from, const String fromName, const String replyTo,
   const String subject, File file, const String contentType, Container<File> attachments, Container<const String> attContentTypes, Container<const String> attFileNames)
{
   bool result = true;
   bool first = true;
   for(r : recipients; result && r)
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
         socket.SendString("MIME-Version: 1.0\r\n");
         socket.Sendf("Subject: %s\r\n", subject);
         if(fromName)
            socket.Sendf("From: \"%s\" <%s>\r\n", fromName, from);
         if(replyTo)
            socket.Sendf("Reply-To: <%s>\r\n", replyTo);
         if(attachments && attachments.GetCount())
         {
            int i = 0;

            socket.Sendf("Content-Type: multipart/mixed; boundary=\"----------A91SHJla127JHA4S813KHJ213AHJ\"\r\n");
            socket.Sendf("This is a multi-part message in MIME format.\r\n");
            if(file)
            {
               socket.Sendf("------------A91SHJla127JHA4S813KHJ213AHJ\r\n");
               emailFile(socket, file, contentType, null);
               socket.SendString("\r\n");
            }
            for(a : attachments)
            {
               socket.Sendf("------------A91SHJla127JHA4S813KHJ213AHJ\r\n");
               emailFile(socket, a,
                  attContentTypes && i < attContentTypes.GetCount() ? attContentTypes[i] : null,
                  attFileNames && i < attFileNames.GetCount() ? attFileNames[i] : null);
               i++;
            }
            socket.Sendf("\r\n\r\n------------A91SHJla127JHA4S813KHJ213AHJ--\r\n");
         }
         else if(file)
         {
            emailFile(socket, file, contentType, null);
            socket.SendString("\r\n");
         }

         socket.SendString("\r\n.\r\n");
         socket.WaitReply();
         socket.SendString("QUIT\r\n");
         socket.WaitReply();
         socket.Disconnect(0);
      }
      else
         result = false;
      delete socket;
   }
   return result;
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
