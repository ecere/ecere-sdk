typedef struct class_members_Instance * Instance;
typedef Instance Module;
typedef Module Application;
typedef struct Class Class;
typedef uint32_t bool;
typedef uint32_t Color;

typedef char * String;
typedef const char * constString;

//struct Class { ...; };

Instance Instance_new(Class * _class);
Instance Instance_newEx(Class * _class, bool bindingsAlloc);

void Instance_evolve(Instance *instancePtr, Class * _class);

Application eC_init(bool guiApp, int argc, char * argv[]);
Module ecere_init(Module fromModule);

void Application_main(Application app);

extern void (*PrintLn)(Class * class_object, const void * object, ...);

extern Class * class_int;
// extern Class * class_float;
extern Class * class_double;
extern Class * class_String;
extern Class * class_Window;
extern Class * class_GuiApplication;

#define false 0
#define true 1

typedef struct Size Size;
struct Size { int w, h; };

typedef Instance FontResource;

typedef Instance Window;
typedef int64_t DialogResult;

extern DialogResult (* Window_modal)(Window);
extern bool (* Window_create)(Window);
extern void (* FontResource_set_size)(FontResource f, float v);

extern void (* Window_set_size)(Window w, const Size * v);

extern void (* Window_set_hasClose)(Window w, bool hasClose);
extern bool (* Window_get_hasClose)(Window w);

extern void (* Window_set_caption)(Window w, constString caption);
extern constString (* Window_get_caption)(Window w);

extern void (* Window_set_background)(Window w, Color background);
extern Color (* Window_get_background)(Window w);

#define COLOR_r_MASK       0x00FF0000
#define COLOR_r_SHIFT      16
#define COLOR_g_MASK       0x0000FF00
#define COLOR_g_SHIFT      8
#define COLOR_b_MASK       0x000000FF
#define COLOR_b_SHIFT      0
