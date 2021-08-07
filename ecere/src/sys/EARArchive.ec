namespace sys;

#define uint _uint
#include "zlib.h"
#undef uint

import "System"
import "BufferedFile"

#define OFFSET(s, m) ((uint)(uintptr) (&((s *) 0)->m))
#define MDWORD(a,b) ((((uint32)((uint16)(b)))<<16)+((uint16)(a)))

#define EAR_RECOGNITION { 'e', 'A', 'R', 228, 11, 12, 3, 0 }

static byte earRecognition[] = EAR_RECOGNITION;

static class FreeBlock : struct
{
   FreeBlock prev, next;
   uint64 start, end;
};

static struct EARHeader
{
   byte recognition[sizeof(earRecognition)];
   uint version                             __attribute__((packed));
   FileSize totalSize                       __attribute__((packed));
};

static enum EAREntryType { ENTRY_FILE = 1, ENTRY_FOLDER = 2 };

static struct EAREntry
{
   EAREntryType type             __attribute__((packed));
   TimeStamp32 created, modified __attribute__((packed));
   FileSize size, cSize          __attribute__((packed));
   uint prev, next               __attribute__((packed));
   uint nameLen                  __attribute__((packed));
   // null terminated file name follows
};

static File EAROpenArchive(const char * archive, EARHeader header)
{
   File f = null;
   if(archive[0] == ':')
   {
      char moduleName[MAX_LOCATION];
      const char * name = archive + 1;
      moduleName[0] = 0;
#if defined(__ANDROID__) && !defined(__LUMIN__)
      if(!name[0])
         name = ((SubModule)__thisModule.application.modules.first).next.module.name;
#endif

#if defined(__EMSCRIPTEN__)
      if(!name[0])
         f = FileOpen("resources.ear", read);
#endif

      if(!f && LocateModule(name, moduleName))
         f = FileOpen(moduleName, read);
   }
   else
      f = FileOpen(archive, read);
   if(f)
   {
      uint archiveSize;

      // First attempt to treat this as an archive file
      if(f.Read(header, sizeof(EARHeader), 1) == 1 &&
         !memcmp(header.recognition, earRecognition, sizeof(earRecognition)))
         return f;

      // Then try to see if an archive is at the end of the file
      f.Seek(-(int)sizeof(uint), end);
      f.Read(&archiveSize, sizeof(uint), 1);
      f.Seek(-(int)archiveSize, end);
      if(f.Read(header, sizeof(EARHeader), 1) == 1 &&
         !memcmp(header.recognition, earRecognition, sizeof(earRecognition)))
         return f;

      delete f;
   }
   return null;
}

static FileAttribs EARGetEntry(File f, EAREntry entry, const char * name, char * path)
{
   uint first = 0, last = 0;
   if(!name[0])
      return FileAttribs { isDirectory = true };
   if(!f.Read(&first, sizeof(uint), 1))
      return 0;
   f.Read(&last, sizeof(uint), 1);
   if(first)
   {
      char namePart[MAX_FILENAME], nameRest[MAX_LOCATION];
      SplitDirectory(name, namePart, nameRest);

      if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
         strcpy(namePart, DIR_SEPS);

      f.Seek(first, start);
      for(;;)
      {
         char fileName[MAX_FILENAME];

         f.Read(entry, sizeof(EAREntry), 1);
         f.Read(fileName, 1, entry.nameLen);
         fileName[entry.nameLen] = '\0';

         if(!strcmp(fileName, "/") || !strcmp(fileName, "\\"))
            strcpy(fileName, DIR_SEPS);

         if(!fstrcmp(fileName, namePart))
         {
            if(path)
               PathCat(path, fileName);
            if(nameRest[0])
               return (entry.type == ENTRY_FOLDER) ? EARGetEntry(f, entry, nameRest, path) : 0;
            else
               return (entry.type == ENTRY_FILE) ? FileAttribs { isFile = true } : FileAttribs { isDirectory = true };
         }
         if(entry.next)
            f.Seek(entry.next, start);
         else
            break;
      }
   }
   return FileAttribs { };
}

#if !defined(ECERE_NOARCHIVE) && !defined(ECERE_VANILLA)
class EARArchive : Archive
{
   File f;
   //BufferedFile bf { };
   // char path[MAX_LOCATION];
   uint64 archiveStart;
   uint64 rootDir;
   OldList freeBlocks;
   bool writeAccess;

   uint64 Update()
   {
      if(rootDir)
      {
         uint64 end = ((FreeBlock)freeBlocks.last).start;

         // Update header
         f.Seek(archiveStart + OFFSET(EARHeader, totalSize), start);
         f.Write(&totalSize, sizeof(uint), 1);

         // Write Footer
         f.Seek(end, start);

         end += sizeof(uint);

         end -= archiveStart;

         f.Write(&end, sizeof(uint), 1);
         f.Truncate(archiveStart + end);

         return end;
      }
      return 0;
   }

   ~EARArchive()
   {
      if(f && rootDir && writeAccess)
      {
         // Perform Defrag
         Defrag(rootDir);
         archiveStart += Update();
      }
      if(f && writeAccess)
      {
         f.Flush();
         f.Unlock(0, 0, true);
      }
      delete f;

      /*if(rootDir && writeAccess)
      {
         // Fix the size of the archive
         FileTruncate(path, archiveStart);
      }*/

      freeBlocks.Free(null);
   }

   bool Clear()
   {
      rootDir = 0;
      return true;
   }

