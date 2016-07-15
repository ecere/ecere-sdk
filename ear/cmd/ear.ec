#ifdef __APPLE__
#define __unix__
#endif

#if defined(__unix__) || defined(__APPLE__)
#define uint _uint
#include <sys/stat.h>
#undef uint
#endif

import "ecere"

static void ShowSyntax()
{
   Log("ECERE Archiver v0.1\n");
   Log("Copyright (c) 2003 Jerome Jacovella-St-Louis\n\n");
   Log($"General Syntax:\n");
   Log($"   eAR <command> <archive> <parameters>\n");
   Log($"Extraction Commands:\n");
   Log($"   v  (View)         <archive> [files...]\n");
   Log($"   x  (Extract All)  <archive> [where]\n");
   Log($"   e  (Extract)      <archive> <files...>\n");
   Log($"Modification Commands:\n");
   Log($"   a  (Add)          <archive> <files...>\n");
   Log($"   r  (Refresh)      <archive> <files...>\n");
   Log($"   u  (Update)       <archive> <files...>\n");
   Log($"   m  (Move)         <archive> <files...> <to>\n");
   Log($"   n  (Rename)       <archive> <file> <new name>\n");
   Log($"   d  (Delete)       <archive> <files...>\n");
   Log($"   c  (Clear)        <archive>\n");
   Log($"   s  (Self Extract) <archive> <self-extractable> (With a: overwrite)\n");
   Log($"Options:\n");
   Log($"(aru)    f  Treat <files> as folders to pack at the root of the archive\n");
   Log($"(aru)    0  No Compression\n");
   Log($"(aru)    1 ... 9  (Fastest Compression ... Best Compression (default = 9))\n");
   Log($"(earu)   w  Specify an output directory after <files>\n");
   Log($"(xearu)  q  Quiet mode\n");
}

#define ARCHIVE_ACTION_VIEW      1
#define ARCHIVE_ACTION_XTRACTALL 2
#define ARCHIVE_ACTION_EXTRACT   4
#define ARCHIVE_ACTION_ADD       5
#define ARCHIVE_ACTION_MOVE      6
#define ARCHIVE_ACTION_RENAME    7
#define ARCHIVE_ACTION_DELETE    8
#define ARCHIVE_ACTION_CLEAR     9
#define ARCHIVE_ACTION_SELFEXT   10

static void ViewArchive(const char * path)
{
   FileListing listing { path };
   char string[MAX_LOCATION];
   const char * directory;

   SplitArchivePath(path, string, &directory);

   if(directory[0])
   {
      strcpy(string, directory);
      if(!strcmp(directory, "/") || !strcmp(directory, "\\"))
         strcpy(string, DIR_SEPS);
      else
         strcat(string, DIR_SEPS);
      strcat(string, "\n");
      Log(string);
   }

   while(listing.Find())
   {
      char timeString[100]; //28]; I18n strings take up more characters
      strcpy(string, directory);
      if(string[0])
      {
         if(!strcmp(directory, "/") || !strcmp(directory, "\\"))
            strcpy(string, DIR_SEPS);
         else
            strcat(string, DIR_SEPS);
      }
      PathCat(string, listing.name);

      ((DateTime)listing.stats.modified).local.OnGetString(timeString, null, null);

      strcat(string, $"\n   Modified: ");
      strcat(string, timeString);
      strcat(string, "\n");

      if(listing.stats.attribs.isDirectory)
         ViewArchive(listing.path);
      else
         Log(string);
   }
}
#define BUFFERSIZE 0x10000

