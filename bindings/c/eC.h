//////////////////////////////////////////////////////////////////////////////// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////
////                                                                        //// ////////////////////////
////    Core eC Library                                                     //// ////////////////////////
////                                                                        //// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////


#if !defined(__EC_H__)
#define __EC_H__

#define CPP11 (defined(__cplusplus) && __cplusplus >= 201103L)

#ifdef __cplusplus

extern "C" {

#endif

////////////////////////////////////////////////////////////// includes //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////

#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>



#if !defined(BINDINGS_SHARED)
#define LIB_EXPORT
#define LIB_IMPORT
#elif defined(__WIN32__)
#define LIB_EXPORT __attribute__((dllexport)) __attribute__ ((visibility("default")))
#define LIB_IMPORT __attribute__((dllimport))
#else
#define LIB_EXPORT __attribute__ ((visibility("default")))
#define LIB_IMPORT
#endif

#undef THIS_LIB_IMPORT
#ifdef EC_EXPORT
#define THIS_LIB_IMPORT LIB_EXPORT
#elif defined(BINDINGS_SHARED)
#define THIS_LIB_IMPORT LIB_IMPORT
#else
#define THIS_LIB_IMPORT
#endif



///////////////////////////////////////////////////////////// functions //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////

#define getTranslatedString              __ecereNameSpace__ecere__GetTranslatedString
#define loadTranslatedStrings            __ecereNameSpace__ecere__LoadTranslatedStrings
#define unloadTranslatedStrings          __ecereNameSpace__ecere__UnloadTranslatedStrings
#define memoryGuard_popLoc               __ecereNameSpace__ecere__com__MemoryGuard_PopLoc
#define memoryGuard_pushLoc              __ecereNameSpace__ecere__com__MemoryGuard_PushLoc
#define eC_initApp                       __ecereNameSpace__ecere__com____ecere_COM_Initialize
#define Class_addBitMember               __ecereNameSpace__ecere__com__eClass_AddBitMember
#define Class_addClassProperty           __ecereNameSpace__ecere__com__eClass_AddClassProperty
#define Class_addDataMember              __ecereNameSpace__ecere__com__eClass_AddDataMember
#define Class_addMember                  __ecereNameSpace__ecere__com__eClass_AddMember
#define Class_addMethod                  __ecereNameSpace__ecere__com__eClass_AddMethod
#define Class_addProperty                __ecereNameSpace__ecere__com__eClass_AddProperty
#define Class_addTemplateParameter       __ecereNameSpace__ecere__com__eClass_AddTemplateParameter
#define Class_addVirtualMethod           __ecereNameSpace__ecere__com__eClass_AddVirtualMethod
#define Class_destructionWatchable       __ecereNameSpace__ecere__com__eClass_DestructionWatchable
#define Class_doneAddingTemplateParameters __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters
#define Class_findClassProperty          __ecereNameSpace__ecere__com__eClass_FindClassProperty
#define Class_findDataMember             __ecereNameSpace__ecere__com__eClass_FindDataMember
#define Class_findDataMemberAndId        __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId
#define Class_findDataMemberAndOffset    __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset
#define Class_findMethod                 __ecereNameSpace__ecere__com__eClass_FindMethod
#define Class_findNextMember             __ecereNameSpace__ecere__com__eClass_FindNextMember
#define Class_findProperty               __ecereNameSpace__ecere__com__eClass_FindProperty
#define Class_getDesigner                __ecereNameSpace__ecere__com__eClass_GetDesigner
#define Class_getProperty                __ecereNameSpace__ecere__com__eClass_GetProperty
#define Class_isDerived                  __ecereNameSpace__ecere__com__eClass_IsDerived
#define Class_resize                     __ecereNameSpace__ecere__com__eClass_Resize
#define Class_setProperty                __ecereNameSpace__ecere__com__eClass_SetProperty
#define Class_unregister                 __ecereNameSpace__ecere__com__eClass_Unregister
#define Enum_addFixedValue               __ecereNameSpace__ecere__com__eEnum_AddFixedValue
#define Enum_addValue                    __ecereNameSpace__ecere__com__eEnum_AddValue
#define Instance_decRef                  __ecereNameSpace__ecere__com__eInstance_DecRef
#define Instance_delete                  __ecereNameSpace__ecere__com__eInstance_Delete
#define Instance_evolve                  __ecereNameSpace__ecere__com__eInstance_Evolve
#define Instance_fireSelfWatchers        __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers
#define Instance_fireWatchers            __ecereNameSpace__ecere__com__eInstance_FireWatchers
#define Instance_getDesigner             __ecereNameSpace__ecere__com__eInstance_GetDesigner
#define Instance_incRef                  __ecereNameSpace__ecere__com__eInstance_IncRef
#define Instance_isDerived               __ecereNameSpace__ecere__com__eInstance_IsDerived
#define Instance_new                     __ecereNameSpace__ecere__com__eInstance_New
#define Instance_newEx                   __ecereNameSpace__ecere__com__eInstance_NewEx
#define Instance_setMethod               __ecereNameSpace__ecere__com__eInstance_SetMethod
#define Instance_stopWatching            __ecereNameSpace__ecere__com__eInstance_StopWatching
#define Instance_watch                   __ecereNameSpace__ecere__com__eInstance_Watch
#define Instance_watchDestruction        __ecereNameSpace__ecere__com__eInstance_WatchDestruction
#define Member_addDataMember             __ecereNameSpace__ecere__com__eMember_AddDataMember
#define Member_addMember                 __ecereNameSpace__ecere__com__eMember_AddMember
#define Member_new                       __ecereNameSpace__ecere__com__eMember_New
#define Module_load                      __ecereNameSpace__ecere__com__eModule_Load
#define Module_loadStatic                __ecereNameSpace__ecere__com__eModule_LoadStatic
#define Module_loadStrict                __ecereNameSpace__ecere__com__eModule_LoadStrict
#define Module_unload                    __ecereNameSpace__ecere__com__eModule_Unload
#define Property_selfWatch               __ecereNameSpace__ecere__com__eProperty_SelfWatch
#define Property_watchable               __ecereNameSpace__ecere__com__eProperty_Watchable
#define eC_delete                        __ecereNameSpace__ecere__com__eSystem_Delete
#define eC_findClass                     __ecereNameSpace__ecere__com__eSystem_FindClass
#define eC_findDefine                    __ecereNameSpace__ecere__com__eSystem_FindDefine
#define eC_findFunction                  __ecereNameSpace__ecere__com__eSystem_FindFunction
#define eC_new                           __ecereNameSpace__ecere__com__eSystem_New
#define eC_new0                          __ecereNameSpace__ecere__com__eSystem_New0
#define eC_registerClass                 __ecereNameSpace__ecere__com__eSystem_RegisterClass
#define eC_registerDefine                __ecereNameSpace__ecere__com__eSystem_RegisterDefine
#define eC_registerFunction              __ecereNameSpace__ecere__com__eSystem_RegisterFunction
#define eC_renew                         __ecereNameSpace__ecere__com__eSystem_Renew
#define eC_renew0                        __ecereNameSpace__ecere__com__eSystem_Renew0
#define eC_setArgs                       __ecereNameSpace__ecere__com__eSystem_SetArgs
#define eC_setPoolingDisabled            __ecereNameSpace__ecere__com__eSystem_SetPoolingDisabled


//////////////////////////////////////////////////////// binding macros //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////

#ifndef ECPRFX
#define ECPRFX
#endif

#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif

// Macros to select proper other macro with proper number of arguments
#define NARG_(...)                           ARGN(__VA_ARGS__)
#define NARG(...)                            NARG_(__VA_ARGS__, 6, 5, 4, 3, 2)
#define ARGN(_1, _2, _3, _4, _5, _6, x, ...) x

// CONCATI(): Two level of indirection so that the preprocessor resolve macros rather than concatenating the macro name
// _CONCAT(): One level of indirection for use by the var args macros
#define _CONCAT(a, b)                  a ## b
#define CONCATI(a, b)                  _CONCAT(a, b)

// Apply the ECPRX to an eC class/type
#define C(x)                           CONCATI(ECPRFX, x)

// CONCATU(): Concatenate with underscores
#define _CONCATU_2(a, b)               a ## _ ## b
#define _CONCATU_3(a, b, c)            a ## _ ## b ## _ ## c
#define _CONCATU_4(a, b, c, d)         a ## _ ## b ## _ ## c ## _ ## d
#define _CONCATU_5(a, b, c, d, e)      a ## _ ## b ## _ ## c ## _ ## d ## _ ## e
#define _CONCATU_6(a, b, c, d, e, f)   a ## _ ## b ## _ ## c ## _ ## d ## _ ## e ## _ ## f
#define _CONCATUN(n, ...)              _CONCAT(_CONCATU_,n)(__VA_ARGS__)
#define CONCATU(...)                   _CONCATUN(NARG(__VA_ARGS__), __VA_ARGS__)

// T(): Used to typedef a templatized class to its template class, so as to clarify expectations (note: typedef is equivalent, cannot be type-checked)
//      e.g. typedef C(Array) T(Array, Color); void printColors(T(Array, Color) colors) { printLn(colors); };
#define T(n...)                        CONCATU(template, n)

// CO(): Used to access or define a first-class Class object
//       Classes already used in modules are predefined and can be directly accesses and instantiated
//          e.g. C(Window) win = newi(Window);
//       New classes can be defined and initialized with return value from registerClass();
//          e.g. Class * CO(Foo); CO(Foo) = registerClass(module, Foo, Map<String, int>);
//       Templatized classes can be defined and initialized with eC_findClass()
//          e.g. C(Class) * CO(Array, ColorAlpha); CO(Array, ColorAlpha) = eC_findClass(module, "Array<ColorAlpha>");
#define CO(n...)                       CONCATU(class, n)

/* CM(): Used to define/access the class member structure for regular eC classes at a specific level of inheritance
         e.g.
            struct CM(Foo) { int foo; };
            typedef Instance Foo;
            C(Class) * CO(Foo);
            bool Foo_constructor(Foo this)
            {
               struct CM(Foo) * self = IPTR(this, Foo);
               return true;
            }
            bool Foo_destructor(Foo this) { }
            ...
               CO(Foo) = registerClass(module, Foo, Instance);
            ...
*/
#define CM(c)                          CONCATU(class_members, c)

// S(c: class name, x...: for all the initializers):
//       Used to quickly pass structs by reference
#define S(c, x...) ({c __i = { x }; &__i;})

// TP(n: class name, p: template parameter name):
//       Used to specify member method types with a template parameter of a class
//       e.g.  void Container_add(C(Container) c, TP(Container, T) value);
#define TP(n, p)                       CONCATU(tparam, n, p)

// template argument macros type abbreviations:
//          c: char
//          uc: unsigned char (byte)
//          s: short,
//          us: unsigned short (uint16)
//          i: int
//          ui: uint
//          i64: int64
//          ui64: uint64
//          f: float
//          d: double
//          p: pointer
//          st: struct
//          o: object

// TA...(): Used to pass data values as template arguments
//          e.g. Container_add(ad, TAd(3.14159));
#define TAc(x)     ({ C(DataValue) p = { .c = x };    p.ui64; })
#define TAb(x)     ({ C(DataValue) p = { .uc = x };   p.ui64; })
#define TAs(x)     ({ C(DataValue) p = { .s = x };    p.ui64; })
#define TAus(x)    ({ C(DataValue) p = { .us = x };   p.ui64; })
#define TAi(x)     ({ C(DataValue) p = { .i = x };    p.ui64; })
#define TAui(x)    ({ C(DataValue) p = { .ui = x };   p.ui64; })
#define TAi64(x)   ({ C(DataValue) p = { .i64 = x };  p.ui64; })
#define TAui64(x)  (x)
#define TAf(x)     ({ C(DataValue) p = { .f = x };    p.ui64; })
#define TAd(x)     ({ C(DataValue) p = { .d = x };    p.ui64; })
#define TAp(x)     ({ C(DataValue) p = { .p = x };    p.ui64; })
#define TAst(x)    TAp(&(x))
#define TAo(x)     TAp(x)

// ...TA(): Used to retreieve data values from template arguments
//          e.g. void Foo_add(Foo this, TP(Foo, A) value) { double d = dTA(value); }

#define cTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.c; })
#define bTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.uc; })
#define sTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.s; })
#define usTA(x)    ({ C(DataValue) p = { .ui64 = x }; p.us; })
#define iTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.i; })
#define uiTA(x)    ({ C(DataValue) p = { .ui64 = x }; p.ui; })
#define i64TA(x)   ({ C(DataValue) p = { .ui64 = x }; p.i64; })
#define ui64TA(x)  (x)
#define fTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.f; })
#define dTA(x)     ({ C(DataValue) p = { .ui64 = x }; p.d; })
#define pTA(t, x)  ({ C(DataValue) p = { .ui64 = x }; (t *)p.p; })
#define stTA(s, x) ({ C(DataValue) p = { .ui64 = x }; *(s *)p.p; })
#define oTA(c, x)  ((C(c)) pTA(struct CM(Instance), x))

#define oTAInstance(x)  oTA(Instance, x)
#define pTAvoid(x)      pTA(void, x)

// thisclass(): Used to specify an eC 'thisclass' type, which morphs into the derived class type when inherited
//              Note: Resolves to the same type so cannot be type checked
#define thisclass(x)                   C(x)
#define subclass(x)                    C(Class) *

#define PROPERTY(c, p)   CONCATU(property, c, p)
#define METHOD(c, m)     CONCATU(method, c, m)
#define M_VTBLID(c, m)   CONCATU(c, m, vTblID)
#define FUNCTION(f)      CONCATU(function, f)

// _ARG: Used to specify comma for parameters/arguments list being passed to macros
#define _ARG ,

// VMETHOD(c: class object, mc: method class, m: method name, i: instance object, r: return type, p: parameters, a: arguments)
//    Used to define a virtual method invoker, e.g.:
//    #define Container_add(__i, value) VMETHOD(Container, add, __i, C(IteratorPointer), C(Container) _ARG TP(Container, T), __i _ARG value)
#define VMETHOD(c, mc, m, i, r, p, a)   ({ r (* method)(p) = (r (*)(p))((i) ? (i)->_vTbl : c->_vTbl)[M_VTBLID(mc, m)]; method ? method(a) : (r)0; })

// Macros for translated strings
#define $(x)      (constString)getTranslatedString(MODULE_NAME, x, null)
#define $$(x, c)  (constString)getTranslatedString(MODULE_NAME, x, c)

// More macros
#define IPTR(x, c) ((struct CM(c) *)((x) ? (((char *)(x)) + CO(c)->offset) : 0))

#define incref(x) (x)->_refCount++;

#define newb(c) eC_new(c)
#define newi(c...) ({ C(Instance) i = Instance_new(CO(c)); incref(i); i; })
#define newcs(c...) ((c *)Instance_new(CO(c)))
#define newc(t, c) (t *)eC_new(CO(t)->structSize * c)
#define newt(t, c) (t *)eC_new(sizeof(t) * c)

#define deletei(v) Instance_decRef(v), v = null
#ifndef __cplusplus
   #define delete(v) eC_delete(v), v = null
#endif

#define BIC(c, d) \
   ({ struct BuiltInContainer src = { \
      CO(BuiltInContainer)->_vTbl, CO(BuiltInContainer), 0, \
      d, sizeof(d) / sizeof((d)[0]), CO(c) }; \
   (Container)&src; })

#ifndef __cplusplus
   #define registerClass(a, n, b...)  \
      eC_registerClass(ClassType_normalClass, #n, #b, sizeof(struct CM(n)), 0, \
         (void *)n ## _constructor, (void *)n ## _destructor, a, AccessMode_publicAccess, AccessMode_publicAccess)
#endif

#define addMethod(c, n, m) \
   Class_addMethod(c, n, null, (void *)m, AccessMode_publicAccess)

#if defined(__WIN32__) && !defined(__CONSOLE_APP__)
   typedef void * HINSTANCE;
   #define WINAPI __stdcall
   #define MAIN_DECLARATION int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)
   #define eC_init_CALL(linkEcere) eC_init(linkEcere, true, 0, null)
#else
   #define MAIN_DECLARATION int main(int argc, char * argv[])
   #ifdef __cplusplus
      #if defined(__CONSOLE_APP__)
         #define eC_init_CALL(linkEcere) eC_init(linkEcere, false, null, null)
      #else
         #define eC_init_CALL(linkEcere) eC_init(linkEcere, true, null, null)
      #endif
   #else
      #if defined(__CONSOLE_APP__)
         #define eC_init_CALL(linkEcere) eC_init(linkEcere, false, argc, argv)
      #else
         #define eC_init_CALL(linkEcere) eC_init(linkEcere, true, argc, argv)
      #endif
   #endif
#endif

#define APP_INTRO(linkEcere) \
   MAIN_DECLARATION \
   { \
      C(Application) app = eC_init_CALL(linkEcere);

#define APP_OUTRO \
      int exitCode = IPTR(app, Application)->exitCode; \
      deletei(app); \
      return exitCode; \
   }

#if defined(__WIN32__)
   #define MODULE_EXPORT extern __attribute__((dllexport))
#else
   #define MODULE_EXPORT extern __attribute__ ((visibility("default")))
#endif

#define MODULE_LOAD     MODULE_EXPORT uint __ecereDll_Load(C(Module) module)

#define MODULE_UNLOAD   MODULE_EXPORT uint __ecereDll_Unload(C(Module) module)

///////////////////////////////////////////////////////////// HARDCODED //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////

// special types
typedef const void * any_object;
typedef const char * constString;

// libecere stuff that bleeds into ecereCOM
#if CPP11
enum C(Alignment) : int
#else
typedef int C(Alignment);
enum C(Alignment)
#endif
{
   Alignment_left = 0x0,
   Alignment_right = 0x1,
   Alignment_center = 0x2
};
typedef uint32_t C(DataDisplayFlags);

// libec stuff
typedef void C(Type);
typedef void C(Instantiation);
typedef void C(ClassDefinition);

typedef struct CM(Instance) * C(Instance);
typedef C(Instance) C(Surface);
typedef C(Instance) C(Window);
typedef C(Window) C(CommonControl);
typedef C(CommonControl) C(DataBox);
typedef C(CommonControl) C(EditBox);

typedef int C(MinMaxValue);
struct C(Size)
{
   C(MinMaxValue) w;
   C(MinMaxValue) h;
};
typedef struct C(Size) C(Size);

// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////  ecere||gui  ////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////


// start -- moved backwards outputs
typedef struct CM(Instance) * C(Instance);
// end -- moved backwards outputs
typedef C(Instance) C(Window);

// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////    //////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////


// start -- moved backwards outputs
typedef struct C(Property) C(Property);
typedef struct C(Method) C(Method);
typedef C(Instance) C(IOChannel);
typedef struct C(Class) C(Class);
typedef uint32_t uint;
typedef uint C(bool);
#if !defined(__bool_true_false_are_defined) && !defined(__cplusplus)
enum boolean {
   true = 0x1,
   false = 0x0
};
#endif
#define eC_true   ((C(bool))1)
#define eC_false  ((C(bool))0)

// end -- moved backwards outputs
#define fstrcmp ((__runtimePlatform == Platform_win32) ? strcmpi : strcmp)

#define strcmpi (strcasecmp)

#define strnicmp (strncasecmp)

typedef char * C(String);
typedef uint8_t byte;
typedef int64_t int64;
typedef intptr_t intptr;
typedef ssize_t intsize;
typedef uint16_t uint16;
typedef uint32_t uint32;
typedef uint64_t uint64;
typedef uintptr_t uintptr;
typedef size_t uintsize;
typedef uint32_t unichar;

extern THIS_LIB_IMPORT int M_VTBLID(class, onCompare);
// int _onCompare(C(Class) * __c, any_object __i, any_object object);
#define _onCompare(__c, __i, object) \
   VMETHOD(__c, class, onCompare, (C(Instance))null, int, \
      C(Class) * _ARG any_object _ARG any_object, \
      __c _ARG __i _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onCompare);

extern THIS_LIB_IMPORT int M_VTBLID(class, onCopy);
// void _onCopy(C(Class) * __c, any_object __i, any_object newData);
#define _onCopy(__c, __i, newData) \
   VMETHOD(__c, class, onCopy, (C(Instance))null, void, \
      C(Class) * _ARG any_object _ARG any_object, \
      __c _ARG __i _ARG newData)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onCopy);

extern THIS_LIB_IMPORT int M_VTBLID(class, onDisplay);
// void _onDisplay(C(Class) * __c, any_object __i, C(Surface) surface, int x, int y, int width, void * fieldData, C(Alignment) alignment, C(DataDisplayFlags) displayFlags);
#define _onDisplay(__c, __i, surface, x, y, width, fieldData, alignment, displayFlags) \
   VMETHOD(__c, class, onDisplay, (C(Instance))null, void, \
      C(Class) * _ARG any_object _ARG C(Surface) _ARG int _ARG int _ARG int _ARG void * _ARG C(Alignment) _ARG C(DataDisplayFlags), \
      __c _ARG __i _ARG surface _ARG x _ARG y _ARG width _ARG fieldData _ARG alignment _ARG displayFlags)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onDisplay);