   ArchiveDir OpenDirectory(const char * name, FileStats stats, ArchiveAddMode addMode)
   {
      ArchiveDir result = null;
      EARArchiveDir dir { readOnly = addMode == readOnlyDir };
      if(dir)
      {
         char namePart[MAX_LOCATION] = "", nameRest[MAX_LOCATION];

         dir.archive = this;

         strcpy(nameRest, name);

         if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
            strcpy(namePart, DIR_SEPS);

         // Search for directory
         if(rootDir)
         {
            dir.position = rootDir;
            if(f.Seek(dir.position, start))
            {
               dir.first = 0;
               dir.last = 0;

               f.Read(&dir.first, sizeof(uint), 1);
               f.Read(&dir.last, sizeof(uint), 1);

               result = dir;
            }
         }

         // If directory doesn't exist already
         if(!result && addMode != refresh)
         {
            rootDir = Position(2*sizeof(uint));
            dir.position = rootDir;
         }

         result = dir;

         // Open rest of directory...
         if(result && nameRest[0])
         {
            result = dir.OpenDirectory(nameRest, stats, addMode);
            delete dir;
         }
      }
      return result;
   }

   uint64 Position(uint64 size)
   {
      FreeBlock block;
      for(block = freeBlocks.first; block; block = block.next)
      {
         if(block.end - block.start + 1 >= size)
         {
            uint64 position = block.start;
            if(block.end - block.start + 1 == size)
               freeBlocks.Delete(block);
            else
               block.start += size;
            return position;
         }
      }
      return 0;
   }

   bool DefragOffset(uint * offset)
   {
      FreeBlock block;
      uint subtract = 0;
      for(block = freeBlocks.first; block; block = block.next)
      {
         if(*offset > block.start)
            subtract += block.end - block.start + 1;
         else
            break;
      }
      if(subtract)
      {
         *offset -= subtract;
         return true;
      }
      return false;
   }

   #define MAX_BUFFERSIZE 0x400000

   void Defrag(uint64 dirPosition)
   {
      // Update all offsets within the files
      uint first = 0, last = 0;
      uint64 position = 0, next = 0;

      f.Seek(dirPosition, start);
      f.Read(&first, sizeof(uint), 1);
      f.Read(&last, sizeof(uint), 1);

      position = first;

      if(first && DefragOffset(&first))
      {
         if(f.Seek(dirPosition, start))
            f.Write(&first, sizeof(uint), 1);
      }
      if(last && DefragOffset(&last))
      {
         if(f.Seek(dirPosition + sizeof(uint), start))
            f.Write(&last, sizeof(uint), 1);
      }

      for(; position; position = next)
      {
         EAREntry entry { };

         if(f.Seek(position, start) && f.Read(entry, sizeof(EAREntry), 1))
         {
            next = entry.next;

            if(entry.prev && DefragOffset(&entry.prev))
            {
               f.Seek(position + OFFSET(EAREntry, prev), start);
               f.Write(&entry.prev, sizeof(uint), 1);
            }
            if(entry.next && DefragOffset(&entry.next))
            {
               f.Seek(position + OFFSET(EAREntry, next), start);
               f.Write(&entry.next, sizeof(uint), 1);
            }

            if(entry.type == ENTRY_FOLDER)
               Defrag(position + sizeof(EAREntry) + entry.nameLen);
         }
         else
            return;
      }

      // Move all the blocks
      if(dirPosition == rootDir)
      {
         uint64 bufferSize = 0;
         byte * buffer = null;
         FreeBlock block, nextBlock;
         for(block = freeBlocks.first; block && block.next; block = nextBlock)
         {
            uint64 dataSize, c;

            nextBlock = block.next;
            dataSize = nextBlock.start - (block.end + 1);

            if(dataSize > bufferSize && (!bufferSize || bufferSize < MAX_BUFFERSIZE))
            {
               bufferSize = Min(dataSize, MAX_BUFFERSIZE);
               buffer = renew buffer byte[bufferSize];
            }

            for(c = 0; c<dataSize; c += bufferSize)
            {
               uint64 size = (dataSize > c + bufferSize) ? bufferSize : (dataSize - c);

               // Read block of data
               f.Seek((block.end + 1) + c, start);
               f.Read(buffer, size, 1);

               // Write block of data
               f.Seek(block.start + c, start);
               f.Write(buffer, size, 1);
            }

            nextBlock.start -= (block.end - block.start) + 1;

            freeBlocks.Delete(block);
         }
         delete buffer;
      }
   }

   uint64 Find(EARArchiveDir directory, const char * namePart, EAREntry entry)
   {
      uint64 position;
      for(position = directory.first; position; position = entry.next)
      {
         char fileName[MAX_FILENAME];

         if(f.Seek(position, start) && f.Read(entry, sizeof(EAREntry), 1))
         {
            if(entry.nameLen > MAX_FILENAME)
               return 0;   // CORRUPTION ERROR
            f.Read(fileName, 1, entry.nameLen);
            fileName[entry.nameLen] = '\0';

            if(!strcmp(fileName, "/") || !strcmp(fileName, "\\"))
               strcpy(fileName, DIR_SEPS);

            if(!fstrcmp(fileName, namePart))
               return position;
         }
         else
            return 0;   // ERROR OUT OF SPACE?
      }
      return 0;
   }

   void AddFreeBlock(uint64 position, uint64 size)
   {
      FreeBlock block, prevBlock, nextBlock = null;

      // Find the previous and next free block
      prevBlock = null;
      for(block = freeBlocks.first; block; block = block.next)
         if(block.end < position)
            prevBlock = block;
         else
         {
            nextBlock = block;
            break;
         }

      // Try to merge with previous block
      if(prevBlock && prevBlock.end + 1 == position)
      {
          prevBlock.end += size;
         // Try to merge with next block as well
         if(nextBlock && nextBlock.start == prevBlock.end + 1)
         {
            prevBlock.end = nextBlock.end;
            freeBlocks.Delete(nextBlock);
         }
      }
      // Try to merge with next block
      else if(nextBlock && nextBlock.start == position + size)
      {
         nextBlock.start = position;
      }
      // This free block is not connected to any other block
      else
      {
         freeBlocks.Insert(prevBlock, FreeBlock { start = position, end = position + size - 1 });
      }
   }

