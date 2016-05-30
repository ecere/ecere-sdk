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

#define INSTANCE(x, c) ({c * _i = (c *)_INSTANCE(x, x->_class); _i ? *_i : c { x }; })

#define newt(t, c) eC_new(class_ ## t->structSize * c)

#define class_vtbl_setup(c) \
   { typedef void (* Function)(void *); delete [] (Function *)_class->data; _class->data = new Function [_class->vTblSize]; \
   memset(_class->data, 0, sizeof(Function) * _class->vTblSize); } \

#define _REGISTER_CLASS(n, ns, bs, a) \
   n::class_registration((Class *)eC_registerClass(normalClass, ns, bs, sizeof(Instance *), 0, \
      (eC_bool (*)(void *)) n::constructor, (void(*)(void *)) n::destructor, (a).impl, privateAccess, publicAccess))

// For defining _class and registereing together (single translation unit)
#define REGISTER_CLASS_DEF(n, b, a)    CPPClass<n> n::_class(_REGISTER_CLASS(n,     #n, b::_class.impl->name, a));

// For defining _class and registering separately (multiple translation units)
#define CLASS_DEF(n)                   CPPClass<n> n::_class;
#define REGISTER_CLASS(n, b, a)        n::_class.impl = _REGISTER_CLASS(n,       #n, b::_class.impl->name, a);

// For C++ classes proxying eC classes:
#define REGISTER_CPP_CLASS(n, a)       n::_class.impl = _REGISTER_CLASS(n, "CPP" #n, #n, a);

#define _CONSTRUCT(c, b) \
   static CPPClass<c> _class; \
   static eC_bool constructor(eC_Instance i) { if(!Class_isDerived(i->_class, _class.impl)) return new c(i) != null; return true;} \
   static void destructor(eC_Instance i) { c * inst = (c *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(c & self))_class.destructor)(*inst); delete inst; } \
   explicit inline c(eC_Instance _impl, Class * cl = _class.impl) : b(_impl, cl)

#define CONSTRUCT(c, b) \
   c() : c(Instance_new(_class.impl), _class.impl) { } \
   _CONSTRUCT(c, b)

#define APP_CONSTRUCT(c, b) \
   inline c() : c(eC_init_CALL) { } \
   _CONSTRUCT(c, b)

#if !defined(__WIN32__) || defined(__CONSOLE_APP__)
   #define APP_SET_ARGS(a) eC_setArgs(app, argc, argv)
#else
   #define APP_SET_ARGS(a)
#endif

#define MAIN_DEFINITION \
   MAIN_DECLARATION \
   { \
      APP_SET_ARGS(app); \
      app.main(); \
      unloadTranslatedStrings(MODULE_NAME); \
      return app.exitCode; \
   }

#define SELF(c, n)  c * self = ((c *)(((char *)this) - (char *)&((c *)0)->n))

