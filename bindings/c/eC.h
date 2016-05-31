// Preprocessor directives can be added at the beginning (Can't store them in AST)

/****************************************************************************
===========================================================================
   Core eC Library
===========================================================================
****************************************************************************/
#if !defined(__EC_H__)
#define __EC_H__

#define CPP11 (defined(__cplusplus) && __cplusplus >= 201103L)

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>
#include <stdio.h>
#include <string.h>

// Syntactic Sugar (NOT GENERATED)
#define $(x)      (constString)getTranslatedString(MODULE_NAME, x, null)
#define $$(x, c)  (constString)getTranslatedString(MODULE_NAME, x, c)

#define _IPTR(x, c, s) ((struct s *)((x) ? (((char *)(x)) + c->offset) : 0))
#define IPTR(x, c) _IPTR(x, class_ ## c, c)

#define incref(x) (x)->_refCount++;

#define newi(c) ({ Instance i = Instance_new(c); incref(i); i; })
#ifndef __cplusplus
   #define new(t, c) eC_new(class_ ## t->structSize * c)
#endif
#define newb(c) eC_new(c)

#define deletei(v) Instance_decref(v), v = null
#ifndef __cplusplus
   #define delete(v) eC_delete(v), v = null
#endif

#ifndef __cplusplus
   #define registerClass(a, n, b)  \
      eC_registerClass(normalClass, #n, #b, sizeof(struct n), 0, \
         (void *)n ## _constructor, (void *)n ## _destructor, a, privateAccess, publicAccess)
#endif

#define addMethod(c, n, m) \
   Class_addMethod(c, n, null, (void *)m, publicAccess)

#if defined(__WIN32__) && !defined(__CONSOLE_APP__)
   typedef void * HINSTANCE;
   #define WINAPI __stdcall
   #define MAIN_DECLARATION int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)
   #define eC_init_CALL eC_init(true, 0, null)
#else
   #define MAIN_DECLARATION int main(int argc, char * argv[])
   #ifdef __cplusplus
      #if defined(__CONSOLE_APP__)
         #define eC_init_CALL eC_init(false, null, null);
      #else
         #define eC_init_CALL eC_init(true, null, null);
      #endif
   #else
      #if defined(__CONSOLE_APP__)
         #define eC_init_CALL eC_init(false, argc, argv);
      #else
         #define eC_init_CALL eC_init(true, argc, argv);
      #endif
   #endif
#endif

#define APP_INTRO \
   MAIN_DECLARATION \
   { \
      eC_Application app = eC_init_CALL;

#define APP_OUTRO \
      int exitCode = _IPTR(app, class_Application, class_members_Application)->exitCode; \
      deletei(app); \
      return exitCode; \
   }

// GENERATED:

#define Instance           eC_Instance
#define Module             eC_Module
#define Application        eC_Application
#define Container          eC_Container
#define Array              eC_Array
#define CustomAVLTree      eC_CustomAVLTree
#define AVLTree            eC_AVLTree
#define Map                eC_Map
#define LinkList           eC_LinkList
#define List               eC_List
#define IOChannel          eC_IOChannel
#define SerialBuffer       eC_SerialBuffer
#define OldArray           eC_OldArray

#define Window             eC_Window
#define DataBox            eC_DataBox
#define ClassDesignerBase  eC_ClassDesignerBase
#define DesignerBase       eC_DesignerBase

// Structs / Unions (with methods or properties)
#define Iterator           eC_Iterator
#define MapIterator        eC_MapIterator
#define BuiltInContainer   eC_BuiltInContainer
#define BinaryTree         eC_BinaryTree
#define StringBinaryTree   eC_StringBinaryTree
#define OldList            eC_OldList

// class : struct (with methods or properties)
#define Class              eC_Class
#define BTNode             eC_BTNode
#define Item               eC_Item
#define OldLink            eC_OldLink
#define AVLNode            eC_AVLNode
#define MapNode            eC_MapNode
#define StringBTNode       eC_StringBTNode

// Defines
#if defined(__cplusplus)
#define null 0
#else
#define null (void *)0
#endif

// dllimport Functions
#define eC_initApp               __ecereNameSpace__ecere__com____ecere_COM_Initialize
#define eC_findClass             __ecereNameSpace__ecere__com__eSystem_FindClass
#define eC_registerClass         __ecereNameSpace__ecere__com__eSystem_RegisterClass
#define eC_new                   __ecereNameSpace__ecere__com__eSystem_New
#define eC_new0                  __ecereNameSpace__ecere__com__eSystem_New0
#define eC_delete                __ecereNameSpace__ecere__com__eSystem_Delete
#define eC_findFunction          __ecereNameSpace__ecere__com__eSystem_FindFunction

#define Class_addMethod          __ecereNameSpace__ecere__com__eClass_AddMethod
#define Class_findMethod         __ecereNameSpace__ecere__com__eClass_FindMethod
#define Class_findProperty       __ecereNameSpace__ecere__com__eClass_FindProperty
#define Class_isDerived          __ecereNameSpace__ecere__com__eClass_IsDerived

#define Module_load              __ecereNameSpace__ecere__com__eModule_Load

#define Instance_new             __ecereNameSpace__ecere__com__eInstance_New
#define Instance_delete          __ecereNameSpace__ecere__com__eInstance_Delete
#define Instance_decref          __ecereNameSpace__ecere__com__eInstance_DecRef
#define Instance_evolve          __ecereNameSpace__ecere__com__eInstance_Evolve
#define Instance_setMethod       __ecereNameSpace__ecere__com__eInstance_SetMethod

#define getTranslatedString      __ecereNameSpace__ecere__GetTranslatedString
#define loadTranslatedStrings    __ecereNameSpace__ecere__LoadTranslatedStrings
#define unloadTranslatedStrings  __ecereNameSpace__ecere__UnloadTranslatedStrings

// Virtual Method Calls

// Base Class
#define _onDisplay(c, i, s, x, y, w, d, a, f) ({ void (* method)(eC_Class *, void *, eC_Instance /*Surface*/, int, int, int, void *, Alignment, DataDisplayFlags) = (void (*)(eC_Class *, void *, eC_Instance /*eC_Surface*/, int, int, int, void *, Alignment, DataDisplayFlags))((c) ? (c)->_vTbl : class_class->_vTbl)[onDisplay_vTblID]; \
                                                if(method) method((c), i, s, x, y, w, d, a, f); })
