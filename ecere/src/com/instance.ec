#define _Noreturn

namespace com;

#if defined(__EMSCRIPTEN__) || defined(__ANDROID__)
 #define DISABLE_MEMMGR
 // #define USE_ATOMICS
#endif

#if defined(__EMSCRIPTEN__)

#ifdef _DEBUG
// #define EMSCRIPTEN_DEBUG
#endif

 #define DISABLE_MEMMGR
 #define _NOMUTEX
#include <emscripten.h>
#define OFFSET(s, m) ((uint)(uintptr) (&((s *) 0)->m))
#endif

import "BinaryTree"
import "OldList"
import "String"
import "dataTypes"

//#define JUST_CHECK_LEAKS
//#define JUST_CHECK_BOUNDARIES

#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__) && !defined(ECERE_BOOTSTRAP)
asm(".symver pow,pow@GLIBC_2.2.5");
asm(".symver log,log@GLIBC_2.2.5");
asm(".symver exp,exp@GLIBC_2.2.5");
#endif

#if defined(ECERE_BOOTSTRAP) || defined(ECERE_STATIC)
#define dllexport
#if !defined(ECERE_BOOTSTRAP)
#define stdcall
#endif
#endif

#undef __BLOCKS__

#if defined(ECERE_BOOTSTRAP)
 #define _NOMUTEX
#endif

#if !defined(_NOMUTEX)
import "Mutex"
#else
#if defined(MEMINFO)
int GetCurrentThreadID() { return 0; }
#endif
#endif

#if defined(__EMSCRIPTEN__)
#define GetCurrentThreadID()  0
#endif

// #define MEMINFO
/*
#ifdef MEMINFO
 #undef REDZONE
 #define REDZONE   256
#endif
*/

#if defined(JUST_CHECK_LEAKS) || !defined(REDZONE)
#undef REDZONE
#define REDZONE 0
#endif


#ifdef _DEBUG
// #define MEMTRACKING
#endif

#ifdef MEMINFO
#if !defined(_NOMUTEX)
import "Thread"
#endif
static define MAX_MEMORY_LOC = 40;
static define MAX_STACK_FRAMES = 1000;

static class MemStack : BTNode
{
   const char * frames[MAX_STACK_FRAMES];
   int pos;
   bool recurse;
};

static BinaryTree memStacks { };
static uint memoryErrorsCount = 0;

#endif

default:
#define property _property

#if defined(DISABLE_MEMMGR)

#ifndef ECERE_BOOTSTRAP
# include <malloc.h>
#endif

#if defined(__WIN32__)
#ifdef ECERE_BOOTSTRAP
uintsize _msize(void * p);
#endif

#  define msize _msize
#else
#ifdef ECERE_BOOTSTRAP
uintsize malloc_usable_size(void * p);
#endif

// #  define msize malloc_usable_size  // malloc_usable_size is not requested size!!
#endif

#endif

#include <stdlib.h>
#include <stdio.h>

#ifdef USE_ATOMICS
#include <stdatomic.h>

void __atomic_fetch_add( volatile int* obj, int arg, int order);
void __atomic_fetch_sub( volatile int* obj, int arg, int order);

#endif

private:

#if defined(__ANDROID__)

default const char * AndroidInterface_GetLibLocation(Module m);

#include <android/log.h>
#if !defined(__LUMIN__)
#include <android/native_activity.h>

#define printf(...)  ((void)__android_log_print(ANDROID_LOG_VERBOSE, "ecere-app", __VA_ARGS__))
#else
#define bool _bool
#define false _false
#define true _true
#include <ml_logging.h>
#undef bool
#undef false
#undef true
#endif
#endif

#undef property

#undef CompareString

public define null = ((void *)0);

dllexport Class eSystem_FindClass(Module module, const char * name);
dllexport void * eSystem_Renew(void * memory, unsigned int size);
dllexport void * eSystem_Renew0(void * memory, unsigned int size);
dllexport void * eSystem_New(unsigned int size);
dllexport void * eSystem_New0(unsigned int size);
dllexport void eSystem_Delete(void * memory);
dllexport void * eInstance_New(Class _class);

default:
extern int __ecereVMethodID_class_OnGetDataFromString;

// IMPLEMENTATION FOR THESE IN _instance.c:
#if defined(__MINGW32__) && !defined(_W64) && __GNUC__ < 4
dllexport int isblank(int c);
#endif
bool Instance_LocateModule(const char * name, const char * fileName);
void Instance_COM_Initialize(int argc, char ** argv, char ** parsedCommand, int * argcPtr, const char *** argvPtr);
void System_SetArgs(int argc, char ** argv, int * argcPtr, const char *** argvPtr);
void * Instance_Module_Load(const char * libLocation, const char * name, void ** Load, void ** Unload);
void Instance_Module_Free(void * library);
#if defined(_DEBUG)
void InternalModuleLoadBreakpoint();
#endif

private:

public class Angle : double;

public class ::unichar : uint32
{

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      UTF32toUTF8Len(&this, 1, tempString, 5);
      return tempString;
   }

   bool OnGetDataFromString(const char * string)
   {
      int nb;
      this = UTF8GetChar(string, &nb);
      return true;
   }

};

// Forward declarations to hook on to libec:
class ::Type;
class ::Instantiation;
class ::ClassDefinition;

public class Property : struct
{
public:
   class_fixed
   class_no_expansion
   Property prev, next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class _class;
   const char * dataTypeString;
   Class dataTypeClass;
   Type dataType;

   void (*Set)(void *, int);
   int (*Get)(void *);
   bool (*IsSet)(void *);
   void * data;
   void * symbol;
   int vid;
   bool conversion;
   uint watcherOffset;
   const char * category;
   bool compiled;
   bool selfWatchable, isWatchable;
};

dllexport void eInstance_FireWatchers(Instance instance, Property _property);

public dllexport void MemoryGuard_PushLoc(const char * loc)
{
#ifdef MEMINFO
   MemStack stack;
#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif
   stack = (MemStack)memStacks.Find(GetCurrentThreadID());
   if(!stack)
   {
      stack = (MemStack)calloc(1, sizeof(class MemStack));
      stack.key = GetCurrentThreadID();
      memStacks.Add(stack);
   }
   if(stack.pos < MAX_STACK_FRAMES)
      stack.frames[stack.pos++] = loc;
#if !defined(_NOMUTEX)
   memMutex.Release();
#endif
#endif
}

public dllexport void MemoryGuard_PopLoc()
{
#ifdef MEMINFO
   MemStack stack;
#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif
   stack = (MemStack)memStacks.Find(GetCurrentThreadID());
   if(stack && stack.pos > 0)
   {
      stack.pos--;
   }
#if !defined(_NOMUTEX)
   memMutex.Release();
#endif
#endif
}

#ifdef ECERE_STATIC

#ifdef ECERE_COM_ONLY

#define COM_LOAD_FUNCTION  __ecereDll_Load_ecereCOM
#define COM_UNLOAD_FUNCTION  __ecereDll_Unload_ecereCOM

#else

#define COM_LOAD_FUNCTION  __ecereDll_Load_ecere
#define COM_UNLOAD_FUNCTION  __ecereDll_Unload_ecere

#endif

#else

#define COM_LOAD_FUNCTION  __ecereDll_Load
#define COM_UNLOAD_FUNCTION  __ecereDll_Unload

#endif

default:

#if defined(ECERE_BOOTSTRAP)
extern bool COM_LOAD_FUNCTION(Module module);
extern bool COM_UNLOAD_FUNCTION(Module module);
#else
extern bool stdcall COM_LOAD_FUNCTION(Module module);
extern bool stdcall COM_UNLOAD_FUNCTION(Module module);
#endif

private:

public class BTNamedLink : struct
{
   class_fixed
public:
   const char * name;
   BTNamedLink parent, left, right;
   int depth;
   void * data;
};

class SelfWatcher : struct
{
   class_fixed
   SelfWatcher prev, next;
   void (*callback)(void *);
   Property _property;
};

public enum AccessMode
{
   defaultAccess,
   publicAccess,
   privateAccess,
   staticAccess,
   baseSystemAccess
};

public class SubModule : struct
{
public:
   SubModule prev, next;
   Module module;
   AccessMode importMode;
};

public enum DataMemberType { normalMember, unionMember, structMember };

public enum ClassType
{
   normalClass,
   structClass,
   bitClass,
   unitClass,
   enumClass,
   noHeadClass,
   unionClass, // Temporary only in firstPass
   systemClass = 1000
};

public class Class : struct
{
public:
   class_fixed
   class_no_expansion
   Class prev, next;
   const char * name;
   int offset, structSize;
   void ** _vTbl;
   int vTblSize;
   bool (*Constructor)(void *);
   void (*Destructor)(void *);

   int offsetClass, sizeClass;
   Class base;
   BinaryTree methods;
   BinaryTree members;
   BinaryTree prop;
   OldList membersAndProperties;
   BinaryTree classProperties;
   OldList derivatives;
   int memberID, startMemberID;
   ClassType type;
   Module module;
   NameSpace * nameSpace;
   const char * dataTypeString;
   Type dataType;
   int typeSize;
   int defaultAlignment;
   void (*Initialize)();
   int memberOffset;       // For structs, this includes all base classes structSize. Otherwise it restarts at for each class hierarchy level.
   OldList selfWatchers;
   const char * designerClass;
   bool noExpansion;
   const char * defaultProperty;
   bool comRedefinition;

   // Number of instances of this class alive
   #ifdef USE_ATOMICS
   atomic_int count;    // TOCHECK: Verify handling of sizeof(atomic_int) != sizeof(int)
   #else
   int count;
   #endif

   int isRemote;  // TODO: Convert to an enum, can have values 0..3
   bool internalDecl;
   void * data;
   bool computeSize;
   short structAlignment; short pointerAlignment;
   int destructionWatchOffset;
   bool fixed;
   OldList delayedCPValues;
   AccessMode inheritanceAccess;
   const char * fullName;
   void * symbol;
   OldList conversions;

   OldList templateParams;
   ClassTemplateArgument * templateArgs;
   Class templateClass;
   OldList templatized;
   int numParams;       // TOTAL number of params including all base classes; use templateParams.count for this level
   bool isInstanceClass;
   bool byValueSystemClass;
   void * bindingsClass;

   property const char *
   {
      get { return name; }
      set
      {
         Class theClass = eSystem_FindClass(__thisModule, value);
         /*
         if(!theClass)
            theClass = eSystem_FindClass(__thisModule.application, value);
         */
         return theClass;
      }
   };

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return name;
   }

   bool OnGetDataFromString(const char * string)
   {
      Class theClass;
      theClass = eSystem_FindClass(__thisModule, string);
      if(!theClass)
         theClass = eSystem_FindClass(__thisModule.application, string);
      this = (void *)theClass;
      return theClass != null;
   }

   void OnSerialize(IOChannel channel)
   {
      channel.Serialize(fullName);
   }

   void OnFree()
   {

   }

   void OnUnserialize(IOChannel channel)
   {
      Class theClass;
      String string;
      channel.Unserialize(string);
      theClass = eSystem_FindClass(__thisModule, string);
      if(!theClass)
         theClass = eSystem_FindClass(__thisModule.application, string);
      delete string;
      this = (void *)theClass;
   }
};


public enum TemplateParameterType { type, identifier, expression };
public enum TemplateMemberType { dataMember, method, prop };

public struct ClassTemplateArgument
{
public:
   union
   {
      // For type
      struct
      {
         const char * dataTypeString;
         Class dataTypeClass;
         // Type dataType;
      };
      // For expression
      DataValue expression;

      // For identifier
      struct
      {
         const char * memberString;
         union
         {
            DataMember member;
            Property prop;
            Method method;
         };
      };
   };
};

public class ClassTemplateParameter : struct
{
class_fixed
public:
   ClassTemplateParameter prev, next;
   const char * name;
   TemplateParameterType type;
   union
   {
      // Class baseClass;                 // For type
      const char * dataTypeString;           // For expression
      TemplateMemberType memberType;   // For identifier
   };
   ClassTemplateArgument defaultArg;
   void * param;  // To attach to Compiler TemplateParameter
}

/*    // Module inherits off the Instance class (_vTbl, _class, _refCount)
public class Module
{
   class_no_expansion

   Application app;

   // So we can clean them up
   OldList classes;
   OldList defines;
   OldList functions;
   OldList modules;

   Module prev, next;
   const char * name;
   void * library;
   void (stdcall * Unload)(Module module);
   ImportType importType;
   // Added to solve stdcall issues with the bootstrap on Windows for Unload
   ImportType origImportType;

   NameSpace privateNameSpace;
   NameSpace publicNameSpace;
};

public class Application : Module
{
   int argc;
   const char ** argv;
   int exitCode;
   bool isGUIApp;
   OldList allModules;
   const char * parsedCommand;
   NameSpace systemNameSpace;
};
*/
public enum MethodType { normalMethod, virtualMethod };

public class Method : struct
{
public:
   class_fixed
   const char * name;
   Method parent, left, right;
   int depth;
   int (*function)();
   int vid;              // For METHOD_VIRTUAL:  Index into the class virtual table
   MethodType type;
   Class _class;
   void * symbol;
   const char * dataTypeString;
   Type dataType;
   AccessMode memberAccess;
};

public enum ImportType
{
   normalImport,
   staticImport,
   remoteImport,

// For internal usage in the compiler:
   preDeclImport,
   comCheckImport
};

public struct NameSpace
{
   const char * name;
   NameSpace * btParent, * left, * right;
   int depth;

   NameSpace * parent;
   BinaryTree nameSpaces;
   BinaryTree classes;
   BinaryTree defines;
   BinaryTree functions;
};

public union DataValue
{
   char c;
   unsigned char uc;
   short s;
   unsigned short us;
   int i;
   unsigned int ui;
   void * p;
   float f;
   double d;
   int64 i64;
   uint64 ui64;
};

public class DataMember : struct
{
public:
   class_fixed
   DataMember prev, next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class _class;
   const char * dataTypeString;
   Class dataTypeClass;
   Type dataType;

   DataMemberType type;
   int offset;
   int memberID;
   OldList members;
   BinaryTree membersAlpha;
   int memberOffset;
   short structAlignment; short pointerAlignment;
};

public class BitMember : struct
{
public:
   class_fixed
   BitMember prev, next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class _class;
   const char * dataTypeString;
   Class dataTypeClass;
   Type dataType;

   DataMemberType type;
   int size;
   int pos;
   uint64 mask;
};

public class ClassProperty : struct
{
public:
   class_fixed
   const char * name;
   ClassProperty parent, left, right;
   int depth;
   void (*Set)(Class, int64);
   int64 (*Get)(Class);
   const char * dataTypeString;
   Type dataType;
   bool constant;
};

public class DefinedExpression : struct
{
public:
   class_fixed
   DefinedExpression prev, next;
   const char * name;
   const char * value;
   NameSpace * nameSpace;
};

public class GlobalFunction : struct
{
public:
   class_fixed
   GlobalFunction prev, next;
   const char * name;
   int (*function)();
   Module module;
   NameSpace * nameSpace;
   const char * dataTypeString;
   Type dataType;
   void * symbol;
};

public class EnumClassData : struct
{
public:
   class_fixed
   OldList values;
   int64 largest;
};

class Watcher : struct
{
   class_fixed
   Watcher prev, next;
   void (*callback)(void *, void *);
   Instance object;
};

#ifdef MEMINFO
static class MemInfo : BTNode //struct
{
   class_fixed

   /*
   byte * key;
   MemInfo parent, left, right;
   int depth;
   */

   byte * oldmem;
   uint size;
   bool freed;
   const char * _class;
   uint id;
   char * allocLoc[MAX_MEMORY_LOC];
   char * freeLoc[MAX_MEMORY_LOC];
   bool internal;

   void OutputStacks(bool showFree)
   {
      int c;

      if(_class)
         printf("Object of class %s\n", _class);
      printf("   Allocation Stack:\n");
      for(c = 0; c<MAX_MEMORY_LOC; c++)
#if (defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__) || defined(_M_X64) || defined(_WIN64) || defined(__LP64__) || defined(__LLP64__)
         if(allocLoc[c] && allocLoc[c] != (void *)0xabababababababab)
#else
         if(allocLoc[c] && allocLoc[c] != (void *)0xabababab)
#endif
            printf("      %s\n", allocLoc[c]);

      if(showFree)
      {
         printf("   Free Location Stack:\n");
         for(c = 0; c<MAX_MEMORY_LOC; c++)
            if(freeLoc[c])
               printf("      %s\n", freeLoc[c]);
      }
      //getch();
   }
};

static BinaryTree memBlocks;

bool recurse = false;
static int blockID;
//Class allocateClass;
char * allocateClass;
bool allocateInternal;

#endif

static uint64 TOTAL_MEM = 0;
#if !defined(MEMINFO) && !defined(DISABLE_MEMMGR)
static uint64 OUTSIDE_MEM = 0;
#endif

#if !defined(_NOMUTEX)
#if !defined(ECERE_BOOTSTRAP)
/*static */Mutex memMutex { };
#endif
#endif

private class MemBlock : struct
{
   MemBlock prev, next;
   MemPart part;
   uint size;
#if !defined(MEMINFO) && defined(MEMTRACKING)
   Class _class;
#endif
};

private class MemPart : struct
{
   void * memory;
   int blocksUsed;
   int size;
   BlockPool * pool;
};
/*
#define NUM_POOLS          29
#define NEXT_SIZE(s)       NextFibonacci(s)
#define SIZE_POSITION(s)   PosFibonacci(s)
#define NTH_SIZE(p)        NthFibonacci(p)

static uint initNumBlocks[NUM_POOLS] =
{
   1024, // 1
   1024, // 2
   1024, // 3
   1024, // 5
   1024, // 8
   1024, // 13
   1024, // 21
   1024, // 34
   1024, // 55
   1024, // 89
   1024, // 144
   512,  // 233
   512,  // 377
   256,  // 610
   128,  // 987
   128,  // 1597
   64,   // 2584
   32,   // 4181
   32,   // 6765
   16,   // 10946
   16,   // 17711
   8,    // 28657
   4,    // 46368
   2,    // 75025
   1,    // 121393
   1,    // 196418
   1,    // 317811
   1,    // 514229
   1,    // 832040
};

*/
/*
#define NUM_POOLS 20
#define NEXT_SIZE(s)       pow2i(s)
#define SIZE_POSITION(s)   log2i(s)
#define NTH_SIZE(p)        (1<<p)

   1024,  // 1 byte
   4000,  // 1024,    // 2 bytes
   2500,  // 1024,    // 4 bytes
   18000, //1024,    // 8 bytes
   20000, //1024,    // 16 bytes
   29000, //1024,    // 32 bytes
   46000, //1024,    // 64 bytes
   20000, //1024,    // 128 bytes
   26000, //512,     // 256 bytes
   1400,  //256,     // 512 bytes
   160,   //128,     // 1 K
   500,  //64,      // 2 K

static uint initNumBlocks[NUM_POOLS] =
{
   1024,  // 1 byte
   1024,    // 2 bytes
   1024,    // 4 bytes
   1024,    // 8 bytes
   1024,    // 16 bytes
   1024,    // 32 bytes
   1024,    // 64 bytes
   1024,    // 128 bytes
   512,     // 256 bytes
   256,     // 512 bytes
   128,     // 1 K
   64,      // 2 K
   32,      // 4 K
   16,      // 8 K
   8,       // 16 K
   4,       // 32 K
   2,       // 64 K
   1,       // 128 K
   1,       // 256 K
   1        // 512 K
};
*/

#define NUM_POOLS 31
#define NEXT_SIZE(s)       pow1_5i(s)
#define SIZE_POSITION(s)   log1_5i(s)
#define NTH_SIZE(p)        pow1_5(p)

#if 0
static int power15[] =
{
/*
1
2
3
*/
/*
4     // 4
6     // 8
9     // 12
13    // 16
19    // 24
28    // 32
42    // 48
63    // 64
94    // 96
141   // 144
211   // 224
316   // 320
474   // 480
711   // 720
1066  // 1072
1599  // 1600
2398  // 2400
3597  // 6900
5395  // 5408
8092  // 8096
12138 // 12144
18207 // 18208
27310 // 27312
40965 // 40976
61447 // 61456
92170 // 92176
138255   // 138256
207382   // 207392
311073   // 311088
466609   // 466624
699913   // 699920
*/
4,
8,
12,
16,
24,
32,
48,
64,
96,
144,
224,
320,
480,
720,
1072,
1600,
2400,
6900,
5408,
8096,
12144,
18208,
27312,
40976,
61456,
92176,
138256,
207392,
311088,
466624,
699920
};
#endif

private struct BlockPool
{
   MemBlock first, last;
   MemBlock free;
   uint blockSize;
   uint blockSpace;
   //MemPart * parts;
   int numParts;
   int numBlocks;
   uint totalSize;
   uint usedSpace;

   bool Expand(uint numBlocks)
   {
      byte * memory = malloc((uintsize)numBlocks * blockSpace);
      // byte * memory = calloc(1, (uintsize)numBlocks * blockSpace);
      TOTAL_MEM += (uint64)numBlocks * blockSpace;
#ifdef _DEBUG
      /*if(blockSize == 28)
         printf("Expanding pool %x (%d)\n", this, blockSize);*/
#endif
      if(memory)
      {
         int c;
#ifdef _DEBUG
         /*uint totalAvailable = 0, totalAllocated = 0, totalBlocks = 0, totalUsed = 0;
         uint totalParts = 0;*/
#endif
         MemBlock block = (MemBlock)memory;
         MemPart part = calloc(1, sizeof(class MemPart));
         TOTAL_MEM += sizeof(class MemPart);
         free = block;
         for(c = 0; c<numBlocks - 1; c++)
         {
            // block.pool = this;
            block.part = part;
            /*if(part.size < 0)
               printf("WARNING! part.size < 0\n");*/
            block.prev = null;
            block.next = (MemBlock)((byte *)block + blockSpace);
            block = block.next;
         }
         part.blocksUsed = 0;
         part.pool = this;
         part.memory = memory;
         part.size = numBlocks;

         // block.pool = this;
         block.part = part;
         /*if(part.size < 0)
            printf("/! part.size < 0\n");
         if(part.pool == (void*) -1)
            printf("WARNING! pool is -1\n");*/
         block.prev = null;
         block.next = null;

         /*if(free && free.part && (free.part.size < 0 || free.part.pool == (void *)-1))
            printf("WARNING! Bad next free block!\n");*/

         //parts = realloc(parts, sizeof(MemPart) * (numParts + 1));

         totalSize += numBlocks;

#ifdef _DEBUG
         /*
         {
            for(c = 0; c<NUM_POOLS; c++)
            {
               BlockPool * pool = &pools[c];
               printf("[%d %s (%d)]: available: %d, allocated: %d, free: %d, used: %d k, wasted: %d k, free: %d k\n", c, (&pools[c] == this) ? "*" : " ",
                  pools[c].blockSize, pools[c].totalSize, pools[c].numBlocks,
                  pools[c].totalSize - pools[c].numBlocks, pools[c].usedSpace / 1024, ((pools[c].numBlocks * pools[c].blockSize) - pools[c].usedSpace) / 1024,
                  (pools[c].totalSize - pools[c].numBlocks) * pools[c].blockSize / 1024);
               totalAvailable += pools[c].totalSize * pools[c].blockSize;
               totalAllocated += pools[c].numBlocks * pools[c].blockSize;
               totalUsed += pools[c].usedSpace;
               totalBlocks += pools[c].totalSize;
               totalParts += pools[c].numParts;
            }
            printf("Total Available %d k, Total Allocated: %d k, Total Free: %d k\n", totalAvailable / 1024, totalAllocated / 1024, (totalAvailable - totalAllocated) / 1024);
            printf("Total Number of Blocks %d, overhead of %d k\n", totalBlocks, totalBlocks * sizeof(class MemBlock) / 1024);
            printf("Total Used Space %d k, wasted from roundup: %d k\n", totalUsed / 1024, (totalAllocated - totalUsed) / 1024);
            printf("Total Memory Parts: %d\n", totalParts);
            printf("TOTAL_MEM: %d k, OUTSIDE_MEM: %d k, BLOCKS: %d k\n", TOTAL_MEM / 1024, OUTSIDE_MEM / 1024, (totalAvailable + totalBlocks * sizeof(class MemBlock)) / 1024);
            printf("\n");
         }
         */
#endif
         //parts[] = part;
         numParts++;
         return true;
      }
      return false;
   }

   MemBlock Add()
   {
      MemBlock block = null;
      /*if(blockSize == 28)
         printf("BlockPool::Add (%d)\n", blockSize);*/
      if(!free)
         Expand(Max(1, numBlocks / 2));
      if(free)
      {
         block = free;
         block.prev = last;
         if(block.prev)
            block.prev.next = block;
         if(!first)
            first = block;
         last = block;
         free = block.next;
         /*if(blockSize == 28)
            printf("Free: %x, free.part: %x, free.part.size: %d, free.part.pool: %x (this = %x), next = %x (part = %x)\n", free, free ? free.part : null,
               (free && free.part) ? free.part.size : 0, (free && free.part) ? free.part.pool : 0, this,
               (free ? free.next : 0), (free && free.next) ? free.next.part : 0);
         if(free && free.part && (free.part.size < 0 || free.part.pool == (void *)-1))
            printf("WARNING! Bad next free block!\n");*/

         block.next = null;
         //if(block.part)
            block.part.blocksUsed++;
         /*else
         {
            printf("");
         }*/
         numBlocks++;
      }
      return block;
   }

   void Remove(MemBlock block)
   {
      MemPart part = block.part;
      /*if(blockSize == 28)
         printf("BlockPool::Remove (%d)\n", blockSize);*/
      if(block.prev)
         block.prev.next = block.next;
      if(block.next)
         block.next.prev = block.prev;

      if(first == block)
         first = block.next;
      if(last == block)
         last = block.prev;

      // block.prev = null;
      block.next = free;
      free = block;

      /*if(blockSize == 28)
      {
         printf("Setting new free block: part = %x\n", block.part);
      }*/

      part.blocksUsed--;
      numBlocks--;
      part.pool->usedSpace -= block.size;

      if(!part.blocksUsed && numBlocks && totalSize > numBlocks + numBlocks / 2)
      {
         MemBlock next = free, prev = null;
         free = null;
         totalSize -= part.size;
         /*if(blockSize == 28)
            printf("Freeing a part\n");*/
         while(next)
         {
            if(next.part != part)
            {
               if(prev)
                  prev.next = next;
               else
                  free = next;
               prev = next;
            }
            next = next.next;
         };
         if(prev)
            prev.next = null;

         TOTAL_MEM -= (uint64)part.size * blockSpace;
         TOTAL_MEM -= sizeof(class MemPart);
         numParts--;

         ::free(part.memory);
         ::free(part);
      }
      /*if(free && free.part && (free.part.size < 0 || free.part.pool == (void *)-1))
         printf("WARNING! Bad next free block!\n");*/
   }
};

#if !defined(MEMINFO) && !defined(DISABLE_MEMMGR)
static BlockPool * pools; //[NUM_POOLS];

/*static uint PosFibonacci(uint number)
{
   uint pos;
   uint last = 1, prev = 0;
   uint current = 1;

   for(pos=0; ; pos++)
   {
      current += prev;
      prev = last;
      last = current;
      if(current >= number)
         break;
   }
   return pos;
}

static uint NthFibonacci(uint number)
{
   uint pos;
   uint last = 1, prev = 0;
   uint current = 1;

   for(pos=0; pos <= number; pos++)
   {
      current += prev;
      prev = last;
      last = current;
   }
   return current;
}

static uint NextFibonacci(uint number)
{
   uint pos;
   uint last = 1, prev = 0;
   uint current = 1;

   for(pos=0; ; pos++)
   {
      current += prev;
      prev = last;
      last = current;
      if(current >= number)
         return current;
   }
}
*/

static uint log1_5i(uint number)
{
   uint pos;
   uint64 current = sizeof(void *);

   for(pos=0; pos < NUM_POOLS; pos++)
   {
      if(current >= number)
         break;
      current = current * 3 / 2;
      if(current == 1) current = 2;
      if(current & 7) current += 8 - (current & 7);
   }
   return pos;
}

static uint pow1_5(uint number)
{
   uint pos;
   uint64 current = sizeof(void *);
   for(pos=0; pos < number; pos++)
   {
      current = current * 3 / 2;
      if(current == 1) current = 2;
      if(current & 7) current += 8 - (current & 7);
   }
   return (uint)current;
}

static uint pow1_5i(uint number)
{
   uint pos;
   uint64 current = sizeof(void *);

   for(pos=0; pos < NUM_POOLS; pos++)
   {
      if(current >= number)
         return (uint)current;
      current = current * 3 / 2;
      if(current == 1) current = 2;
      if(current & 7) current += 8 - (current & 7);
   }
   return (uint)current;
}
#endif

