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

// We don't really need anything special in this class here, we could simply use Socket directly
class SampleSocket : Socket
{

}

SampleSocket socket { };

class TXApp : GuiApplication
{
   void Main()
   {
      if(socket.Connect("localhost", samplePort))
      {
         // We build up a SamplePacket here with our message
         const String string = "Hello !";
         int len = strlen(string);
         int size = sizeof(SamplePacket) + len;
         SamplePacket * packet = (SamplePacket *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);

         socket.Send(packet, size);

         // Make sure to free memory allocated with 'new'
         delete packet;
      }
   }
}
