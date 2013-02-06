#if defined(__GNUC__)
typedef long long int64;
typedef unsigned long long uint64;
#elif defined(__TINYC__)
#include <stdarg.h>
#define __builtin_va_list va_list
#define __builtin_va_start va_start
#define __builtin_va_end va_end
#ifdef _WIN32
#define strcasecmp stricmp
#define strncasecmp strnicmp
#define __declspec(x) __attribute__((x))
#else
#define __declspec(x)
#endif
typedef long long int64;
typedef unsigned long long uint64;
#else
typedef __int64 int64;
typedef unsigned __int64 uint64;
#endif
#ifdef __BIG_ENDIAN__
#define __ENDIAN_PAD(x) (8 - (x))
#else
#define __ENDIAN_PAD(x) 0
#endif
#include <stdint.h>
extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev;
struct __ecereNameSpace__ecere__com__Class * next;
char *  name;
int offset;
int structSize;
int (* *  _vTbl)();
int vTblSize;
int (*  Constructor)(struct __ecereNameSpace__ecere__com__Instance *);
void (*  Destructor)(struct __ecereNameSpace__ecere__com__Instance *);
int offsetClass;
int sizeClass;
struct __ecereNameSpace__ecere__com__Class * base;
struct __ecereNameSpace__ecere__sys__BinaryTree methods;
struct __ecereNameSpace__ecere__sys__BinaryTree members;
struct __ecereNameSpace__ecere__sys__BinaryTree prop;
struct __ecereNameSpace__ecere__sys__OldList membersAndProperties;
struct __ecereNameSpace__ecere__sys__BinaryTree classProperties;
struct __ecereNameSpace__ecere__sys__OldList derivatives;
int memberID;
int startMemberID;
int type;
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int typeSize;
int defaultAlignment;
void (*  Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
char *  designerClass;
unsigned int noExpansion;
char *  defaultProperty;
unsigned int comRedefinition;
int count;
unsigned int isRemote;
unsigned int internalDecl;
void *  data;
unsigned int computeSize;
int structAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
char *  fullName;
void *  symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument *  templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
int (* *  _vTbl)();
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev;
struct __ecereNameSpace__ecere__com__Property * next;
char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void (*  Set)();
int (*  Get)();
unsigned int (*  IsSet)();
void *  data;
void *  symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
char *  category;
unsigned int compiled;
unsigned int selfWatchable;
unsigned int isWatchable;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__DataMember
{
struct __ecereNameSpace__ecere__com__DataMember * prev;
struct __ecereNameSpace__ecere__com__DataMember * next;
char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int offset;
int memberID;
struct __ecereNameSpace__ecere__sys__OldList members;
struct __ecereNameSpace__ecere__sys__BinaryTree membersAlpha;
int memberOffset;
int structAlignment;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Method
{
char *  name;
struct __ecereNameSpace__ecere__com__Method * parent;
struct __ecereNameSpace__ecere__com__Method * left;
struct __ecereNameSpace__ecere__com__Method * right;
int depth;
int (*  function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void *  symbol;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

struct __ecereNameSpace__ecere__com__DataValue
{
union
{
char c;
unsigned char uc;
short s;
unsigned short us;
int i;
unsigned int ui;
void *  p;
float f;
double d;
long long i64;
uint64 ui64;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle;

struct __ecereNameSpace__ecere__sys__BufferedFile
{
int mode;
struct __ecereNameSpace__ecere__com__Instance * handle;
unsigned int bufferSize;
unsigned int bufferCount;
unsigned int bufferPos;
unsigned int pos;
unsigned char * buffer;
unsigned int eof;
unsigned int bufferRead;
unsigned int fileSize;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BufferedFile;

unsigned int __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize;

unsigned int __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead;

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__BufferedFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(this, 512 * 1024);
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(this, 1 * 1024);
return 0x1;
}

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereDestructor___ecereNameSpace__ecere__sys__BufferedFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

{
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer = 0);
}
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

void __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

void __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle);
}

extern void *  memcpy(void * , const void * , unsigned int size);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
unsigned int totalBytesRead = 0;
unsigned int bufferCount = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount;
unsigned int bufferPos = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos;
unsigned char * fileBuffer = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferPos;
unsigned int readCount = count;

readCount *= size;
while(0x1)
{
unsigned int bytesRead = (bufferCount > bufferPos) ? (bufferCount - bufferPos) : 0;

if(bytesRead > readCount)
bytesRead = readCount;
if(bytesRead)
{
memcpy(buffer + totalBytesRead, fileBuffer, bytesRead);
bufferPos += bytesRead;
totalBytesRead += bytesRead;
readCount -= bytesRead;
}
if(readCount)
{
unsigned int read;

if(readCount < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
unsigned int __simpleStruct0;

read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead, (readCount > __simpleStruct0) ? readCount : __simpleStruct0);
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
if(bufferCount + read > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
bufferPos = 0;
bufferCount = 0;
}
}
else
{
read = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
bufferPos = 0;
bufferCount = 0;
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos + totalBytesRead - bufferPos + bufferCount, 0);
read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferCount, 1, read);
fileBuffer = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferPos;
bufferCount += read;
if(!read)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = 0x1;
break;
}
}
else
break;
}
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = bufferCount;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = bufferPos;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos += totalBytesRead;
return totalBytesRead / size;
}
return 0;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Write(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
unsigned int __simpleStruct0, __simpleStruct1;
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);
unsigned int result;
unsigned int numBytes;
unsigned int bytesToBuffer;
unsigned int missing;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, 0);
result = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, buffer, size, count);
numBytes = result * size;
bytesToBuffer = (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos) ? (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos) : 0;
missing = numBytes - bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos += numBytes;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize, __simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(bytesToBuffer < numBytes && __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount >= __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos && numBytes < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize && missing < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos)
{
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + missing, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos - missing);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos -= missing;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount -= missing;
bytesToBuffer += missing;
}
if(bytesToBuffer >= numBytes)
{
unsigned int __simpleStruct0, __simpleStruct1;

bytesToBuffer = numBytes;
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos, buffer, bytesToBuffer);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, __simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
}
else
{
unsigned int __simpleStruct0;

bytesToBuffer = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize, (numBytes < __simpleStruct0) ? numBytes : __simpleStruct0);
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, buffer + numBytes - bytesToBuffer, bytesToBuffer);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = bytesToBuffer;
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
while(0x1)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos)
{
*ch = *(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos++;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos++;
return 0x1;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, 0);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, 1, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize);
if(!__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = 0x1;
break;
}
}
}
}
return 0x0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);
int written = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, &ch, 1, 1);