extern THIS_LIB_IMPORT int M_VTBLID(class, onEdit);
// C(Window) _onEdit(C(Class) * __c, any_object __i, C(DataBox) dataBox, C(DataBox) obsolete, int x, int y, int w, int h, void * userData);
#define _onEdit(__c, __i, dataBox, obsolete, x, y, w, h, userData) \
   VMETHOD(__c, class, onEdit, (C(Instance))null, C(Window), \
      C(Class) * _ARG any_object _ARG C(DataBox) _ARG C(DataBox) _ARG int _ARG int _ARG int _ARG int _ARG void *, \
      __c _ARG __i _ARG dataBox _ARG obsolete _ARG x _ARG y _ARG w _ARG h _ARG userData)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onEdit);

extern THIS_LIB_IMPORT int M_VTBLID(class, onFree);
// void _onFree(C(Class) * __c, any_object __i);
#define _onFree(__c, __i) \
   VMETHOD(__c, class, onFree, (C(Instance))null, void, \
      C(Class) * _ARG any_object, \
      __c _ARG __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onFree);

extern THIS_LIB_IMPORT int M_VTBLID(class, onGetDataFromString);
// C(bool) _onGetDataFromString(C(Class) * __c, any_object __i, const char * string);
#define _onGetDataFromString(__c, __i, string) \
   VMETHOD(__c, class, onGetDataFromString, (C(Instance))null, C(bool), \
      C(Class) * _ARG any_object _ARG const char *, \
      __c _ARG __i _ARG string)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onGetDataFromString);

extern THIS_LIB_IMPORT int M_VTBLID(class, onGetString);
// const char * _onGetString(C(Class) * __c, any_object __i, char * tempString, void * fieldData, C(bool) * needClass);
#define _onGetString(__c, __i, tempString, fieldData, needClass) \
   VMETHOD(__c, class, onGetString, (C(Instance))null, const char *, \
      C(Class) * _ARG any_object _ARG char * _ARG void * _ARG C(bool) *, \
      __c _ARG __i _ARG tempString _ARG fieldData _ARG needClass)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onGetString);

extern THIS_LIB_IMPORT int M_VTBLID(class, onSaveEdit);
// C(bool) _onSaveEdit(C(Class) * __c, any_object __i, C(Window) window, void * object);
#define _onSaveEdit(__c, __i, window, object) \
   VMETHOD(__c, class, onSaveEdit, (C(Instance))null, C(bool), \
      C(Class) * _ARG any_object _ARG C(Window) _ARG void *, \
      __c _ARG __i _ARG window _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onSaveEdit);

extern THIS_LIB_IMPORT int M_VTBLID(class, onSerialize);
// void _onSerialize(C(Class) * __c, any_object __i, C(IOChannel) channel);
#define _onSerialize(__c, __i, channel) \
   VMETHOD(__c, class, onSerialize, (C(Instance))null, void, \
      C(Class) * _ARG any_object _ARG C(IOChannel), \
      __c _ARG __i _ARG channel)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onSerialize);

extern THIS_LIB_IMPORT int M_VTBLID(class, onUnserialize);
// void _onUnserialize(C(Class) * __c, any_object __i, C(IOChannel) channel);
#define _onUnserialize(__c, __i, channel) \
   VMETHOD(__c, class, onUnserialize, (C(Instance))null, void, \
      C(Class) * _ARG any_object _ARG C(IOChannel), \
      __c _ARG __i _ARG channel)
extern THIS_LIB_IMPORT C(Method) * METHOD(class, onUnserialize);

extern THIS_LIB_IMPORT int M_VTBLID(class, onCompare);
// int Instance_onCompare(C(Class) * __c, C(Instance) __i, any_object object);
#define Instance_onCompare(__c, __i, object) \
   VMETHOD(__c, class, onCompare, __i, int, \
      C(Class) * _ARG C(Instance) _ARG any_object, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG object)

extern THIS_LIB_IMPORT int M_VTBLID(class, onCopy);
// void Instance_onCopy(C(Class) * __c, C(Instance) __i, any_object newData);
#define Instance_onCopy(__c, __i, newData) \
   VMETHOD(__c, class, onCopy, __i, void, \
      C(Class) * _ARG C(Instance) _ARG any_object, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG newData)

extern THIS_LIB_IMPORT int M_VTBLID(class, onDisplay);
// void Instance_onDisplay(C(Class) * __c, C(Instance) __i, C(Surface) surface, int x, int y, int width, void * fieldData, C(Alignment) alignment, C(DataDisplayFlags) displayFlags);
#define Instance_onDisplay(__c, __i, surface, x, y, width, fieldData, alignment, displayFlags) \
   VMETHOD(__c, class, onDisplay, __i, void, \
      C(Class) * _ARG C(Instance) _ARG C(Surface) _ARG int _ARG int _ARG int _ARG void * _ARG C(Alignment) _ARG C(DataDisplayFlags), \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG surface _ARG x _ARG y _ARG width _ARG fieldData _ARG alignment _ARG displayFlags)

