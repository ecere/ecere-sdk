import "sha256"

class Sha256Test : Application
{
   void Main()
   {
      uint i;
   	byte bytes[4096] = { 0x00 };
   	AmpheckSHA256 ctx { };
   	byte digest[32];

   	ctx.Init();
      for (i = 0; i < 262144; ++i)
   		ctx.Update(bytes, 4096);

   	ctx.Finish(digest);

   	for (i = 0; i < 32; ++i)
   		printf("%02x", digest[i]);

   	printf("\n");
   }
}
