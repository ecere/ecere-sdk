typedef const void * any_object;
typedef const char * constString;

typedef int Alignment;
enum
{
   Alignment_left = 0x0,
   Alignment_right = 0x1,
   Alignment_center = 0x2
};
typedef uint32_t DataDisplayFlags;

typedef void Type;
typedef void Instantiation;
typedef void ClassDefinition;

typedef struct class_members_Instance * Instance;
typedef Instance Surface;
typedef Instance Window;
typedef Window CommonControl;
typedef CommonControl DataBox;
typedef CommonControl EditBox;

typedef int MinMaxValue;
struct Size
{
   MinMaxValue w;
   MinMaxValue h;
};
typedef struct Size Size;
typedef struct Property Property;
typedef struct Method Method;
typedef Instance IOChannel;
typedef uint32_t uint;
typedef uint bool;
#define false 0
#define true 1

typedef size_t uintsize;
typedef struct Class Class;
int fstrcmp(const char *, const char *);

int strcmpi(const char *, const char *);

int strnicmp(const char *, const char *, uintsize n);

typedef char * String;
typedef uint8_t byte;
typedef int64_t int64;
typedef intptr_t intptr;
typedef ssize_t intsize;
typedef uint16_t uint16;
typedef uint32_t uint32;
typedef uint64_t uint64;
typedef uintptr_t uintptr;
typedef uint32_t unichar;

extern int class_onCompare_vTblID;
int _onCompare(Class * __c, any_object __i, any_object object);
extern Method * method_class_onCompare;

extern int class_onCopy_vTblID;
void _onCopy(Class * __c, any_object __i, any_object newData);
extern Method * method_class_onCopy;

extern int class_onDisplay_vTblID;
void _onDisplay(Class * __c, any_object __i, Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags);
extern Method * method_class_onDisplay;

extern int class_onEdit_vTblID;
Window _onEdit(Class * __c, any_object __i, DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData);
extern Method * method_class_onEdit;

extern int class_onFree_vTblID;
void _onFree(Class * __c, any_object __i);
extern Method * method_class_onFree;

extern int class_onGetDataFromString_vTblID;
bool _onGetDataFromString(Class * __c, any_object __i, const char * string);
extern Method * method_class_onGetDataFromString;

extern int class_onGetString_vTblID;
const char * _onGetString(Class * __c, any_object __i, char * tempString, void * fieldData, bool * needClass);
extern Method * method_class_onGetString;

extern int class_onSaveEdit_vTblID;
bool _onSaveEdit(Class * __c, any_object __i, Window window, void * object);
extern Method * method_class_onSaveEdit;

extern int class_onSerialize_vTblID;
void _onSerialize(Class * __c, any_object __i, IOChannel channel);
extern Method * method_class_onSerialize;

extern int class_onUnserialize_vTblID;
void _onUnserialize(Class * __c, any_object __i, IOChannel channel);
extern Method * method_class_onUnserialize;

extern int class_onCompare_vTblID;
int Instance_onCompare(Class * __c, Instance __i, any_object object);

extern int class_onCopy_vTblID;
void Instance_onCopy(Class * __c, Instance __i, any_object newData);

extern int class_onDisplay_vTblID;
void Instance_onDisplay(Class * __c, Instance __i, Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags);

extern int class_onEdit_vTblID;
Window Instance_onEdit(Class * __c, Instance __i, DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData);

extern int class_onFree_vTblID;
void Instance_onFree(Class * __c, Instance __i);

extern int class_onGetDataFromString_vTblID;
bool Instance_onGetDataFromString(Class * __c, Instance __i, const char * string);

extern int class_onGetString_vTblID;
const char * Instance_onGetString(Class * __c, Instance __i, char * tempString, void * fieldData, bool * needClass);

extern int class_onSaveEdit_vTblID;
bool Instance_onSaveEdit(Class * __c, Instance __i, Window window, void * object);

extern int class_onSerialize_vTblID;
void Instance_onSerialize(Class * __c, Instance __i, IOChannel channel);

extern int class_onUnserialize_vTblID;
void Instance_onUnserialize(Class * __c, Instance __i, IOChannel channel);

extern double (* double_inf)(void);

extern double (* double_nan)(void);

extern Property * property_double_isNan;
extern bool (* double_get_isNan)(double d);

extern Property * property_double_isInf;
extern bool (* double_get_isInf)(double d);

extern Property * property_double_signBit;
extern int (* double_get_signBit)(double d);

extern float (* float_inf)(void);

extern float (* float_nan)(void);

extern Property * property_float_isNan;
extern bool (* float_get_isNan)(float f);

extern Property * property_float_isInf;
extern bool (* float_get_isInf)(float f);

extern Property * property_float_signBit;
extern int (* float_get_signBit)(float f);

typedef Instance ZString;
typedef int TreePrintStyle;
enum
{
   TreePrintStyle_inOrder = 0x0,
   TreePrintStyle_postOrder = 0x1,
   TreePrintStyle_preOrder = 0x2,
   TreePrintStyle_depthOrder = 0x3
};

typedef struct StringBTNode StringBTNode;
struct StringBTNode
{
   String key;
   StringBTNode * parent;
   StringBTNode * left;
   StringBTNode * right;
   int depth;
};
typedef int StringAllocType;
enum
{
   StringAllocType_pointer = 0x0,
   StringAllocType_stack = 0x1,
   StringAllocType_heap = 0x2
};

typedef struct OldList OldList;
typedef struct OldLink OldLink;
struct OldLink
{
   OldLink * prev;
   OldLink * next;
   void * data;
};
typedef struct NamedLink64 NamedLink64;
struct NamedLink64
{
   NamedLink64 * prev;
   NamedLink64 * next;
   char * name;
   int64 data;
};
typedef struct NamedLink NamedLink;
struct NamedLink
{
   NamedLink * prev;
   NamedLink * next;
   char * name;
   void * data;
};
typedef struct NamedItem NamedItem;
struct NamedItem
{
   NamedItem * prev;
   NamedItem * next;
   char * name;
};
typedef struct Mutex Mutex;
typedef struct Item Item;
struct Item
{
   Item * prev;
   Item * next;
};
typedef struct BinaryTree BinaryTree;
typedef struct BTNode BTNode;
struct BTNode
{
   uintptr key;
   BTNode * parent;
   BTNode * left;
   BTNode * right;
   int depth;
};
static const char DIR_SEP;

static const char * const DIR_SEPS;

#define MAX_DIRECTORY 534

#define MAX_EXTENSION 17

#define MAX_FILENAME 274

#define MAX_F_STRING 1025

#define MAX_LOCATION 797

typedef bool BackSlashEscaping;
enum
{
   BackSlashEscaping_forArgsPassing = 0x2
};

