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
      // When we get an incoming connection to our service, we spawn a SampleSocket
      SampleSocket { this };
   }
}

class SampleSocket : Socket
{
   unsigned int OnReceive(const unsigned char * buffer, unsigned int count)
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
            logBox.PutS(packet->string);
            logBox.PutS("\n");
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

// The service
SampleService service { port = samplePort };

EditBox logBox
{
   caption = "RX Sample";
   hasClose = true;
   readOnly = true;
   noCaret = true;
   size = { 640, 480 };
   hasVertScroll = true;
   multiLine = true;
};
class RXApp : GuiApplication
{
   bool Init()
   {
      service.Start();
      return true;
   }
}
