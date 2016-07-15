namespace sys;

import "System"

#if !defined(__EMSCRIPTEN__)

public class FileChange
{
public:
   bool created:1;   // param: new file name
   bool renamed:1;   // param: new file name
   bool modified:1;
   bool deleted:1;
   bool attribs:1;   // param: new attributes
};

public define AnyFileChange = FileChange { true, true, true, true, true };

// *** File Monitoring ***

static class FileEntry : struct
{
   FileEntry prev, next;
   FileSize size;
   FileAttribs attribs;
   TimeStamp modified;
   char * name;

   void Free()
   {
      delete name;
   }
};

public class FileMonitor
{
public:
   property void * userData { set { data = value; } };
   property FileChange fileChange { set { watchFor = value; } };
   property const char * fileName
   {
      set
      {
         //incref this;
         StopMonitoring();
         delete fileName;
         if(value) MonitorFile(value);
         //delete this;
      }
      get { return fileName; }
   };
   property const char * directoryName
   {
      set
      {
         //incref this;
         StopMonitoring();
         delete fileName;
         if(value) MonitorDirectory(value);
         // delete this;
      }
      get { return fileName; }
   };

   void StopMonitoring()
   {
      if(active)
      {
         globalSystem.fileMonitorMutex.Wait();

         if(reentrant)
         {
            toBeFreed = true;
            fileNotifies.Free(FileNotify::Free);
         }
         else
            FreeMonitor();

         active = false;
         globalSystem.fileMonitorMutex.Release();
      }
   }

   void StartMonitoring()
   {
      if(fileName && !active)
      {
         globalSystem.fileMonitorMutex.Wait();
         if(reentrant)
         {
            toBeFreed = false;
            active = true;
         }
         //else
         {
            if(directory)
               MonitorDirectory(fileName);
            else
               MonitorFile(fileName);
         }
         globalSystem.fileMonitorMutex.Release();
      }
   }

private:
   FileMonitor prev, next;
   char * fileName;
   FileChange watchFor;
   void * data;
   bool reentrant, toBeFreed;
   OldList fileNotifies;
   bool active;

   // For file monitors
   bool exists;
   TimeStamp modified;
   FileSize size;
   FileAttribs attribs;
   public virtual bool any_object::OnDirNotify(FileChange action, const char * fileName, const char * param);

   // For directory monitors
   bool directory;
   OldList files;
   public virtual bool any_object::OnFileNotify(FileChange action, const char * param);

   /*
#if defined(__WIN32__)
   HANDLE handle;
#elif defined(__linux__)
   int fd;
#endif
   */

   ~FileMonitor()
   {
      globalSystem.fileMonitorMutex.Wait();
      delete fileName;

      // if(active)
         FreeMonitor();
      globalSystem.fileMonitorMutex.Release();
   }

   void MonitorFile(const char * filePath)
   {
      FileAttribs exists = FileExists(filePath);
      FileStats stats;
      String oldFileName = fileName;

      //incref this;
      globalSystem.fileMonitorMutex.Wait();

      files.Free(FileEntry::Free);
      fileNotifies.Free(FileNotify::Free);

      if(!active && !toBeFreed)
         globalSystem.fileMonitors.Add(this);
      this.exists = exists && !exists.isDirectory;
      fileName = CopyString(filePath);
      delete oldFileName;
      this.watchFor = watchFor;

      if(FileGetStats(filePath, stats))
      {
         attribs = stats.attribs;
         size = stats.size;
         modified = stats.modified;
#ifdef _DEBUG
         /*if(strstr(filePath, "Debugger"))
            printf("modified is %x", modified);*/
#endif
      }

      active = true;
      toBeFreed = false;

      globalSystem.fileMonitorMutex.Release();

      if(!globalSystem.fileMonitorThread)
      {
         globalSystem.fileMonitorThread = MonitorThread { };
         //incref globalSystem.fileMonitorThread;
         globalSystem.fileMonitorThread.Create();
      }
   }