#define _onCompare(c, i, o)                   ({ int (* method)(eC_Class *, void *, void *) = (int (*)(eC_Class *, void *, void *))((c) ? (c)->_vTbl : class_class->_vTbl)[onCompare_vTblID]; \
                                                method ? method((c), i, o) : 1; })
#define _onCopy(c, i, o)                      ({ void (* method)(eC_Class *, void *, void *) = (void (*)(eC_Class *, void *, void *))((c) ? (c)->_vTbl : class_class->_vTbl)[onCopy_vTblID]; \
                                                if(method) method((c), i, o); })
#define _onFree(c, i)                         ({ void (* method)(eC_Class *, void *) = (void (*)(eC_Class *, void *))((c) ? (c)->_vTbl : class_class->_vTbl)[onFree_vTblID]; \
                                                if(method) method((c), i); })
#define _onGetString(c, i, t, d, n)           ({ constString (* method)(eC_Class *, void *, char *, void *, bool *) = (constString (*)(eC_Class *, void *, char *, void *, bool *))((c) ? (c)->_vTbl : class_class->_vTbl)[onGetString_vTblID]; \
                                                method ? method((c), i, t, d, n) : null; })
#define _onGetDataFromString(c, i, s)         ({ bool (* method)(eC_Class *, void *, constString) = (bool (*)(eC_Class *, void *, constString))((c) ? (c)->_vTbl : class_class->_vTbl)[onGetDataFromString_vTblID]; \
                                                method ? method((c), i, s) : 1; })
#define _onEdit(c, i, b, o, x, y, w, h, u)    ({ eC_Window (* method)(eC_Class *, void *, eC_DataBox, eC_DataBox, int, int, int, int, void *) = (eC_Window (*)(eC_Class *, void *, eC_DataBox, eC_DataBox, int, int, int, int, void *))((c) ? (c)->_vTbl : class_class->_vTbl)[onEdit_vTblID]; \
                                                method ? method((c), i, b, i, x, y, w, h, u) : null; })
#define _onSerialize(c, i, s)                 ({ void (* method)(eC_Class *, void *, eC_IOChannel) = (void (*)(eC_Class *, void *, eC_IOChannel))((c) ? (c)->_vTbl : class_class->_vTbl)[onSerialize_vTblID]; \
                                                if(method) method((c), i, s); })
#define _onUnserialize(c, i, s)               ({ void (* method)(eC_Class *, void *, eC_IOChannel) = (void (*)(eC_Class *, void *, eC_IOChannel))((c) ? (c)->_vTbl : class_class->_vTbl)[onUnserialize_vTblID]; \
                                                if(method) method((c), i, s); })
#define _onSaveEdit(c, i, w, o)               ({ bool (* method)(eC_Class *, void *, eC_Window, void *) = (bool (*)(eC_Class *, void *, eC_Window, void *))((c) ? (c)->_vTbl : class_class->_vTbl)[onSaveEdit_vTblID]; \
                                                method ? method((c), i, w, o) : 1; })