   void SubtractBlock(uint start, uint size)
   {
      FreeBlock block;
      for(block = freeBlocks.first; block; block = block.next)
      {
         if(block.end >= start - 1L && block.start <= start + size)
         {
            if(block.end > start + size && block.start < start - 1L)
            {
               FreeBlock newBlock { start = start + size, end = block.end };
               block.end = start - 1L;
               freeBlocks.Insert(block, newBlock);
            }
            else if(block.end > start + size)
            {
               block.start = start + size;
            }
            else if(block.start < start - 1L)
            {
               block.end = start - 1L;
            }
            else
            {
               freeBlocks.Remove(block);
               delete block;
            }
            break;
         }
      }
   }

   void Delete(EARArchiveDir dir, uint64 position, EAREntry entry)
   {
      uint64 size;
      if(entry.type == ENTRY_FOLDER)
      {
         EARArchiveDir subDir {};
         uint64 filePosition;
         EAREntry fileEntry;

         subDir.position = dir.position;
         f.Read(&subDir.first, sizeof(uint), 1);
         f.Read(&subDir.last, sizeof(uint), 1);

         // Erase directory contents first
         for(filePosition = subDir.first; filePosition; filePosition = fileEntry.next)
         {
            f.Seek(filePosition, start);
            f.Read(&fileEntry, sizeof(EAREntry), 1);
            f.Seek(fileEntry.nameLen, current);
            Delete(subDir, filePosition, &fileEntry);
         }
         size = sizeof(EAREntry) + entry.nameLen + 2 * sizeof(uint);
         delete subDir;
      }
      else
         size = sizeof(EAREntry) + entry.nameLen + (entry.cSize ? entry.cSize : entry.size);

      // Unlink this file
      if(entry.prev)
      {
         f.Seek(entry.prev + OFFSET(EAREntry, next), start);
         f.Write(&entry.next, sizeof(uint), 1);
      }
      if(entry.next)
      {
         f.Seek(entry.next + OFFSET(EAREntry, prev), start);
         f.Write(&entry.prev, sizeof(uint), 1);
      }
      if(dir.last == position) dir.last = entry.prev;
      if(dir.first == position) dir.first = entry.next;

      AddFreeBlock(position, size);
      totalSize -= entry.size;

      // Invalidate Buffer
      // bf.handle = f;
   }

   File FileOpenCompressed(const char * name, bool * isCompressed, uint64 * ucSize)
   {
      File result = null;
      EARFile file {};
      if(file)
      {
         EAREntry entry { };

         f.Seek(archiveStart + sizeof(EARHeader), start);
         if(EARGetEntry(f, entry, name, null).isFile)
         {
            file.start = f.Tell();
            file.position = 0;
            file.size = entry.cSize ? entry.cSize : entry.size;
            if(ucSize) *ucSize = entry.size;
            file.f = f;
            incref file.f;
            file.f.Seek(file.start, start);
            result = file;
            if(isCompressed) *isCompressed = entry.cSize != 0;
         }
         if(!result)
            delete file;
      }
      return result;
   }

   File FileOpen(const char * name)
   {
      File result = null;
      EARFile file {};
      if(file)
      {
         EAREntry entry { };

         f.Seek(archiveStart + sizeof(EARHeader), start);
         if(EARGetEntry(f, entry, name, null).isFile)
         {
            if(entry.cSize)
            {
               byte * uncompressed = new byte[entry.size];
               if(uncompressed)
               {
                  byte * compressed = new byte[entry.cSize];
                  if(compressed)
                  {
                     if(f.Read(compressed, 1, entry.cSize) == entry.cSize)
                     {
                        unsigned long destLen = entry.size;
                        uncompress(uncompressed, &destLen, compressed, entry.cSize);
                        entry.size = (FileSize)destLen;  // TODO: Support 64 bit file sizes
                     }
                     delete compressed;
                  }

                  file.position = 0;
                  file.size = entry.size;
                  file.buffer = uncompressed;

                  result = file;
               }
            }
            else
            {
               file.start = f.Tell();
               file.position = 0;
               file.size = entry.size;
               file.f = f;
               incref file.f;
               file.f.Seek(file.start, start);
               result = file;
            }
         }
         if(!result)
            delete file;
      }
      return result;
   }

   File FileOpenAtPosition(uint position)
   {
      EARFile file {};
      char fileName[MAX_LOCATION];
      EAREntry entry { };
      f.Seek(position, start);
      f.Read(entry, sizeof(EAREntry), 1);
      /*if(entry.nameLen > 1024)
         printf("");*/
      f.Read(fileName, 1, entry.nameLen);
      if(entry.cSize)
      {
         byte * uncompressed = new byte[entry.size];
         if(uncompressed)
         {
            byte * compressed = new byte[entry.cSize];
            if(compressed)
            {
               if(f.Read(compressed, 1, entry.cSize) == entry.cSize)
               {
                  unsigned long destLen = entry.size;
                  uncompress(uncompressed, &destLen, compressed, entry.cSize);
                  entry.size = (FileSize)destLen;
               }
               delete compressed;
            }

            file.position = 0;
            file.size = entry.size;
            file.buffer = uncompressed;
         }
      }
      else
      {
         file.start = f.Tell();
         file.position = 0;
         file.size = entry.size;
         file.f = f;
         file.f.Seek(file.start, start);
         incref file.f;
      }
      return file;
   }

   FileAttribs FileExists(const char * fileName)
   {
      FileAttribs result;
      EAREntry entry { };
      f.Seek(archiveStart + sizeof(EARHeader), start);
      result = EARGetEntry(f, entry, fileName, null);
      return result;
   }

