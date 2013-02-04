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

struct __ecereNameSpace__ecere__sys__OldList
{
void * first, * last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

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

struct __ecereNameSpace__ecere__sys__Item
{
struct __ecereNameSpace__ecere__sys__Item * prev, * next;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__Item;

extern void *  memcpy(void * , const void * , unsigned int size);

void __ecereMethod___ecereNameSpace__ecere__sys__Item_Copy(struct __ecereNameSpace__ecere__sys__Item * this, struct __ecereNameSpace__ecere__sys__Item * src, int size)
{
memcpy((unsigned char *)this + sizeof(struct __ecereNameSpace__ecere__sys__Item), (unsigned char *)src + sizeof(struct __ecereNameSpace__ecere__sys__Item), size - sizeof(struct __ecereNameSpace__ecere__sys__Item *));
}

struct __ecereNameSpace__ecere__sys__NamedItem
{
struct __ecereNameSpace__ecere__sys__NamedItem * prev, * next;
char * name;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedItem;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev, * next;
void * data;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

void __ecereMethod___ecereNameSpace__ecere__sys__OldLink_Free(struct __ecereNameSpace__ecere__sys__OldLink * this)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(this->data), this->data = 0);
}

struct __ecereNameSpace__ecere__sys__NamedLink
{
struct __ecereNameSpace__ecere__sys__NamedLink * prev, * next;
char * name;
void * data;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Merge(struct __ecereNameSpace__ecere__sys__OldList * this, struct __ecereNameSpace__ecere__sys__OldList * list1, struct __ecereNameSpace__ecere__sys__OldList * list2, int (* compare)(void *, void *, void *), void * data)
{
void * item;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(this);
this->offset = list1->offset;
while((list1->first && list2->first))
{
if(compare(list1->first, list2->first, data) <= 0)
{
item = list1->first;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(list1, item);
}
else
{
item = list2->first;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(list2, item);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(this, item);
}
while((item = list1->first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(list1, item);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(this, item);
}
while((item = list2->first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(list2, item);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(this, item);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void * item)
{
if(item)
{
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);

link->prev = this->last;
if(link->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->prev + this->offset))->next = item;
if(!this->first)
this->first = item;
this->last = item;
link->next = this->circ ? this->first : (((void *)0));
if(this->circ)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)this->first + this->offset))->prev = item;
this->count++;
}
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void * prevItem, void * item)
{
if(item && prevItem != item)
{
struct __ecereNameSpace__ecere__sys__Item * prevLink = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)prevItem + this->offset);
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);

link->prev = prevItem ? prevItem : (this->circ ? this->last : (((void *)0)));
if(prevItem)
{
link->next = prevLink->next;
prevLink->next = item;
}
else
{
link->next = this->first;
this->first = item;
if(this->circ)
{
if(link->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->prev + this->offset))->next = item;
else
link->next = item;
}
}
if(prevItem == this->last)
this->last = item;
if(link->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->next + this->offset))->prev = item;
this->count++;
return 0x1;
}
return 0x0;
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void * item)
{
if(item)
{
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);

if(link->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->prev + this->offset))->next = link->next;
if(link->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->next + this->offset))->prev = link->prev;
if(this->circ && this->last == this->first)
this->last = this->first = (((void *)0));
else
{
if(this->last == item)
this->last = link->prev;
if(this->first == item)
this->first = link->next;
}
link->prev = (((void *)0));
link->next = (((void *)0));
this->count--;
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(struct __ecereNameSpace__ecere__sys__OldList * this, void * item)
{
if(item)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(this, item);
(__ecereNameSpace__ecere__com__eSystem_Delete(item), item = 0);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (* freeFn)(void *))
{
void * item, * next;

for(item = this->first; item; item = next)
{
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);

next = link->next;
if(freeFn)
freeFn(item);
(__ecereNameSpace__ecere__com__eSystem_Delete(item), item = 0);
if(next == this->first)
break;
}
this->first = this->last = (((void *)0));
this->count = 0;
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_RemoveAll(struct __ecereNameSpace__ecere__sys__OldList * this, void (* freeFn)(void *))
{
void * item, * next;

for(item = this->first; item; item = next)
{
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);

next = link->next;
if(freeFn)
freeFn(item);
if(next == this->first)
break;
}
this->first = this->last = (((void *)0));
this->count = 0;
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this)
{
this->offset = 0;
this->circ = 0x0;
this->count = 0;
this->first = this->last = (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Move(struct __ecereNameSpace__ecere__sys__OldList * this, void * item, void * prevItem)
{
if(item)
{
struct __ecereNameSpace__ecere__sys__Item * link = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item + this->offset);
struct __ecereNameSpace__ecere__sys__Item * prevLink = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)prevItem + this->offset);

if(prevItem != item && (this->first != item || prevItem))
{
if(link->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->prev + this->offset))->next = link->next;
if(link->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->next + this->offset))->prev = link->prev;
if(item == this->first)
this->first = link->next;
if(item == this->last)
this->last = link->prev;
if(prevItem == this->last)
this->last = item;
link->prev = prevItem ? prevItem : (this->circ ? this->last : (((void *)0)));
if(prevItem)
{
link->next = prevLink->next;
prevLink->next = item;
}
else
{
link->next = this->first;
this->first = item;
if(this->circ)
{
if(link->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->prev + this->offset))->next = item;
else
link->next = item;
}
}
if(link->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link->next + this->offset))->prev = item;
}
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Swap(struct __ecereNameSpace__ecere__sys__OldList * this, void * item1, void * item2)
{
struct __ecereNameSpace__ecere__sys__Item * link1 = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item1 + this->offset);
struct __ecereNameSpace__ecere__sys__Item * link2 = (struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)item2 + this->offset);
struct __ecereNameSpace__ecere__sys__Item * prev1 = link1->prev, * next1 = link1->next;
void * tmp1 = item1, * tmp2 = item2;

