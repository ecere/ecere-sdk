namespace sys;

import "System"

#if !defined(ECERE_NOARCHIVE) && !defined(ECERE_VANILLA)
public enum ArchiveAddMode { replace, refresh, update, readOnlyDir };

public class ArchiveOpenFlags : uint
{
public:
   bool writeAccess:1;
   bool buffered:1;
   bool exclusive:1;
   bool waitLock:1;
};

public class Archive
{
   FileSize totalSize;

public:
   virtual ArchiveDir OpenDirectory(char * name, FileStats stats, ArchiveAddMode addMode);
   virtual bool Clear(void);

   virtual File FileOpen(char * fileName);
   virtual FileAttribs FileExists(char * fileName);
   virtual File FileOpenAtPosition(uint position);
   virtual void SetBufferSize(uint bufferSize);
   virtual void SetBufferRead(uint bufferRead);

   property FileSize totalSize { set { totalSize = value; } get { return totalSize; } }
   property uint bufferSize { set { SetBufferSize(value); } }
   property uint bufferRead { set { SetBufferRead(value); } }
};

public class ArchiveDir
{
public:
   virtual ArchiveDir OpenDirectory(char * name, FileStats stats, ArchiveAddMode addMode);
   virtual bool AddFromFile(char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
   virtual bool AddFromFileAtPosition(uint position, char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
   virtual bool Delete(char * fileName);
   virtual bool Move(char * name, ArchiveDir to);
   virtual bool Rename(char * name, char * newName);
   virtual File FileOpen(char * fileName);
   virtual FileAttribs FileExists(char * fileName);

   bool Add(char * name, char * path, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition)
   {
      bool result = false;
      File file = ::FileOpen(path, read);
      if(file)
      {
         FileStats stats;
         FileGetStats(path, stats);
         result = AddFromFile(name, file, stats, addMode, compression, ratio, newPosition);
         delete file;
      }
      return result;
   }
}

public Archive ArchiveOpen(char * fileName, ArchiveOpenFlags flags)
{
   return EARFileSystem::OpenArchive(fileName, flags);
}
#endif

public bool ArchiveQuerySize(char * fileName, FileSize * size)
{
   return EARFileSystem::QuerySize(fileName, size);
}
