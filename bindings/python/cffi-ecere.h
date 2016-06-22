typedef struct Class Class;
typedef uint32_t bool;
typedef uint32_t uint32;
typedef uint32_t Color;
typedef uint32 BorderBits;

enum enum_BorderStyle
{
   none,
   contour      = 0x00000001,
   fixed        = 0x00000003,
   sizable      = 0x00000007,
   thin         = 0x00000023,
   sizableThin  = 0x00000027,
   deep         = 0x00000008,
   bevel        = 0x00000010,
   sizableDeep  = 0x0000000F,
   sizableBevel = 0x00000017,
   fixedDeep    = 0x0000000B,
   fixedBevel   = 0x00000013,
   deepContour  = 0x00000009
};
typedef BorderBits BorderStyle;

struct class_members_Instance
{
   void **_vTbl;
   Class * _class;
   int _refCount;
};

typedef struct class_members_Instance * Instance;

typedef Instance Module;
typedef Module Application;

enum AccessMode
{
   defaultAccess,
   publicAccess,
   privateAccess,
   staticAccess,
   baseSystemAccess
};
typedef enum AccessMode AccessMode;

enum ClassType
{
   normalClass,
   structClass,
   bitClass,
   unitClass,
   enumClass,
   noHeadClass
};
typedef enum ClassType ClassType;

typedef char * String;
typedef const char * constString;

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
   ...;
   /*BinaryTree methods;
   BinaryTree members;
   BinaryTree prop;
   OldList membersAndProperties;
   BinaryTree classProperties;
   OldList derivatives;
   */
   int memberID;
   int startMemberID;
   //ClassType type;
   Module module;
   //NameSpace * nameSpace;
   const char *dataTypeString;
   //Type dataType;
   int typeSize;
   int defaultAlignment;
   //void (*Initialize)();
   int memberOffset;
   //OldList selfWatchers;
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
   //OldList delayedCPValues;
   //AccessMode inheritanceAccess;
   const char *fullName;
   void *symbol;
   /*OldList conversions;
   OldList templateParams;
   ClassTemplateArgument * templateArgs;*/
   Class * templateClass;
   //OldList templatized;
   int numParams;
   bool isInstanceClass;
   bool byValueSystemClass;
   void * bindingsClass;
};

constString getTranslatedString(constString name, constString string, constString stringAndContext);

Class * eC_registerClass(ClassType type, const char *name, const char *baseName, int size, int sizeClass,
   bool (*Constructor)(void *), void (*Destructor)(void *), Module module, AccessMode declMode, AccessMode inheritanceAccess);

Instance Instance_new(Class * _class);
Instance Instance_newEx(Class * _class, bool bindingsAlloc);
void Instance_setMethod(Instance instance, constString name, void *function);

void Instance_evolve(Instance *instancePtr, Class * _class);

Application eC_init(bool loadEcere, bool guiApp, int argc, char * argv[]);
Module ecere_init(Module fromModule);

void Application_main(Application app);

extern void (*PrintLn)(Class * class_object, const void * object, ...);

extern Class * class_int;
// extern Class * class_float;
extern Class * class_double;
extern Class * class_String;
extern Class * class_Window;
extern Class * class_Button;
extern Class * class_GuiApplication;

extern Class * class_FontResource;

#define false 0
#define true 1

typedef struct Size Size;
struct Size { int w, h; };

typedef struct Point Point;
struct Point { int x, y; };

typedef Instance Surface;

extern void (* Surface_writeTextf)(Surface s, int x, int y, const char * format, ...);

typedef Instance FontResource;

extern void (* FontResource_set_faceName)(FontResource f, constString v);
extern constString (* FontResource_get_faceName)(FontResource f);

extern void (* FontResource_set_size)(FontResource f, float v);
extern float (* FontResource_get_size)(FontResource f);

extern void (* FontResource_set_bold)(FontResource f, bool v);
extern bool (* FontResource_get_bold)(FontResource f);

extern void (* FontResource_set_italic)(FontResource f, bool v);
extern bool (* FontResource_get_italic)(FontResource f);

extern void (* FontResource_set_outlineSize)(FontResource f, float v);
extern float (* FontResource_get_outlineSize)(FontResource f);

extern void (* FontResource_set_outlineFade)(FontResource f, float v);
extern float (* FontResource_get_outlineFade)(FontResource f);

typedef Instance Window;
typedef Window Button;
typedef Window MessageBox;
typedef int64_t DialogResult;
typedef uint32 Modifiers;

extern DialogResult (* Window_modal)(Window);
extern bool (* Window_create)(Window);

extern void (* Window_set_parent)(Window w, Window v);
extern Window (* Window_get_parent)(Window w);

extern void (* Window_set_displayDriver)(Window w, constString v);
extern constString (* Window_get_displayDriver)(Window w);

extern void (* Window_set_size)(Window w, const Size * v);
extern void (* Window_get_size)(Window w, Size * v);

extern void (* Window_set_font)(Window w, const FontResource font);
extern FontResource (* Window_get_font)(Window w);

extern void (* Window_set_position)(Window w, const Point * v);
extern void (* Window_get_position)(Window w, Point * v);

extern void (* Window_set_hasClose)(Window w, bool hasClose);
extern bool (* Window_get_hasClose)(Window w);

extern void (* Window_set_hasMaximize)(Window w, bool hasMaximize);
extern bool (* Window_get_hasMaximize)(Window w);

extern void (* Window_set_hasMinimize)(Window w, bool hasMinimize);
extern bool (* Window_get_hasMinimize)(Window w);

extern void (* Window_set_caption)(Window w, constString caption);
extern constString (* Window_get_caption)(Window w);

extern void (* Window_set_borderStyle)(Window w, BorderStyle borderStyle);
extern BorderStyle (* Window_get_borderStyle)(Window w);

extern void (* Window_set_background)(Window w, Color background);
extern Color (* Window_get_background)(Window w);

extern void (* Window_set_foreground)(Window w, Color v);
extern Color (* Window_get_foreground)(Window w);

extern void (* MessageBox_set_contents)(MessageBox m, constString contents);
extern constString (* MessageBox_get_contents)(MessageBox m);

#define COLOR_r_MASK       0x00FF0000
#define COLOR_r_SHIFT      16
#define COLOR_g_MASK       0x0000FF00
#define COLOR_g_SHIFT      8
#define COLOR_b_MASK       0x000000FF
#define COLOR_b_SHIFT      0

#define BORDERBITS_contour_MASK  0x00000001
#define BORDERBITS_contour_SHIFT 0
#define BORDERBITS_fixed_MASK    0x00000002
#define BORDERBITS_fixed_SHIFT   1
#define BORDERBITS_sizable_MASK  0x00000004
#define BORDERBITS_sizable_SHIFT 2
#define BORDERBITS_deep_MASK     0x00000008
#define BORDERBITS_deep_SHIFT    3
#define BORDERBITS_bevel_MASK    0x00000010
#define BORDERBITS_bevel_SHIFT   4
#define BORDERBITS_thin_MASK     0x00000020
#define BORDERBITS_thin_SHIFT    5