// Base Virtual Methods for Normal Classes
#define Instance_onDisplay(c, i, s, x, y, w, d, a, f)  _onDisplay((i) ? (i)->_class : c, i, s, x, y, w, d, a, f)
#define Instance_onCompare(c, i, o)                    _onCompare((i) ? (i)->_class : c, i, o)
#define Instance_onCopy(c, i, o)                       _onCopy((o) ? (o)->_class : c, &i, o)
#define Instance_onFree(c, i)                          _onFree((i) ? (i)->_class : c, i)
#define Instance_onGetString(c, i, t, d, n)            _onGetString((i) ? (i)->_class : c, i, t, d, n)
#define Instance_onGetDataFromString(c, i, s)          _onGetDataFromString(c, &i, s)
#define Instance_onEdit(c, i, b, o, x, y, w, h, u)     _onEdit((i) ? (i)->_class : c, i, b, o, x, y, w, h, u)
#define Instance_onSerialize(c, i, s)                  _onSerialize((i) ? (i)->_class : c, i, s)
#define Instance_onUnserialize(c, i, s)                _onUnserialize(c, &i, s)
#define Instance_onSaveEdit(c, i, w, o)                _onSaveEdit(c, &i, w, o)

// Application Class
#define Application_main(x)   ({ eC_Application i = x; \
                                 void (* method)(eC_Application) = (void (*)(eC_Application))(i ? i->_vTbl : class_Application->_vTbl)[Application_main_vTblID]; \
                                 if(method) method(i); })

// Container Class
#define Container_getFirst(i)                ({ void (* method)(Container) = ((i) ? (i)->_vTbl : class_Container->_vTbl)[Container_getFirst_vTblID]; \
                                                return method ? method((i)) : null; })
#define Container_getLast(i)
#define Container_getPrev(i, p)
#define Container_getNext(i, p)
#define Container_getData(i, p)
#define Container_setData(i, p, d)
#define Container_getAtPosition(i, p, c, j)
#define Container_insert(i, a, v)
#define Container_add(i, v)
#define Container_remove(i, t)
#define Container_move(i, t, a)
#define Container_removeAll(i)
#define Container_copy(i, s)
#define Container_find(i, v)
#define Container_freeIterator(i, t)
#define Container_getCount(i)
#define Container_free(i)
#define Container_deleteItem(i, t)
#define Container_takeOut(i, d)


// class : struct forward declarations
struct BTNamedLink;
struct BitMember;
struct Class;
struct ClassProperty;
struct ClassTemplateParameter;
struct DataMember;
struct DefinedExpression;
struct EnumClassData;
struct GlobalFunction;
union ListItem;
struct Link;
struct NamedLink;
struct NamedLink64;
struct Method;
struct AVLNode;
struct MapNode;
struct Property;
struct ObjectInfo;
struct SubModule;
struct BTNode;
struct Item;
struct NamedItem;
struct OldLink;
struct StringBTNode;

typedef void IteratorPointer;
typedef void Mutex;

#ifndef __cplusplus
// class : struct typedefs
typedef struct BTNamedLink BTNamedLink;
typedef struct BitMember BitMember;
typedef struct Class Class;
typedef struct ClassProperty ClassProperty;
typedef struct ClassTemplateParameter ClassTemplateParameter;
typedef struct DataMember DataMember;
typedef struct DefinedExpression DefinedExpression;
typedef struct EnumClassData EnumClassData;
typedef struct GlobalFunction GlobalFunction;
typedef union ListItem ListItem;
typedef struct Link Link;
typedef struct NamedLink NamedLink;
typedef struct NamedLink64 NamedLink64;
typedef struct Method Method;
typedef struct AVLNode AVLNode;
typedef struct MapNode MapNode;
typedef struct Property Property;
typedef struct ObjectInfo ObjectInfo;
typedef struct SubModule SubModule;
typedef struct BTNode BTNode;
typedef struct Item Item;
typedef struct NamedItem NamedItem;
typedef struct OldLink OldLink;
typedef struct StringBTNode StringBTNode;
#endif

// Unit Class Typedefs
typedef uint8_t byte;
typedef int64_t int64;
typedef intptr_t intptr;
typedef ssize_t intsize;
typedef uint32_t uint;
typedef uint16_t uint16;
typedef uint32_t uint32;
typedef uint64_t uint64;
typedef uintptr_t uintptr;
typedef size_t uintsize;
typedef uint32_t unichar;
typedef double Angle;

// Normal Class Typedefs
struct class_members_Instance;

typedef struct class_members_Instance * Instance;
typedef Instance Module;
typedef Module Application;
typedef Instance Container;
typedef Container Array;
typedef Container CustomAVLTree;
typedef CustomAVLTree AVLTree;
typedef CustomAVLTree Map;
typedef Container LinkList;
typedef LinkList List;
typedef Instance IOChannel;
typedef IOChannel SerialBuffer;
typedef Instance OldArray;

typedef Instance Window;
typedef Window ClassDesignerBase;
typedef Window DesignerBase;

// String Type
typedef char * String;
typedef const char * constString;