link1->prev = link2->prev;
link1->next = link2->next;
link2->prev = prev1;
link2->next = next1;
if(this->first == tmp1)
this->first = item2;
else if(this->first == tmp2)
this->first = item1;
if(this->last == tmp1)
this->last = item1;
else if(this->last == tmp2)
this->last = item2;
if(link1->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link1->next + this->offset))->prev = item2;
if(link1->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link1->prev + this->offset))->next = item2;
if(link2->next)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link2->next + this->offset))->prev = item1;
if(link2->prev)
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)link2->prev + this->offset))->next = item1;
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Sort(struct __ecereNameSpace__ecere__sys__OldList * this, int (* compare)(void *, void *, void *), void * data)
{
if(this->first && ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)this->first + this->offset))->next)
{
struct __ecereNameSpace__ecere__sys__OldList list1, list2;
void * middle, * end;

for(middle = this->first, list1.count = 0, list2.count = 0, end = ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)this->first + this->offset))->next; middle && end; middle = ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)middle + this->offset))->next, list1.count++, end = ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)end + this->offset))->next, list2.count++)
{
end = ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)end + this->offset))->next;
if(!end)
break;
}
list1.offset = this->offset;
list2.offset = this->offset;
list1.circ = this->circ;
list2.circ = this->circ;
list1.first = this->first;
list1.last = middle;
list2.first = ((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)middle + this->offset))->next;
list2.last = this->last;
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)list1.last + this->offset))->next = (((void *)0));
((struct __ecereNameSpace__ecere__sys__Item *)((unsigned char *)list2.first + this->offset))->prev = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Sort(&list1, compare, data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Sort(&list2, compare, data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Merge(this, &list1, &list2, compare, data);
}
}

extern int strcmp(const char * , const char * );

