static char base64digits[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static char base64inv[128] =
{
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62,0, 0, 0,63,
   52,53,54,55,56,57,58,59,60,61, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,
   15,16,17,18,19,20,21,22,23,24,25, 0, 0, 0, 0, 0,
    0,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
   41,42,43,44,45,46,47,48,49,50,51, 0, 0, 0, 0, 0
};

int Base64Encode(byte * input, int len, byte * encoded)
{
   uint buffer;
   int c = 0;
   int remaining = 3;
   int encLen = 0;
   while(c < len)
   {
      int b;
      if(len - c < 3)
      {
         remaining = len - c;
         buffer = 0;
         buffer |= (int)input[c] << 16;
         if(len - c > 1)
            buffer |= (int)input[c+1] << 8;
      }
      else
         buffer = ((int)input[c] << 16) | ((int)input[c+1] << 8) | input[c+2];
      encoded[encLen++] = base64digits[(buffer & 0xFC0000) >> 18];
      encoded[encLen++] = base64digits[(buffer & 0x03F000) >> 12];
      encoded[encLen++] = (remaining >= 2) ? base64digits[(buffer & 0x000FC0) >> 6] : '=';
      encoded[encLen++] = (remaining >= 3) ? base64digits[(buffer & 0x00003F)]      : '=';
      c += 3;
   }
   encoded[encLen] = 0;
   return encLen;
}

int Base64Decode(byte * input, int len, byte * decoded)
{
   uint buffer;
   int c = 0;
   int decLen = 0;
   while(c < len)
   {
      buffer = ((int)base64inv[input[c]] << 18) | ((int)base64inv[input[c+1]] << 12) | ((int)base64inv[input[c+2]] << 6) | ((int)base64inv[input[c+3]]);

      decoded[decLen++] = (byte)((buffer & 0xFF0000) >> 16);
      if(len - c < 4)
      {
         if(input[c+2] != '=')
         {
            decoded[decLen++] = (byte)((buffer & 0x00FF00) >> 8);
            if(input[c+3] != '=')
               decoded[decLen++] = (byte)(buffer & 0x0000FF);
         }
      }
      else
      {
         decoded[decLen++] = (byte)((buffer & 0x00FF00) >> 8);
         decoded[decLen++] = (byte)(buffer & 0x0000FF);
      }
      c += 4;
   }
   decoded[decLen] = 0;
   return decLen;
}