// Undefined classes
typedef void * Type;
typedef void * Instantiation;
typedef void * ClassDefinition;

// Bit Class Typedefs
typedef uint32 Color;
typedef uint32 Modifiers;

// Enum Typedefs
#if defined(__cplusplus)
   #define bool eC_bool
#elif defined(bool)
   #undef bool
   #define REDEFINE_STDBOOL
   #define bool eC_bool
#endif
typedef uint32 bool;

#if !defined(__cplusplus)
typedef enum ClassType ClassType;
typedef enum ImportType ImportType;
typedef enum AccessMode AccessMode;
typedef enum DataMemberType DataMemberType;
typedef enum MethodType MethodType;
typedef enum Platform Platform;
typedef enum TemplateMemberType TemplateMemberType;
typedef enum TemplateParameterType TemplateParameterType;
typedef enum TreePrintStyle TreePrintStyle;
#endif

#if !CPP11
typedef uint32 BackSlashEscaping;
#endif

// Template Types Typedefs
typedef uint64 Container_D;
typedef uint64 Container_I;
typedef uint64 Container_T;

typedef AVLNode * CustomAVLTree_BT;
typedef uint64 CustomAVLTree_KT;

typedef uint64 AVLNode_T;
typedef uint64 Array_T;

typedef void * LinkElement_T;
typedef void * LinkList_LT;

typedef uint64 MapNode_V;

// Enumerations
#if !defined(__bool_true_false_are_defined) && !defined(__cplusplus)
enum boolean
{
   false = 0,
   true = 1
};
#endif

enum BackSlashEscaping
#if CPP11
   : uint32
#endif
{ forArgsPassing = 2 };

enum Platform { unknown, win32, tux, apple };

enum TemplateMemberType { dataMember, method, prop };
enum TemplateParameterType { type, identifier, expression };
enum TreePrintStyle { inOrder, postOrder, preOrder, depthOrder };

enum ClassType
{
   normalClass,
   structClass,
   bitClass,
   unitClass,
   enumClass,
   noHeadClass
};

enum MethodType { normalMethod, virtualMethod };

enum ImportType
{
   normalImport,
   staticImport,
   remoteImport
};

enum AccessMode
{
   defaultAccess,
   publicAccess,
   privateAccess,
   staticAccess,
   baseSystemAccess
};

enum DataMemberType
{
   normalMember,
   unionMember,
   structMember
};

// Struct Typedefs
#ifndef __cplusplus
   typedef union DataValue DataValue;
   typedef struct Size Size;
   typedef struct Point Point;
   typedef struct Iterator Iterator;
   typedef struct MapIterator MapIterator;
   typedef struct BuiltInContainer BuiltInContainer;
   typedef union ClassTemplateArgument ClassTemplateArgument;
   typedef struct LinkElement LinkElement;
   typedef struct NameSpace NameSpace;
   typedef struct StaticString StaticString;
   typedef struct BinaryTree BinaryTree;
   typedef struct StringBinaryTree StringBinaryTree;
   typedef struct OldList OldList;
#endif

// Structs / Unions
struct StaticString
{
   char string[1];
};

union DataValue
{
   char c;
   byte uc;
   short s;
   uint16 us;
   int i;
   uint32 ui;
   void * p;
   float f;
   double d;
   int64 i64;
   uint64 ui64;
};

struct BuiltInContainer
{
   void *_vTbl;
   Class * _class;
   int _refCount;
   void *data;
   int count;
   Class * type;
};

struct BinaryTree
{
   BTNode * root;
   int count;
};

struct OldList
{
   void *first;
   void *last;
   int count;
   uint offset;
   bool circ;
};

struct NameSpace
{
   const char *name;
   NameSpace * btParent;
   NameSpace * left;
   NameSpace * right;
   int depth;
   NameSpace * parent;
   BinaryTree nameSpaces;
   BinaryTree classes;
   BinaryTree defines;
   BinaryTree functions;
};

struct Iterator
{
   Container container;
   IteratorPointer * pointer;
};

struct MapIterator
{
   Map map;
   IteratorPointer * pointer;
};
struct LinkElement
{
   LinkElement_T prev;
   LinkElement_T next;
};

union ClassTemplateArgument
{
   // For type
   struct
   {
      constString dataTypeString;
      Class * dataTypeClass;
   };
   DataValue expression;
   // For identifier
   struct
   {
      constString memberString;
      union
      {
         DataMember * member;
         Property * prop;
         Method * method;
      };
   };
};

// class : struct
struct BTNamedLink
{
   const char *name;
   BTNamedLink * parent;
   BTNamedLink * left;
   BTNamedLink * right;
   int depth;
   void *data;
};
struct BitMember
{
   BitMember * prev;
   BitMember * next;
   const char *name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char *dataTypeString;
   Class * dataTypeClass;
   Type dataType;
   DataMemberType type;
   int size;
   int pos;
   uint64 mask;
};

