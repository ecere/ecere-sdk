namespace sys;

import "System"

public class BufferedFile : File
{
   class_fixed
   FileOpenMode mode;
   File handle;
   uintsize bufferSize;
   uintsize bufferCount;
   uintsize bufferPos;
   uint64 pos;
   byte * buffer;
   bool eof;
   uintsize bufferRead;
   uint64 fileSize;

   // bufferSize = 65536;
   property::bufferSize = 512 * 1024;
   //property::bufferSize = 10 * 1024 * 1024;
   property::bufferRead = 1 * 1024;

   ~BufferedFile()
   {
      delete handle;
      delete buffer;
   }

   void CloseInput()
   {
      handle.CloseInput();
   }

   void CloseOutput()
   {
      handle.CloseOutput();
   }

   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      if(handle)
      {
         uintsize totalBytesRead = 0;
         uintsize bufferCount = this.bufferCount;
         uintsize bufferPos = this.bufferPos;
         byte * fileBuffer = this.buffer + bufferPos;
         uintsize readCount = count;

         readCount *= size;

         while(true)
         {
            uintsize bytesRead = (bufferCount > bufferPos) ? (bufferCount - bufferPos) : 0;
            if(bytesRead > readCount) bytesRead = readCount;
            if(bytesRead)
            {
               memcpy(buffer + totalBytesRead, fileBuffer, bytesRead);
               bufferPos += bytesRead;
               totalBytesRead += bytesRead;
               readCount -= bytesRead;
            }
            if(readCount)
            {
               uintsize read;
               if(readCount < bufferSize /*&& bufferPos <= bufferCount*/)
               {
                  read = Max(readCount, bufferRead);
                  if(bufferPos > bufferCount)
                  {
                     if(bufferPos + readCount - bufferCount > read && (bufferPos + readCount - bufferCount < bufferCount))
                        read = bufferPos + readCount - bufferCount;
                     else
                     {
                        bufferPos = 0;
                        bufferCount = 0;
                     }
                  }
                  if(bufferCount + read > bufferSize)
                  {
                     bufferPos = 0;
                     bufferCount = 0;
                  }
               }
               else
               {
                  read = bufferSize;
                  bufferPos = 0;
                  bufferCount = 0;
               }
               handle.Seek(pos + totalBytesRead - bufferPos + bufferCount, start);
               read = handle.Read(this.buffer + bufferCount, 1, (uint)read);
               fileBuffer = this.buffer + bufferPos;
               bufferCount += read;
               if(!read)
               {
                  eof = true;
                  break;
               }
            }
            else
               break;
         }
         this.bufferCount = bufferCount;
         this.bufferPos = bufferPos;
         pos += totalBytesRead;
         return totalBytesRead / size;
      }
      return 0;
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      uintsize result;
      uintsize numBytes;
      uintsize bytesToBuffer;
      uintsize missing;
      handle.Seek(pos, start);
      result = handle.Write(buffer, size, count);
      numBytes = result * size;
      bytesToBuffer = (bufferSize > bufferPos) ? (bufferSize - bufferPos) : 0;
      missing = numBytes - bytesToBuffer;
      pos += numBytes;
      fileSize = Max(fileSize, pos);

      //bufferCount = 0;
      //bufferPos = 0;

      if(bytesToBuffer < numBytes && bufferCount >= bufferPos && numBytes < bufferSize && missing < bufferPos)
      {
         memcpy(this.buffer, this.buffer + missing, bufferPos - missing);
         bufferPos -= missing;
         bufferCount -= missing;
         bytesToBuffer += missing;
      }