extern THIS_LIB_IMPORT int M_VTBLID(class, onEdit);
// C(Window) Instance_onEdit(C(Class) * __c, C(Instance) __i, C(DataBox) dataBox, C(DataBox) obsolete, int x, int y, int w, int h, void * userData);
#define Instance_onEdit(__c, __i, dataBox, obsolete, x, y, w, h, userData) \
   VMETHOD(__c, class, onEdit, __i, C(Window), \
      C(Class) * _ARG C(Instance) _ARG C(DataBox) _ARG C(DataBox) _ARG int _ARG int _ARG int _ARG int _ARG void *, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG dataBox _ARG obsolete _ARG x _ARG y _ARG w _ARG h _ARG userData)

extern THIS_LIB_IMPORT int M_VTBLID(class, onFree);
// void Instance_onFree(C(Class) * __c, C(Instance) __i);
#define Instance_onFree(__c, __i) \
   VMETHOD(__c, class, onFree, __i, void, \
      C(Class) * _ARG C(Instance), \
      (__i) ? (__i)->_class : (__c) _ARG __i)

extern THIS_LIB_IMPORT int M_VTBLID(class, onGetDataFromString);
// C(bool) Instance_onGetDataFromString(C(Class) * __c, C(Instance) __i, const char * string);
#define Instance_onGetDataFromString(__c, __i, string) \
   VMETHOD(__c, class, onGetDataFromString, __i, C(bool), \
      C(Class) * _ARG C(Instance) _ARG const char *, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG string)

extern THIS_LIB_IMPORT int M_VTBLID(class, onGetString);
// const char * Instance_onGetString(C(Class) * __c, C(Instance) __i, char * tempString, void * fieldData, C(bool) * needClass);
#define Instance_onGetString(__c, __i, tempString, fieldData, needClass) \
   VMETHOD(__c, class, onGetString, __i, const char *, \
      C(Class) * _ARG C(Instance) _ARG char * _ARG void * _ARG C(bool) *, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG tempString _ARG fieldData _ARG needClass)

extern THIS_LIB_IMPORT int M_VTBLID(class, onSaveEdit);
// C(bool) Instance_onSaveEdit(C(Class) * __c, C(Instance) __i, C(Window) window, void * object);
#define Instance_onSaveEdit(__c, __i, window, object) \
   VMETHOD(__c, class, onSaveEdit, __i, C(bool), \
      C(Class) * _ARG C(Instance) _ARG C(Window) _ARG void *, \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG window _ARG object)

extern THIS_LIB_IMPORT int M_VTBLID(class, onSerialize);
// void Instance_onSerialize(C(Class) * __c, C(Instance) __i, C(IOChannel) channel);
#define Instance_onSerialize(__c, __i, channel) \
   VMETHOD(__c, class, onSerialize, __i, void, \
      C(Class) * _ARG C(Instance) _ARG C(IOChannel), \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG channel)

extern THIS_LIB_IMPORT int M_VTBLID(class, onUnserialize);
// void Instance_onUnserialize(C(Class) * __c, C(Instance) __i, C(IOChannel) channel);
#define Instance_onUnserialize(__c, __i, channel) \
   VMETHOD(__c, class, onUnserialize, __i, void, \
      C(Class) * _ARG C(Instance) _ARG C(IOChannel), \
      (__i) ? (__i)->_class : (__c) _ARG __i _ARG channel)

extern THIS_LIB_IMPORT double (* double_inf)(void);

extern THIS_LIB_IMPORT double (* double_nan)(void);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(double, isNan);
extern THIS_LIB_IMPORT C(bool) (* double_get_isNan)(double d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(double, isInf);
extern THIS_LIB_IMPORT C(bool) (* double_get_isInf)(double d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(double, signBit);
extern THIS_LIB_IMPORT int (* double_get_signBit)(double d);

extern THIS_LIB_IMPORT float (* float_inf)(void);

extern THIS_LIB_IMPORT float (* float_nan)(void);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(float, isNan);
extern THIS_LIB_IMPORT C(bool) (* float_get_isNan)(float f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(float, isInf);
extern THIS_LIB_IMPORT C(bool) (* float_get_isInf)(float f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(float, signBit);
extern THIS_LIB_IMPORT int (* float_get_signBit)(float f);


// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////  ecere  /////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////



// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////  ecere||sys  ////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////


// start -- moved backwards outputs
typedef C(Instance) C(ZString);
#if CPP11
enum C(TreePrintStyle) : int
#else
typedef int C(TreePrintStyle);
enum C(TreePrintStyle)
#endif
{
   TreePrintStyle_inOrder = 0x0,
   TreePrintStyle_postOrder = 0x1,
   TreePrintStyle_preOrder = 0x2,
   TreePrintStyle_depthOrder = 0x3
};

typedef struct C(StringBTNode) C(StringBTNode);
struct C(StringBTNode)
{
   C(String) key;
   C(StringBTNode) * parent;
   C(StringBTNode) * left;
   C(StringBTNode) * right;
   int depth;
};
#if CPP11
enum C(StringAllocType) : int
#else
typedef int C(StringAllocType);
enum C(StringAllocType)
#endif
{
   StringAllocType_pointer = 0x0,
   StringAllocType_stack = 0x1,
   StringAllocType_heap = 0x2
};

typedef struct C(OldList) C(OldList);
typedef struct C(OldLink) C(OldLink);
struct C(OldLink)
{
   C(OldLink) * prev;
   C(OldLink) * next;
   void * data;
};
typedef struct C(NamedLink64) C(NamedLink64);
struct C(NamedLink64)
{
   C(NamedLink64) * prev;
   C(NamedLink64) * next;
   char * name;
   int64 data;
};
typedef struct C(NamedLink) C(NamedLink);
struct C(NamedLink)
{
   C(NamedLink) * prev;
   C(NamedLink) * next;
   char * name;
   void * data;
};
typedef struct C(NamedItem) C(NamedItem);
struct C(NamedItem)
{
   C(NamedItem) * prev;
   C(NamedItem) * next;
   char * name;
};
typedef struct C(Mutex) C(Mutex);
typedef struct C(Item) C(Item);
struct C(Item)
{
   C(Item) * prev;
   C(Item) * next;
};
typedef struct C(BinaryTree) C(BinaryTree);
typedef struct C(BTNode) C(BTNode);
struct C(BTNode)
{
   uintptr key;
   C(BTNode) * parent;
   C(BTNode) * left;
   C(BTNode) * right;
   int depth;
};
// end -- moved backwards outputs
#define DIR_SEP ((__runtimePlatform == Platform_win32) ? '\\' : '/')

#define DIR_SEPS ((__runtimePlatform == Platform_win32) ? "\\" : "/")

#define MAX_DIRECTORY (534)

#define MAX_EXTENSION (17)

#define MAX_FILENAME (274)

#define MAX_F_STRING (1025)

#define MAX_LOCATION (797)

#if CPP11
enum C(BackSlashEscaping) : uint
#else
typedef C(bool) C(BackSlashEscaping);
enum C(BackSlashEscaping)
#endif
{
   BackSlashEscaping_forArgsPassing = 0x2
};

typedef struct C(BinaryTree) C(StringBinaryTree);
extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_findPrefix)(C(BTNode) * __this, const char * key);

extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_findString)(C(BTNode) * __this, const char * key);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, prev);
extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_get_prev)(C(BTNode) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, next);
extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_get_next)(C(BTNode) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, minimum);
extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_get_minimum)(C(BTNode) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, maximum);
extern THIS_LIB_IMPORT C(BTNode) * (* BTNode_get_maximum)(C(BTNode) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, count);
extern THIS_LIB_IMPORT int (* BTNode_get_count)(C(BTNode) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BTNode, depthProp);
extern THIS_LIB_IMPORT int (* BTNode_get_depthProp)(C(BTNode) * b);

struct C(BinaryTree)
{
   C(BTNode) * root;
   int count;
   int (* CompareKey)(C(BinaryTree) tree, uintptr a, uintptr b);
   void (* FreeKey)(void * key);
};
extern THIS_LIB_IMPORT C(bool) (* BinaryTree_add)(C(BinaryTree) * __this, C(BTNode) * node);

extern THIS_LIB_IMPORT C(bool) (* BinaryTree_check)(C(BinaryTree) * __this);

extern THIS_LIB_IMPORT int (* BinaryTree_compareInt)(C(BinaryTree) * __this, uintptr a, uintptr b);

extern THIS_LIB_IMPORT int (* BinaryTree_compareString)(C(BinaryTree) * __this, const char * a, const char * b);

extern THIS_LIB_IMPORT void (* BinaryTree_delete)(C(BinaryTree) * __this, C(BTNode) * node);

extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_find)(C(BinaryTree) * __this, uintptr key);

extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_findAll)(C(BinaryTree) * __this, uintptr key);

extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_findPrefix)(C(BinaryTree) * __this, const char * key);

extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_findString)(C(BinaryTree) * __this, const char * key);

extern THIS_LIB_IMPORT void (* BinaryTree_free)(C(BinaryTree) * __this);

extern THIS_LIB_IMPORT void (* BinaryTree_freeString)(char * string);

extern THIS_LIB_IMPORT char * (* BinaryTree_print)(C(BinaryTree) * __this, char * output, C(TreePrintStyle) tps);

extern THIS_LIB_IMPORT void (* BinaryTree_remove)(C(BinaryTree) * __this, C(BTNode) * node);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BinaryTree, first);
extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_get_first)(C(BinaryTree) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BinaryTree, last);
extern THIS_LIB_IMPORT C(BTNode) * (* BinaryTree_get_last)(C(BinaryTree) * b);

extern THIS_LIB_IMPORT void (* Item_copy)(C(Item) * __this, C(Item) * src, int size);

extern THIS_LIB_IMPORT void (* Mutex_release)(C(Mutex) * __this);

extern THIS_LIB_IMPORT void (* Mutex_wait)(C(Mutex) * __this);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Mutex, lockCount);
extern THIS_LIB_IMPORT int (* Mutex_get_lockCount)(C(Mutex) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Mutex, owningThread);
extern THIS_LIB_IMPORT int64 (* Mutex_get_owningThread)(C(Mutex) * m);

extern THIS_LIB_IMPORT void (* OldLink_free)(C(OldLink) * __this);

struct C(OldList)
{
   void * first;
   void * last;
   int count;
   uint offset;
   C(bool) circ;
};
extern THIS_LIB_IMPORT void (* OldList_add)(C(OldList) * __this, void * item);

extern THIS_LIB_IMPORT C(bool) (* OldList_addName)(C(OldList) * __this, void * item);

extern THIS_LIB_IMPORT void (* OldList_clear)(C(OldList) * __this);

extern THIS_LIB_IMPORT void (* OldList_copy)(C(OldList) * __this, C(OldList) * src, int size, void (* copy)(void * dest, void * src));

extern THIS_LIB_IMPORT void (* OldList_delete)(C(OldList) * __this, void * item);

extern THIS_LIB_IMPORT C(OldLink) * (* OldList_findLink)(C(OldList) * __this, void * data);

extern THIS_LIB_IMPORT void * (* OldList_findName)(C(OldList) * __this, const char * name, C(bool) warn);

extern THIS_LIB_IMPORT void * (* OldList_findNamedLink)(C(OldList) * __this, const char * name, C(bool) warn);

extern THIS_LIB_IMPORT void (* OldList_free)(C(OldList) * __this, void (* freeFn)(void *));

extern THIS_LIB_IMPORT C(bool) (* OldList_insert)(C(OldList) * __this, void * prevItem, void * item);

extern THIS_LIB_IMPORT void (* OldList_move)(C(OldList) * __this, void * item, void * prevItem);

extern THIS_LIB_IMPORT C(bool) (* OldList_placeName)(C(OldList) * __this, const char * name, void ** place);

extern THIS_LIB_IMPORT void (* OldList_remove)(C(OldList) * __this, void * item);

extern THIS_LIB_IMPORT void (* OldList_removeAll)(C(OldList) * __this, void (* freeFn)(void *));

extern THIS_LIB_IMPORT void (* OldList_sort)(C(OldList) * __this, int (* compare)(void *, void *, void *), void * data);

extern THIS_LIB_IMPORT void (* OldList_swap)(C(OldList) * __this, void * item1, void * item2);

struct CM(ZString)
{
   char * _string;
   int len;
   C(StringAllocType) allocType;
   int size;
   int minSize;
   int maxSize;
};
extern THIS_LIB_IMPORT void (* ZString_concat)(C(ZString) __this, C(ZString) s);

extern THIS_LIB_IMPORT void (* ZString_concatf)(C(ZString) __this, const char * format, ...);

extern THIS_LIB_IMPORT void (* ZString_copy)(C(ZString) __this, C(ZString) s);

