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
   virtual ArchiveDir OpenDirectory(const char * name, FileStats stats, ArchiveAddMode addMode);
   virtual bool Clear(void);

   virtual File FileOpenCompressed(const char * fileName, bool * isCompressed, uint64 * ucSize);
   virtual File FileOpen(const char * fileName);
   virtual FileAttribs FileExists(const char * fileName);
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
   virtual ArchiveDir OpenDirectory(const char * name, FileStats stats, ArchiveAddMode addMode);
   virtual bool AddFromFile(const char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
   virtual bool AddFromFileAtPosition(uint position, const char * name, File input, FileStats stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
   virtual bool Delete(const char * fileName);
   virtual bool Move(const char * name, ArchiveDir to);
   virtual bool Rename(const char * name, const char * newName);
   virtual File FileOpen(const char * fileName);
   virtual FileAttribs FileExists(const char * fileName);

   bool Add(const char * name, const char * path, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition)
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

public Archive ArchiveOpen(const char * fileName, ArchiveOpenFlags flags)
{
   return EARFileSystem::OpenArchive(fileName, flags);
}
#endif

public bool ArchiveQuerySize(const char * fileName, FileSize * size)
{
   return EARFileSystem::QuerySize(fileName, size);
}