static void ExtractFileFromArchive(const char * path, const char * outputFile)
{
   char fileName[MAX_LOCATION];
   FileAttribs exists = FileExists(path);
   bool setTime = false;
   FileStats stats;

   if(exists.isDirectory)
   {
      FileListing listing { path };

      if(outputFile[0])
      {
         if(MakeDir(outputFile))
         {
            setTime = true;
            FileGetStats(path, &stats);
         }
      }

      while(listing.Find())
      {
         strcpy(fileName, outputFile);

         // Tweak file name if out
         if(outputFile[0])
         {
            if(!strcmp(fileName, ".")) fileName[0] = '\0';
            if(listing.name[0] == '/' || listing.name[0] == '\\')
            {
               char * afterSlash, rest[MAX_LOCATION];
               for(afterSlash = fileName; *afterSlash == '/' || *afterSlash == '\\'; afterSlash++);
               strcpy(rest, afterSlash);
               PathCat(fileName, "_root");
               PathCat(fileName, rest);
            }
            else if(listing.name[1] == ':')
            {
               char letter[10];
               sprintf(letter, "_%cdrive", toupper(listing.name[0]));
               PathCat(fileName, letter);
               PathCat(fileName, listing.name[2] ? (listing.name + 3) : (listing.name + 2));
            }
            else
               PathCat(fileName, listing.name);
         }
         else
            PathCat(fileName, listing.name);
         if(!strcmp(fileName, "/") || !strcmp(fileName, "\\"))
            strcpy(fileName, DIR_SEPS);
         ExtractFileFromArchive(listing.path, fileName);
      }
   }
   else if(exists)
   {
      File input = FileOpen(path, read);
      if(input)
      {
         File output = FileOpen(outputFile, write);
         if(output)
         {
            FileSize dataSize, c;
            static byte buffer[BUFFERSIZE];
            FileGetSize(path, &dataSize);
            if(!quiet)
               Logf($"Extracting %s...\n", outputFile);
            for(c = 0; c<dataSize; c += BUFFERSIZE)
            {
               uint size = (dataSize > c + BUFFERSIZE) ? BUFFERSIZE : (dataSize - c);
               input.Read(buffer, 1, size);
               output.Write(buffer, 1, size);
            }
            delete output;
            setTime = true;
            FileGetStats(path, &stats);
         }
         delete input;
      }
   }
   if(setTime)
      FileSetTime(outputFile, stats.created, 0, stats.modified);
}

static bool AddToArchive(Archive archive, ArchiveDir parentDir, const char * name, const char * path, ArchiveAddMode addMode, int compression)
{
   bool result = true;
   FileAttribs exists = FileExists(path);
   if(exists.isDirectory)
   {
      ArchiveDir directory;
      if(name[0] || !parentDir)
      {
         FileStats stats;
         FileGetStats(path, &stats);
         if(parentDir)
            directory = parentDir.OpenDirectory(name, &stats, addMode);
         else
            directory = archive.OpenDirectory(name, &stats, addMode);
      }
      else
         directory = parentDir;
      if(directory)
      {
         FileListing listing { path };
         while(listing.Find())
         {
            if(!AddToArchive(archive, directory, listing.name, listing.path, addMode, compression))
            {
               result = false;
               break;
            }
         }
         if(directory != parentDir)
            delete directory;
      }
   }
   else if(exists && parentDir)
   {
      int ratio;
      uint newPosition;
      if(!quiet)
         Logf($"Adding %s...", name);
      if(parentDir.Add(name, path, addMode, compression, &ratio, &newPosition))
      {
         if(newPosition)
         {
            if(ratio && !quiet)
               Logf("(%2d.%1d%%)", ratio / 10, ratio % 10);
            if(!quiet)
               Log("\n");
         }
         else
            Logf($"Skipped%s%s.\n", quiet ? " " : "", quiet ? name : "");
      }
      else
      {
         Logf($"Out of disk space.\nError: Ran out of disk space while archiving%s%s.\n", quiet ? " " : "", quiet ? name : "");
         ((GuiApplication)__thisModule).exitCode = 1;
         result = false;
      }
   }
   else if(exists)
   {
      Logf($"'f' is specified but %s is not a folder\n", path);
      result = false;
   }
   return result;
}

