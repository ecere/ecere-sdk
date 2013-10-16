import "ecere"
import "console"

static IRCSocket ircSocket { };
static Console console
{
   text = "Ecere IRC Client";
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   borderStyle = sizable;
   anchor = { 0, 0, 0, 0 };
   background = black;

   alpha = 255;
   logTextColor = white;
   editTextColor = white;
   editHeight = 16;
   // height = 480;
   referenceHeight = 480;

   bool ProcessCommand(char * command)
   {
      bool result = false;
      char *tokens[10];
      int count = Tokenize(command, 10, tokens, false);


      // ==== OFFLINE ====

      // Exit
      if(!strcmp(tokens[0], "/exit"))
      {
         ((GuiApplication)__thisModule).desktop.Destroy(0);
         result = true;
      }

      // Server
      else if(!strcmp(tokens[0], "/server"))
      {
         if(count > 1)
         {
            //ircSocket = eSocket_Connect("paris.fr.eu.undernet.org", 6667, OnConnect, null);
            //ircSocket = eSocket_Connect("irc2.magic.ca", 6667, OnConnect, null);
            ircSocket.Connect(tokens[1], 6667);
         }
      }

      // ==== ONLINE ====
      else if(ircSocket)
      {
         char sendbuf[1024];

         // nick
         if(!strcmpi(tokens[0], "/nick"))
         {
            ircSocket.Sendf( "NICK %s\n", tokens[1]);
            ircSocket.Sendf("USER %s %s %s %s\n", tokens[1], tokens[1], tokens[1], tokens[1]);
         }

         // msg
         else if(!strcmpi(tokens[0], "/msg"))
         {
            int c;
            sprintf(sendbuf, "PRIVMSG %s :", tokens[1]);
            for(c = 2; c<count; c++)
            {
               strcat(sendbuf, " ");
               strcat(sendbuf, tokens[c]);
            }
            strcat(sendbuf, "\n");
            ircSocket.SendString(sendbuf);
         }

         // quit
         else if(!strcmpi(tokens[0], "/quit"))
         {
            int c;
            strcpy(sendbuf, "QUIT :");
            for(c = 1; c<count; c++)
            {
               strcat(sendbuf, " ");
               strcat(sendbuf, tokens[c]);
            }
            strcat(sendbuf, "\n");
            ircSocket.SendString(sendbuf);
         }

         // join or j
         else if(!strcmpi(tokens[0], "/join") || !strcmp(tokens[0], "/j"))
         {
            if (count > 1)
            {
               strcpy(sendbuf, "JOIN ");
               if (tokens[1][0] != '#' && tokens[1][0] != '&')
               {
                  strcat(sendbuf, "#");
               }
               strcat(sendbuf, tokens[1]);
            }
            strcat(sendbuf, "\n");
            ircSocket.SendString(sendbuf);
         }

         // AUTRE
         else
         {
            int c;
            strcpy(sendbuf, tokens[0]);
            for(c = 1; c<count; c++)
            {
               strcat(sendbuf, " ");
               strcat(sendbuf, tokens[c]);
            }
            strcat(sendbuf, "\n");
            ircSocket.SendString(sendbuf);
         }
      }
      return result;
   }
};

static const char * const_NickName = "[User1491]";

class IRCSocket : Socket
{
   uint OnReceive(byte * recvBuffer, uint recvCount)
   {
      int count;
      byte buffer[513];
      byte *tokens[10];

      count = Min(recvCount, 512);
      memcpy(buffer, recvBuffer, count);
      buffer[count] = 0;

      // console.Log("\n");
      console.Log(buffer);


   /*   // Auto connect login Script
      if(!strcmpi(buffer, "NOTICE AUTH :*** Got ident response"))
      {
         ircSocket.Sendf("NICK %s\n", const_NickName );
         ircSocket.Sendf("USER %s %s %s %s\n", const_NickName , const_NickName, const_NickName , const_NickName );
      }

      else*/ if(Tokenize(buffer, 10, tokens, false))
      {
         // ping
         if(!strcmp(tokens[0], "PING"))
         {
            Sendf("PONG %s", tokens[1]);
         }

      }
      return count;
   }

   void OnDisconnect(int code)
   {
      ircSocket = null;
   }

   void OnConnect()
   {
      ircSocket.Sendf("NICK %s\n", const_NickName );
      ircSocket.Sendf("USER %s %s %s %s\n", const_NickName, const_NickName, const_NickName , const_NickName );

   }
}

class IdentSocket : Socket
{
   uint OnReceive(byte * recvBuffer, uint recvCount)
   {
      int count;
      byte buffer[1024];
      count = Min(recvCount, 1023);
      memcpy(buffer, recvBuffer, count);
      if(count > 1)
      {
         buffer[count-2] = 0;
         console.Log("\nIDENT:");
         console.Log(buffer);
         Sendf("%s : USERID : OTHER : jerome\n", buffer);
      }
      return count;
   }
}

class IdentService : Service
{
   port = 113;
   void OnAccept()
   {
      IdentSocket { this };
   }
}

static IdentService identService { };

class IRCApp : GuiApplication
{
   bool Init()
   {
      identService.Start();
      return true;
   }
}