   void SubtractUsedBlocks()
   {
      uint first, last;
      if(!f.Read(&first, sizeof(uint), 1))
         return;
#ifdef _DEBUG
      if(first > f.GetSize())
      {
         printf("Error\n");
      }
#endif
      f.Read(&last, sizeof(uint), 1);

      while(first)
      {
         uint size = 0;

         char fileName[MAX_FILENAME];
         EAREntry entry { };

         f.Seek(first, start);
         f.Read(entry, sizeof(EAREntry), 1);
         if(entry.nameLen < MAX_FILENAME)
         {
            f.Read(fileName, 1, entry.nameLen);
            fileName[entry.nameLen] = 0;
         }
         else
         {
            fileName[0] = 0;
            break;
         }

         size += sizeof(EAREntry) + entry.nameLen;

         if(entry.type == ENTRY_FILE)
         {
            size += entry.cSize ? entry.cSize : entry.size;
         }
         else if(entry.type == ENTRY_FOLDER)
         {
            size += 2 * sizeof(uint);
            SubtractUsedBlocks();
         }
         SubtractBlock(first, size);
         first = entry.next;
      }
   }

   void SetBufferSize(uint bufferSize)
   {
      if(f && f._class == class(BufferedFile))
         ((BufferedFile)f).bufferSize = bufferSize;
   }

   void SetBufferRead(uint bufferRead)
   {
      if(f && f._class == class(BufferedFile))
         ((BufferedFile)f).bufferRead = bufferRead;
   }
}

class EARArchiveDir : ArchiveDir
{
   EARArchive archive;
   uint64 position;
   uint first, last;
   bool readOnly;

   ~EARArchiveDir()
   {
      if(!readOnly)
      {
         archive.f.Seek(position, start);
         archive.f.Write(&first, sizeof(uint), 1);
         archive.f.Write(&last, sizeof(uint), 1);
         archive.Update();
      }
   }

   File FileOpen(const char * name)
   {
      File result = null;
      EARFile file {};
      if(file)
      {
         EAREntry entry { };

         archive.f.Seek(position, start);
         if(EARGetEntry(archive.f, entry, name, null).isFile)
         {
            if(entry.cSize)
            {
               byte * uncompressed = new byte[entry.size];
               if(uncompressed)
               {
                  byte * compressed = new byte[entry.cSize];
                  if(compressed)
                  {
                     if(archive.f.Read(compressed, 1, entry.cSize) == entry.cSize)
                     {
                        unsigned long destLen = entry.size;
                        uncompress(uncompressed, &destLen, compressed, entry.cSize);
                        entry.size = (FileSize)destLen;
                     }
                     delete compressed;
                  }

                  file.position = 0;
                  file.size = entry.size;
                  file.buffer = uncompressed;

                  result = file;
               }
            }
            else
            {
               file.start = archive.f.Tell();
               file.position = 0;
               file.size = entry.size;
               file.f = archive.f;
               file.f.Seek(file.start, start);
               incref file.f;
               result = file;
            }
         }
         if(!result)
            delete file;
      }
      return result;
   }

   FileAttribs FileExists(const char * fileName)
   {
      FileAttribs result;
      EAREntry entry { };
      archive.f.Seek(position, start);
      result = EARGetEntry(archive.f, entry, fileName, null);
      return result;
   }

   ArchiveDir OpenDirectory(const char * name, FileStats stats, ArchiveAddMode addMode)
   {
      ArchiveDir result = null;
      EARArchiveDir dir { readOnly = addMode == readOnlyDir };
      if(dir)
      {
         char namePart[MAX_LOCATION] = "", nameRest[MAX_LOCATION];
         uint64 position;
         EAREntry entry { };

         dir.archive = archive;

         SplitDirectory(name, namePart, nameRest);

         if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
            strcpy(namePart, DIR_SEPS);

         // Search for directory

         position = archive.Find(this, namePart, entry);
         if(position)
         {
            // Fail if file of same name already exists
            if(entry.type == ENTRY_FILE)
               return null;
            else
            {
               dir.position = position + sizeof(EAREntry) + entry.nameLen;
               dir.first = 0;
               dir.last = 0;

               archive.f.Read(&dir.first, sizeof(uint), 1);
               archive.f.Read(&dir.last, sizeof(uint), 1);

               result = dir;
            }
         }

         // If directory doesn't exist already
         if(!result && addMode != refresh)
         {
            // Write Header if it's not the root directory
            EAREntry entry {};
            uint64 position;

            entry.nameLen = strlen(namePart);
            entry.prev = (uint)last;
            entry.next = 0;
            entry.type = ENTRY_FOLDER;
            if(!nameRest[0] && stats)
            {
               entry.created = (TimeStamp32)stats.created;
               entry.modified = (TimeStamp32)stats.modified;
            }

            position = archive.Position(sizeof(EAREntry) + entry.nameLen + 2*sizeof(uint));

            archive.f.Seek(position, start);
            archive.f.Write(entry, sizeof(EAREntry), 1);
            archive.f.Write(namePart, entry.nameLen, 1);

            last = (uint)position;
            if(!first) first = (uint)position;

            // Update the next pointer of previous entry
            if(entry.prev)
            {
               archive.f.Seek(entry.prev + OFFSET(EAREntry, next), start);
               archive.f.Write(&position, sizeof(uint), 1);
            }

            // Make the dir position point after the header
            dir.position = position + sizeof(EAREntry) + entry.nameLen;
         }
         // Just update the time stamps
         else if(result && !nameRest[0] && stats)
         {
            archive.f.Seek(position + OFFSET(EAREntry, created), start);
            archive.f.Write(&stats.created, sizeof(uint), 1);
            archive.f.Write(&stats.modified, sizeof(uint), 1);
         }
         result = dir;

         // Open rest of directory...
         if(result && nameRest[0])
         {
            result = dir.OpenDirectory(nameRest, stats, addMode);
            delete dir;
         }
      }
      return result;
   }