extern THIS_LIB_IMPORT void (* ZString_copyString)(C(ZString) __this, char * value, int newLen);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(ZString, char_ptr);
extern THIS_LIB_IMPORT C(ZString) (* ZString_from_char_ptr)(char * c);
extern THIS_LIB_IMPORT const char * (* ZString_to_char_ptr)(C(ZString) z);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(ZString, string);
extern THIS_LIB_IMPORT void (* ZString_set_string)(C(ZString) z, char * value);
extern THIS_LIB_IMPORT char * (* ZString_get_string)(C(ZString) z);

extern THIS_LIB_IMPORT void (* changeCh)(char * string, char ch1, char ch2);
extern THIS_LIB_IMPORT void (* changeChars)(char * string, const char * chars, char alt);
extern THIS_LIB_IMPORT char * (* changeExtension)(const char * string, const char * ext, char * output);
extern THIS_LIB_IMPORT char * (* copyString)(const char * string);
extern THIS_LIB_IMPORT double (* floatFromString)(const char * string);
extern THIS_LIB_IMPORT int64 (* getCurrentThreadID)(void);
extern THIS_LIB_IMPORT char * (* getExtension)(const char * string, char * output);
extern THIS_LIB_IMPORT uint (* getHexValue)(char ** buffer);
extern THIS_LIB_IMPORT char * (* getLastDirectory)(const char * string, char * output);
extern THIS_LIB_IMPORT C(bool) (* getString)(char ** buffer, char * string, int max);
extern THIS_LIB_IMPORT int (* getValue)(char ** buffer);
extern THIS_LIB_IMPORT int (* iSO8859_1toUTF8)(const char * source, char * dest, int max);
extern THIS_LIB_IMPORT C(bool) (* isPathInsideOf)(const char * path, const char * of);
extern THIS_LIB_IMPORT char * (* makePathRelative)(const char * path, const char * to, char * destination);
extern THIS_LIB_IMPORT char * (* pathCat)(char * string, const char * addedPath);
extern THIS_LIB_IMPORT char * (* pathCatSlash)(char * string, const char * addedPath);
extern THIS_LIB_IMPORT void (* printBigSize)(char * string, double size, int prec);
extern THIS_LIB_IMPORT void (* printSize)(char * string, uint size, int prec);
extern THIS_LIB_IMPORT char * (* rSearchString)(const char * buffer, const char * subStr, int maxLen, C(bool) matchCase, C(bool) matchWord);
extern THIS_LIB_IMPORT void (* repeatCh)(char * string, int count, char ch);
extern THIS_LIB_IMPORT char * (* searchString)(const char * buffer, int start, const char * subStr, C(bool) matchCase, C(bool) matchWord);
extern THIS_LIB_IMPORT C(bool) (* splitArchivePath)(const char * fileName, char * archiveName, const char ** archiveFile);
extern THIS_LIB_IMPORT char * (* splitDirectory)(const char * string, char * part, char * rest);
extern THIS_LIB_IMPORT C(bool) (* stripExtension)(char * string);
extern THIS_LIB_IMPORT char * (* stripLastDirectory)(const char * string, char * output);
extern THIS_LIB_IMPORT char * (* stripQuotes)(const char * string, char * output);
extern THIS_LIB_IMPORT int (* tokenize)(char * string, int maxTokens, char * tokens[], C(BackSlashEscaping) esc);
extern THIS_LIB_IMPORT int (* tokenizeWith)(char * string, int maxTokens, char * tokens[], const char * tokenizers, C(bool) escapeBackSlashes);
extern THIS_LIB_IMPORT char * (* trimLSpaces)(const char * string, char * output);
extern THIS_LIB_IMPORT char * (* trimRSpaces)(const char * string, char * output);
extern THIS_LIB_IMPORT char * (* uTF16toUTF8)(const uint16 * source);
extern THIS_LIB_IMPORT int (* uTF16toUTF8Buffer)(const uint16 * source, char * dest, int max);
extern THIS_LIB_IMPORT int (* uTF32toUTF8Len)(unichar * source, int count, char * dest, int max);
extern THIS_LIB_IMPORT unichar (* uTF8GetChar)(const char * string, int * numBytes);
extern THIS_LIB_IMPORT C(bool) (* uTF8Validate)(const char * source);
extern THIS_LIB_IMPORT uint16 * (* uTF8toUTF16)(const char * source, int * wordCount);
extern THIS_LIB_IMPORT int (* uTF8toUTF16Buffer)(const char * source, uint16 * dest, int max);

// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////  ecere||com  ////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////


// start -- moved backwards outputs
#if CPP11
enum C(TemplateParameterType) : int
#else
typedef int C(TemplateParameterType);
enum C(TemplateParameterType)
#endif
{
   TemplateParameterType_type = 0x0,
   TemplateParameterType_identifier = 0x1,
   TemplateParameterType_expression = 0x2
};

#if CPP11
enum C(TemplateMemberType) : int
#else
typedef int C(TemplateMemberType);
enum C(TemplateMemberType)
#endif
{
   TemplateMemberType_dataMember = 0x0,
   TemplateMemberType_method = 0x1,
   TemplateMemberType_prop = 0x2
};

typedef struct C(SubModule) C(SubModule);
typedef struct C(NameSpace) C(NameSpace);
struct C(NameSpace)
{
   const char * name;
   C(NameSpace) * btParent;
   C(NameSpace) * left;
   C(NameSpace) * right;
   int depth;
   C(NameSpace) * parent;
   C(BinaryTree) nameSpaces;
   C(BinaryTree) classes;
   C(BinaryTree) defines;
   C(BinaryTree) functions;
};
typedef C(Instance) C(Module);
#if CPP11
enum C(ImportType) : int
#else
typedef int C(ImportType);
enum C(ImportType)
#endif
{
   ImportType_normalImport = 0x0,
   ImportType_staticImport = 0x1,
   ImportType_remoteImport = 0x2,
   ImportType_preDeclImport = 0x3,
   ImportType_comCheckImport = 0x4
};

struct CM(Application)
{
   int argc;
   const char ** argv;
   int exitCode;
   C(bool) isGUIApp;
   C(OldList) allModules;
   char * parsedCommand;
   C(NameSpace) systemNameSpace;
};
typedef C(Module) C(Application);
struct CM(Module)
{
   C(Application) application;
   C(OldList) classes;
   C(OldList) defines;
   C(OldList) functions;
   C(OldList) modules;
   C(Module) prev;
   C(Module) next;
   const char * name;
   void * library;
   void * Unload;
   C(ImportType) importType;
   C(ImportType) origImportType;
   C(NameSpace) privateNameSpace;
   C(NameSpace) publicNameSpace;
};
#if CPP11
enum C(AccessMode) : int
#else
typedef int C(AccessMode);
enum C(AccessMode)
#endif
{
   AccessMode_defaultAccess = 0x0,
   AccessMode_publicAccess = 0x1,
   AccessMode_privateAccess = 0x2,
   AccessMode_staticAccess = 0x3,
   AccessMode_baseSystemAccess = 0x4
};

struct C(SubModule)
{
   C(SubModule) * prev;
   C(SubModule) * next;
   C(Module) module;
   C(AccessMode) importMode;
};
typedef C(IOChannel) C(SerialBuffer);
#if CPP11
enum C(ClassType) : int
#else
typedef int C(ClassType);
enum C(ClassType)
#endif
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

typedef struct C(ClassTemplateArgument) C(ClassTemplateArgument);
struct C(Class)
{
   C(Class) * prev;
   C(Class) * next;
   const char * name;
   int offset;
   int structSize;
   void ** _vTbl;
   int vTblSize;
   C(bool) (* Constructor)(void *);
   void (* Destructor)(void *);
   int offsetClass;
   int sizeClass;
   C(Class) * base;
   C(BinaryTree) methods;
   C(BinaryTree) members;
   C(BinaryTree) prop;
   C(OldList) membersAndProperties;
   C(BinaryTree) classProperties;
   C(OldList) derivatives;
   int memberID;
   int startMemberID;
   C(ClassType) type;
   C(Module) module;
   C(NameSpace) * nameSpace;
   const char * dataTypeString;
   C(Type) * dataType;
   int typeSize;
   int defaultAlignment;
   void (* Initialize)();
   int memberOffset;
   C(OldList) selfWatchers;
   const char * designerClass;
   C(bool) noExpansion;
   const char * defaultProperty;
   C(bool) comRedefinition;
   int count;
   int isRemote;
   C(bool) internalDecl;
   void * data;
   C(bool) computeSize;
   short structAlignment;
   short pointerAlignment;
   int destructionWatchOffset;
   C(bool) fixed;
   C(OldList) delayedCPValues;
   C(AccessMode) inheritanceAccess;
   const char * fullName;
   void * symbol;
   C(OldList) conversions;
   C(OldList) templateParams;
   C(ClassTemplateArgument) * templateArgs;
   C(Class) * templateClass;
   C(OldList) templatized;
   int numParams;
   C(bool) isInstanceClass;
   C(bool) byValueSystemClass;
   void * bindingsClass;
};
struct C(Property)
{
   C(Property) * prev;
   C(Property) * next;
   const char * name;
   C(bool) isProperty;
   C(AccessMode) memberAccess;
   int id;
   C(Class) * _class;
   const char * dataTypeString;
   C(Class) * dataTypeClass;
   C(Type) * dataType;
   void (* Set)(void *, int);
   int (* Get)(void *);
   C(bool) (* IsSet)(void *);
   void * data;
   void * symbol;
   int vid;
   C(bool) conversion;
   uint watcherOffset;
   const char * category;
   C(bool) compiled;
   C(bool) selfWatchable;
   C(bool) isWatchable;
};
typedef struct C(ObjectInfo) C(ObjectInfo);
struct CM(Instance)
{
   void ** _vTbl;
   C(Class) * _class;
   int _refCount;
};
struct C(ObjectInfo)
{
   C(ObjectInfo) * prev;
   C(ObjectInfo) * next;
   C(Instance) instance;
   char * name;
   C(Instantiation) * instCode;
   C(bool) deleted;
   C(ObjectInfo) * oClass;
   C(OldList) instances;
   C(ClassDefinition) * classDefinition;
   C(bool) modified;
   void * i18nStrings;
};
#if CPP11
enum C(MethodType) : int
#else
typedef int C(MethodType);
enum C(MethodType)
#endif
{
   MethodType_normalMethod = 0x0,
   MethodType_virtualMethod = 0x1
};

struct C(Method)
{
   const char * name;
   C(Method) * parent;
   C(Method) * left;
   C(Method) * right;
   int depth;
   int (* function)();
   int vid;
   C(MethodType) type;
   C(Class) * _class;
   void * symbol;
   const char * dataTypeString;
   C(Type) * dataType;
   C(AccessMode) memberAccess;
};
typedef C(Instance) C(Container);
typedef C(Container) C(CustomAVLTree);
typedef C(CustomAVLTree) C(Map);
typedef C(Container) C(LinkList);
typedef struct C(IteratorPointer) C(IteratorPointer);
typedef struct C(Iterator) C(Iterator);
typedef struct C(GlobalFunction) C(GlobalFunction);
struct C(GlobalFunction)
{
   C(GlobalFunction) * prev;
   C(GlobalFunction) * next;
   const char * name;
   int (* function)();
   C(Module) module;
   C(NameSpace) * nameSpace;
   const char * dataTypeString;
   C(Type) * dataType;
   void * symbol;
};
typedef C(Window) C(DesignerBase);
typedef struct C(DefinedExpression) C(DefinedExpression);
struct C(DefinedExpression)
{
   C(DefinedExpression) * prev;
   C(DefinedExpression) * next;
   const char * name;
   const char * value;
   C(NameSpace) * nameSpace;
};
struct C(DataValue)
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
typedef struct C(DataValue) C(DataValue);
#if CPP11
enum C(DataMemberType) : int
#else
typedef int C(DataMemberType);
enum C(DataMemberType)
#endif
{
   DataMemberType_normalMember = 0x0,
   DataMemberType_unionMember = 0x1,
   DataMemberType_structMember = 0x2
};

