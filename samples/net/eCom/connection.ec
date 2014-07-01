import "ecere"
import "mainPanel"

class MainPanel;
class ConnectionSocket;

define ECOMMUNICATOR_PROTOCOL_VERSION = 1;

enum PacketType { Connect = 1, Send, Receive, Message, Name, Data, DataAck };
enum Status { Ok, Done, Abort, OutOfSpace };

struct eComPacket
{
   PacketType type;
   uint dataSize;
   union
   {
      struct
      {
         uint version;
      } connect;
      struct
      {
         FileSize fileSize;
         // File Name (dataSize BYTEs)
      } send;
      struct
      {
         uint position;
      } recv;
      struct
      {
         Status status;
      } ack;
      struct
      {
         Status status;
         // File Data (dataSize BYTEs)
      } data;
      struct
      {
         bool over;
         // Message Data (dataSize BYTEs)
      } msg;
      // Name : Name (dataSize BYTEs)
   };
};

// define DATA_BLOCK_SIZE = 4096;
define DATA_BLOCK_SIZE = 65536;

class Connection : Window
{
   borderStyle = sizable, hasClose = true, hasMinimize = true, showInTaskBar = true, size = Size { 580, 600 },
   minClientSize = Size { 300, 440 }, tabCycle = true, background = activeBorder;