   bool Delete(const char * name)
   {
      EAREntry entry { };
      uint64 position;
      char namePart[MAX_LOCATION];

      strcpy(namePart, name);
      if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
         strcpy(namePart, DIR_SEPS);

      position = archive.Find(this, namePart, entry);
      if(position)
      {
         archive.Delete(this, position, entry);
         return true;
      }
      return false;
   }

   bool Move(const char * name, EARArchiveDir to)
   {
      bool result = false;
      if(position != to.position)
      {
         EAREntry entry { };
         uint64 position = 0;
         char namePart[MAX_LOCATION];

         strcpy(namePart, name);
         if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
            strcpy(namePart, DIR_SEPS);

         position = archive.Find(this, name, entry);
         if(position)
         {
            // Unlink from old directory
            if(entry.prev)
            {
               archive.f.Seek(entry.prev + OFFSET(EAREntry, next), start);
               archive.f.Write(&entry.next, sizeof(uint), 1);
            }
            if(entry.next)
            {
               archive.f.Seek(entry.next + OFFSET(EAREntry, prev), start);
               archive.f.Write(&entry.prev, sizeof(uint), 1);
            }
            if(last == position) last = entry.prev;
            if(first == position) first = entry.next;

            // Relink to new directory
            entry.prev = to.last;
            entry.next = 0;

            if(entry.prev)
            {
               archive.f.Seek(entry.prev + OFFSET(EAREntry, next), start);
               archive.f.Write(&position, sizeof(uint), 1);
            }
            if(!to.first)
               to.first = (uint)position;
            to.last = (uint)position;

            archive.f.Seek(position + OFFSET(EAREntry, prev), start);
            archive.f.Write(&entry.prev, sizeof(uint), 1);
            archive.f.Write(&entry.next, sizeof(uint), 1);

            result = true;
         }
      }
      return result;
   }

   bool Rename(const char * name, const char * newName)
   {
      bool result = false;
      EAREntry entry { };
      uint64 position = 0;
      char namePart[MAX_LOCATION];

      strcpy(namePart, name);
      if(!strcmp(namePart, "/") || !strcmp(namePart, "\\"))
         strcpy(namePart, DIR_SEPS);

      position = archive.Find(this, namePart, entry);
      if(position)
      {
         uint64 dataSize;
         EAREntry newEntry = entry;
         uint64 newPosition = position;

         if(entry.type == ENTRY_FOLDER)
            dataSize = 2 * sizeof(uint);
         else
            dataSize = entry.cSize ? entry.cSize : entry.size;

         newEntry.nameLen = strlen(newName);
         if(newEntry.nameLen > entry.nameLen)
         {
            // Write new entry
            newPosition = archive.Position(sizeof(EAREntry) + newEntry.nameLen + dataSize);

            archive.f.Seek(newPosition, start);
            archive.f.Write(&newEntry, sizeof(EAREntry), 1);
            archive.f.Write(newName, sizeof(char), newEntry.nameLen);

            // Fix the links
            if(entry.prev)
            {
               archive.f.Seek(entry.prev + OFFSET(EAREntry, next), start);
               archive.f.Write(&newPosition, sizeof(uint), 1);
            }
            if(entry.next)
            {
               archive.f.Seek(entry.next + OFFSET(EAREntry, prev), start);
               archive.f.Write(&newPosition, sizeof(uint), 1);
            }
            if(first == position) first = (uint)newPosition;
            if(last == position) last = (uint)newPosition;
         }
         else
         {
            // Change the name
            archive.f.Seek(position + OFFSET(EAREntry, nameLen), start);
            archive.f.Write(&newEntry.nameLen, sizeof(uint), 1);
            archive.f.Seek(position + sizeof(EAREntry), start);
            archive.f.Write(newName, sizeof(char), newEntry.nameLen);

            // There will be free space at the end of an entry with a shorter new name
            if(newEntry.nameLen < entry.nameLen)
               archive.AddFreeBlock(position + sizeof(EAREntry) + newEntry.nameLen + dataSize, entry.nameLen - newEntry.nameLen);
         }
         if(entry.nameLen != newEntry.nameLen)
         {
            byte * buffer;
            uint64 bufferSize = Min(dataSize, MAX_BUFFERSIZE);
            buffer = new byte[bufferSize];
            if(buffer)
            {
               uint64 readPosition = position + sizeof(EAREntry) + entry.nameLen;
               uint64 writePosition = newPosition + sizeof(EAREntry) + newEntry.nameLen;
               uint64 c;

               for(c = 0; c<dataSize; c += bufferSize)
               {
                  uint64 size = (dataSize > c + bufferSize) ? bufferSize : (dataSize - c);

                  archive.f.Seek(readPosition + c, start);
                  archive.f.Read(buffer, size, 1);

                  archive.f.Seek(writePosition + c, start);
                  archive.f.Write(buffer, size, 1);
               }
               delete buffer;
            }

            if(newEntry.nameLen > entry.nameLen)
            {
               // Prevent the children to be deleted
               if(entry.type == ENTRY_FOLDER)
               {
                  uint first = 0, last = 0;
                  archive.f.Seek(position + sizeof(EAREntry) + entry.nameLen, start);
                  archive.f.Write(&first, sizeof(uint), 1);
                  archive.f.Write(&last, sizeof(uint), 1);
               }

               // Delete the old entry
               entry.prev = entry.next = 0;
               archive.f.Seek(position + sizeof(EAREntry) + entry.nameLen, start);
               archive.Delete(this, position, entry);
            }
         }
         result = true;
      }
      return result;
   }

   bool AddFromFile(const char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition)
   {
      // Search for identical entry
      EAREntry oldEntry;
      uint64 oldPosition = archive.Find(this, name, oldEntry);
      return _AddFromFileAtPosition(oldEntry, oldPosition, name, input, stats, addMode, compression, ratio, newPosition);
   }

