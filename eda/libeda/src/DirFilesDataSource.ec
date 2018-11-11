import "EDA.ec"

public class DirFilesDataSourceDriver : DataSourceDriver
{
public: // this should be visible only to the overriding class, missing access/visibility level
   const String path;
   const String databaseFileExt;
   const String tableFileExt;

   virtual bool IsDatabaseFile(const char *fullPath)
   {
      return FileExists(fullPath).isFile;
   }

   String MakeDatabasePath(const String name)
   {
      if(name)
      {
         char dbPath[MAX_LOCATION];
         const char *ext = databaseFileExt;
         strcpy(dbPath, path ? path : "");
         if(ext && *ext)
         {
            char *fileName = new char[strlen(name)+strlen(ext)+8];
            char nameExt[MAX_EXTENSION];
            GetExtension(name, nameExt);
            strcpy(fileName, name);
            if(!nameExt[0] || strcmp(nameExt, ext))
            {
               strcat(fileName, ".");
               strcat(fileName, ext);
            }
            PathCat(dbPath, fileName);
            delete fileName;
         }
         else
            PathCat(dbPath, name);
         return CopyString(dbPath);
      }
      return null;
   }

private:
   Array<const String> databases { }; // TODO: make this List<Databases> databases { };

   DirFilesDataSourceDriver()
   {
      subclass(DataSourceDriver) c = (subclass(DataSourceDriver))_class;
      databaseFileExt = c.databaseFileExtension;
      tableFileExt = c.tableFileExtension;
   }

   ~DirFilesDataSourceDriver()
   {
      delete (void *)path;
      databases.Free();
   }

   String BuildLocator(DataSource ds)
   {
      return CopyString(ds.host);
   }

   uint GetDatabasesCount()
   {
      return databases.count;
   }

   Array<const String> GetDatabases()
   {
      UpdateDatabaseList();
      return databases;
   }

   bool Connect(const String locator)
   {
      delete (void *)path;
      path = CopyString(locator);
      if(path && (path[0] == '\0' || FileExists(path)))
      {
         UpdateDatabaseList();
         return true;
      }
      return false;
   }

   void UpdateDatabaseList()
   {
      FileListing listing { path, databaseFileExt };
      databases.Free();
      while(listing.Find())
      {
         if(IsDatabaseFile(listing.path))
         {
            const char * ext = databaseFileExt;
            char * fileName = CopyString(listing.name);
            if(ext && *ext)
            {
               char fileExt[MAX_EXTENSION];
               GetExtension(fileName, fileExt);
               if(!strcmp(fileExt, ext))
                  StripExtension(fileName);
            }
            databases.Add(fileName);
         }
      }
   }

   void Status()
   {
      Log($"Status: Feeling groovy!\n");
   }

   bool RenameDatabase(const String name, const String rename)
   {
      if(name && rename && path && FileExists(path))
      {
         Iterator<const String> it { databases };
         if(it.Find(name))
         {
            String path;
            path = MakeDatabasePath(name);
            databases.Delete(it.pointer);
            if(FileExists(path))
            {
               bool renamed;
               String repath;
               repath = MakeDatabasePath(rename);
               renamed = RenameFile(path, repath);
               databases.Add(CopyString(rename));
               delete path;
               delete repath;
               return renamed;
            }
            delete path;
         }
      }
      return false;
   }

   bool DeleteDatabase(const String name)
   {
      if(name && path && FileExists(path))
      {
         bool deleted = false;
         Iterator<const String> it { databases };
         if(it.Find(name))
         {
            String path = MakeDatabasePath(name);
            deleted = DeleteFile(path);  // delete file seems to return true even if the file does not exist
            databases.Delete(it.pointer);
            delete path;
         }
         return deleted;
      }
      return false;
   }
}
