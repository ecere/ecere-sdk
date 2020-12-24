#define _Noreturn

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>
#include <string.h>

#if defined(__GNUC__) || defined(__WATCOMC__) || defined(__WIN32__)
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#endif

#if defined(__unix__) || defined(__APPLE__)
#define bool _bool
#include <utime.h>
#include <dlfcn.h>
#if defined(__APPLE__)
#include <mach-o/dyld.h>
#endif
#if defined(__FreeBSD__)
#include <sys/sysctl.h>
#endif
#undef bool
#endif

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#include <windows.h>
#include <io.h>

#else
#include <unistd.h>
#endif

typedef int bool;
typedef unsigned char byte;
typedef unsigned short uint16;
typedef unsigned int uint;
typedef unsigned int FileSize;
typedef unsigned long long uint64;

#define false 0
#define true 1

#define null ((void *)0)

#define MAX_LOCATION 797
#define MAX_FILENAME 274
#define MAX_EXTENSION 17

#if defined(__MINGW32__) && !defined(_W64) && __GNUC__ < 4
__declspec(dllexport) int isblank(int c) { return c == '\t' || c == ' '; }
#endif

#if defined(__WIN32__)
intptr_t stdinHandle, stdoutHandle;
int osfStdin, osfStdout;
FILE * fStdIn, * fStdOut;
#endif

FILE *eC_stdin(void)  {
#if defined(__WIN32__)
   if(!fStdIn)
   {
      stdinHandle = (intptr_t)GetStdHandle(STD_INPUT_HANDLE);
      osfStdin = _open_osfhandle(stdinHandle, _O_TEXT);
      if(osfStdin != -1)
         fStdIn = _fdopen( osfStdin, "rb");
      else
         fStdIn = stdin;
      setvbuf( fStdIn, NULL, _IONBF, 0 );
   }
   return fStdIn;
#else
return stdin;
#endif
}

FILE *eC_stdout(void)
{
#if 0 //defined(__WIN32__)
   if(!fStdOut)
   {
      stdoutHandle = (intptr_t)GetStdHandle(STD_OUTPUT_HANDLE);
      osfStdout = _open_osfhandle(stdoutHandle, _O_TEXT);
      if(osfStdout != -1)
         fStdOut = _fdopen( osfStdout, "wb");
      else
         fStdOut = stdout;
      setvbuf( fStdOut, NULL, _IONBF, 0 );
   }
   return fStdOut;
#else
   return stdout;
#endif
}
FILE *eC_stderr(void) { return stderr; }

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);
void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(const char * source, int * wordCount);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(const char * source, uint16 * dest, int max);
char * __ecereNameSpace__ecere__sys__UTF16toUTF8(uint16 * source);
char * __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(uint16 * source, char * dest, int max);

#define eSystem_Delete     __ecereNameSpace__ecere__com__eSystem_Delete
#define eSystem_New0       __ecereNameSpace__ecere__com__eSystem_New0
#define eSystem_Renew      __ecereNameSpace__ecere__com__eSystem_Renew
#define eSystem_Renew0     __ecereNameSpace__ecere__com__eSystem_Renew0
#define UTF8toUTF16        __ecereNameSpace__ecere__sys__UTF8toUTF16
#define UTF8toUTF16Buffer  __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer
#define UTF16toUTF8        __ecereNameSpace__ecere__sys__UTF16toUTF8
#define UTF16toUTF8Buffer  __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer

#if defined(__unix__)
static char exeLocation[MAX_LOCATION];
#endif

#define forArgsPassing 2
int __ecereNameSpace__ecere__sys__Tokenize(char * string, int maxTokens, char* tokens[], int esc);
char * __ecereNameSpace__ecere__sys__RSearchString(const char * buffer, const char * subStr, int maxLen, bool matchCase, bool matchWord);
char * __ecereNameSpace__ecere__sys__GetLastDirectory(const char * string, char * output);
char * __ecereNameSpace__ecere__sys__PathCat(char * string, const char * addedPath);
char * __ecereNameSpace__ecere__sys__GetExtension(const char * string, char * output);

