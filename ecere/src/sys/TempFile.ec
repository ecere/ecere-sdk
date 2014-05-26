namespace sys;

import "System"

public class TempFile : File
{
   byte * buffer;
   uint size;
   uint position;
   bool eof;
   FileOpenMode openMode;
   uint allocated;

   openMode = writeRead;

   ~TempFile()
   {
      delete buffer;
   }

   int Read(byte * buffer, uint size, uint count)
   {
      int readSize = size * count;
      int read = Min(readSize, this.size - position);

      if(position >= this.size) eof = true;
      if(buffer) memcpy(buffer, this.buffer + position, read);

      position += read;

      return read / size;
   }

   int Write(byte * buffer, uint size, uint count)
   {
      int writeSize = size * count;
      int written = writeSize;

      if(this.size - position < writeSize)
      {
         this.size += writeSize - (this.size - position);
         if(this.allocated < this.size)
         {
            this.allocated *= 2;
            if(this.allocated < this.size)
               this.allocated = this.size * 2;
            this.buffer = renew this.buffer byte[this.allocated];
         }
      }
      memcpy(this.buffer + position, buffer, writeSize);

      position += written;

      return written / size;
   }

   bool Getc(char * ch)
   {
      int read = Read(ch, 1, 1);
      return !eof && read != 0;
   }

   bool Putc(char ch)
   {
      int written = Write(&ch, 1, 1);
      return written != 0;
   }

   bool Puts(char * string)
   {
      int len = string ? strlen(string) : 0;
      int written = Write(string, 1, len);
      return written == len;
   }

   bool Seek(int pos, FileSeekMode mode)
   {
      bool result = true;
      uint increase = 0;
      switch(mode)
      {
         case start:
         {
            if(pos >= size)
            {
               if(openMode == readWrite)
               {
                  position = pos;
                  increase = pos - size;
               }
               else
               {
                  position = size;
                  result = false;
               }
            }
            else if(pos < 0)
            {
               position = 0;
               result = false;
            }
            else
               position = pos;
            break;
         }
         case current:
         {
            if(position + pos >= size)
            {
               if(openMode == readWrite)
               {
                  position += pos;
                  increase = position - size;
               }
               else
               {
                  position = size;
                  result = false;
               }
            }
            else if(position + pos < 0)
            {
               position = 0;
               result = false;
            }
            else
               position += pos;
            break;
         }
         case end:
         {
            if((int)size + pos >= (int)size)
            {
               if(openMode == readWrite)
               {
                  position = size + pos;
                  increase = position - size;
               }
               else
               {
                  position = size;
                  result = false;
               }
            }
            else if((int)size + pos < 0)
            {
               position = 0;
               result = false;
            }
            else
               position = size + pos;
            break;
         }
      }
      if(result)
         eof = false;

      if(increase)
      {
         this.size += increase;
         this.buffer = renew this.buffer byte[this.size];
      }
      return result;
   }

   uint Tell()
   {
      return position;
   }

   bool Eof()
   {
      return eof;
   }

   uint GetSize()
   {
      return size;
   }

   bool Truncate(FileSize size)
   {
      buffer = renew buffer byte[size];
      this.size = size;
      this.allocated = size;
      if(position > size) position = size;      // What to do here?
      return true;
   }

public:
   property FileOpenMode openMode
   {
      set { openMode = value; }
      get { return openMode; }
   }
   property byte * buffer { get { return buffer; } };
};