   bool AddFromFileAtPosition(uint oldPosition, const char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition)
   {
      EAREntry oldEntry;
      if(oldPosition)
      {
         if(!archive.f.Seek(oldPosition, start) || !archive.f.Read(oldEntry, sizeof(EAREntry), 1))
            return false;
      }
      return _AddFromFileAtPosition(oldEntry, oldPosition, name, input, stats, addMode, compression, ratio, newPosition);
   }

   bool _AddFromFileAtPosition(EAREntry oldEntry, uint64 oldPosition, const char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition)
   {
      bool skip = false;
      FileStats oldStats { };

      if(oldPosition)
      {
         oldStats.modified = (TimeStamp)oldEntry.modified;
         oldStats.created = (TimeStamp)oldEntry.created;
      }
      if(stats == null)
      {
         oldStats.size = (uint)input.GetSize();
         stats = &oldStats;
      }

      switch(addMode)
      {
         // Add all files
         case replace:
            if(oldPosition)
               archive.Delete(this, oldPosition, oldEntry);
            break;
         // Only updates changed files
         case refresh:
            if(oldPosition &&
                 (oldEntry.size != (uint)stats.size ||
                  oldEntry.modified != (TimeStamp32)stats.modified ||
                  oldEntry.created != (TimeStamp32)stats.created))
                  archive.Delete(this, oldPosition, oldEntry);
            else
               skip = true;
            break;
         // Only updates changed or new files
         case update:
            if(oldPosition)
            {
               if(oldEntry.size != (uint)stats.size ||
                  oldEntry.modified != (TimeStamp32)stats.modified ||
                  oldEntry.created != (TimeStamp32)stats.created)
                  archive.Delete(this, oldPosition, oldEntry);
               else
                  skip = true;
            }
            break;
      }

      if(!skip)
      {
         EAREntry entry { };
         uint64 position, size;
         byte * compressed = null;

         // Add the file
         entry.nameLen = strlen(name);
         entry.prev = last;
         entry.next = 0;
         entry.type = ENTRY_FILE;

         entry.size = (uint)stats.size;
         entry.created = (TimeStamp32)stats.created;
         entry.modified = (TimeStamp32)stats.modified;

         if(compression)
         {
            byte * uncompressed = new byte[entry.size];
            if(uncompressed)
            {
               if(input.Read(uncompressed, 1, entry.size) == entry.size)
               {
                  unsigned long destLen = entry.size + entry.size / 1000 + 12;

                  compressed = new byte[destLen];
                  if(compressed)
                  {
                     if(compression > 9 || compression < 0) compression = 9;
                     compress2(compressed, &destLen, uncompressed, entry.size, compression);
                     entry.cSize = (FileSize)destLen;
                  }
               }
               delete uncompressed;
            }
         }

         if(!compressed)
         {
            entry.cSize = 0;
            if(ratio)
               *ratio = 0;
         }
         else if(ratio)
            *ratio = entry.size ? (entry.cSize * 1000 / entry.size) : 0;

         // Find block
         size = sizeof(EAREntry) + entry.nameLen + (entry.cSize ? entry.cSize : entry.size);
         position = archive.Position(size);

         // Write Header
         if(!archive.f.Seek(position, start) ||
            !archive.f.Write(entry, sizeof(EAREntry), 1) ||
            !archive.f.Write(name, entry.nameLen, 1))
         {
            delete compressed;
            return false;
         }

         // Write File Data
         if(compressed)
         {
            if(!archive.f.Write(compressed, 1, entry.cSize))
            {
               delete compressed;
               return false;
            }
            delete compressed;
         }
         else
         {
            byte buffer[8192];
            uint c;
            int64 count = 1;
            for(c = 0; c<entry.size && count; c+= count)
            {
               count = input.Read(buffer, 1, sizeof(buffer));
               if(!archive.f.Write(buffer, 1, count))
                  return false;
            }
         }

         // Update the next pointer previous entry
         if(entry.prev)
         {
            archive.f.Seek(entry.prev + OFFSET(EAREntry, next), start);
            archive.f.Write(&position, sizeof(uint), 1);
         }

         // Update total size of archive
         archive.totalSize += entry.size;

         last = (uint)position;
         if(!first) first = (uint)position;
         if(newPosition) *newPosition = (uint)position;
      }
      else
      {
         if(newPosition) *newPosition = 0;
      }

      // archive.f.handle = archive.f;
      return true;
   }
};
#endif // !defined(ECERE_NOARCHIVE) && !defined(ECERE_VANILLA)

// Directory Description for file listing
class EARDir : struct
{
   char path[MAX_LOCATION];
   File f;
   uint next;
};

class EARFile : File
{
   uint64 position;
   uint64 size;

   // -- For reading compressed file (entirely buffered)
   byte * buffer;

   // -- For reading uncompressed file (not buffered)
   File f;
   uint64 start;

   ~EARFile()
   {
      delete buffer;
      delete f;
   }

   void CloseInput()
   {
      if(f)
         f.CloseInput();
   }

