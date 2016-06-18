typedef struct class_members_Instance * Instance;
typedef Instance Module;
typedef Module Application;
typedef struct Class Class;
typedef uint32_t bool;

//struct Class { ...; };

Instance Instance_new(Class * _class);
Instance Instance_newEx(Class * _class, bool bindingsAlloc);

void Instance_evolve(Instance *instancePtr, Class * _class);

Application eC_init(bool guiApp, int argc, char * argv[]);
Module ecere_init(Module fromModule);

extern void (*PrintLn)(Class * class_object, const void * object, ...);

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
extern void (* FontResource_set_size)(FontResource f, float v);

extern void (* Window_set_size)(Window w, const Size * v);

extern void (* Window_set_hasClose)(Window w, bool hasClose);
extern bool (* Window_get_hasClose)(Window w);