struct Class
{
   Class * prev;
   Class * next;
   const char *name;
   int offset;
   int structSize;
   void **_vTbl;
   int vTblSize;
   bool (*Constructor)(void *);
   void (*Destructor)(void *);

   int offsetClass;
   int sizeClass;
   Class * base;
   BinaryTree methods;
   BinaryTree members;
   BinaryTree prop;
   OldList membersAndProperties;
   BinaryTree classProperties;
   OldList derivatives;
   int memberID;
   int startMemberID;
   ClassType type;
   Module module;
   NameSpace * nameSpace;
   const char *dataTypeString;
   Type dataType;
   void (*Initialize)();
   int typeSize;
   int defaultAlignment;
   int memberOffset;
   OldList selfWatchers;
   const char *designerClass;
   bool noExpansion;
   const char *defaultProperty;
   bool comRedefinition;
   int count;
   int isRemote;
   bool internalDecl;
   void *data;
   bool computeSize;
   short structAlignment;
   short pointerAlignment;
   int destructionWatchOffset;
   bool fixed;
   OldList delayedCPValues;
   AccessMode inheritanceAccess;
   const char *fullName;
   void *symbol;
   OldList conversions;
   OldList templateParams;
   ClassTemplateArgument * templateArgs;
   Class * templateClass;
   OldList templatized;
   int numParams;
   bool isInstanceClass;
   bool byValueSystemClass;
};
struct ClassProperty
{
   const char *name;
   ClassProperty * parent;
   ClassProperty * left;
   ClassProperty * right;
   int depth;
   const char *dataTypeString;
   Type dataType;
   bool constant;
};
struct ClassTemplateParameter
{
   ClassTemplateParameter * prev;
   ClassTemplateParameter * next;
   const char *name;
   TemplateParameterType type;
   ClassTemplateArgument defaultArg;
   void *param;
};
struct EnumClassData
{
   OldList values;
   int64 largest;
};
struct DataMember
{
   DataMember * prev;
   DataMember * next;
   const char *name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char *dataTypeString;
   Class * dataTypeClass;
   Type dataType;
   DataMemberType type;
   int offset;
   int memberID;
   OldList members;
   BinaryTree membersAlpha;
   int memberOffset;
   short structAlignment;
   short pointerAlignment;
};
struct DefinedExpression
{
   DefinedExpression * prev;
   DefinedExpression * next;
   const char * name;
   const char * value;
   NameSpace * nameSpace;
};
struct GlobalFunction
{
   GlobalFunction * prev;
   GlobalFunction * next;
   const char *name;
   int (*function)();
   Module module;
   NameSpace * nameSpace;
   const char *dataTypeString;
   Type dataType;
   void *symbol;
};
union ListItem
{
   LinkElement link;
   struct { ListItem * prev, * next; };
};

struct Link
{
   LinkElement link;
   struct { Link * prev, * next; };
   uint64 data;
};
struct Method
{
   const char *name;
   Method * parent;
   Method * left;
   Method * right;
   int depth;
   int (*function)();
   int vid;
   MethodType type;
   Class * _class;
   void *symbol;
   const char *dataTypeString;
   Type dataType;
   AccessMode memberAccess;
};
struct ObjectInfo
{
   ObjectInfo * prev;
   ObjectInfo * next;
   Instance instance;
   char *name;
   Instantiation instCode;
   bool deleted;
   ObjectInfo * oClass;
   OldList instances;
   ClassDefinition classDefinition;
   bool modified;
   void *i18nStrings;
};
struct Property
{
   Property * prev;
   Property * next;
   const char *name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char *dataTypeString;
   Class * dataTypeClass;
   Type dataType;

   void (*Set)(void *, int);
   int (*Get)(void *);
   bool (*IsSet)(void *);

   void *data;
   void *symbol;
   int vid;
   bool conversion;
   uint watcherOffset;
   const char *category;
   bool compiled;
   bool selfWatchable;
   bool isWatchable;
};
struct SubModule
{
   SubModule * prev;
   SubModule * next;
   Module module;
   AccessMode importMode;
};
struct BTNode
{
   uintptr key;
   BTNode * parent;
   BTNode * left;
   BTNode * right;
   int depth;
};
struct Item
{
   Item * prev;
   Item * next;
};
struct NamedItem
{
   NamedItem * prev;
   NamedItem * next;
   char *name;
};
struct NamedLink
{
   NamedLink * prev;
   NamedLink * next;
   char *name;
   void *data;
};
struct NamedLink64
{
   NamedLink64 * prev;
   NamedLink64 * next;
   char *name;
   int64 data;
};
struct OldLink
{
   OldLink * prev;
   OldLink * next;
   void *data;
};
struct AVLNode
{
   AVLNode_T key;
};
struct MapNode
{
   AVLNode_T key;
   MapNode_V value;
};
struct StringBTNode
{
   String key;
   StringBTNode * parent;
   StringBTNode * left;
   StringBTNode * right;
   int depth;
};

