namespace sys;

import "System"

public class BufferedFile : File
{
   class_fixed
   FileOpenMode mode;
   File handle;
   uint bufferSize;
   uint bufferCount;
   uint bufferPos;
   uint pos;
   byte * buffer;
   bool eof;
   uint bufferRead;
   uint fileSize;

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

   int Read(byte * buffer, uint size, uint count)
   {
      if(handle)
      {
         uint totalBytesRead = 0;
         uint bufferCount = this.bufferCount;
         uint bufferPos = this.bufferPos;
         byte * fileBuffer = this.buffer + bufferPos;
         uint readCount = count;

         readCount *= size;

         while(true)
         {
            uint bytesRead = (bufferCount > bufferPos) ? (bufferCount - bufferPos) : 0;
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
               uint read;
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
               read = handle.Read(this.buffer + bufferCount, 1, read);
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

   int Write(const byte * buffer, uint size, uint count)
   {
      uint result;
      uint numBytes;
      uint bytesToBuffer;
      uint missing;
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
         bufferCount = bytesToBuffer;
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
      int written = Write(&ch, 1, 1);
      return written != 0;
   }

   bool Puts(const char * string)
   {
      int len = strlen(string);
      int written = Write(string, 1, len);
      return written == len;
   }

   bool Seek(int pos, FileSeekMode mode)
   {
      uint newPosition = this.pos;
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
               uint read = newPosition - this.pos - bufferCount;
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
                     read = handle.Read(this.buffer + bufferCount, 1, read);
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
      return true;
   }

   uint Tell()
   {
      return pos;
   }

   bool Eof()
   {
      return eof;
      //handle.Eof();
      //return false;
   }

   uint GetSize()
   {
      return fileSize;
   }

   bool Truncate(FileSize size)
   {
      uint bytesAhead = size - (pos - bufferPos);
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
   property uint bufferSize
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
   property uint bufferRead
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