#define VIRTUAL_METHOD(n, c, b, r, p, sp, d) \
   struct c ## _ ## n ## _Functor \
   { \
      int _[0]; \
      typedef r (* FunctionType)p; \
      FunctionType operator= (FunctionType func) \
      { \
         SELF(c, n); \
         if(self->vTbl == c::_class.impl->data) \
         { \
            uint size = c :: _class.impl->vTblSize; \
            self->vTbl = (void (**)())new FunctionType[size]; \
            memcpy(self->vTbl, c::_class.impl->data, sizeof(FunctionType) * size); \
         } \
         ((FunctionType *)self->vTbl)[b ## _ ## n ## _vTblID] = func; \
         return func; \
      } \
      r operator()sp \
      { \
         SELF(c, n); \
         d; \
      } \
   } n; \
   static void register_ ## n(Class * cl, c ## _ ## n ## _Functor::FunctionType func) \
   { \
      ((c ## _ ## n ## _Functor::FunctionType *)cl->data)[b ## _ ## n ## _vTblID] = func; \
   }

#define REGISTER_METHOD(ns, n, bc, c, r, p, o, a, ea, rv) \
   addMethod(_class, ns, (void *) +[]p \
   { \
      Class * cl = (Class *)o->_class; \
      c * i = (c *)_INSTANCE(o, cl); \
      if(i) \
      { \
         int vid = bc ## _ ## n ## _vTblID; \
         if(i->vTbl && i->vTbl[vid]) \
         { \
            return ((bc ## _ ## n ## _Functor::FunctionType)i->vTbl[vid]) a; \
         } \
         else \
         { \
            auto method = ((r (*) p)(class_ ## c->_vTbl)[bc ## _ ## n ## _vTblID]); \
            if(method) return method ea; \
         } \
      } \
      return rv; \
   })

#define property(n, sg) struct n ## Prop { n ## Prop() { }; int _[0]; sg } n;

#define _set(t, n, d) \
   inline t operator= (t v) \
   { \
      PSELF; \
      d; \
      return v; \
   } \

#define set(t, n, d) \
   _set(t, n, d) \
   inline n ## Prop & operator= (n ## Prop & prop) \
   { \
      PSELF; \
      t v = prop; \
      d; \
      return prop; \
   }

#define get(t, n, d) inline operator t () const { PSELF; d; }

extern "C" eC_Module ecere_init(eC_Module fromModule);

class Class : public eC_Class { };

template <class T>
class CPPClass
{
public:
   Class * impl;
   void (*destructor)(T &);

   CPPClass() { };
   CPPClass(Class * _impl) : impl(_impl) { }
   ~CPPClass()
   {
      if(impl)
         delete [] (void (**)(void))impl->data;
   }
};

// GENERATED: (Instance, Module and Application might require some custom tweaks...)

// Normal Class Definitions
class Instance
{
public:
   static CPPClass<Instance> _class;
   eC_Instance impl;
   void (**vTbl)(void);

   static eC_bool constructor(eC_Instance i) { if(!Class_isDerived(i->_class, _class.impl)) return new Instance(i) != null; return true; }
   static void destructor(eC_Instance i) { Instance * inst = (Instance *)_INSTANCE(i, _class.impl); delete inst; }

   inline explicit Instance(eC_Instance _impl, Class * c = _class.impl)
   {
      impl = _impl;
      vTbl = c ? (void (**)(void))c->data : null;
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
         Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);
         if(i && *i == this)
            *i = null;
         if(vTbl && vTbl != impl->_class->data)
            delete [] vTbl;
         Instance_decref(impl);
      }
   }

   inline Instance(const Instance & i)
   {
      impl = i.impl;
      vTbl = null;
      if(impl)
      {
         impl->_refCount++;
         if(i.vTbl)
            vTbl = i.vTbl;
      }
   }

   static Class * class_registration(Class * _class) { return _class; }
};

class Module : public Instance
{
public:
   static CPPClass<Module> _class;
   inline explicit Module(eC_Instance _impl, Class * c = _class.impl) : Instance(_impl, c) { }
};

void eC_cpp_init(Module & module);
void ecere_cpp_init(Module & module);

#define Application_class_registration(c, d) \
   REGISTER_METHOD("Main", main, Application, d, void, (eC_Instance o), o, (*i), (o), );

class Application : public Module
{
public:
   APP_CONSTRUCT(Application, Module)
   {
      eC_cpp_init(*this);
      _INSTANCE(impl, impl->_class) = this;
      vTbl = (void (**)(void))_class.impl->data;

      // TODO: Omit this if we're linking against eC rt only
      ecere_init(impl);
      ecere_cpp_init(*this);
#ifdef MODULE_NAME
      loadTranslatedStrings(null, MODULE_NAME);
#endif
   }

   static Class * class_registration(Class * _class) { Application_class_registration(_class, Application); class_vtbl_setup(_class); return _class; }

   #undef   PSELF
   #define  PSELF SELF(Application, exitCode)
   property(exitCode, get(int, exitCode, return self ? _IPTR(self->impl, class_Application, class_members_Application)->exitCode : 0) );

   VIRTUAL_METHOD(main, Application, Application, void, (Application &), (),
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

class Array : Container
{
public:
   CONSTRUCT(Array, Container) { }
};

class CustomAVLTree : Container
{
public:
   CONSTRUCT(CustomAVLTree, Container) { }
};

class AVLTree : CustomAVLTree
{
public:
   CONSTRUCT(AVLTree, CustomAVLTree) { }
};

class Map : CustomAVLTree
{
public:
   CONSTRUCT(Map, CustomAVLTree) { }
};

class LinkList : Container
{
public:
   CONSTRUCT(LinkList, Container) { }
};

class List : LinkList
{
public:
   CONSTRUCT(List, LinkList) { }
};

class IOChannel : Instance
{
public:
   CONSTRUCT(IOChannel, Instance) { }
};

class SerialBuffer : IOChannel
{
public:
   CONSTRUCT(SerialBuffer, IOChannel) { }
};

class OldArray : Instance
{
public:
   CONSTRUCT(OldArray, Instance) { }
};

// How to handle inheritance from classes not loaded yet?
/*
class ClassDesignerBase : Window
{
public:
   CONSTRUCT(ClassDesignerBase, Window) { }
};
class DesignerBase : Window
{
public:
   CONSTRUCT(DesignerBase, Window) { }
};
*/

#endif