   Button close
   {
      this, text = "Close", size = Size { 80, 0 }, anchor = Anchor { right = 10, bottom = 5 }, hotKey = altC;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };
   Label { this, text = "[=== UPLOAD ===]", position = Point { 10, 10 } };
   EditBox sendFile
   {
      this, textHorzScroll = true, text = "Send File", size.h = 20, anchor = Anchor { left = 10, top = 40, right = 190 };

      void NotifyUpdate(EditBox editBox)
      {
         send.disabled = fileSend || !FileExists(sendFile.line.text).isFile;
      }

   };
   Button sendBrowse
   {
      this, text = "Browse", size = Size { 80,20 }, anchor = Anchor { right = 100, top = 40 }, hotKey = altB;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(fileList.Modal() == ok)
         {
            sendFile.Clear();
            sendFile.PutS(fileList.filePath);
         }
         return true;
      }
   };
   Button send
   {
      this, text = "Send", size = Size { 80, 20 }, anchor = Anchor { right = 10, top = 40 }, hotKey = altS, disabled = true;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         const char * fileName = sendFile.line.text;

         fileSend = FileOpen(fileName, read);
         if(fileSend)
         {
            char outputFile[MAX_FILENAME];
            int size;
            eComPacket * packet;
            GetLastDirectory(fileName, outputFile);
            size = strlen(outputFile);
            packet = (eComPacket *)new byte[sizeof(eComPacket) + size];
            strcpy(sendFileName, outputFile);
            if(packet)
            {
               packet->type = Send;
               packet->dataSize = size;
               FileGetSize(fileName, &packet->send.fileSize);
               CopyBytes(packet + 1, outputFile, size);

               socket.Send(packet, sizeof(eComPacket) + packet->dataSize);

               sendProgress.range = packet->send.fileSize;
               sendProgress.progress = 0;

               delete packet;
            }

            sending.Clear();
            sending.Printf("Sending %s at", outputFile);
         }
         send.disabled = fileSend || !FileExists(sendFile.line.text).isFile;
         sendCancel.disabled = fileSend ? false : true;
         abortSend = false;
         return true;
      }
   };
   EditBox sending { this, textHorzScroll = true, readOnly = true, borderStyle = deep, inactive = true, size.h = 20, anchor = Anchor { left = 10, top = 70, right = 190 }, opacity = 0 };
   Label sendSpeed { this, borderStyle = deep, anchor = Anchor { right = 100, top = 70 }, size = Size { 80, 20 } };
   Button sendCancel
   {
      this, text = "Cancel", anchor = Anchor { right = 10, top = 70 }, size = Size { 80,20 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         abortSend = true;
         sendCancel.disabled = true;
         return true;
      }
   };
   ProgressBar sendProgress { this, borderStyle = deep, inactive = true, size.h = 20, anchor = Anchor { left = 10, top = 100, right = 10 } };
   Label { this, text = "[=== DOWNLOAD ===]", position = Point { 10, 140 } };
   EditBox receiving { this, textHorzScroll = true, readOnly = true, borderStyle = deep, inactive = true, anchor = Anchor { left = 10, top = 170, right = 190 }, size.h = 20, opacity = 0 };
   Label recvSpeed { this, borderStyle = deep, anchor = Anchor { right = 100, top = 170 }, size = Size { 80, 20 } };
   Button recvCancel
   {
      this, text = "Cancel", size = Size { 80, 20 }, anchor = Anchor { top = 168, right = 12 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         abortRecv = true;
         recvCancel.disabled = true;
         return true;
      }
   };
   ProgressBar recvProgress { this, borderStyle = deep, inactive = true, anchor = Anchor { left = 10, top = 200, right = 10 }, size.h = 20 };
   EditBox log
   {
      this, readOnly = true, multiLine = true, autoEmpty = true, text = "Conversation", inactive = true, size = Size { 560, 226 }, anchor = Anchor { left = 10, top = 270, right = 10, bottom = 100 }, hasHorzScroll = true, hasVertScroll = true
   };
   Label { this, position = Point { 10, 250 }, labeledWindow = log };
   Button clear
   {
      this, text = "Clear", anchor = Anchor { left = 10, bottom = 5 }, size = Size { 80, 0 }, hotKey = altR;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         log.Clear();
         return true;
      }
   };
   Button backButton
   {
      this, text = "Background...", anchor = Anchor { bottom = 5 }, size = Size { 100, 0 }, hotKey = altK;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ColorPicker picker { hasClose = true, text = "Select a color/opacity value...", color = background };
         picker.Modal();
         background = picker.color;
         return true;
      }
   };
   EditBox message
   {
      this, multiLine = true, text = "Message", size = Size { 0, 50 }, anchor = Anchor { left = 10, right = 10, bottom = 32 }, disabled = true, hasHorzScroll = true, hasVertScroll = true, size.h = 50;

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if((SmartKey)key == ctrlEnter)
         {
            EditLine line;

            log.End();
            log.AddS("\n");
            log.AddS("<");
            log.AddS(localName);
            log.AddS("> ");
            for(line = message.firstLine; line; line = line.next)
            {
               eComPacket * packet;
               const char * string = line.text;
               int size = strlen(string);

               packet = (eComPacket *)new byte[sizeof(eComPacket) + size];
               if(packet)
               {
                  packet->type = Message;
                  packet->dataSize = size;
                  packet->msg.over = (line == message.lastLine);
                  CopyBytes(packet + 1, string, size);

                  socket.Send(packet, sizeof(eComPacket) + packet->dataSize);

                  delete packet;
               }
               if(line != message.firstLine)
                  log.AddS("\n");
               log.AddS(string);
            }
            log.SetViewToCursor(false);
            message.Clear();
            return false;
         }
         return true;
      }
   };

   ConnectionSocket socket;

   FileDialog fileList
   {
      borderStyle = sizable, text = "Select a file to send...", size = Size { 300,400 }, master = this
   };


   // Messages
   char * incomingMessage;
   unsigned int incomingMsgLen;

   // Sending
   File fileSend;
   Seconds sendTime;
   bool abortSend;
   char sendFileName[MAX_FILENAME];

   // Receiving
   File fileRecv;
   Seconds recvTime;
   bool abortRecv;
   char recvFileName[MAX_FILENAME];

   char * displayedName;
   const char * localName;

   void SendBlock(uint blockSize)
   {
      eComPacket * packet = (eComPacket *)new byte[sizeof(eComPacket) + blockSize];
      uint size = abortSend ? 0 : fileSend.Read(packet + 1, 1, blockSize);
      if(packet)
      {
         packet->type = Data;
         packet->dataSize = size;
         if(abortSend)
            packet->data.status = Abort;
         else
            packet->data.status = (size < blockSize) ? Done : Ok;

         sendProgress.progress += size;
         sendTime = GetTime();
         socket.Send(packet, sizeof(eComPacket) + packet->dataSize);
         delete packet;
      }
   }

   void SendName(const char * name)
   {
      eComPacket * namePacket = (eComPacket *)new byte[sizeof(eComPacket) + strlen(name)];
      localName = name;
      if(namePacket)
      {
         namePacket->type = Name;
         namePacket->dataSize = strlen(name);

         CopyBytes(namePacket + 1, name, namePacket->dataSize);

         socket.Send(namePacket, sizeof(eComPacket) + namePacket->dataSize);

         delete namePacket;
      }
   }

   void OnDestroy()
   {
      ((MainPanel)master).ConnectionDestroyed(this);
      if(socket)
      {
         socket.connection = null;
         socket.Disconnect(0);
         socket = null;
      }
      delete incomingMessage;
      delete displayedName;
      delete fileSend;
      delete fileRecv;
   }

   bool OnCreate()
   {
      //eComPacket packet = { Connect, 0, { ECOMMUNICATOR_PROTOCOL_VERSION } };
      eComPacket packet { Connect, 0, { ECOMMUNICATOR_PROTOCOL_VERSION } };
      socket.Send(&packet, sizeof(eComPacket));
      return true;
   }

   property ConnectionSocket socket { set { socket = value; } }
}

