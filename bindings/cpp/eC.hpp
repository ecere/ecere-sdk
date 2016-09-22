// Preprocessor directives can be added at the beginning (Can't store them in AST)

/****************************************************************************
===========================================================================
   Core eC Library
===========================================================================
****************************************************************************/
#if !defined(__EC_HPP__)
#define __EC_HPP__

#include "eC.h"

// Syntactic Sugar (NOT GENERATED)
#define INSTANCEL(x, c) (*(void **)((char *)(x) + (c)->offset))
#define _INSTANCE(x, c) INSTANCEL((x) ? (x) : 0, c)

#define INSTANCE(x, c) ({c * _i = (c *)_INSTANCE(x, x->_class); _i ? *_i : c(x); })

#undef   newi
#define  newi(c) Instance_newEx(c, true)

#define _REGISTER_CLASS(n, ns, bs, a) \
   (Class *)eC_registerClass(normalClass, ns, bs, sizeof(Instance *), 0, \
      (eC_bool (*)(void *)) n::constructor, (void(*)(void *)) n::destructor, (a).impl, privateAccess, publicAccess)

// For defining _class and registereing together (single translation unit)
#define REGISTER_CLASS_DEF(n, b, a)    TCPPClass<n> n::_class(_REGISTER_CLASS(n,     #n, b::_class.impl->name, a));

// For defining _class and registering separately (multiple translation units)
#define CLASS_DEF(n)                   TCPPClass<n> n::_class;
#define REGISTER_CLASS(n, b, a)        n::_class.setup(_REGISTER_CLASS(n,       #n, b::_class.impl->name, a));

// For C++ classes proxying eC classes:
#define REGISTER_CPP_CLASS(n, a)       n::_class.setup(_REGISTER_CLASS(n, "CPP" #n, #n, a));

#define EVOLVE_APP(ac, a) \
   Instance_evolve(&(a).impl, ac::_class.impl); \
   _INSTANCE((a).impl, (a).impl->_class) = &(a); \
   __thisModule = (a).impl; \
   (a).vTbl = _class.vTbl;

#define REGISTER_APP_CLASS(ac, b, a) \
   REGISTER_CLASS(ac, b, a); \
   EVOLVE_APP(ac, a)

#define _CONSTRUCT(c, b) \
   INSTANCE_VIRTUAL_METHODS(c) \
   static TCPPClass<c> _class; \
   static eC_bool constructor(eC_Instance i, eC_bool alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new c(i, _class) != null : true; } \
   static void destructor(eC_Instance i) { c * inst = (c *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(c & self))_class.destructor)(*inst); delete inst; } \
   explicit inline c(eC_Instance _impl, CPPClass & cl = _class) : b(_impl, cl)

#define CONSTRUCT(c, b) \
   c() : c(Instance_newEx(_class.impl, false), _class) { } \
   _CONSTRUCT(c, b)

#define DESTRUCT(c) \
   ((TCPPClass<c> &)_class).destructor

#define REGISTER() \
   static void class_registration(CPPClass & _class)

#define APP_CONSTRUCT(c, b) \
   inline c() : c(eC_init_CALL) { } \
   _CONSTRUCT(c, b)

#if !defined(__WIN32__) || defined(__CONSOLE_APP__)
   #define APP_SET_ARGS(a) eC_setArgs(a.impl, argc, argv);
#else
   #define APP_SET_ARGS(a)
#endif

#define MAIN_DEFINITION \
   extern "C" MAIN_DECLARATION \
   { \
      APP_SET_ARGS(app); \
      app.main(); \
      unloadTranslatedStrings(MODULE_NAME); \
      return app.exitCode; \
   }

#define SELF(c, n)  c * self = ((c *)(((char *)this) + 0x10 - (char *)&((c *)0x10)->n))

#define _ARG ,