      if(bytesToBuffer >= numBytes)
      {
         bytesToBuffer = numBytes;
         memcpy(this.buffer + bufferPos, buffer, bytesToBuffer);
         bufferPos += bytesToBuffer;
         bufferCount = Max(bufferCount, bufferPos);
      }
      else
      {
         bytesToBuffer = Min(numBytes, bufferSize);
         memcpy(this.buffer, buffer + numBytes - bytesToBuffer, bytesToBuffer);
         bufferPos = bytesToBuffer;
         bufferCount = (uint)bytesToBuffer;
      }
      return result;
   }

   bool Getc(char * ch)
   {
      // return Read(ch, 1,1) ? true : false;
      if(handle)
      {
         while(true)
         {
            if(bufferCount > bufferPos)
            {
               *ch = *(buffer + bufferPos);
               bufferPos++;
               pos++;
               return true;
            }
            else
            {
               bufferPos = 0;
               handle.Seek(pos, start);
               bufferCount = handle.Read(buffer, 1, bufferSize);
               if(!bufferCount)
               {
                  eof = true;
                  break;
               }
            }
         }
      }
      return false;
   }

   bool Putc(char ch)
   {
      int64 written = Write(&ch, 1, 1);
      return written != 0;
   }

   bool Puts(const char * string)
   {
      int len = strlen(string);
      int64 written = Write(string, 1, len);
      return written == len;
   }

   bool Seek(int64 pos, FileSeekMode mode)
   {
      uint64 newPosition = this.pos;
      switch(mode)
      {
         case start:
            newPosition = pos;
            break;
         case current:
            newPosition += pos;
            break;
         case end:
         {
            // Get size of file
            newPosition = fileSize + pos;
            break;
         }
      }
      if(this.pos != newPosition)
      {
         if(newPosition >= this.pos - bufferPos && newPosition < this.pos + bufferSize)
         {
            if(newPosition < this.pos - bufferPos + bufferCount)
               bufferPos += newPosition - this.pos;
            else
            {
               uintsize read = newPosition - this.pos - bufferCount;
               if(read < bufferCount * 2)
               {
                  if(read > bufferSize)
                  {
                     bufferCount = 0;
                     bufferPos = 0;
                  }
                  else
                  {
                     handle.Seek(this.pos - bufferPos + bufferCount, start);
                     read = handle.Read(this.buffer + bufferCount, 1, (uint)read);
                     bufferPos += newPosition - this.pos;
                     bufferCount += read;
                  }
               }
               else
               {
                  bufferCount = 0;
                  bufferPos = 0;
               }
            }
         }
         else
         {
            bufferCount = 0;
            bufferPos = 0;
         }

         eof = newPosition > fileSize;
         this.pos = newPosition;
      }
      return !eof;
   }

   uint64 Tell()
   {
      return pos;
   }

   bool Eof()
   {
      return eof;
      //handle.Eof();
      //return false;
   }

   uint64 GetSize()
   {
      return fileSize;
   }

   bool Truncate(uint64 size)
   {
      uint64 bytesAhead = (uint64)size - (pos - bufferPos);
      handle.Truncate(size);
      bufferCount = Min(bufferCount, bytesAhead);
      fileSize = Min(fileSize, size);
      return true;
   }

   bool Lock(FileLock type, uint64 start, uint64 length, bool wait)
   {
      return handle.Lock(type, start, length, wait);
   }

   bool Unlock(uint64 start, uint64 length, bool wait)
   {
      return handle.Unlock(start, length, wait);
   }

public:
   property File handle
   {
      set
      {
         if(handle)
            delete handle;
         handle = value;
         bufferCount = 0;
         bufferPos = 0;
         pos = 0;
         if(handle)
         {
            incref handle;
         }
      }
      get
      {
         return handle;
      }
   }
   property uintsize bufferSize
   {
      set
      {
         bufferSize = value;
         buffer = renew buffer byte[value];
         if(bufferCount > bufferSize)
            bufferCount = bufferSize;
      }
      get
      {
         return bufferSize;
      }
   }
   property uintsize bufferRead
   {
      set
      {
         bufferRead = value;
      }
      get
      {
         return bufferRead;
      }
   }
};

public BufferedFile FileOpenBuffered(const char * fileName, FileOpenMode mode)
{
   BufferedFile result = null;
   //if(mode == read)
   {
      File handle = FileOpen(fileName, mode);
      if(handle)
      {
         BufferedFile f
         {
            mode = mode;
            pos = 0;
            handle = handle;
            fileSize = handle.GetSize();
         };
         handle.buffered = true;
         result = f;
      }
   }
   return result;
}