typedef struct C(DataMember) C(DataMember);
struct C(DataMember)
{
   C(DataMember) * prev;
   C(DataMember) * next;
   const char * name;
   C(bool) isProperty;
   C(AccessMode) memberAccess;
   int id;
   C(Class) * _class;
   const char * dataTypeString;
   C(Class) * dataTypeClass;
   C(Type) * dataType;
   C(DataMemberType) type;
   int offset;
   int memberID;
   C(OldList) members;
   C(BinaryTree) membersAlpha;
   int memberOffset;
   short structAlignment;
   short pointerAlignment;
};
typedef struct C(ClassTemplateParameter) C(ClassTemplateParameter);
struct C(ClassTemplateArgument)
{
   union
   {
      struct
      {
         const char * dataTypeString;
         C(Class) * dataTypeClass;
      };
      C(DataValue) expression;
      struct
      {
         const char * memberString;
         union
         {
            C(DataMember) * member;
            C(Property) * prop;
            C(Method) * method;
         };
      };
   };
};
struct C(ClassTemplateParameter)
{
   C(ClassTemplateParameter) * prev;
   C(ClassTemplateParameter) * next;
   const char * name;
   C(TemplateParameterType) type;
   union
   {
      const char * dataTypeString;
      C(TemplateMemberType) memberType;
   };
   C(ClassTemplateArgument) defaultArg;
   void * param;
};
typedef struct C(ClassProperty) C(ClassProperty);
struct C(ClassProperty)
{
   const char * name;
   C(ClassProperty) * parent;
   C(ClassProperty) * left;
   C(ClassProperty) * right;
   int depth;
   void (* Set)(C(Class) *, int64);
   int64 (* Get)(C(Class) *);
   const char * dataTypeString;
   C(Type) * dataType;
   C(bool) constant;
};
typedef C(Window) C(ClassDesignerBase);
typedef struct C(BuiltInContainer) C(BuiltInContainer);
typedef struct C(BitMember) C(BitMember);
struct C(BitMember)
{
   C(BitMember) * prev;
   C(BitMember) * next;
   const char * name;
   C(bool) isProperty;
   C(AccessMode) memberAccess;
   int id;
   C(Class) * _class;
   const char * dataTypeString;
   C(Class) * dataTypeClass;
   C(Type) * dataType;
   C(DataMemberType) type;
   int size;
   int pos;
   uint64 mask;
};
typedef struct C(BTNamedLink) C(BTNamedLink);
struct C(BTNamedLink)
{
   const char * name;
   C(BTNamedLink) * parent;
   C(BTNamedLink) * left;
   C(BTNamedLink) * right;
   int depth;
   void * data;
};
typedef struct C(AVLNode) C(AVLNode);
// end -- moved backwards outputs
#define FORMAT64D ((__runtimePlatform == Platform_win32) ? "%I64d" : "%lld")

#define FORMAT64DLL ((__runtimePlatform == Platform_win32) ? "%I64dLL" : "%lldLL")

#define FORMAT64HEX ((__runtimePlatform == Platform_win32) ? "0x%I64X" : "0x%llX")

#define FORMAT64HEXLL ((__runtimePlatform == Platform_win32) ? "0x%I64XLL" : "0x%llXLL")

#define FORMAT64U ((__runtimePlatform == Platform_win32) ? "%I64u" : "%llu")

#define MAXBYTE (0xff)

#define MAXDOUBLE (1.7976931348623158e+308)

#define MAXDWORD (0xffffffff)

#define MAXFLOAT (3.40282346638528860e+38f)

#define MAXINT (((int)0x7fffffff))

#define MAXINT64 (((long long)0x7fffffffffffffffLL))

#define MAXQWORD (0xffffffffffffffffLL)

#define MAXWORD (0xffff)

#define MINDOUBLE (2.2250738585072014e-308)

#define MINFLOAT (1.17549435082228750e-38f)

#define MININT (((int)0x80000000))

#define MININT64 (((long long)0x8000000000000000LL))

#if defined(__cplusplus)
#define null 0
#else
#define null ((void *)0)
#endif

typedef C(CustomAVLTree) C(AVLTree);
typedef double C(Angle);
typedef C(Container) C(Array);
typedef C(String) C(CIString);
typedef struct C(EnumClassData) C(EnumClassData);
typedef struct C(Link) C(Link);
typedef struct C(LinkElement) C(LinkElement);
typedef C(LinkList) C(List);
typedef struct C(ListItem) C(ListItem);
typedef struct C(MapIterator) C(MapIterator);
typedef struct C(MapNode) C(MapNode);
#if CPP11
enum C(Platform) : int
#else
typedef int C(Platform);
enum C(Platform)
#endif
{
   Platform_unknown = 0x0,
   Platform_win32 = 0x1,
   Platform_tux = 0x2,
   Platform_apple = 0x3
};

typedef struct C(StaticString) C(StaticString);
typedef uint64_t TP(MapIterator, KT);
typedef uint64_t TP(MapIterator, V);
typedef uint64_t TP(MapNode, KT);
typedef uint64_t TP(MapNode, V);
typedef uint64_t TP(LinkList, LT);
typedef uint64_t TP(CustomAVLTree, BT);
typedef uint64_t TP(LinkElement, T);
typedef uint64_t TP(AVLNode, T);
typedef uint64_t TP(Container, D);
typedef uint64_t TP(Container, I);
typedef uint64_t TP(Container, T);
typedef uint64_t TP(Iterator, IT);
typedef uint64_t TP(Iterator, T);
struct C(AVLNode)
{
   byte __ecerePrivateData0[32];
   TP(AVLNode, T) key;
};
extern THIS_LIB_IMPORT thisclass(AVLNode *) (* AVLNode_find)(C(AVLNode) * __this, C(Class) * Tclass, TP(AVLNode, T) key);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, prev);
extern THIS_LIB_IMPORT thisclass(AVLNode *) (* AVLNode_get_prev)(C(AVLNode) * a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, next);
extern THIS_LIB_IMPORT thisclass(AVLNode *) (* AVLNode_get_next)(C(AVLNode) * a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, minimum);
extern THIS_LIB_IMPORT thisclass(AVLNode *) (* AVLNode_get_minimum)(C(AVLNode) * a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, maximum);
extern THIS_LIB_IMPORT thisclass(AVLNode *) (* AVLNode_get_maximum)(C(AVLNode) * a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, count);
extern THIS_LIB_IMPORT int (* AVLNode_get_count)(C(AVLNode) * a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(AVLNode, depthProp);
extern THIS_LIB_IMPORT int (* AVLNode_get_depthProp)(C(AVLNode) * a);

extern THIS_LIB_IMPORT int M_VTBLID(Application, main);
// void Application_main(C(Application) __i);
#define Application_main(__i) \
   VMETHOD(CO(Application), Application, main, __i, void, \
      C(Application), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Application, main);

struct CM(Array)
{
   TP(Container, T) * array;
   uint count;
   uint minAllocSize;
};
extern THIS_LIB_IMPORT C(Property) * PROPERTY(Array, size);
extern THIS_LIB_IMPORT void (* Array_set_size)(C(Array) a, uint value);
extern THIS_LIB_IMPORT uint (* Array_get_size)(C(Array) a);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Array, minAllocSize);
extern THIS_LIB_IMPORT void (* Array_set_minAllocSize)(C(Array) a, uint value);
extern THIS_LIB_IMPORT uint (* Array_get_minAllocSize)(C(Array) a);

struct C(BuiltInContainer)
{
   void ** _vTbl;
   C(Class) * _class;
   int _refCount;
   void * data;
   int count;
   C(Class) * type;
};
extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, add);
// C(IteratorPointer) * BuiltInContainer_add(C(BuiltInContainer) * __i, uint64 value);
#define BuiltInContainer_add(__i, value) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, add, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG uint64, \
      __i _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, add);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, copy);
// void BuiltInContainer_copy(C(BuiltInContainer) * __i, C(Container) source);
#define BuiltInContainer_copy(__i, source) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, copy, __i, void, \
      C(BuiltInContainer) * _ARG C(Container), \
      __i _ARG source)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, copy);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, delete);
// void BuiltInContainer_delete(C(BuiltInContainer) * __i, C(IteratorPointer) * it);
#define BuiltInContainer_delete(__i, it) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, delete, __i, void, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG it)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, delete);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, find);
// C(IteratorPointer) * BuiltInContainer_find(C(BuiltInContainer) * __i, uint64 value);
#define BuiltInContainer_find(__i, value) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, find, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG uint64, \
      __i _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, find);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, free);
// void BuiltInContainer_free(C(BuiltInContainer) * __i);
#define BuiltInContainer_free(__i) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, free, __i, void, \
      C(BuiltInContainer) *, \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, free);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, freeIterator);
// void BuiltInContainer_freeIterator(C(BuiltInContainer) * __i, C(IteratorPointer) * it);
#define BuiltInContainer_freeIterator(__i, it) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, freeIterator, __i, void, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG it)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, freeIterator);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getAtPosition);
// C(IteratorPointer) * BuiltInContainer_getAtPosition(C(BuiltInContainer) * __i, const uint64 pos, C(bool) create);
#define BuiltInContainer_getAtPosition(__i, pos, create) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getAtPosition, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG const uint64 _ARG C(bool), \
      __i _ARG pos _ARG create)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getAtPosition);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getCount);
// int BuiltInContainer_getCount(C(BuiltInContainer) * __i);
#define BuiltInContainer_getCount(__i) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getCount, __i, int, \
      C(BuiltInContainer) *, \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getCount);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getData);
// uint64 BuiltInContainer_getData(C(BuiltInContainer) * __i, C(IteratorPointer) * pointer);
#define BuiltInContainer_getData(__i, pointer) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getData, __i, uint64, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getData);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getFirst);
// C(IteratorPointer) * BuiltInContainer_getFirst(C(BuiltInContainer) * __i);
#define BuiltInContainer_getFirst(__i) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getFirst, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) *, \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getFirst);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getLast);
// C(IteratorPointer) * BuiltInContainer_getLast(C(BuiltInContainer) * __i);
#define BuiltInContainer_getLast(__i) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getLast, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) *, \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getLast);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getNext);
// C(IteratorPointer) * BuiltInContainer_getNext(C(BuiltInContainer) * __i, C(IteratorPointer) * pointer);
#define BuiltInContainer_getNext(__i, pointer) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getNext, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getNext);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, getPrev);
// C(IteratorPointer) * BuiltInContainer_getPrev(C(BuiltInContainer) * __i, C(IteratorPointer) * pointer);
#define BuiltInContainer_getPrev(__i, pointer) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, getPrev, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, getPrev);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, insert);
// C(IteratorPointer) * BuiltInContainer_insert(C(BuiltInContainer) * __i, C(IteratorPointer) * after, uint64 value);
#define BuiltInContainer_insert(__i, after, value) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, insert, __i, C(IteratorPointer) *, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) * _ARG uint64, \
      __i _ARG after _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, insert);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, move);
// void BuiltInContainer_move(C(BuiltInContainer) * __i, C(IteratorPointer) * it, C(IteratorPointer) * after);
#define BuiltInContainer_move(__i, it, after) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, move, __i, void, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) * _ARG C(IteratorPointer) *, \
      __i _ARG it _ARG after)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, move);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, remove);
// void BuiltInContainer_remove(C(BuiltInContainer) * __i, C(IteratorPointer) * it);
#define BuiltInContainer_remove(__i, it) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, remove, __i, void, \
      C(BuiltInContainer) * _ARG C(IteratorPointer) *, \
      __i _ARG it)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, remove);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, removeAll);
// void BuiltInContainer_removeAll(C(BuiltInContainer) * __i);
#define BuiltInContainer_removeAll(__i) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, removeAll, __i, void, \
      C(BuiltInContainer) *, \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, removeAll);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, setData);
// C(bool) BuiltInContainer_setData(C(BuiltInContainer) * __i, C(IteratorPointer) * pointer, uint64 data);
#define BuiltInContainer_setData(__i, pointer, data) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, setData, __i, C(bool), \
      C(BuiltInContainer) * _ARG C(IteratorPointer) * _ARG uint64, \
      __i _ARG pointer _ARG data)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, setData);

extern THIS_LIB_IMPORT int M_VTBLID(BuiltInContainer, sort);
// void BuiltInContainer_sort(C(BuiltInContainer) * __i, C(bool) ascending);
#define BuiltInContainer_sort(__i, ascending) \
   VMETHOD(CO(BuiltInContainer), BuiltInContainer, sort, __i, void, \
      C(BuiltInContainer) * _ARG C(bool), \
      __i _ARG ascending)
extern THIS_LIB_IMPORT C(Method) * METHOD(BuiltInContainer, sort);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(BuiltInContainer, Container);
extern THIS_LIB_IMPORT C(Container) (* BuiltInContainer_to_Container)(C(BuiltInContainer) * b);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Class, char_ptr);
extern THIS_LIB_IMPORT void (* Class_from_char_ptr)(C(Class) * c, const char * value);
extern THIS_LIB_IMPORT const char * (* Class_to_char_ptr)(C(Class) * c);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, addObject);
// void ClassDesignerBase_addObject(C(ClassDesignerBase) __i);
#define ClassDesignerBase_addObject(__i) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, addObject, __i, void, \
      C(ClassDesignerBase), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, addObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, createNew);
// void ClassDesignerBase_createNew(C(ClassDesignerBase) __i, C(EditBox) editBox, C(Size) * clientSize, const char * name, const char * inherit);
#define ClassDesignerBase_createNew(__i, editBox, clientSize, name, inherit) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, createNew, __i, void, \
      C(EditBox) _ARG C(Size) * _ARG const char * _ARG const char *, \
      editBox _ARG clientSize _ARG name _ARG inherit)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, createNew);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, createObject);