#define VIRTUAL_METHOD(n, c, b, r, p0, ep, p, d) \
   struct c ## _ ## n ## _Functor \
   { \
      int _[0]; \
      typedef r (* FunctionType)(p0 p); \
      inline FunctionType operator= (FunctionType func) \
      { \
         SELF(c, n); \
         if(self->vTbl == c::_class.vTbl) \
         { \
            uint size = c :: _class.impl->vTblSize; \
            self->vTbl = (void (**)())newt(FunctionType, size); \
            memcpy(self->vTbl, c::_class.vTbl, sizeof(FunctionType) * size); \
         } \
         ((FunctionType *)self->vTbl)[b ## _ ## n ## _vTblID] = func; \
         return func; \
      } \
      inline r operator()(ep p) \
      { \
         \
         SELF(c, n); \
         d; \
      } \
   } n; \
   inline static void register_ ## n(CPPClass & cl, c ## _ ## n ## _Functor::FunctionType func) \
   { \
      ((c ## _ ## n ## _Functor::FunctionType *)cl.vTbl)[b ## _ ## n ## _vTblID] = func; \
   }

#define _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \
   addMethod(_class.impl, ns, (void *) +[]p \
   { \
      Class * cl = (ocl) ? (Class *)(ocl)->_class : null; \
      cp1 \
      c * i = (oi) ? (c *)_INSTANCE(oi, cl) : null; \
      int vid = bc ## _ ## n ## _vTblID; \
      bc ## _ ## n ## _Functor::FunctionType fn; \
      if(i && i->vTbl && i->vTbl[vid]) \
      { \
         fn = (bc ## _ ## n ## _Functor::FunctionType) i->vTbl[vid]; \
         code; \
      } \
      cp2 \
      else \
      { \
         auto method = ((r (*) p)(class_ ## c->_vTbl)[bc ## _ ## n ## _vTblID]); \
         if(method) return method ea; \
         return rv; \
      } \
   })

#define REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \
   _REGISTER_METHOD(,, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)

#define REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \
   _REGISTER_METHOD(\
      CPPClass * cppcl = _class ? (CPPClass *)_class->bindingsClass : null;, \
      else if(cppcl && cppcl->vTbl && cppcl->vTbl[vid]) \
      { \
         fn = (bc ## _ ## n ## _Functor::FunctionType) cppcl->vTbl[vid]; \
         code; \
      }, \
      ns, n, bc, c, r, p, ocl, oi, code, ea, rv)

#define property(n, sg) struct n ## Prop { n ## Prop() { }; int _[0]; sg } n;

#define _set(t, n, c, d) \
   inline t operator= (t v) \
   { \
      SELF(c, n); \
      d; \
      return v; \
   } \

#define set(t, n, c, d) \
   _set(t, n, c, d) \
   inline n ## Prop & operator= (n ## Prop & prop) \
   { \
      SELF(c, n); \
      t v = prop; \
      d; \
      return prop; \
   }

#define get(t, n, c, d) inline operator t () const { SELF(c, n); d; }

extern "C" eC_Module ecere_init(eC_Module fromModule);

class Class : public eC_Class { };

class CPPClass
{
public:
   typedef void (* Function)(void);
   Class * impl;
   Function * vTbl;
   inline CPPClass() { };
   inline CPPClass(const CPPClass & c) = delete;
   inline CPPClass(const CPPClass && c)
   {
      impl = c.impl;
      vTbl = c.vTbl;
   }
};

template <class T>
class TCPPClass : public CPPClass
{
public:
   TCPPClass() { }
   TCPPClass(Class * _impl)
   {
      setup(_impl);
   }
   void (*destructor)(T &);
   void setup(Class * _impl)
   {
      impl = _impl;
      if(impl)
      {
         _impl->bindingsClass = this;
         if(vTbl) eC_delete(vTbl);
         vTbl = newt(Function, impl->vTblSize);
         memset(vTbl, 0, sizeof(Function) * impl->vTblSize);
         T::class_registration(*this);
      }
   }
   ~TCPPClass()
   {
      if(impl)
         eC_delete(vTbl);
   }
};

// GENERATED: (Instance, Module and Application might require some custom tweaks...)

#define Instance_onDisplay_vTblID               onDisplay_vTblID
#define Instance_onCompare_vTblID               onCompare_vTblID
#define Instance_onCopy_vTblID                  onCopy_vTblID
#define Instance_onFree_vTblID                  onFree_vTblID
#define Instance_onGetString_vTblID             onGetString_vTblID
#define Instance_onGetDataFromString_vTblID     onGetDataFromString_vTblID
#define Instance_onEdit_vTblID                  onEdit_vTblID
#define Instance_onSerialize_vTblID             onSerialize_vTblID
#define Instance_onUnserialize_vTblID           onUnserialize_vTblID
#define Instance_onSaveEdit_vTblID              onSaveEdit_vTblID

// Normal Class Definitions

#define Instance_class_registration(d) \
   REGISTER_TYPED_METHOD("OnCompare", onCompare, Instance, d, int, (Class * _class, eC_Instance o, eC_Instance o2), \
      o, o, return fn(*i, *(Instance *)INSTANCEL(o2, o2->_class)), (_class, o, o2), 1); \
   REGISTER_TYPED_METHOD("OnDisplay", onDisplay, Instance, d, void, (Class * _class, eC_Instance o, eC_Instance /*eC_Surface */ s, int x, int y, int w, void * f, Alignment a, DataDisplayFlags df), \
      o, o, Surface surface(s); fn(*i, surface, x, y, w, f, a, df), (_class, o, s, x, y, w, f, a, df), ); \
   REGISTER_TYPED_METHOD("OnCopy", onCopy, Instance, d, void, (Class * _class, eC_Instance * dest, eC_Instance src), \
      src, dest ? *dest : null, fn(*i, *(Instance *)INSTANCEL(src, src->_class) ), (_class, dest, src), ); \
   REGISTER_TYPED_METHOD("OnFree", onFree, Instance, d, void, (Class * _class, eC_Instance o), \
      o, o, fn(*i), (_class, o), ); \
   REGISTER_TYPED_METHOD("OnGetString", onGetString, Instance, d, constString, (Class * _class, eC_Instance o, String tempString, void * fieldData, eC_bool * needClass), \
      o, o, bool nc; constString r = fn(*i, tempString, fieldData, needClass ? &nc : null); if(needClass) *needClass = nc; return r;, (_class, o, tempString, fieldData, needClass), (constString)null); \
   REGISTER_TYPED_METHOD("OnGetDataFromString", onGetDataFromString, Instance, d, bool, (Class * _class, eC_Instance * o, constString string), \
      o ? *o : null, o ? *o : null, return fn(*i, string); , (_class, o, string), false); \
   REGISTER_TYPED_METHOD("OnSerialize", onSerialize, Instance, d, void, (Class * _class, eC_Instance o, eC_Instance /*eC_IOChannel*/ c), \
      o, o, IOChannel * ref = (IOChannel *)_INSTANCE(c, c->_class); if(ref) fn(*i, *ref); else { IOChannel channel(c); fn(*i, channel); }, (_class, o, c), ); \
   REGISTER_TYPED_METHOD("OnUnserialize", onUnserialize, Instance, d, void, (Class * _class, eC_Instance * o, eC_Instance /*eC_IOChannel*/ c), \
      o ? *o : null, o, IOChannel * ref = (IOChannel *)_INSTANCE(c, c->_class); if(ref) fn(*i, *ref); else { IOChannel channel(c); fn(*i, channel); }, (_class, o, c), ); \
   REGISTER_TYPED_METHOD("OnSaveEdit", onSaveEdit, Instance, d, bool, (Class * _class, eC_Instance * o, eC_Instance /*eC_Window*/ w, void * object), \
      o ? *o : null, o, Window * ref = (Window *)_INSTANCE(w, w->_class); if(ref) return fn(*i, *ref, object); else { Window window(w); return fn(*i, window, object); }, (_class, o, w, object), false); \
   REGISTER_TYPED_METHOD("OnEdit", onEdit, Instance, d, eC_Window, (Class * _class, eC_Instance o, eC_Instance /*eC_DataBox */db, void * obsolete, int x, int y, int w, int h, void * userData), \
      o, o, \
      Window /*DataBox*/ * ref = (Window /*DataBox*/ *)_INSTANCE(db, db->_class); \
      Window * ret; \
      if(ref)                   ret = &fn(*i, *ref,    obsolete, x, y, w, h, userData); \
      else { Window /*DataBox */dataBox(db); \
      ret = &fn(*i, dataBox, obsolete, x, y, w, h, userData); } \
      return ret ? ret->impl : null;, \
      (_class, o, db, obsolete, x, y, w, h, userData), (eC_Window)null);

#define INSTANCE_VIRTUAL_METHODS(c) \
   VIRTUAL_METHOD(onCompare, c, Instance, \
      int, c & _ARG, , c & b, \
      return Instance_onCompare(_class.impl, self ? self->impl : (eC_Instance)null, &b ? b.impl : (eC_Instance)null)); \
   VIRTUAL_METHOD(onCopy, c, Instance, \
      void, c & _ARG, , c & src, \
      return Instance_onCopy(_class.impl, self->impl, &src ? src.impl : (eC_Instance)null)); \
   VIRTUAL_METHOD(onDisplay, c, Instance, \
      void, c & _ARG, , Surface & surface _ARG int x _ARG int y _ARG int w _ARG void * fieldData _ARG Alignment alignment _ARG DataDisplayFlags flags, \
      Instance_onDisplay(_class.impl, self ? self->impl : (eC_Instance)null, &surface ? ((Instance *)&surface)->impl : (eC_Instance)null, x, y, w, fieldData, alignment, flags)); \
   VIRTUAL_METHOD(onFree, c, Instance, \
      void, c &, , , \
      return Instance_onFree(_class.impl, self->impl)); \
   VIRTUAL_METHOD(onGetString, c, Instance, \
      constString, c & _ARG, , String tempString _ARG void * fieldData _ARG bool * needClass, \
      return Instance_onGetString(_class.impl, self ? self->impl : (eC_Instance)null, tempString, fieldData, needClass)); \
   VIRTUAL_METHOD(onGetDataFromString, c, Instance, \
      bool, c & _ARG, , constString string, \
      return Instance_onGetDataFromString(_class.impl, self->impl, string)); \
   VIRTUAL_METHOD(onSerialize, c, Instance, \
      void, c & _ARG, , IOChannel & channel, \
      return Instance_onSerialize(_class.impl, self ? self->impl : (eC_Instance)null, &channel ? ((Instance *)&channel)->impl : (eC_Instance)null)); \
   VIRTUAL_METHOD(onUnserialize, c, Instance, \
      void, c & _ARG, , IOChannel & channel, \
      return Instance_onUnserialize(_class.impl, self->impl, &channel ? ((Instance *)&channel)->impl : (eC_Instance)null)); \
   VIRTUAL_METHOD(onSaveEdit, c, Instance, \
      bool, c & _ARG, , Window & window _ARG void * object, \
      return Instance_onSaveEdit(_class.impl, self->impl, &window ? ((Instance *)&window)->impl : (eC_Instance)null, object)); \
   VIRTUAL_METHOD(onEdit, c, Instance, \
      Window &, c & _ARG, , Window /*DataBox*/ & dataBox _ARG void * obsolete _ARG int x _ARG int y _ARG int w _ARG int h _ARG void * userData, \
      eC_Window window = Instance_onEdit(_class.impl, self->impl, &dataBox ? ((Instance *)&dataBox)->impl : (eC_Instance)null, obsolete, x, y, w, h, userData); \
      return *(Window *)_INSTANCE(window, window->_class); );

class Surface;
class IOChannel;
class Window;
class DataBox;

typedef eC_Window eC_DataBox;

typedef uint32 Alignment;
typedef uint32 DataDisplayFlags;

class Instance
{
public:
   static TCPPClass<Instance> _class;
   eC_Instance impl;
   void (**vTbl)(void);

   void * operator new   (uintsize count) { return eC_new(count); }
   void * operator new [](uintsize count) { return eC_new(count); }
   void operator delete   (void * ptr) { eC_delete(ptr); }
   void operator delete [](void * ptr) { eC_delete(ptr); }

   static eC_bool constructor(eC_Instance i, bool alloc)
   {
      if(alloc &&!_INSTANCE(i, _class.impl))
         return new Instance(i, _class) != null;
      return true;
   }
   static void destructor(eC_Instance i) { Instance * inst = (Instance *)_INSTANCE(i, _class.impl); delete inst; }
   static void class_registration(CPPClass & _class);

   INSTANCE_VIRTUAL_METHODS(Instance);

   inline explicit Instance(eC_Instance _impl, CPPClass & cl = _class)
   {
      Class * c = cl.impl;
      impl = _impl;
      vTbl = cl.vTbl;
      if(impl)
      {
         if(c && !_INSTANCE(impl, c))
            _INSTANCE(impl, c) = this;
         impl->_refCount++;
      }
   }
   inline Instance()
   {
      impl = null;
      vTbl = null;
   }
   inline ~Instance()
   {
      if(impl && impl->_class)
      {
         if(impl->_class->bindingsClass)
         {
            Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);
            if(i && *i == this)
               *i = null;
            if(vTbl)
            {
               CPPClass * cl = (CPPClass *)impl->_class->bindingsClass;
               if(cl && vTbl != cl->vTbl)
               eC_delete(vTbl);
            }
         }
         Instance_decref(impl);
      }
   }
   inline Instance(const Instance & i) = delete;
   inline Instance(const Instance && i)
   {
      impl = i.impl;
      vTbl = i.vTbl;
   }
};

class Module : public Instance
{
public:
   static TCPPClass<Module> _class;
   inline explicit Module(eC_Instance _impl, CPPClass & c = _class) : Instance(_impl, c) { }
};

void eC_cpp_init(Module & module);
void ecere_cpp_init(Module & module);

#define Application_class_registration(d) \
   REGISTER_METHOD("Main", main, Application, d, void, (eC_Instance o), o, o, return fn(*i), (o), );

class Application : public Module
{
public:
   APP_CONSTRUCT(Application, Module)
   {
      eC_cpp_init(*this);
      _INSTANCE(impl, impl->_class) = this;
      vTbl = _class.vTbl;
      __thisModule = impl;

      // TODO: Omit this if we're linking against eC rt only
      ecere_init(impl);
      ecere_cpp_init(*this);

#ifdef MODULE_NAME
      loadTranslatedStrings(null, MODULE_NAME);
#endif
   }

   static void class_registration(CPPClass & _class) { Application_class_registration(Application); }

   property(exitCode, get(int, exitCode, Application, return self ? _IPTR(self->impl, class_Application, class_members_Application)->exitCode : 0) );

   VIRTUAL_METHOD(main, Application, Application, void, Application &, , ,
      return Application_main(self->impl));
};

class Container : public Instance
{
public:
   CONSTRUCT(Container, Instance) { }
/*
   inline IteratorPointer getFirst(void) { return Container_getFirst(impl); }
   inline IteratorPointer getLast(void)  { return Container_getLast(impl); }
   inline IteratorPointer getPrev(IteratorPointer * pointer) { return Container_getPrev(impl, pointer); }
   inline IteratorPointer getNext(IteratorPointer * pointer) { return Container_getNext(impl, pointer); }
   inline Container_D getData(IteratorPointer * pointer) { return (return Container_getData(impl, pointer); }
   inline bool setData(IteratorPointer * pointer, Container_D data) { return Container_setData(impl, pointer, data); }
   inline IteratorPointer getAtPosition(const Container_I pos, bool create, bool * justAdded) { return Container_getAtPosition(impl, pos, create, justAdded); }
   inline IteratorPointer insert(IteratorPointer * after, Container_T value) { return Container_insert(impl, after, value); }
   inline IteratorPointer add(Container_T value) { return Container_add(impl, value) }
   inline void remove(IteratorPointer * it) { Container_remove(impl, it); }
   inline void move(IteratorPointer * it, IteratorPointer * after) { Container_move(impl, it, after); }
   inline void removeAll() { Container_removeAll(impl); }
   inline void copy(Container <T> source) { Container_copy(impl, source); }  // Container <T> source
   inline IteratorPointer find(const Container_D value) { return Container_find(impl, value); }
   inline void freeIterator(IteratorPointer * it) { Container_freeIterator(impl, it); }
   inline int getCount() { return Container_getCount(impl); }
   inline void free() { Container_free(impl); }
   inline void deleteItem(IteratorPointer * i) { Container_deleteItem(impl, i); }
   inline void takeOut(const Container_D d) { Container_takeOut(impl, d); }
*/
};

// Non-Events like methods
//    1. The methods will call the eC methods through the C bindings
//    2. This shound end up calling static class virtual table if overriden
//    3. Registering a method (e.g. onRedraw) needs to call addMethod to update the virtual table, with C callback

class Array : public Container
{
public:
   CONSTRUCT(Array, Container) { }
};

class CustomAVLTree : public Container
{
public:
   CONSTRUCT(CustomAVLTree, Container) { }
};

class AVLTree : public CustomAVLTree
{
public:
   CONSTRUCT(AVLTree, CustomAVLTree) { }
};

class Map : public CustomAVLTree
{
public:
   CONSTRUCT(Map, CustomAVLTree) { }
};

class LinkList : public Container
{
public:
   CONSTRUCT(LinkList, Container) { }
};

class List : public LinkList
{
public:
   CONSTRUCT(List, LinkList) { }
};

class IOChannel : public Instance
{
public:
   CONSTRUCT(IOChannel, Instance) { }
};

class SerialBuffer : public IOChannel
{
public:
   CONSTRUCT(SerialBuffer, IOChannel) { }
};

class OldArray : public Instance
{
public:
   CONSTRUCT(OldArray, Instance) { }
};

// How to handle inheritance from classes not loaded yet?
/*
class ClassDesignerBase : public Window
{
public:
   CONSTRUCT(ClassDesignerBase, Window) { }
};
class DesignerBase : public Window
{
public:
   CONSTRUCT(DesignerBase, Window) { }
};
*/

#endif