typedef struct BinaryTree StringBinaryTree;
extern BTNode * (* BTNode_findPrefix)(BTNode * __this, const char * key);

extern BTNode * (* BTNode_findString)(BTNode * __this, const char * key);

extern Property * property_BTNode_prev;
extern BTNode * (* BTNode_get_prev)(BTNode * b);

extern Property * property_BTNode_next;
extern BTNode * (* BTNode_get_next)(BTNode * b);

extern Property * property_BTNode_minimum;
extern BTNode * (* BTNode_get_minimum)(BTNode * b);

extern Property * property_BTNode_maximum;
extern BTNode * (* BTNode_get_maximum)(BTNode * b);

extern Property * property_BTNode_count;
extern int (* BTNode_get_count)(BTNode * b);

extern Property * property_BTNode_depthProp;
extern int (* BTNode_get_depthProp)(BTNode * b);

struct BinaryTree
{
   BTNode * root;
   int count;
   int (* CompareKey)(BinaryTree tree, uintptr a, uintptr b);
   void (* FreeKey)(void * key);
};
extern bool (* BinaryTree_add)(BinaryTree * __this, BTNode * node);

extern bool (* BinaryTree_check)(BinaryTree * __this);

extern int (* BinaryTree_compareInt)(BinaryTree * __this, uintptr a, uintptr b);

extern int (* BinaryTree_compareString)(BinaryTree * __this, const char * a, const char * b);

extern void (* BinaryTree_delete)(BinaryTree * __this, BTNode * node);

extern BTNode * (* BinaryTree_find)(BinaryTree * __this, uintptr key);

extern BTNode * (* BinaryTree_findAll)(BinaryTree * __this, uintptr key);

extern BTNode * (* BinaryTree_findPrefix)(BinaryTree * __this, const char * key);

extern BTNode * (* BinaryTree_findString)(BinaryTree * __this, const char * key);

extern void (* BinaryTree_free)(BinaryTree * __this);

extern void (* BinaryTree_freeString)(char * string);

extern char * (* BinaryTree_print)(BinaryTree * __this, char * output, TreePrintStyle tps);

extern void (* BinaryTree_remove)(BinaryTree * __this, BTNode * node);

extern Property * property_BinaryTree_first;
extern BTNode * (* BinaryTree_get_first)(BinaryTree * b);

extern Property * property_BinaryTree_last;
extern BTNode * (* BinaryTree_get_last)(BinaryTree * b);

extern void (* Item_copy)(Item * __this, Item * src, int size);

extern void (* Mutex_release)(Mutex * __this);

extern void (* Mutex_wait)(Mutex * __this);

extern Property * property_Mutex_lockCount;
extern int (* Mutex_get_lockCount)(Mutex * m);

extern Property * property_Mutex_owningThread;
extern int64 (* Mutex_get_owningThread)(Mutex * m);

extern void (* OldLink_free)(OldLink * __this);

struct OldList
{
   void * first;
   void * last;
   int count;
   uint offset;
   bool circ;
};
extern void (* OldList_add)(OldList * __this, void * item);

extern bool (* OldList_addName)(OldList * __this, void * item);

extern void (* OldList_clear)(OldList * __this);

extern void (* OldList_copy)(OldList * __this, OldList * src, int size, void (* copy)(void * dest, void * src));

extern void (* OldList_delete)(OldList * __this, void * item);

extern OldLink * (* OldList_findLink)(OldList * __this, void * data);

extern void * (* OldList_findName)(OldList * __this, const char * name, bool warn);

extern void * (* OldList_findNamedLink)(OldList * __this, const char * name, bool warn);

extern void (* OldList_free)(OldList * __this, void (* freeFn)(void *));

extern bool (* OldList_insert)(OldList * __this, void * prevItem, void * item);

extern void (* OldList_move)(OldList * __this, void * item, void * prevItem);

extern bool (* OldList_placeName)(OldList * __this, const char * name, void ** place);

extern void (* OldList_remove)(OldList * __this, void * item);

extern void (* OldList_removeAll)(OldList * __this, void (* freeFn)(void *));

extern void (* OldList_sort)(OldList * __this, int (* compare)(void *, void *, void *), void * data);

extern void (* OldList_swap)(OldList * __this, void * item1, void * item2);

struct class_members_ZString
{
   char * _string;
   int len;
   StringAllocType allocType;
   int size;
   int minSize;
   int maxSize;
};
extern void (* ZString_concat)(ZString __this, ZString s);

extern void (* ZString_concatf)(ZString __this, const char * format, ...);

extern void (* ZString_copy)(ZString __this, ZString s);

extern void (* ZString_copyString)(ZString __this, char * value, int newLen);

extern Property * property_ZString_char_ptr;
extern ZString (* ZString_from_char_ptr)(char * c);
extern const char * (* ZString_to_char_ptr)(ZString z);

extern Property * property_ZString_string;
extern void (* ZString_set_string)(ZString z, char * value);
extern char * (* ZString_get_string)(ZString z);

extern void (* changeCh)(char * string, char ch1, char ch2);
extern void (* changeChars)(char * string, const char * chars, char alt);
extern char * (* changeExtension)(const char * string, const char * ext, char * output);
extern char * (* copyString)(const char * string);
extern double (* floatFromString)(const char * string);
extern int64 (* getCurrentThreadID)(void);
extern char * (* getExtension)(const char * string, char * output);
extern uint (* getHexValue)(char ** buffer);
extern char * (* getLastDirectory)(const char * string, char * output);
extern bool (* getString)(char ** buffer, char * string, int max);
extern int (* getValue)(char ** buffer);
extern int (* iSO8859_1toUTF8)(const char * source, char * dest, int max);
extern bool (* isPathInsideOf)(const char * path, const char * of);
extern char * (* makePathRelative)(const char * path, const char * to, char * destination);
extern char * (* pathCat)(char * string, const char * addedPath);
extern char * (* pathCatSlash)(char * string, const char * addedPath);
extern void (* printBigSize)(char * string, double size, int prec);
extern void (* printSize)(char * string, uint size, int prec);
extern char * (* rSearchString)(const char * buffer, const char * subStr, int maxLen, bool matchCase, bool matchWord);
extern void (* repeatCh)(char * string, int count, char ch);
extern char * (* searchString)(const char * buffer, int start, const char * subStr, bool matchCase, bool matchWord);
extern bool (* splitArchivePath)(const char * fileName, char * archiveName, const char ** archiveFile);
extern char * (* splitDirectory)(const char * string, char * part, char * rest);
extern bool (* stripExtension)(char * string);
extern char * (* stripLastDirectory)(const char * string, char * output);
extern char * (* stripQuotes)(const char * string, char * output);
extern int (* tokenize)(char * string, int maxTokens, char * tokens[], BackSlashEscaping esc);
extern int (* tokenizeWith)(char * string, int maxTokens, char * tokens[], const char * tokenizers, bool escapeBackSlashes);
extern char * (* trimLSpaces)(const char * string, char * output);
extern char * (* trimRSpaces)(const char * string, char * output);
extern char * (* uTF16toUTF8)(const uint16 * source);
extern int (* uTF16toUTF8Buffer)(const uint16 * source, char * dest, int max);
extern int (* uTF32toUTF8Len)(unichar * source, int count, char * dest, int max);
extern unichar (* uTF8GetChar)(const char * string, int * numBytes);
extern bool (* uTF8Validate)(const char * source);
extern uint16 * (* uTF8toUTF16)(const char * source, int * wordCount);
extern int (* uTF8toUTF16Buffer)(const char * source, uint16 * dest, int max);
typedef int TemplateParameterType;
enum
{
   TemplateParameterType_type = 0x0,
   TemplateParameterType_identifier = 0x1,
   TemplateParameterType_expression = 0x2
};