// void ClassDesignerBase_createObject(C(ClassDesignerBase) __i, C(DesignerBase) designer, C(Instance) instance, C(ObjectInfo) * object, C(bool) isClass, C(Instance) _class);
#define ClassDesignerBase_createObject(__i, designer, instance, object, isClass, _class) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, createObject, __i, void, \
      C(DesignerBase) _ARG C(Instance) _ARG C(ObjectInfo) * _ARG C(bool) _ARG C(Instance), \
      designer _ARG instance _ARG object _ARG isClass _ARG _class)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, createObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, destroyObject);
// void ClassDesignerBase_destroyObject(C(ClassDesignerBase) __i, C(Instance) object);
#define ClassDesignerBase_destroyObject(__i, object) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, destroyObject, __i, void, \
      C(Instance), \
      object)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, destroyObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, droppedObject);
// void ClassDesignerBase_droppedObject(C(ClassDesignerBase) __i, C(Instance) instance, C(ObjectInfo) * object, C(bool) isClass, C(Instance) _class);
#define ClassDesignerBase_droppedObject(__i, instance, object, isClass, _class) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, droppedObject, __i, void, \
      C(Instance) _ARG C(ObjectInfo) * _ARG C(bool) _ARG C(Instance), \
      instance _ARG object _ARG isClass _ARG _class)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, droppedObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, fixProperty);
// void ClassDesignerBase_fixProperty(C(ClassDesignerBase) __i, C(Property) * prop, C(Instance) object);
#define ClassDesignerBase_fixProperty(__i, prop, object) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, fixProperty, __i, void, \
      C(Property) * _ARG C(Instance), \
      prop _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, fixProperty);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, listToolBoxClasses);
// void ClassDesignerBase_listToolBoxClasses(C(ClassDesignerBase) __i, C(DesignerBase) designer);
#define ClassDesignerBase_listToolBoxClasses(__i, designer) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, listToolBoxClasses, __i, void, \
      C(ClassDesignerBase) _ARG C(DesignerBase), \
      __i _ARG designer)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, listToolBoxClasses);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, postCreateObject);
// void ClassDesignerBase_postCreateObject(C(ClassDesignerBase) __i, C(Instance) instance, C(ObjectInfo) * object, C(bool) isClass, C(Instance) _class);
#define ClassDesignerBase_postCreateObject(__i, instance, object, isClass, _class) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, postCreateObject, __i, void, \
      C(Instance) _ARG C(ObjectInfo) * _ARG C(bool) _ARG C(Instance), \
      instance _ARG object _ARG isClass _ARG _class)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, postCreateObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, prepareTestObject);
// void ClassDesignerBase_prepareTestObject(C(ClassDesignerBase) __i, C(DesignerBase) designer, C(Instance) test);
#define ClassDesignerBase_prepareTestObject(__i, designer, test) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, prepareTestObject, __i, void, \
      C(DesignerBase) _ARG C(Instance), \
      designer _ARG test)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, prepareTestObject);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, reset);
// void ClassDesignerBase_reset(C(ClassDesignerBase) __i);
#define ClassDesignerBase_reset(__i) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, reset, __i, void, \
      C(ClassDesignerBase), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, reset);

extern THIS_LIB_IMPORT int M_VTBLID(ClassDesignerBase, selectObject);
// void ClassDesignerBase_selectObject(C(ClassDesignerBase) __i, C(ObjectInfo) * object, C(Instance) control);
#define ClassDesignerBase_selectObject(__i, object, control) \
   VMETHOD(CO(ClassDesignerBase), ClassDesignerBase, selectObject, __i, void, \
      C(ClassDesignerBase) _ARG C(ObjectInfo) * _ARG C(Instance), \
      __i _ARG object _ARG control)
extern THIS_LIB_IMPORT C(Method) * METHOD(ClassDesignerBase, selectObject);

extern THIS_LIB_IMPORT int M_VTBLID(Container, add);
// C(IteratorPointer) * Container_add(C(Container) __i, TP(Container, T) value);
#define Container_add(__i, value) \
   VMETHOD(CO(Container), Container, add, __i, C(IteratorPointer) *, \
      C(Container) _ARG TP(Container, T), \
      __i _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, add);

extern THIS_LIB_IMPORT int M_VTBLID(Container, copy);
// void Container_copy(C(Container) __i, C(Container) source);
#define Container_copy(__i, source) \
   VMETHOD(CO(Container), Container, copy, __i, void, \
      C(Container) _ARG C(Container), \
      __i _ARG source)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, copy);

extern THIS_LIB_IMPORT int M_VTBLID(Container, delete);
// void Container_delete(C(Container) __i, C(IteratorPointer) * i);
#define Container_delete(__i, i) \
   VMETHOD(CO(Container), Container, delete, __i, void, \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, delete);

extern THIS_LIB_IMPORT int M_VTBLID(Container, find);
// C(IteratorPointer) * Container_find(C(Container) __i, TP(Container, D) value);
#define Container_find(__i, value) \
   VMETHOD(CO(Container), Container, find, __i, C(IteratorPointer) *, \
      C(Container) _ARG TP(Container, D), \
      __i _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, find);

extern THIS_LIB_IMPORT int M_VTBLID(Container, free);
// void Container_free(C(Container) __i);
#define Container_free(__i) \
   VMETHOD(CO(Container), Container, free, __i, void, \
      C(Container), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, free);

extern THIS_LIB_IMPORT int M_VTBLID(Container, freeIterator);
// void Container_freeIterator(C(Container) __i, C(IteratorPointer) * it);
#define Container_freeIterator(__i, it) \
   VMETHOD(CO(Container), Container, freeIterator, __i, void, \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG it)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, freeIterator);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getAtPosition);
// C(IteratorPointer) * Container_getAtPosition(C(Container) __i, TP(Container, I) pos, C(bool) create, C(bool) * justAdded);
#define Container_getAtPosition(__i, pos, create, justAdded) \
   VMETHOD(CO(Container), Container, getAtPosition, __i, C(IteratorPointer) *, \
      C(Container) _ARG TP(Container, I) _ARG C(bool) _ARG C(bool) *, \
      __i _ARG pos _ARG create _ARG justAdded)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getAtPosition);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getCount);
// int Container_getCount(C(Container) __i);
#define Container_getCount(__i) \
   VMETHOD(CO(Container), Container, getCount, __i, int, \
      C(Container), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getCount);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getData);
// TP(Container, D) Container_getData(C(Container) __i, C(IteratorPointer) * pointer);
#define Container_getData(__i, pointer) \
   VMETHOD(CO(Container), Container, getData, __i, TP(Container, D), \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getData);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getFirst);
// C(IteratorPointer) * Container_getFirst(C(Container) __i);
#define Container_getFirst(__i) \
   VMETHOD(CO(Container), Container, getFirst, __i, C(IteratorPointer) *, \
      C(Container), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getFirst);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getLast);
// C(IteratorPointer) * Container_getLast(C(Container) __i);
#define Container_getLast(__i) \
   VMETHOD(CO(Container), Container, getLast, __i, C(IteratorPointer) *, \
      C(Container), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getLast);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getNext);
// C(IteratorPointer) * Container_getNext(C(Container) __i, C(IteratorPointer) * pointer);
#define Container_getNext(__i, pointer) \
   VMETHOD(CO(Container), Container, getNext, __i, C(IteratorPointer) *, \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getNext);

extern THIS_LIB_IMPORT int M_VTBLID(Container, getPrev);
// C(IteratorPointer) * Container_getPrev(C(Container) __i, C(IteratorPointer) * pointer);
#define Container_getPrev(__i, pointer) \
   VMETHOD(CO(Container), Container, getPrev, __i, C(IteratorPointer) *, \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG pointer)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, getPrev);

extern THIS_LIB_IMPORT int M_VTBLID(Container, insert);
// C(IteratorPointer) * Container_insert(C(Container) __i, C(IteratorPointer) * after, TP(Container, T) value);
#define Container_insert(__i, after, value) \
   VMETHOD(CO(Container), Container, insert, __i, C(IteratorPointer) *, \
      C(Container) _ARG C(IteratorPointer) * _ARG TP(Container, T), \
      __i _ARG after _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, insert);

extern THIS_LIB_IMPORT int M_VTBLID(Container, move);
// void Container_move(C(Container) __i, C(IteratorPointer) * it, C(IteratorPointer) * after);
#define Container_move(__i, it, after) \
   VMETHOD(CO(Container), Container, move, __i, void, \
      C(Container) _ARG C(IteratorPointer) * _ARG C(IteratorPointer) *, \
      __i _ARG it _ARG after)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, move);

extern THIS_LIB_IMPORT int M_VTBLID(Container, remove);
// void Container_remove(C(Container) __i, C(IteratorPointer) * it);
#define Container_remove(__i, it) \
   VMETHOD(CO(Container), Container, remove, __i, void, \
      C(Container) _ARG C(IteratorPointer) *, \
      __i _ARG it)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, remove);

extern THIS_LIB_IMPORT int M_VTBLID(Container, removeAll);
// void Container_removeAll(C(Container) __i);
#define Container_removeAll(__i) \
   VMETHOD(CO(Container), Container, removeAll, __i, void, \
      C(Container), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, removeAll);

extern THIS_LIB_IMPORT int M_VTBLID(Container, setData);
// C(bool) Container_setData(C(Container) __i, C(IteratorPointer) * pointer, TP(Container, D) data);
#define Container_setData(__i, pointer, data) \
   VMETHOD(CO(Container), Container, setData, __i, C(bool), \
      C(Container) _ARG C(IteratorPointer) * _ARG TP(Container, D), \
      __i _ARG pointer _ARG data)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, setData);

extern THIS_LIB_IMPORT int M_VTBLID(Container, sort);
// void Container_sort(C(Container) __i, C(bool) ascending);
#define Container_sort(__i, ascending) \
   VMETHOD(CO(Container), Container, sort, __i, void, \
      C(Container) _ARG C(bool), \
      __i _ARG ascending)
extern THIS_LIB_IMPORT C(Method) * METHOD(Container, sort);

extern THIS_LIB_IMPORT void (* Container_takeOut)(C(Container) __this, TP(Container, D) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Container, copySrc);
extern THIS_LIB_IMPORT void (* Container_set_copySrc)(C(Container) c, C(Container) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Container, firstIterator);
extern THIS_LIB_IMPORT void (* Container_get_firstIterator)(C(Container) c, C(Iterator) * value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Container, lastIterator);
extern THIS_LIB_IMPORT void (* Container_get_lastIterator)(C(Container) c, C(Iterator) * value);

struct CM(CustomAVLTree)
{
   TP(CustomAVLTree, BT) root;
   int count;
};
extern THIS_LIB_IMPORT void (* CustomAVLTree_freeKey)(C(CustomAVLTree) __this, C(AVLNode) * item);

struct CM(DesignerBase)
{
   C(ClassDesignerBase) classDesigner;
   const char * objectClass;
   C(bool) isDragging;
};
extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, addDefaultMethod);
// void DesignerBase_addDefaultMethod(C(DesignerBase) __i, C(Instance) instance, C(Instance) classInstance);
#define DesignerBase_addDefaultMethod(__i, instance, classInstance) \
   VMETHOD(CO(DesignerBase), DesignerBase, addDefaultMethod, __i, void, \
      C(DesignerBase) _ARG C(Instance) _ARG C(Instance), \
      __i _ARG instance _ARG classInstance)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, addDefaultMethod);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, addToolBoxClass);
// void DesignerBase_addToolBoxClass(C(DesignerBase) __i, C(Class) * _class);
#define DesignerBase_addToolBoxClass(__i, _class) \
   VMETHOD(CO(DesignerBase), DesignerBase, addToolBoxClass, __i, void, \
      C(DesignerBase) _ARG C(Class) *, \
      __i _ARG _class)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, addToolBoxClass);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, codeAddObject);
// void DesignerBase_codeAddObject(C(DesignerBase) __i, C(Instance) instance, C(ObjectInfo) * object);
#define DesignerBase_codeAddObject(__i, instance, object) \
   VMETHOD(CO(DesignerBase), DesignerBase, codeAddObject, __i, void, \
      C(DesignerBase) _ARG C(Instance) _ARG C(ObjectInfo) *, \
      __i _ARG instance _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, codeAddObject);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, deleteObject);
// void DesignerBase_deleteObject(C(DesignerBase) __i, C(ObjectInfo) * object);
#define DesignerBase_deleteObject(__i, object) \
   VMETHOD(CO(DesignerBase), DesignerBase, deleteObject, __i, void, \
      C(DesignerBase) _ARG C(ObjectInfo) *, \
      __i _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, deleteObject);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, findObject);
// C(bool) DesignerBase_findObject(C(DesignerBase) __i, C(Instance) * instance, const char * string);
#define DesignerBase_findObject(__i, instance, string) \
   VMETHOD(CO(DesignerBase), DesignerBase, findObject, __i, C(bool), \
      C(DesignerBase) _ARG C(Instance) * _ARG const char *, \
      __i _ARG instance _ARG string)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, findObject);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, modifyCode);
