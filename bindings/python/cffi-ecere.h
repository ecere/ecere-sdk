typedef struct Class Class;

typedef unsigned char byte;
typedef uint16_t uint16;
typedef uint32_t bool;
typedef uint32_t uint32;
typedef uint32_t uint;
typedef int64_t int64;
typedef uint64_t uint64;
typedef uint32_t Color;
typedef uint32_t ColorAlpha;
typedef uint32 BorderBits;

typedef BorderBits BorderStyle;
enum
{
   BorderStyle_none,
   BorderStyle_contour      = 0x00000001,
   BorderStyle_fixed        = 0x00000003,
   BorderStyle_sizable      = 0x00000007,
   BorderStyle_thin         = 0x00000023,
   BorderStyle_sizableThin  = 0x00000027,
   BorderStyle_deep         = 0x00000008,
   BorderStyle_bevel        = 0x00000010,
   BorderStyle_sizableDeep  = 0x0000000F,
   BorderStyle_sizableBevel = 0x00000017,
   BorderStyle_fixedDeep    = 0x0000000B,
   BorderStyle_fixedBevel   = 0x00000013,
   BorderStyle_deepContour  = 0x00000009
};
typedef BorderBits BorderStyle;

typedef int64_t DialogResult;
enum
{
   DialogResult_cancel = 0x0,
   DialogResult_yes = 0x1,
   DialogResult_no = 0x2,
   DialogResult_ok = 0x3
};

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
   AccessMode_defaultAccess,
   AccessMode_publicAccess,
   AccessMode_privateAccess,
   AccessMode_staticAccess,
   AccessMode_baseSystemAccess
};
typedef enum AccessMode AccessMode;

enum ClassType
{
   ClassType_normalClass,
   ClassType_structClass,
   ClassType_bitClass,
   ClassType_unitClass,
   ClassType_enumClass,
   ClassType_noHeadClass
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

Class * eC_findClass(Module module, const char * name);

Class * eC_registerClass(ClassType type, const char *name, const char *baseName, int size, int sizeClass,
   bool (*Constructor)(void *), void (*Destructor)(void *), Module module, AccessMode declMode, AccessMode inheritanceAccess);

Instance Instance_new(Class * _class);
Instance Instance_newEx(Class * _class, bool bindingsAlloc);
void Instance_setMethod(Instance instance, constString name, void *function);

void Instance_evolve(Instance *instancePtr, Class * _class);

Application eC_init(Module fromModule, bool loadEcere, bool guiApp, int argc, char * argv[]);
Module ecere_init(Module fromModule);

void Application_main(Application app);

extern void (*printLn)(Class * class_object, const void * object, ...);

extern Class * class_int;
extern Class * class_float;
extern Class * class_double;
extern Class * class_String;
extern Class * class_Window;
extern Class * class_Button;
extern Class * class_GuiApplication;

typedef Application GuiApplication;

extern void (* GuiApplication_set_driver)(GuiApplication g, const char * value);

extern Class * class_FontResource;

extern Class * class_BitmapResource;

typedef Instance BitmapResource;

extern void (* BitmapResource_set_fileName)(BitmapResource f, constString v);
extern constString (* BitmapResource_get_fileName)(BitmapResource f);

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
typedef uint32 Modifiers;

typedef Instance WindowController;

enum AnchorValueType
{
   AnchorValueType_none,
   AnchorValueType_offset = 1,
   AnchorValueType_relative,
   AnchorValueType_middleRelative,
   AnchorValueType_cascade,
   AnchorValueType_vTiled,
   AnchorValueType_hTiled
};
typedef enum AnchorValueType AnchorValueType;

typedef struct AnchorValue AnchorValue;
struct AnchorValue
{
   AnchorValueType type;

   union
   {
      int distance;
      float percent;
   };
};

typedef struct MiddleAnchorValue MiddleAnchorValue;
struct MiddleAnchorValue
{
   AnchorValueType type;

   union
   {
      int distance;
      float percent;
   };
};

typedef struct Anchor Anchor;
struct Anchor
{
   union { AnchorValue left; MiddleAnchorValue horz; };
   union { AnchorValue top; MiddleAnchorValue vert; };
   AnchorValue right, bottom;
};


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

extern void (* Window_set_anchor)(Window w, const Anchor * v);
extern void (* Window_get_anchor)(Window w, Anchor * v);

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

extern void (* Window_set_background)(Window w, ColorAlpha background);
extern ColorAlpha (* Window_get_background)(Window w);

extern void (* Window_set_foreground)(Window w, ColorAlpha v);
extern ColorAlpha (* Window_get_foreground)(Window w);

extern void (* Window_set_controller)(Window w, WindowController value);
extern WindowController (* Window_get_controller)(Window w);

extern void (* MessageBox_set_contents)(MessageBox m, constString contents);
//extern constString (* MessageBox_get_contents)(MessageBox m);

typedef Window Picture;

extern Class * class_Picture;

extern void (* Picture_set_image)(Picture p, BitmapResource v);
extern BitmapResource (* Picture_get_image)(Picture p);

#define COLOR_r_MASK       0x00FF0000
#define COLOR_r_SHIFT      16
#define COLOR_g_MASK       0x0000FF00
#define COLOR_g_SHIFT      8
#define COLOR_b_MASK       0x000000FF
#define COLOR_b_SHIFT      0

#define COLORALPHA_a_SHIFT                               24
#define COLORALPHA_a_MASK                                0xFF000000
#define COLORALPHA_color_SHIFT                           0
#define COLORALPHA_color_MASK                            0xFFFFFF

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

bool Button_notifyClicked(Button __i, Window __t, Button button, int x, int y, Modifiers mods);

typedef struct IteratorPointer IteratorPointer;

typedef Instance Container;

IteratorPointer * Container_add(Container __i, uint64_t value);

extern void (* Container_set_copySrc)(Container c, Container value);

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
// uint64 TAst(void x);
uint64 TAo(Instance x);

typedef struct BuiltInContainer BuiltInContainer;

struct BuiltInContainer
{
   void * _vTbl;
   Class * _class;
   int _refCount;
   void * data;
   int count;
   Class * type;
};

extern Class * class_BuiltInContainer;