#define Tokenize           __ecereNameSpace__ecere__sys__Tokenize
#define RSearchString      __ecereNameSpace__ecere__sys__RSearchString
#define GetLastDirectory   __ecereNameSpace__ecere__sys__GetLastDirectory
#define PathCat            __ecereNameSpace__ecere__sys__PathCat
#define GetExtension       __ecereNameSpace__ecere__sys__GetExtension

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

typedef enum { unknown, win32, tux, apple } Platform;

#if defined(__WIN32__)
Platform runtimePlatform = win32;
#elif defined(__APPLE__)
Platform runtimePlatform = apple;
#else //if defined(__linux__)
Platform runtimePlatform = tux;
/*#else
Platform runtimePlatform = unknown;    // 'linux' is used as a catch all UNIX platform for now
*/
#endif

#if !defined(ECERE_NOFILE) && defined(__unix__) && !defined(__linux__)

typedef struct _DualPipe _DualPipe;

void DualPipe_Destructor(_DualPipe * dp);
bool DualPipe_Getc(_DualPipe * dp, char * ch);
bool DualPipe_Eof(_DualPipe * dp);
void DualPipe_Wait(_DualPipe * dp);

_DualPipe * _DualPipeOpen(int mode, char * commandLine, char * env, void ** inputPtr, void ** outputPtr);

static bool DualPipe_GetLine(FILE * p, char *s, int max)
{
   int c = 0;
   bool result = true;
   s[c]=0;
   if(feof(p))
      result = false;
   else
   {
      while(c<max-1)
      {
         int ch = 0;
         if((ch = fgetc(p)) == EOF)
         {
            result = false;
            break;
         }
         if(ch =='\n')
            break;
         if(ch !='\r')
            s[c++]=(char)ch;
      }
   }
   s[c]=0;
   return result || c > 1;
}

#endif