// void DesignerBase_modifyCode(C(DesignerBase) __i);
#define DesignerBase_modifyCode(__i) \
   VMETHOD(CO(DesignerBase), DesignerBase, modifyCode, __i, void, \
      C(DesignerBase), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, modifyCode);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, objectContainsCode);
// C(bool) DesignerBase_objectContainsCode(C(DesignerBase) __i, C(ObjectInfo) * object);
#define DesignerBase_objectContainsCode(__i, object) \
   VMETHOD(CO(DesignerBase), DesignerBase, objectContainsCode, __i, C(bool), \
      C(DesignerBase) _ARG C(ObjectInfo) *, \
      __i _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, objectContainsCode);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, renameObject);
// void DesignerBase_renameObject(C(DesignerBase) __i, C(ObjectInfo) * object, const char * name);
#define DesignerBase_renameObject(__i, object, name) \
   VMETHOD(CO(DesignerBase), DesignerBase, renameObject, __i, void, \
      C(DesignerBase) _ARG C(ObjectInfo) * _ARG const char *, \
      __i _ARG object _ARG name)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, renameObject);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, selectObjectFromDesigner);
// void DesignerBase_selectObjectFromDesigner(C(DesignerBase) __i, C(ObjectInfo) * object);
#define DesignerBase_selectObjectFromDesigner(__i, object) \
   VMETHOD(CO(DesignerBase), DesignerBase, selectObjectFromDesigner, __i, void, \
      C(DesignerBase) _ARG C(ObjectInfo) *, \
      __i _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, selectObjectFromDesigner);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, sheetAddObject);
// void DesignerBase_sheetAddObject(C(DesignerBase) __i, C(ObjectInfo) * object);
#define DesignerBase_sheetAddObject(__i, object) \
   VMETHOD(CO(DesignerBase), DesignerBase, sheetAddObject, __i, void, \
      C(DesignerBase) _ARG C(ObjectInfo) *, \
      __i _ARG object)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, sheetAddObject);

extern THIS_LIB_IMPORT int M_VTBLID(DesignerBase, updateProperties);
// void DesignerBase_updateProperties(C(DesignerBase) __i);
#define DesignerBase_updateProperties(__i) \
   VMETHOD(CO(DesignerBase), DesignerBase, updateProperties, __i, void, \
      C(DesignerBase), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DesignerBase, updateProperties);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DesignerBase, classDesigner);
extern THIS_LIB_IMPORT void (* DesignerBase_set_classDesigner)(C(DesignerBase) d, C(ClassDesignerBase) value);
extern THIS_LIB_IMPORT C(ClassDesignerBase) (* DesignerBase_get_classDesigner)(C(DesignerBase) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DesignerBase, objectClass);
extern THIS_LIB_IMPORT void (* DesignerBase_set_objectClass)(C(DesignerBase) d, const char * value);
extern THIS_LIB_IMPORT const char * (* DesignerBase_get_objectClass)(C(DesignerBase) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DesignerBase, isDragging);
extern THIS_LIB_IMPORT void (* DesignerBase_set_isDragging)(C(DesignerBase) d, C(bool) value);
extern THIS_LIB_IMPORT C(bool) (* DesignerBase_get_isDragging)(C(DesignerBase) d);

struct C(EnumClassData)
{
   C(OldList) values;
   int64 largest;
};
extern THIS_LIB_IMPORT void (* IOChannel_get)(C(IOChannel) __this, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT void (* IOChannel_put)(C(IOChannel) __this, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT int M_VTBLID(IOChannel, readData);
// uint IOChannel_readData(C(IOChannel) __i, void * data, uint numBytes);
#define IOChannel_readData(__i, data, numBytes) \
   VMETHOD(CO(IOChannel), IOChannel, readData, __i, uint, \
      C(IOChannel) _ARG void * _ARG uint, \
      __i _ARG data _ARG numBytes)
extern THIS_LIB_IMPORT C(Method) * METHOD(IOChannel, readData);

extern THIS_LIB_IMPORT void (* IOChannel_serialize)(C(IOChannel) __this, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT void (* IOChannel_unserialize)(C(IOChannel) __this, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT int M_VTBLID(IOChannel, writeData);
// uint IOChannel_writeData(C(IOChannel) __i, const void * data, uint numBytes);
#define IOChannel_writeData(__i, data, numBytes) \
   VMETHOD(CO(IOChannel), IOChannel, writeData, __i, uint, \
      C(IOChannel) _ARG const void * _ARG uint, \
      __i _ARG data _ARG numBytes)
extern THIS_LIB_IMPORT C(Method) * METHOD(IOChannel, writeData);

struct C(Iterator)
{
   C(Container) container;
   C(IteratorPointer) * pointer;
};
extern THIS_LIB_IMPORT C(bool) (* Iterator_find)(C(Iterator) * __this, TP(Iterator, T) value);

extern THIS_LIB_IMPORT void (* Iterator_free)(C(Iterator) * __this);

extern THIS_LIB_IMPORT TP(Iterator, T) (* Iterator_getData)(C(Iterator) * __this);

extern THIS_LIB_IMPORT C(bool) (* Iterator_index)(C(Iterator) * __this, TP(Iterator, IT) index, C(bool) create);

extern THIS_LIB_IMPORT C(bool) (* Iterator_next)(C(Iterator) * __this);

extern THIS_LIB_IMPORT C(bool) (* Iterator_prev)(C(Iterator) * __this);

extern THIS_LIB_IMPORT void (* Iterator_remove)(C(Iterator) * __this);

extern THIS_LIB_IMPORT C(bool) (* Iterator_setData)(C(Iterator) * __this, TP(Iterator, T) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Iterator, data);
extern THIS_LIB_IMPORT void (* Iterator_set_data)(C(Iterator) * i, TP(Iterator, T) value);
extern THIS_LIB_IMPORT TP(Iterator, T) (* Iterator_get_data)(C(Iterator) * i);

struct C(Link)
{
   union
   {
      C(LinkElement) link;
      struct
      {
         thisclass(ListItem *) prev;
         thisclass(ListItem *) next;
      };
   };
   uint64 data;
};
struct C(LinkElement)
{
   TP(LinkElement, T) prev;
   TP(LinkElement, T) next;
};
struct CM(LinkList)
{
   TP(LinkList, LT) first;
   TP(LinkList, LT) last;
   int count;
};
extern THIS_LIB_IMPORT void (* LinkList__Sort)(C(LinkList) __this, C(bool) ascending, C(LinkList) * lists);

struct C(ListItem)
{
   union
   {
      C(LinkElement) link;
      struct
      {
         thisclass(ListItem *) prev;
         thisclass(ListItem *) next;
      };
   };
};
extern THIS_LIB_IMPORT C(Property) * PROPERTY(Map, mapSrc);
extern THIS_LIB_IMPORT void (* Map_set_mapSrc)(C(Map) m, C(Map) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapIterator, map);
extern THIS_LIB_IMPORT void (* MapIterator_set_map)(C(MapIterator) * m, C(Map) value);
extern THIS_LIB_IMPORT C(Map) (* MapIterator_get_map)(C(MapIterator) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapIterator, key);
extern THIS_LIB_IMPORT TP(MapIterator, KT) (* MapIterator_get_key)(C(MapIterator) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapIterator, value);
extern THIS_LIB_IMPORT void (* MapIterator_set_value)(C(MapIterator) * m, TP(MapIterator, V) value);
extern THIS_LIB_IMPORT TP(MapIterator, V) (* MapIterator_get_value)(C(MapIterator) * m);

struct C(MapNode)
{
   TP(MapNode, V) value;
};
extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, key);
extern THIS_LIB_IMPORT void (* MapNode_set_key)(C(MapNode) * m, TP(MapNode, KT) value);
extern THIS_LIB_IMPORT TP(MapNode, KT) (* MapNode_get_key)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, value);
extern THIS_LIB_IMPORT void (* MapNode_set_value)(C(MapNode) * m, TP(MapNode, V) value);
extern THIS_LIB_IMPORT TP(MapNode, V) (* MapNode_get_value)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, prev);
extern THIS_LIB_IMPORT thisclass(MapNode *) (* MapNode_get_prev)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, next);
extern THIS_LIB_IMPORT thisclass(MapNode *) (* MapNode_get_next)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, minimum);
extern THIS_LIB_IMPORT thisclass(MapNode *) (* MapNode_get_minimum)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(MapNode, maximum);
extern THIS_LIB_IMPORT thisclass(MapNode *) (* MapNode_get_maximum)(C(MapNode) * m);

extern THIS_LIB_IMPORT C(Module) (* Module_load)(C(Module) __this, const char * name, C(AccessMode) importAccess);

extern THIS_LIB_IMPORT int M_VTBLID(Module, onLoad);
// C(bool) Module_onLoad(C(Module) __i);
#define Module_onLoad(__i) \
   VMETHOD(CO(Module), Module, onLoad, __i, C(bool), \
      C(Module), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Module, onLoad);

extern THIS_LIB_IMPORT int M_VTBLID(Module, onUnload);
// void Module_onUnload(C(Module) __i);
#define Module_onUnload(__i) \
   VMETHOD(CO(Module), Module, onUnload, __i, void, \
      C(Module), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Module, onUnload);

extern THIS_LIB_IMPORT void (* Module_unload)(C(Module) __this, C(Module) module);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Platform, char_ptr);
extern THIS_LIB_IMPORT C(Platform) (* Platform_from_char_ptr)(char * c);
extern THIS_LIB_IMPORT const char * (* Platform_to_char_ptr)(C(Platform) platform);

struct CM(SerialBuffer)
{
   byte * _buffer;
   uint count;
   uint _size;
   uint pos;
};
extern THIS_LIB_IMPORT void (* SerialBuffer_free)(C(SerialBuffer) __this);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(SerialBuffer, buffer);
extern THIS_LIB_IMPORT void (* SerialBuffer_set_buffer)(C(SerialBuffer) s, byte * value);
extern THIS_LIB_IMPORT byte * (* SerialBuffer_get_buffer)(C(SerialBuffer) s);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(SerialBuffer, size);
extern THIS_LIB_IMPORT void (* SerialBuffer_set_size)(C(SerialBuffer) s, uint value);
extern THIS_LIB_IMPORT uint (* SerialBuffer_get_size)(C(SerialBuffer) s);