static void MoveFileInArchive(Archive* archive, const char * sourcePath, const char * outputDirectory)
{
   // Verify if source file/directory exists and figure its kind
   FileAttribs exists = FileExists(sourcePath);
   if(exists)
   {
      char sourceFileName[MAX_FILENAME], sourceDirectory[MAX_LOCATION];
      char archiveName[MAX_LOCATION];
      const char * source;
      char existingFilePath[MAX_LOCATION], * existingFile;
      bool rootMoving = false;
      FileAttribs outputExists;
      bool doMove = false;

      SplitArchivePath(sourcePath, archiveName, &source);

      GetLastDirectory(source, sourceFileName);
      StripLastDirectory(source, sourceDirectory);

      sprintf(existingFilePath, "<%s>", archiveName);
      existingFile = existingFilePath + strlen(existingFilePath);
      PathCat(existingFile, outputDirectory);

      if(!sourceDirectory[0] &&
         ((sourceFileName[0] && sourceFileName[1] == ':') ||
         sourceFileName[0] == '\\' || sourceFileName[0] == '/'))
         rootMoving = true;
      else
         PathCat(existingFile, sourceFileName);

      if(rootMoving || fstrcmp(outputDirectory, sourceDirectory))
      {
         // If directory exists in destination directory, move files and then delete
         outputExists = FileExists(existingFilePath);

         // If source is a directory
         if(exists.isDirectory)
         {
            // Check if destination directory is within the source directory
            bool within = true;
            char outputPart[MAX_FILENAME], outputRest[MAX_LOCATION];
            char sourcePart[MAX_FILENAME], sourceRest[MAX_LOCATION];

            strcpy(outputRest, outputDirectory);
            strcpy(sourceRest, source);

            for(;sourceRest[0];)
            {
               SplitDirectory(outputRest, outputPart, outputRest);
               SplitDirectory(sourceRest, sourcePart, sourceRest);
               if(fstrcmp(sourcePart, outputPart) || !outputPart[0])
               {
                  within = false;
                  break;
               }
            }

            // Proceed with the move
            if(!within || !source[0])
            {
               // If directory exists in destination directory, move files and then delete
               if(outputExists.isDirectory || rootMoving || !source[0])
               {
                  ArchiveDir input;
                  FileListing listing { sourcePath };

                  if(!source[0])
                  {
                     ArchiveDir dir;
                     Logf($"Moving files in root to %s.\n", outputDirectory[0] ? outputDirectory : "root");
                     dir = archive->OpenDirectory(outputDirectory, null, 0);
                     if(dir)
                     {
                        char archiveName[MAX_LOCATION];
                        const char * archiveFile;
                        delete dir;
                        delete *archive;
                        SplitArchivePath(sourcePath, archiveName, &archiveFile);
                        *archive = ArchiveOpen(archiveName, { true });
                     }
                  }
                  else if(!rootMoving)
                     Logf($"Merging directory %s in %s with %s in %s.\n",
                        sourceFileName,
                        sourceDirectory[0] ? sourceDirectory : "root",
                        sourceFileName,
                        outputDirectory[0] ? outputDirectory : "root");

                  while(listing.Find())
                  {
                     if(strcmp(listing.path, existingFilePath))
                        MoveFileInArchive(archive, listing.path, existingFile);
                  }

                  if(source[0])
                  {
                     input = archive->OpenDirectory(sourceDirectory, null, 0);
                     if(input)
                     {
                        input.Delete(sourceFileName);
                        delete input;
                     }
                  }
               }
               else if(outputExists)
                  Logf($"A file with the same name already exists (%s).\n", existingFile);
               else
                  // Perform operation
                  doMove = true;
            }
            else
               Logf($"Can't move directory %s inside itself.\n", source);
         }
         // If source is a file
         else if(outputExists.isDirectory)
            Logf($"A folder with the same name already exists (%s).\n", existingFile);
         else
            doMove = true;

         if(doMove)
         {
            // It is important for the output directory to be opened first, as it might
            // interfere with the input directory while its path is created.
            ArchiveDir output = archive->OpenDirectory(outputDirectory, null, 0);
            if(output)
            {
               ArchiveDir input = archive->OpenDirectory(sourceDirectory, null, 0);
               if(input)
               {
                  // If a file by the same name exists already, replace it
                  if(outputExists.isFile)
                     output.Delete(sourceFileName);

                  Logf($"Moving file %s in directory %s to %s.\n", sourceFileName,
                     sourceDirectory[0] ? sourceDirectory : "root",
                     outputDirectory[0] ? outputDirectory : "root");

                  // Perform operation
                  input.Move(sourceFileName, output);

                  delete input;
               }
               delete output;
            }
         }
      }
      else
         Logf($"File is already in directory \"%s\".\n",
            sourceDirectory[0] ? sourceDirectory : "root");
   }
}

static bool quiet;