class ConnectionSocket : Socket
{
   Connection connection;
   MainPanel mainPanel;

   uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(eComPacket))
      {
         eComPacket packet = *(eComPacket *) buffer;
         if(count - sizeof(eComPacket) >= packet.dataSize)
         {
            byte * data = (byte *)buffer + sizeof(eComPacket);
            if(connection)
            {
               switch(packet.type)
               {
                  case Connect:
                  {
                     if(packet.connect.version == ECOMMUNICATOR_PROTOCOL_VERSION)
                     {
                        char address[256] = "";
                        connection.send.disabled = !FileExists(connection.sendFile.line.text).isFile;
                        connection.message.disabled = false;
                        GetNameFromAddress(inetAddress, address);
                        connection.log.End();
                        connection.log.Printf("* Connected to %s (%s), protocol version %d.", inetAddress, address, packet.connect.version);
                     }
                     else
                        Disconnect(0);
                     break;
                  }
                  case Send:
                  {
                     char fileName[MAX_LOCATION];
                     FileSize resumePosition = 0;
                     char string[MAX_LOCATION + 40];
                     eComPacket recvPacket;

                     CopyBytes(fileName, data, packet.dataSize);
                     fileName[packet.dataSize] = '\0';

                     if(FileExists(fileName))
                     {
                        FileGetSize(fileName, &resumePosition);
                     }
                     recvPacket.type = Receive;
                     recvPacket.dataSize = 0;
                     recvPacket.recv.position = resumePosition;

                     strcpy(connection.recvFileName, fileName);
                     connection.fileRecv = FileOpen(fileName, append);
                     connection.recvCancel.disabled = connection.fileRecv ? false : true;

                     connection.receiving.Clear();
                     connection.receiving.Printf("Receiving %s at", fileName);

                     connection.recvProgress.range = packet.send.fileSize;
                     connection.recvProgress.progress = resumePosition;

                     connection.log.End();
                     if(resumePosition)
                     {
                        PrintSize(string, resumePosition, 2);
                        connection.log.Printf("\n* Resuming download of %s from %s", connection.recvFileName, string);
                     }
                     else
                        connection.log.Printf("\n* Downloading %s", connection.recvFileName);

                     connection.abortRecv = false;

                     connection.recvTime = GetTime();
                     Send(&recvPacket, sizeof(eComPacket));
                     break;
                  }
                  case Receive:
                  {
                     char string[20];
                     connection.fileSend.Seek(packet.recv.position, start);
                     connection.SendBlock(DATA_BLOCK_SIZE);
                     connection.log.End();
                     if(packet.recv.position)
                     {
                        PrintSize(string, packet.recv.position, 2);
                        connection.log.Printf("\n* Resuming upload of %s from %s", connection.sendFileName, string);
                     }
                     else
                        connection.log.Printf("\n* Uploading %s", connection.sendFileName);
                     connection.sendProgress.progress = packet.recv.position;
                     break;
                  }
                  case Message:
                  {
                     if(connection.incomingMsgLen)
                        connection.incomingMessage[connection.incomingMsgLen++] = '\n';
                     connection.incomingMessage = renew connection.incomingMessage char[connection.incomingMsgLen + packet.dataSize + 1];
                     CopyBytes(connection.incomingMessage + connection.incomingMsgLen, data, packet.dataSize);
                     connection.incomingMessage[connection.incomingMsgLen + packet.dataSize] = '\0';

                     connection.incomingMsgLen += packet.dataSize;

                     if(packet.msg.over)
                     {
                        connection.log.End();
                        connection.log.AddS("\n<");
                        connection.log.AddS(connection.displayedName);
                        connection.log.AddS("> ");
                        connection.log.AddS(connection.incomingMessage);
                        connection.log.SetViewToCursor(false);
                        delete connection.incomingMessage;
                        connection.incomingMessage = null;
                        connection.incomingMsgLen = 0;
                     }
                     break;
                  }
                  case Name:
                  {
                     char address[256] = "", title[256];

                     delete connection.displayedName;
                     connection.displayedName = new char[packet.dataSize + 1];
                     CopyBytes(connection.displayedName, data, packet.dataSize);
                     connection.displayedName[packet.dataSize] = '\0';

                     GetNameFromAddress(inetAddress, address);
                     sprintf(title, service ? "%s [<-%s]" : "%s [->%s]", connection.displayedName, address);

                     connection.text = title;
                     break;
                  }
                  case Data:
                  {
                     eComPacket ackPacket { DataAck };
                     Seconds diffTime;

                     if(connection.abortRecv)
                        ackPacket.data.status = Abort;
                     else if(packet.dataSize)
                     {
                        if(!connection.fileRecv.Write(data, packet.dataSize, 1))
                           ackPacket.data.status = OutOfSpace;
                     }
                     else if(packet.data.status)
                        ackPacket.data.status = packet.data.status;

                     connection.recvProgress.progress += packet.dataSize;

                     diffTime = GetTime() - connection.recvTime;
                     if(diffTime)
                     {
                        char string[16];
                        PrintSize(string, (int)(packet.dataSize / diffTime), 1);
                        strcat(string, "/s");
                        connection.recvSpeed.text = string;
                     }

                     if(ackPacket.data.status)
                     {
                        connection.log.End();
                        switch(ackPacket.data.status)
                        {
                           case Done:
                              connection.log.Printf("\n* %s received successfully.", connection.recvFileName);
                              break;
                           case Abort:
                              connection.log.Printf("\n* Download of %s cancelled.", connection.recvFileName);
                              break;
                           case OutOfSpace:
                              connection.log.Printf("\n* Out of disk space receiving %s.", connection.recvFileName);
                              break;
                        }
                        connection.receiving.Clear();
                        connection.recvSpeed.text = "";
                        delete connection.fileRecv;
                        connection.recvProgress.range = 0;
                     }

                     connection.recvCancel.disabled = connection.fileRecv ? false : true;
                     connection.recvTime = GetTime();
                     Send(&ackPacket, sizeof(eComPacket));
                     break;
                  }
                  case DataAck:
                  {
                     Seconds diffTime;
                     if(packet.ack.status)
                     {
                        connection.log.End();
                        switch(packet.ack.status)
                        {
                           case Done:
                              connection.log.Printf("\n* %s uploaded successfully.", connection.sendFileName);
                              break;
                           case Abort:
                              connection.log.Printf("\n* Upload of %s cancelled.", connection.sendFileName);
                              break;
                           case OutOfSpace:
                              connection.log.Printf("\n* Remote ran out of disk space receiving %s.", connection.sendFileName);
                              break;
                        }

                        connection.sendProgress.range = 0;
                        delete connection.fileSend;

                        connection.sending.Clear();
                        connection.sendSpeed.text = "";

                        connection.send.disabled = connection.fileSend || !FileExists(connection.sendFile.line.text).isFile;
                        connection.sendCancel.disabled = connection.fileSend ? false : true;
                     }
                     else
                     {
                        diffTime = GetTime() - connection.sendTime;
                        if(diffTime)
                        {
                           char string[16];
                           PrintSize(string, (int)(DATA_BLOCK_SIZE / diffTime), 1);
                           strcat(string, "/s");
                           connection.sendSpeed.text = string;
                        }
                        connection.SendBlock(DATA_BLOCK_SIZE);
                     }
                     break;
                  }
               }
            }
            return sizeof(eComPacket) + packet.dataSize;
         }
      }
      return 0;
   }

   void OnConnect()
   {
      char address[256] = "";

      GetNameFromAddress(inetAddress, address);

      connection = Connection { text = "Connecting...", socket = this, master = mainPanel };
      connection.Create();
      mainPanel.OnConnect(connection, inetAddress, address);
   }

   void OnDisconnect(int code)
   {
      if(connection)
      {
         connection.socket = null;
         connection.Destroy(0);
         connection = null;
      }
   }

   property MainPanel mainPanel { set { mainPanel = value; } }
   property Connection connection { set { connection = value; } }
}