   void CloseOutput()
   {
      if(f)
         f.CloseOutput();
   }

   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      uintsize read = 0;
      if(f)
         f.Seek(position + start, start);
      read = Min(count, (this.size - position) / size);
      if(this.buffer)
         CopyBytes(buffer, this.buffer + position, read * size);
      else
         read = f.Read(buffer, size, read);
      position += read * size;
      return read;
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      return 0;
   }

   bool Getc(char * ch)
   {
      if(position < size)
      {
         if(buffer)
         {
            char b = buffer[position++];
            if(ch) *ch = b;
            return true;
         }
         else
         {
            f.Seek(position + start, start);
            position++;
            return f.Getc(ch);
         }
      }
      return false;
   }

   bool Putc(char ch)
   {
      return false;
   }

   bool Puts(const char * string)
   {
      return false;
   }

   bool Seek(int64 pos, FileSeekMode mode)
   {
      bool result = false;
      switch(mode)
      {
         case start:
            if(pos <= (int)size)
            {
               position = pos;
               if(f)
                  result = f.Seek(position + start, start);
               else
                  result = true;
            }
            break;
         case current:
            if(position + pos <= (int)size && (int)position >= -pos)
            {
               position += pos;
               if(f)
                  result = f.Seek(position + start, start);
               else
                  result = true;
            }
            break;
         case end:
            if(pos < 0 && -pos <= (int)size)
            {
               position = size + pos;
               if(f)
                  f.Seek(position + start, start);
               else
                  result = true;
            }
            break;
      }
      return result;
   }

   uint64 Tell()
   {
      return position;
   }

   bool Eof()
   {
      return position >= size || (f && f.Eof());
   }

   uint64 GetSize()
   {
      return size;
   }
};

class EARFileSystem : FileSystem
{
   File ::Open(const char * archive, const char * name, FileOpenMode mode)
   {
      File result = null;
      if(mode == read)
      {
         EARFile file {};
         if(file)
         {
            char fileName[MAX_LOCATION];
            EARHeader header;
            File f = EAROpenArchive(archive, &header);
            strcpy(fileName, name);
   #ifdef ECERE_STATIC
            if(!f && archive[0] == ':')
            {
               f = EAROpenArchive(":", &header);
               if(f)
               {
                  strcpy(fileName, archive + 1);
                  PathCat(fileName, name);
               }
            }
   #endif
            if(f)
            {
               EAREntry entry { };
               if(EARGetEntry(f, entry, fileName, null).isFile)
               {
                  if(entry.cSize)
                  {
                     byte * uncompressed = new byte[entry.size];
                     if(uncompressed)
                     {
                        byte * compressed = new byte[entry.cSize];
                        if(compressed)
                        {
                           if(f.Read(compressed, 1, entry.cSize) == entry.cSize)
                           {
                              unsigned long destLen = entry.size;
                              uncompress(uncompressed, &destLen, compressed, entry.cSize);
                              entry.size = (FileSize)destLen;
                           }
                           delete compressed;
                        }

                        file.position = 0;
                        file.size = entry.size;
                        file.buffer = uncompressed;

                        result = file;
                     }
                  }
                  else
                  {
                     file.start = f.Tell();
                     file.position = 0;
                     file.size = entry.size;
                     file.f = f;
                     f = null;

                     result = file;
                  }
               }
               delete f;
            }
            if(!result)
               delete file;
         }
      }
      return result;
   }

   FileAttribs ::Exists(const char * archive, const char * fileName)
   {
      uint result = 0;
      EARHeader header;
      File f = EAROpenArchive(archive, &header);
      if(f)
      {
         EAREntry entry { };
         result = EARGetEntry(f, entry, fileName, null);
         delete f;
      }
   #ifdef ECERE_STATIC
      if(!f && archive[0] == ':')
      {
         f = EAROpenArchive(":", &header);
         if(f)
         {
            EAREntry entry { };
            char fn[MAX_LOCATION];
            strcpy(fn, archive + 1);
            PathCat(fn, fileName);
            result = EARGetEntry(f, entry, fn, null);
         }
         delete f;
      }
   #endif
      return result;
   }

   bool ::GetSize(const char * archive, const char * fileName, FileSize * size)
   {
      bool result = false;
      EARHeader header;
      File f = EAROpenArchive(archive, &header);
      if(f)
      {
         EAREntry entry { };
         if(EARGetEntry(f, entry, fileName, null))
            *size = entry.size;
         delete f;
         result = true;
      }
      return result;
   }

   bool ::Stats(const char * archive, const char * fileName, FileStats stats)
   {
      bool result = false;
      EARHeader header;
      File f = EAROpenArchive(archive, &header);
      if(f)
      {
         EAREntry entry { };
         if(EARGetEntry(f, entry, fileName, null))
         {
            stats.size = entry.size;
            stats.accessed = 0;
            stats.modified = (TimeStamp)entry.modified;
            stats.created = (TimeStamp)entry.created;
            result = true;
         }
         delete f;
      }
      return result;
   }

   void ::FixCase(const char * archive, char * name)
   {
   #ifdef __WIN32__
      EARHeader header;
      File f = EAROpenArchive(archive, &header);
      if(f)
      {
         EAREntry entry { };
         char fileName[MAX_LOCATION] = "";
         if(EARGetEntry(f, entry, name, fileName))
            strcpy(name, fileName);
         delete f;
      }
   #endif
   }

   bool ::Find(FileDesc file, const char * archive, const char * name)
   {
      bool result = false;
      EARDir d {};
      if(d)
      {
         EARHeader header;
         File f = EAROpenArchive(archive, &header);
         if(f)
         {
            EAREntry entry { };
            if(EARGetEntry(f, entry, name, null).isDirectory)
            {
               uint first = 0, last = 0;

               sprintf(d.path, "<%s>%s", archive, name);
               d.f = f;
               f.Read(&first, sizeof(uint), 1);
               f.Read(&last, sizeof(uint), 1);
               d.next = first;
               if(d.next)
               {
                  EAREntry entry { };
                  d.f.Seek(d.next, start);
                  d.f.Read(entry, sizeof(EAREntry), 1);
                  d.f.Read(file.name, 1, entry.nameLen);
                  file.name[entry.nameLen] = '\0';
                  file.stats.attribs = { isDirectory = (entry.type == ENTRY_FOLDER), isFile = (entry.type != ENTRY_FOLDER) };
                  file.stats.accessed = file.stats.modified = (TimeStamp)entry.modified;
                  file.stats.created = (TimeStamp)entry.created;
                  file.stats.size = entry.size;

                  strcpy(file.path, d.path);
                  PathCat(file.path, file.name);
                  d.next = entry.next;

                  file.dir = (Dir)d;

                  result = true;
               }
            }
            if(!result)
               delete f;
         }
         if(!result)
            delete d;
      }
      return result;
   }