return written != 0;
}

extern int strlen(const char * );

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Puts(struct __ecereNameSpace__ecere__com__Instance * this, char * string)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);
int len = strlen(string);
int written = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, string, 1, len);

return written == len;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Seek(struct __ecereNameSpace__ecere__com__Instance * this, int pos, int mode)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);
unsigned int newPosition = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;

switch(mode)
{
case 0:
newPosition = pos;
break;
case 1:
newPosition += pos;
break;
case 2:
{
newPosition = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize + pos;
break;
}
}
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos != newPosition)
{
if(newPosition >= __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos && newPosition < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
if(newPosition < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount)
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
else
{
unsigned int read = newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount;

if(read < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount * 2)
{
if(read > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
else
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, 0);
read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, 1, read);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount += read;
}
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
}
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = newPosition > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos = newPosition;
}
return 0x1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int size)
{
unsigned int __simpleStruct1;
unsigned int __simpleStruct0;
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);
unsigned int bytesAhead = (unsigned int)(size - (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos));

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned int size))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, size);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, (__simpleStruct0 < bytesAhead) ? __simpleStruct0 : bytesAhead);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize = (__simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize, (__simpleStruct1 < size) ? __simpleStruct1 : size);
return 0x1;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Lock(struct __ecereNameSpace__ecere__com__Instance * this, int type, uint64 start, uint64 length, unsigned int wait)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, type, start, length, wait);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Unlock(struct __ecereNameSpace__ecere__com__Instance * this, uint64 start, uint64 length, unsigned int wait)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 start, uint64 length, unsigned int wait))__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock])(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, start, length, wait);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = 0);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = value;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos = 0;
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_refCount++;
}
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle);
}

unsigned int __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize = value;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, sizeof(unsigned char) * (value));
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize);
}

unsigned int __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + 20) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead);
}

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__File_buffered;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpenBuffered(char * fileName, int mode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Instance * result = (((void *)0));

{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__BufferedFile);

if(f)
{
((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + 20)))->mode = mode;
((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + 20)))->pos = 0;
if((__extension__ ({
void * __ecTemp1 = (f);

__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle(__ecTemp1, __ecereNameSpace__ecere__sys__FileOpen(fileName, mode));
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(__ecTemp1);
})))
{
__ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(f), 0x1);
((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + 20)))->fileSize = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(f)->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize])(__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(f));
result = f;
}
if(!result)
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}
return result;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__NameSpace
{
char *  name;
struct __ecereNameSpace__ecere__com__NameSpace *  btParent;
struct __ecereNameSpace__ecere__com__NameSpace *  left;
struct __ecereNameSpace__ecere__com__NameSpace *  right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace *  parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

struct __ecereNameSpace__ecere__com__Module
{
struct __ecereNameSpace__ecere__com__Instance * application;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList defines;
struct __ecereNameSpace__ecere__sys__OldList functions;
struct __ecereNameSpace__ecere__sys__OldList modules;
struct __ecereNameSpace__ecere__com__Instance * prev;
struct __ecereNameSpace__ecere__com__Instance * next;
char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::BufferedFile", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__BufferedFile), 0, __ecereConstructor___ecereNameSpace__ecere__sys__BufferedFile, __ecereDestructor___ecereNameSpace__ecere__sys__BufferedFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BufferedFile = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Truncate", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseInput", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseOutput", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Lock", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Lock, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Unlock", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Unlock, 1);
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "handle", "ecere::sys::File", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "bufferSize", "unsigned int", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "bufferRead", "unsigned int", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = (void *)0;
if(class)
class->fixed = (unsigned int)1;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileOpenBuffered", "ecere::sys::BufferedFile ecere::sys::FileOpenBuffered(char * fileName, ecere::sys::FileOpenMode mode)", __ecereNameSpace__ecere__sys__FileOpenBuffered, module, 1);
}

void __ecereUnregisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = (void *)0;
}