// -- Math Helpers ---
public uint log2i(uint number)
{
   uint power;

   for(power=0; power<32; power++)
      if((1L<<power) >= number)
         break;
   return power;
}

public uint pow2i(uint number)
{
   return 1<<log2i(number);
}

#if !defined(MEMINFO) && !defined(DISABLE_MEMMGR)
static bool memoryInitialized = false;
static void InitMemory()
{
   int c;
   memoryInitialized = true;
   pools = calloc(1, sizeof(BlockPool) * NUM_POOLS);
   for(c = 0; c<NUM_POOLS; c++)
   {
      int expansion;

      pools[c].blockSize = NTH_SIZE(c);
      if(pools[c].blockSize % sizeof(void *))
         pools[c].blockSize += sizeof(void *) - (pools[c].blockSize % sizeof(void *));
      pools[c].blockSpace = pools[c].blockSize;
      pools[c].blockSpace += sizeof(class MemBlock);
      // pools[c].Expand(initNumBlocks[c]);

      expansion = (pools[c].blockSize < 128) ? 1024 : (131072 / pools[c].blockSize);

      if(c < 12)
         pools[c].Expand(Max(1, expansion));
   }
}
#endif

#if !defined(MEMINFO) && !defined(DISABLE_MEMMGR)
static void * _mymalloc(unsigned int size)
{
   MemBlock block = null;
   if(size)
   {
      unsigned int p = SIZE_POSITION(size);
      if(!memoryInitialized) InitMemory();
      if(!poolingDisabled && p < NUM_POOLS)
      {
         block = pools[p].Add();
         if(block)
         {
#if defined(MEMTRACKING)
            block._class = null;
#endif
            block.size = size;
            pools[p].usedSpace += size;
         }
      }
      else
      {
         block = malloc(sizeof(class MemBlock) + size);
         if(block)
         {
            TOTAL_MEM += sizeof(class MemBlock) + size;
            OUTSIDE_MEM += sizeof(class MemBlock) + size;
            block.part = null;
#if defined(MEMTRACKING)
            block._class = null;
#endif
            block.size = size;
         }
      }
   }
   return block ? ((struct MemBlock *)block + 1) : null;
}

static void * _mycalloc(int n, unsigned int size)
{
   void * pointer = _mymalloc(n * size);
   if(pointer)
      memset(pointer, 0, n * size);
   return pointer;
}


static void _myfree(void * pointer)
{
   if(pointer)
   {
      MemBlock block = (MemBlock)((byte *)pointer - sizeof(class MemBlock));
      MemPart part = block.part;
      BlockPool * pool = part ? part.pool : null; //block.pool;
      /*if(pool == (void*) -1)
         printf("WARNING! pool is -1\n");
      else   */
      if(pool)
      {
#ifdef _DEBUG
         memset(pointer, 0xec, block.size);
#endif
         pool->Remove(block);
      }
      else
      {
         TOTAL_MEM -= sizeof(class MemBlock) + block.size;
         OUTSIDE_MEM -= sizeof(class MemBlock) + block.size;

#ifdef _DEBUG
         memset(block, 0xec, sizeof(class MemBlock) + block.size);
#endif
         free(block);
      }
   }
}

static void * _myrealloc(void * pointer, unsigned int size)
{
   MemBlock block = pointer ? ((MemBlock)((byte *)pointer - sizeof(class MemBlock))) : null;
   void * newPointer = null;
   MemPart part = block ? block.part : null;
   BlockPool * pool = part ? part.pool : null;
   if(block)
   {
      /*if(pool == (void*) -1)
         printf("WARNING! pool is -1\n");
      else*/
      if(pool)
      {
         // if((1 << pool) >= size && (pool - SIZE_POSITION(size)) <= 1)
         uint ns = NEXT_SIZE(size);
         uint mod = ns % sizeof(void *);
         if(mod) ns += sizeof(void *)-mod;
         if(ns == pool->blockSize)
         {
            newPointer = pointer;
            pool->usedSpace += size - block.size;
            block.size = size;
         }
      }
      else if(size)
      {
         MemBlock newBlock = realloc(block, sizeof(class MemBlock) + size);
         if(newBlock)
         {
            TOTAL_MEM += size - newBlock.size;
            OUTSIDE_MEM += size - newBlock.size;
            newPointer = ((struct MemBlock *)newBlock + 1);
            newBlock.size = size;
         }
      }
   }
   if(!newPointer)
   {
      newPointer = _mymalloc(size);
      if(pointer && newPointer)
      {
         memcpy(newPointer, pointer, Min(size, block.size));
         _myfree(pointer);
      }
   }
   return newPointer;
}

static void * _mycrealloc(void * pointer, unsigned int size)
{
   MemBlock block = pointer ? ((MemBlock)((byte *)pointer - sizeof(class MemBlock))) : null;
   void * newPointer = null;
   MemPart part = block ? block.part : null;
   BlockPool * pool = part ? part.pool : null;
   if(block)
   {
      /*if(pool == (void*) -1)
         printf("WARNING! pool is -1\n");
      else*/

      if(pool)
      {
         // if((1 << pool) >= size && (pool - SIZE_POSITION(size)) <= 1)
         uint ns = NEXT_SIZE(size);
         uint mod = ns % sizeof(void *);
         if(mod) ns += sizeof(void *)-mod;
         if(ns == pool->blockSize)
         {
            int extra = size - block.size;
            newPointer = pointer;
            pool->usedSpace += extra;
            if(extra > 0)
               memset((byte *)pointer + block.size, 0, extra);
            block.size = size;
         }
      }
      else if(size)
      {
         MemBlock newBlock = realloc(block, sizeof(class MemBlock) + size);
         if(newBlock)
         {
            int extra = size - newBlock.size;
            TOTAL_MEM += extra;
            OUTSIDE_MEM += extra;
            newPointer = ((struct MemBlock *)newBlock + 1);
            if(extra > 0)
               memset((byte *)newPointer + newBlock.size, 0, extra);
            newBlock.size = size;
         }
      }
   }
   if(!newPointer)
   {
      newPointer = _mymalloc(size);
      if(newPointer)
      {
         if(pointer)
         {
            memcpy(newPointer, pointer, Min(size, block.size));
            if(size > block.size)
               memset((byte *)newPointer + block.size, 0, size - block.size);
            _myfree(pointer);
         }
         else
            memset((byte *)newPointer, 0, size);
      }
   }
   return newPointer;
}

#undef realloc
#undef crealloc
#undef malloc
#undef free
#undef calloc

#define realloc _myrealloc
#define crealloc _mycrealloc
#define malloc _mymalloc
#define free _myfree
#define calloc _mycalloc
#endif

#if defined(__EMSCRIPTEN__) && defined(DISABLE_MEMMGR) && !defined(MEMINFO) && !defined(msize)
   const uintsize allocSizePrefixLen = sizeof(size_t) % 8 ? 8 : sizeof(size_t);
#else
   const uintsize allocSizePrefixLen = sizeof(size_t);
#endif