// Normal Classes Visible Data Structures
struct class_members_Instance
{
   void **_vTbl;
   Class * _class;
   int _refCount;
};
struct class_members_Module
{
   Application application;
   OldList classes;
   OldList defines;
   OldList functions;
   OldList modules;
   Module prev;
   Module next;
   const char *name;
   void *library;
   void *Unload;
   ImportType importType;
   ImportType origImportType;
   NameSpace privateNameSpace;
   NameSpace publicNameSpace;
};
struct class_members_Application
{
   int argc;
   const char **argv;
   int exitCode;
   bool isGUIApp;
   OldList allModules;
   char *parsedCommand;
   NameSpace systemNameSpace;
};
struct class_members_Array
{
   Array_T *array;
   uint count;
   uint minAllocSize;
};

struct class_members_CustomAVLTree
{
   CustomAVLTree_BT root;
   int count;
};
struct class_members_DesignerBase
{
   ClassDesignerBase classDesigner;
   const char *objectClass;
   bool isDragging;
};

struct class_members_LinkList
{
   LinkList_LT first;
   LinkList_LT last;
   int count;
};

struct class_members_SerialBuffer
{
   byte *_buffer;
   uint count;
   uint _size;
   uint pos;
};

// C Exported functions
extern __attribute__((dllimport)) Application __ecereNameSpace__ecere__com____ecere_COM_Initialize(bool guiApp, int argc, char *argv[]);

extern __attribute__((dllimport)) Class * __ecereNameSpace__ecere__com__eSystem_FindClass(Module module, const char *name);
extern __attribute__((dllimport)) Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(ClassType type, const char *name, const char *baseName, int size, int sizeClass, bool (*Constructor)(void *), void (*Destructor)(void *), Module module, AccessMode declMode, AccessMode inheritanceAccess);
extern __attribute__((dllimport)) void * __ecereNameSpace__ecere__com__eSystem_new(uint size);
extern __attribute__((dllimport)) void * __ecereNameSpace__ecere__com__eSystem_new0(uint size);
extern __attribute__((dllimport)) void *__ecereNameSpace__ecere__com__eSystem_Renew(void *memory, uint size);
extern __attribute__((dllimport)) void *__ecereNameSpace__ecere__com__eSystem_Renew0(void *memory, uint size);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eSystem_Delete(void *memory);
extern __attribute__((dllimport)) DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(Module module, const char *name);
extern __attribute__((dllimport)) GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(Module module, const char *name);
extern __attribute__((dllimport)) DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *name, const char *value, Module module, AccessMode declMode);
extern __attribute__((dllimport)) GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *name, const char *type, void *func, Module module, AccessMode declMode);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eSystem_SetPoolingDisabled(bool disabled);

extern __attribute__((dllimport)) Module __ecereNameSpace__ecere__com__eModule_Load(Module fromModule, const char *name, AccessMode importAccess);
extern __attribute__((dllimport)) Module __ecereNameSpace__ecere__com__eModule_LoadStatic(Module fromModule, const char *name, AccessMode importAccess, bool __ecereNameSpace__ecere__com__Load(Module module), bool __ecereNameSpace__ecere__com__Unload(Module module));
extern __attribute__((dllimport)) Module __ecereNameSpace__ecere__com__eModule_LoadStrict(Module fromModule, const char *name, AccessMode importAccess);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eModule_Unload(Module fromModule, Module module);

extern __attribute__((dllimport)) Method * __ecereNameSpace__ecere__com__eClass_AddMethod(Class * _class, constString name, constString type, void *function, AccessMode declMode);
extern __attribute__((dllimport)) Method * __ecereNameSpace__ecere__com__eClass_FindMethod(Class * _class, const char *name, Module module);
extern __attribute__((dllimport)) Property * __ecereNameSpace__ecere__com__eClass_FindProperty(Class * _class, const char *name, Module module);
extern __attribute__((dllimport)) BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(Class * _class, const char *name, const char *type, int bitSize, int bitPos, AccessMode declMode);
extern __attribute__((dllimport)) ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(Class * _class, const char *name, const char *dataType, void *setStmt, void *getStmt);
extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(Class * _class, const char *name, const char *type, uint size, uint alignment, AccessMode declMode);
extern __attribute__((dllimport)) bool __ecereNameSpace__ecere__com__eClass_AddMember(Class * _class, DataMember * dataMember);
extern __attribute__((dllimport)) Property * __ecereNameSpace__ecere__com__eClass_AddProperty(Class * _class, const char *name, const char *dataType, void *setStmt, void *getStmt, AccessMode declMode);
extern __attribute__((dllimport)) ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(Class * _class, const char *name, TemplateParameterType type, const void *info, ClassTemplateArgument defaultArg);
extern __attribute__((dllimport)) Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(Class * _class, const char *name, const char *type, void *function, AccessMode declMode);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_DestructionWatchable(Class * _class);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(Class * base);
extern __attribute__((dllimport)) ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(Class * _class, const char *name);
extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(Class * _class, const char *name, Module module, DataMember * *subMemberStack, int *subMemberStackPos);
extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId(Class * _class, const char *name, int *id, Module module, DataMember * *subMemberStack, int *subMemberStackPos);
extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(Class * _class, const char *name, uint *offset, Module module, DataMember * *subMemberStack, int *subMemberStackPos);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_FindNextMember(Class * _class, Class * curClass, DataMember * *curMember, DataMember * *subMemberStack, int *subMemberStackPos);
extern __attribute__((dllimport)) int64 __ecereNameSpace__ecere__com__eClass_GetProperty(Class * _class, const char *name);
extern __attribute__((dllimport)) bool __ecereNameSpace__ecere__com__eClass_IsDerived(Class * _class, Class * from);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_Resize(Class * _class, int newSize);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_SetProperty(Class * _class, const char *name, int64 value);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eClass_Unregister(Class * _class);