void * __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(struct __ecereNameSpace__ecere__sys__OldList * this, char * name, unsigned int warn)
{
void * result = (((void *)0));

if(name)
{
void * item;
struct __ecereNameSpace__ecere__sys__NamedItem * link;
int compare = 1;

for(item = this->first; item; item = link->next)
{
link = (struct __ecereNameSpace__ecere__sys__NamedItem *)(((unsigned char *)item) + this->offset);
if(link->name && (compare = strcmp(link->name, name)) >= 0)
break;
}
if(!compare)
result = item;
else if(warn)
;
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_PlaceName(struct __ecereNameSpace__ecere__sys__OldList * this, char * name, void ** place)
{
unsigned int result = 0x1;
void * item;
struct __ecereNameSpace__ecere__sys__NamedItem * link;
int compare = 1;

for(item = this->first; item; item = link->next)
{
link = (struct __ecereNameSpace__ecere__sys__NamedItem *)((unsigned char *)item + this->offset);
if(link->name && (compare = strcmp(link->name, name)) >= 0)
break;
}
if(!item)
*place = this->last;
else
*place = link->prev;
if(compare)
result = 0x1;
else
;
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void * item)
{
unsigned int result = 0x0;
void * place;
struct __ecereNameSpace__ecere__sys__NamedItem * link = ((struct __ecereNameSpace__ecere__sys__NamedItem *)((unsigned char *)item + this->offset));

if(__ecereMethod___ecereNameSpace__ecere__sys__OldList_PlaceName(this, link->name, &place))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(this, place, item);
result = 0x1;
}
return result;
}

struct __ecereNameSpace__ecere__sys__OldLink * __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink(struct __ecereNameSpace__ecere__sys__OldList * this, void * data)
{
void * item;
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(item = this->first; item; item = link->next)
{
link = (struct __ecereNameSpace__ecere__sys__OldLink *)((unsigned char *)item + this->offset);
if(link->data == data)
break;
}
return item;
}

void * __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindNamedLink(struct __ecereNameSpace__ecere__sys__OldList * this, char * name, unsigned int warn)
{
if(name)
{
void * item = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(this, name, warn);

return item ? ((struct __ecereNameSpace__ecere__sys__NamedLink *)((unsigned char *)item + this->offset))->data : (((void *)0));
}
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Copy(struct __ecereNameSpace__ecere__sys__OldList * this, struct __ecereNameSpace__ecere__sys__OldList * src, int size, void (* copy)(void * dest, void * src))
{
struct __ecereNameSpace__ecere__sys__Item * item;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(this);
for(item = src->first; item; item = item->next)
{
struct __ecereNameSpace__ecere__sys__Item * newItem = (struct __ecereNameSpace__ecere__sys__Item *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (size));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(this, newItem);
__ecereMethod___ecereNameSpace__ecere__sys__Item_Copy(newItem, item, size);
if(copy)
copy(newItem, item);
}
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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

void __ecereRegisterModule_OldList(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::Item", 0, sizeof(struct __ecereNameSpace__ecere__sys__Item), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__Item = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Copy", "void Copy(ecere::sys::Item src, int size)", __ecereMethod___ecereNameSpace__ecere__sys__Item_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::sys::Item", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::sys::Item", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::NamedItem", 0, sizeof(struct __ecereNameSpace__ecere__sys__NamedItem), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__NamedItem = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::sys::NamedItem", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::sys::NamedItem", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::OldLink", 0, sizeof(struct __ecereNameSpace__ecere__sys__OldLink), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__OldLink = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__sys__OldLink_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::sys::OldLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::sys::OldLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::NamedLink", 0, sizeof(struct __ecereNameSpace__ecere__sys__NamedLink), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__NamedLink = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::sys::NamedLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::sys::NamedLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::OldList", 0, sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__OldList = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", "void Add(void * item)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "AddName", "bool AddName(void * item)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Clear", "void Clear(void)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Copy", "void Copy(ecere::sys::OldList src, int size, void (* copy)(void * dest, void * src))", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", "void Delete(void * item)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindLink", "ecere::sys::OldLink FindLink(void * data)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindName", "void * FindName(char * name, bool warn)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindNamedLink", "void * FindNamedLink(char * name, bool warn)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindNamedLink, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free(void (* freeFn)(void *))", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Insert", "bool Insert(void * prevItem, void * item)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Move", "void Move(void * item, void * prevItem)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Move, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "PlaceName", "bool PlaceName(char * name, void ** place)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_PlaceName, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove(void * item)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "RemoveAll", "void RemoveAll(void (* freeFn)(void *))", __ecereMethod___ecereNameSpace__ecere__sys__OldList_RemoveAll, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Sort", "void Sort(int (* compare)(void *, void *, void *), void * data)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Sort, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Swap", "void Swap(void * item1, void * item2)", __ecereMethod___ecereNameSpace__ecere__sys__OldList_Swap, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "first", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "last", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "circ", "bool", 4, 4, 1);
}

void __ecereUnregisterModule_OldList(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