static void * _malloc(unsigned int size)
{
#if defined(DISABLE_MEMMGR) && !defined(MEMINFO)

#if defined(msize)
   return size ? malloc(size) : null;
#else
   byte * p;
   p = size ? malloc(size + allocSizePrefixLen) : null;
   if(p) *(size_t *)p = size;
   return p ? p + allocSizePrefixLen : null;
#endif

#else
   void * pointer;

#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif

   pointer = size ? malloc(size + 2 * REDZONE) : null;
#ifdef MEMINFO
   if(pointer)
   {
      MemInfo block;
      MemStack stack = (MemStack)memStacks.Find(GetCurrentThreadID());
      if(!stack)
      {
         stack = (MemStack)calloc(1, sizeof(class MemStack));
         stack.key = GetCurrentThreadID();
         memStacks.Add(stack);
      }

      if(!pointer)
      {
         int c;
         printf("Memory allocation of %d bytes failed\n", size);
         printf("Current Stack:\n");
         for(c = 0; c<stack.pos; c++)
            if(stack.frames[c])
               printf("      %s\n", stack.frames[c]);

         memoryErrorsCount++;
#if !defined(_NOMUTEX)
         memMutex.Release();
#endif
         return null;
      }

      if(!recurse && !stack.recurse)
      {
         stack.recurse = true;
         block = MemInfo { size = size, key = (uintptr)((byte *)pointer + REDZONE), id = blockID++ };
         memcpy(block.allocLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
         memBlocks.Add(block);
         stack.recurse = false;
      }
   }
#endif

#if !defined(_NOMUTEX)
   memMutex.Release();
#endif

#if REDZONE
   if(pointer)
   {
      memset(pointer, 0xAB, REDZONE);
      memset((byte *)pointer + REDZONE + size, 0xAB, REDZONE);
      // ((byte *)pointer)[0] = 0x00;
   }
#endif
   return pointer ? ((byte*)pointer + REDZONE) : null;
#endif
}

static void * _calloc(int n, unsigned int size)
{
#if defined(DISABLE_MEMMGR) && !defined(MEMINFO)

#if defined(msize)
   return n && size ? calloc(n, size) : null;
#else
   byte * p;
   p = n && size ? calloc(n, size + allocSizePrefixLen) : null;
   if(p) *(size_t *)p = size;
   return p ? p + allocSizePrefixLen : null;
#endif

#else
   void * pointer;

#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif

   pointer = n && size ? calloc(1, n * size + 2 * REDZONE) : null;
#ifdef MEMINFO
   if(pointer)
   {
      MemStack stack;
      stack = (MemStack)memStacks.Find(GetCurrentThreadID());
      if(!stack)
      {
         stack = (MemStack)calloc(1, sizeof(class MemStack));
         stack.key = GetCurrentThreadID();
         memStacks.Add(stack);
      }
      if(!pointer)
      {
         int c;
         printf("Memory allocation of %d bytes failed\n", size);
         printf("Current Stack:\n");
         for(c = 0; c<stack.pos; c++)
            if(stack.frames[c])
               printf("      %s\n", stack.frames[c]);
         memoryErrorsCount++;
#if !defined(_NOMUTEX)
         memMutex.Release();
#endif
         return null;
      }

      if(!recurse && !stack.recurse)
      {
         MemInfo block;

         stack.recurse = true;
         block = MemInfo { size = (unsigned int)n * size, key = (uintptr)((byte *)pointer + REDZONE), _class = allocateClass, internal = allocateInternal, id = blockID++ };
         memcpy(block.allocLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
         memBlocks.Add(block);
         stack.recurse = false;
      }
   }
#endif

#if !defined(_NOMUTEX)
   memMutex.Release();
#endif

#if REDZONE
   if(pointer)
   {
      memset(pointer, 0xAB, REDZONE);
      memset((byte *)pointer + REDZONE + (unsigned int)n * size, 0xAB, REDZONE);
   }
#endif
   return pointer ? ((byte*)pointer + REDZONE) : null;
#endif
}

static void * _realloc(void * pointer, unsigned int size)
{
#if defined(DISABLE_MEMMGR) && !defined(MEMINFO)

#if defined(msize)
   if(!size) { if(pointer) free(pointer); return null; }
   return realloc(pointer, size);
#else
   byte * p;
   if(!size) { if(pointer) free((byte *)pointer - allocSizePrefixLen); return null; }
   p = realloc(pointer ? (byte *)pointer - allocSizePrefixLen : null, size + allocSizePrefixLen);
   if(p) *(size_t *)p = size;
   if(p) p += allocSizePrefixLen;
   return p;
#endif

#else
   if(!size) { _free(pointer); return null; }

#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif

#ifdef MEMINFO
{
   MemInfo block = null;
   MemStack stack;
   stack = (MemStack)memStacks.Find(GetCurrentThreadID());
   if(!stack)
   {
      stack = (MemStack)calloc(1, sizeof(class MemStack));
      stack.key = GetCurrentThreadID();
      memStacks.Add(stack);
   }

   if(!recurse && !stack.recurse && pointer)
   {
      block = (MemInfo)memBlocks.Find((uintptr)pointer);
      if(!block)
      {
         printf("Reallocating Bad Memory\n");
         memoryErrorsCount++;
      }
      else if(block.freed)
      {
         printf("Reallocating Freed Memory\n");
         memoryErrorsCount++;
         block.OutputStacks(true);
      }
   }

   pointer = malloc(size + REDZONE * 2);
   if(!pointer)
   {
      int c;
      printf("Memory allocation of %d bytes failed\n", size);
      printf("Current Stack:\n");
      for(c = 0; c<stack.pos; c++)
         if(stack.frames[c])
            printf("      %s\n", stack.frames[c]);
      memoryErrorsCount++;
#if !defined(_NOMUTEX)
      memMutex.Release();
#endif
      return null;
   }
   memset(pointer, 0xAB, REDZONE);
   memset((byte *)pointer + REDZONE + size, 0xAB, REDZONE);

   if(block)
   {
#if defined(JUST_CHECK_LEAKS) || defined(JUST_CHECK_BOUNDARIES)
      memcpy((byte *)pointer + REDZONE, (byte *)block.key, Min(block.size, size));
      free((byte *)block.key - REDZONE);
      memBlocks.Remove(block);
      free(block);
#else
      if(block.freed)
      {
         memcpy((byte *)pointer + REDZONE, block.oldmem, Min(block.size, size));
      }
      else
      {
         memcpy(block.freeLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
         memcpy((byte *)pointer + REDZONE, (byte *)block.key, Min(block.size, size));
         block.oldmem = (byte *)malloc(block.size + REDZONE * 2);
         if(block.oldmem)
         {
            block.oldmem += REDZONE;
            memcpy(block.oldmem - REDZONE, (byte *)block.key - REDZONE, block.size + 2 * REDZONE);
         }
         memset((byte *)block.key - REDZONE, 0xEC, block.size + REDZONE * 2);
         block.freed = true;
      }
#endif
   }

   if(!recurse && !stack.recurse)
   {
      MemInfo block;
      stack.recurse = true;
      block = MemInfo { size = size, key = (uintptr)((byte *)pointer + REDZONE), id = blockID++ };
      memcpy(block.allocLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
      memBlocks.Add(block);
      stack.recurse = false;
   }
}
#else
   pointer = realloc(pointer, size);
#endif

#if !defined(_NOMUTEX)
   memMutex.Release();
#endif
   return pointer ? ((byte *)pointer + REDZONE) : null;
#endif
}

static void * _crealloc(void * pointer, unsigned int size)
{
#if defined(DISABLE_MEMMGR) && !defined(MEMINFO)
   byte * p;

#if defined(msize)
   uintsize s = pointer ? msize(pointer) : 0;
   if(!size) { if(pointer) free(pointer); return null; }
   p = realloc(pointer, size);
#else
   uintsize s = pointer ? *(size_t *)((byte *)pointer - allocSizePrefixLen) : 0;
   if(!size) { if(pointer) free((byte *)pointer - allocSizePrefixLen); return null; }
   p = realloc(pointer ? (byte *)pointer - allocSizePrefixLen : null, size + allocSizePrefixLen);
   if(p) *(size_t *)p = size;
   if(p) p += allocSizePrefixLen;
#endif
   if(size > s && p)
      memset((byte *)p + s, 0, size - s);
   if(size && !p)
      printf("_crealloc failed allocating %d bytes!\n", size);
   return p;
#else
   if(!size) { if(pointer) _free(pointer); return null; }

#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif

#ifdef MEMINFO
{
   MemInfo block = null;
   MemStack stack;
   stack = (MemStack)memStacks.Find(GetCurrentThreadID());
   if(!stack)
   {
      stack = (MemStack)calloc(1, sizeof(class MemStack));
      stack.key = GetCurrentThreadID();
      memStacks.Add(stack);
   }

   if(!recurse && !stack.recurse && pointer)
   {
      block = (MemInfo)memBlocks.Find((uintptr)pointer);
      if(!block)
      {
         printf("Reallocating Bad Memory\n");
         memoryErrorsCount++;
      }
      else if(block.freed)
      {
         printf("Reallocating Freed Memory\n");
         memoryErrorsCount++;
         block.OutputStacks(true);
      }
   }

   pointer = calloc(1, size + REDZONE * 2);
   if(!pointer)
   {
      int c;
      printf("Memory allocation of %d bytes failed\n", size);
      printf("Current Stack:\n");
      for(c = 0; c<stack.pos; c++)
         if(stack.frames[c])
            printf("      %s\n", stack.frames[c]);
      memoryErrorsCount++;
#if !defined(_NOMUTEX)
      memMutex.Release();
#endif
      return null;
   }
   memset(pointer, 0xAB, REDZONE);
   memset((byte *)pointer + REDZONE + size, 0xAB, REDZONE);

   if(block)
   {
#if defined(JUST_CHECK_LEAKS) || defined(JUST_CHECK_BOUNDARIES)
      memcpy((byte *)pointer + REDZONE, (byte *)block.key, Min(block.size, size));
      free((byte *)block.key - REDZONE);
      memBlocks.Remove(block);
      free(block);
#else
      if(block.freed)
      {
         memcpy((byte *)pointer + REDZONE, block.oldmem, Min(block.size, size));
      }
      else
      {
         memcpy(block.freeLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
         memcpy((byte *)pointer + REDZONE, (byte *)block.key, Min(block.size, size));
         block.oldmem = (byte *)malloc(block.size + REDZONE * 2);
         if(block.oldmem)
         {
            block.oldmem += REDZONE;
            memcpy(block.oldmem - REDZONE, (byte *)block.key - REDZONE, block.size + 2 * REDZONE);
         }
         memset((byte *)block.key - REDZONE, 0xEC, block.size + REDZONE * 2);
         block.freed = true;
      }
#endif
   }

   if(!recurse && !stack.recurse)
   {
      MemInfo block;
      stack.recurse = true;
      block = MemInfo { size = size, key = (uintptr)((byte *)pointer + REDZONE), id = blockID++ };
      memcpy(block.allocLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
      memBlocks.Add(block);
      stack.recurse = false;
   }
}
#else
   pointer = crealloc(pointer, size);
#endif

#if !defined(_NOMUTEX)
   memMutex.Release();
#endif
   return pointer ? ((byte *)pointer + REDZONE) : null;
#endif
}

static void _free(void * pointer)
{
   if(pointer)
   {
#if defined(DISABLE_MEMMGR) && !defined(MEMINFO)

#if defined(msize)
      free(pointer);
#else
      free((byte *)pointer - allocSizePrefixLen);
#endif

#else
#if !defined(_NOMUTEX)
      if(memMutex != pointer) memMutex.Wait();
#endif

#ifdef MEMINFO
{
      MemStack stack;

      stack = (MemStack)memStacks.Find(GetCurrentThreadID());
      if(!stack)
      {
         stack = (MemStack)calloc(1, sizeof(class MemStack));
         stack.key = GetCurrentThreadID();
         memStacks.Add(stack);
      }

      if(!recurse && !stack.recurse)
      {
         MemInfo block;
         stack.recurse = true;
         block = (MemInfo)memBlocks.Find((uintptr)pointer);
         if(!block)
         {
            int c;
            printf("Freeing Bad Memory\n");
            printf("Current Stack:\n");
            for(c = 0; c<stack.pos; c++)
               if(stack.frames[c])
                  printf("      %s\n", stack.frames[c]);

            memoryErrorsCount++;
         }
         else if(block.freed)
         {
            int c;
            printf("Freeing Already Freed Memory\n");
            printf("Current Stack:\n");
            for(c = 0; c<stack.pos; c++)
               if(stack.frames[c])
                  printf("      %s\n", stack.frames[c]);

            memoryErrorsCount++;
            block.OutputStacks(true);
         }
         else
         {
            /*int c;
            byte * address = (byte *)block.key;
            for(c = 0; c<REDZONE; c++)
            {
               if(address[-c-1] != 0xEC)
               {
                  printf("Buffer Underrun\n");
                  memoryErrorsCount++;
                  block.OutputStacks(block.freed);
               }
               if(address[c + block.size] != 0xEC)
               {
                  printf("Buffer Overrun\n");
                  memoryErrorsCount++;
                  block.OutputStacks(block.freed);
               }
            }*/

            {
               byte * address;
               int c;
               int size = block.size;
               address = (byte *)block.key;
               for(c = 0; c<REDZONE; c++)
               {
                  if(address[-c-1] != 0xAB)
                  {
                     printf("Buffer Underrun (%d bytes before)\n", c+1);
                     memoryErrorsCount++;
                     block.OutputStacks(block.freed);
                  }
                  if(address[c + size] != 0xAB)
                  {
                     printf("Buffer Overrun (%d bytes past block)\n", c);
                     memoryErrorsCount++;
                     block.OutputStacks(block.freed);
                  }
               }
            }

            block.freed = true;
#if defined(JUST_CHECK_LEAKS) || defined(JUST_CHECK_BOUNDARIES)
            free((byte *)block.key - REDZONE);
            memBlocks.Remove(block);
            free(block);
#else
            block.oldmem = (byte *)malloc(block.size + REDZONE * 2);
            if(block.oldmem)
            {
               block.oldmem += REDZONE;
               memcpy(block.oldmem - REDZONE, (byte *)block.key - REDZONE, block.size + REDZONE * 2);
            }
            memset((byte *)block.key - REDZONE, 0xEC, block.size + REDZONE * 2);

            memcpy(block.freeLoc, stack.frames + stack.pos - Min(stack.pos, MAX_MEMORY_LOC), Min(stack.pos, MAX_MEMORY_LOC) * sizeof(char *));
#endif
         }
         stack.recurse = false;
      }
}
#else
      free(pointer);
#endif

#if !defined(_NOMUTEX)
      if(memMutex != pointer) memMutex.Release();
#endif

#endif
   }
}

public void memswap(byte * a, byte * b, uint size)
{
   uint c;
   byte buffer[1024];
   for(c = 0; c<size;)
   {
      int s = sizeof(buffer);
      if(c + s > size) s = size - c;
      memcpy(buffer, a + c, s);
      memcpy(a + c, b + c, s);
      memcpy(b + c, buffer, s);
      c += s;
   }
}

public void CheckConsistency()
{
#ifdef MEMINFO
   if(!memBlocks.Check())
      printf("Memory Blocks Tree Integrity Failed\n");
#endif
}

public void CheckMemory()
{
#ifdef MEMINFO
   MemInfo block;
   uint leaksCount = 0;
   uint leakedObjects = 0;
   uint leaksSize = 0;
   recurse = true;
   // Verify Tree Integrity
   if(!memBlocks.Check())
   {
      printf("Memory Blocks Tree Integrity Failed\n");
      memoryErrorsCount++;
   }
   printf("Starting Memory Check\n");
   for(block = (MemInfo)memBlocks.first; block; block = (MemInfo)block.next)
   {
      if(!block.freed && block._class)
         leakedObjects++;
   }

   for(block = (MemInfo)memBlocks.root; block;)
   {
      if(block.freed)
         memswap((byte *)block.key - REDZONE, block.oldmem - REDZONE, block.size + REDZONE * 2);
      else
      {
         if(block._class)
         {
            // if(!block.internal)
            {
               // printf("Object of class %s\n", block._class);
               block.OutputStacks(false);
            }
         }
         else if(!leakedObjects)
         {
            printf("Memory Leak\n");
            block.OutputStacks(false);
         }

         leaksCount ++;
         leaksSize += block.size;
      }

      if(block.left)
         block = (MemInfo)block.left;
      else if(block.right)
         block = (MemInfo)block.right;
      else
      {
         while(block)
         {
            MemInfo parent = (MemInfo)block.parent;
            if(parent && block == (MemInfo)parent.left && parent.right)
            {
               block = (MemInfo)parent.right;
               break;
            }
            block = parent;
         }
      }
   }

   while((block = (MemInfo)memBlocks.root))
   {
      byte * address;
      int c;
      int size = block.size;
      if(block.freed)
      {
         address = block.oldmem;
         for(c = -REDZONE; c<size + REDZONE; c++)
            if(address[c] != 0xEC)
            {
               break;
            }
         if(c < size + REDZONE)
         {
            printf("Freed Memory Write\n");
            memoryErrorsCount++;
            block.OutputStacks(true);
         }
      }

      address = (byte *)block.key;
      for(c = 0; c<REDZONE; c++)
      {
         if(address[-c-1] != 0xAB)
         {
            printf("Buffer Underrun (%d bytes before)\n", c + 1);
            memoryErrorsCount++;
            block.OutputStacks(block.freed);
         }
         if(address[c + size] != 0xAB)
         {
            printf("Buffer Overrun (%d bytes past)\n", c);
            memoryErrorsCount++;
            block.OutputStacks(block.freed);
         }
      }

      memBlocks.Delete(block);
   }
   if(leaksCount)
   {
      printf("%d Memory Leaks Detected (%d objects, %d bytes).\n", leaksCount, leakedObjects, leaksSize);
      memoryErrorsCount++;
   }
   printf("Memory Check Completed.\n");
   fflush(stdout);
#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
   if(memoryErrorsCount)
      system("pause");
#endif
#endif
}

static void FixDerivativesBase(Class base, Class mod)
{
   OldLink derivative;

   ComputeClassParameters(base, strchr(base.name, '<'), null, base.templateClass != mod);

   for(derivative = base.derivatives.first; derivative; derivative = derivative.next)
   {
      Class _class = derivative.data;
      ClassType type = _class.type;
      ClassType oldType = type;
      int size = _class.structSize - _class.offset;
      int oldSizeClass = _class.sizeClass;
      int sizeClass = _class.sizeClass - _class.offsetClass;
      Class enumBase = null;
      const char * dataTypeString = null;
      // NOTE: baseClass is class(class)
      Class baseClass;
      uint offsetBefore = _class.offset;

      int offsetClass, totalSizeClass;

      for(baseClass = base; baseClass.base; baseClass = baseClass.base);

      if(base && !base.internalDecl && (base.type == noHeadClass || base.type == structClass || base.type == normalClass))
      {
         // Normal classes inheriting off simple classes should become no head classes
         if(base.type == structClass && (type == normalClass || type == noHeadClass))
            type = noHeadClass;
         else
            type = base.type;
      }
      if(base && (_class.type == normalClass || _class.type == noHeadClass || _class.type == structClass) &&
         (base.type == unitClass || base.type == bitClass || base.type == enumClass))
      {
         type = base.type;
      }

      if(type == enumClass)
      {
         if(base.type != enumClass)
         {
            enumBase = base;
            base = eSystem_FindClass(_class.module, "enum");
         }
      }

      dataTypeString = enumBase ? enumBase.dataTypeString : base.dataTypeString;

      /////////////////////

      offsetClass = base ? (base.templateClass ? base.templateClass.sizeClass : base.sizeClass) : (type == noHeadClass ? 0 : 0 /*sizeof(class Class)*/);
      totalSizeClass = offsetClass + sizeClass;

      // TESTING WITHOUT THIS... Seems to yield better results, as it otherwise prevents ComputeClassMembers from doing its job on derived classes

      // _class.memberID = _class.startMemberID = (base && (type == normalClass || type == noHeadClass || type == structClass)) ? base.memberID : 0;

      if(type == normalClass || type == noHeadClass)
      {
         // TOCHECK: base.memberOffset might not properly set at this stage
         if(type != noHeadClass || base.memberOffset)
         {
            // Use 'memberOffset' for nohead class as the members get added without padding
            _class.offset = (base && (base.templateClass ? (type == normalClass ? base.templateClass.structSize : base.templateClass.memberOffset) : (type == normalClass ? base.structSize : base.memberOffset)) && base.type != systemClass) ? (base.templateClass ? base.templateClass.structSize : base.structSize) : ((type == noHeadClass) ? 0 : sizeof(class Instance));
            if(_class.structAlignment && (_class.offset % _class.structAlignment))
               _class.offset += _class.structAlignment - _class.offset % _class.structAlignment;
         }
      }
      else
         _class.offset = 0; // Force set to 0

      if(type == structClass)
      {
         _class.memberOffset = (base && (base.templateClass ? base.templateClass.structSize : base.structSize) && base.type != systemClass) ? (base.templateClass ? base.templateClass.structSize : base.structSize) : 0;
         // THIS IS NEW...
         _class.typeSize = _class.structSize = _class.memberOffset + size;
      }
      else if(type == bitClass || type == enumClass || type == unitClass)
      {
         Class dataTypeClass = eSystem_FindClass(_class.module, dataTypeString);
         if(dataTypeClass)
            _class.typeSize = dataTypeClass.typeSize;
         _class.structSize = 0;
      }
      else if(type == normalClass || type == noHeadClass)
      {
         if(type == noHeadClass && _class.structSize != _class.offset + size)
            printf("ERROR: inconsistent nohead class struct size for %s\n", _class.name);
         _class.structSize = _class.offset + size;
          _class.typeSize = sizeof(void *);
      }

      /////////////////////

      if(_class.type != systemClass)
         _class.type = type;
      delete (void *)_class.dataTypeString;
      _class.dataTypeString = CopyString(dataTypeString);

      if(totalSizeClass != oldSizeClass)
      {
         _class.data = renew _class.data byte[totalSizeClass];
         /*
         memmove((byte *)_class.data + offsetClass, (byte *)_class.data + _class.offsetClass, _class.sizeClass - _class.offsetClass);
         if(base.type != systemClass && base.type != enumClass)
            memcpy((byte *)_class.data + _class.offsetClass, (byte *)base.data + _class.offsetClass, totalSizeClass - _class.sizeClass);
         else
            memset((byte *)_class.data + _class.offsetClass, 0, totalSizeClass - _class.sizeClass);
         */
         memmove((byte *)_class.data + mod.offsetClass, (byte *)_class.data, totalSizeClass - mod.sizeClass);
         if(base.type != systemClass && base.type != enumClass)
            memcpy((byte *)_class.data, (byte *)base.data, totalSizeClass - _class.sizeClass);
         else
            memset((byte *)_class.data, 0, totalSizeClass - _class.sizeClass);
      }

      _class.offsetClass = offsetClass;
      _class.sizeClass = totalSizeClass;

      {
         Method method, next;
         Class b;
         bool needUpdate = (mod != (base.templateClass ? base.templateClass : base) || _class.vTblSize != mod.vTblSize);
         int updateStart = -1, updateEnd = -1;

         if(mod.base && mod.base.base && mod.base.vTblSize > baseClass.vTblSize && needUpdate)
         {
            _class.vTblSize += mod.base.vTblSize - baseClass.vTblSize;
            _class._vTbl = renew _class._vTbl void *[_class.vTblSize];
            // memmove(_class._vTbl + mod.base.vTblSize, _class._vTbl + baseClass.vTblSize, (mod.base.vTblSize - baseClass.vTblSize) * sizeof(void *));
            memmove(_class._vTbl + mod.base.vTblSize, _class._vTbl + baseClass.vTblSize, (_class.vTblSize - mod.vTblSize) * sizeof(void *));
            memcpy(_class._vTbl + baseClass.vTblSize, mod._vTbl + baseClass.vTblSize, (mod.base.vTblSize - baseClass.vTblSize) * sizeof(void *));

            updateStart = baseClass.vTblSize;
            updateEnd = updateStart + mod.base.vTblSize - baseClass.vTblSize;

            for(method = (Method)_class.methods.first; method; method = next)
            {
               next = (Method)((BTNode)method).next;
               if(method.type == virtualMethod)
                  method.vid += mod.base.vTblSize - baseClass.vTblSize;
            }
         }

            for(b = mod.base; b && b != null; b = b.base)
            {
               Method vMethod;
               for(vMethod = (Method)b.methods.first; vMethod; vMethod = (Method)((BTNode)vMethod).next)
               {
                  if(vMethod.type == virtualMethod)
                  {
                     method = (Method)_class.methods.FindString(vMethod.name);
                     if(method)
                     {
                        if(method.function) _class._vTbl[vMethod.vid] = method.function;
                        if(!method.symbol)
                        {
                           delete (void *)method.name;
                           delete (void *)method.dataTypeString;
                           _class.methods.Delete((BTNode)method);
                        }
                        else
                        {
                           delete (void *)method.dataTypeString;
                           method.type = vMethod.type;
                           method.dataTypeString = CopyString(vMethod.dataTypeString);
                           method._class = vMethod._class;
                        }
                     }
                     else if((vMethod.vid >= updateStart && vMethod.vid < updateEnd ) || _class._vTbl[vMethod.vid] == b._vTbl[vMethod.vid])
                        _class._vTbl[vMethod.vid] = _class.base._vTbl[vMethod.vid];
                  }
               }
            }
         //}

         // Trying to simply move out the above block of code outside the if to handle this
         /*
         // Also doing this now, otherwise overridden methods of base classes from intermediate classes will not be set in higher level class
         // (e.g. OnGetString overridden in Id , Location inheriting from Id, LocationAbbreviation created later inheriting from Location would not get Id's OnGetString)
         for(b = mod.base; b && b != null; b = b.base)
         {
            Method vMethod;
            for(vMethod = (Method)b.methods.first; vMethod; vMethod = (Method)((BTNode)vMethod).next)
            {
               if(vMethod.type == virtualMethod)
               {
                  if(_class._vTbl[vMethod.vid] == b._vTbl[vMethod.vid] && _class._vTbl[vMethod.vid] != _class.base._vTbl[vMethod.vid])
                     _class._vTbl[vMethod.vid] = _class.base._vTbl[vMethod.vid];
               }
            }
         }
         */
      }

      // _class.defaultAlignment = base ? base.defaultAlignment : 0;

      if(type == normalClass || type == noHeadClass || type == structClass)
      {
         Property prop;
         DataMember member;
         Class c;
         for(c = mod.base; c; c = c.base)
         {
            Property _property;
            for(_property = c.membersAndProperties.first; _property; _property = _property.next)
            {
               if(_property.isProperty)
               {
                  BTNamedLink link = (BTNamedLink)_class.prop.FindString(_property.name);
                  if(link)
                  {
                     prop = link.data;
                     if(!prop.Set && !prop.Get && prop.memberAccess == baseSystemAccess)
                     {
                        SelfWatcher watcher;
                        for(watcher = _class.selfWatchers.first; watcher; watcher = watcher.next)
                        {
                           if(watcher._property == prop)
                              watcher._property = _property;
                        }
                        _property.selfWatchable = true;
                        _class.prop.Delete((BTNode)link);
                        delete (void *)prop.name;
                        delete (void *)prop.dataTypeString;
                        _class.membersAndProperties.Delete(prop);    // Remove only was done before?
                     }
                  }
               }
            }
         }
         // if(mod.base.memberID)
         {
            DataMember next;
            for(member = _class.membersAndProperties.first; member; member = next)
            {
               int offsetDiff = _class.offset - offsetBefore;
               next = member.next;
               if(!member.isProperty)
               {
                  if(oldType == bitClass && type != bitClass)
                  {
                     DataMember prev = member.prev;
                     // Correcting a bitClass to be a non-bit class (This should really never be required)
                     _class.membersAndProperties.Remove(member);
                     member = (DataMember)renew0 member byte[sizeof (class DataMember)];
                     _class.membersAndProperties.Insert(prev, member);
                  }

                  if(offsetDiff > 0)
                  {
                     member.offset += offsetDiff;
                     member.memberOffset += offsetDiff;
                  }
               }
               member.id += mod.base.memberID;
            }

            _class.memberID += mod.base.memberID;
            _class.startMemberID += mod.base.memberID;
         }
      }
      // Moved this before to ensure CPValues have their data ready
      FixDerivativesBase(_class, mod);
      {
         Class c;
         for(c = mod.base; c; c = c.base)
         {
            ClassProperty _property;
            for(_property = (ClassProperty)c.classProperties.first; _property; _property = (ClassProperty)((BTNode)_property).next)
            {
               SetDelayedCPValues(_class, _property);
            }
         }
      }
   }

   {
      OldLink templateLink;
      for(templateLink = base.templatized.first; templateLink; templateLink = templateLink.next)
      {
         Class template = templateLink.data;
         //const char * templateParams = strchr(template.name, '<');
         template.base = base.base;
         template._vTbl = base._vTbl;
         //ComputeClassParameters(template, templateParams, null, true);

         template.data = base.data;
         template.offset = base.offset;
         template.offsetClass = base.offsetClass;
         template.sizeClass = base.sizeClass;
         template.structSize = base.structSize;
         template.vTblSize = base.vTblSize;

         FixDerivativesBase(template, mod);
      }
   }
}

public dllexport Class eSystem_RegisterClass(ClassType type, const char * name, const char * baseName, int size, int sizeClass,
                             bool (* Constructor)(void *), void (* Destructor)(void *),
                             Module module, AccessMode declMode, AccessMode inheritanceAccess)
{
   int start = 0, c;
   NameSpace * nameSpace = null;
   bool force64Bits = (module.application.isGUIApp & 2) ? true : false;
   bool force32Bits = (module.application.isGUIApp & 4) ? true : false;
   bool inCompiler = (module.application.isGUIApp & 8) ? true : false;
   bool crossBits = force32Bits || force64Bits;
   bool fixed = false;

#if defined(__EMSCRIPTEN__)
   // emscripten_log(EM_LOG_CONSOLE, "eSystem_RegisterClass(%s)\n", name);
#endif

   if(inCompiler && crossBits)
   {
      Class c = eSystem_FindClass(__thisModule.application, name);
      if(c && c.fixed)
         fixed = true;
      else if(__thisModule.name && !strcmp(__thisModule.name, "ecereCOM"))
         fixed = true;
   }

   {
      nameSpace = (declMode == publicAccess) ? &module.publicNameSpace : &module.privateNameSpace;
      if(declMode == baseSystemAccess) nameSpace = &module.application.systemNameSpace;

      // if(declMode != staticAccess)
      {
         for(c = 0; name[c]; c++)
         {
            if(name[c] == '.' || (name[c] == ':' && name[c+1] == ':'))
            {
               NameSpace * newSpace;

               char * spaceName = _malloc(c - start + 1);
               strncpy(spaceName, name + start, c - start);
               spaceName[c-start] = '\0';

               newSpace = (NameSpace *)nameSpace->nameSpaces.FindString(spaceName);
               if(!newSpace)
               {
                  newSpace = new0 NameSpace[1];
                  newSpace->classes.CompareKey = (void *)BinaryTree::CompareString;
                  newSpace->defines.CompareKey = (void *)BinaryTree::CompareString;
                  newSpace->functions.CompareKey = (void *)BinaryTree::CompareString;
                  newSpace->nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
                  newSpace->name = spaceName;
                  newSpace->parent = nameSpace;
                  nameSpace->nameSpaces.Add((BTNode)newSpace);
               }
               else
                  delete spaceName;
               nameSpace = newSpace;
               if(name[c] == ':') c++;
               start = c+1;
            }
         }
      }
      /*else
         c = strlen(name);*/
   }

   if(c - start)
   {
      int offsetClass;
      int totalSizeClass;
      BTNamedLink classLink = null;
      Class _class = null;
      const char * dataTypeString = null;
      Class enumBase = null;
      Class base = (baseName && baseName[0]) ? System_FindClass(module, baseName, true) : null;
      Class prevBase = null;

      if(base && !base.internalDecl && (base.type == noHeadClass || base.type == structClass || base.type == normalClass))
      {
         // Normal classes inheriting off simple classes should become no head classes
         if(base.type == structClass && (type == normalClass || type == noHeadClass))
            type = noHeadClass;
         else
            type = base.type;
      }
      if(base && (type == normalClass || type == noHeadClass || type == structClass) &&
         (base.type == unitClass || base.type == bitClass || base.type == enumClass))
      {
         type = base.type;
      }
      if(!base || base.type == systemClass || base.isInstanceClass)
      {
         if(type == enumClass)
         {
            // TO IMPROVE:
            if(base || !baseName || !baseName[0] ||
               !strcmp(baseName, "unsigned int") ||
               !strcmp(baseName, "uint") ||
               !strcmp(baseName, "unsigned int64") ||
               !strcmp(baseName, "uint64") ||
               !strcmp(baseName, "int64") ||
               !strcmp(baseName, "unsigned short") ||
               !strcmp(baseName, "short") ||
               !strcmp(baseName, "unsigned char") ||
               !strcmp(baseName, "byte") ||
               !strcmp(baseName, "char") ||
               !strcmp(baseName, "uint32") ||
               !strcmp(baseName, "uint16"))
            {
               base = eSystem_FindClass(module, "enum");
               dataTypeString = (baseName && baseName[0]) ? baseName : "int"; //"unsigned int";
            }
            else
            {
               // Undefined base
               base = eSystem_RegisterClass(0, baseName, null, 0,0, null, null, module, declMode, publicAccess);
               base.internalDecl = true;

               enumBase = base;
               base = eSystem_FindClass(module, "enum");
               //dataTypeString = (baseName && baseName[0]) ? baseName : "unsigned int";
            }
         }
         else if(type == structClass && (!baseName || !baseName[0]))
         {
            base = eSystem_FindClass(module, "struct");
            dataTypeString = name + start;
         }
         else
         {
            if(type == normalClass)
               // dataTypeString = "struct Instance";
               dataTypeString = "struct __ecereNameSpace__ecere__com__Instance";
            else if(type == noHeadClass)
               dataTypeString = "void *";
            else if(type == bitClass)
               dataTypeString = (baseName && baseName[0]) ? baseName : "unsigned int";
            else if(type == unitClass)
               dataTypeString = (baseName && baseName[0]) ? baseName : "int";
            else if(type == structClass)
               dataTypeString = name + start;

            // TODO: base bit, unit or enum classes not defined yet
            if(base || (!baseName || !baseName[0]) || type == bitClass || type == unitClass)
            {
               // DANGEROUSLY TESTING THIS... PUT IT BACK
               //if(!base)
               if(base || !baseName || !baseName[0] ||
                  !strcmp(baseName, "unsigned int") ||
                  !strcmp(baseName, "uint") ||
                  !strcmp(baseName, "unsigned int64") ||
                  !strcmp(baseName, "uint64") ||
                  !strcmp(baseName, "int64") ||
                  !strcmp(baseName, "unsigned short") ||
                  !strcmp(baseName, "short") ||
                  !strcmp(baseName, "unsigned char") ||
                  !strcmp(baseName, "byte") ||
                  !strcmp(baseName, "char") ||
                  !strcmp(baseName, "uint32") ||
                  !strcmp(baseName, "uint16"))
               {
                  if(type == normalClass && strcmp(name, "ecere::com::Instance") && strcmp(name, "enum") && strcmp(name, "struct"))
                     base = eSystem_FindClass(module, "ecere::com::Instance");
                  else
                     base = eSystem_FindClass(module, "class");
               }
            }
            else
            {
               // Base class has not been defined yet!
            }
         }
      }
      else
      {
         if(type == enumClass)
         {
            if(base.type != enumClass)
            {
               enumBase = base;
               base = eSystem_FindClass(module, "enum");
            }
         }
         dataTypeString = enumBase ? enumBase.dataTypeString : base.dataTypeString;
      }

      offsetClass = base ? base.sizeClass : (type == noHeadClass ? 0 : 0 /*sizeof(class Class)*/);
      totalSizeClass = offsetClass + sizeClass;

      _class = System_FindClass(module, name, true);
      if(!_class)
      {
         const char * colons = RSearchString(name, "::", strlen(name), true, false);
         if(colons && colons)
         {
            _class = System_FindClass(module, colons + 2, true);
            if(_class)
            {
               if(_class.internalDecl)
               {
                  delete (void *)_class.fullName;
                  _class.fullName = CopyString(name);
               }
               else
                  _class = null;
            }
         }
      }
      if(_class)
      {
         if(!_class.internalDecl)
         {
            if(declMode != baseSystemAccess)
               // i18n in instance.ec is more trouble than it's worth.
               printf("error: Redefinition of class %s\n", name);
            else
            {
               _class.comRedefinition = true;
               return _class;
            }
            return null;
         }

         FreeTemplatesDerivatives(_class);

         classLink = (BTNamedLink)_class.nameSpace->classes.FindString(name + start);
         _class.nameSpace->classes.Delete((BTNode)classLink);
         {
            OldLink t;
            for(t = _class.templatized.first; t; t = t.next)
            {
               Class template = t.data;
               classLink = (BTNamedLink)_class.nameSpace->classes.FindString(template.name);

               _class.nameSpace->classes.Delete((BTNode)classLink);
            }
         }
         {
            NameSpace * ns = _class.nameSpace;
            while(ns != nameSpace &&
               ns->parent &&
               !ns->classes.first &&
               !ns->functions.first &&
               !ns->defines.first &&
               !ns->nameSpaces.first)
            {
               NameSpace * parent = ns->parent;
               NameSpace_Free(ns);
               parent->nameSpaces.Delete((BTNode)ns);
               ns = parent;
            }
         }
      }
      else
      {
         classLink = SearchNameSpace(module.application.privateNameSpace, name, &((NameSpace *)0)->classes);
         if(!classLink)
            classLink = SearchNameSpace(module.application.publicNameSpace, name, &((NameSpace *)0)->classes);

         if(!classLink)
            classLink = SearchNameSpace(module.application.privateNameSpace, name + start, &((NameSpace *)0)->classes);
         if(!classLink)
            classLink = SearchNameSpace(module.application.publicNameSpace, name + start, &((NameSpace *)0)->classes);

         if(classLink)
            _class = classLink.data;
         if(_class && _class.internalDecl)
         {
            FreeTemplatesDerivatives(_class);

            _class.nameSpace->classes.Delete((BTNode)classLink);
            {
               OldLink t;
               for(t = _class.templatized.first; t; t = t.next)
               {
                  Class template = t.data;
                  classLink = (BTNamedLink)_class.nameSpace->classes.FindString(template.name);
                  _class.nameSpace->classes.Delete((BTNode)classLink);

               }
            }

            delete (void *)_class.fullName;
            _class.fullName = CopyString(name);
         }
         else
         {
            _class = _calloc(1, sizeof(class Class));
            _class.methods.CompareKey = (void *)BinaryTree::CompareString;
            _class.members.CompareKey = (void *)BinaryTree::CompareString;
            _class.prop.CompareKey = (void *)BinaryTree::CompareString;
            _class.classProperties.CompareKey = (void *)BinaryTree::CompareString;

            _class.name = CopyString(name + start);
            _class.fullName = CopyString(name);
         }
      }
      if(nameSpace)
      {
         nameSpace->classes.Add((BTNode)BTNamedLink { name = (char *)_class.name, data = _class });
         {
            OldLink t;
            for(t = _class.templatized.first; t; t = t.next)
            {
               Class template = t.data;
               nameSpace->classes.Add((BTNode)BTNamedLink { name = (char *)template.name, data = template });
            }
         }

      }

      if(_class)
      {
         if(!base && baseName && strcmp(baseName, name))
         {
            // Undefined base
            if(strchr(baseName, '<'))
            {
               char templateClassName[1024];
               Class templateBase;
               strcpy(templateClassName, baseName);
               *strchr(templateClassName, '<') = '\0';
               templateBase = System_FindClass(module, templateClassName, true);
               if(!templateBase)
               {
                  templateBase = eSystem_RegisterClass(0, templateClassName, null, 0,0, null, null, module, declMode, publicAccess);
                  templateBase.internalDecl = true;
               }
               base = System_FindClass(module, baseName, true);
            }
            else
            {
               base = eSystem_RegisterClass(0, baseName, null, 0,0, null, null, module, declMode, publicAccess);
               base.internalDecl = true;
            }
            /*
            base.size = 0;
            base.offset = 0;
            base.memberOffset = 0;
            */
         }
         else
            _class.internalDecl = false;

         if(totalSizeClass)
         {
            _class.data = renew _class.data byte[totalSizeClass];
            // Class Data is often not inherited... e.g. Window::pureVtbl problem
            // memset(_class.data, 0, totalSizeClass);
            if(offsetClass)
            {
               if(base && base.type != systemClass && base.type != enumClass)
                  memcpy(_class.data, base.data, offsetClass);
               else
                  memset(_class.data, 0, offsetClass);
            }
            memset((byte *)_class.data + offsetClass, 0, sizeClass);
         }

         if(type == enumClass)
         {
               EnumClassData data = (EnumClassData)_class.data;
               // TOCHECK: Trying this (if specifiers specified, no class found...)
               // What about bit classes, unit classes...
               if(base && base.type != enumClass)
               {
                  data.values.count = 0;
                  data.largest = 0;
               }
         }

         delete (void *)_class.dataTypeString;
         _class.dataTypeString = CopyString(dataTypeString);
         _class.defaultAlignment = base ? base.defaultAlignment : 0;

         // Dereference the class in previous module the classed belonged to
         if(_class.module)
         {
            _class.module.classes.Remove(_class);
         }

         if(_class.base)
         {
            //Class base = _class.base.templateClass ? _class.base.templateClass : _class.base;
            Class base = _class.base;
            OldLink deriv = base.derivatives.FindLink(_class);
            base.derivatives.Delete(deriv);
         }

         // Reference the class in the module
         if(module)
         {
            module.classes.Add(_class);
         }

         _class.nameSpace = nameSpace;
         {
            OldLink t;
            for(t = _class.templatized.first; t; t = t.next)
            {
               Class template = t.data;
               template.nameSpace = nameSpace;
            }
         }

         _class.module = module;
         prevBase = _class.base;
         _class.base = base;
         if(base)
         {
            int numParams = 0;
            Class sClass;
            for(sClass = base; sClass; sClass = sClass.base)
            {
               if(sClass.templateClass) sClass = sClass.templateClass;
               numParams += sClass.templateParams.count;
            }
            if(numParams)
            {
               if(_class.templateArgs)
               {
                  FreeTemplateArgs(_class);
               }
               delete _class.templateArgs;
               _class.templateArgs = new0 ClassTemplateArgument[numParams];
               _class.numParams = numParams;

               for(sClass = _class; sClass; sClass = sClass.base)
               {
                  Class prevClass;
                  ClassTemplateParameter param;
                  int id = 0;
                  if(sClass.templateClass) sClass = sClass.templateClass;
                  for(prevClass = sClass.base; prevClass; prevClass = prevClass.base)
                  {
                     if(prevClass.templateClass) prevClass = prevClass.templateClass;
                     id += prevClass.templateParams.count;
                  }

                  if(base.templateArgs)   // Add numParams test here?
                  {
                     for(param = sClass.templateParams.first; param; param = param.next)
                     {
                        _class.templateArgs[id] = base.templateArgs[id];
                        CopyTemplateArg(param, _class.templateArgs[id]);
                        id++;
                     }
                  }
               }
            }
         }
         _class.memberID = _class.startMemberID = (base && (type == normalClass || type == noHeadClass || type == structClass)) ? base.memberID : 0;
         if(type == normalClass || type == noHeadClass)
            _class.offset = (base && base.structSize && base.type != systemClass) ?
               // Use 'memberOffset' for nohead class as the members get added without padding
               (base.type == normalClass ? base.structSize : base.memberOffset) : ((type == noHeadClass) ? 0 : ((force64Bits && inCompiler && fixed) ? 24 : (force32Bits && inCompiler && fixed) ? 12 : sizeof(class Instance)));
         else
            _class.offset = 0;   // Force set to 0 for redefinitions

         // For cross-bitness-compiling
         if(crossBits)
         {
            // The GNOSIS runtime will use 'offset' to point to the object during compile executation
            // Need to rethink through our cross-bitness compiling to have a distinct 'offset' (e.g. runtimeOffset)
            // used by the runtime library vs. 'offset' used by the compiler to hardcode compilation results (or avoid those altogether)
            if(!strcmp(name, "GNOSISSystem") ||
               !strcmp(name, "LineStyle") ||
               !strcmp(name, "FillStyle") ||
               !strcmp(name, "FontObject") ||
               !strcmp(name, "FontObject") ||
               !strcmp(name, "ecere::sys::Thread"))
            {
               _class.offset = force32Bits ? 24 : 12;
            }
            // Ideally, the running library should be aware of the struct size of both 32 and 64 bit, since the compiler has no knowledge whatsoever of private members
            else if(strstr(name, "ecere::sys::EARHeader") ||
               strstr(name, "AnchorValue") ||
               !strcmp(name, "ecere::com::CustomAVLTree") ||
               !strcmp(name, "ecere::com::Array") ||
               !strcmp(name, "ecere::gui::Window") ||
               !strcmp(name, "ecere::sys::Mutex"));   // Never recompute these, they're always problematic (errors, crashes)
            else
            {
               if(!strcmp(name, "ecere::sys::FileListing"))
               {
                  size = 3*(force32Bits ? 4 : 8);
                  _class.structAlignment = force32Bits ? 4 : 8;   // FileListing is problematic because it is a struct with private data that the user allocates
                  _class.pointerAlignment = 1;
               }
               // These we want to recompute inside the IDE to help the debugger
               else if(!strcmp(name, "ecere::com::Class"))           size = 0; // 616
               else if(!strcmp(name, "ecere::com::ClassProperty"))   size = 0; // 80
               else if(!strcmp(name, "ecere::com::NameSpace"))       size = 0; // 176
               else if(!strcmp(name, "ecere::sys::BufferedFile"))    size = 0;
               else if(!strcmp(name, "ecere::sys::BTNode"))          size = 0;
               else if(!strcmp(name, "ecere::sys::StringBTNode"))    size = 0;
               else if(!strcmp(name, "ecere::sys::OldList"))         size = 0; // 32
               else if(!strcmp(name, "ecere::sys::Item"))            size = 0;
               else if(!strcmp(name, "ecere::sys::NamedLink"))       size = 0;
               else if(!strcmp(name, "ecere::sys::NamedLink64"))     size = 0;
               else if(!strcmp(name, "ecere::sys::OldLink"))         size = 0;
               else if(!strcmp(name, "ecere::sys::NamedItem"))       size = 0;
               else if(!strcmp(name, "ecere::sys::NamedItem64"))     size = 0;
               else if(!strcmp(name, "ecere::sys::BinaryTree"))      size = 0;
               else if(module != module.application && inCompiler)
               {
                  // These we only want to recompute inside the compiler
                  if(fixed || type == structClass)
                     size = 0;
               }
            }
         }
         if(type == structClass)
         {
            _class.memberOffset = (base && base.structSize && base.type != systemClass) ? base.structSize : 0;
            // THIS IS NEW...
            _class.typeSize = _class.structSize = _class.memberOffset + size;
         }
         else if(type == bitClass || type == enumClass || type == unitClass)
         {
            Class dataTypeClass = dataTypeString ? System_FindClass(_class.module, dataTypeString, true) : null;
            if(dataTypeClass)
               _class.typeSize = dataTypeClass.typeSize;
            _class.structSize = 0;
         }
         else if(type == normalClass || type == noHeadClass)
         {
            // REVIEW: This was wrongly set for NoHead classes -- the sizeof() of the struct passed includes all bases
            _class.structSize = type == normalClass ? _class.offset + size : size;
            _class.typeSize = sizeof(void *);
         }
         _class.offsetClass = offsetClass;
         _class.sizeClass = totalSizeClass;
         _class.Constructor = Constructor;
         _class.Destructor = Destructor;
         if(_class.type != systemClass)
            _class.type = type;
         if(!size)
            _class.computeSize = true;
         else
            _class.computeSize = false;
         _class.inheritanceAccess = inheritanceAccess;

         /*if(type == bitClass)
            _class.size = 0;*/
         if(type == enumClass)
         {
            if(enumBase)
               _class.base = base = enumBase;
            //else
            {
               EnumClassData data = (EnumClassData)_class.data;
               // TOCHECK: Trying this (if specifiers specified, no class found...)
               // What about bit classes, unit classes...
#if defined(__EMSCRIPTEN__)
   // emscripten_log(EM_LOG_CONSOLE, "setting data.largest: _class: %p -- _class.data: %p\n", _class, data);
#endif
               if(base && base.type != enumClass)
                  data.largest = -1;//_class.base = null;
               else
                  data.largest = ((EnumClassData)(base.data)).largest;
            }
         }
         if(base)
         {
            int i;
            uint oldSize = _class.vTblSize;
            if(base.vTblSize && _class.vTblSize < base.vTblSize)
            {
               _class.vTblSize = base.vTblSize;
               // OK to scrap existing virtual table?
               //delete _class._vTbl;
               //_class._vTbl = _malloc(sizeof(int(*)()) * _class.vTblSize);
               // memcpy(_class._vTbl, base._vTbl, sizeof(int(*)()) * _class.vTblSize);
               _class._vTbl = _realloc(_class._vTbl, sizeof(int(*)()) * _class.vTblSize);
            }
            if(!prevBase)
            {
               if(_class.type == normalClass && strcmp(_class.name, "ecere::com::Instance") && strcmp(_class.name, "enum") && strcmp(_class.name, "struct"))
                  prevBase = eSystem_FindClass(module, "ecere::com::Instance");
               else
                  prevBase = eSystem_FindClass(module, "class");
            }
            for(i = 0; i < base.vTblSize; i++)
            {
               if(i >= oldSize || _class._vTbl[i] == prevBase._vTbl[i])
                  _class._vTbl[i] = base._vTbl[i];
            }
         }

         if(_class.base)
         {
            OldLink link { data = _class };
            /*(_class.base.templateClass ? _class.base.templateClass : _class.base)*/_class.base.derivatives.Add(link);
         }

         FixDerivativesBase(_class, _class);

         return _class;
      }
   }
   return null;
}

static void DataMember_Free(DataMember parentMember)
{
   DataMember member;
   BTNamedLink namedLink;
   delete (void *)parentMember.name;
   delete (void *)parentMember.dataTypeString;

   while((member = parentMember.members.first))
   {
      DataMember_Free(member);
      parentMember.members.Delete(member);
   }

   while((namedLink = (BTNamedLink)parentMember.membersAlpha.first))
   {
      parentMember.membersAlpha.Delete((BTNode)namedLink);
   }
}

static void FreeEnumValue(NamedLink64 value)
{
   delete value.name;
}

static void FreeTemplateArg(Class template, ClassTemplateParameter param, int id)
{
   switch(param.type)
   {
      case type:
         delete (void *)template.templateArgs[id].dataTypeString;
         template.templateArgs[id].dataTypeClass = null;
         break;
      case identifier:
         delete (void *)template.templateArgs[id].memberString;
         break;
      case expression:

         break;
   }
}

static void FreeTemplateArgs(Class template)
{
   if(template.templateArgs)
   {
      Class _class;
      for(_class = template; _class; _class = _class.base)
      {
         Class prevClass;
         ClassTemplateParameter param;
         int id = 0;
         if(_class.templateClass) _class = _class.templateClass;
         for(prevClass = _class.base; prevClass; prevClass = prevClass.base)
         {
            if(prevClass.templateClass) prevClass = prevClass.templateClass;
            id += prevClass.templateParams.count;
         }
         if(id < template.numParams)
         {
            for(param = _class.templateParams.first; param; param = param.next)
            {
               switch(param.type)
               {
                  case type:
                     delete (void *)template.templateArgs[id].dataTypeString;
                     template.templateArgs[id].dataTypeClass = null;
                     break;
                  case identifier:
                     delete (void *)template.templateArgs[id].memberString;
                     break;
                  case expression:
                     // delete template.templateArgs[id].dataTypeString;
                     break;
               }
               id++;
            }
         }
      }
   }
}

static void FreeTemplate(Class template)
{
   OldLink deriv;

   if(template.nameSpace)
   {
      BTNamedLink link = (BTNamedLink)template.nameSpace->classes.FindString(template.name);
      if(link)
         template.nameSpace->classes.Delete((BTNode)link);
   }

   FreeTemplatesDerivatives(template);
   FreeTemplateArgs(template);

   while((deriv = template.derivatives.first))
   {
      ((Class)deriv.data).base = null;
      template.derivatives.Delete(deriv);
   }

   delete (void *)template.fullName;
   delete (void *)template.name;
   delete template.templateArgs;
   delete (void *)template.dataTypeString;

   if(template.module)
      template.module.classes.Delete(template);
   else
      _free(template);
}

static void FreeTemplates(Class _class)
{
   OldLink deriv, template;

   for(deriv = _class.derivatives.first; deriv; deriv = deriv.next)
   {
      FreeTemplates(deriv.data);
   }

   FreeTemplateArgs(_class);
   delete _class.templateArgs;
   delete (void *)_class.dataTypeString;

   while((template = _class.templatized.first))
   {
      FreeTemplates(template.data);
      FreeTemplate(template.data);
      _class.templatized.Delete(template);
   }
}

public dllexport void eClass_Unregister(Class _class)
{
   BTNamedLink namedLink;
   DataMember member;
   Method method;
   OldLink deriv, template;
   ClassProperty classProp;
   ClassTemplateParameter param;

   if(_class.templateClass)
   {
      // Unregistering templates... Used in IDE to address crash on Ecere classes templatized with imported modules
      OldLink templateLink;
      for(templateLink = _class.templateClass.templatized.first; templateLink; templateLink = templateLink.next)
      {
         if(templateLink.data == _class)
         {
            _class.templateClass.templatized.Delete(templateLink);
            break;
         }
      }
      FreeTemplate(_class);
      return;
   }

   delete _class._vTbl;

   FreeTemplates(_class);

   while((template = _class.templatized.first))
   {
      FreeTemplate(template.data);
      _class.templatized.Delete(template);
   }

   while((member = _class.membersAndProperties.first))
   {
      if(!member.isProperty && (member.type == unionMember || member.type == structMember))
         DataMember_Free(member);
      delete (void *)member.name;
      delete (void *)member.dataTypeString;
      _class.membersAndProperties.Delete(member);
   }

   while((member = _class.conversions.first))
   {
      delete (void *)member.name;
      delete (void *)member.dataTypeString;
      _class.conversions.Delete(member);
   }

   while((namedLink = (BTNamedLink)_class.prop.first))
   {
      _class.prop.Delete((BTNode)namedLink);
   }

   while((namedLink = (BTNamedLink)_class.members.first))
   {
      _class.members.Delete((BTNode)namedLink);
   }

   while((classProp = (ClassProperty)_class.classProperties.first))
   {
      delete (void *)classProp.name;
      delete (void *)classProp.dataTypeString;
      _class.classProperties.Delete((BTNode)classProp);
   }

   while((method = (Method)_class.methods.first))
   {
      delete (void *)method.name;
      delete (void *)method.dataTypeString;
      _class.methods.Delete((BTNode)method);
   }

   if(_class.type == enumClass)
   {
      EnumClassData data = (EnumClassData)_class.data;

      data.values.Free((void *)FreeEnumValue);
   }
   _class.delayedCPValues.Free(null);

   _class.selfWatchers.Free(null);

   if(_class.base)
   {
      // Class base = _class.base.templateClass ? _class.base.templateClass : _class.base;
      Class base = _class.base;
      for(deriv = base.derivatives.first; deriv; deriv = deriv.next)
      {
         if(deriv.data == _class)
            break;
      }
      if(deriv)
         base.derivatives.Delete(deriv);
   }
   while((deriv = _class.derivatives.first))
   {
      ((Class)deriv.data).base = null;
      _class.derivatives.Delete(deriv);
   }

   if(_class.nameSpace)
   {
      BTNamedLink link = (BTNamedLink)_class.nameSpace->classes.FindString(_class.name);
      _class.nameSpace->classes.Delete((BTNode)link);
   }

   delete (void *)_class.name;
   delete (void *)_class.fullName;

   delete (void *)_class.dataTypeString;

   delete _class.data;

   while((param = _class.templateParams.first))
   {
      switch(param.type)
      {
         case type:
            delete (void *)param.defaultArg.dataTypeString;
            break;
         case identifier:
            delete (void *)param.defaultArg.memberString;
            break;
         case expression:

            break;
      }
      if(param.type != identifier) delete (void *)param.dataTypeString;
      delete (void *)param.name;

      _class.templateParams.Delete(param);
   }

   //_class.nameSpace->classes.Delete(_class);
   _free(_class);
}

static BTNamedLink ScanNameSpace(NameSpace nameSpace, const char * name, void * listOffset)
{
   BinaryTree * tree = (BinaryTree *)((byte *)nameSpace + (uintptr)listOffset);
   BTNamedLink link = (BTNamedLink)tree->Find((uintptr)name);
   NameSpace * child;
   if(!link)
   {
      for(child = (NameSpace *)nameSpace.nameSpaces.first; child; child = (NameSpace *)((BTNode)child).next)
      {
         link = ScanNameSpace(child, name, listOffset);
         if(link)
            break;
      }
   }
   return link;
}

static BTNamedLink SearchNameSpace(NameSpace nameSpace, const char * name, void * listOffset)
{
   int start = 0, c;
   char ch;
   int level = 0;
   for(c = 0; (ch = name[c]); c++)
   {
      if(ch == '<') level++;
      if(ch == '>') level--;
      if(level == 0 && (ch == '.' || (ch == ':' && name[c+1] == ':')))
      {
         NameSpace * newSpace;
         char * spaceName = _malloc(c - start + 1);
         memcpy(spaceName, name + start, c - start);
         spaceName[c-start] = '\0';
         newSpace = (NameSpace *)nameSpace.nameSpaces.FindString(spaceName);
         _free(spaceName);
         if(!newSpace)
            return null;
         nameSpace = newSpace;
         if(level == 0 && ch == ':') c++;
         start = c+1;
      }
   }
   if(c - start)
   {
      return ScanNameSpace(nameSpace, name + start, listOffset);
   }
   return null;
}

static BTNamedLink SearchModule(Module module, const char * name, void * listOffset, bool searchPrivate)
{
   SubModule subModule;
   BTNamedLink link;

   if(searchPrivate)
   {
      link = SearchNameSpace(&module.privateNameSpace, name, listOffset);
      if(link) return link;
   }
   link = SearchNameSpace(&module.publicNameSpace, name, listOffset);
   if(link) return link;

   for(subModule = module.modules.first; subModule; subModule = subModule.next)
   {
      if(searchPrivate || subModule.importMode == publicAccess)
      {
         // TOCHECK: Reverting to false to test what we were trying to fix by passing searchPrivate
         // Passing searchPrivate finds ALL classes private or not and thus classes clash
         // SearchModule here is called mainly from eSystem_FindClass, and also for Functions and Defines

         link = SearchModule(subModule.module, name, listOffset, false);
         //link = SearchModule(subModule.module, name, listOffset, searchPrivate /*false*/);
         if(link) return link;
      }
   }
   return null;
}

public int64 _strtoi64(const char * string, const char ** endString, int base)
{
   int64 value = 0;
   int sign = 1;
   int c;
   char ch;
   for(c = 0; (ch = string[c]) && isspace(ch); c++);
   if(ch =='+') c++;
   else if(ch == '-') { sign = -1; c++; };
   if(!base)
   {
      if(ch == '0' && string[c+1] == 'x')
      {
         base = 16;
         c+=2;
      }
      else if(ch == '0')
      {
         base = 8;
         c++;
      }
      else
         base = 10;
   }
   for( ;(ch = string[c]); c++)
   {
      if(ch >= '0' && ch <= '9')
         ch -= '0';
      else if(ch >= 'a' && ch <= 'z')
         ch -= ('a' - 10);
      else if(ch >= 'A' && ch <= 'Z')
         ch -= ('A'- 10);
      else
         // Invalid character
         break;
      if(ch < base)
      {
         value *= base;
         value += ch;
      }
      else
         // Invalid character
         break;
   }
   if(endString)
      *endString = string + c;

   return sign*value;
}

public uint64 _strtoui64(const char * string, const char ** endString, int base)
{
   uint64 value = 0;
   int sign = 1;
   int c;
   char ch;
   for(c = 0; (ch = string[c]) && isspace(ch); c++);
   if(ch =='+') c++;
   else if(ch == '-') { sign = -1; c++; };
   if(!base)
   {
      if(ch == '0' && string[c+1] == 'x')
      {
         base = 16;
         c+=2;
      }
      else if(ch == '0')
      {
         base = 8;
         c++;
      }
      else
         base = 10;
   }
   for( ;(ch = string[c]); c++)
   {
      if(ch >= '0' && ch <= '9')
         ch -= '0';
      else if(ch >= 'a' && ch <= 'z')
         ch -= ('a' - 10);
      else if(ch >= 'A' && ch <= 'Z')
         ch -= ('A' - 10);
      else
         // Invalid character
         break;
      if(ch < base)
      {
         value *= base;
         value += ch;
      }
      else
         // Invalid character
         break;
   }
   if(endString)
      *endString = string + c;
   return sign*value;
}

public dllexport Class eSystem_FindClass(Module module, const char * name)
{
   return System_FindClass(module, name, false);
}

Class System_FindClass(Module module, const char * name, bool registerTemplatesInternalDecl)
{
   if(name && module)
   {
      BTNamedLink link;
      if(!strncmp(name, "const ", 6)) name += 6;
      link = SearchNameSpace(&module.application.systemNameSpace, name, &((NameSpace *)0)->classes);
      if(link) return link.data;

      link = SearchModule(module, name, &((NameSpace *)0)->classes, true);
      if(link) return link.data;

      {
         char noTemplateName[1024];
         char * templateParams = strchr(name, '<');

         if(templateParams)
         {
            strncpy(noTemplateName, name, templateParams - name);
            noTemplateName[templateParams - name] = '\0';
         }
         else
            strcpy(noTemplateName, name);

         link = SearchNameSpace(&module.application.systemNameSpace, noTemplateName, &((NameSpace *)0)->classes);
         if(!link)
            link = SearchModule(module, noTemplateName, &((NameSpace *)0)->classes, true);
         if(link)
         {
            Class _class = link.data;
            Class templatedClass = null;
            char className[1024];
            strcpy(className, _class.fullName);
            strcat(className, templateParams);

            link = SearchNameSpace(&module.application.systemNameSpace, className, &((NameSpace *)0)->classes);
            if(link)
               return link.data;

            link = SearchModule(module, className, &((NameSpace *)0)->classes, true);
            if(link)
               return link.data;

            if(_class && templateParams)
            {
               Class b;
               bool isAVLNode = false, isMapNode = false;

               for(b = _class; b; b = b.base)
               {
                  while(b.templateClass) b = b.templateClass;
                  if(!strcmp(b.fullName, "ecere::com::MapNode")) isMapNode = true;
                  else if(!strcmp(b.fullName, "ecere::com::AVLNode")) isAVLNode = true;
               }

               // if(!numParams) return null;

               templatedClass = Class { };
               *templatedClass = *_class;
               templatedClass.templateClass = _class;
               //templatedClass.fullName = CopyString(name);
               templatedClass.fullName = CopyString(className);
               templatedClass.dataTypeString = CopyString(_class.dataTypeString);
               templatedClass.name = CopyString(templatedClass.fullName + strlen(_class.fullName) - strlen(_class.name));
               templatedClass.nameSpace->classes.Add((BTNode)BTNamedLink { name = (char *)templatedClass.name, data = templatedClass });
               templatedClass.templateArgs = null;
               templatedClass.numParams = 0;
               templatedClass.derivatives = { };
               templatedClass.templatized = { };
               templatedClass.module = module;
               templatedClass.count = 0; // TOCHECK: Keeping track of individual templatized classes?
               templatedClass.prev = null;
               templatedClass.next = null;

               module.classes.Add(templatedClass);

               ComputeClassParameters(templatedClass, templateParams, module, registerTemplatesInternalDecl);

               if(isAVLNode && templatedClass.templateArgs)
               {
                  // Current work-around for correcting variable size of AVLNodes
                  Class keyClass = templatedClass.templateArgs[0].dataTypeClass;
                  int keySize = (keyClass && keyClass.type == structClass) ? keyClass.typeSize : sizeof(uint64);

                  if(keySize != sizeof(uint64))
                     templatedClass.structSize += keySize - sizeof(uint64);

                  if(isMapNode)
                  {
                     // NOTE: the value member will still have incorrect offset in members shared with base class
                     Class valClass = templatedClass.templateArgs[2].dataTypeClass;
                     int valSize = (valClass && valClass.type == structClass) ? valClass.typeSize : sizeof(uint64);

                     if(valSize != sizeof(uint64))
                        templatedClass.structSize += valSize - sizeof(uint64);
                  }
               }
               _class.templatized.Add(OldLink { data = templatedClass });
            }
            return templatedClass;
         }
      }
   }
   return null;
}

static void CopyTemplateArg(ClassTemplateParameter param, ClassTemplateArgument arg)
{
   switch(param.type)
   {
      case type:
            arg.dataTypeString = CopyString(arg.dataTypeString);
         break;
      case expression:

         break;
      case identifier:
         arg.memberString = CopyString(arg.memberString);
         break;
   }
}

static void ComputeClassParameters(Class templatedClass, const char * templateParams, Module findModule, bool registerInternalDecl)
{
   char ch;
   const char * nextParamStart = templateParams ? (templateParams + 1) : null;
   ClassTemplateParameter curParam = null;
   Class lastClass = null, sClass;
   int curParamID = 0;
   int numParams = 0;
   Class _class = templatedClass.templateClass ? templatedClass.templateClass : templatedClass;

   for(sClass = _class; sClass; sClass = sClass.base)
   {
      if(sClass.templateClass) sClass = sClass.templateClass;
      numParams += sClass.templateParams.count;
   }

   if(templatedClass.templateArgs)
      FreeTemplateArgs(templatedClass);
   delete templatedClass.templateArgs;
   templatedClass.templateArgs = new0 ClassTemplateArgument[numParams];
   templatedClass.numParams = numParams;

   if(_class != templatedClass)
   {
      /*int c;
      Class sClass;
      memcpy(templatedClass.templateArgs, _class.templateArgs, numParams * sizeof(ClassTemplateArgument));
      for(sClass = _class; sClass; sClass = sClass.base)
      {
         ClassTemplateParameter param;
         Class prevClass;
         int id = 0;
         if(sClass.templateClass) sClass = sClass.templateClass;
         for(prevClass = sClass.base; prevClass; prevClass = prevClass.base)
         {
            if(prevClass.templateClass) prevClass = prevClass.templateClass;
            id += prevClass.templateParams.count;
         }
         for(param = sClass.templateParams.first; param; param = param.next)
           CopyTemplateArg(param, templatedClass.templateArgs[id++]);
      }*/
   }

   if(templatedClass.base && templatedClass.base.templateArgs && _class == templatedClass)
   {
      Class sClass;
      memcpy(templatedClass.templateArgs, templatedClass.base.templateArgs,
         sizeof(ClassTemplateArgument) * (numParams - templatedClass.templateParams.count));
      for(sClass = templatedClass.base; sClass; sClass = sClass.base)
      {
         ClassTemplateParameter param;
         Class prevClass;
         int id = 0;
         for(prevClass = sClass.base; prevClass; prevClass = prevClass.base)
         {
            if(prevClass.templateClass) prevClass = prevClass.templateClass;
            id += prevClass.templateParams.count;
         }

         if(sClass.templateClass) sClass = sClass.templateClass;
         for(param = sClass.templateParams.first; param; param = param.next)
            CopyTemplateArg(param, templatedClass.templateArgs[id++]);
      }
   }

   while(nextParamStart)
   {
      const char * paramStart = nextParamStart;
      const char * paramEnd;
      int level = 0;
      while(*paramStart == ' ') paramStart++;
      paramEnd = paramStart;
      while((ch = *paramEnd, ch && (level > 0 || (ch != '>' && ch != ','))))
      {
         if(ch == '<') level++;
         if(ch == '>') level--;

         paramEnd++;
      }
      nextParamStart = (ch == ',') ? (paramEnd + 1) : null;
      while(*paramEnd == ' ') paramEnd--;
      if(paramEnd > paramStart)
      {
         const char * ptr, * equal = null;
         int subParamLevel = 0;
         for(ptr = paramStart; ptr <= paramEnd; ptr++)
         {
            char ch = *ptr;
            if(ch == '<') subParamLevel++;
            else if(ch == '>') subParamLevel--;

            if(subParamLevel == 0 && ch == '=')
            {
               equal = ptr;
               break;
            }
         }
         if(equal)
         {
            const char * end = equal - 1;
            char ident[1024];

            while(*end == ' ') end--;
            strncpy(ident, paramStart, end + 1 - paramStart);
            ident[end + 1 - paramStart] = 0;

            for(sClass = _class; sClass; sClass = sClass.base)
            {
               if(sClass.templateClass) sClass = sClass.templateClass;
               for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
               {
                  if(!strcmp(curParam.name, ident))
                     break;
               }
               if(curParam)
               {
                  Class nextClass;
                  ClassTemplateParameter prevParam;
                  curParamID = 0;
                  for(prevParam = curParam.prev; prevParam; prevParam = prevParam.prev) curParamID++;
                  for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                  {
                     if(nextClass.templateClass) nextClass = nextClass.templateClass;
                     curParamID += nextClass.templateParams.count;
                  }
                  break;
               }
            }
            lastClass = sClass;
         }
         else
         {
            if(curParam)
            {
               curParam = curParam.next;
               curParamID++;
            }

            if(!curParam)
            {
               for(sClass = lastClass ? lastClass.base : _class; sClass; sClass = sClass.base)
               {
                  ClassTemplateParameter param;
                  curParamID = 0;
                  if(sClass.templateClass) sClass = sClass.templateClass;
                  for(param = sClass.templateParams.first; param; param = param.next, curParamID++)
                  {
                     curParam = param;
                     break;
                  }
                  if(curParam)
                  {
                     Class nextClass;
                     for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                     {
                        if(nextClass.templateClass) nextClass = nextClass.templateClass;
                        curParamID += nextClass.templateParams.count;
                     }
                     lastClass = sClass;
                     break;
                  }
               }
               /*
               for(sClass = _class; sClass; sClass = sClass.base)
               {
                  if(sClass.templateParams.first)
                  {
                     Class nextClass;
                     for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                        if(nextClass.templateParams.first)
                           break;
                     if(nextClass != lastClass) continue;

                     curParam = sClass.templateParams.first;
                     lastClass = sClass;

                     for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                        if(nextClass.templateParams.first)
                        {
                           curParamID += nextClass.templateParams.count;
                           break;
                        }
                     break;
                  }
               }
               */
            }
         }

         if(curParam)
         {
            ClassTemplateArgument argument { };
            char value[1024];
            if(equal)
            {
               equal++;
               while(*equal == ' ') equal++;
               memcpy(value, equal, paramEnd - equal);
               value[paramEnd - equal] = 0;
            }
            else
            {
               memcpy(value, paramStart, paramEnd - paramStart);
               value[paramEnd - paramStart] = 0;
            }
            TrimRSpaces(value, value);

            switch(curParam.type)
            {
               case type:
                  argument.dataTypeString = CopyString(value);
                  argument.dataTypeClass = System_FindClass(findModule, value, registerInternalDecl);
                  if(!argument.dataTypeClass)
                     argument.dataTypeClass = System_FindClass(_class.module, value, registerInternalDecl);
                  if(!argument.dataTypeClass)
                     argument.dataTypeClass = System_FindClass(_class.module.application, value, registerInternalDecl);
                  if(registerInternalDecl && !argument.dataTypeClass)
                  {
                     ClassTemplateParameter param;
                     for(param = templatedClass.templateParams.first; param; param = param.next)
                        if(!strcmp(param.name, value))
                           break;
                     if(!param)
                     {
                        argument.dataTypeClass = eSystem_RegisterClass(0, value, null, 0,0, null, null, _class.module, publicAccess, publicAccess);
                        argument.dataTypeClass.internalDecl = true;
                     }
                  }
                  break;
               case expression:
               {
                  Class expClass = System_FindClass(_class.module, curParam.dataTypeString, true);
                  if(!expClass) expClass = System_FindClass(_class.module.application, curParam.dataTypeString, true);
                  if(expClass)
                  {
                     //if(expClass.type ==
                     ((bool (*)(void *, void *, const char *))(void *)expClass._vTbl[__ecereVMethodID_class_OnGetDataFromString])(expClass, &argument.expression, value);
                  }
                  // Expression should be pre simplified here
                  else if(value[0] == '\"')
                  {
                     char * endQuote = value + strlen(value) - 1;
                     if(*endQuote != '\"') endQuote++;
                     *endQuote = '\0';
                     argument.expression.p = CopyString(value + 1);
                  }
                  else if(value[0] == '\'')
                  {
                     int nb;
                     unichar ch = UTF8GetChar(value + 1, &nb);
                     argument.expression.ui = ch;
                  }
                  else if(!strcmp(curParam.dataTypeString, "uint"))
                  {
                     argument.expression.ui = (uint)strtoul(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "char"))
                  {
                     argument.expression.c = (char)strtol(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "byte"))
                  {
                     argument.expression.uc = (unsigned char)strtoul(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "short"))
                  {
                     argument.expression.s = (short)strtol(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "uint16"))
                  {
                     argument.expression.us = (unsigned short)strtoul(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "int64"))
                  {
                     argument.expression.i64 = _strtoi64(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "uint64"))
                  {
                     argument.expression.ui64 = _strtoui64(value, null, 0);
                  }
                  else if(!strcmp(curParam.dataTypeString, "float"))
                  {
                     argument.expression.f = (float)strtod(value, null);
                  }
                  else if(!strcmp(curParam.dataTypeString, "double"))
                  {
                     argument.expression.d = strtod(value, null);
                  }
                  else // if(!strcmp(curParam.dataTypeString, "int"))
                  {
                     argument.expression.i = (int)strtol(value, null, 0);
                  }
                  break;
               }
               case identifier:
                  argument.memberString = CopyString(value);
                  break;
            }
            FreeTemplateArg(templatedClass, curParam, curParamID);
            templatedClass.templateArgs[curParamID] = argument;
         }
      }
   }

   // TESTING THIS BEFORE...
   if(templatedClass == _class)
   {
      Class sClass = _class;
      int curParamID = 0;
      Class nextClass;
      ClassTemplateParameter param;
      for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
      {
         if(nextClass.templateClass) nextClass = nextClass.templateClass;
         curParamID += nextClass.templateParams.count;
      }

      for(param = sClass.templateParams.first; param; param = param.next)
      {
         if(!templatedClass.templateArgs[curParamID].dataTypeString)
         {
            templatedClass.templateArgs[curParamID] = param.defaultArg;
            CopyTemplateArg(param, templatedClass.templateArgs[curParamID]);
            if(param.type == type && param.defaultArg.dataTypeString)
            {
               templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(findModule, param.defaultArg.dataTypeString, true);
               if(!templatedClass.templateArgs[curParamID].dataTypeClass)
                  templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(templatedClass.module, param.defaultArg.dataTypeString, true);
               if(!templatedClass.templateArgs[curParamID].dataTypeClass)
                  templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(templatedClass.module.application, param.defaultArg.dataTypeString, true);
            }
         }
         curParamID++;
      }
   }

   if(templatedClass.base && templatedClass.base.templateArgs && numParams - _class.templateParams.count)
   {
      int c = numParams - _class.templateParams.count-1;

      for(sClass = _class.base; sClass; sClass = sClass.base)
      {
         ClassTemplateParameter param;
         if(sClass.templateClass) sClass = sClass.templateClass;
         for(param = sClass.templateParams.last; param; param = param.prev)
         {
            ClassTemplateArgument * arg = &templatedClass.templateArgs[c];
            ClassTemplateArgument * baseArg = &templatedClass.base.templateArgs[c];
            if(!arg->dataTypeString)
            {
               *arg = templatedClass.base.templateArgs[c];
               CopyTemplateArg(param, arg);
               if(param.type == type)
               {
                  if(arg->dataTypeClass && strchr(arg->dataTypeString, '<') && arg->dataTypeClass.templateArgs)
                  {
                     Class expClass = arg->dataTypeClass;
                     Class cClass = null;
                     int paramCount = 0;
                     int lastParam = -1;

                     char templateString[1024];
                     sprintf(templateString, "%s<", expClass.templateClass.fullName);
                     for(cClass = expClass; cClass; cClass = cClass.base)
                     {
                        int p = 0;
                        ClassTemplateParameter param;
                        for(param = cClass.templateParams.first; param; param = param.next)
                        {
                           int id = p;
                           Class sClass;
                           // NOTE: This struct 'arg' here is only to build up templateString
                           ClassTemplateArgument arg;
                           for(sClass = expClass.base; sClass; sClass = sClass.base) id += sClass.templateParams.count;
                           arg = expClass.templateArgs[id];

                           {
                              ClassTemplateParameter cParam;
                              int p = numParams - _class.templateParams.count;
                              for(cParam = _class.templateParams.first; cParam; cParam = cParam.next, p++)
                              {
                                 if(cParam.type == type && arg.dataTypeString && !strcmp(cParam.name, arg.dataTypeString))
                                 {
                                    arg = templatedClass.templateArgs[p];
                                    break;
                                 }
                              }
                           }

                           {
                              char argument[256];
                              argument[0] = '\0';
                              switch(param.type)
                              {
                                 case expression:
                                 {
                                    // THIS WHOLE THING IS A WILD GUESS... FIX IT UP
                                    /*
                                    char expString[1024];
                                    OldList * specs = MkList();
                                    Declarator decl = SpecDeclFromString(param.dataTypeString, specs, null);
                                    Expression exp;
                                    char * string = PrintHexUInt64(arg.expression.ui64);
                                    exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));

                                    ProcessExpressionType(exp);
                                    ComputeExpression(exp);
                                    expString[0] = '\0';
                                    PrintExpression(exp, expString);
                                    strcat(argument, expString);
                                    //delete exp;
                                    FreeExpression(exp);
                                    */
                                    break;
                                 }
                                 case identifier:
                                 {
                                    strcat(argument, arg.member.name);
                                    break;
                                 }
                                 case TemplateParameterType::type:
                                 {
                                    if(arg.dataTypeString)
                                       strcat(argument, arg.dataTypeString);
                                    break;
                                 }
                              }
                              if(argument[0])
                              {
                                 if(paramCount) strcat(templateString, ", ");
                                 if(lastParam != p - 1)
                                 {
                                    strcat(templateString, param.name);
                                    strcat(templateString, " = ");
                                 }
                                 strcat(templateString, argument);
                                 paramCount++;
                                 lastParam = p;
                              }
                           }
                           p++;
                        }
                     }
                     {
                        int len = (int)strlen(templateString);
                        if(templateString[len-1] == '>') templateString[len++] = ' ';
                        templateString[len++] = '>';
                        templateString[len++] = '\0';
                     }

                     FreeTemplateArg(templatedClass, param, c);

                     arg->dataTypeString = CopyString(templateString);
                     arg->dataTypeClass = System_FindClass(findModule, templateString, true);
                     if(!arg->dataTypeClass)
                        arg->dataTypeClass = System_FindClass(templatedClass.module, templateString, true);
                     if(!arg->dataTypeClass)
                        arg->dataTypeClass = System_FindClass(templatedClass.module.application, templateString, true);
                  }
                  else
                  {
                     ClassTemplateParameter cParam;
                     int p = numParams - _class.templateParams.count;
                     for(cParam = _class.templateParams.first; cParam; cParam = cParam.next, p++)
                     {
                        // if(cParam.type == type && !strcmp(cParam.name, param.name))
                        if(cParam.type == type && baseArg->dataTypeString && !strcmp(cParam.name, baseArg->dataTypeString))
                        {
                           FreeTemplateArg(templatedClass, param, c);

                           // TRICKY: This copies from equivalent parameters
                           arg->dataTypeString = templatedClass.templateArgs[p].dataTypeString;
                           arg->dataTypeClass = templatedClass.templateArgs[p].dataTypeClass;
                           CopyTemplateArg(cParam, arg);
                           break;
                        }
                     }
                  }
               }
            }
            c--;
         }
      }
   }

   {
      Class sClass;
      for(sClass = _class; sClass; sClass = sClass.base)
      {
         int curParamID = 0;
         Class nextClass;
         ClassTemplateParameter param;
         if(sClass.templateClass) sClass = sClass.templateClass;

         for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
         {
            if(nextClass.templateClass) nextClass = nextClass.templateClass;
            curParamID += nextClass.templateParams.count;
         }

         for(param = sClass.templateParams.first; param; param = param.next)
         {
            if(!templatedClass.templateArgs[curParamID].dataTypeString)
            {
               templatedClass.templateArgs[curParamID] = param.defaultArg;
               CopyTemplateArg(param, templatedClass.templateArgs[curParamID]);
               if(param.type == type && param.defaultArg.dataTypeString)
               {
                  templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(findModule, param.defaultArg.dataTypeString, true);
                  if(!templatedClass.templateArgs[curParamID].dataTypeClass)
                     templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(templatedClass.module, param.defaultArg.dataTypeString, true);
                  if(!templatedClass.templateArgs[curParamID].dataTypeClass)
                     templatedClass.templateArgs[curParamID].dataTypeClass = System_FindClass(templatedClass.module.application, param.defaultArg.dataTypeString, true);
               }
            }
            curParamID++;
         }
      }
   }

   {
      int c = numParams - 1;
      for(sClass = _class; sClass; sClass = sClass.base)
      {
         ClassTemplateParameter param;
         if(sClass.templateClass) sClass = sClass.templateClass;
         for(param = sClass.templateParams.last; param; param = param.prev)
         {
            if(param.type == type)
            {
               ClassTemplateArgument * arg = &templatedClass.templateArgs[c];
               ClassTemplateParameter cParam;
               Class dClass;
               int p = numParams - 1;
               for(dClass = _class; dClass; dClass = dClass.base)
               {
                  if(dClass.templateClass) dClass = dClass.templateClass;
                  for(cParam = dClass.templateParams.last; cParam; cParam = cParam.prev, p--)
                  {
                     if(cParam.type == type && arg->dataTypeString && !strcmp(cParam.name, arg->dataTypeString))
                     {
                        if(templatedClass.templateArgs[p].dataTypeString && c != p)
                        {
                           FreeTemplateArg(templatedClass, param, c);

                           arg->dataTypeString = templatedClass.templateArgs[p].dataTypeString;
                           arg->dataTypeClass = templatedClass.templateArgs[p].dataTypeClass;
                           CopyTemplateArg(cParam, arg);
                        }
                     }
                  }
               }
            }
            c--;
         }
      }
   }

   {
      Class tClass;
      int c = numParams - 1;
      for(tClass = _class; tClass; tClass = tClass.base)
      {
         ClassTemplateParameter param;
         if(tClass.templateClass) tClass = tClass.templateClass;
         for(param = tClass.templateParams.last; param; param = param.prev)
         {
            ClassTemplateArgument * arg = &templatedClass.templateArgs[c];
            if(param.type == identifier && arg->memberString)
            {
               Class memberClass = templatedClass;
               const char * memberString = arg->memberString;
               const char * colon = strstr(memberString, "::");
               const char * memberName = memberString;
               if(colon) memberName = colon + 2;
               if(!colon)
               {
                  memberString = param.defaultArg.memberString;
                  colon = memberString ? strstr(memberString, "::") : null;
               }

               if(colon)
               {
                  char className[1024];
                  Class sClass;

                  memcpy(className, memberString, colon - memberString);
                  className[colon - memberString] = '\0';

                  for(sClass = _class; sClass; sClass = sClass.base)
                  {
                     ClassTemplateParameter cParam;
                     Class nextClass;
                     int id = 0;

                     if(sClass.templateClass) sClass = sClass.templateClass;
                     for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                     {
                        if(nextClass.templateClass) nextClass = nextClass.templateClass;
                        id += nextClass.templateParams.count;
                     }
                     for(cParam = sClass.templateParams.first; cParam; cParam = cParam.next)
                     {
                        if(cParam.type == type && !strcmp(cParam.name, className) && templatedClass.templateArgs[id].dataTypeString)
                        {
                           strcpy(className, templatedClass.templateArgs[id].dataTypeString);
                        }
                        id++;
                     }
                  }
                  // TESTING: Added this here...
                  memberClass = System_FindClass(findModule, className, true);
                  if(!memberClass)
                     memberClass = System_FindClass(templatedClass.module, className, true);
                  if(!memberClass)
                     memberClass = System_FindClass(templatedClass.module.application, className, true);
               }

               if(memberClass)
               {
                  switch(param.memberType)
                  {
                     case dataMember:
                        arg->member = eClass_FindDataMember(memberClass, memberName, memberClass.module, null, null);
                        break;
                     case method:
                        arg->method = eClass_FindMethod(memberClass, memberName, memberClass.module);
                        break;
                     case prop:
                        arg->prop = eClass_FindProperty(memberClass, memberName, memberClass.module);
                        break;
                  }
               }
            }
            c--;
         }
      }
   }
}

/*static */bool DefaultFunction()
{
   return true;
}

public dllexport bool eClass_IsDerived(Class _class, Class from)
{
   if(!_class && !from)
      return true;

   if(_class && from && (_class.templateClass || from.templateClass))
   {
      if(eClass_IsDerived(_class.templateClass ? _class.templateClass : _class, from.templateClass ? from.templateClass : from))
      {
         if(!from.templateClass)
            return true;
         else if(!_class.templateClass && _class == from.templateClass)
            return false;
         else
         {
            Class sClass;
            for(sClass = from; sClass; sClass = sClass.base)
            {
               if(sClass.templateParams.first)
               {
                  ClassTemplateParameter param;
                  Class nextClass;
                  int p = 0;
                  for(nextClass = sClass.base; nextClass; nextClass = nextClass.base) p += nextClass.templateParams.count;
                  for(param = sClass.templateParams.first; param; param = param.next, p++)
                  {
                     ClassTemplateArgument * arg = &_class.templateArgs[p];
                     ClassTemplateArgument * fArg = &from.templateArgs[p];
                     if(param.type == type)
                     {
                        if(arg->dataTypeString != fArg->dataTypeString && arg->dataTypeString && fArg->dataTypeString &&
                          strcmp(arg->dataTypeString, fArg->dataTypeString))
                           break;
                     }
                     else if(param.type == identifier)
                     {
                        if(arg->member != fArg->member)
                           break;
                     }
                     else if(param.type == expression)
                     {
                        if(arg->expression.ui64 != fArg->expression.ui64)
                           break;
                     }
                  }
                  if(param)
                     return false;
               }
            }
            return true;
         }
      }
   }
   else
   {
      for(; _class && from; _class = _class.base)
      {
         if(_class == from || _class.templateClass == from || ((_class.type == systemClass || (_class.type == normalClass && _class.isInstanceClass)) && from.name && !strcmp(_class.name, from.name)))
            return true;
      }
   }
   return false;
}

static void FixDerivativeVirtualMethod(Class base, const char * name, int vid, void * origFunction, const char * type)
{
   OldLink derivative;
   for(derivative = base.derivatives.first; derivative; derivative = derivative.next)
   {
      Class _class = derivative.data;
      Method method, next;
      void * function = origFunction;

      _class.vTblSize++;
      _class._vTbl = renew _class._vTbl void *[_class.vTblSize];
      memmove(_class._vTbl + vid + 1, _class._vTbl + vid, (_class.vTblSize - vid - 1) * sizeof(void *));

      method = (Method) _class.methods.FindString(name);
      if(method)
      {
         if(method.function) function = method.function;

         if(!method.symbol)
         {
            delete (void *)method.name;
            delete (void *)method.dataTypeString;
            _class.methods.Delete((BTNode)method);
         }
         else
         {
            delete (void *)method.dataTypeString;
            method.type = virtualMethod;
            method.dataTypeString = CopyString(type);
            method._class = base;
         }
      }
      for(method = (Method)_class.methods.first; method; method = next)
      {
         next = (Method)((BTNode)method).next;
         if(method.type == virtualMethod)
            method.vid++;
      }
      _class._vTbl[vid] = function;

      {
         OldLink templateLink;
         for(templateLink = _class.templatized.first; templateLink; templateLink = templateLink.next)
         {
            Class template = templateLink.data;
            template._vTbl = _class._vTbl;
         }
      }
      if(_class.derivatives.first || _class.templatized.first)
         FixDerivativeVirtualMethod(_class, name, vid, function, type);
   }
   {
      OldLink templateLink;
      for(templateLink = base.templatized.first; templateLink; templateLink = templateLink.next)
      {
         Class template = templateLink.data;
         template._vTbl = base._vTbl;
         FixDerivativeVirtualMethod(template, name, vid, origFunction, type);
      }
   }
}

public dllexport Method eClass_AddMethod(Class _class, const char * name, const char * type, void * function, AccessMode declMode)
{
   if(_class && !_class.comRedefinition && name)
   {
      Class base;
      for(base = _class; base; base = base.base)
      {
         Method method;
         if(base.templateClass) base = base.templateClass;
         method = (Method)base.methods.FindString(name);
         if(method)
         {
            // If this overrides a virtual method
            if(method.type == virtualMethod)
            {
               OldLink deriv;
               void * oldFunction = _class._vTbl[method.vid];
               if(method.vid >= _class.vTblSize)
                  printf("error: virtual methods overriding failure\n");
               else
                  _class._vTbl[method.vid] = function ? function : null; //(void *)DefaultFunction;
               for(deriv = _class.derivatives.first; deriv; deriv = deriv.next)
               {
                  Class derivClass = deriv.data;
                  if(derivClass._vTbl[method.vid] == oldFunction)
                     eClass_AddMethod(derivClass, name, type, function, declMode);
               }
               {
                  OldLink templateLink;
                  for(templateLink = _class.templatized.first; templateLink; templateLink = templateLink.next)
                  {
                     Class template = templateLink.data;
                     for(deriv = template.derivatives.first; deriv; deriv = deriv.next)
                     {
                        Class derivClass = deriv.data;
                        if(derivClass._vTbl[method.vid] == oldFunction)
                           eClass_AddMethod(derivClass, name, type, function, declMode);
                     }
                  }
               }

            }
            else
            {
               if(base == _class)
               {
                  // printf("error: Redefinition of method %s in class %s\n", name, _class.name);
                  break;
               }
               base = null;
               break;
            }
            return method;
         }
      }

      if(!base)
      {
         Method method
         {
            name = CopyString(name),
            function = function ? function : null; //DefaultFunction;
            _class = _class;
            dataTypeString = CopyString(type);
            memberAccess = declMode;
         };
         _class.methods.Add((BTNode)method);
         return method;
      }
   }
   return null;
}

public dllexport Method eClass_AddVirtualMethod(Class _class, const char * name, const char * type, void * function, AccessMode declMode)
{
   if(_class && !_class.comRedefinition && name)
   {
      Class base;
      for(base = _class; base; base = base.base)
      {
         Method method = (Method)base.methods.FindString(name);
         if(method)
         {
            // If this overides a virtual method
            if(method.type == virtualMethod)
            {
               if(method.vid >= _class.vTblSize)
                  printf("error: virtual methods overriding failure\n");
               else
                  _class._vTbl[method.vid] = function ? function : null; //(void *)DefaultFunction;
            }
            else
               base = null;
            return method;
         }
      }

      if(!base)
      {
         Method method
         {
            name = CopyString(name);
            function = function ? function : null; //DefaultFunction;
            type = virtualMethod;
            _class = _class;
            vid = _class.vTblSize++;
            dataTypeString = CopyString(type);
            memberAccess = declMode;
         };
         _class.methods.Add((BTNode)method);
         _class._vTbl = renew _class._vTbl void *[_class.vTblSize];
         _class._vTbl[method.vid] = function ? function : null; //(void *)DefaultFunction;

         // TODO: Fix derived classes
         if(_class.derivatives.first || _class.templatized.first)
            FixDerivativeVirtualMethod(_class, name, method.vid, function ? function : null /*(void *)DefaultFunction*/, type);
         return method;
      }
   }
   return null;
}

static void FixDerivativeProperty(Class base, Property _property)
{
   OldLink derivative;
   for(derivative = base.derivatives.first; derivative; derivative = derivative.next)
   {
      Class _class = derivative.data;
      Property prop;
      BTNamedLink link = (BTNamedLink)_class.prop.FindString(_property.name);
      if(link)
      {
         prop = link.data;
         if(!prop.Set && !prop.Get && prop.memberAccess == baseSystemAccess)
         {
            SelfWatcher watcher;
            for(watcher = _class.selfWatchers.first; watcher; watcher = watcher.next)
            {
               if(watcher._property == prop)
                  watcher._property = _property;
            }
            _property.selfWatchable = true;

            delete (void *)prop.name;
            delete (void *)prop.dataTypeString;
            _class.membersAndProperties.Delete(prop);
            _class.prop.Delete((BTNode)link);
         }
      }

      for(prop = _class.membersAndProperties.first; prop; prop = prop.next)
         prop.id++;
      _class.memberID++;
      _class.startMemberID++;

      FixDerivativeProperty(_class, _property);
   }
}

public dllexport Property eClass_AddProperty(Class _class, const char * name, const char * dataType, void * setStmt, void * getStmt, AccessMode declMode)
{
   Property _property = null;
   if(_class)
   {
      BTNamedLink link = (BTNamedLink)_class.prop.FindString(name ? name : dataType);
      bool isConversion = name ? false : true;
      if(!name && dataType && !strncmp(dataType, "const ", 6))
      {
         name = dataType + 6;
         isConversion = true;
      }
      if(link)
         _property = link.data;
      if(!_property)
      {
         _property =
         {
            isProperty = true;
            name = CopyString(name ? name : dataType);
            id = (name && (setStmt || getStmt || dataType)) ? _class.memberID++ : 0;
            Set = setStmt;
            Get = getStmt;
            dataTypeString = CopyString(dataType);
            _class = _class;
            compiled = true;
            conversion = isConversion;
            memberAccess = declMode;
         };
         if(!isConversion)
            _class.membersAndProperties.Add(_property);
         else
            _class.conversions.Add(_property);
         _class.prop.Add((BTNode)BTNamedLink { name = _property.name, data = _property });

         if(!_property.conversion)
         {
            FixDerivativeProperty(_class, _property);
         }
      }
   }
   return _property;
}

static void SetDelayedCPValues(Class _class, ClassProperty _property)
{
   OldLink deriv;
   NamedLink64 value, next;

   for(value = _class.delayedCPValues.first; value; value = next)
   {
      next = value.next;
      if(!strcmp(value.name, _property.name))
      {
         // eClass_SetProperty(_class, _property.name, value.data);
         _property.Set(_class, value.data);
         _class.delayedCPValues.Delete(value);
      }
   }

   for(deriv = _class.derivatives.first; deriv; deriv = deriv.next)
   {
      SetDelayedCPValues(deriv.data, _property);
   }
}

public dllexport ClassProperty eClass_AddClassProperty(Class _class, const char * name, const char * dataType, void * setStmt, void * getStmt)
{
   if(name && !_class.classProperties.FindString(name))
   {
      ClassProperty _property
      {
         name = CopyString(name);
         Set = setStmt;
         Get = getStmt;
         dataTypeString = CopyString(dataType);
      };
      _class.classProperties.Add((BTNode)_property);
      SetDelayedCPValues(_class, _property);
      return _property;
   }
   return null;
}

/*import "Time"

Time classFindTotalTime;

public dllexport void ResetClassFindTime()
{
   classFindTotalTime = 0;
}

public dllexport Time GetClassFindTime()
{
   return classFindTotalTime;
}
*/
public dllexport ClassProperty eClass_FindClassProperty(Class _class, const char * name)
{
   //Time startTime = GetTime();
   ClassProperty _property = null;
   if(name && _class)
   {
      Class origClass = _class;
      for(; _class; _class = _class.base)
      {
         _property = (ClassProperty)_class.classProperties.FindString(name);
         if(_property)
            break;
      }
      // For enum class deriving off something else than enum to find enumSize...
      if(!_property && origClass.type == enumClass)
      {
         Class enumClass = eSystem_FindClass(origClass.module, "enum");
         _property = eClass_FindClassProperty(enumClass, name);
      }
   }
   /*if(!_property)
      eSystem_Logf("No such property (%s) for class %s\n", name, _class.name);*/
   //classFindTotalTime += GetTime() - startTime;
   return _property;
}

public dllexport int64 eClass_GetProperty(Class _class, const char * name)
{
   ClassProperty _property = eClass_FindClassProperty(_class, name);
   if(_property && _property.Get && _property.Get != (void *)1)
   {
      int64 result = _property.Get(_class);
      return result;
   }
   return 0;
}

public dllexport void eClass_SetProperty(Class _class, const char * name, int64 value)
{
   ClassProperty _property = eClass_FindClassProperty(_class, name);
   if(_property)
   {
      if(_property.Set)
         ((void(*)(void *, int64))_property.Set)(_class, value);
   }
   else
   {
      _class.delayedCPValues.Add(NamedLink64 { name = (char *)name, value });
   }
}

public dllexport Method eClass_FindMethod(Class _class, const char * name, Module module)
{
   //Time startTime = GetTime();
   if(_class && name)
   {
      for(; _class; _class = _class.base)
      {
         Method method;
         if(_class.templateClass) _class = _class.templateClass;
         method = (Method)_class.methods.FindString(name);
         if(method && (method.memberAccess == publicAccess || _class.module == module || !method.dataTypeString))
         {
            if(!method.dataTypeString)
            {
               if(_class.module != module)
               {
                  if(method.memberAccess == publicAccess)
                     module = _class.module;
                  else
                  {
                     //classFindTotalTime += GetTime() - startTime;
                     return null;
                  }
               }
            }
            else
            {
               //classFindTotalTime += GetTime() - startTime;
               return method;
            }
         }
         if(_class.inheritanceAccess == privateAccess && _class.module != module) break;
      }
   }
   //classFindTotalTime += GetTime() - startTime;
   return null;
}

// Construct an instance
static bool ConstructInstance(void * instance, Class _class, Class from, bool bindingsAlloc)
{
   if(_class.templateClass) _class = _class.templateClass;
   if(_class.base && from != _class.base)
   {
      if(!ConstructInstance(instance, _class.base, from, false))
         return false;
   }
   if(_class.Initialize)
   {
      void (* Initialize)(Module module) = (void *)_class.Initialize;
      _class.Initialize = null;
      Initialize(_class.module);
   }
   if(_class.Constructor)
   {
      bool result;
      if(_class.bindingsClass)
         result = ((bool (*)(void *, bool))(void *)_class.Constructor)(instance, bindingsAlloc);
      else
         result = _class.Constructor(instance);
      if(!result)
      {
         for(; _class; _class = _class.base)
         {
            if(_class.templateClass) _class = _class.templateClass;
            if(_class.Destructor)
               _class.Destructor(instance);
         }
         return false;
      }
   }

   #ifdef USE_ATOMICS
   atomic_fetch_add(&(_class.templateClass ? _class.templateClass : _class).count, 1);
   #else
#if !defined(_NOMUTEX) && !defined(ECERE_BOOTSTRAP)
   memMutex.Wait();
#endif
   (_class.templateClass ? _class.templateClass : _class).count++;
#if !defined(_NOMUTEX) && !defined(ECERE_BOOTSTRAP)
   memMutex.Release();
#endif
   #endif
   return true;
}

static void * Instance_New(Class _class, bool bindingsAlloc)
{
   Instance instance = null;
   if(_class)
   {
      // instance = _malloc(_class.size);
#ifdef MEMINFO

#undef malloc
#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif
      //allocateClass = _class;
      allocateClass = malloc(strlen(_class.name)+1);
      allocateInternal = _class.module == __thisModule;
      strcpy(allocateClass, _class.name);
#ifndef MEMINFO
#define malloc _mymalloc
#endif

#endif
      {
         int size = _class.structSize;
         int flags = _class.module.application.isGUIApp;
         bool inCompiler = (flags & 8) ? true : false;
         bool force32Bits = (flags & 4) ? true : false;
         if(force32Bits && inCompiler)
         {
            // Allocate 64 bit sizes for these when cross-compiling for 32 bit to allow loaded libraries to work properly
            if(!strcmp(_class.name, "Module"))
               size = 560;
            else if(_class.templateClass && !strcmp(_class.templateClass.name, "Map"))
               size = 40;
            else
               size *= 3;
         }
         instance = _calloc(1, size);
         if(!instance && size)
            printf("Failed to allocate memory instantiating %s object!\n", _class.name);
         else if(!size)
            printf("Warning: 0 size instantiating %s object!\n", _class.name);
      }
#ifdef MEMINFO
      allocateClass = null;
#if !defined(_NOMUTEX)
   memMutex.Release();
#endif
#endif

#if !defined(MEMINFO) && defined(MEMTRACKING)
      {
         MemBlock block = (MemBlock)((byte *)instance - sizeof(class MemBlock));
         block._class = _class;
      }
#endif

      if(instance && _class.type == normalClass)
      {
         instance._class = _class;
         // Copy the virtual table initially
         instance._vTbl = _class._vTbl;
      }
      if(instance && !ConstructInstance(instance, _class, null, bindingsAlloc))
      {
         _free(instance);
         instance = null;
      }
      /*if(_class.type == normalClass && _class.count > 1000)
         printf("%s: %d instances\n", _class.name, _class.count);*/
   }
   return instance;
}

public dllexport void * eInstance_New(Class _class)
{
   return Instance_New(_class, true);
}

public dllexport void * eInstance_NewEx(Class _class, bool bindingsAlloc)
{
   return Instance_New(_class, bindingsAlloc);
}

public dllexport void eInstance_Evolve(Instance * instancePtr, Class _class)
{
   if(_class && instancePtr && *instancePtr)
   {
      bool wasApp = false, wasGuiApp = false;
      Instance oldInstance = *instancePtr;
      Instance instance = (Instance)renew *instancePtr byte[_class.structSize];
      Class fromClass = instance._class;
      *instancePtr = instance;
      memset(((byte *)instance) + instance._class.structSize, 0, _class.structSize - instance._class.structSize);
      // Fix pointers to application
      if((wasApp = !strcmp(instance._class.name, "Application")) ||
         (wasGuiApp = !strcmp(instance._class.name, "GuiApplication")))
      {
         Module module;
         Application app = (Application) instance;
         BTNamedLink link;
         Class _class;
         NameSpace * nameSpace;
         for(module = app.allModules.first; module; module = module.next)
            module.application = app;

         for(link = (BTNamedLink)app.privateNameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            OldLink t;
            ((Class)link.data).nameSpace = &app.privateNameSpace;
            for(t = ((Class)link.data).templatized.first; t; t = t.next) { Class template = t.data; template.nameSpace = ((Class)link.data).nameSpace; }
         }
         for(link = (BTNamedLink)app.publicNameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            OldLink t;
            ((Class)link.data).nameSpace = &app.publicNameSpace;
            for(t = ((Class)link.data).templatized.first; t; t = t.next) { Class template = t.data; template.nameSpace = ((Class)link.data).nameSpace; }
         }

         for(link = (BTNamedLink)app.privateNameSpace.defines.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((DefinedExpression)link.data).nameSpace = &app.privateNameSpace;
         for(link = (BTNamedLink)app.publicNameSpace.defines.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((DefinedExpression)link.data).nameSpace = &app.publicNameSpace;

         for(link = (BTNamedLink)app.privateNameSpace.functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((GlobalFunction)link.data).nameSpace = &app.privateNameSpace;
         for(link = (BTNamedLink)app.publicNameSpace.functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((GlobalFunction)link.data).nameSpace = &app.publicNameSpace;

         for(nameSpace = (NameSpace *)app.privateNameSpace.nameSpaces.first; nameSpace; nameSpace = (NameSpace *)((BTNode)nameSpace).next)
            nameSpace->parent = &app.privateNameSpace;
         for(nameSpace = (NameSpace *)app.publicNameSpace.nameSpaces.first; nameSpace; nameSpace = (NameSpace *)((BTNode)nameSpace).next)
            nameSpace->parent = &app.publicNameSpace;

         // --------------------------------------------------
         for(link = (BTNamedLink)app.systemNameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            OldLink t;
            ((Class)link.data).nameSpace = &app.systemNameSpace;
            for(t = ((Class)link.data).templatized.first; t; t = t.next) { Class template = t.data; template.nameSpace = ((Class)link.data).nameSpace; }
         }
         for(link = (BTNamedLink)app.systemNameSpace.defines.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((DefinedExpression)link.data).nameSpace = &app.systemNameSpace;
         for(link = (BTNamedLink)app.systemNameSpace.functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((GlobalFunction)link.data).nameSpace = &app.systemNameSpace;
         for(link = (BTNamedLink)app.systemNameSpace.functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            ((GlobalFunction)link.data).nameSpace = &app.systemNameSpace;
         for(nameSpace = (NameSpace *)app.systemNameSpace.nameSpaces.first; nameSpace; nameSpace = (NameSpace *)((BTNode)nameSpace).next)
            nameSpace->parent = &app.systemNameSpace;
         // --------------------------------------------------

         for(_class = app.classes.first; _class; _class = _class.next)
         {
            OldLink templateLink;
            _class.module = (Module) app;
            for(templateLink = _class.templatized.first; templateLink; templateLink = templateLink.next)
            {
               Class template = templateLink.data;
               if(template.module == oldInstance)
                  template.module = _class.module;
            }
         }

         for(module = app.allModules.first; module; module = module.next)
         {
            for(_class = module.classes.first; _class; _class = _class.next)
            {
               OldLink templateLink;
               Module oldModule = _class.module;
               _class.module = module;
               for(templateLink = _class.templatized.first; templateLink; templateLink = templateLink.next)
               {
                  Class template = templateLink.data;
                  if(template.module == oldModule)
                     template.module = _class.module;
               }
            }
         }

         app.application = app;
      }

      {
         Class base;
         for(base = instance._class; base && base.type == normalClass && base.count; base = base.base)
            (base.templateClass ? base.templateClass : base).count--;
      }

      instance._class = _class;
      // Copy the virtual table initially
      instance._vTbl = _class._vTbl;

      // We don't want to reconstruct the portion already constructed...
      if(!ConstructInstance(instance, _class, fromClass, false))
      {
         _free(instance);
         *instancePtr = null;
      }
   }
}

public dllexport void eInstance_Delete(Instance instance)
{
#ifdef MEMINFO
   bool checkMemory = false;
#endif
   if(instance)
   {
      Class _class, base;
      bool ownVtbl;

#ifdef MEMINFO
#if (defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__) || defined(_M_X64) || defined(_WIN64) || defined(__LP64__) || defined(__LLP64__)
      if(instance._class == (void *)0xecececececececec)
#else
      if(instance._class == (void *)0xecececec)
#endif
         _free(instance);
#endif

      ownVtbl = instance._vTbl != instance._class._vTbl;

      for(_class = instance._class; _class; _class = base)
      {
         if(_class.templateClass) _class = _class.templateClass;
         if(_class.destructionWatchOffset)
         {
            OldList * watchers = (OldList *)((byte *)instance + _class.destructionWatchOffset);
            Watcher watcher, next;

            for(watcher = watchers->first; watcher; watcher = next)
            {
               next = watcher.next;
               watchers->Remove(watcher);
               watcher.callback(watcher.object, instance);
               watchers->Delete(watcher);
            }
         }
         // FIXME: Fix this comment highlighting!!!
         /*// Loop through properties to delete all watchers? Might slow down destruction...
         {
            Property _property;
            for(_property = _class.membersAndProperties.first; _property; _property = _property.next)
            {
               if(_property.isProperty && _property.isWatchable)
               {
                  OldList * watchers = (OldList *)((byte *)instance + _property.watcherOffset);
                  Watcher watcher, next;
                  for(watcher = watchers->first; watcher; watcher = next)
                  {
                     next = watcher.next;
                     watchers->Delete(watcher);
                  }
               }
            }
         }*/


         base = _class.base;
         if(base && (base.type == systemClass || base.isInstanceClass)) base = null;
         if(_class.Destructor)
            _class.Destructor(instance);
#ifdef MEMINFO
         if(_class == class(Application))
            checkMemory = true;
#endif
      }

      for(_class = instance._class; _class; _class = base)
      {
         int cCount;

         if(_class.templateClass) _class = _class.templateClass;

         base = _class.base;

   #ifdef USE_ATOMICS
         cCount = (int)atomic_fetch_sub(&(_class.templateClass ? _class.templateClass : _class).count, 1) - 1;
   #else
#if !defined(_NOMUTEX) && !defined(ECERE_BOOTSTRAP)
         memMutex.Wait();
#endif
         cCount = --(_class.templateClass ? _class.templateClass : _class).count;
#if !defined(_NOMUTEX) && !defined(ECERE_BOOTSTRAP)
         memMutex.Release();
#endif
   #endif
         if(!cCount && _class.type == normalClass && !_class.module)
         {
#ifdef MEMINFO
            // printf("Now Destructing class %s\n", _class.name);
#endif
            eClass_Unregister(_class);
         }
      }

      if(ownVtbl)
      {
         delete instance._vTbl;
      }
      //instance.prop.Free(null);
      _free(instance);
#ifdef MEMINFO
      if(checkMemory) CheckMemory();
#endif
   }
}

public dllexport Property eClass_FindProperty(Class _class, const char * name, Module module)
{
   //Time startTime = GetTime();
   if(_class && name)
   {
      if(!strncmp(name, "const ", 6))
         name += 6;

      for(; _class; _class = _class.base)
      {
         BTNamedLink link;
         if(_class.templateClass) _class = _class.templateClass;
         link = (BTNamedLink)_class.prop.FindString(name);
         if(link)
         {
            Property _property = (Property)link.data;
            if(_property.memberAccess == publicAccess || _class.module == module || !_property.dataTypeString)
            {
               if(!_property.dataTypeString)
               {
                  if(_class.module != module)
                  {
                     if(_property.memberAccess == publicAccess)
                        module = _class.module;
                     else
                     {
                        //classFindTotalTime += GetTime() - startTime;
                        return null;
                     }
                  }
               }
               else
               {
                  //classFindTotalTime += GetTime() - startTime;
                  return _property;
               }
            }
         }
         if(_class.inheritanceAccess == privateAccess && _class.module != module) break;
      }
   }
   //classFindTotalTime += GetTime() - startTime;
   return null;
}

static DataMember FindDataMember(OldList list, BinaryTree alist, const char * name, uint * offset, int * id, bool searchPrivate, DataMember * subMemberStack, int * subMemberStackPos)
{
   BTNamedLink link;
   DataMember dataMember;

   link = (BTNamedLink)alist.FindString(name);
   if(link)
   {
      dataMember = link.data;
      if(dataMember.type == normalMember && (dataMember.memberAccess == publicAccess || searchPrivate || !dataMember.dataTypeString))
      {
         if(offset)
            *offset += dataMember.offset;
         if(id) *id = dataMember.id;
         return dataMember;
      }
      return null;
   }
   for(dataMember = list.first; dataMember; dataMember = dataMember.next)
   {
      if(!dataMember.isProperty && (dataMember.memberAccess == publicAccess || searchPrivate) && !dataMember.name && (dataMember.type == unionMember || dataMember.type == structMember))
      {
         DataMember childMember;
         if(subMemberStackPos) subMemberStack[(*subMemberStackPos)++] = dataMember;
         childMember = FindDataMember(dataMember.members, dataMember.membersAlpha, name, offset, id, searchPrivate, subMemberStack, subMemberStackPos);
         if(childMember)
         {
            if(offset)
               *offset += dataMember.offset;
            if(id) *id += dataMember.id;
            return childMember;
         }
         if(subMemberStackPos) (*subMemberStackPos)--;
      }
   }
   return null;
}

public dllexport DataMember eClass_FindDataMember(Class _class, const char * name, Module module, DataMember * subMemberStack, int * subMemberStackPos)
{
   //Time startTime = GetTime();
   DataMember dataMember = null;
   if(subMemberStackPos) *subMemberStackPos = 0;
   if(_class && name)
   {
      for(; _class; _class = _class.base)
      {
         if(_class.templateClass) _class = _class.templateClass;
         dataMember = FindDataMember(_class.membersAndProperties, _class.members, name, null, null, _class.module == module, subMemberStack, subMemberStackPos);
         if(dataMember)
         {
            if(!dataMember.dataTypeString)
            {
               if(_class.module != module)
               {
                  if(dataMember.memberAccess == publicAccess)
                     module = _class.module;
                  else
                  {
                     //classFindTotalTime += GetTime() - startTime;
                     return null;
                  }
               }
               dataMember = null;
            }
            else
            {
               // HACK: Is this good enough? avoiding setting it when adding...
               dataMember._class = _class.templateClass ? _class.templateClass : _class;
               //classFindTotalTime += GetTime() - startTime;
               return dataMember;
            }
         }
         if(_class.inheritanceAccess == privateAccess && _class.module != module) break;
      }
   }
   //classFindTotalTime += GetTime() - startTime;
   return dataMember;
}

// TODO: Document precisely what DataMember::offset is and why/how eClass_FindDataMemberAndOffset produces the proper offset one really wants to use
public dllexport DataMember eClass_FindDataMemberAndOffset(Class _class, const char * name, uint * offset, Module module, DataMember * subMemberStack, int * subMemberStackPos)
{
   //Time startTime = GetTime();
   DataMember dataMember = null;
   if(subMemberStackPos) *subMemberStackPos = 0;
   if(offset) *offset = 0;
   if(_class)
   {
      for(; _class; _class = _class.base)
      {
         if(_class.templateClass) _class = _class.templateClass;
         dataMember = FindDataMember(_class.membersAndProperties, _class.members, name, offset, null, _class.module == module, subMemberStack, subMemberStackPos);
         if(dataMember)
         {
            if(!dataMember.dataTypeString)
            {
               if(_class.module != module)
               {
                  if(dataMember.memberAccess == publicAccess)
                     module = _class.module;
                  else
                  {
                     //classFindTotalTime += GetTime() - startTime;
                     return null;
                  }
               }
               dataMember = null;
            }
            else
            {
               // HACK: Is this good enouh? avoiding setting it when adding...
               dataMember._class = _class;
               //classFindTotalTime += GetTime() - startTime;
               return dataMember;
            }
         }
         if(_class.inheritanceAccess == privateAccess && _class.module != module) break;
      }
   }
   //classFindTotalTime += GetTime() - startTime;
   return dataMember;
}

public dllexport DataMember eClass_FindDataMemberAndId(Class _class, const char * name, int * id, Module module, DataMember * subMemberStack, int * subMemberStackPos)
{
   //Time startTime = GetTime();
   DataMember dataMember = null;
   if(subMemberStackPos) *subMemberStackPos = 0;
   if(_class)
   {
      for(; _class; _class = _class.base)
      {
         if(_class.templateClass) _class = _class.templateClass;
         dataMember = FindDataMember(_class.membersAndProperties, _class.members, name, null, id, _class.module == module, subMemberStack, subMemberStackPos);  // TOCHECK: Why was this null? null, null);
         if(dataMember)
         {
            if(!dataMember.dataTypeString)
            {
               if(_class.module != module)
               {
                  if(dataMember.memberAccess == publicAccess)
                     module = _class.module;
                  else
                  {
                     //classFindTotalTime += GetTime() - startTime;
                     return null;
                  }
               }
               dataMember = null;
            }
            else
            {
               // HACK: Is this good enouh? avoiding setting it when adding...
               dataMember._class = _class;
               //classFindTotalTime += GetTime() - startTime;
               return dataMember;
            }
         }
         if(_class.inheritanceAccess == privateAccess && _class.module != module) break;
      }
   }
   //classFindTotalTime += GetTime() - startTime;
   return dataMember;
}

public dllexport void eClass_FindNextMember(Class _class, Class * curClass, DataMember * curMember, DataMember * subMemberStack, int * subMemberStackPos)
{
   // THIS CODE WILL FIND NEXT MEMBER... (PUBLIC MEMBERS ONLY)
   if(*curMember)
   {
      *curMember = (*curMember).next;

      if(subMemberStackPos && *subMemberStackPos > 0 && subMemberStack[*subMemberStackPos-1].type == unionMember)
      {
         *curMember = subMemberStack[--(*subMemberStackPos)];
         *curMember = (*curMember).next;
      }

      if(subMemberStackPos && *subMemberStackPos > 0)
      {
         while(*curMember && ((*curMember).memberAccess == privateAccess))
            *curMember = (*curMember).next;
      }
      else
         while(*curMember && (*curMember).name)      // ADDED THIS HERE for eComPacket packet { Connect, 0, { ECOMMUNICATOR_PROTOCOL_VERSION } };
         {
            DataMember dataMember = eClass_FindDataMember(_class, curMember->name, null, null, null);
            if(!dataMember) dataMember = (DataMember)eClass_FindProperty(_class, curMember->name, null);
            if(dataMember && dataMember.memberAccess != privateAccess)
            {
               *curMember = dataMember;
               break;
            }
            else
               *curMember = (*curMember).next;
         }

      if(subMemberStackPos)
      {
         while((*curMember) && !(*curMember).isProperty && !(*curMember).name && ((*curMember).type == structMember || (*curMember).type == unionMember))
         {
            subMemberStack[(*subMemberStackPos)++] = *curMember;

            *curMember = (*curMember).members.first;
            while(*curMember && ((*curMember).memberAccess == privateAccess))
               *curMember = (*curMember).next;
         }
      }
   }
   while(!*curMember)
   {
      if(!*curMember)
      {
         if(subMemberStackPos && *subMemberStackPos)
         {
            *curMember = subMemberStack[--(*subMemberStackPos)];
            *curMember = (*curMember).next;
         }
         else
         {
            Class lastCurClass = *curClass;

            if(*curClass == _class) break;     // REACHED THE END

            for(*curClass = _class; (*curClass).base != lastCurClass && (*curClass).base.type != systemClass && (*curClass).inheritanceAccess != privateAccess; *curClass = (*curClass).base);
            *curMember = (*curClass).membersAndProperties.first;
         }

         if(subMemberStackPos && *subMemberStackPos > 0)
         {
            while(*curMember && ((*curMember).memberAccess == privateAccess))
               *curMember = (*curMember).next;
         }
         else
            while(*curMember && (*curMember).name)      // ADDED THIS HERE for eComPacket packet { Connect, 0, { ECOMMUNICATOR_PROTOCOL_VERSION } };
            {
               DataMember dataMember = null;
               if(((*curMember).memberAccess != privateAccess))
               {
                  dataMember = eClass_FindDataMember(_class, curMember->name, null, null, null);
                  if(!dataMember) dataMember = (DataMember)eClass_FindProperty(_class, curMember->name, null);
               }
               if(dataMember && dataMember.memberAccess != privateAccess && dataMember.id >= 0) // Skip _vTbl, _refCount and _class in Instance
               {
                  *curMember = dataMember;
                  break;
               }
               else
                  *curMember = (*curMember).next;
            }

         if(subMemberStackPos)
         {
            while((*curMember) && !(*curMember).isProperty && !(*curMember).name && ((*curMember).type == structMember || (*curMember).type == unionMember))
            {
               subMemberStack[(*subMemberStackPos)++] = *curMember;

               *curMember = (*curMember).members.first;
               while(*curMember && (*curMember).memberAccess == privateAccess)
                  *curMember = (*curMember).next;
            }
         }
      }
   }
}

public dllexport void eInstance_SetMethod(Instance instance, const char * name, void * function)     // YET TO BE DECIDED:   , Module module)
{
   if(instance && name)
   {
      Class _class;
      for(_class = instance._class; _class; _class = _class.base)
      {
         Method method = (Method)_class.methods.FindString(name);
         if(method && method.type == virtualMethod)
         {
            if(instance._vTbl == instance._class._vTbl)
            {
               instance._vTbl = _malloc(sizeof(void *) * instance._class.vTblSize);
               memcpy(instance._vTbl, instance._class._vTbl,
                  sizeof(int(*)()) * instance._class.vTblSize);
            }
            instance._vTbl[method.vid] = function ? function : null; //(void *)DefaultFunction;
         }
      }
   }
}

public dllexport bool eInstance_IsDerived(Instance instance, Class from)
{
   if(instance)
   {
      Class _class = instance._class;
      for(; _class; _class = _class.base)
      {
         if(_class == from)
            return true;
      }
   }
   return false;
}

public dllexport void eInstance_IncRef(Instance instance)
{
   if(instance)
      instance._refCount++;
}

public dllexport void eInstance_DecRef(Instance instance)
{
   if(instance)
   {
      instance._refCount--;
      //if(!instance._refCount)
      if(instance._refCount <= 0)
      {
         eInstance_Delete(instance);
      }
   }
}

static void FixOffsets(Class _class)
{
   OldLink deriv;
   _class.structSize += _class.base.structSize - _class.offset;

   _class.offset = _class.base.structSize;

   for(deriv = _class.derivatives.first; deriv; deriv = deriv.next)
      FixOffsets(deriv.data);
}

public dllexport void eClass_Resize(Class _class, int newSize)
{
   OldLink deriv;
   _class.structSize = newSize;
   for(deriv = _class.derivatives.first; deriv; deriv = deriv.next)
      FixOffsets(deriv.data);
}
                                                                                                                        // F000F000 will mean a pointer size alignment
public dllexport DataMember eClass_AddDataMember(Class _class, const char * name, const char * type, unsigned int size, unsigned int alignment, AccessMode declMode)
{
   if(_class && (name || (!name && !size && !type && alignment)))
   {
      if(!name || !_class.members.FindString(name))
      {
         if(alignment)
         {
            bool pointerAlignment = alignment == 0xF000F000;
            bool force64Bits = (_class.module.application.isGUIApp & 2) ? true : false;
            bool force32Bits = (_class.module.application.isGUIApp & 4) ? true : false;
            if((force32Bits || force64Bits) &&
               name && !strcmp(_class.name, "AVLNode") && !strcmp(name, "__ecerePrivateData0"))
            {
               if(force64Bits)
               {
                  type = "byte[32]";
                  size = 32;
               }
               if(force32Bits)
               {
                  type = "byte[16]";
                  size = 16;
               }
            }

            if(pointerAlignment) alignment = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);

            if(pointerAlignment && _class.structAlignment <= 4)
               _class.pointerAlignment = 1;
            else if(!pointerAlignment && alignment >= 8)
               _class.pointerAlignment = 0;

            _class.structAlignment = Max(_class.structAlignment, alignment);

            if(_class.offset % alignment)
            {
               _class.structSize += alignment - (_class.offset % alignment);
               _class.offset += alignment - (_class.offset % alignment);
            }
            if(_class.memberOffset % alignment)
               _class.memberOffset += alignment - (_class.memberOffset % alignment);
         }

         if(name)
         {
            DataMember dataMember
            {
               name = CopyString(name);
               dataTypeString = CopyString(type);
               id = _class.memberID++;
               _class = _class;
               offset = _class.memberOffset;
               memberOffset = size;
               memberAccess = declMode;
               membersAlpha.CompareKey = (void *)BinaryTree::CompareString;
            };
            _class.membersAndProperties.Add(dataMember);
            _class.memberOffset += size;
            _class.members.Add((BTNode)BTNamedLink { name = dataMember.name, data = dataMember });
            return dataMember;
         }
      }
   }
   return null;
}
                                                                                                                              // F000F000 will mean a pointer size alignment
public dllexport DataMember eMember_AddDataMember(DataMember member, const char * name, const char * type, unsigned int size, unsigned int alignment, AccessMode declMode)
{
   if((name && !member.membersAlpha.FindString(name)) || (!name && !type && !size && alignment))
   {
      if(alignment)
      {
         bool pointerAlignment = alignment == 0xF000F000;
         bool force64Bits = false; //(member._class.module.application.isGUIApp & 2) ? true : false;
         bool force32Bits = false; //(member._class.module.application.isGUIApp & 4) ? true : false;
         if(pointerAlignment) alignment = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);

         if(pointerAlignment && member.structAlignment <= 4)
            member.pointerAlignment = 1;
         else if(!pointerAlignment && alignment >= 8)
            member.pointerAlignment = 0;

         member.structAlignment = Max(member.structAlignment, alignment);

         if(member.memberOffset % alignment)
            member.memberOffset += alignment - (member.memberOffset % alignment);
      }
      if(name)
      {
         DataMember dataMember
         {
            name = CopyString(name);
            _class = member._class;
            dataTypeString = CopyString(type);
            id = member.memberID++;
            offset = (member.type == unionMember) ? 0 : member.memberOffset;
            memberAccess = declMode;
            membersAlpha.CompareKey = (void *)BinaryTree::CompareString;
         };
         member.members.Add(dataMember);
         if(member.type == unionMember)
         {
            if(size > member.memberOffset)
               member.memberOffset = size;
         }
         else
            member.memberOffset += size;
         member.membersAlpha.Add((BTNode)BTNamedLink { name = dataMember.name, data = dataMember });
         return dataMember;
      }
   }
   return null;
}

public dllexport DataMember eMember_New(DataMemberType type, AccessMode declMode)
{
   return DataMember { type = type, memberAccess = declMode, membersAlpha.CompareKey = (void *)BinaryTree::CompareString };
}

static void SetMemberClass(DataMember member, Class _class)
{
   DataMember dataMember;
   member._class = _class;
   for(dataMember = member.members.first; dataMember; dataMember = dataMember.next)
      SetMemberClass(dataMember, _class);
}

public dllexport bool eMember_AddMember(DataMember addTo, DataMember dataMember)
{
   if(dataMember.name && addTo.membersAlpha.FindString(dataMember.name))
   {
      DataMember_Free(dataMember);
      delete dataMember;
      return false;
   }
   addTo.members.Add(dataMember);

   if(dataMember.name)
      addTo.membersAlpha.Add((BTNode)BTNamedLink { name = dataMember.name, data = dataMember });

   dataMember._class = addTo._class;
   // ? SetMemberClass(dataMember, addTo._class);

   //dataMember.id = addTo.memberID++;
   dataMember.id = addTo.memberID;
   if(dataMember.type == unionMember)
      addTo.memberID += 1;
   else
      addTo.memberID += dataMember.memberID;

   if(dataMember.pointerAlignment && dataMember.structAlignment <= 4)
      addTo.pointerAlignment = 1;
   else if(!dataMember.pointerAlignment && dataMember.structAlignment >= 8)
      addTo.pointerAlignment = 0;

   addTo.structAlignment = Max(addTo.structAlignment, dataMember.structAlignment);

   dataMember.offset = (addTo.type == unionMember) ? 0 : addTo.memberOffset;

   if(dataMember.structAlignment)
   {
      if(addTo.memberOffset % dataMember.structAlignment)
         addTo.memberOffset += dataMember.structAlignment - (addTo.memberOffset % dataMember.structAlignment);
   }

   if(addTo.type == unionMember)
   {
      if(dataMember.memberOffset > addTo.memberOffset)
         addTo.memberOffset = dataMember.memberOffset;
   }
   else
      addTo.memberOffset += dataMember.memberOffset;
   return true;
}

public dllexport bool eClass_AddMember(Class _class, DataMember dataMember)
{
   if(!_class || _class.comRedefinition || (dataMember.name && _class.members.FindString(dataMember.name)))
   {
      DataMember_Free(dataMember);
      delete dataMember;
      return false;
   }
   _class.membersAndProperties.Add(dataMember);

   if(dataMember.name)
      _class.members.Add((BTNode)BTNamedLink { name = dataMember.name, data = dataMember });

   //dataMember._class = _class;
   SetMemberClass(dataMember, _class);

   //dataMember.id = _class.memberID++;
   dataMember.id = _class.memberID;

   if(dataMember.pointerAlignment && dataMember.structAlignment <= 4)
      _class.pointerAlignment = 1;
   else if(!dataMember.pointerAlignment && dataMember.structAlignment >= 8)
      _class.pointerAlignment = 0;

   _class.structAlignment = Max(_class.structAlignment, dataMember.structAlignment);
   if(dataMember.type == unionMember)
      _class.memberID += 1;
   else
      _class.memberID += dataMember.memberID;

   if(dataMember.structAlignment)
   {
      if(_class.memberOffset % dataMember.structAlignment)
         _class.memberOffset += dataMember.structAlignment - (_class.memberOffset % dataMember.structAlignment);
   }

   dataMember.offset = _class.memberOffset;
   _class.memberOffset += dataMember.memberOffset;
   return true;
}

public dllexport BitMember eClass_AddBitMember(Class _class, const char * name, const char * type, int bitSize, int bitPos, AccessMode declMode)
{
   if(_class && name && !_class.members.FindString(name))
   {
      uint64 mask = 0;
      int c;
      BitMember bitMember
      {
         name = CopyString(name);
         _class = _class;
         dataTypeString = CopyString(type);
         id = _class.memberID++;
         memberAccess = declMode;
      };
      _class.membersAndProperties.Add(bitMember);
      if(bitSize)
      {
         bitMember.pos = (bitPos == -1) ? _class.memberOffset : bitPos;
         bitMember.size = bitSize;
         _class.memberOffset = bitMember.pos + bitMember.size;
         for(c = 0; c<bitSize; c++)
         {
            if(c)
               mask <<= 1;
            mask |= 1;
         }
         bitMember.mask = mask << bitMember.pos;
      }

     _class.members.Add((BTNode)BTNamedLink { name = bitMember.name, data = bitMember });
      return bitMember;
   }
   return null;
}

static Module Module_Load(Module fromModule, const char * name, AccessMode importAccess, bool ensureCOM)
{
   bool (stdcall * Load)(Module module) = null;
   bool (stdcall * Unload)(Module module) = null;
   Module module;

   for(module = fromModule.application.allModules.first; module; module = module.next)
   {
      if(!strcmp(module.name, name))
         break;
   }
   if(ensureCOM && (!strcmp(name, "ecereCOM") || !strcmp(name, "ecere")))
   {
      for(module = fromModule.application.allModules.first; module; module = module.next)
      {
         if(!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM"))
            break;
      }
   }
   if(!module)
   {
      void * library = null;

      if(ensureCOM && !strcmp(name, "ecereCOM"))
      {
         Load = COM_LOAD_FUNCTION;
         Unload = COM_UNLOAD_FUNCTION;
      }
      else
      {
         const char * libLocation = null;
#if defined(__ANDROID__) && !defined(__LUMIN__)
         libLocation = AndroidInterface_GetLibLocation(fromModule.application);
#elif defined(__LUMIN__)
         libLocation = "";
#endif
         library = Instance_Module_Load(libLocation, name, &Load, &Unload);
      }
      if(Load)
      {
         module = (Module)eInstance_New(eSystem_FindClass(fromModule, "Module"));
         module.application = fromModule.application;
         module.library = library;
         {
            char moduleName[MAX_FILENAME];
            char ext[MAX_EXTENSION];
            GetLastDirectory(name, moduleName);
            GetExtension(moduleName, ext);
            StripExtension(moduleName);
            if((!strcmpi(ext, "dylib") || !strcmpi(ext, "so")) && strstr(moduleName, "lib") == moduleName)
            {
               int len = (int)strlen(moduleName) - 3;
               memmove(moduleName, moduleName + 3, len);
               moduleName[len] = 0;
            }
            module.name = CopyString(moduleName);
         }
         module.Unload = Unload;
         module.origImportType = normalImport;

         if(!Load(module))
         {
            eInstance_Delete((Instance)module);
            module = null;
         }
      }
      fromModule.application.allModules.Add(module);
   }
   if(ensureCOM && !strcmp(name, "ecere") && module)
   {
      name = !strcmp(module.name, "ecereCOM") ? "ecere" : "ecereCOM";
      if((!Load && !strcmp(module.name, "ecereCOM")) ||
         (Load && (!__thisModule || !__thisModule.name || !strcmp(__thisModule.name, "ecereCOM")) && Load != (void *)COM_LOAD_FUNCTION))
      {
         Module module;
         for(module = fromModule.application.allModules.first; module; module = module.next)
         {
            if(!strcmp(module.name, name))
               break;
         }
         if(!module)
         {
            Load = COM_LOAD_FUNCTION;
            Unload = COM_UNLOAD_FUNCTION;

            module = (Module)eInstance_New(eSystem_FindClass(fromModule, "Module"));
            module.application = fromModule.application;
            module.library = null;
            module.name = CopyString(name);
            module.Unload = Unload;

            if(!Load(module))
            {
               eInstance_Delete((Instance)module);
               module = null;
            }

            fromModule.application.allModules.Add(module);
         }
         if(module)
         {
            if(fromModule)
            {
               fromModule.modules.Add(SubModule { module = module, importMode = importAccess });
            }
            incref module;
         }
      }
   }
   if(module)
   {
      if(fromModule)
      {
         fromModule.modules.Add(SubModule { module = module, importMode = importAccess });
      }
      incref module;
   }
#if defined(_DEBUG) && !defined(__ANDROID__)
   InternalModuleLoadBreakpoint();
#endif
   return module;
}

public dllexport Module eModule_Load(Module fromModule, const char * name, AccessMode importAccess)
{
   return Module_Load(fromModule, name, importAccess, true);
}

public dllexport Module eModule_LoadStrict(Module fromModule, const char * name, AccessMode importAccess)
{
   return Module_Load(fromModule, name, importAccess, false);
}

public dllexport Module eModule_LoadStatic(Module fromModule, const char * name, AccessMode importAccess, bool (* Load)(Module module), bool (* Unload)(Module module))
{
   Module module;
   for(module = fromModule.application.allModules.first; module; module = module.next)
   {
      if(!strcmp(module.name, name))
         break;
   }
   if(!module)
   {
      if(Load)
      {
         module = (Module)eInstance_New(eSystem_FindClass(fromModule, "Module"));
         module.application = fromModule.application;
         module.name = CopyString(name);
         module.origImportType = staticImport;
         module.Unload = (void *)Unload;
         if(!Load(module))
         {
            eInstance_Delete((Instance)module);
            module = null;
         }
      }
      fromModule.application.allModules.Add(module);
   }
   if(module)
   {
      if(fromModule)
      {
         fromModule.modules.Add(SubModule { module = module, importMode = importAccess });
      }
      incref module;
   }
   return module;
}

public dllexport void eModule_Unload(Module fromModule, Module module)
{
   OldLink m;
   for(m = fromModule.modules.first; m; m = m.next)
   {
      if(m.data == module)
         break;
   }
   if(m)
   {
      fromModule.modules.Delete(m);
      delete module;
   }
}

public dllexport void eEnum_AddFixedValue(Class _class, const char * string, int64 value)
{
   if(_class && _class.type == enumClass)
   {
      EnumClassData data = (EnumClassData)_class.data;
      NamedLink64 item;

      for(item = data.values.first; item; item = item.next)
         if(!strcmp(item.name, string))
            break;
      if(!item)
      {
         data.values.Add(NamedLink64 { data = value, name = CopyString(string) });
         if(value > data.largest)
            data.largest = value;
      }
   }
}

public dllexport int64 eEnum_AddValue(Class _class, const char * string)
{
   if(_class && _class.type == enumClass)
   {
      EnumClassData data = (EnumClassData)_class.data;
      int64 value = data.largest + 1;
      NamedLink64 item;
      for(item = data.values.first; item; item = item.next)
         if(!strcmp(item.name, string))
            break;
      if(!item)
      {
         data.values.Add(NamedLink64 { data = value, name = CopyString(string) });
         if(value > data.largest)
            data.largest = value;
         return value;
      }
   }
   return -1;
}

static void NameSpace_Free(NameSpace parentNameSpace)
{
   NameSpace * nameSpace;
   delete (void *)parentNameSpace.name;

         /*   {
      BTNamedLink n, next;
      for(n = (BTNamedLink)parentNameSpace.classes.first; n; n = next)
      {
         Class c = n.data;

         next = (BTNamedLink)((BTNode)n).next;

         if(c.templateClass)
            eClass_Unregister(c);
      }
   }         */

   while((nameSpace = (NameSpace *)parentNameSpace.nameSpaces.first))
   {
      NameSpace_Free(nameSpace);
      parentNameSpace.nameSpaces.Delete((BTNode)nameSpace);
   }
}

static void Application_Destructor(Application app)
{
   if(app.parsedCommand)
   {
      delete (void *)app.argv;
      delete app.parsedCommand;
   }
}

static bool Module_Constructor(Module module)
{
   module.privateNameSpace.classes.CompareKey = (void *)BinaryTree::CompareString;
   module.privateNameSpace.defines.CompareKey = (void *)BinaryTree::CompareString;
   module.privateNameSpace.functions.CompareKey = (void *)BinaryTree::CompareString;
   module.privateNameSpace.nameSpaces.CompareKey = (void *)BinaryTree::CompareString;

   module.publicNameSpace.classes.CompareKey = (void *)BinaryTree::CompareString;
   module.publicNameSpace.defines.CompareKey = (void *)BinaryTree::CompareString;
   module.publicNameSpace.functions.CompareKey = (void *)BinaryTree::CompareString;
   module.publicNameSpace.nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
   return true;
}

static void Module_Destructor(Module module)
{
   Class _class;
   DefinedExpression def;
   GlobalFunction function;
   Module m;
   SubModule handle;

   // printf("Destructing module %s\n", module.name);

   // Take out references from all modules
   for(m = module.application.allModules.first; m; m = m.next)
   {
      SubModule next;
      for(handle = m.modules.first; handle; handle = next)
      {
         next = handle.next;
         if(handle.module == module)
            m.modules.Delete(handle);
      }
   }

   if(module.Unload)
   {
      if(module.origImportType == staticImport)
      {
         bool (* Unload)(Module module) = (void *)module.Unload;
         Unload(module);
      }
      else
      {
         bool (stdcall * Unload)(Module module) = (void *)module.Unload;
         Unload(module);
      }
   }

   // Unload dependencies
   {
      Module ourWorld = class(Class).module;
      void * ourHandle = null;
      while((handle = module.modules.last))  // STARTING WITH LAST SO THAT ecereCOM IS UNLOADED LAST...
      {
         Module depModule = handle.module;
         if(depModule == ourWorld)
         {
            module.modules.Remove(handle);
            ourHandle = handle;
         }
         else
         {
            module.modules.Delete(handle);
            delete depModule;
         }
      }
      if(ourHandle)
      {
         delete ourHandle;
         delete ourWorld;
      }
   }

   // Unload classes
   for(;(_class = module.classes.first);)
   {
      if(_class.nameSpace)
      {
         BTNamedLink classLink = (BTNamedLink)_class.nameSpace->classes.FindString(_class.name);
         if(classLink)
         {
            OldLink t;
            for(t = _class.templatized.first; t; t = t.next)
            {
               Class template = t.data;
               BTNamedLink link;
               link = (BTNamedLink)template.nameSpace->classes.FindString(template.name);

               template.nameSpace->classes.Delete((BTNode)link);
               template.nameSpace = null;
            }
            _class.nameSpace->classes.Delete((BTNode)classLink);
         }
#ifdef _DEBUG
         else
         {
            printf("Warning: Could not find %s in namespace classes while destructing module %s\n", _class.name, module.name);
         }
#endif
         _class.nameSpace = null;
      }
      _class.module = null;
      module.classes.Remove(_class);
      if(_class.count <= 0 || _class.type != normalClass || _class.isInstanceClass)
         eClass_Unregister(_class);
      else
      {
#ifdef MEMINFO
         // printf("Delayed destruction of class %s\n", _class.name);
#endif
      }
   }

   // Unload defines
   for(;(def = module.defines.first);)
   {
      if(def.nameSpace)
      {
         BTNamedLink defLink;
         for(defLink = (BTNamedLink)def.nameSpace->defines.first; defLink; defLink = (BTNamedLink)((BTNode)defLink).next)
            if(defLink.data == def)
            {
               def.nameSpace->defines.Delete((BTNode)defLink);
               break;
            }
      }
      delete (void *)def.name;
      delete (void *)def.value;
      module.defines.Delete(def);
   }

   // Unload functions
   for(;(function = module.functions.first);)
   {
      if(function.nameSpace)
      {
         BTNamedLink functionLink;
         for(functionLink = (BTNamedLink)function.nameSpace->functions.first; functionLink; functionLink = (BTNamedLink)((BTNode)functionLink).next)
            if(functionLink.data == function)
            {
               function.nameSpace->functions.Delete((BTNode)functionLink);
               break;
            }
      }
      delete (void *)function.name;
      delete (void *)function.dataTypeString;
      module.functions.Delete(function);
   }

   delete (void *)module.name;

   NameSpace_Free(module.privateNameSpace);
   NameSpace_Free(module.publicNameSpace);

   if(module != module.application)
      module.application.allModules.Remove(module);
   else
      NameSpace_Free(module.application.systemNameSpace);

#ifndef MEMINFO
   Instance_Module_Free(module.library);
#endif
}

static int64 GetEnumSize(Class _class)
{
   EnumClassData data = (EnumClassData)_class.data;
   return data.largest+1;
}

#if defined(__GNUC__)
#define strcmpi strcasecmp
#define strnicmp strncasecmp
#endif

#if defined(ECERE_BOOTSTRAP) || (defined(__GNUC__) && !defined(__DJGPP__) && !defined(__WIN32__) && !defined(__EMSCRIPTEN__))
#undef strlwr
#undef strupr
default dllexport char * strlwr(char *string)
{
   int c;
   for(c=0; string[c]; c++)
      if(string[c]>='A' && string[c]<='Z')
         string[c]+='a'-'A';
   return string;
}
default dllexport char * strupr(char *string)
{
   int c;
   for(c=0; string[c]; c++)
      if(string[c]>='a' && string[c]<='z')
         string[c]-='a'-'A';
   return string;
}
#endif

public dllexport DefinedExpression eSystem_RegisterDefine(const char * name, const char * value, Module module, AccessMode declMode)
{
   NameSpace * nameSpace = null;

   int start = 0, c;

   nameSpace = (declMode == publicAccess) ? &module.publicNameSpace : &module.privateNameSpace;
   if(declMode == baseSystemAccess) nameSpace = &module.application.systemNameSpace;

   if(declMode != staticAccess)
   {
      for(c = 0; name[c]; c++)
      {
         if(name[c] == '.' || (name[c] == ':' && name[c+1] == ':'))
         {
            NameSpace * newSpace;

            char * spaceName = _malloc(c - start + 1);
            strncpy(spaceName, name + start, c - start);
            spaceName[c-start] = '\0';

            newSpace = (NameSpace *)nameSpace->nameSpaces.FindString(spaceName);
            if(!newSpace)
            {
               newSpace = new0 NameSpace[1];
               newSpace->classes.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->defines.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->functions.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->name = spaceName;
               newSpace->parent = nameSpace;
               nameSpace->nameSpaces.Add((BTNode)newSpace);
            }
            else
               delete spaceName;
            nameSpace = newSpace;
            if(name[c] == ':') c++;
            start = c+1;
         }
      }
   }
   else
      c = (int)strlen(name);

   if(c - start && !nameSpace->defines.FindString(name + start))
   {
      DefinedExpression def
      {
         name = CopyString(name);
         nameSpace = nameSpace;
         value = CopyString(value);
      };
      nameSpace->defines.Add((BTNode)BTNamedLink { name = def.name + start, data = def });
      // Reference the definition in the module
      module.defines.Add(def);
      return def;
   }
   return null;
}

public dllexport GlobalFunction eSystem_RegisterFunction(const char * name, const char * type, void * func, Module module, AccessMode declMode)
{
   NameSpace * nameSpace = null;
   int start = 0, c;

   nameSpace = (declMode == publicAccess) ? &module.publicNameSpace : &module.privateNameSpace;
   if(declMode == baseSystemAccess) nameSpace = &module.application.systemNameSpace;

   if(declMode != staticAccess)
   {
      for(c = 0; name[c]; c++)
      {
         if(name[c] == '.' || (name[c] == ':' && name[c+1] == ':'))
         {
            NameSpace * newSpace;

            char * spaceName = _malloc(c - start + 1);
            strncpy(spaceName, name + start, c - start);
            spaceName[c-start] = '\0';

            newSpace = (NameSpace *)nameSpace->nameSpaces.FindString(spaceName);
            if(!newSpace)
            {
               newSpace = new0 NameSpace[1];
               newSpace->classes.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->defines.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->functions.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
               newSpace->name = spaceName;
               newSpace->parent = nameSpace;
               nameSpace->nameSpaces.Add((BTNode)newSpace);
            }
            else
               delete spaceName;
            nameSpace = newSpace;
            if(name[c] == ':') c++;
            start = c+1;
         }
      }
   }
   else
      c = (int)strlen(name);

   if(c - start && !nameSpace->functions.FindString(name + start))
   {
      GlobalFunction function
      {
         name = CopyString(name);
         nameSpace = nameSpace;
         dataTypeString = CopyString(type);
         function = func;
         module = module;
      };
      nameSpace->functions.Add((BTNode)BTNamedLink { name = function.name + start, data = function });
      // Reference the definition in the module
      module.functions.Add(function);
      return function;
   }
   return null;
}

public dllexport DefinedExpression eSystem_FindDefine(Module module, const char * name)
{
   if(name && module)
   {
      BTNamedLink link;
      link = SearchNameSpace(&module.application.systemNameSpace, name, &((NameSpace *)0)->defines);
      if(link) return link.data;

      link = SearchModule(module, name, &((NameSpace *)0)->defines, true);
      if(link) return link.data;
   }
   return null;
}

public dllexport GlobalFunction eSystem_FindFunction(Module module, const char * name)
{
   if(name && module)
   {
      BTNamedLink link;
      link = SearchNameSpace(&module.application.systemNameSpace, name, &((NameSpace *)0)->functions);
      if(link) return link.data;

      link = SearchModule(module, name, &((NameSpace *)0)->functions, true);
      if(link) return link.data;
   }
   return null;
}

public dllexport void * eSystem_Renew(void * memory, unsigned int size)
{
   return _realloc(memory, size);
}

public dllexport void * eSystem_Renew0(void * memory, unsigned int size)
{
   return _crealloc(memory, size);
}

public dllexport void * eSystem_New(unsigned int size)
{
/*#ifdef _DEBUG
   void * pointer = _malloc(size);
   memset(pointer, 0xec, size);
   return pointer;
#else*/
   return _malloc(size);
//#endif
}

public dllexport void * eSystem_New0(unsigned int size)
{
   return _calloc(1,size);
}

public dllexport void eSystem_Delete(void * memory)
{
   if(memory)
      _free(memory);
}

// Properties
public dllexport void eInstance_FireSelfWatchers(Instance instance, Property _property)
{
   if(instance && _property && _property.selfWatchable)
   {
      Class _class;
      for(_class = instance._class; _class; _class = _class.base)
      {
         SelfWatcher selfWatcher, next;
         for(selfWatcher = _class.selfWatchers.first; selfWatcher; selfWatcher = next)
         {
            next = selfWatcher.next;
            if(selfWatcher._property == _property)
               selfWatcher.callback(instance);
         }
      }
   }
}

public dllexport void eInstance_FireWatchers(Instance instance, Property _property)
{
   if(instance && _property && _property.isWatchable)
   {
      Module module = instance._class ? instance._class.module : null;
      Application application = module ? module.application : null;
      int flags = application ? application.isGUIApp : 0;
      bool inCompiler = (flags & 8) ? true : false;
      bool force32Bits = (flags & 4) ? true : false;
      if(!force32Bits || !inCompiler)
      {
         OldList * watchers = (OldList *)((byte *)instance + _property.watcherOffset);
         Watcher watcher, next;

         for(watcher = watchers->first; watcher; watcher = next)
         {
            next = watcher.next;
            watcher.callback(watcher.object, instance);
         }
      }
   }
}

public dllexport void eProperty_Watchable(Property _property)
{
   if(!_property.isWatchable)
   {
      Class _class = _property._class;
      if(!_class.computeSize)
      {
         _property.watcherOffset = _class.structSize;
         _class.structSize += sizeof(OldList);

         // highly inefficient
         FixDerivativesBase(_class, _class);
      }
      _property.isWatchable = true;
   }
}

public dllexport void eClass_DestructionWatchable(Class _class)
{
   if(!_class.destructionWatchOffset)
   {
      _class.destructionWatchOffset = _class.structSize;
      _class.structSize += sizeof(OldList);
      // highly inefficient
      FixDerivativesBase(_class, _class);
   }
}

public dllexport void eProperty_SelfWatch(Class _class, const char * name, void (*callback)(void *))
{
   if(_class)
   {
      Property _property = eClass_FindProperty(_class, name, _class.module);

      if(!_property)
         _property = eClass_AddProperty(_class, name, null, null, null, baseSystemAccess /*privateAccess*/);
      _class.selfWatchers.Add(SelfWatcher { _property = _property, callback = callback });
      _property.selfWatchable = true;
   }
}

public dllexport void eInstance_Watch(Instance instance, Property _property, void * object, void (*callback)(void *, void *))
{
   if(_property.isWatchable)
   {
      OldList * watchers = (OldList *)((byte *)instance + _property.watcherOffset);
      watchers->Add(Watcher { callback = callback, object = object });
   }
}

public dllexport void eInstance_WatchDestruction(Instance instance, Instance object, void (*callback)(void *, void *))
{
   OldList * watchers = (OldList *)((byte *)instance + instance._class.destructionWatchOffset);
   watchers->Add(Watcher { callback = callback, object = object });
}

public dllexport void eInstance_StopWatching(Instance instance, Property _property, Instance object)
{
   if(instance && (!_property || _property.isWatchable))
   {
      if(_property)
      {
         OldList * watchers = (OldList *)((byte *)instance + _property.watcherOffset);
         Watcher watcher;
         for(watcher = watchers->first; watcher; watcher = watcher.next)
            if(watcher.object == object)
            {
               watchers->Delete(watcher);
               break;
            }
      }
      else
      {
         // Stop watching all properties as well as destruction
         Class _class, base;
         for(_class = instance._class; _class; _class = base)
         {
            if(_class.destructionWatchOffset)
            {
               OldList * watchers = (OldList *)((byte *)instance + _class.destructionWatchOffset);
               Watcher watcher;

               for(watcher = watchers->first; watcher; watcher = watcher.next)
               {
                  watchers->Delete(watcher);
                  break;
               }
            }
            for(_property = (Property)_class.membersAndProperties.first; _property; _property = _property.next)
            {
               if(_property.isProperty && _property.isWatchable)
               {
                  OldList * watchers = (OldList *)((byte *)instance + _property.watcherOffset);
                  Watcher watcher;
                  for(watcher = watchers->first; watcher; watcher = watcher.next)
                     if(watcher.object == object)
                     {
                        watchers->Delete(watcher);
                        break;
                     }
               }
            }
            base = _class.base;
            if(base && (base.type == systemClass || base.isInstanceClass)) base = null;
         }
      }
   }
}

public dllexport subclass(ClassDesignerBase) eClass_GetDesigner(Class _class)
{
   for(;_class;_class = _class.base)
   {
      if(_class.designerClass)
         return (subclass(ClassDesignerBase))eSystem_FindClass(_class.module, _class.designerClass);
   }
   return null;
}


public dllexport subclass(ClassDesignerBase) eInstance_GetDesigner(Instance instance)
{
   if(instance)
      return eClass_GetDesigner(instance._class);
   return null;
}

public bool LocateModule(const char * name, const char * fileName)
{
   return Instance_LocateModule(name, fileName);
}

/*
#if (defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__) || defined(_M_X64) || defined(_WIN64) || defined(__LP64__) || defined(__LLP64__)
#define _64BIT 1
#else
#define _64BIT 0
#endif

#define arch_PointerSize                  sizeof(void *)
#define structSize_Instance               (_64BIT ? 24 : 12)
#define structSize_Module                 (_64BIT ? 560 : 300)
#define structSize_BinaryTree             (_64BIT ? 32 : 16)
#define structSize_OldList                (_64BIT ? 32 : 20)
#define structSize_NamedLink64            (_64BIT ? 32 : 24)
#define structSize_ClassTemplateArgument  (_64BIT ? 16 : 8)
#define structSize_ClassTemplateParameter (_64BIT ? 64 : 40)
#define structSize_OldLink                (_64BIT ? 24 : 12)
#define structSize_BTNamedLink            (_64BIT ? 48 : 24)
#define structSize_Application            (_64BIT ? 800 : 428)
#define structSize_Watcher                (_64BIT ? 32 : 16)
#define structSize_SelfWatcher            (_64BIT ? 32 : 16)
#define structSize_GlobalFunction         (_64BIT ? 72 : 36)
#define structSize_DefinedExpression      (_64BIT ? 40 : 20)
#define structSize_BitMember              (_64BIT ? 96 : 64)
#define structSize_DataMember             (_64BIT ? 160 : 96)
#define structSize_ClassProperty          (_64BIT ? 80 : 40)
#define structSize_Method                 (_64BIT ? 96 : 52)
#define structSize_Property               (_64BIT ? 152 : 88)
#define structSize_Class                  (_64BIT ? 624 : 376)
*/

static void LoadCOM(Module module)
{
   bool force64Bits = (module.application.isGUIApp & 2) ? true : false;
   bool force32Bits = (module.application.isGUIApp & 4) ? true : false;
   bool inCompiler = (module.application.isGUIApp & 8) ? true : false;
   int pointerSize = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);
   Class applicationClass;
   Class enumClass, structClass, boolClass;
   Class moduleClass;

   // Create Base Class
   Class baseClass = eSystem_RegisterClass(normalClass, "class", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   baseClass.type = systemClass;
   baseClass.memberOffset = 0;
   baseClass.offset = 0;
   baseClass.structSize = 0;
   baseClass.typeSize = 0;

   {
      Class instanceClass = eSystem_RegisterClass(normalClass, "ecere::com::Instance", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
      instanceClass.type = normalClass;
      instanceClass.isInstanceClass = true;
      instanceClass.fixed = true;
      instanceClass.memberOffset = 0;
      instanceClass.offset = 0;

      instanceClass.memberID = -3;
      instanceClass.startMemberID = -3;

      eClass_AddDataMember(instanceClass, "_vTbl", "void **", pointerSize, pointerSize, publicAccess);
      eClass_AddDataMember(instanceClass, "_class", "ecere::com::Class", pointerSize, pointerSize, publicAccess);
      eClass_AddDataMember(instanceClass, "_refCount", "int", sizeof(int), sizeof(int), publicAccess);
   }

   InitializeDataTypes1(module);

   // Create Enum class
   enumClass = eSystem_RegisterClass(normalClass, "enum", null, 0, force64Bits ? 40 : sizeof(class EnumClassData), null, null, module, baseSystemAccess, publicAccess);
   eClass_AddClassProperty(enumClass, "enumSize", "int", null, GetEnumSize).constant = true;
   enumClass.type = systemClass;

   delete (void *)enumClass.dataTypeString;
   enumClass.dataTypeString = CopyString(/*"unsigned int"*/"int");

   // Create Struct (simple) class
   //structClass = eSystem_RegisterClass(structClass, "struct", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   structClass = eSystem_RegisterClass(normalClass, "struct", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   structClass.type = systemClass;
   structClass.memberOffset = 0;
   structClass.offset = 0;
   structClass.structSize = 0;
   structClass.typeSize = 0;

   //eClass_AddMethod(enumClass, "AddValue", "int()", eEnum_AddValue);
   //eClass_AddMethod(enumClass, "AddFixedValue", "void()", eEnum_AddFixedValue);

   InitializeDataTypes(module);

   // Create bool class
   boolClass = eSystem_RegisterClass(ClassType::enumClass, "bool", "uint", 0, 0, null, null, module, baseSystemAccess, publicAccess);
   eEnum_AddFixedValue(boolClass, "true",  bool::true);
   eEnum_AddFixedValue(boolClass, "false", bool::false);

   // Create Module class
   moduleClass = eSystem_RegisterClass(normalClass, "ecere::com::Module", null, force64Bits ? 8 + 32 + 32 + 32 + 32 + 8 + 8 + 8 + 8 + 8 + 4 + 4 + (32 + 8 + 8 + 4*32) + (32 + 8 + 8 + 4*32) :
                                                                                sizeof(struct Module), 0, (void *)Module_Constructor, (void *)Module_Destructor, module, baseSystemAccess, publicAccess);
   eClass_AddVirtualMethod(moduleClass, "OnLoad", "bool()", null, publicAccess);
   eClass_AddVirtualMethod(moduleClass, "OnUnload", "void()", null, publicAccess);
   eClass_AddMethod(moduleClass, "Load", "Module(const char * name, AccessMode importAccess)", eModule_Load, publicAccess);
   eClass_AddMethod(moduleClass, "Unload", "void(Module module)", eModule_Unload, publicAccess);
   eClass_AddDataMember(moduleClass, "application", "Application", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "classes", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(OldList), pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "defines", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(OldList), pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "functions", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(OldList), pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "modules", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(OldList), pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "prev", "Module", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "next", "Module", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "name", "const char *", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "library", "void *", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "Unload", "void *", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "importType", "ImportType", sizeof(ImportType), 4, publicAccess);
   eClass_AddDataMember(moduleClass, "origImportType", "ImportType", sizeof(ImportType), 4, publicAccess);
   eClass_AddDataMember(moduleClass, "privateNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4*32) : force32Bits ? (16 + 4 + 4 + 4*16) : sizeof(NameSpace), pointerSize, publicAccess);
   eClass_AddDataMember(moduleClass, "publicNameSpace", "NameSpace",  force64Bits ? (32 + 8 + 8 + 4*32) : force32Bits ? (16 + 4 + 4 + 4*16) : sizeof(NameSpace), pointerSize, publicAccess);
   moduleClass.fixed = true;
   moduleClass.count++;
   if(inCompiler && force32Bits)
      moduleClass.structSize = 12 + 4 + 20 + 20 + 20 + 20 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + (16 + 4 + 4 + 4*16) + (16 + 4 + 4 + 4*16);

   // Create Application class
   applicationClass = eSystem_RegisterClass(normalClass, "ecere::com::Application", "Module", force64Bits ? (8+8+4+4 + 32 + 8 + 176) : sizeof(struct Application), 0, null, (void *)Application_Destructor, module, baseSystemAccess, publicAccess);
   if(inCompiler && force32Bits)
   {
      applicationClass.offset = 12 + 4 + 20 + 20 + 20 + 20 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + (16 + 4 + 4 + 4*16) + (16 + 4 + 4 + 4*16);
      applicationClass.structSize = applicationClass.offset + (4+4+4+4 + 20 + 4 + 88);
   }
   eClass_AddVirtualMethod(applicationClass, "Main", "void()", DefaultFunction, publicAccess);
   eClass_AddDataMember(applicationClass, "argc", "int", sizeof(int), 4, publicAccess);
   eClass_AddDataMember(applicationClass, "argv", "const char **", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(applicationClass, "exitCode", "int", sizeof(int), 4, publicAccess);
   eClass_AddDataMember(applicationClass, "isGUIApp", "bool", sizeof(bool), 4, publicAccess);
   eClass_AddDataMember(applicationClass, "allModules", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(OldList), pointerSize, publicAccess);
   eClass_AddDataMember(applicationClass, "parsedCommand", "char *", pointerSize, pointerSize, publicAccess);
   eClass_AddDataMember(applicationClass, "systemNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4*32) : force32Bits ? (16 + 4 + 4 + 4*16) : sizeof(NameSpace), pointerSize, publicAccess);
   applicationClass.fixed = true;
   applicationClass.count++;

   //AttachConsole(-1);
   //AllocConsole();

   // --- Math ---
   eSystem_RegisterFunction("sin", "double sin(Angle number)", sin, module, baseSystemAccess);
   eSystem_RegisterFunction("sinh", "double sinh(Angle number)", sinh, module, baseSystemAccess);
   eSystem_RegisterFunction("cosh", "double cosh(Angle number)", cosh, module, baseSystemAccess);
   eSystem_RegisterFunction("tanh", "double tanh(Angle number)", tanh, module, baseSystemAccess);
   eSystem_RegisterFunction("sqrt", "double sqrt(double number)", sqrt, module, baseSystemAccess);
   eSystem_RegisterFunction("cos", "double cos(Angle number)", cos, module, baseSystemAccess);
   eSystem_RegisterFunction("tan", "double tan(Angle number)", tan, module, baseSystemAccess);
   eSystem_RegisterFunction("atan2", "Angle atan2(double y, double x)", atan2, module, baseSystemAccess);
   eSystem_RegisterFunction("asin", "Angle asin(double number)", asin, module, baseSystemAccess);
   eSystem_RegisterFunction("acos", "Angle acos(double number)", acos, module, baseSystemAccess);
   eSystem_RegisterFunction("atan", "Angle atan(double number)", atan, module, baseSystemAccess);
   eSystem_RegisterFunction("asinh", "Angle asinh(double number)", asinh, module, baseSystemAccess);
   eSystem_RegisterFunction("acosh", "Angle acosh(double number)", acosh, module, baseSystemAccess);
   eSystem_RegisterFunction("atanh", "Angle atanh(double number)", atanh, module, baseSystemAccess);
   eSystem_RegisterFunction("pow", "double pow(double number, double number2)", pow, module, baseSystemAccess);
   eSystem_RegisterFunction("fmod", "double fmod(double x, double y)", fmod, module, baseSystemAccess);
   eSystem_RegisterFunction("fabs", "double fabs(double number)", fabs, module, baseSystemAccess);
   eSystem_RegisterFunction("log", "double log(double number)", log, module, baseSystemAccess);
   eSystem_RegisterFunction("log10", "double log10(double number)", log10, module, baseSystemAccess);
   eSystem_RegisterFunction("ceil", "double ceil(double number)", ceil, module, baseSystemAccess);
   eSystem_RegisterFunction("floor", "double floor(double number)", floor, module, baseSystemAccess);
   eSystem_RegisterFunction("exp", "double exp(double number)", exp, module, baseSystemAccess);

   // --- Stdlib ---
   eSystem_RegisterFunction("qsort", "void qsort(void *, uintsize, uintsize, int (*)(void *, void *))", qsort, module, baseSystemAccess);
   eSystem_RegisterFunction("strtod", "double strtod(const char*, char**)", strtod, module, baseSystemAccess);
   eSystem_RegisterFunction("strtol", "int strtol(const char*, char**, int base)", strtol, module, baseSystemAccess);
   eSystem_RegisterFunction("strtoul", "unsigned long strtoul(const char * nptr, char ** endptr, int base)", strtoul, module, baseSystemAccess);
   eSystem_RegisterFunction("strtoll", "int64 strtoll(const char * nptr, char ** endptr, int base)", strtoll, module, baseSystemAccess);
   eSystem_RegisterFunction("strtoull", "uint64 strtoull(const char * nptr, char ** endptr, int base)", strtoull, module, baseSystemAccess);
   eSystem_RegisterFunction("system", "int system(const char*)", system, module, baseSystemAccess);
   eSystem_RegisterFunction("atoi", "int atoi(const char*)", atoi, module, baseSystemAccess);
   eSystem_RegisterFunction("atof", "double atof(const char*)", atof, module, baseSystemAccess);
   eSystem_RegisterFunction("memset", "void * memset(void * area, int value, uintsize count)", memset, module, baseSystemAccess);
   eSystem_RegisterFunction("getenv", "char * getenv(const char * name)", getenv, module, baseSystemAccess);
   eSystem_RegisterFunction("rename", "int rename(const char *oldpath, const char *newpath)", rename, module, baseSystemAccess);

   // --- String --- (These might move to the string class)
   eSystem_RegisterFunction("strlen", "uintsize strlen(const char *)", strlen, module, baseSystemAccess);
   eSystem_RegisterFunction("strcat", "char * strcat(char *, const char *)", strcat, module, baseSystemAccess);
   eSystem_RegisterFunction("strncat", "char * strncat(char *, const char *, uintsize n)", strncat, module, baseSystemAccess);
   eSystem_RegisterFunction("strchr", "char * strchr(const char *, int)", strchr, module, baseSystemAccess);
   eSystem_RegisterFunction("strstr", "char * strstr(const char *, const char *)", strstr, module, baseSystemAccess);
   eSystem_RegisterFunction("strspn", "uintsize strspn(const char *, const char *)", strspn, module, baseSystemAccess);
   eSystem_RegisterFunction("strcspn", "uintsize strcspn(const char *, const char *)", strcspn, module, baseSystemAccess);
   eSystem_RegisterFunction("strpbrk", "char * strpbrk(const char *, const char *)", strpbrk, module, baseSystemAccess);

   eSystem_RegisterDefine("fstrcmp", "(__runtimePlatform == win32) ? strcmpi : strcmp", module, baseSystemAccess);

//#if defined(__GNUC__)
   eSystem_RegisterDefine("strcmpi", "strcasecmp", module, baseSystemAccess);
   eSystem_RegisterDefine("strnicmp", "strncasecmp", module, baseSystemAccess);
   eSystem_RegisterFunction("strcasecmp", "int strcasecmp(const char *, const char *)", strcmpi, module, baseSystemAccess);
   eSystem_RegisterFunction("strncasecmp", "int strncasecmp(const char *, const char *, uintsize n)", strnicmp, module, baseSystemAccess);
/*
#else
   eSystem_RegisterDefine("strcasecmp", "strcmpi", module, baseSystemAccess);
   eSystem_RegisterDefine("strncasecmp", "strnicmp", module, baseSystemAccess);
   eSystem_RegisterFunction("strcmpi", "int strcmpi(const char *, const char *)", strcmpi, module, baseSystemAccess);
   eSystem_RegisterFunction("strnicmp", "int strnicmp(const char *, const char *, int n)", strnicmp, module, baseSystemAccess);
#endif
*/

   eSystem_RegisterFunction("strcmp", "int strcmp(const char *, const char *)", strcmp, module, baseSystemAccess);
   eSystem_RegisterFunction("strncmp", "int strncmp(const char *, const char *, uintsize n)", strncmp, module, baseSystemAccess);
   eSystem_RegisterFunction("strlwr", "char * strlwr(char *)", strlwr, module, baseSystemAccess);
   eSystem_RegisterFunction("strupr", "char * strupr(char *)", strupr, module, baseSystemAccess);
   eSystem_RegisterFunction("strcpy", "char * strcpy(char *, const char *)", strcpy, module, baseSystemAccess);
   eSystem_RegisterFunction("strncpy", "char * strncpy(char *, const char *, uintsize n)", strncpy, module, baseSystemAccess);
   eSystem_RegisterFunction("memcpy", "void * memcpy(void *, const void *, uintsize size)", memcpy, module, baseSystemAccess);
   eSystem_RegisterFunction("memmove", "void * memmove(void *, const void *, uintsize size)", memmove, module, baseSystemAccess);
   eSystem_RegisterFunction("memcmp", "int memcmp(const void *, const void *, uintsize size)", memcmp, module, baseSystemAccess);

   // --- Stdio ---
   eSystem_RegisterFunction("sprintf", "int sprintf(char *, const char *, ...)", sprintf, module, baseSystemAccess);
   eSystem_RegisterFunction("snprintf", "int snprintf(char *, uintsize, const char *, ...)", snprintf, module, baseSystemAccess);
   eSystem_RegisterFunction("printf", "int printf(const char *, ...)", printf, module, baseSystemAccess);
   eSystem_RegisterFunction("vsprintf", "int vsprintf(char*, const char*, __builtin_va_list)", vsprintf, module, baseSystemAccess);
   eSystem_RegisterFunction("vsnprintf", "int vsnprintf(char*, uintsize, const char*, __builtin_va_list)", vsnprintf, module, baseSystemAccess);
   eSystem_RegisterFunction("puts", "int puts(const char *)", puts, module, baseSystemAccess);
   eSystem_RegisterFunction("fputs", "int fputs(const char *, void * stream)", fputs, module, baseSystemAccess);

   // --- Ctype ---
   eSystem_RegisterFunction("tolower", "int tolower(int)", tolower, module, baseSystemAccess);
   eSystem_RegisterFunction("toupper", "int toupper(int)", toupper, module, baseSystemAccess);
   eSystem_RegisterFunction("isdigit", "bool isdigit(int)", isdigit, module, baseSystemAccess);
   eSystem_RegisterFunction("isxdigit","bool isxdigit(int)", isxdigit, module, baseSystemAccess);
   eSystem_RegisterFunction("isalnum", "int isalnum(int c)", isalnum, module, baseSystemAccess);
   eSystem_RegisterFunction("isspace", "int isspace(int c)", isspace, module, baseSystemAccess);
   eSystem_RegisterFunction("isalpha", "int isalpha(int c)", isalpha, module, baseSystemAccess);
   eSystem_RegisterFunction("islower", "int islower(int c)", islower, module, baseSystemAccess);
   eSystem_RegisterFunction("isupper", "int isupper(int c)", isupper, module, baseSystemAccess);
   eSystem_RegisterFunction("isprint", "int isprint(int c)", isprint, module, baseSystemAccess);
   eSystem_RegisterFunction("isblank", "int isblank(int c)", isblank, module, baseSystemAccess);
}

public dllexport Application __ecere_COM_Initialize(bool guiApp, int argc, char * argv[])
{
   Application app;

#ifdef EMSCRIPTEN_DEBUG
   emscripten_log(EM_LOG_CONSOLE, "__ecere_COM_Initialize\n");
#endif

#ifdef __ANDROID__
   // Clean up global variables
#if !defined(DISABLE_MEMMGR)
   memoryInitialized = false;
   pools = null;
#endif

#ifdef MEMINFO
   memset(&memStacks, 0, sizeof(BinaryTree));
   memoryErrorsCount = 0;
   memset(&memBlocks, 0, sizeof(BinaryTree));
   recurse = false;
   blockID = 0;
   allocateClass = null;
   allocateInternal = false;
   TOTAL_MEM = 0;
   OUTSIDE_MEM = 0;
#endif
#endif

#ifdef _DEBUG
   // printf("Using debug ecere runtime library\n");
#endif
   app = _calloc(1, sizeof(class Application));

   Module_Constructor(app);
   app.systemNameSpace.classes.CompareKey = (void *)BinaryTree::CompareString;
   app.systemNameSpace.defines.CompareKey = (void *)BinaryTree::CompareString;
   app.systemNameSpace.functions.CompareKey = (void *)BinaryTree::CompareString;
   app.systemNameSpace.nameSpaces.CompareKey = (void *)BinaryTree::CompareString;

   Instance_COM_Initialize(argc, argv, &app.parsedCommand, &app.argc, &app.argv);

   app.application = app;
   app.allModules.offset = sizeof(class Instance) + (uint)(uintptr)&((struct Module *)0)->prev;
   app.isGUIApp = guiApp;

   LoadCOM(app);

   app._class = eSystem_FindClass(app, "Application");

   return app;
}

public dllexport void eSystem_SetArgs(Application app, int argc, char * argv[])
{
   System_SetArgs(argc, argv, &app.argc, &app.argv);
}

public dllexport ClassTemplateParameter eClass_AddTemplateParameter(Class _class, const char * name, TemplateParameterType type, const void * info, ClassTemplateArgument defaultArg)
{
   if(_class && name)
   {
      ClassTemplateParameter param;

      for(param = _class.templateParams.first; param; param = param.next)
      {
         if(!strcmp(param.name, name))
            return param;
      }
      param =
      {
         name = CopyString(name);
         type = type;
         (type == identifier) ? info : CopyString(info);
      };

      {
         Class c = eSystem_FindClass(_class.module, name);
         if(c && c.internalDecl)
         {
            c.module.classes.Remove(c);
            eClass_Unregister(c);
         }
      }
      if(defaultArg != null)
      {
         param.defaultArg = defaultArg;
         CopyTemplateArg(param, param.defaultArg);
      }
      _class.templateParams.Add(param);
      return param;
   }
   return null;
}

public dllexport void eClass_DoneAddingTemplateParameters(Class base)
{
   if(base)
   {
      ClassTemplateParameter param;
      {
         void * first = base.templateParams.first;
         int count = base.templateParams.count;

         FreeTemplateArgs(base);
         delete base.templateArgs;

         base.templateParams.first = null;
         base.templateParams.count = 0;

         FreeTemplatesDerivatives(base);

         base.templateParams.first = first;
         base.templateParams.count = count;
      }

      for(param = base.templateParams.first; param; param = param.next)
      {
         if(param.type == identifier && param.defaultArg.memberString)
         {
            Class memberClass = base;
            const char * colon = strstr(param.defaultArg.memberString, "::");
            const char * memberName;
            if(colon)
            {
               char className[1024];
               Class sClass;

               memcpy(className, param.defaultArg.memberString, colon - param.defaultArg.memberString);
               className[colon - param.defaultArg.memberString] = '\0';
               memberName = colon + 2;

               for(sClass = base; sClass; sClass = sClass.base)
               {
                  ClassTemplateParameter cParam;
                  Class nextClass;
                  int id = 0;
                  for(nextClass = sClass.base; nextClass; nextClass = nextClass.base) id += nextClass.templateParams.count;
                  // Safety! What could cause base.templateArgs to be null?
                  if(sClass == base || base.templateArgs)
                  {
                     for(cParam = sClass.templateParams.first; cParam; cParam = cParam.next)
                     {
                        if(cParam.type == type && !strcmp(cParam.name, className))
                           strcpy(className, (sClass == base) ? cParam.defaultArg.dataTypeString : base.templateArgs[id].dataTypeString);
                        id++;
                     }
                  }
               }
               memberClass = eSystem_FindClass(base.module, className);
               if(!memberClass)
                  memberClass = eSystem_FindClass(base.module.application, className);
            }
            else
               memberName = param.defaultArg.memberString;

            if(memberClass)
            {
               switch(param.memberType)
               {
                  case dataMember:
                     param.defaultArg.member = eClass_FindDataMember(memberClass, memberName, memberClass.module, null, null);
                     break;
                  case method:
                     param.defaultArg.method = eClass_FindMethod(memberClass, memberName, memberClass.module);
                     break;
                  case prop:
                     param.defaultArg.prop = eClass_FindProperty(memberClass, memberName, memberClass.module);
                     break;
               }
            }
         }
      }

      //ComputeClassParameters(base, null, null);

      FixDerivativesBase(base, base);
   }
}

static void FreeTemplatesDerivatives(Class base)
{
   OldLink derivative, templateLink;
   for(derivative = base.derivatives.first; derivative; derivative = derivative.next)
   {
      Class _class = derivative.data;
      if(_class.templateArgs)
      {
         FreeTemplateArgs(_class);
         delete _class.templateArgs;
      }
      FreeTemplatesDerivatives(_class);
   }

   for(templateLink = base.templatized.first; templateLink; templateLink = templateLink.next)
   {
      Class _class = templateLink.data;
      if(_class.templateArgs)
      {
         FreeTemplateArgs(_class);
         delete _class.templateArgs;
      }
      FreeTemplatesDerivatives(_class);
   }
}

static const char * platformNames[Platform] = { "", "win32", "linux", "apple" }; // how to have this be accessible outside of dll/lib
static const Platform firstPlatform = win32;
static const Platform lastPlatform = apple;

public enum Platform
{
   unknown, win32, tux, apple;

   property const char *
   {
      get { return OnGetString(null, null, null); }
      set
      {
         if(value)
         {
            Platform c;
            for(c = firstPlatform; c <= lastPlatform; c++)
               if(!strcmpi(value, platformNames[c]))
                  return c;
         }
         return unknown;
      }
   };

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(this >= firstPlatform && this <= lastPlatform)
      {
         if(tempString)
            strcpy(tempString, platformNames[this]);
         return platformNames[this];
      }
      if(tempString && tempString[0])
         tempString[0] = '\0';
      return null;
   }

   bool OnGetDataFromString(const char * string)
   {
      this = string;
      return this != unknown;
   }
};

default extern Platform runtimePlatform;

public Platform GetRuntimePlatform()
{
   return runtimePlatform;
}

namespace gui;

class Window;

namespace com;
// CLASS DESIGNER SUPPORT

public class ObjectInfo : struct
{
public:
   ObjectInfo prev, next;
   Instance instance;
   char * name;
   Instantiation instCode;
   bool deleted;
   ObjectInfo oClass;
   OldList instances;
   ClassDefinition classDefinition;
   bool modified;
   void * i18nStrings;
};

public class DesignerBase : Window
{
public:
   virtual bool FindObject(Instance * instance, const char * string);
   virtual void RenameObject(ObjectInfo object, const char * name);
   virtual void SelectObjectFromDesigner(ObjectInfo object);
   virtual void CodeAddObject(Instance instance, ObjectInfo * object);
   virtual void SheetAddObject(ObjectInfo object);
   virtual void AddToolBoxClass(Class _class);
   virtual void AddDefaultMethod(Instance instance, Instance classInstance);
   virtual void DeleteObject(ObjectInfo object);
   virtual bool ObjectContainsCode(ObjectInfo object);
   virtual void ModifyCode(void);
   virtual void UpdateProperties(void);

   ClassDesignerBase classDesigner;
   const char * objectClass;
   bool isDragging;

   // FIX THIS WITH PUBLIC:
   property ClassDesignerBase classDesigner
   {
      get { return classDesigner; }
      set { classDesigner = value; }
   };
   property const char * objectClass
   {
      get { return objectClass; }
      set { objectClass = value; }
   };
   property bool isDragging
   {
      get { return isDragging; }
      set { isDragging = value; }
   };
}

public class ClassDesignerBase : Window
{
public:
   virtual void Reset(void);
   virtual void AddObject(void);
   virtual void SelectObject(ObjectInfo object, Instance control);

   virtual void ListToolBoxClasses(DesignerBase designer);

   virtual void ::PrepareTestObject(DesignerBase designer, Instance test);
   virtual void ::CreateObject(DesignerBase designer, Instance instance, ObjectInfo object, bool isClass, Instance _class);
   virtual void ::PostCreateObject(Instance instance, ObjectInfo object, bool isClass, Instance _class);
   virtual void ::DroppedObject(Instance instance, ObjectInfo object, bool isClass, Instance _class);
   virtual void ::DestroyObject(Instance object);
   virtual void ::FixProperty(Property prop, Instance object);
   virtual void ::CreateNew(EditBox editBox, Size clientSize, const char * name, const char * inherit);
}

DesignerBase activeDesigner;

public void SetActiveDesigner(DesignerBase designer)
{
   activeDesigner = designer;
}

public DesignerBase GetActiveDesigner()
{
   return activeDesigner;
}


bool poolingDisabled;

public dllexport void eSystem_SetPoolingDisabled(bool disabled)
{
   poolingDisabled = disabled;
}

namespace sys;

// constants
define LEAD_OFFSET      = 0xD800 - (0x10000 >> 10);
define SURROGATE_OFFSET = 0x10000 - (0xD800 << 10) - 0xDC00;

default uint32 ccUtf8ToUnicode( uint32 byte, uint32 *state, unichar *retunicode ); // In String.ec`
static inline uint32 decodeUTF8( uint32 b, uint32 *state, unichar *retCodePoint ) { return ccUtf8ToUnicode(b, state, retCodePoint); }

public bool UTF8Validate(const char * source)
{
   if(source)
   {
      const byte * s = (const byte *)source;
      unichar codepoint;
      uint32 state = 0;
      while (*s)
         decodeUTF8(*s++, &state, &codepoint);
      return state == 0;
      /*
      int c;
      for(c = 0; source[c];)
      {
         byte ch = source[c];
         unichar codePoint = 0;
         int numBytes = 1;
         int i;
         byte mask = 0x7F;
         if(ch & 0x80)
         {
            if(ch & 0x40)
            {
               mask >>= 2;
               numBytes++;
               if(ch & 0x20)
               {
                  numBytes++;
                  mask >>= 1;
                  if(ch & 0x10)
                  {
                     if(ch & 0x08)
                        return false;
                     numBytes++;
                     mask >>= 1;
                  }
               }
            }
            else
               return false;
         }
         for(i = 0; i<numBytes && (ch = source[c]); i++, c++)
         {
            codePoint <<= 6;
            codePoint |= ch & mask;
            mask = 0x3F;
            if(i > 1)
            {
               if(!(ch & 0x80) || (ch & 0x40))
                  return false;
            }
         }
         if(i < numBytes) return false;

         if(codePoint > 0x10FFFF || (codePoint >= 0xD800 && codePoint <= 0xDFFF) ||
           (codePoint < 0x80 && numBytes > 1) ||
           (codePoint < 0x800 && numBytes > 2) ||
           (codePoint < 0x10000 && numBytes > 3))
            return false;
      }
      */
   }
   return true;
}

public int ISO8859_1toUTF8(const char * source, char * dest, int max)
{
   int c;
   int d = 0;
   byte * byteDest = (byte *)dest;
   for(c = 0; source[c]; c++)
   {
      unichar ch = ((byte *)source)[c];
      switch(ch)
      {
         case 128: ch = (unichar)0x20AC; break;
         case 130: ch = (unichar)0x201A; break;
         case 131: ch = (unichar)0x0192; break;
         case 132: ch = (unichar)0x201E; break;
         case 133: ch = (unichar)0x2026; break;
         case 134: ch = (unichar)0x2020; break;
         case 135: ch = (unichar)0x2021; break;
         case 136: ch = (unichar)0x02C6; break;
         case 137: ch = (unichar)0x2030; break;
         case 138: ch = (unichar)0x0160; break;
         case 139: ch = (unichar)0x2039; break;
         case 140: ch = (unichar)0x0152; break;
         case 142: ch = (unichar)0x017D; break;
         case 145: ch = (unichar)0x2018; break;
         case 146: ch = (unichar)0x2019; break;
         case 147: ch = (unichar)0x201C; break;
         case 148: ch = (unichar)0x201D; break;
         case 149: ch = (unichar)0x2022; break;
         case 150: ch = (unichar)0x2013; break;
         case 151: ch = (unichar)0x2014; break;
         case 152: ch = (unichar)0x02DC; break;
         case 153: ch = (unichar)0x2122; break;
         case 154: ch = (unichar)0x0161; break;
         case 155: ch = (unichar)0x203A; break;
         case 156: ch = (unichar)0x0153; break;
         case 158: ch = (unichar)0x017E; break;
         case 159: ch = (unichar)0x0178; break;
      }
      if(ch < 0x80)
      {
         if(d + 1 >= max) break;
         byteDest[d++] = (char)ch;
      }
      else if(ch < 0x800)
      {
         if(d + 2 >= max) break;
         byteDest[d++] = 0xC0 | (byte)((ch & 0x7C0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else if(ch < 0x10000)
      {
         if(d + 3 >= max) break;
         byteDest[d++] = 0xE0 | (byte)((ch & 0xF000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else
      {
         if(d + 4 >= max) break;
         byteDest[d++] = 0xF0 | (byte)((ch & 0x1C0000) >> 18);
         byteDest[d++] = 0x80 | (byte)((ch & 0x3F000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
   }
   dest[d] = 0;
   return d;
}

public char * UTF16toUTF8(const uint16 * source)
{
   int c;
   int d = 0;
   int len;
   byte * dest;
   uint16 u16;
   bool invert = false;

   for(len = 0; source[len]; len++);
   dest = new byte[len * 3 + 1];
   for(c = 0; (u16 = source[c]); c++)
   {
      unichar ch;
      if(!c && (u16 == 0xFFFE || u16 == 0xFEFF))
      {
         if(u16 == 0xFFFE) invert = true;
         continue;
      }
      if(invert) { u16 = ((u16 & 0xFF00) >> 8) | ((u16 & 0x00FF) << 8); }

      if(u16 < 0xD800 || u16 > 0xDBFF)
         ch = (unichar)u16;
      else
         ch = ((unichar)u16 << 10) + source[c++] + SURROGATE_OFFSET;

      if(ch < 0x80)
      {
         dest[d++] = (char)ch;
      }
      else if(ch < 0x800)
      {
         dest[d++] = 0xC0 | (byte)((ch & 0x7C0) >> 6);
         dest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else if(ch < 0x10000)
      {
         dest[d++] = 0xE0 | (byte)((ch & 0xF000) >> 12);
         dest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         dest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else
      {
         dest[d++] = 0xF0 | (byte)((ch & 0x1C0000) >> 18);
         dest[d++] = 0x80 | (byte)((ch & 0x3F000) >> 12);
         dest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         dest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
   }
   dest[d] = 0;
   dest = renew dest byte[d+1];
   return (char *)dest;
}

public int UTF16toUTF8Buffer(const uint16 * source, char * dest, int max)
{
   int c;
   int d = 0;
   uint16 u16;
   byte * byteDest = (byte *)dest;
   for(c = 0; (u16 = source[c]); c++)
   {
      unichar ch;
      if(u16 < 0xD800 || u16 > 0xDBFF)
         ch = (unichar)u16;
      else
         ch = ((unichar)u16 << 10) + source[c++] + SURROGATE_OFFSET;

      if(ch < 0x80)
      {
         if(d + 1 >= max) break;
         byteDest[d++] = (char)ch;
      }
      else if(ch < 0x800)
      {
         if(d + 2 >= max) break;
         byteDest[d++] = 0xC0 | (byte)((ch & 0x7C0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else if(ch < 0x10000)
      {
         if(d + 3 >= max) break;
         byteDest[d++] = 0xE0 | (byte)((ch & 0xF000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else
      {
         if(d + 4 >= max) break;
         byteDest[d++] = 0xF0 | (byte)((ch & 0x1C0000) >> 18);
         byteDest[d++] = 0x80 | (byte)((ch & 0x3F000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
   }
   byteDest[d] = 0;
   return d;
}

// NOTE: UTF8GetChar now returns 0 into numBytes for the null-terminating character ('\0')
public unichar UTF8GetChar(const char * string, int * numBytes)
{
   unichar ch;
   byte b = ((byte *)string)[0];
   int i;
   byte mask = 0x7F;
   int nb = b ? 1 : 0;
   ch = 0;
   if(b & 0x80)
   {
      if(b & 0x40)
      {
         mask >>= 2;
         nb++;
         if(b & 0x20)
         {
            nb++;
            mask >>= 1;
            if(b & 0x10)
            {
               if(b & 0x08) { nb = 0; }
               nb++;
               mask >>= 1;
            }
         }
      }
      else
         nb = 0;
   }
   for(i = 0; i<nb; i++)
   {
      ch <<= 6;
      ch |= (b = ((byte *)string)[i]) & mask;
      mask = 0x3F;
      if(i > 1 && (!(b & 0x80) || (b & 0x40)))
      {
         nb = 0;
         ch = 0;
      }
   }

   if(i < nb ||
      ch > 0x10FFFF || (ch >= 0xD800 && ch <= 0xDFFF) ||
     (ch < 0x80 && nb > 1) ||
     (ch < 0x800 && nb > 2) ||
     (ch < 0x10000 && nb > 3))
   {
      ch = 0;
      nb = 0;
   }
   if(numBytes) *numBytes = nb;
   return ch;
}

public int UTF8toUTF16Buffer(const char * source, uint16 * dest, int max)
{
   if(source)
   {
      int c;
      int d = 0;
      for(c = 0; source[c];)
      {
         byte ch = source[c];
         unichar codePoint = 0;
         int numBytes = 1;
         int i;
         byte mask = 0x7F;
         if(ch & 0x80 && ch & 0x40)
         {
            mask >>= 2;
            numBytes++;
            if(ch & 0x20)
            {
               numBytes++;
               mask >>= 1;
               if(ch & 0x10)
               {
                  numBytes++;
                  mask >>= 1;
               }
            }
         }
         for(i = 0; i<numBytes; i++)
         {
            codePoint <<= 6;
            codePoint |= source[c++] & mask;
            mask = 0x3F;
         }

         if(codePoint > 0xFFFF)
         {
            uint16 lead = (uint16)(LEAD_OFFSET + (codePoint >> 10));
            uint16 trail = (uint16)(0xDC00 | (codePoint & 0x3FF));
            if(d >= max - 1) break;
            dest[d++] = lead;
            dest[d++] = trail;
         }
         else
         {
            if(d >= max) break;
            dest[d++] = (uint16)codePoint;
         }
      }
      dest[d] = 0;
      return d;
   }
   return 0;
}

public int UTF32toUTF8Len(const unichar * source, int count, char * dest, int max)
{
   int c;
   int d = 0;
   uint32 ch;
   byte * byteDest = (byte *)dest;
   for(c = 0; c<count && (ch = source[c]); c++)
   {
      if(ch < 0x80)
      {
         if(d + 1 >= max) break;
         byteDest[d++] = (char)ch;
      }
      else if(ch < 0x800)
      {
         if(d + 2 >= max) break;
         byteDest[d++] = 0xC0 | (byte)((ch & 0x7C0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else if(ch < 0x10000)
      {
         if(d + 3 >= max) break;
         byteDest[d++] = 0xE0 | (byte)((ch & 0xF000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
      else
      {
         if(d + 4 >= max) break;
         byteDest[d++] = 0xF0 | (byte)((ch & 0x1C0000) >> 18);
         byteDest[d++] = 0x80 | (byte)((ch & 0x3F000) >> 12);
         byteDest[d++] = 0x80 | (byte)((ch & 0xFC0) >> 6);
         byteDest[d++] = 0x80 | (byte)(ch & 0x03F);
      }
   }
   byteDest[d] = 0;
   return d;
}

public uint16 * UTF8toUTF16(const char * source, int * wordCount)
{
   if(source)
   {
      int len = (int)strlen(source);
      uint16 * dest = new uint16[len + 1];
      int c;
      int d = 0;
      for(c = 0; source[c];)
      {
         byte ch = source[c];
         unichar codePoint = 0;
         int numBytes = 1;
         int i;
         byte mask = 0x7F;
         if(ch & 0x80 && ch & 0x40)
         {
            mask >>= 2;
            numBytes++;
            if(ch & 0x20)
            {
               numBytes++;
               mask >>= 1;
               if(ch & 0x10)
               {
                  numBytes++;
                  mask >>= 1;
               }
            }
         }
         for(i = 0; i<numBytes; i++)
         {
            codePoint <<= 6;
            codePoint |= source[c++] & mask;
            mask = 0x3F;
         }

         if(codePoint > 0xFFFF)
         {
            uint16 lead = (uint16)(LEAD_OFFSET + (codePoint >> 10));
            uint16 trail = (uint16)(0xDC00 | (codePoint & 0x3FF));
            dest[d++] = lead;
            dest[d++] = trail;
         }
         else
         {
            dest[d++] = (uint16)codePoint;
         }
      }
      dest[d] = 0;
      if(wordCount) *wordCount = d;
      return dest;
   }
   return null;
}

namespace com;

#if !defined(MEMINFO) && defined(MEMTRACKING)
import "Map"

Map<Class, int> blocksByClass { };
Map<Class, uintsize> sizeByClass { };
#endif

public void queryMemInfo(char * string)
{
#if !defined(MEMINFO) && defined(MEMTRACKING) && !defined(DISABLE_MEMMGR)
   char s[1024];
   int p;
   uint numBlocks = 0;
   uintsize totalMemUsed = 0;
   sprintf(s, "Total System Memory Usage: %.02f\n", TOTAL_MEM / 1048576.0f);
   strcat(string, s);

   for(p = 0; pools && p < NUM_POOLS; p++)
   {
      BlockPool * pool = &pools[p];
      if(pool->totalSize)
      {
         numBlocks += pool->totalSize;
         sprintf(s, "%8d bytes: %d blocks in %d parts (%.02f mb used; taking up %.02f mb space)\n",
            pool->blockSize, pool->numBlocks, pool->numParts, pool->usedSpace / 1048576.0f, pool->totalSize * pool->blockSpace / 1048576.0f);
         totalMemUsed += pool->usedSpace;
         strcat(string, s);
      }
   }


   blocksByClass.Free();
   sizeByClass.Free();
#if !defined(_NOMUTEX)
   memMutex.Wait();
#endif
   for(p = 0; pools && p < NUM_POOLS; p++)
   {
      BlockPool * pool = &pools[p];
      MemBlock block;
      for(block = pool->first; block; block = block.next)
      {
         Class c = block._class;
         blocksByClass[c]++;
         sizeByClass[c] += block.size;
      }
   }
#if !defined(_NOMUTEX)
   memMutex.Release();
#endif

   //for(c : blocksByClass)
   {
      MapIterator<Class, int> it { map = blocksByClass };
      while(it.Next())
      {
         int c = it.data;
         Class _class = it.key; //&c;
         uintsize size = sizeByClass[_class];
         float totalSize = (float) size / 1048576.0f;
         if(totalSize > 1)
         {
            sprintf(s, "%s (%d bytes): %d instances (%.02f mb used)\n", _class ? _class.name : "(none)", (int)size, c, totalSize);
            strcat(string, s);
         }
      }
   }

   sprintf(s, "Non-pooled memory: %.02f\n", OUTSIDE_MEM / 1048576.0f);
   strcat(string, s);
   sprintf(s, "Total Memory in use: %.02f\n", (float)(totalMemUsed + OUTSIDE_MEM) / 1048576.0f);
   strcat(string, s);

   sprintf(s, "Total Blocks Count: %d (%.02f mb overhead)\n", numBlocks, (float)sizeof(struct MemBlock) * numBlocks / 1048576.0f);
   strcat(string, s);
#ifdef MEMORYGUARD
   sprintf(s, "MemoryGuard: %d blocks (%.02f mb RedZone, %.02f mb MemInfo)\n", memBlocks.count,
      numBlocks * 2 * REDZONE / 1048576.0f, sizeof(struct MemInfo) * memBlocks.count / 1048576.0f);
   strcat(string, s);
#endif
#endif
}

public void eSystem_LockMem()
{
#if !defined(_NOMUTEX) && (!defined(DISABLE_MEMMGR) || !defined(USE_ATOMICS))
   memMutex.Wait();
#endif
}

public void eSystem_UnlockMem()
{
#if !defined(_NOMUTEX) && (!defined(DISABLE_MEMMGR) || !defined(USE_ATOMICS))
   memMutex.Release();
#endif
}
