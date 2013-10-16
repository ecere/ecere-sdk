import "ecere"

// We'll use TCP/IP port 5623 for this sample
define samplePort = 5623;

// We will use this simple structure for our messages
struct SamplePacket
{
   int stringLen;
   // stringLen + 1 bytes are actually used (variable size depending on string)
   char string[1];
};

class SampleService : Service
{
   void OnAccept()
   {
      // When we get an incoming connection to our service, we spawn a SampleSocket (Can only serve one right now)
      if(!servingSocket)
      {
         servingSocket = SampleSocket { this };
         form.UpdateButtonStates();
      }
   }
}

class SampleSocket : Socket
{
   void OnConnect()
   {
      // We want a non blocking Connect() call, so we define an OnConnect() that simply updates the button disabled states
      form.UpdateButtonStates();
   }

   void OnDisconnect(int code)
   {
      // On disconnection we need to null the socket pointers, and update the buttons
      if(connectedSocket == this)
         connectedSocket = null;
      else if(servingSocket == this)
         servingSocket = null;

      form.UpdateButtonStates();
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      // We only process the data if we've received enough bytes to make up the message
      // This first if just checks if we have reveived enough bytes for the header
      if(count >= sizeof(SamplePacket))
      {
         SamplePacket * packet = (SamplePacket *) buffer;
         uint size = sizeof(SamplePacket) + packet->stringLen;
         // Here we check if we've actually received the entire message
         if(count >= size)
         {
            // We've received a complete message, so we change the contents of the recvString EditBox
            form.recvString.contents = packet->string;
            // and we return the size of the message we've processed.
            // If more data is already buffered, this method will be called again right away.
            return size;
         }
      }
      // We haven't received enough data to process this message yet: return 0 bytes processed
      // This method will be called again once more data has been received.
      return 0;
   }
}

class SocketSample : Window
{
   text = "Socket Sample";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = { 416, 176 };
   nativeDecorations = true;

   // Service is missing a property to tell us if it's listening or not already, so we keep track of it in this variable
   bool listening;

   void UpdateButtonStates()
   {
      bool connected = (connectedSocket && connectedSocket.connected) || (servingSocket && servingSocket.connected);

      // The Send button is disabled if we're not connected
      btnSend.disabled = !connected;
      // The Connect button is disabled if we've already defined a connectedSocket
      btnConnect.disabled = connectedSocket != null;
      // The Listen button is disabled if we're already listening
      btnListen.disabled = listening;
   }

   Button btnSend
   {
      this, text = "Send", position = { 344, 64 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // We build up a SamplePacket here with our message from the sentString EditBox
         String string = sentString.contents;
         int len = strlen(string);
         int size = sizeof(SamplePacket) + len;
         SamplePacket * packet = (SamplePacket *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         // If we've connected to another server, we use the connectedSocket, otherwise we use the servingSocket (Send back to whom connected to us)
         (connectedSocket ? connectedSocket : servingSocket).Send(packet, size);
         // Make sure to free memory allocated with 'new'
         delete packet;
         return true;
      }
   };
   EditBox serverAddress { this, text = "Server Address", size = { 174, 19 }, position = { 8, 40 }, contents = "localhost" };
   Label lblServerAddress { this, position = { 8, 16 }, labeledWindow = serverAddress };
   Button btnListen
   {
      this, text = "Listen", position = { 144, 104 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // Start listening here
         if(service.Start())
         {
            listening = true;
            UpdateButtonStates();
         }
         return true;
      }
   };
   EditBox sentString { this, text = "Sent String", size = { 166, 19 }, position = { 224, 40 } };
   Label lblSentString { this, position = { 224, 16 }, labeledWindow = sentString };
   EditBox recvString { this, text = "Received String", size = { 166, 19 }, position = { 224, 104 } };
   Label label1 { this, position = { 224, 80 }, labeledWindow = recvString };
   Button btnConnect
   {
      this, text = "Connect", position = { 8, 72 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         btnConnect.disabled = true;
         // Create a socket and attempt a connection to the address specified in the serverAddress EditBox
         connectedSocket = SampleSocket { };
         // Connect is a blocking call if no OnConnect method is defined in the Socket, a non-blocking call otherwise
         connectedSocket.Connect(serverAddress.contents, samplePort);
         return true;
      }
   };

   void OnDestroy()
   {
      // We need to disconnect the socket and stop the service before destroying the application,
      // otherwise we'll get a crash with the SampleSocket accessing the form that is already destroyed
      if(connectedSocket)
         connectedSocket.Disconnect(0);
      service.Stop();
   }
}

// The form
SocketSample form {};

// The service
SampleService service { port = samplePort };

// We use 2 sockets: one for when we connect to a server, one for the incoming connections to our SampleService
SampleSocket connectedSocket, servingSocket;