   void MonitorDirectory(const char * filePath)
   {
      FileStats stats;
      String oldFileName = fileName;

      //incref this;
      globalSystem.fileMonitorMutex.Wait();

      files.Free(FileEntry::Free);
      fileNotifies.Free(FileNotify::Free);

      if(!active && !toBeFreed)
         globalSystem.fileMonitors.Add(this);
      directory = true;
      exists = FileExists(filePath).isDirectory;

      this.watchFor = watchFor;
      fileName = CopyString(filePath);
      delete oldFileName;

      if(FileGetStats(fileName, stats))
      {
         attribs = stats.attribs;
         size = stats.size;
         modified = stats.modified;
      }

      // Initialize files in directory
      GetFileEntries(&files, fileName);

      active = true;
      toBeFreed = false;

      globalSystem.fileMonitorMutex.Release();

      if(!globalSystem.fileMonitorThread)
      {
         globalSystem.fileMonitorThread = MonitorThread { };
         globalSystem.fileMonitorThread.Create();
      }
   }

   void FreeMonitor()
   {
      files.Free(FileEntry::Free);
      fileNotifies.Free(FileNotify::Free);
      globalSystem.fileMonitors.Remove(this);
      // delete this;
   }

   bool AddFileNotify(FileChange action, const char * fileName, const char * param)
   {
      if(watchFor & action)
      {
         fileNotifies.Add(FileNotify {
               monitor = this, action = action, fileName = CopyString(fileName), param = CopyString(param)
            });
         return true;
      }
      return false;
   }
};

private class FileNotify : struct
{
   FileNotify prev, next;
   FileMonitor monitor;
   FileChange action;
   char * fileName;
   char * param;

   void Free()
   {
      delete fileName;
      delete param;
   }
};

static define FILE_MONITOR_RESOLUTION = 1.0; // Once every second

static int CompareFiles(FileEntry e1, FileEntry e2, void * data)
{
   if(!e1.attribs.isDirectory && e2.attribs.isDirectory)
      return 1;
   else if(e1.attribs.isDirectory && !e2.attribs.isDirectory)
      return -1;
   else
      return strcmp(e1.name, e2.name);
}

static void GetFileEntries(OldList list, const char * path)
{
   FileListing listing { path, null };
   while(listing.Find())
   {
      list.Add(FileEntry {
            name = CopyString(listing.name),
            attribs = listing.stats.attribs,
            modified = listing.stats.modified,
            size = listing.stats.size
         });
   }
   list.Sort(CompareFiles, null);
}