bool Instance_LocateModule(const char * name, char * fileName)
{
#if defined(__UWP__)
   if(name && name[0])
   {
      uint16 _wmoduleName[MAX_LOCATION];
      HMODULE hModule = null;
      UTF8toUTF16Buffer(name, _wmoduleName, MAX_LOCATION);
      hModule = LoadPackagedLibrary(_wmoduleName, 0);
      if(hModule)
      {
         uint16 _wfileName[MAX_LOCATION];
         GetModuleFileNameW(hModule, _wfileName, MAX_LOCATION);
         UTF16toUTF8Buffer(_wfileName, fileName, MAX_LOCATION);
         FreeLibrary(hModule);
         return true;
      }
   }
   else
   {
      uint16 _wfileName[MAX_LOCATION];
      GetModuleFileNameW(null, _wfileName, MAX_LOCATION);
      UTF16toUTF8Buffer(_wfileName, fileName, MAX_LOCATION);
      return true;
   }
#elif defined(__WIN32__)
   HMODULE hModule = null;
   if(name && name[0])
   {
      uint16 _wmoduleName[MAX_LOCATION];
      UTF8toUTF16Buffer(name, _wmoduleName, MAX_LOCATION);
      hModule = GetModuleHandle(_wmoduleName);
      if(!hModule)
      {
         wcscat(_wmoduleName, L".exe");
         hModule = GetModuleHandle(_wmoduleName);
      }
      if(hModule)
      {
         uint16 _wfileName[MAX_LOCATION];
         GetModuleFileNameW(hModule, _wfileName, MAX_LOCATION);
         UTF16toUTF8Buffer(_wfileName, fileName, MAX_LOCATION);
         return true;
      }
   }
   else
   {
      uint16 _wfileName[MAX_LOCATION];
      GetModuleFileNameW(null, _wfileName, MAX_LOCATION);
      UTF16toUTF8Buffer(_wfileName, fileName, MAX_LOCATION);
      return true;
   }
#elif defined(__APPLE__)
   if(name && name[0])
   {
      int imageCount = _dyld_image_count();
      int c;
      int nameLen = strlen(name);
      for(c = 0; c<imageCount; c++)
      {
         struct mach_header * header = _dyld_get_image_header(c);
         char * path = _dyld_get_image_name(c);
         int pathLen = strlen(path);
         char * subStr = RSearchString(path, name, pathLen, false, false);
         if(subStr)
         {
            if(( *(subStr-1) == '/' || !strncmp(subStr - 4, "/lib", 4)) &&
               (!subStr[nameLen] || !strncmp(subStr + nameLen, ".dylib", 6)))
            {
               strcpy(fileName, path);
               return true;
            }
         }
      }
   }
   else
   {
      int size = MAX_LOCATION;
      _NSGetExecutablePath(fileName, &size);
      return true;
   }
#elif defined(__unix__)
   //File f = FileOpen("/proc/self/maps", read);
   FILE * f = null;
   char exeName[MAX_FILENAME];
   exeName[0] = 0;
#if defined(__linux__)
   f = fopen("/proc/self/status", "r");
#else
   f = fopen("/proc/curproc/status", "r");
#endif
   if(f)
   {
      char line[1025];
      while(fgets(line, sizeof(line), f))
      {
         char * name = strstr(line, "Name:\t");
         if(name)
         {
            int nameLen;
            name += 6;
            nameLen = strlen(name);
            name[--nameLen] = 0;
            strcpy(exeName, name);
            break;
         }
      }
      fclose(f);
  }
#if defined(__linux__)
   f = fopen("/proc/self/maps", "r");
#else
   f = fopen("/proc/curproc/map", "r");
#endif
   if(f)
   {
      char line[1025];
      //while(f.GetLine(line, sizeof(line)))
      while(fgets(line, sizeof(line), f))
      {
         char * path = strstr(line, "/");
         if(path)
         {
            int pathLen = strlen(path);
            path[--pathLen] = 0;
            if(name && name[0])
            {
               int nameLen = strlen(name);
               char * subStr;
               subStr = RSearchString(path, name, pathLen, false, false);
               if(subStr)
               {
                  if(( *(subStr-1) == '/' || !strncmp(subStr - 4, "/lib", 4)) &&
                     (!subStr[nameLen] || !strncmp(subStr + nameLen, ".so", 3)))
                  {
                     char * space = strchr(path, ' ');
                     if(space) *space = 0;
                     strcpy(fileName, path);
                     fclose(f);
                     return true;
                  }
               }
            }
            else
            {
               char name[MAX_FILENAME];
               GetLastDirectory(path, name);
               if(!exeName[0] || !strcmp(name, exeName))
               {
                  char * space = strchr(path, ' ');
                  if(space) *space = 0;
                  strcpy(fileName, path);
                  fclose(f);
                  return true;
               }
            }
         }
      }
      fclose(f);
   }
#if !defined(ECERE_NOFILE) && !defined(__linux__) && !defined(__EMSCRIPTEN__)
   if(name && name[0])
   {
      // Couldn't locate libraries with /proc/curmap/map, attempt with ldd
      FILE * in = null, * out = null;
      _DualPipe * p;
      char command[MAX_LOCATION];
      snprintf(command, sizeof(command), "ldd /proc/%d/file", (int)getpid());
      p  = _DualPipeOpen(1, command, null, &in, &out);
      if(p)
      {
         bool result = false;
         char line[1025];
         int nameLen = strlen(name);
         while(DualPipe_GetLine(in, line, sizeof(line)))
         {
            char * path = strstr(line, "/");
            if(path)
            {
               int pathLen = strlen(path);
               char * subStr;
               path[--pathLen] = 0;
               subStr = RSearchString(path, name, pathLen, false, false);
               if(subStr)
               {
                  if(( *(subStr-1) == '/' || !strncmp(subStr - 4, "/lib", 4)) &&
                     (!subStr[nameLen] || !strncmp(subStr + nameLen, ".so", 3)))
                  {
                     char * space = strchr(path, ' ');
                     if(space) *space = 0;
                     strcpy(fileName, path);
                     result = true;
                  }
               }
            }
         }
         DualPipe_Wait(p);
         fclose(in);
         DualPipe_Destructor(p);
         return result;
      }
   }
#endif
   if(!name || !name[0])
   {
#if defined(__FreeBSD__)
      {
         int mib[4] = { CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1 };
         size_t cb = MAX_LOCATION;
         fileName[0] = 0;
         sysctl(mib, 4, fileName, &cb, null, 0);
         if(fileName[0])
            return true;
      }
#endif
#if !defined(__linux__)
      {
         char * env;
         if(!access("/proc/curproc/file", F_OK))
         {
            strcpy(fileName, "/proc/curproc/file");
            return true;
         }
         if((env = getenv("_")))
         {
            strcpy(fileName, env);
            return true;
         }
      }
#endif
      strcpy(fileName, exeLocation);
      return true;
   }
#endif
   return false;
}