struct C(StaticString)
{
   char string[1];
};
extern THIS_LIB_IMPORT void (* checkConsistency)(void);
extern THIS_LIB_IMPORT void (* checkMemory)(void);
extern THIS_LIB_IMPORT C(DesignerBase) (* getActiveDesigner)(void);
extern THIS_LIB_IMPORT C(Platform) (* getRuntimePlatform)(void);
extern THIS_LIB_IMPORT C(bool) (* locateModule)(const char * name, const char * fileName);
extern THIS_LIB_IMPORT void (* print)(const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT int (* printBuf)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT void (* printLn)(const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT int (* printLnBuf)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT char * (* printLnString)(const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT int (* printStdArgsToBuffer)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, va_list args);
extern THIS_LIB_IMPORT char * (* printString)(const C(Class) * class_object, const void * object, ...);
extern THIS_LIB_IMPORT void (* setActiveDesigner)(C(DesignerBase) designer);
extern THIS_LIB_IMPORT uint (* log2i)(uint number);
extern THIS_LIB_IMPORT void (* memswap)(byte * a, byte * b, uint size);
extern THIS_LIB_IMPORT uint (* pow2i)(uint number);
extern THIS_LIB_IMPORT void (* qsortr)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), void * arg);
extern THIS_LIB_IMPORT void (* qsortrx)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), int (* optCompareArgLast)(const void * a, const void * b, void * arg), void * arg, C(bool) deref, C(bool) ascending);
extern THIS_LIB_IMPORT void (* queryMemInfo)(char * string);
extern THIS_LIB_IMPORT C(Class) * CO(Window);
extern THIS_LIB_IMPORT C(Class) * CO(String);
extern THIS_LIB_IMPORT C(Class) * CO(byte);
extern THIS_LIB_IMPORT C(Class) * CO(char);
extern THIS_LIB_IMPORT C(Class) * CO(class);
extern THIS_LIB_IMPORT C(Class) * CO(double);
extern THIS_LIB_IMPORT C(Class) * CO(enum);
extern THIS_LIB_IMPORT C(Class) * CO(float);
extern THIS_LIB_IMPORT C(Class) * CO(int);
extern THIS_LIB_IMPORT C(Class) * CO(int64);
extern THIS_LIB_IMPORT C(Class) * CO(intptr);
extern THIS_LIB_IMPORT C(Class) * CO(intsize);
extern THIS_LIB_IMPORT C(Class) * CO(short);
extern THIS_LIB_IMPORT C(Class) * CO(struct);
extern THIS_LIB_IMPORT C(Class) * CO(uint);
extern THIS_LIB_IMPORT C(Class) * CO(uint16);
extern THIS_LIB_IMPORT C(Class) * CO(uint32);
extern THIS_LIB_IMPORT C(Class) * CO(uint64);
extern THIS_LIB_IMPORT C(Class) * CO(uintptr);
extern THIS_LIB_IMPORT C(Class) * CO(uintsize);
extern THIS_LIB_IMPORT C(Class) * CO(BTNode);
extern THIS_LIB_IMPORT C(Class) * CO(BackSlashEscaping);
extern THIS_LIB_IMPORT C(Class) * CO(BinaryTree);
extern THIS_LIB_IMPORT C(Class) * CO(Item);
extern THIS_LIB_IMPORT C(Class) * CO(Mutex);
extern THIS_LIB_IMPORT C(Class) * CO(NamedItem);
extern THIS_LIB_IMPORT C(Class) * CO(NamedLink);
extern THIS_LIB_IMPORT C(Class) * CO(NamedLink64);
extern THIS_LIB_IMPORT C(Class) * CO(OldLink);
extern THIS_LIB_IMPORT C(Class) * CO(OldList);
extern THIS_LIB_IMPORT C(Class) * CO(StringAllocType);
extern THIS_LIB_IMPORT C(Class) * CO(StringBTNode);
extern THIS_LIB_IMPORT C(Class) * CO(StringBinaryTree);
extern THIS_LIB_IMPORT C(Class) * CO(TreePrintStyle);
extern THIS_LIB_IMPORT C(Class) * CO(ZString);
extern THIS_LIB_IMPORT C(Class) * CO(AVLNode);
extern THIS_LIB_IMPORT C(Class) * CO(AVLTree);
extern THIS_LIB_IMPORT C(Class) * CO(AccessMode);
extern THIS_LIB_IMPORT C(Class) * CO(Angle);
extern THIS_LIB_IMPORT C(Class) * CO(Application);
extern THIS_LIB_IMPORT C(Class) * CO(Array);
extern THIS_LIB_IMPORT C(Class) * CO(BTNamedLink);
extern THIS_LIB_IMPORT C(Class) * CO(BitMember);
extern THIS_LIB_IMPORT C(Class) * CO(BuiltInContainer);
extern THIS_LIB_IMPORT C(Class) * CO(CIString);
extern THIS_LIB_IMPORT C(Class) * CO(Class);
extern THIS_LIB_IMPORT C(Class) * CO(ClassDesignerBase);
extern THIS_LIB_IMPORT C(Class) * CO(ClassProperty);
extern THIS_LIB_IMPORT C(Class) * CO(ClassTemplateArgument);
extern THIS_LIB_IMPORT C(Class) * CO(ClassTemplateParameter);
extern THIS_LIB_IMPORT C(Class) * CO(ClassType);
extern THIS_LIB_IMPORT C(Class) * CO(Container);
extern THIS_LIB_IMPORT C(Class) * CO(CustomAVLTree);
extern THIS_LIB_IMPORT C(Class) * CO(DataMember);
extern THIS_LIB_IMPORT C(Class) * CO(DataMemberType);
extern THIS_LIB_IMPORT C(Class) * CO(DataValue);
extern THIS_LIB_IMPORT C(Class) * CO(DefinedExpression);
extern THIS_LIB_IMPORT C(Class) * CO(DesignerBase);
extern THIS_LIB_IMPORT C(Class) * CO(EnumClassData);
extern THIS_LIB_IMPORT C(Class) * CO(GlobalFunction);
extern THIS_LIB_IMPORT C(Class) * CO(IOChannel);
extern THIS_LIB_IMPORT C(Class) * CO(ImportType);
extern THIS_LIB_IMPORT C(Class) * CO(Instance);
extern THIS_LIB_IMPORT C(Class) * CO(Iterator);
extern THIS_LIB_IMPORT C(Class) * CO(IteratorPointer);
extern THIS_LIB_IMPORT C(Class) * CO(Link);
extern THIS_LIB_IMPORT C(Class) * CO(LinkElement);
extern THIS_LIB_IMPORT C(Class) * CO(LinkList);
extern THIS_LIB_IMPORT C(Class) * CO(List);
extern THIS_LIB_IMPORT C(Class) * CO(ListItem);
extern THIS_LIB_IMPORT C(Class) * CO(Map);
extern THIS_LIB_IMPORT C(Class) * CO(MapIterator);
extern THIS_LIB_IMPORT C(Class) * CO(MapNode);
extern THIS_LIB_IMPORT C(Class) * CO(Method);
extern THIS_LIB_IMPORT C(Class) * CO(MethodType);
extern THIS_LIB_IMPORT C(Class) * CO(Module);
extern THIS_LIB_IMPORT C(Class) * CO(NameSpace);
extern THIS_LIB_IMPORT C(Class) * CO(ObjectInfo);
extern THIS_LIB_IMPORT C(Class) * CO(Platform);
extern THIS_LIB_IMPORT C(Class) * CO(Property);
extern THIS_LIB_IMPORT C(Class) * CO(SerialBuffer);
extern THIS_LIB_IMPORT C(Class) * CO(StaticString);
extern THIS_LIB_IMPORT C(Class) * CO(SubModule);
extern THIS_LIB_IMPORT C(Class) * CO(TemplateMemberType);
extern THIS_LIB_IMPORT C(Class) * CO(TemplateParameterType);


////////////////////////////////////////////////// dll function imports //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////


extern LIB_IMPORT const char * __ecereNameSpace__ecere__GetTranslatedString(constString name, const char * string, const char * stringAndContext);
extern LIB_IMPORT void __ecereNameSpace__ecere__LoadTranslatedStrings(constString moduleName, const char * name);
extern LIB_IMPORT void __ecereNameSpace__ecere__UnloadTranslatedStrings(constString name);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__MemoryGuard_PopLoc(void);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(const char * loc);
extern LIB_IMPORT C(Application) __ecereNameSpace__ecere__com____ecere_COM_Initialize(C(bool) guiApp, int argc, char * argv[]);
extern LIB_IMPORT C(BitMember) * __ecereNameSpace__ecere__com__eClass_AddBitMember(C(Class) * _class, const char * name, const char * type, int bitSize, int bitPos, C(AccessMode) declMode);
extern LIB_IMPORT C(ClassProperty) * __ecereNameSpace__ecere__com__eClass_AddClassProperty(C(Class) * _class, const char * name, const char * dataType, void * setStmt, void * getStmt);
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eClass_AddDataMember(C(Class) * _class, const char * name, const char * type, uint size, uint alignment, C(AccessMode) declMode);
extern LIB_IMPORT C(bool) __ecereNameSpace__ecere__com__eClass_AddMember(C(Class) * _class, C(DataMember) * dataMember);
extern LIB_IMPORT C(Method) * __ecereNameSpace__ecere__com__eClass_AddMethod(C(Class) * _class, const char * name, const char * type, void * function, C(AccessMode) declMode);
extern LIB_IMPORT C(Property) * __ecereNameSpace__ecere__com__eClass_AddProperty(C(Class) * _class, const char * name, const char * dataType, void * setStmt, void * getStmt, C(AccessMode) declMode);
extern LIB_IMPORT C(ClassTemplateParameter) * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(C(Class) * _class, const char * name, C(TemplateParameterType) type, const void * info, C(ClassTemplateArgument) * defaultArg);
extern LIB_IMPORT C(Method) * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(C(Class) * _class, const char * name, const char * type, void * function, C(AccessMode) declMode);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_DestructionWatchable(C(Class) * _class);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(C(Class) * base);
extern LIB_IMPORT C(ClassProperty) * __ecereNameSpace__ecere__com__eClass_FindClassProperty(C(Class) * _class, const char * name);
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eClass_FindDataMember(C(Class) * _class, const char * name, C(Module) module, C(DataMember) * subMemberStack, int * subMemberStackPos);
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId(C(Class) * _class, const char * name, int * id, C(Module) module, C(DataMember) * subMemberStack, int * subMemberStackPos);
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(C(Class) * _class, const char * name, uint * offset, C(Module) module, C(DataMember) * subMemberStack, int * subMemberStackPos);
extern LIB_IMPORT C(Method) * __ecereNameSpace__ecere__com__eClass_FindMethod(C(Class) * _class, const char * name, C(Module) module);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_FindNextMember(C(Class) * _class, C(Class) * curClass, C(DataMember) * curMember, C(DataMember) * subMemberStack, int * subMemberStackPos);
extern LIB_IMPORT C(Property) * __ecereNameSpace__ecere__com__eClass_FindProperty(C(Class) * _class, const char * name, C(Module) module);
extern LIB_IMPORT subclass(ClassDesignerBase) __ecereNameSpace__ecere__com__eClass_GetDesigner(C(Class) * _class);
extern LIB_IMPORT int64 __ecereNameSpace__ecere__com__eClass_GetProperty(C(Class) * _class, const char * name);
extern LIB_IMPORT C(bool) __ecereNameSpace__ecere__com__eClass_IsDerived(C(Class) * _class, C(Class) * from);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_Resize(C(Class) * _class, int newSize);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_SetProperty(C(Class) * _class, const char * name, int64 value);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eClass_Unregister(C(Class) * _class);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(C(Class) * _class, const char * string, int64 value);
extern LIB_IMPORT int64 __ecereNameSpace__ecere__com__eEnum_AddValue(C(Class) * _class, const char * string);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_DecRef(C(Instance) instance);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_Delete(C(Instance) instance);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_Evolve(C(Instance) * instancePtr, C(Class) * _class);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(C(Instance) instance, C(Property) * _property);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_FireWatchers(C(Instance) instance, C(Property) * _property);
extern LIB_IMPORT subclass(ClassDesignerBase) __ecereNameSpace__ecere__com__eInstance_GetDesigner(C(Instance) instance);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_IncRef(C(Instance) instance);
extern LIB_IMPORT C(bool) __ecereNameSpace__ecere__com__eInstance_IsDerived(C(Instance) instance, C(Class) * from);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eInstance_New(C(Class) * _class);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eInstance_NewEx(C(Class) * _class, C(bool) bindingsAlloc);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_SetMethod(C(Instance) instance, const char * name, void * function);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_StopWatching(C(Instance) instance, C(Property) * _property, C(Instance) object);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_Watch(C(Instance) instance, C(Property) * _property, void * object, void (* callback)(void *, void *));
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eInstance_WatchDestruction(C(Instance) instance, C(Instance) object, void (* callback)(void *, void *));
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eMember_AddDataMember(C(DataMember) * member, const char * name, const char * type, uint size, uint alignment, C(AccessMode) declMode);
extern LIB_IMPORT C(bool) __ecereNameSpace__ecere__com__eMember_AddMember(C(DataMember) * addTo, C(DataMember) * dataMember);
extern LIB_IMPORT C(DataMember) * __ecereNameSpace__ecere__com__eMember_New(C(DataMemberType) type, C(AccessMode) declMode);
extern LIB_IMPORT C(Module) __ecereNameSpace__ecere__com__eModule_Load(C(Module) fromModule, const char * name, C(AccessMode) importAccess);
extern LIB_IMPORT C(Module) __ecereNameSpace__ecere__com__eModule_LoadStatic(C(Module) fromModule, const char * name, C(AccessMode) importAccess, C(bool) (* Load)(C(Module) module), C(bool) (* Unload)(C(Module) module));
extern LIB_IMPORT C(Module) __ecereNameSpace__ecere__com__eModule_LoadStrict(C(Module) fromModule, const char * name, C(AccessMode) importAccess);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eModule_Unload(C(Module) fromModule, C(Module) module);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eProperty_SelfWatch(C(Class) * _class, const char * name, void (* callback)(void *));
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eProperty_Watchable(C(Property) * _property);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);
extern LIB_IMPORT C(Class) * __ecereNameSpace__ecere__com__eSystem_FindClass(C(Module) module, const char * name);
extern LIB_IMPORT C(DefinedExpression) * __ecereNameSpace__ecere__com__eSystem_FindDefine(C(Module) module, const char * name);
extern LIB_IMPORT C(GlobalFunction) * __ecereNameSpace__ecere__com__eSystem_FindFunction(C(Module) module, const char * name);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eSystem_New(uint size);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eSystem_New0(uint size);
extern LIB_IMPORT C(Class) * __ecereNameSpace__ecere__com__eSystem_RegisterClass(C(ClassType) type, const char * name, const char * baseName, int size, int sizeClass, C(bool) (* Constructor)(void *), void (* Destructor)(void *), C(Module) module, C(AccessMode) declMode, C(AccessMode) inheritanceAccess);
extern LIB_IMPORT C(DefinedExpression) * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char * name, const char * value, C(Module) module, C(AccessMode) declMode);
extern LIB_IMPORT C(GlobalFunction) * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char * name, const char * type, void * func, C(Module) module, C(AccessMode) declMode);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, uint size);
extern LIB_IMPORT void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, uint size);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eSystem_SetArgs(C(Application) app, int argc, char * argv[]);
extern LIB_IMPORT void __ecereNameSpace__ecere__com__eSystem_SetPoolingDisabled(C(bool) disabled);

extern C(Module) __thisModule;

extern THIS_LIB_IMPORT C(Application) eC_init(bool loadEcere, bool guiApp, int argc, char * argv[]);



#ifdef __cplusplus

};

#endif

#endif // !defined(__EC_H__)