static class MonitorThread : Thread
{
   uint Main()
   {
      Time lastTime = 0;

      while(!globalSystem.systemTerminate)
      {
         Time currentTime = GetTime();
         if(currentTime - lastTime > FILE_MONITOR_RESOLUTION)
         {
            FileMonitor monitor;
            bool fileActivity = false;
            lastTime = currentTime;

            // printf("[%d] Waiting in MonitorThread for fileMonitor Mutex %x...\n", (int)GetCurrentThreadID(), globalSystem.fileMonitorMutex);
            globalSystem.fileMonitorMutex.Wait();

            for(monitor = globalSystem.fileMonitors.first; monitor; monitor = monitor.next)
            {
               if(monitor.directory)
               {
                  bool exists = FileExists(monitor.fileName).isDirectory;
                  if(exists && !monitor.exists)
                  {
                     fileActivity |= monitor.AddFileNotify(FileChange { created = true }, monitor.fileName, null);
                     monitor.exists = exists;
                  }
                  else if(!exists && monitor.exists)
                  {
                     fileActivity |= monitor.AddFileNotify(FileChange { deleted = true }, monitor.fileName, null);
                     monitor.exists = exists;
                  }
                  else if(exists && monitor.watchFor & FileChange { created = true, deleted = true, modified = true, attribs = true})
                  {
                     FileEntry entry;
                     FileEntry newEntry;
                     OldList newEntries = { 0 };
                     GetFileEntries(&newEntries, monitor.fileName);

                     // Directory comparison
                     entry = monitor.files.first;
                     newEntry = newEntries.first;

                     while(entry || newEntry)
                     {
                        int comparison;
                        if(!entry)         comparison = 1;
                        else if(!newEntry) comparison = -1;
                        else               comparison = strcmp(entry.name,newEntry.name);

                        if(comparison > 0)
                        {
                           fileActivity |= monitor.AddFileNotify(FileChange { created = true }, newEntry.name, null);
                           newEntry = newEntry.next;
                        }
                        else if(comparison < 0)
                        {
                           fileActivity |= monitor.AddFileNotify(FileChange { deleted = true }, entry.name, null);
                           entry = entry.next;
                        }
                        else
                        {
                           if(newEntry.modified != entry.modified || newEntry.size != entry.size)
                           {
                              fileActivity |= monitor.AddFileNotify(FileChange { modified = true }, entry.name, null);
                           }
                           else if(newEntry.attribs != entry.attribs)
                           {
                              fileActivity |= monitor.AddFileNotify(FileChange { attribs = true }, entry.name, null);
                           }
                           entry = entry.next;
                           newEntry = newEntry.next;
                        }
                     }
                     monitor.files.Free(FileEntry::Free);
                     monitor.files = newEntries;
                  }
               }
               else if(monitor.fileName)
               {
                  FileAttribs exists = FileExists(monitor.fileName);
                  // printf("Iterating on Monitor for %s...\n", monitor.fileName);

                  if((exists && !exists.isDirectory) && !monitor.exists)
                  {
                     fileActivity |= monitor.AddFileNotify(FileChange { created = true }, monitor.fileName, null);
                     monitor.exists = true;
                  }
                  else if((!exists || exists.isDirectory) && monitor.exists)
                  {
                     fileActivity |= monitor.AddFileNotify(FileChange { deleted = true }, monitor.fileName, null);
                     monitor.exists = false;
                  }
                  else if(monitor.exists)
                  {
                     FileStats stats { };
                     if(FileGetStats(monitor.fileName, stats))
                     {
#ifdef _DEBUG
                        /*if(strstr(monitor.fileName, "Debugger"))
                           printf("Now modified is %x\n", stats.modified);*/
#endif

                        if(stats.modified != monitor.modified || stats.size != monitor.size)
                        {
                           // printf("Modified/size changed, adding file notify...\n");
                           if(stats.modified > monitor.modified || monitor.modified - (TimeStamp)stats.modified > 2)
                              fileActivity |= monitor.AddFileNotify(FileChange { modified = true }, monitor.fileName, null);
                           monitor.size = stats.size;
                           monitor.modified = stats.modified;
#ifdef _DEBUG
                           /*if(strstr(monitor.fileName, "Debugger"))
                              printf("Setting modified to %x\n", monitor.modified);*/
#endif
                        }
                        else if(stats.attribs != monitor.attribs)
                        {
                           // printf("Attribs changed, adding file notify...\n");

                           fileActivity |= monitor.AddFileNotify(FileChange { attribs = true }, monitor.fileName, null);
                           monitor.attribs = stats.attribs;
                        }
                     }
                  }
               }
            }
            if(fileActivity)
            {
               // printf("[%d] Signaling Event...\n", (int)GetCurrentThreadID());
               guiApp.SignalEvent();
            }

            // printf("[%d] Releasing Mutex...\n", (int)GetCurrentThreadID());
            globalSystem.fileMonitorMutex.Release();
         }

         // printf("[%d] Sleeping...\n", (int)GetCurrentThreadID());
         Sleep(1.0 / 18.2);
      }
      return 0;
   }
}

#endif // !defined(__EMSCRIPTEN__)