void Instance_COM_Initialize(int argc, char ** argv, char ** parsedCommand, int * argcPtr, const char *** argvPtr)
{
#if !defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
   // Disable stdout buffering on Unix
   setvbuf(stdout, null, _IONBF, 0);
#endif
#if defined(__WIN32__)
   *parsedCommand = UTF16toUTF8(GetCommandLineW());
   *argvPtr = eSystem_New0(sizeof(char *) * 512);
   *argcPtr = Tokenize(*parsedCommand, 512,(void*)(char **)(*argvPtr), forArgsPassing);
#else
   *argcPtr = argc;
   *argvPtr = (const char **)argv;
#endif
#if defined(__unix__)
   if(!__thisModule && argv)
   {
      if(!getcwd(exeLocation, MAX_LOCATION))
         exeLocation[0] = 0;
      PathCat(exeLocation, argv[0]);
   }
#endif
}

void System_SetArgs(int argc, char ** argv, int * argcPtr, const char *** argvPtr)
{
#if defined(__unix__)
   *argcPtr = argc;
   *argvPtr = (const char **)argv;

   if(!__thisModule && argv)
   {
      if(!getcwd(exeLocation, MAX_LOCATION))
         exeLocation[0] = 0;
      PathCat(exeLocation, argv[0]);
   }
#endif
}