extern __attribute__((dllimport)) Instance __ecereNameSpace__ecere__com__eInstance_New(Class * _class);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_Delete(Instance instance);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_Evolve(Instance *instancePtr, Class * _class);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_SetMethod(Instance instance, constString name, void *function);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_DecRef(Instance instance);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(Instance instance, Property * _property);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_FireWatchers(Instance instance, Property * _property);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_IncRef(Instance instance);
extern __attribute__((dllimport)) bool __ecereNameSpace__ecere__com__eInstance_IsDerived(Instance instance, Class * from);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_StopWatching(Instance instance, Property * _property, Instance object);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_Watch(Instance instance, Property * _property, void *object, void __ecereNameSpace__ecere__com__callback(void *, void *));
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eInstance_WatchDestruction(Instance instance, Instance object, void __ecereNameSpace__ecere__com__callback(void *, void *));

extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(Class * _class, const char *string, int64 value);
extern __attribute__((dllimport)) int64 __ecereNameSpace__ecere__com__eEnum_AddValue(Class * _class, const char *string);

extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(DataMember * member, const char *name, const char *type, uint size, uint alignment, AccessMode declMode);
extern __attribute__((dllimport)) bool __ecereNameSpace__ecere__com__eMember_AddMember(DataMember * addTo, DataMember * dataMember);
extern __attribute__((dllimport)) DataMember * __ecereNameSpace__ecere__com__eMember_New(DataMemberType type, AccessMode declMode);

extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eProperty_SelfWatch(Class * _class, const char *name, void (*__ecereNameSpace__ecere__com__callback)(void *));
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__eProperty_Watchable(Property * _property);

extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__MemoryGuard_PopLoc(void);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(const char *loc);

extern __attribute__((dllimport)) constString __ecereNameSpace__ecere__GetTranslatedString(constString name, constString string, constString stringAndContext);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__LoadTranslatedStrings(constString moduleName, constString name);
extern __attribute__((dllimport)) void __ecereNameSpace__ecere__UnloadTranslatedStrings(constString name);