   bool ::FindNext(FileDesc file)
   {
      bool result = false;
      EARDir d = (EARDir)file.dir;
      if(d.next)
      {
         EAREntry entry { };
         d.f.Seek(d.next, start);
         d.f.Read(entry, sizeof(EAREntry), 1);
         d.f.Read(file.name, 1, entry.nameLen);
         file.name[entry.nameLen] = '\0';
         file.stats.attribs = FileAttribs { isDirectory = (entry.type == ENTRY_FOLDER), isFile = (entry.type != ENTRY_FOLDER) };
         file.stats.accessed = file.stats.modified = (TimeStamp)entry.modified;
         file.stats.created = (TimeStamp)entry.created;
         file.stats.size = entry.size;

         strcpy(file.path, d.path);
         PathCat(file.path, file.name);
         d.next = entry.next;

         result = true;
      }
      return result;
   }

   void ::CloseDir(FileDesc file)
   {
      EARDir d = (EARDir)file.dir;
      if(d.f)
         delete d.f;
      if(d)
         delete d;
   }

#if !defined(ECERE_NOARCHIVE) && !defined(ECERE_VANILLA)
   Archive ::OpenArchive(const char * fileName, ArchiveOpenFlags flags)
   {
      Archive result = null;
      EARArchive archive { writeAccess = flags.writeAccess };
      if(archive)
      {
         int try = flags.waitLock ? 10 : 0;
         for(; try >= 0; try--)
         {
            // Check for existing Archive
            if((archive.f = fileName ? (flags.buffered ? FileOpenBuffered : FileOpen)(fileName, flags.writeAccess ? readWrite : read) : TempFile { openMode = readWrite } ))
            {
               EARHeader header;
               bool opened = false;
               uint archiveSize = 0;
               archive.f.Seek(-(int)sizeof(uint), end);
               archive.f.Read(&archiveSize, sizeof(uint), 1);
               archive.f.Seek(-(int)archiveSize, end);

               archive.archiveStart = archive.f.Tell();
               if(archive.f.Read(&header, sizeof(EARHeader), 1) == 1 &&
                  !memcmp(header.recognition, earRecognition, sizeof(earRecognition)))
                  opened = true;

               if(!opened)
               {
                  archive.f.Seek(0, start);
                  archive.archiveStart = archive.f.Tell();
                  archiveSize = (uint)archive.f.GetSize();
                  if(archive.f.Read(&header, sizeof(EARHeader), 1) == 1 &&
                     !memcmp(header.recognition, earRecognition, sizeof(earRecognition)))
                     opened = true;
               }

               if(opened)
               {
                  // At this point we recognized the file as a valid eAR archive
                  archive.rootDir = archive.archiveStart + sizeof(EARHeader);
                  archive.totalSize = header.totalSize;

                  archive.f.Seek(archive.rootDir, start);
                  if(flags.writeAccess)
                  {
                     if(flags.buffered)
                     {
                        archive.freeBlocks.Add(FreeBlock { start = archive.rootDir + 2 * sizeof(uint), end = MAXDWORD });
                        archive.SubtractUsedBlocks();
                     }
                     else
                     {
                        archive.freeBlocks.Add(FreeBlock { start = archive.archiveStart + (archiveSize - sizeof(uint)), end = MAXDWORD });
                     }
                  }

                  /*
                  if(!flags.writeAccess)
                  {
                     delete archive.f;
                     archive.f = FileOpen(fileName, readWrite);
                  }
                  */
                  if(archive.f)
                  {
                     incref archive.f;
                     result = archive;
                  }
               }
               break;
            }
            else if(try > 0)
               Sleep(0.01);
         }

         // This piece of code will create a new archive as a new file or at the footer
         // of an existing file.
         if(!result && flags.writeAccess)
         {
            // If the file doesn't exist, create it
            if(!archive.f)
            {
               archive.f = FileOpen(fileName, writeRead);
               delete archive.f;
               archive.f = (flags.buffered ? FileOpenBuffered : FileOpen)(fileName, readWrite);
            }
            if(archive.f)
            {
               EARHeader header
               {
                  EAR_RECOGNITION,
                  MDWORD(0, 1)
               };

               archive.f.Seek(0, end);

               archive.archiveStart = archive.f.Tell();
               archive.freeBlocks.Add(FreeBlock { start = archive.archiveStart + sizeof(EARHeader), end = MAXDWORD });

               // Write Header
               archive.f.Write(&header, sizeof(EARHeader), 1);
               {
                  uint first = 0, last = 0;
                  archive.f.Write(&first, sizeof(first), 1);
                  archive.f.Write(&last, sizeof(last), 1);
               }

               archive.rootDir = 0;
               incref archive.f;
               result = archive;
            }
         }
         if(archive.f && flags.writeAccess && flags.exclusive && !archive.f.Lock(flags.exclusive ? exclusive : shared, 0, 0, flags.waitLock))
            result = null;
         if(!result)
         {
            delete archive.f;
            delete archive;
         }
         else
         {
            // archive.f.handle = archive.f;
         }
      }
      return result;
   }
#endif // !defined(ECERE_NOARCHIVE) && !defined(ECERE_VANILLA)
   bool ::QuerySize(const char * archive, FileSize * size)
   {
      bool result = false;
      EARHeader header;
      File f = EAROpenArchive(archive, &header);
      if(f)
      {
         *size = header.totalSize;
         result = true;
         delete f;
      }
      return result;
   }
};