void * Instance_Module_Load(const char * libLocation, const char * name, void ** Load, void ** Unload)
{
   char fileName[MAX_LOCATION];
   char extension[MAX_EXTENSION];
   void * library = null;
#if defined(__unix__) || defined(__APPLE__)
   int attempts = 0;
   char * paths[] = { null, "/usr/lib/ec/lib", "/usr/lib32/ec/lib", null };
   char * env;
   char dlopenpath[MAX_LOCATION];
   if((env = getenv("ECERESDK_LIB_PATH")))
   {
      strcpy(dlopenpath, env);
      paths[2] = dlopenpath;
   }
#endif

   *Load = null;
   *Unload = null;

#if defined(__UWP__)
   strcpy(fileName, name);
   GetExtension(fileName, extension);
   if(!extension[0])
      strcat(fileName, ".dll");

   {
      uint16 _wfileName[MAX_LOCATION];
      UTF8toUTF16Buffer(fileName, _wfileName, MAX_LOCATION);
      library = LoadPackagedLibrary(_wfileName, 0);
   }
   if(library)
   {
#ifdef _WIN64
      *Load = (void *)GetProcAddress(library, "__ecereDll_Load");
      *Unload = (void *)GetProcAddress(library, "__ecereDll_Unload");
#else
      *Load = (void *)GetProcAddress(library, "__ecereDll_Load@4");
      *Unload = (void *)GetProcAddress(library, "__ecereDll_Unload@4");
#endif
      if(!*Load)
         FreeLibrary(library);
   }
#elif defined(__WIN32__)
   strcpy(fileName, name);
   GetExtension(fileName, extension);
   if(!extension[0])
      strcat(fileName, ".dll");

   {
      uint16 _wfileName[MAX_LOCATION];
      UTF8toUTF16Buffer(fileName, _wfileName, MAX_LOCATION);
      library = LoadLibraryW(_wfileName);
   }
   if(library)
   {
#ifdef _WIN64
      *Load = (void *)GetProcAddress(library, "__ecereDll_Load");
      *Unload = (void *)GetProcAddress(library, "__ecereDll_Unload");
#else
      *Load = (void *)GetProcAddress(library, "__ecereDll_Load@4");
      *Unload = (void *)GetProcAddress(library, "__ecereDll_Unload@4");
#endif
      if(!*Load)
         FreeLibrary(library);
   }
#elif defined(__unix__) || defined(__APPLE__)
   if(libLocation || strchr(name, '/'))
      strcpy(fileName, libLocation ? libLocation : "");
   else
      strcpy(fileName, "lib");
   strcat(fileName, name);
   GetExtension(fileName, extension);
   if(!extension[0])
#if defined(__APPLE__)
      strcat(fileName, ".dylib");
#else
      strcat(fileName, ".so");
#endif

#if !defined(__EMSCRIPTEN__)
   // dlerror();
   library = dlopen(fileName, RTLD_LAZY);
   // if(!library)
      // printf("Error opening %s: %s", fileName, dlerror());
#endif
   while(!library && attempts < sizeof(paths)/sizeof(paths[0]))
   {
      if(paths[attempts])
      {
         if(strcmp(paths[attempts], "/usr/lib/ec/lib") && strcmp(paths[attempts], "/usr/lib32/ec/lib"))
            printf("attempting lib path: %s\n", paths[attempts]);
         strcpy(fileName, paths[attempts++]);
      }
      else
      {
         attempts++;
#ifdef DEB_HOST_MULTIARCH
         strcpy(fileName, DEB_HOST_MULTIARCH);
         strcat(fileName, "/ec/lib");
#else
         continue;
#endif
      }
      strcat(fileName, name);
      GetExtension(fileName, extension);
      if(!extension[0])
#if defined(__APPLE__)
         strcat(fileName, ".dylib");
#else
         strcat(fileName, ".so");
#endif
#if !defined(__EMSCRIPTEN__)
      library = dlopen(fileName, RTLD_LAZY);
#endif
   }

   if(library)
   {
      *Load = dlsym(library, "__ecereDll_Load");
      *Unload = dlsym(library, "__ecereDll_Unload");
#if !defined(__EMSCRIPTEN__)
      if(!*Load)
         dlclose(library);
#endif
   }
#elif defined(__APPLE__)
   if(libLocation || strchr(name, '/'))
      strcpy(fileName, libLocation ? libLocation : "");
   else
      strcpy(fileName, "lib");
   strcat(fileName, name);
   GetExtension(fileName, extension);
   if(!extension[0])
      strcat(fileName, ".dylib");
   {
      NSObjectFileImage *fileImage;
      NSObjectFileImageReturnCode returnCode = NSCreateObjectFileImageFromFile(fileName, &fileImage);

      if(returnCode == NSObjectFileImageSuccess)
      {
         printf("NSObjectFileImageSuccess!\n");
         library = NSLinkModule(fileImage,fileName,
              NSLINKMODULE_OPTION_RETURN_ON_ERROR
            | NSLINKMODULE_OPTION_PRIVATE);
         // NSDestroyObjectFileImage(fileImage);
         if(library)
         {
            *Load = NSAddressOfSymbol(NSLookupSymbolInModule(library, "__ecereDll_Load"));
            *Unload = NSAddressOfSymbol(NSLookupSymbolInModule(library, "__ecereDll_Unload"));
            if(!*Load)
            {
               NSUnLinkModule(library, 0);
            }
            else
               printf("Found Load!\n");
         }
      }
      else
         printf("No Success :(\n");
   }
#endif
   return library;
}

void Instance_Module_Free(void * library)
{
#if defined(__WIN32__)
   if(library)
      FreeLibrary(library);
#elif (defined(__unix__) || defined(__APPLE__)) && !defined(__EMSCRIPTEN__)
   if(library)
      dlclose(library);
#endif
}

#if defined(_DEBUG)
   void InternalModuleLoadBreakpoint()
   {
   }
#endif

#include <math.h>

bool Float_isNan(float n) { return isnan(n); }
bool Float_isInf(float n) { return isinf(n); }
int Float_signBit(float n) { return signbit(n); }
float Float_nan(void) { return NAN; }
float Float_inf(void) { return INFINITY; }

bool Double_isNan(double n) { return isnan(n); }
bool Double_isInf(double n) { return isinf(n); }
int Double_signBit(double n) { return signbit(n); }
double Double_nan(void) { return NAN; }
double Double_inf(void) { return INFINITY; }

#if defined(__clang__) && defined(_MSC_VER)

int strcasecmp(const char * a, const char * b)
{
   return strcmpi(a, b);
}

int strncasecmp(const char * a, const char * b, size_t n)
{
   return strnicmp(a, b, n);
}

#endif