// Global Functions
extern void (*CheckConsistency)(void);
extern void (*CheckMemory)(void);
extern DesignerBase (*GetActiveDesigner)(void);
extern Platform (*GetRuntimePlatform)(void);
extern bool (*LocateModule)(const char *name, const char *fileName);
extern void (*Print)(Class * class_object, void * object, ...);
extern int (*PrintBuf)(char *buffer, int maxLen, Class * class_object, const void * object, ...);
extern void (*PrintLn)(Class * class_object, const void * object, ...);
extern int (*PrintLnBuf)(char *buffer, int maxLen, Class * class_object, const void * object, ...);
extern char *(*PrintLnString)(Class * class_object, const void * object, ...);
extern int (*PrintStdArgsToBuffer)(char *buffer, int maxLen, Class * class_object, const void * object, va_list args);
extern char *(*PrintString)(Class * class_object, const void * object, ...);
extern void (*SetActiveDesigner)(DesignerBase designer);
extern int64 (*_strtoi64)(const char *string, const char **endString, int base);
extern uint64 (*_strtoui64)(const char *string, const char **endString, int base);
extern uint (*log2i)(uint number);
extern void (*memswap)(byte *a, byte *b, uint size);
extern uint (*pow2i)(uint number);
extern void (*queryMemInfo)(char *string);
extern void (*ChangeCh)(char *string, char ch1, char ch2);
extern void (*ChangeChars)(char *string, const char *chars, char alt);
extern char *(*ChangeExtension)(const char *string, const char *ext, char *output);
extern char *(*CopyString)(const char *string);
extern double (*FloatFromString)(const char *string);
extern int64 (*GetCurrentThreadID)(void);
extern char *(*GetExtension)(const char *string, char *output);
extern uint (*GetHexValue)(char **buffer);
extern char *(*GetLastDirectory)(const char *string, char *output);
extern bool (*GetString)(char **buffer, char *string, int max);
extern int (*GetValue)(char **buffer);
extern int (*ISO8859_1toUTF8)(const char *source, char *dest, int max);
extern bool (*IsPathInsideOf)(const char *path, const char *of);
extern char *(*MakePathRelative)(const char *path, const char *to, char *destination);
extern char *(*PathCat)(char *string, const char *addedPath);
extern char *(*PathCatSlash)(char *string, const char *addedPath);
extern void (*PrintBigSize)(char *string, double size, int prec);
extern void (*PrintSize)(char *string, uint size, int prec);
extern char *(*RSearchString)(const char *buffer, const char *subStr, int maxLen, bool matchCase, bool matchWord);
extern void (*RepeatCh)(char *string, int count, char ch);
extern char *(*SearchString)(const char *buffer, int start, const char *subStr, bool matchCase, bool matchWord);
extern bool (*SplitArchivePath)(const char *fileName, char *archiveName, const char **archiveFile);
extern char *(*SplitDirectory)(const char *string, char *part, char *rest);
extern bool (*StripExtension)(char *string);
extern char *(*StripLastDirectory)(const char *string, char *output);
extern char *(*StripQuotes)(const char *string, char *output);
extern int (*Tokenize)(char *string, int maxTokens, char *tokens[], BackSlashEscaping esc);
extern int (*TokenizeWith)(char *string, int maxTokens, char *tokens[], const char *tokenizers, bool escapeBackSlashes);
extern char *(*TrimLSpaces)(const char *string, char *output);
extern char *(*TrimRSpaces)(const char *string, char *output);
extern char *(*UTF16toUTF8)(const uint16 *source);
extern int (*UTF16toUTF8Buffer)(const uint16 *source, char *dest, int max);
extern int (*UTF32toUTF8Len)(const unichar *source, int count, char *dest, int max);
extern unichar (*UTF8GetChar)(const char *string, int *numBytes);
extern bool (*UTF8Validate)(const char *source);
extern uint16 *(*UTF8toUTF16)(const char *source, int *wordCount);
extern int (*UTF8toUTF16Buffer)(const char *source, uint16 *dest, int max);
extern void (*strcatf)(char *string, const char *format, ...);

// Base Class
extern Class * class_class;

extern Method * method_class_onDisplay;
extern Method * method_class_onCompare;
extern Method * method_class_onCopy;
extern Method * method_class_onFree;
extern Method * method_class_onGetString;
extern Method * method_class_onGetDataFromString;
extern Method * method_class_onEdit;
extern Method * method_class_onSerialize;
extern Method * method_class_onUnserialize;
extern Method * method_class_onSaveEdit;

extern int onDisplay_vTblID;
extern int onCompare_vTblID;
extern int onCopy_vTblID;
extern int onFree_vTblID;
extern int onGetString_vTblID;
extern int onGetDataFromString_vTblID;
extern int onEdit_vTblID;
extern int onSerialize_vTblID;
extern int onUnserialize_vTblID;
extern int onSaveEdit_vTblID;

extern Class * class_String;
extern Class * class_int;
extern Class * class_double;
extern Class * class_float;
extern Class * class_char;
extern Class * class_int64;
extern Class * class_short;
extern Class * class_uint16;
extern Class * class_uint;
extern Class * class_uint64;
extern Class * class_byte;

// Instance Class
extern Class * class_Instance;

// Application Class
extern Class * class_Application;

// Methods
extern Method * method_Application_main;

extern int Application_main_vTblID;

Module eC_init(bool guiApp, int argc, char * argv[]);

#if defined(__cplusplus)
   #undef bool
#elif defined(REDEFINE_STDBOOL)
   #undef bool
   #define bool _Bool
#endif

#ifdef __cplusplus

   #undef Instance
   #undef Module
   #undef Application
   #undef Container
   #undef Array
   #undef CustomAVLTree
   #undef AVLTree
   #undef Map
   #undef LinkList
   #undef List
   #undef IOChannel
   #undef SerialBuffer
   #undef OldArray

   #undef Window
   #undef DataBox
   #undef ClassDesignerBase
   #undef DesignerBase

   // Structs / Unions (with methods or properties)
   #undef Iterator
   #undef MapIterator
   #undef BuiltInContainer
   #undef BinaryTree
   #undef StringBinaryTree
   #undef OldList

   // class : struct (with methods or properties)
   #undef Class
   #undef BTNode
   #undef Item
   #undef OldLink
   #undef AVLNode
   #undef MapNode
   #undef StringBTNode

};

#endif

#endif