typedef int TemplateMemberType;
enum
{
   TemplateMemberType_dataMember = 0x0,
   TemplateMemberType_method = 0x1,
   TemplateMemberType_prop = 0x2
};

typedef struct SubModule SubModule;
typedef struct NameSpace NameSpace;
struct NameSpace
{
   const char * name;
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
typedef Instance Module;
typedef int ImportType;
enum
{
   ImportType_normalImport = 0x0,
   ImportType_staticImport = 0x1,
   ImportType_remoteImport = 0x2,
   ImportType_preDeclImport = 0x3,
   ImportType_comCheckImport = 0x4
};

typedef Module Application;
struct class_members_Application
{
   int argc;
   const char ** argv;
   int exitCode;
   bool isGUIApp;
   OldList allModules;
   char * parsedCommand;
   NameSpace systemNameSpace;
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
   const char * name;
   void * library;
   void * Unload;
   ImportType importType;
   ImportType origImportType;
   NameSpace privateNameSpace;
   NameSpace publicNameSpace;
};
typedef int AccessMode;
enum
{
   AccessMode_defaultAccess = 0x0,
   AccessMode_publicAccess = 0x1,
   AccessMode_privateAccess = 0x2,
   AccessMode_staticAccess = 0x3,
   AccessMode_baseSystemAccess = 0x4
};

struct SubModule
{
   SubModule * prev;
   SubModule * next;
   Module module;
   AccessMode importMode;
};
typedef IOChannel SerialBuffer;
typedef int ClassType;
enum
{
   ClassType_normalClass = 0x0,
   ClassType_structClass = 0x1,
   ClassType_bitClass = 0x2,
   ClassType_unitClass = 0x3,
   ClassType_enumClass = 0x4,
   ClassType_noHeadClass = 0x5,
   ClassType_unionClass = 0x6,
   ClassType_systemClass = 0x3E8
};

typedef struct ClassTemplateArgument ClassTemplateArgument;
struct Class
{
   Class * prev;
   Class * next;
   const char * name;
   int offset;
   int structSize;
   void ** _vTbl;
   int vTblSize;
   bool (* Constructor)(void *);
   void (* Destructor)(void *);
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
   const char * dataTypeString;
   Type * dataType;
   int typeSize;
   int defaultAlignment;
   void (* Initialize)();
   int memberOffset;
   OldList selfWatchers;
   const char * designerClass;
   bool noExpansion;
   const char * defaultProperty;
   bool comRedefinition;
   int count;
   int isRemote;
   bool internalDecl;
   void * data;
   bool computeSize;
   short structAlignment;
   short pointerAlignment;
   int destructionWatchOffset;
   bool fixed;
   OldList delayedCPValues;
   AccessMode inheritanceAccess;
   const char * fullName;
   void * symbol;
   OldList conversions;
   OldList templateParams;
   ClassTemplateArgument * templateArgs;
   Class * templateClass;
   OldList templatized;
   int numParams;
   bool isInstanceClass;
   bool byValueSystemClass;
   void * bindingsClass;
};
struct Property
{
   Property * prev;
   Property * next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char * dataTypeString;
   Class * dataTypeClass;
   Type * dataType;
   void (* Set)(void *, int);
   int (* Get)(void *);
   bool (* IsSet)(void *);
   void * data;
   void * symbol;
   int vid;
   bool conversion;
   uint watcherOffset;
   const char * category;
   bool compiled;
   bool selfWatchable;
   bool isWatchable;
};
typedef struct ObjectInfo ObjectInfo;
struct class_members_Instance
{
   void ** _vTbl;
   Class * _class;
   int _refCount;
};
struct ObjectInfo
{
   ObjectInfo * prev;
   ObjectInfo * next;
   Instance instance;
   char * name;
   Instantiation * instCode;
   bool deleted;
   ObjectInfo * oClass;
   OldList instances;
   ClassDefinition * classDefinition;
   bool modified;
   void * i18nStrings;
};
typedef int MethodType;
enum
{
   MethodType_normalMethod = 0x0,
   MethodType_virtualMethod = 0x1
};

struct Method
{
   const char * name;
   Method * parent;
   Method * left;
   Method * right;
   int depth;
   int (* function)();
   int vid;
   MethodType type;
   Class * _class;
   void * symbol;
   const char * dataTypeString;
   Type * dataType;
   AccessMode memberAccess;
};
typedef Instance Container;
typedef Container CustomAVLTree;
typedef CustomAVLTree Map;
typedef Container LinkList;
typedef struct IteratorPointer IteratorPointer;
typedef struct Iterator Iterator;
typedef struct GlobalFunction GlobalFunction;
struct GlobalFunction
{
   GlobalFunction * prev;
   GlobalFunction * next;
   const char * name;
   int (* function)();
   Module module;
   NameSpace * nameSpace;
   const char * dataTypeString;
   Type * dataType;
   void * symbol;
};
typedef Window DesignerBase;
typedef struct DefinedExpression DefinedExpression;
struct DefinedExpression
{
   DefinedExpression * prev;
   DefinedExpression * next;
   const char * name;
   const char * value;
   NameSpace * nameSpace;
};
struct DataValue
{
   union
   {
      char c;
      byte uc;
      short s;
      uint16 us;
      int i;
      uint ui;
      void * p;
      float f;
      double d;
      int64 i64;
      uint64 ui64;
   };
};
typedef struct DataValue DataValue;
typedef int DataMemberType;
enum
{
   DataMemberType_normalMember = 0x0,
   DataMemberType_unionMember = 0x1,
   DataMemberType_structMember = 0x2
};

typedef struct DataMember DataMember;
struct DataMember
{
   DataMember * prev;
   DataMember * next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char * dataTypeString;
   Class * dataTypeClass;
   Type * dataType;
   DataMemberType type;
   int offset;
   int memberID;
   OldList members;
   BinaryTree membersAlpha;
   int memberOffset;
   short structAlignment;
   short pointerAlignment;
};
typedef struct ClassTemplateParameter ClassTemplateParameter;
struct ClassTemplateArgument
{
   union
   {
      struct
      {
         const char * dataTypeString;
         Class * dataTypeClass;
      };
      DataValue expression;
      struct
      {
         const char * memberString;
         union
         {
            DataMember * member;
            Property * prop;
            Method * method;
         };
      };
   };
};
struct ClassTemplateParameter
{
   ClassTemplateParameter * prev;
   ClassTemplateParameter * next;
   const char * name;
   TemplateParameterType type;
   union
   {
      const char * dataTypeString;
      TemplateMemberType memberType;
   };
   ClassTemplateArgument defaultArg;
   void * param;
};
typedef Window ClassDesignerBase;
typedef struct ClassProperty ClassProperty;
struct ClassProperty
{
   const char * name;
   ClassProperty * parent;
   ClassProperty * left;
   ClassProperty * right;
   int depth;
   void (* Set)(Class *, int64);
   int64 (* Get)(Class *);
   const char * dataTypeString;
   Type * dataType;
   bool constant;
};
typedef struct BitMember BitMember;
struct BitMember
{
   BitMember * prev;
   BitMember * next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class * _class;
   const char * dataTypeString;
   Class * dataTypeClass;
   Type * dataType;
   DataMemberType type;
   int size;
   int pos;
   uint64 mask;
};
typedef struct AVLNode AVLNode;
typedef struct BTNamedLink BTNamedLink;
struct BTNamedLink
{
   const char * name;
   BTNamedLink * parent;
   BTNamedLink * left;
   BTNamedLink * right;
   int depth;
   void * data;
};
typedef struct BuiltInContainer BuiltInContainer;
static const char * const FORMAT64D;

static const char * const FORMAT64DLL;

static const char * const FORMAT64HEX;

static const char * const FORMAT64HEXLL;

static const char * const FORMAT64U;

#define MAXBYTE 0xff

static const double MAXDOUBLE;

#define MAXDWORD 0xffffffff

static const float MAXFLOAT;

#define MAXINT 2147483647

static const int64 MAXINT64;

static const uint64 MAXQWORD;

#define MAXWORD 0xffff

static const double MINDOUBLE;

static const float MINFLOAT;

#define MININT -2147483648

static const int64 MININT64;

typedef CustomAVLTree AVLTree;
typedef double Angle;
typedef Container Array;
typedef String CIString;
typedef struct EnumClassData EnumClassData;
typedef struct Link Link;
typedef struct LinkElement LinkElement;
typedef LinkList List;
typedef struct ListItem ListItem;
typedef struct MapIterator MapIterator;
typedef struct MapNode MapNode;
typedef int Platform;
enum
{
   Platform_unknown = 0x0,
   Platform_win32 = 0x1,
   Platform_tux = 0x2,
   Platform_apple = 0x3
};

typedef struct StaticString StaticString;
typedef uint64_t tparam_MapIterator_KT;
typedef uint64_t tparam_MapIterator_V;
typedef uint64_t tparam_MapNode_KT;
typedef uint64_t tparam_MapNode_V;
typedef uint64_t tparam_LinkList_LT;
typedef uint64_t tparam_CustomAVLTree_BT;
typedef uint64_t tparam_LinkElement_T;
typedef uint64_t tparam_AVLNode_T;
typedef uint64_t tparam_Container_D;
typedef uint64_t tparam_Container_I;
typedef uint64_t tparam_Container_T;
typedef uint64_t tparam_Iterator_IT;
typedef uint64_t tparam_Iterator_T;
struct AVLNode
{
   byte __ecerePrivateData0[32];
   tparam_AVLNode_T key;
};
extern AVLNode * (* AVLNode_find)(AVLNode * __this, Class * Tclass, tparam_AVLNode_T key);

extern Property * property_AVLNode_prev;
extern AVLNode * (* AVLNode_get_prev)(AVLNode * a);

extern Property * property_AVLNode_next;
extern AVLNode * (* AVLNode_get_next)(AVLNode * a);

extern Property * property_AVLNode_minimum;
extern AVLNode * (* AVLNode_get_minimum)(AVLNode * a);

extern Property * property_AVLNode_maximum;
extern AVLNode * (* AVLNode_get_maximum)(AVLNode * a);

extern Property * property_AVLNode_count;
extern int (* AVLNode_get_count)(AVLNode * a);

extern Property * property_AVLNode_depthProp;
extern int (* AVLNode_get_depthProp)(AVLNode * a);

extern int Application_main_vTblID;
void Application_main(Application __i);
extern Method * method_Application_main;

struct class_members_Array
{
   tparam_Container_T * array;
   uint count;
   uint minAllocSize;
};
extern Property * property_Array_size;
extern void (* Array_set_size)(Array a, uint value);
extern uint (* Array_get_size)(Array a);

extern Property * property_Array_minAllocSize;
extern void (* Array_set_minAllocSize)(Array a, uint value);
extern uint (* Array_get_minAllocSize)(Array a);

struct BuiltInContainer
{
   void ** _vTbl;
   Class * _class;
   int _refCount;
   void * data;
   int count;
   Class * type;
};
extern int BuiltInContainer_add_vTblID;
IteratorPointer * BuiltInContainer_add(BuiltInContainer * __i, uint64 value);
extern Method * method_BuiltInContainer_add;

extern int BuiltInContainer_copy_vTblID;
void BuiltInContainer_copy(BuiltInContainer * __i, Container source);
extern Method * method_BuiltInContainer_copy;

extern int BuiltInContainer_delete_vTblID;
void BuiltInContainer_delete(BuiltInContainer * __i, IteratorPointer * it);
extern Method * method_BuiltInContainer_delete;

extern int BuiltInContainer_find_vTblID;
IteratorPointer * BuiltInContainer_find(BuiltInContainer * __i, uint64 value);
extern Method * method_BuiltInContainer_find;

extern int BuiltInContainer_free_vTblID;
void BuiltInContainer_free(BuiltInContainer * __i);
extern Method * method_BuiltInContainer_free;

extern int BuiltInContainer_freeIterator_vTblID;
void BuiltInContainer_freeIterator(BuiltInContainer * __i, IteratorPointer * it);
extern Method * method_BuiltInContainer_freeIterator;

extern int BuiltInContainer_getAtPosition_vTblID;
IteratorPointer * BuiltInContainer_getAtPosition(BuiltInContainer * __i, const uint64 pos, bool create);
extern Method * method_BuiltInContainer_getAtPosition;

extern int BuiltInContainer_getCount_vTblID;
int BuiltInContainer_getCount(BuiltInContainer * __i);
extern Method * method_BuiltInContainer_getCount;

extern int BuiltInContainer_getData_vTblID;
uint64 BuiltInContainer_getData(BuiltInContainer * __i, IteratorPointer * pointer);
extern Method * method_BuiltInContainer_getData;

extern int BuiltInContainer_getFirst_vTblID;
IteratorPointer * BuiltInContainer_getFirst(BuiltInContainer * __i);
extern Method * method_BuiltInContainer_getFirst;

extern int BuiltInContainer_getLast_vTblID;
IteratorPointer * BuiltInContainer_getLast(BuiltInContainer * __i);
extern Method * method_BuiltInContainer_getLast;

extern int BuiltInContainer_getNext_vTblID;
IteratorPointer * BuiltInContainer_getNext(BuiltInContainer * __i, IteratorPointer * pointer);
extern Method * method_BuiltInContainer_getNext;

extern int BuiltInContainer_getPrev_vTblID;
IteratorPointer * BuiltInContainer_getPrev(BuiltInContainer * __i, IteratorPointer * pointer);
extern Method * method_BuiltInContainer_getPrev;

extern int BuiltInContainer_insert_vTblID;
IteratorPointer * BuiltInContainer_insert(BuiltInContainer * __i, IteratorPointer * after, uint64 value);
extern Method * method_BuiltInContainer_insert;

extern int BuiltInContainer_move_vTblID;
void BuiltInContainer_move(BuiltInContainer * __i, IteratorPointer * it, IteratorPointer * after);
extern Method * method_BuiltInContainer_move;

extern int BuiltInContainer_remove_vTblID;
void BuiltInContainer_remove(BuiltInContainer * __i, IteratorPointer * it);
extern Method * method_BuiltInContainer_remove;

extern int BuiltInContainer_removeAll_vTblID;
void BuiltInContainer_removeAll(BuiltInContainer * __i);
extern Method * method_BuiltInContainer_removeAll;

extern int BuiltInContainer_setData_vTblID;
bool BuiltInContainer_setData(BuiltInContainer * __i, IteratorPointer * pointer, uint64 data);
extern Method * method_BuiltInContainer_setData;

extern int BuiltInContainer_sort_vTblID;
void BuiltInContainer_sort(BuiltInContainer * __i, bool ascending);
extern Method * method_BuiltInContainer_sort;

extern Property * property_BuiltInContainer_Container;
extern Container (* BuiltInContainer_to_Container)(BuiltInContainer * b);

extern Property * property_Class_char_ptr;
extern void (* Class_from_char_ptr)(Class * c, const char * value);
extern const char * (* Class_to_char_ptr)(Class * c);

extern int ClassDesignerBase_addObject_vTblID;
void ClassDesignerBase_addObject(ClassDesignerBase __i);
extern Method * method_ClassDesignerBase_addObject;

extern int ClassDesignerBase_createNew_vTblID;
void ClassDesignerBase_createNew(ClassDesignerBase __i, EditBox editBox, Size * clientSize, const char * name, const char * inherit);
extern Method * method_ClassDesignerBase_createNew;

extern int ClassDesignerBase_createObject_vTblID;
void ClassDesignerBase_createObject(ClassDesignerBase __i, DesignerBase designer, Instance instance, ObjectInfo * object, bool isClass, Instance _class);
extern Method * method_ClassDesignerBase_createObject;

extern int ClassDesignerBase_destroyObject_vTblID;
void ClassDesignerBase_destroyObject(ClassDesignerBase __i, Instance object);
extern Method * method_ClassDesignerBase_destroyObject;

extern int ClassDesignerBase_droppedObject_vTblID;
void ClassDesignerBase_droppedObject(ClassDesignerBase __i, Instance instance, ObjectInfo * object, bool isClass, Instance _class);
extern Method * method_ClassDesignerBase_droppedObject;

extern int ClassDesignerBase_fixProperty_vTblID;
void ClassDesignerBase_fixProperty(ClassDesignerBase __i, Property * prop, Instance object);
extern Method * method_ClassDesignerBase_fixProperty;

extern int ClassDesignerBase_listToolBoxClasses_vTblID;
void ClassDesignerBase_listToolBoxClasses(ClassDesignerBase __i, DesignerBase designer);
extern Method * method_ClassDesignerBase_listToolBoxClasses;

extern int ClassDesignerBase_postCreateObject_vTblID;
void ClassDesignerBase_postCreateObject(ClassDesignerBase __i, Instance instance, ObjectInfo * object, bool isClass, Instance _class);
extern Method * method_ClassDesignerBase_postCreateObject;

extern int ClassDesignerBase_prepareTestObject_vTblID;
void ClassDesignerBase_prepareTestObject(ClassDesignerBase __i, DesignerBase designer, Instance test);
extern Method * method_ClassDesignerBase_prepareTestObject;

extern int ClassDesignerBase_reset_vTblID;
void ClassDesignerBase_reset(ClassDesignerBase __i);
extern Method * method_ClassDesignerBase_reset;

extern int ClassDesignerBase_selectObject_vTblID;
void ClassDesignerBase_selectObject(ClassDesignerBase __i, ObjectInfo * object, Instance control);
extern Method * method_ClassDesignerBase_selectObject;

extern int Container_add_vTblID;
IteratorPointer * Container_add(Container __i, tparam_Container_T value);
extern Method * method_Container_add;

extern int Container_copy_vTblID;
void Container_copy(Container __i, Container source);
extern Method * method_Container_copy;

extern int Container_delete_vTblID;
void Container_delete(Container __i, IteratorPointer * i);
extern Method * method_Container_delete;

extern int Container_find_vTblID;
IteratorPointer * Container_find(Container __i, tparam_Container_D value);
extern Method * method_Container_find;

extern int Container_free_vTblID;
void Container_free(Container __i);
extern Method * method_Container_free;

extern int Container_freeIterator_vTblID;
void Container_freeIterator(Container __i, IteratorPointer * it);
extern Method * method_Container_freeIterator;

extern int Container_getAtPosition_vTblID;
IteratorPointer * Container_getAtPosition(Container __i, tparam_Container_I pos, bool create, bool * justAdded);
extern Method * method_Container_getAtPosition;

extern int Container_getCount_vTblID;
int Container_getCount(Container __i);
extern Method * method_Container_getCount;

extern int Container_getData_vTblID;
tparam_Container_D Container_getData(Container __i, IteratorPointer * pointer);
extern Method * method_Container_getData;

extern int Container_getFirst_vTblID;
IteratorPointer * Container_getFirst(Container __i);
extern Method * method_Container_getFirst;

extern int Container_getLast_vTblID;
IteratorPointer * Container_getLast(Container __i);
extern Method * method_Container_getLast;

extern int Container_getNext_vTblID;
IteratorPointer * Container_getNext(Container __i, IteratorPointer * pointer);
extern Method * method_Container_getNext;

extern int Container_getPrev_vTblID;
IteratorPointer * Container_getPrev(Container __i, IteratorPointer * pointer);
extern Method * method_Container_getPrev;

extern int Container_insert_vTblID;
IteratorPointer * Container_insert(Container __i, IteratorPointer * after, tparam_Container_T value);
extern Method * method_Container_insert;

extern int Container_move_vTblID;
void Container_move(Container __i, IteratorPointer * it, IteratorPointer * after);
extern Method * method_Container_move;

extern int Container_remove_vTblID;
void Container_remove(Container __i, IteratorPointer * it);
extern Method * method_Container_remove;

extern int Container_removeAll_vTblID;
void Container_removeAll(Container __i);
extern Method * method_Container_removeAll;

extern int Container_setData_vTblID;
bool Container_setData(Container __i, IteratorPointer * pointer, tparam_Container_D data);
extern Method * method_Container_setData;

extern int Container_sort_vTblID;
void Container_sort(Container __i, bool ascending);
extern Method * method_Container_sort;

extern void (* Container_takeOut)(Container __this, tparam_Container_D d);

extern Property * property_Container_copySrc;
extern void (* Container_set_copySrc)(Container c, Container value);

extern Property * property_Container_firstIterator;
extern void (* Container_get_firstIterator)(Container c, Iterator * value);

extern Property * property_Container_lastIterator;
extern void (* Container_get_lastIterator)(Container c, Iterator * value);

struct class_members_CustomAVLTree
{
   tparam_CustomAVLTree_BT root;
   int count;
};
extern void (* CustomAVLTree_freeKey)(CustomAVLTree __this, AVLNode * item);

struct class_members_DesignerBase
{
   ClassDesignerBase classDesigner;
   const char * objectClass;
   bool isDragging;
};
extern int DesignerBase_addDefaultMethod_vTblID;
void DesignerBase_addDefaultMethod(DesignerBase __i, Instance instance, Instance classInstance);
extern Method * method_DesignerBase_addDefaultMethod;

extern int DesignerBase_addToolBoxClass_vTblID;
void DesignerBase_addToolBoxClass(DesignerBase __i, Class * _class);
extern Method * method_DesignerBase_addToolBoxClass;

extern int DesignerBase_codeAddObject_vTblID;
void DesignerBase_codeAddObject(DesignerBase __i, Instance instance, ObjectInfo * object);
extern Method * method_DesignerBase_codeAddObject;

extern int DesignerBase_deleteObject_vTblID;
void DesignerBase_deleteObject(DesignerBase __i, ObjectInfo * object);
extern Method * method_DesignerBase_deleteObject;

extern int DesignerBase_findObject_vTblID;
bool DesignerBase_findObject(DesignerBase __i, Instance * instance, const char * string);
extern Method * method_DesignerBase_findObject;

extern int DesignerBase_modifyCode_vTblID;
void DesignerBase_modifyCode(DesignerBase __i);
extern Method * method_DesignerBase_modifyCode;

extern int DesignerBase_objectContainsCode_vTblID;
bool DesignerBase_objectContainsCode(DesignerBase __i, ObjectInfo * object);
extern Method * method_DesignerBase_objectContainsCode;

extern int DesignerBase_renameObject_vTblID;
void DesignerBase_renameObject(DesignerBase __i, ObjectInfo * object, const char * name);
extern Method * method_DesignerBase_renameObject;

extern int DesignerBase_selectObjectFromDesigner_vTblID;
void DesignerBase_selectObjectFromDesigner(DesignerBase __i, ObjectInfo * object);
extern Method * method_DesignerBase_selectObjectFromDesigner;

extern int DesignerBase_sheetAddObject_vTblID;
void DesignerBase_sheetAddObject(DesignerBase __i, ObjectInfo * object);
extern Method * method_DesignerBase_sheetAddObject;

extern int DesignerBase_updateProperties_vTblID;
void DesignerBase_updateProperties(DesignerBase __i);
extern Method * method_DesignerBase_updateProperties;

extern Property * property_DesignerBase_classDesigner;
extern void (* DesignerBase_set_classDesigner)(DesignerBase d, ClassDesignerBase value);
extern ClassDesignerBase (* DesignerBase_get_classDesigner)(DesignerBase d);

extern Property * property_DesignerBase_objectClass;
extern void (* DesignerBase_set_objectClass)(DesignerBase d, const char * value);
extern const char * (* DesignerBase_get_objectClass)(DesignerBase d);

extern Property * property_DesignerBase_isDragging;
extern void (* DesignerBase_set_isDragging)(DesignerBase d, bool value);
extern bool (* DesignerBase_get_isDragging)(DesignerBase d);

struct EnumClassData
{
   OldList values;
   int64 largest;
};
extern void (* IOChannel_get)(IOChannel __this, Class * class_data, void * data);

extern void (* IOChannel_put)(IOChannel __this, Class * class_data, void * data);

extern int IOChannel_readData_vTblID;
uint IOChannel_readData(IOChannel __i, void * data, uint numBytes);
extern Method * method_IOChannel_readData;

extern void (* IOChannel_serialize)(IOChannel __this, Class * class_data, void * data);

extern void (* IOChannel_unserialize)(IOChannel __this, Class * class_data, void * data);

extern int IOChannel_writeData_vTblID;
uint IOChannel_writeData(IOChannel __i, const void * data, uint numBytes);
extern Method * method_IOChannel_writeData;

struct Iterator
{
   Container container;
   IteratorPointer * pointer;
};
extern bool (* Iterator_find)(Iterator * __this, tparam_Iterator_T value);

extern void (* Iterator_free)(Iterator * __this);

extern tparam_Iterator_T (* Iterator_getData)(Iterator * __this);

extern bool (* Iterator_index)(Iterator * __this, tparam_Iterator_IT index, bool create);

extern bool (* Iterator_next)(Iterator * __this);

extern bool (* Iterator_prev)(Iterator * __this);

extern void (* Iterator_remove)(Iterator * __this);

extern bool (* Iterator_setData)(Iterator * __this, tparam_Iterator_T value);

extern Property * property_Iterator_data;
extern void (* Iterator_set_data)(Iterator * i, tparam_Iterator_T value);
extern tparam_Iterator_T (* Iterator_get_data)(Iterator * i);

struct Link
{
   union
   {
      LinkElement link;
      struct
      {
         ListItem * prev;
         ListItem * next;
      };
   };
   uint64 data;
};
struct LinkElement
{
   tparam_LinkElement_T prev;
   tparam_LinkElement_T next;
};
struct class_members_LinkList
{
   tparam_LinkList_LT first;
   tparam_LinkList_LT last;
   int count;
};
extern void (* LinkList__Sort)(LinkList __this, bool ascending, LinkList * lists);

struct ListItem
{
   union
   {
      LinkElement link;
      struct
      {
         ListItem * prev;
         ListItem * next;
      };
   };
};
extern Property * property_Map_mapSrc;
extern void (* Map_set_mapSrc)(Map m, Map value);

extern Property * property_MapIterator_map;
extern void (* MapIterator_set_map)(MapIterator * m, Map value);
extern Map (* MapIterator_get_map)(MapIterator * m);

extern Property * property_MapIterator_key;
extern tparam_MapIterator_KT (* MapIterator_get_key)(MapIterator * m);

extern Property * property_MapIterator_value;
extern void (* MapIterator_set_value)(MapIterator * m, tparam_MapIterator_V value);
extern tparam_MapIterator_V (* MapIterator_get_value)(MapIterator * m);

struct MapNode
{
   tparam_MapNode_V value;
};
extern Property * property_MapNode_key;
extern void (* MapNode_set_key)(MapNode * m, tparam_MapNode_KT value);
extern tparam_MapNode_KT (* MapNode_get_key)(MapNode * m);

extern Property * property_MapNode_value;
extern void (* MapNode_set_value)(MapNode * m, tparam_MapNode_V value);
extern tparam_MapNode_V (* MapNode_get_value)(MapNode * m);

extern Property * property_MapNode_prev;
extern MapNode * (* MapNode_get_prev)(MapNode * m);

extern Property * property_MapNode_next;
extern MapNode * (* MapNode_get_next)(MapNode * m);

extern Property * property_MapNode_minimum;
extern MapNode * (* MapNode_get_minimum)(MapNode * m);

extern Property * property_MapNode_maximum;
extern MapNode * (* MapNode_get_maximum)(MapNode * m);

extern Module (* Module_load)(Module __this, const char * name, AccessMode importAccess);

extern int Module_onLoad_vTblID;
bool Module_onLoad(Module __i);
extern Method * method_Module_onLoad;

extern int Module_onUnload_vTblID;
void Module_onUnload(Module __i);
extern Method * method_Module_onUnload;

extern void (* Module_unload)(Module __this, Module module);

extern Property * property_Platform_char_ptr;
extern Platform (* Platform_from_char_ptr)(char * c);
extern const char * (* Platform_to_char_ptr)(Platform platform);

struct class_members_SerialBuffer
{
   byte * _buffer;
   uint count;
   uint _size;
   uint pos;
};
extern void (* SerialBuffer_free)(SerialBuffer __this);

extern Property * property_SerialBuffer_buffer;
extern void (* SerialBuffer_set_buffer)(SerialBuffer s, byte * value);
extern byte * (* SerialBuffer_get_buffer)(SerialBuffer s);

extern Property * property_SerialBuffer_size;
extern void (* SerialBuffer_set_size)(SerialBuffer s, uint value);
extern uint (* SerialBuffer_get_size)(SerialBuffer s);

struct StaticString
{
   char string[1];
};
extern void (* checkConsistency)(void);
extern void (* checkMemory)(void);
extern DesignerBase (* getActiveDesigner)(void);
extern Platform (* getRuntimePlatform)(void);
extern bool (* locateModule)(const char * name, const char * fileName);
extern void (* print)(const Class * class_object, const void * object, ...);
extern int (* printBuf)(char * buffer, int maxLen, const Class * class_object, const void * object, ...);
extern void (* printLn)(const Class * class_object, const void * object, ...);
extern int (* printLnBuf)(char * buffer, int maxLen, const Class * class_object, const void * object, ...);
extern char * (* printLnString)(const Class * class_object, const void * object, ...);
extern char * (* printString)(const Class * class_object, const void * object, ...);
extern void (* setActiveDesigner)(DesignerBase designer);
extern uint (* log2i)(uint number);
extern void (* memswap)(byte * a, byte * b, uint size);
extern uint (* pow2i)(uint number);
extern void (* qsortr)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), void * arg);
extern void (* qsortrx)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), int (* optCompareArgLast)(const void * a, const void * b, void * arg), void * arg, bool deref, bool ascending);
extern void (* queryMemInfo)(char * string);
extern Class * class_Window;
extern Class * class_String;
extern Class * class_byte;
extern Class * class_char;
extern Class * class_class;
extern Class * class_double;
extern Class * class_enum;
extern Class * class_float;
extern Class * class_int;
extern Class * class_int64;
extern Class * class_intptr;
extern Class * class_intsize;
extern Class * class_short;
extern Class * class_struct;
extern Class * class_uint;
extern Class * class_uint16;
extern Class * class_uint32;
extern Class * class_uint64;
extern Class * class_uintptr;
extern Class * class_uintsize;
extern Class * class_BTNode;
extern Class * class_BackSlashEscaping;
extern Class * class_BinaryTree;
extern Class * class_Item;
extern Class * class_Mutex;
extern Class * class_NamedItem;
extern Class * class_NamedLink;
extern Class * class_NamedLink64;
extern Class * class_OldLink;
extern Class * class_OldList;
extern Class * class_StringAllocType;
extern Class * class_StringBTNode;
extern Class * class_StringBinaryTree;
extern Class * class_TreePrintStyle;
extern Class * class_ZString;
extern Class * class_AVLNode;
extern Class * class_AVLTree;
extern Class * class_AccessMode;
extern Class * class_Angle;
extern Class * class_Application;
extern Class * class_Array;
extern Class * class_BTNamedLink;
extern Class * class_BitMember;
extern Class * class_BuiltInContainer;
extern Class * class_CIString;
extern Class * class_Class;
extern Class * class_ClassDesignerBase;
extern Class * class_ClassProperty;
extern Class * class_ClassTemplateArgument;
extern Class * class_ClassTemplateParameter;
extern Class * class_ClassType;
extern Class * class_Container;
extern Class * class_CustomAVLTree;
extern Class * class_DataMember;
extern Class * class_DataMemberType;
extern Class * class_DataValue;
extern Class * class_DefinedExpression;
extern Class * class_DesignerBase;
extern Class * class_EnumClassData;
extern Class * class_GlobalFunction;
extern Class * class_IOChannel;
extern Class * class_ImportType;
extern Class * class_Instance;
extern Class * class_Iterator;
extern Class * class_IteratorPointer;
extern Class * class_Link;
extern Class * class_LinkElement;
extern Class * class_LinkList;
extern Class * class_List;
extern Class * class_ListItem;
extern Class * class_Map;
extern Class * class_MapIterator;
extern Class * class_MapNode;
extern Class * class_Method;
extern Class * class_MethodType;
extern Class * class_Module;
extern Class * class_NameSpace;
extern Class * class_ObjectInfo;
extern Class * class_Platform;
extern Class * class_Property;
extern Class * class_SerialBuffer;
extern Class * class_StaticString;
extern Class * class_SubModule;
extern Class * class_TemplateMemberType;
extern Class * class_TemplateParameterType;