class EARApp : Application
{
   void Main()
   {
      bool valid = false;
      int numFiles = 0;
      int firstFileArg = 0;
      int action = 0;
      bool extractWhere = false;
      bool addFolders = false;
      bool selfExtract = false;
      int compression = 9;
      ArchiveAddMode addMode = 0;
      int c;

      quiet = false;

      DumpErrors(false);
      SetLoggingMode(stdOut, null);

      if(argc > 2)
      {
         // First validate command / options
         char ch;

         valid = true;
         for(c = 0; (ch = (char)tolower(argv[1][c])) && valid; c++)
         {
            int command = 0;
            switch(ch)
            {
               case 'v': command = ARCHIVE_ACTION_VIEW; break;
               case 'x': command = ARCHIVE_ACTION_XTRACTALL; break;
               case 'e': command = ARCHIVE_ACTION_EXTRACT; break;
               case 'a': command = ARCHIVE_ACTION_ADD; addMode = replace; break;
               case 'r': command = ARCHIVE_ACTION_ADD; addMode = refresh; break;
               case 'u': command = ARCHIVE_ACTION_ADD; addMode = update; break;
               case 'm': command = ARCHIVE_ACTION_MOVE; break;
               case 'n': command = ARCHIVE_ACTION_RENAME; break;
               case 'd': command = ARCHIVE_ACTION_DELETE; break;
               case 'c': command = ARCHIVE_ACTION_CLEAR; break;
               case 's':
                  if(action == ARCHIVE_ACTION_ADD && addMode == replace)
                     selfExtract = true;
                  else if(!action)
                     command = ARCHIVE_ACTION_SELFEXT;
                  else
                     valid = true;
                  break;
               case 'f':
                  if(action == ARCHIVE_ACTION_ADD)
                     addFolders = true;
                  else
                     valid = false;
                  break;
               case 'w':
                  if(action == ARCHIVE_ACTION_EXTRACT || action == ARCHIVE_ACTION_ADD)
                     extractWhere = true;
                  else
                     valid = false;
                  break;
               case 'q':
                  quiet = true;
                  break;
               default:
                  if(action == ARCHIVE_ACTION_ADD &&
                     ch >= '0' && ch <= '9' && compression == 9)
                     compression = ch - '0';
                  else
                     valid = false;
            }
            if(command)
            {
               if(action)
                  valid = false;
               else
                  action = command;
            }
         }

         if(valid)
         {
            // Validate commands needing parameters
            switch(action)
            {
               case ARCHIVE_ACTION_VIEW:
                  numFiles = argc - 3;
                  firstFileArg = 3;
                  break;
               case ARCHIVE_ACTION_EXTRACT:
                  firstFileArg = 3;
                  if(extractWhere)
                     numFiles = argc - 4;
                  else
                     numFiles = argc - 3;
                  valid = numFiles > 0;
                  break;
               case ARCHIVE_ACTION_ADD:
                  firstFileArg = 3;
                  if(extractWhere)
                     numFiles = argc - 4;
                  else
                     numFiles = argc - 3;
                  valid = numFiles > 0;
                  break;
               case ARCHIVE_ACTION_MOVE:
                  firstFileArg = 3;
                  numFiles = argc - 4;
                  valid = numFiles > 0;
                  break;
               case ARCHIVE_ACTION_RENAME:
                  valid = argc > 4;
                  break;
               case ARCHIVE_ACTION_DELETE:
                  firstFileArg = 3;
                  numFiles = argc - 3;
                  valid = numFiles > 0;
                  break;
               case ARCHIVE_ACTION_SELFEXT:
                  valid = argc > 3;
                  break;
            }
         }
      }

      if(valid)
      {
         char archivePath[MAX_LOCATION];
         int archivePathLen;

         sprintf(archivePath, "<%s>", argv[2]);
         archivePathLen = strlen(archivePath);

         if(action != ARCHIVE_ACTION_ADD)
         {
            FileSize size;
            if(!FileExists(argv[2]))
            {
               Logf($"Archive file not found: %s\n", argv[2]);
               action = 0;
            }
            else if(FileGetSize(argv[2], &size) && !size)
            {
               Logf($"Archive file is empty: %s\n", argv[2]);
               action = 0;
            }
            else
            {
               Archive archive = ArchiveOpen(argv[2], { false });
               if(archive)
                  delete archive;
               else
               {
                  Logf($"File is not a valid ECERE archive: %s\n", argv[2]);
                  action = 0;
               }
            }
         }
         else if(selfExtract)
         {
   #ifdef __WIN32__
            ExtractFileFromArchive(":extract.exe", argv[2]);
   #else
            ExtractFileFromArchive(":extract", argv[2]);
            chmod(argv[2], 0755);
   #endif
         }

         switch(action)
         {
            case ARCHIVE_ACTION_VIEW:
            {
               if(!numFiles)
                  ViewArchive(archivePath);
               else
               {
                  for(c = firstFileArg; c<numFiles + firstFileArg; c++)
                  {
                     char archive[MAX_LOCATION], fileName[MAX_LOCATION];
                     const char * name;
                     FileAttribs exists;

                     strcpy(fileName, archivePath);
                     PathCat(fileName, argv[c]);
                     FileFixCase(fileName);
                     SplitArchivePath(fileName, archive, &name);

                     if((exists = FileExists(fileName)))
                     {
                        if(exists.isDirectory)
                           ViewArchive(fileName);
                        else
                           Logf("%s\n", fileName + archivePathLen);
                     }
                     else
                        Logf($"File Not Found: %s\n", name);
                  }
               }
               break;
            }
            case ARCHIVE_ACTION_XTRACTALL:
               ExtractFileFromArchive(archivePath, (argc > 3) ? argv[3] : "");
               break;
            case ARCHIVE_ACTION_EXTRACT:
            {
               for(c = firstFileArg; c<firstFileArg + numFiles; c++)
               {
                  char directory[MAX_LOCATION];
                  char fileName[MAX_LOCATION];
                  char outputFile[MAX_LOCATION] = "";

                  strcpy(fileName, archivePath);
                  strcat(fileName, argv[c]);
                  if(FileExists(fileName))
                  {
                     if(extractWhere)
                     {
                        strcpy(outputFile, argv[argc-1]);
                        if(!strcmp(outputFile, ".")) outputFile[0] = '\0';
                        if(argv[c][0] == '/' || argv[c][0] == '\\')
                        {
                           char * afterSlash, rest[MAX_LOCATION];
                           for(afterSlash = fileName; *afterSlash == '/' || *afterSlash == '\\'; afterSlash++);
                           strcpy(rest, afterSlash);
                           PathCat(fileName, "_root");
                           PathCat(fileName, rest);
                        }
                        else if(argv[c][1] == ':')
                        {
                           char letter[10];
                           sprintf(letter, "_%cdrive", toupper(argv[c][0]));
                           PathCat(outputFile, letter);
                           PathCat(outputFile, argv[c][2] ? (argv[c] + 3) : (argv[c] + 2));
                        }
                     }
                     else
                        PathCat(outputFile, argv[c]);

                     if(!strcmp(outputFile, "/") || !strcmp(outputFile, "\\"))
                        strcpy(outputFile, DIR_SEPS);

                     StripLastDirectory(outputFile, directory);

                     MakeDir(directory);

                     ExtractFileFromArchive(fileName, outputFile);
                  }
               }
               break;
            }
            case ARCHIVE_ACTION_ADD:
            {
               Archive archive = ArchiveOpen(argv[2], { true, waitLock = true });
               if(archive)
               {
                  if(selfExtract)
                     archive.totalSize = 0;
                  if(addFolders)
                  {
                     for(c = firstFileArg; c<firstFileArg + numFiles; c++)
                     {
                        if(!AddToArchive(archive, null, extractWhere ? argv[argc-1] : "", argv[c], addMode, compression))
                           break;
                     }
                  }
                  else
                  {
                     for(c = firstFileArg; c<firstFileArg + numFiles; c++)
                     {
                        FileAttribs exists = FileExists(argv[c]);
                        if(exists)
                        {
                           ArchiveDir dir = null;
                           char file[MAX_LOCATION], directory[MAX_LOCATION] = "";
                           FileStats stats;
                           GetLastDirectory(argv[c], file);
                           if(extractWhere)
                           {
                              strcpy(directory, argv[argc-1]);
                              FileGetStats(directory, &stats);
                           }
                           else
                              StripLastDirectory(argv[c], directory);

                           dir = archive.OpenDirectory(directory, extractWhere ? &stats : null, addMode);
                           if(dir)
                           {
                              if(!AddToArchive(archive, dir, file, argv[c], addMode, compression))
                              {
                                 exitCode = 2;
                                 Logf($"Failed to add %s to archive!\n", argv[c]);
                                 delete dir;
                                 break;
                              }
                              delete dir;
                           }
                           else
                           {
                              exitCode = 3;
                              Logf($"Failed to open the internal directory of archive %s!\n", argv[2]);
                           }
                        }
                     }
                  }
                  delete archive;
               }
               else
               {
                  Logf($"Failed to open archive %s for writing!\n", argv[2]);
                  exitCode = 4;
               }
               break;
            }
            case ARCHIVE_ACTION_CLEAR:
            {
               // Strip the archive from a file (useful for data embedded with executable code)
               Archive archive = ArchiveOpen(argv[2], { true });
               if(archive)
               {
                  archive.Clear();
                  delete archive;
                  Logf($"Archive cleared: %s.\n", argv[2]);
               }
               break;
            }
            case ARCHIVE_ACTION_DELETE:
            {
               Archive archive = ArchiveOpen(argv[2], { true });
               if(archive)
               {
                  for(c = firstFileArg; c<firstFileArg + numFiles; c++)
                  {
                     char fileName[MAX_LOCATION];
                     FileAttribs exists;

                     strcpy(fileName, archivePath);
                     PathCat(fileName, argv[c]);
                     FileFixCase(fileName);
                     exists = FileExists(fileName);
                     if(exists)
                     {
                        ArchiveDir dir;
                        char file[MAX_LOCATION], directory[MAX_LOCATION] = "";
                        GetLastDirectory(argv[c], file);
                        StripLastDirectory(argv[c], directory);
                        dir = archive.OpenDirectory(directory, null, 0);
                        if(dir)
                        {
                           Logf($"Deleting file %s in directory %s.\n", file,
                              directory[0] ? directory : "root");
                           dir.Delete(file);
                           delete dir;
                        }
                     }
                  }
                  delete archive;
               }
               break;
            }
            case ARCHIVE_ACTION_MOVE:
            {
               Archive archive = ArchiveOpen(argv[2], { true });
               if(archive)
               {
                  char fileName[MAX_LOCATION];

                  for(c = firstFileArg; c<firstFileArg + numFiles; c++)
                  {
                     strcpy(fileName, archivePath);
                     PathCat(fileName, argv[c]);
                     MoveFileInArchive(&archive, fileName, argv[argc-1]);
                  }
                  delete archive;
               }
               break;
            }
            case ARCHIVE_ACTION_RENAME:
            {
               Archive archive = ArchiveOpen(argv[2], { true });
               if(archive)
               {
                  char fileName[MAX_LOCATION];
                  FileAttribs exists;
                  strcpy(fileName, archivePath);
                  PathCat(fileName, argv[3]);
                  exists = FileExists(fileName);
                  if(exists)
                  {
                     char newName[MAX_FILENAME] = "", rest[MAX_FILENAME];
                     SplitDirectory(argv[4], newName, rest);
                     if(!rest[0])
                     {
                        ArchiveDir dir;
                        char name[MAX_LOCATION], directory[MAX_LOCATION] = "";

                        GetLastDirectory(argv[3], name);
                        StripLastDirectory(argv[3], directory);
                        if(!directory[0] ||
                           ((!newName[0] || newName[1] != ':') &&
                            newName[0] != '\\' && newName[0] != '/'))
                        {
                           char existingFilePath[MAX_LOCATION], * existingFile;
                           FileAttribs outputExists;

                           Logf($"Renaming %s in directory %s to %s.\n", name,
                              directory[0] ? directory : "root", newName);
                           strcpy(existingFilePath, archivePath);
                           existingFile = existingFilePath + strlen(existingFilePath);
                           PathCat(existingFile, directory);
                           PathCat(existingFile, newName);

                           outputExists = FileExists(existingFilePath);
                           if(outputExists.isDirectory)
                           {
                              FileListing listing;
                              while(listing.Find())
                                 MoveFileInArchive(&archive, listing.path, existingFile);
                              dir = archive.OpenDirectory(directory, null, 0);
                              if(dir)
                              {
                                 dir.Delete(name);
                                 delete dir;
                              }
                           }
                           else
                           {
                              dir = archive.OpenDirectory(directory, null, 0);
                              if(dir)
                              {
                                 if(outputExists)
                                    dir.Delete(newName);
                                 dir.Rename(name, newName);
                                 delete dir;
                              }
                           }
                        }
                        else
                           Logf($"Drive letters and %s only valid at root.\n", DIR_SEPS);
                     }
                     else
                        Log($"New name contains directory structure.\n");
                  }
                  delete archive;
               }
               break;
            }
            case ARCHIVE_ACTION_SELFEXT:
            {
               Archive archive;
   #ifdef __WIN32__
               ExtractFileFromArchive(":extract.exe", argv[3]);
   #else
               ExtractFileFromArchive(":extract", argv[3]);
               chmod(argv[3], 0755);
   #endif
               archive = ArchiveOpen(argv[3], { true });
               if(archive)
               {
                  archive.totalSize = 0;
                  AddToArchive(archive, null, "", archivePath, replace, 9);
                  delete archive;
               }
               break;
            }
         }
      }
      else
         ShowSyntax();
   }
}
