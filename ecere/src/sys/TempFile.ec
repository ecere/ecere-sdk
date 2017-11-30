namespace sys;

import "System"

public class TempFile : File
{
   byte * buffer;
   uintsize size;
   uintsize position;
   bool eof;
   FileOpenMode openMode;
   uintsize allocated;

   openMode = writeRead;

   ~TempFile()
   {
      delete buffer;
   }

   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      uintsize readSize = size * count;
      uintsize read = Min(readSize, this.size - position);

      if(position >= this.size) eof = true;
      if(buffer) memcpy(buffer, this.buffer + position, read);

      position += read;

      return read / size;
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      uintsize writeSize = size * count;
      uintsize written = writeSize;

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
      int64 read = Read(ch, 1, 1);
      return !eof && read != 0;
   }

   bool Putc(char ch)
   {
      int64 written = Write(&ch, 1, 1);
      return written != 0;
   }

   bool Puts(const char * string)
   {
      int len = string ? strlen(string) : 0;
      int64 written = Write(string, 1, len);
      return written == len;
   }

   bool Seek(int64 pos, FileSeekMode mode)
   {
      bool result = true;
      uint64 increase = 0;
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
            else if((int64)position + pos < 0)
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
            if((int64)size + pos >= (int64)size)
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

   uint64 Tell()
   {
      return position;
   }

   bool Eof()
   {
      return eof;
   }

   uint64 GetSize()
   {
      return size;
   }

   bool Truncate(uint64 size)
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
   property byte * buffer { get { return buffer; } set { delete buffer; buffer = value; } };
   property uintsize size { get { return size; } set { size = value; } }
   byte * StealBuffer() { byte * result = buffer; buffer = null; return result; }
};