////////////////////////////////////////////////// dll function imports //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////


extern const char * getTranslatedString(constString name, const char * string, const char * stringAndContext);
extern void loadTranslatedStrings(constString moduleName, const char * name);
extern void unloadTranslatedStrings(constString name);
extern void memoryGuard_popLoc(void);
extern void memoryGuard_pushLoc(const char * loc);
extern Application eC_initApp(bool guiApp, int argc, char * argv[]);
extern BitMember * Class_addBitMember(Class * _class, const char * name, const char * type, int bitSize, int bitPos, AccessMode declMode);
extern ClassProperty * Class_addClassProperty(Class * _class, const char * name, const char * dataType, void * setStmt, void * getStmt);
extern DataMember * Class_addDataMember(Class * _class, const char * name, const char * type, uint size, uint alignment, AccessMode declMode);
extern bool Class_addMember(Class * _class, DataMember * dataMember);
extern Method * Class_addMethod(Class * _class, const char * name, const char * type, void * function, AccessMode declMode);
extern Property * Class_addProperty(Class * _class, const char * name, const char * dataType, void * setStmt, void * getStmt, AccessMode declMode);
extern ClassTemplateParameter * Class_addTemplateParameter(Class * _class, const char * name, TemplateParameterType type, const void * info, ClassTemplateArgument * defaultArg);
extern Method * Class_addVirtualMethod(Class * _class, const char * name, const char * type, void * function, AccessMode declMode);
extern void Class_destructionWatchable(Class * _class);
extern void Class_doneAddingTemplateParameters(Class * base);
extern ClassProperty * Class_findClassProperty(Class * _class, const char * name);
extern DataMember * Class_findDataMember(Class * _class, const char * name, Module module, DataMember * subMemberStack, int * subMemberStackPos);
extern DataMember * Class_findDataMemberAndId(Class * _class, const char * name, int * id, Module module, DataMember * subMemberStack, int * subMemberStackPos);
extern DataMember * Class_findDataMemberAndOffset(Class * _class, const char * name, uint * offset, Module module, DataMember * subMemberStack, int * subMemberStackPos);
extern Method * Class_findMethod(Class * _class, const char * name, Module module);
extern void Class_findNextMember(Class * _class, Class * curClass, DataMember * curMember, DataMember * subMemberStack, int * subMemberStackPos);
extern Property * Class_findProperty(Class * _class, const char * name, Module module);
extern Class * Class_getDesigner(Class * _class);
extern int64 Class_getProperty(Class * _class, const char * name);
extern bool Class_isDerived(Class * _class, Class * from);
extern void Class_resize(Class * _class, int newSize);
extern void Class_setProperty(Class * _class, const char * name, int64 value);
extern void Class_unregister(Class * _class);
extern void Enum_addFixedValue(Class * _class, const char * string, int64 value);
extern int64 Enum_addValue(Class * _class, const char * string);
extern void Instance_decRef(Instance instance);
extern void Instance_delete(Instance instance);
extern void Instance_evolve(Instance * instancePtr, Class * _class);
extern void Instance_fireSelfWatchers(Instance instance, Property * _property);
extern void Instance_fireWatchers(Instance instance, Property * _property);
extern Class * Instance_getDesigner(Instance instance);
extern void Instance_incRef(Instance instance);
extern bool Instance_isDerived(Instance instance, Class * from);
extern void * Instance_new(Class * _class);
extern void * Instance_newEx(Class * _class, bool bindingsAlloc);
extern void Instance_setMethod(Instance instance, const char * name, void * function);
extern void Instance_stopWatching(Instance instance, Property * _property, Instance object);
extern void Instance_watch(Instance instance, Property * _property, void * object, void (* callback)(void *, void *));
extern void Instance_watchDestruction(Instance instance, Instance object, void (* callback)(void *, void *));
extern DataMember * Member_addDataMember(DataMember * member, const char * name, const char * type, uint size, uint alignment, AccessMode declMode);
extern bool Member_addMember(DataMember * addTo, DataMember * dataMember);
extern DataMember * Member_new(DataMemberType type, AccessMode declMode);
extern Module Module_load(Module fromModule, const char * name, AccessMode importAccess);
extern Module Module_loadStatic(Module fromModule, const char * name, AccessMode importAccess, bool (* Load)(Module module), bool (* Unload)(Module module));
extern Module Module_loadStrict(Module fromModule, const char * name, AccessMode importAccess);
extern void Module_unload(Module fromModule, Module module);
extern void Property_selfWatch(Class * _class, const char * name, void (* callback)(void *));
extern void Property_watchable(Property * _property);
extern void eC_delete(void * memory);
extern Class * eC_findClass(Module module, const char * name);
extern DefinedExpression * eC_findDefine(Module module, const char * name);
extern GlobalFunction * eC_findFunction(Module module, const char * name);
extern void * eC_new(uint size);
extern void * eC_new0(uint size);
extern Class * eC_registerClass(ClassType type, const char * name, const char * baseName, int size, int sizeClass, bool (* Constructor)(void *), void (* Destructor)(void *), Module module, AccessMode declMode, AccessMode inheritanceAccess);
extern DefinedExpression * eC_registerDefine(const char * name, const char * value, Module module, AccessMode declMode);
extern GlobalFunction * eC_registerFunction(const char * name, const char * type, void * func, Module module, AccessMode declMode);
extern void * eC_renew(void * memory, uint size);
extern void * eC_renew0(void * memory, uint size);
extern void eC_setArgs(Application app, int argc, char * argv[]);
extern void eC_setPoolingDisabled(bool disabled);

extern Module __thisModule;

extern Application eC_init(bool loadEcere, bool guiApp, int argc, char * argv[]);

uint64 TAc(char x);
uint64 TAb(byte x);
uint64 TAs(short x);
uint64 TAus(uint16 x);
uint64 TAi(int x);
uint64 TAui(uint x);
uint64 TAi64(int64 x);
uint64 TAui64(uint64 x);
uint64 TAf(float x);
uint64 TAd(double x);
uint64 TAp(void * x);
uint64 TAo(Instance x);

void * pTAvoid(uint64 x);
Instance oTAInstance(uint64 x);
