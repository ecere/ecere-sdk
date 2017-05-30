from _pyeC import *
import sys
import inspect
import os

app = None

# hardcoded content

def pyObject(eCObject):
   if eCObject._class.bindingsClass != ffi.NULL:
      handle = ffi.cast("void **", ffi.cast("char *", eCObject) + eCObject._class.offset)[0]
      if handle != ffi.NULL: return ffi.from_handle(handle)
   return None

def pyOrNewObject(c, eCObject, templateParams = None):
   if eCObject == ffi.NULL: return None
   o = pyObject(eCObject)
   if o is None:
      if templateParams is not None: o = c(templateParams = templateParams, impl = eCObject)
      else: o = c(impl = eCObject)
   return o

def IPTR(lib, ffi, self, c):
   if self is None or self.impl == ffi.NULL: return None
   cn = c.__name__
   co = getattr(lib, 'class_' + cn)
   offset = co.offset
   bp = ffi.cast("char *", self.impl) + offset
   s = ffi.cast("struct class_members_" + cn + " *", bp)
   return s

@ffi.callback("void(Instance)")
def cb_Instance_destructor(i):
   instance = pyObject(i)
   if instance is not None:
      Instance.instances.remove(instance)
      instance.handle = 0
   else:
      _print("No matching instance! for ", ffi.string(i._class.name).decode('utf8'))

@ffi.callback("bool(Instance, bool)")
def cb_Instance_constructor(i, a):
   s = (ffi.string(i._class.name).decode('utf8'))[2:]
   if a:
      for ag in app.appGlobals:
         g = ag.get(s, None)
         if g is not None:
            g(impl = i)
            break
   return True

def I18N(s):
   return ffi.string(lib.getTranslatedString(os.path.splitext(os.path.basename(inspect.getfile(sys._getframe(1))))[0].encode('utf8'), s.encode('utf8'), ffi.NULL        )).decode('utf8')
def I18NC(s, c):
   return ffi.string(lib.getTranslatedString(os.path.splitext(os.path.basename(inspect.getfile(sys._getframe(1))))[0].encode('utf8'), s.encode('utf8'), c.encode('utf8'))).decode('utf8')

def convertTypedArgs(args):
   cargs = ()
   for a in args:
      if type(a) == str:            cargs += (lib.class_String, ffi.new("char[]", a.encode('utf8')))
      if type(a) == int:            cargs += (lib.class_int,    ffi.new("int *", a))
      if type(a) == float:          cargs += (lib.class_double, ffi.new("double *", a))
      if isinstance(a, Instance):   cargs += (a.impl._class, a.impl)
   return cargs + (ffi.NULL,)

def ecPtr(_pyObject):
   if _pyObject is None: return ffi.NULL
   return _pyObject.impl

def TA(a):
   if type(a) == int:            return lib.TAi(a)
   if type(a) == float:          return lib.TAf(a)
   if isinstance(a, Instance):   return lib.TAo(a.impl)
   return 0

def OTA(c, value):
   ffi = app.ffi
   cn = ffi.string(c.name).decode('utf8')
   pc = app.appGlobals[-1].get(cn, None)
   if pc is not None:
      if c.type == lib.ClassType_normalClass:
         return pc(impl = lib.oTAInstance(value))
      elif c.type == lib.ClassType_noHeadClass:
         return pc(impl = ffi.cast(cn + "*", lib.oTAInstance(value)))
      elif c.type == lib.ClassType_structClass:
         return pc(impl = ffi.cast(cn + "*", lib.oTAInstance(value))[0])

   # TODO: Fill this up
   return None

def ffis(s): return ffi.string(s).decode('utf8')

def coFromPy(v0):
   t = type(v0)
   co = ffi.NULL
   if t == int:     co = lib.class_int
   elif t == float: co = lib.class_double
   else:
      if co == ffi.NULL and isinstance(v0, Instance):
         c = t
         while True:
            if hasattr(c, 'pyClass_' + c.__name__):
               co = getattr(c, 'pyClass_' + c.__name__)
               break
            if len(c.__bases__) >= 1:
               c = c.__bases__[0]
            break
      if co == ffi.NULL:
         c = t
         while True:
            ag_lib = app.lib
            if hasattr(ag_lib, 'class_' + c.__name__):
               co = getattr(ag_lib, 'class_' + c.__name__)
               break
            if len(c.__bases__) >= 1:
               c = c.__bases__[0]
            break
      if co == ffi.NULL:
         print("Container error: could not match to eC class: ", t.__name__)
   return co

class pyBaseClass:
   buc = None
   def __init__(self, impl):
      self.impl = impl

   def __neg__(self):
      t = type(self)
      return t(impl = -self.impl)

   def __int__(self):   return self.impl
   def __long__(self):  return self.impl
   def __float__(self): return self.impl

   def __truediv__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = self.impl / other.impl)
   def __rtruediv__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = other.impl / self.impl)
   def __mul__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = self.impl * other.impl)
   def __rmul__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = other.impl * self.impl)
   def __add__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = self.impl + other.impl)
   def __radd__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = other.impl + self.impl)
   def __sub__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = self.impl - other.impl)
   def __rsub__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return t(impl = other.impl - self.impl)

   def __lt__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl < other.impl
   def __gt__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl > other.impl
   def __le__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl <= other.impl
   def __ge__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl >= other.impl
   def __ne__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl != other.impl
   def __eq__(self, other):
      t = type(self)
      buc = t.buc if t.buc is not None else t
      if not isinstance(other, buc): other = t(other)
      return self.impl == other.impl

# hardcoded classes

class Bool:
   true  = lib.true
   false = lib.false

class Instance:
   instances = []
   def __init__(self, templateParams = None, impl = None):
      if hasattr(self, 'impl') and self.impl is not None: impl = self.impl
      if impl is None:
         c = type(self)
         while not hasattr(c, 'pyClass_' + c.__name__):
            c = c.__bases__[0]
         pyClass = getattr(c, 'pyClass_' + c.__name__)
         if templateParams is not None:
            templateName = ffi.string(pyClass.name).decode('utf8') + templateParams
            if hasattr(c, templateName):
               template = getattr(c, templateName)
            else:
               template = lib.eC_findClass(pyClass.module, templateName.encode('utf8'))
               setattr(c, templateName, template)
            self.impl = ffi.cast("Instance", lib.Instance_newEx(template, False))
         else:
            self.impl = ffi.cast("Instance", lib.Instance_newEx(pyClass, False))
      else:
         self.impl = impl
      Instance.instances.append(self)
      if not hasattr(self, 'handle'):
         self.handle = ffi.new_handle(self)
      if impl != ffi.NULL and (impl is None or impl._class.bindingsClass != ffi.NULL):
         ffi.cast("void **", ffi.cast("char *", self.impl) + self.impl._class.offset)[0] = self.handle

# end of hardcoded content

class String:
   def __init__(self, impl = None):
      if impl is not None: self.impl = impl
      else: self.impl = ffi.NULL
   # hardcoded __str__
   def __str__(self):
      return ffi.string(self.impl).decode('utf8') if self.impl != ffi.NULL else str()

   # here is a conversion
   # String_to_char_ptr
   # String_from_char_ptr

class Window(Instance):pass

@ffi.callback("void(Module)")
def cb_Module_onLoad(__m):
   module = pyOrNewObject(Module, __m)
   module.fn_Module_onLoad(module)

@ffi.callback("void(Module)")
def cb_Module_onUnload(__m):
   module = pyOrNewObject(Module, __m)
   module.fn_Module_onUnload(module)
def regclass(c):
   app.registerClass(c)
   return c

class Module(Instance):
   def __init__(self,
                application = None,
                classes = None,
                defines = None,
                functions = None,
                modules = None,
                prev = None,
                next = None,
                name = None,
                library = None,
                Unload = None,
                importType = None,
                origImportType = None,
                privateNameSpace = None,
                publicNameSpace = None,
                onLoad = None,
                onUnload = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if application is not None:      self.application = application
      if classes is not None:          self.classes = classes
      if defines is not None:          self.defines = defines
      if functions is not None:        self.functions = functions
      if modules is not None:          self.modules = modules
      if prev is not None:             self.prev = prev
      if next is not None:             self.next = next
      if name is not None:             self.name = name
      if library is not None:          self.library = library
      if Unload is not None:           self.Unload = Unload
      if importType is not None:       self.importType = importType
      if origImportType is not None:   self.origImportType = origImportType
      if privateNameSpace is not None: self.privateNameSpace = privateNameSpace
      if publicNameSpace is not None:  self.publicNameSpace = publicNameSpace
      if onLoad is not None:           self.onLoad = onLoad
      if onUnload is not None:         self.onUnload = onUnload

   # hack: hardcoded content
   def registerClass(self, n, isWrapper = False):
      if isWrapper:
         cn = "Py" + n.__name__
         bn = n.__name__
      else:
         cn = n.__name__
         b = n
         while not hasattr(b, 'pyClass_' + b.__name__):
            b = b.__bases__[0]
         bn = b.__name__
      pyClass = lib.eC_registerClass(lib.ClassType_normalClass, cn.encode('utf8'), bn.encode('utf8'), 8, 0,
         ffi.cast("bool(*)(void *)", cb_Instance_constructor),
         ffi.cast("void(*)(void *)", cb_Instance_destructor),
         self.impl, lib.AccessMode_publicAccess, lib.AccessMode_publicAccess)
      setattr(n, 'pyClass_' + n.__name__, pyClass)
      pyClass.bindingsClass = ffi.new_handle(n)
   # hack: end of hardcoded content

   @property
   def application(self): return Application(impl = IPTR(lib, ffi, self, Module).application)
   @application.setter
   def application(self, value):
      if not isinstance(value, Application): value = Application(value)
      IPTR(lib, ffi, self, Module).application = value.impl

   @property
   def classes(self): return OldList(impl = IPTR(lib, ffi, self, Module).classes)
   @classes.setter
   def classes(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Module).classes = value.impl

   @property
   def defines(self): return OldList(impl = IPTR(lib, ffi, self, Module).defines)
   @defines.setter
   def defines(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Module).defines = value.impl

   @property
   def functions(self): return OldList(impl = IPTR(lib, ffi, self, Module).functions)
   @functions.setter
   def functions(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Module).functions = value.impl

   @property
   def modules(self): return OldList(impl = IPTR(lib, ffi, self, Module).modules)
   @modules.setter
   def modules(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Module).modules = value.impl

   @property
   def prev(self): return Module(impl = IPTR(lib, ffi, self, Module).prev)
   @prev.setter
   def prev(self, value):
      if not isinstance(value, Module): value = Module(value)
      IPTR(lib, ffi, self, Module).prev = value.impl

   @property
   def next(self): return Module(impl = IPTR(lib, ffi, self, Module).next)
   @next.setter
   def next(self, value):
      if not isinstance(value, Module): value = Module(value)
      IPTR(lib, ffi, self, Module).next = value.impl

   @property
   def name(self): return IPTR(lib, ffi, self, Module).name
   @name.setter
   def name(self, value): IPTR(lib, ffi, self, Module).name = value

   @property
   def library(self): return IPTR(lib, ffi, self, Module).library
   @library.setter
   def library(self, value): IPTR(lib, ffi, self, Module).library = value

   @property
   def Unload(self): return IPTR(lib, ffi, self, Module).Unload
   @Unload.setter
   def Unload(self, value): IPTR(lib, ffi, self, Module).Unload = value

   @property
   def importType(self): return ImportType(impl = IPTR(lib, ffi, self, Module).importType)
   @importType.setter
   def importType(self, value): IPTR(lib, ffi, self, Module).importType = value.impl

   @property
   def origImportType(self): return ImportType(impl = IPTR(lib, ffi, self, Module).origImportType)
   @origImportType.setter
   def origImportType(self, value): IPTR(lib, ffi, self, Module).origImportType = value.impl

   @property
   def privateNameSpace(self): return NameSpace(impl = IPTR(lib, ffi, self, Module).privateNameSpace)
   @privateNameSpace.setter
   def privateNameSpace(self, value):
      if not isinstance(value, NameSpace): value = NameSpace(value)
      IPTR(lib, ffi, self, Module).privateNameSpace = value.impl

   @property
   def publicNameSpace(self): return NameSpace(impl = IPTR(lib, ffi, self, Module).publicNameSpace)
   @publicNameSpace.setter
   def publicNameSpace(self, value):
      if not isinstance(value, NameSpace): value = NameSpace(value)
      IPTR(lib, ffi, self, Module).publicNameSpace = value.impl

   def load(self, name, importAccess):
      return pyOrNewObject(Module, lib.Module_load(self.impl, name.encode('utf8'), importAccess))

   def fn_unset_Module_onLoad(self):
      return lib.Module_onLoad(self.impl)

   @property
   def onLoad(self):
      if hasattr(self, 'fn_Module_onLoad'): return self.fn_Module_onLoad
      else: return self.fn_unset_Module_onLoad
   @onLoad.setter
   def onLoad(self, value):
      self.fn_Module_onLoad = value
      lib.Instance_setMethod(self.impl, "OnLoad".encode('utf8'), cb_Module_onLoad)

   def fn_unset_Module_onUnload(self):
      return lib.Module_onUnload(self.impl)

   @property
   def onUnload(self):
      if hasattr(self, 'fn_Module_onUnload'): return self.fn_Module_onUnload
      else: return self.fn_unset_Module_onUnload
   @onUnload.setter
   def onUnload(self, value):
      self.fn_Module_onUnload = value
      lib.Instance_setMethod(self.impl, "OnUnload".encode('utf8'), cb_Module_onUnload)

   def unload(self, module):
      if module is not None and not isinstance(module, Module): module = Module(module)
      if module is None: module = ffi.NULL
      lib.Module_unload(self.impl, module)

class IteratorPointer:
   def __init__(self, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("IteratorPointer *", lib.Instance_new(lib.class_IteratorPointer))

class ListItem(IteratorPointer):
   def __init__(self, link = None, prev = None, next = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("ListItem *", lib.Instance_new(lib.class_ListItem))
         if link is not None: self.link = link
         if prev is not None: self.prev = prev
         if next is not None: self.next = next

   @property
   def link(self): return LinkElement(impl = self.impl.link)
   @link.setter
   def link(self, value): self.impl.link = value.impl[0]

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value): self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value): self.impl.next = value

@ffi.callback("void(Container, tparam_Container_T)")
def cb_Container_add(__c, value):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_add(container, TA(value))

@ffi.callback("void(Container, Container)")
def cb_Container_copy(__c, source):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_copy(container, Container("", impl = source))

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_delete(__c, i):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_delete(container, IteratorPointer(impl = i))

@ffi.callback("void(Container, tparam_Container_D)")
def cb_Container_find(__c, value):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_find(container, TA(value))

@ffi.callback("void(Container)")
def cb_Container_free(__c):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_free(container)

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_freeIterator(__c, it):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_freeIterator(container, IteratorPointer(impl = it))

@ffi.callback("void(Container, tparam_Container_I, bool, bool *)")
def cb_Container_getAtPosition(__c, pos, create, justAdded):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getAtPosition(container, TA(pos), create, justAdded)

@ffi.callback("void(Container)")
def cb_Container_getCount(__c):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getCount(container)

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_getData(__c, pointer):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getData(container, IteratorPointer(impl = pointer))

@ffi.callback("void(Container)")
def cb_Container_getFirst(__c):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getFirst(container)

@ffi.callback("void(Container)")
def cb_Container_getLast(__c):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getLast(container)

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_getNext(__c, pointer):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getNext(container, IteratorPointer(impl = pointer))

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_getPrev(__c, pointer):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_getPrev(container, IteratorPointer(impl = pointer))

@ffi.callback("void(Container, IteratorPointer *, tparam_Container_T)")
def cb_Container_insert(__c, after, value):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_insert(container, IteratorPointer(impl = after), TA(value))

@ffi.callback("void(Container, IteratorPointer *, IteratorPointer *)")
def cb_Container_move(__c, it, after):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_move(container, IteratorPointer(impl = it), IteratorPointer(impl = after))

@ffi.callback("void(Container, IteratorPointer *)")
def cb_Container_remove(__c, it):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_remove(container, IteratorPointer(impl = it))

@ffi.callback("void(Container)")
def cb_Container_removeAll(__c):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_removeAll(container)

@ffi.callback("void(Container, IteratorPointer *, tparam_Container_D)")
def cb_Container_setData(__c, pointer, data):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_setData(container, IteratorPointer(impl = pointer), TA(data))

@ffi.callback("void(Container, bool)")
def cb_Container_sort(__c, ascending):
   container = pyOrNewObject(Container, __c)
   container.fn_Container_sort(container, ascending)

class Container(Instance):
   # hack: hardcoded content
   def __init__(self, templateParams = None, copySrc = None, impl = None):
      if impl is None:
         if type(templateParams) != str and copySrc is None:
            copySrc = templateParams
            if isinstance(copySrc, list) and len(copySrc) > 0:
               co = coFromPy(copySrc[0])
               if co is not None: templateParams = "<" + ffis(co.name) + ">"
      Instance.__init__(self, templateParams, impl=impl)
      if copySrc is not None: self.copySrc = copySrc

   def __getitem__(self, index):
      itPtr = self.getAtPosition(index, False, None)
      if itPtr == ffi.NULL: raise IndexError()
      d = OTA(self.impl._class.templateArgs[0].dataTypeClass, self.getData(itPtr))
      return d

   def __len__(self): return getCount()

   @property
   def copySrc(self): return lib.Container_get_copySrc(self.impl)
   @copySrc.setter
   def copySrc(self, value):
      if isinstance(value, Container): lib.Container_set_copySrc(self.impl, value)
      if isinstance(value, list):
         count = len(value)
         co = ffi.NULL
         dt = self.impl._class.templateArgs[0].dataTypeClass
         if dt != ffi.NULL:
            co = dt
         if count > 0:
            v0 = value[0]
            pc = None
            if co is None: co = coFromPy(v0)
            if co is not None:
               pcn = ffi.string(co.name).decode('utf8')
               for ag in app.appGlobals:
                  pc = ag.get(pcn, None)
                  if pc is not None: break

            if co == ffi.NULL:
               # TODO: Have more type checks?
               data = ffi.NULL
            else:
               ag_ffi = app.ffi
               if co.type == lib.ClassType_normalClass or co.type == lib.ClassType_noHeadClass:
                  data = ag_ffi.new("void *[]", count)
                  for i in range(0, count):
                     v = value[i]
                     if isinstance(v, tuple) and pc is not None: v = pc(v)
                     data[i] = v.impl if v is not None else ffi.NULL
               elif co.type == lib.ClassType_structClass:
                  data = ag_ffi.new(ffi.string(co.name).decode('utf8') + "[]", count)
                  for i in range(0, count):
                     v = value[i]
                     if isinstance(v, tuple) and pc is not None: v = pc(v)    # TODO: Optimization to use tuple directly?
                     if v is not None: data[i] = v.impl[0]
               else:
                  if co == lib.class_int: data = ag_ffi.new("int []", value)
                  elif co == lib.class_float: data = ag_ffi.new("float []", value)
                  elif co == lib.class_double: data = ag_ffi.new("double []", value)
                  else:
                     data = ag_ffi.new("uint[]", count)   # TODO: Determine proper data type / size (bit classes, units, enums, system)
                     for i in range(0, count):
                        v = value[i]
                        if isinstance(v, tuple) and pc is not None: v = pc(v)
                        data[i] = v.impl if v is not None else 0

         bic = ffi.new("BuiltInContainer *", {
               '_vTbl'     : lib.class_BuiltInContainer._vTbl,
               '_class'    : lib.class_BuiltInContainer,
               'data'      : data,
               '_refCount' : 0,
               'count'     : count,
               'type'      : co
               })

         lib.Container_set_copySrc(self.impl, ffi.cast("Container", bic))
   # hack: end of hardcoded content

   def fn_unset_Container_add(self, value):
      return lib.Container_add(self.impl, value)

   @property
   def add(self):
      if hasattr(self, 'fn_Container_add'): return self.fn_Container_add
      else: return self.fn_unset_Container_add
   @add.setter
   def add(self, value):
      self.fn_Container_add = value
      lib.Instance_setMethod(self.impl, "Add".encode('utf8'), cb_Container_add)

   def fn_unset_Container_copy(self, source):
      return lib.Container_copy(self.impl, ffi.NULL if source is None else source.impl)

   @property
   def copy(self):
      if hasattr(self, 'fn_Container_copy'): return self.fn_Container_copy
      else: return self.fn_unset_Container_copy
   @copy.setter
   def copy(self, value):
      self.fn_Container_copy = value
      lib.Instance_setMethod(self.impl, "Copy".encode('utf8'), cb_Container_copy)

   def fn_unset_Container_delete(self, i):
      return lib.Container_delete(self.impl, i)

   @property
   def delete(self):
      if hasattr(self, 'fn_Container_delete'): return self.fn_Container_delete
      else: return self.fn_unset_Container_delete
   @delete.setter
   def delete(self, value):
      self.fn_Container_delete = value
      lib.Instance_setMethod(self.impl, "Delete".encode('utf8'), cb_Container_delete)

   def fn_unset_Container_find(self, value):
      return lib.Container_find(self.impl, value)

   @property
   def find(self):
      if hasattr(self, 'fn_Container_find'): return self.fn_Container_find
      else: return self.fn_unset_Container_find
   @find.setter
   def find(self, value):
      self.fn_Container_find = value
      lib.Instance_setMethod(self.impl, "Find".encode('utf8'), cb_Container_find)

   def fn_unset_Container_free(self):
      return lib.Container_free(self.impl)

   @property
   def free(self):
      if hasattr(self, 'fn_Container_free'): return self.fn_Container_free
      else: return self.fn_unset_Container_free
   @free.setter
   def free(self, value):
      self.fn_Container_free = value
      lib.Instance_setMethod(self.impl, "Free".encode('utf8'), cb_Container_free)

   def fn_unset_Container_freeIterator(self, it):
      return lib.Container_freeIterator(self.impl, it)

   @property
   def freeIterator(self):
      if hasattr(self, 'fn_Container_freeIterator'): return self.fn_Container_freeIterator
      else: return self.fn_unset_Container_freeIterator
   @freeIterator.setter
   def freeIterator(self, value):
      self.fn_Container_freeIterator = value
      lib.Instance_setMethod(self.impl, "FreeIterator".encode('utf8'), cb_Container_freeIterator)

   def fn_unset_Container_getAtPosition(self, pos, create, justAdded):
      if justAdded is None: justAdded = ffi.NULL
      return lib.Container_getAtPosition(self.impl, pos, create, justAdded)

   @property
   def getAtPosition(self):
      if hasattr(self, 'fn_Container_getAtPosition'): return self.fn_Container_getAtPosition
      else: return self.fn_unset_Container_getAtPosition
   @getAtPosition.setter
   def getAtPosition(self, value):
      self.fn_Container_getAtPosition = value
      lib.Instance_setMethod(self.impl, "GetAtPosition".encode('utf8'), cb_Container_getAtPosition)

   def fn_unset_Container_getCount(self):
      return lib.Container_getCount(self.impl)

   @property
   def getCount(self):
      if hasattr(self, 'fn_Container_getCount'): return self.fn_Container_getCount
      else: return self.fn_unset_Container_getCount
   @getCount.setter
   def getCount(self, value):
      self.fn_Container_getCount = value
      lib.Instance_setMethod(self.impl, "GetCount".encode('utf8'), cb_Container_getCount)

   def fn_unset_Container_getData(self, pointer):
      return lib.Container_getData(self.impl, pointer)

   @property
   def getData(self):
      if hasattr(self, 'fn_Container_getData'): return self.fn_Container_getData
      else: return self.fn_unset_Container_getData
   @getData.setter
   def getData(self, value):
      self.fn_Container_getData = value
      lib.Instance_setMethod(self.impl, "GetData".encode('utf8'), cb_Container_getData)

   def fn_unset_Container_getFirst(self):
      return lib.Container_getFirst(self.impl)

   @property
   def getFirst(self):
      if hasattr(self, 'fn_Container_getFirst'): return self.fn_Container_getFirst
      else: return self.fn_unset_Container_getFirst
   @getFirst.setter
   def getFirst(self, value):
      self.fn_Container_getFirst = value
      lib.Instance_setMethod(self.impl, "GetFirst".encode('utf8'), cb_Container_getFirst)

   def fn_unset_Container_getLast(self):
      return lib.Container_getLast(self.impl)

   @property
   def getLast(self):
      if hasattr(self, 'fn_Container_getLast'): return self.fn_Container_getLast
      else: return self.fn_unset_Container_getLast
   @getLast.setter
   def getLast(self, value):
      self.fn_Container_getLast = value
      lib.Instance_setMethod(self.impl, "GetLast".encode('utf8'), cb_Container_getLast)

   def fn_unset_Container_getNext(self, pointer):
      return lib.Container_getNext(self.impl, pointer)

   @property
   def getNext(self):
      if hasattr(self, 'fn_Container_getNext'): return self.fn_Container_getNext
      else: return self.fn_unset_Container_getNext
   @getNext.setter
   def getNext(self, value):
      self.fn_Container_getNext = value
      lib.Instance_setMethod(self.impl, "GetNext".encode('utf8'), cb_Container_getNext)

   def fn_unset_Container_getPrev(self, pointer):
      return lib.Container_getPrev(self.impl, pointer)

   @property
   def getPrev(self):
      if hasattr(self, 'fn_Container_getPrev'): return self.fn_Container_getPrev
      else: return self.fn_unset_Container_getPrev
   @getPrev.setter
   def getPrev(self, value):
      self.fn_Container_getPrev = value
      lib.Instance_setMethod(self.impl, "GetPrev".encode('utf8'), cb_Container_getPrev)

   def fn_unset_Container_insert(self, after, value):
      return lib.Container_insert(self.impl, after, value)

   @property
   def insert(self):
      if hasattr(self, 'fn_Container_insert'): return self.fn_Container_insert
      else: return self.fn_unset_Container_insert
   @insert.setter
   def insert(self, value):
      self.fn_Container_insert = value
      lib.Instance_setMethod(self.impl, "Insert".encode('utf8'), cb_Container_insert)

   def fn_unset_Container_move(self, it, after):
      return lib.Container_move(self.impl, it, after)

   @property
   def move(self):
      if hasattr(self, 'fn_Container_move'): return self.fn_Container_move
      else: return self.fn_unset_Container_move
   @move.setter
   def move(self, value):
      self.fn_Container_move = value
      lib.Instance_setMethod(self.impl, "Move".encode('utf8'), cb_Container_move)

   def fn_unset_Container_remove(self, it):
      return lib.Container_remove(self.impl, it)

   @property
   def remove(self):
      if hasattr(self, 'fn_Container_remove'): return self.fn_Container_remove
      else: return self.fn_unset_Container_remove
   @remove.setter
   def remove(self, value):
      self.fn_Container_remove = value
      lib.Instance_setMethod(self.impl, "Remove".encode('utf8'), cb_Container_remove)

   def fn_unset_Container_removeAll(self):
      return lib.Container_removeAll(self.impl)

   @property
   def removeAll(self):
      if hasattr(self, 'fn_Container_removeAll'): return self.fn_Container_removeAll
      else: return self.fn_unset_Container_removeAll
   @removeAll.setter
   def removeAll(self, value):
      self.fn_Container_removeAll = value
      lib.Instance_setMethod(self.impl, "RemoveAll".encode('utf8'), cb_Container_removeAll)

   def fn_unset_Container_setData(self, pointer, data):
      return lib.Container_setData(self.impl, pointer, data)

   @property
   def setData(self):
      if hasattr(self, 'fn_Container_setData'): return self.fn_Container_setData
      else: return self.fn_unset_Container_setData
   @setData.setter
   def setData(self, value):
      self.fn_Container_setData = value
      lib.Instance_setMethod(self.impl, "SetData".encode('utf8'), cb_Container_setData)

   def fn_unset_Container_sort(self, ascending):
      return lib.Container_sort(self.impl, ascending)

   @property
   def sort(self):
      if hasattr(self, 'fn_Container_sort'): return self.fn_Container_sort
      else: return self.fn_unset_Container_sort
   @sort.setter
   def sort(self, value):
      self.fn_Container_sort = value
      lib.Instance_setMethod(self.impl, "Sort".encode('utf8'), cb_Container_sort)

   def takeOut(self, d):
      lib.Container_takeOut(self.impl, TA(d))

class LinkList(Container):
   def __init__(self, templateParams = None,
                copySrc = None,
                first = None,
                last = None,
                count = None,
                add = None,
                copy = None,
                delete = None,
                find = None,
                free = None,
                freeIterator = None,
                getAtPosition = None,
                getCount = None,
                getData = None,
                getFirst = None,
                getLast = None,
                getNext = None,
                getPrev = None,
                insert = None,
                move = None,
                remove = None,
                removeAll = None,
                setData = None,
                sort = None,
                impl = None):
      Container.__init__(self, templateParams, impl = impl)
      if copySrc is not None:       self.copySrc = copySrc
      if first is not None:         self.first = first
      if last is not None:          self.last = last
      if count is not None:         self.count = count
      if add is not None:           self.add = add
      if copy is not None:          self.copy = copy
      if delete is not None:        self.delete = delete
      if find is not None:          self.find = find
      if free is not None:          self.free = free
      if freeIterator is not None:  self.freeIterator = freeIterator
      if getAtPosition is not None: self.getAtPosition = getAtPosition
      if getCount is not None:      self.getCount = getCount
      if getData is not None:       self.getData = getData
      if getFirst is not None:      self.getFirst = getFirst
      if getLast is not None:       self.getLast = getLast
      if getNext is not None:       self.getNext = getNext
      if getPrev is not None:       self.getPrev = getPrev
      if insert is not None:        self.insert = insert
      if move is not None:          self.move = move
      if remove is not None:        self.remove = remove
      if removeAll is not None:     self.removeAll = removeAll
      if setData is not None:       self.setData = setData
      if sort is not None:          self.sort = sort

   @property
   def first(self): return IPTR(lib, ffi, self, LinkList).first
   @first.setter
   def first(self, value): IPTR(lib, ffi, self, LinkList).first = value

   @property
   def last(self): return IPTR(lib, ffi, self, LinkList).last
   @last.setter
   def last(self, value): IPTR(lib, ffi, self, LinkList).last = value

   @property
   def count(self): return IPTR(lib, ffi, self, LinkList).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, LinkList).count = value

   def _Sort(self, ascending, lists):
      lib.LinkList__Sort(self.impl, ascending, lists)

class Iterator:
   def __init__(self, container = None, pointer = None, data = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("Iterator *", impl)
      else:
         if isinstance(container, tuple):
            __tuple = container
            container = None
            if len(__tuple) > 0: container = __tuple[0]
            if len(__tuple) > 1: pointer   = __tuple[1]
            if len(__tuple) > 2: data      = __tuple[2]
         if pointer is not None:
            if not isinstance(pointer, IteratorPointer): pointer = IteratorPointer(pointer)
            pointer = pointer.impl
         self.impl = ffi.new("Iterator *", { 'container' : container, 'pointer' : pointer })
         if data is not None:      self.data           = data
         if data is not None:      self.data           = data
      if data is not None:      self.data           = data

   @property
   def container(self): return pyOrNewObject(Container, self.impl.container)
   @container.setter
   def container(self, value): self.impl.container = value

   @property
   def pointer(self): return self.impl.pointer
   @pointer.setter
   def pointer(self, value):
      if not isinstance(value, IteratorPointer): value = IteratorPointer(value)
      self.impl.pointer = value

   @property
   def data(self): value = lib.Iterator_get_data(self.impl); return pyOrNewObject(Instance, lib.oTAInstance(value))
   @data.setter
   def data(self, value):
      lib.Iterator_set_data(self.impl, TA(value))

   def find(self, value):
      lib.Iterator_find(ffi.cast("Iterator *", self.impl), TA(value))

   def free(self):
      lib.Iterator_free(ffi.cast("Iterator *", self.impl))

   def getData(self):
      lib.Iterator_getData(ffi.cast("Iterator *", self.impl))

   def index(self, index, create):
      lib.Iterator_index(ffi.cast("Iterator *", self.impl), TA(index), create)

   def next(self):
      lib.Iterator_next(ffi.cast("Iterator *", self.impl))

   def prev(self):
      lib.Iterator_prev(ffi.cast("Iterator *", self.impl))

   def remove(self):
      lib.Iterator_remove(ffi.cast("Iterator *", self.impl))

   def setData(self, value):
      lib.Iterator_setData(ffi.cast("Iterator *", self.impl), TA(value))

@ffi.callback("void(IOChannel, void *, uint)")
def cb_IOChannel_readData(__i, data, numBytes):
   iochannel = pyOrNewObject(IOChannel, __i)
   iochannel.fn_IOChannel_readData(iochannel, data, numBytes)

@ffi.callback("void(IOChannel, const void *, uint)")
def cb_IOChannel_writeData(__i, data, numBytes):
   iochannel = pyOrNewObject(IOChannel, __i)
   iochannel.fn_IOChannel_writeData(iochannel, data, numBytes)

class IOChannel(Instance):
   def __init__(self,
                readData = None,
                writeData = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if readData is not None:  self.readData = readData
      if writeData is not None: self.writeData = writeData

   def get(self, data):
      lib.IOChannel_get(self.impl, data)

   def put(self, data):
      lib.IOChannel_put(self.impl, data)

   def fn_unset_IOChannel_readData(self, data, numBytes):
      return lib.IOChannel_readData(self.impl, data, numBytes)

   @property
   def readData(self):
      if hasattr(self, 'fn_IOChannel_readData'): return self.fn_IOChannel_readData
      else: return self.fn_unset_IOChannel_readData
   @readData.setter
   def readData(self, value):
      self.fn_IOChannel_readData = value
      lib.Instance_setMethod(self.impl, "ReadData".encode('utf8'), cb_IOChannel_readData)

   def serialize(self, data):
      lib.IOChannel_serialize(self.impl, data)

   def unserialize(self, data):
      lib.IOChannel_unserialize(self.impl, data)

   def fn_unset_IOChannel_writeData(self, data, numBytes):
      return lib.IOChannel_writeData(self.impl, data, numBytes)

   @property
   def writeData(self):
      if hasattr(self, 'fn_IOChannel_writeData'): return self.fn_IOChannel_writeData
      else: return self.fn_unset_IOChannel_writeData
   @writeData.setter
   def writeData(self, value):
      self.fn_IOChannel_writeData = value
      lib.Instance_setMethod(self.impl, "WriteData".encode('utf8'), cb_IOChannel_writeData)

class CustomAVLTree(Container):
   def __init__(self, templateParams = None,
                copySrc = None,
                root = None,
                count = None,
                add = None,
                copy = None,
                delete = None,
                find = None,
                free = None,
                freeIterator = None,
                getAtPosition = None,
                getCount = None,
                getData = None,
                getFirst = None,
                getLast = None,
                getNext = None,
                getPrev = None,
                insert = None,
                move = None,
                remove = None,
                removeAll = None,
                setData = None,
                sort = None,
                impl = None):
      Container.__init__(self, templateParams, impl = impl)
      if copySrc is not None:       self.copySrc = copySrc
      if root is not None:          self.root = root
      if count is not None:         self.count = count
      if add is not None:           self.add = add
      if copy is not None:          self.copy = copy
      if delete is not None:        self.delete = delete
      if find is not None:          self.find = find
      if free is not None:          self.free = free
      if freeIterator is not None:  self.freeIterator = freeIterator
      if getAtPosition is not None: self.getAtPosition = getAtPosition
      if getCount is not None:      self.getCount = getCount
      if getData is not None:       self.getData = getData
      if getFirst is not None:      self.getFirst = getFirst
      if getLast is not None:       self.getLast = getLast
      if getNext is not None:       self.getNext = getNext
      if getPrev is not None:       self.getPrev = getPrev
      if insert is not None:        self.insert = insert
      if move is not None:          self.move = move
      if remove is not None:        self.remove = remove
      if removeAll is not None:     self.removeAll = removeAll
      if setData is not None:       self.setData = setData
      if sort is not None:          self.sort = sort

   @property
   def root(self): return IPTR(lib, ffi, self, CustomAVLTree).root
   @root.setter
   def root(self, value): IPTR(lib, ffi, self, CustomAVLTree).root = value

   @property
   def count(self): return IPTR(lib, ffi, self, CustomAVLTree).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, CustomAVLTree).count = value

   def freeKey(self, item):
      lib.CustomAVLTree_freeKey(self.impl, AVLNode)

class AVLNode(IteratorPointer):
   def __init__(self, key = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("AVLNode *", lib.Instance_new(lib.class_AVLNode))
         if key is not None: self.key = key

   @property
   def key(self): return self.impl.key
   @key.setter
   def key(self, value): self.impl.key = value

#    @property
#    def prev(self): 

#    @property
#    def next(self): 

#    @property
#    def minimum(self): 

#    @property
#    def maximum(self): 

   @property
   def count(self): return lib.AVLNode_get_count(self.impl)

   @property
   def depthProp(self): return lib.AVLNode_get_depthProp(self.impl)

   def find(self, Tclass, key):
      if Tclass is not None and not isinstance(Tclass, Class): Tclass = Class(Tclass)
      if Tclass is None: Tclass = ffi.NULL
      return lib.AVLNode_find(self.impl, Tclass, TA(key))

class AVLTree(CustomAVLTree):
   def __init__(self, templateParams = None,
                copySrc = None,
                root = None,
                count = None,
                add = None,
                copy = None,
                delete = None,
                find = None,
                free = None,
                freeIterator = None,
                getAtPosition = None,
                getCount = None,
                getData = None,
                getFirst = None,
                getLast = None,
                getNext = None,
                getPrev = None,
                insert = None,
                move = None,
                remove = None,
                removeAll = None,
                setData = None,
                sort = None,
                impl = None):
      CustomAVLTree.__init__(self, templateParams, impl = impl)
      if copySrc is not None:       self.copySrc = copySrc
      if root is not None:          self.root = root
      if count is not None:         self.count = count
      if add is not None:           self.add = add
      if copy is not None:          self.copy = copy
      if delete is not None:        self.delete = delete
      if find is not None:          self.find = find
      if free is not None:          self.free = free
      if freeIterator is not None:  self.freeIterator = freeIterator
      if getAtPosition is not None: self.getAtPosition = getAtPosition
      if getCount is not None:      self.getCount = getCount
      if getData is not None:       self.getData = getData
      if getFirst is not None:      self.getFirst = getFirst
      if getLast is not None:       self.getLast = getLast
      if getNext is not None:       self.getNext = getNext
      if getPrev is not None:       self.getPrev = getPrev
      if insert is not None:        self.insert = insert
      if move is not None:          self.move = move
      if remove is not None:        self.remove = remove
      if removeAll is not None:     self.removeAll = removeAll
      if setData is not None:       self.setData = setData
      if sort is not None:          self.sort = sort

   @property
   def root(self): return IPTR(lib, ffi, self, AVLTree).root
   @root.setter
   def root(self, value): IPTR(lib, ffi, self, AVLTree).root = value

   @property
   def count(self): return IPTR(lib, ffi, self, AVLTree).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, AVLTree).count = value

class AccessMode:
   defaultAccess    = lib.AccessMode_defaultAccess
   publicAccess     = lib.AccessMode_publicAccess
   privateAccess    = lib.AccessMode_privateAccess
   staticAccess     = lib.AccessMode_staticAccess
   baseSystemAccess = lib.AccessMode_baseSystemAccess

class Angle(pyBaseClass):
   def __init__(self, impl = 0):
      self.impl = impl

Angle.buc = Angle

@ffi.callback("void(Application)")
def cb_Application_main(__a):
   application = pyOrNewObject(Application, __a)
   application.fn_Application_main(application)

class Application(Module):
   # hack: hardcoded content
   appGlobals = []
   def __init__(self, appGlobals = None):
      global app
      app = self
      if appGlobals is not None:
         self.appGlobals.append(appGlobals)
      else:
         self.appGlobals.append(globals())
      self.impl = lib.eC_init(True, True, len(sys.argv), [ffi.new("char[]", i.encode('utf8')) for i in sys.argv])
      self.registerClass(Instance, True)
      self.registerClass(Module, True)
      self.registerClass(Application, True)

   @property
   def lib(self): return self.appGlobals[-1].get("lib", None)
   @property
   def ffi(self): return self.appGlobals[-1].get("ffi", None)
   # hack: end of hardcoded content

   @property
   def application(self): return Application(impl = IPTR(lib, ffi, self, Application).application)
   @application.setter
   def application(self, value):
      if not isinstance(value, Application): value = Application(value)
      IPTR(lib, ffi, self, Application).application = value.impl

   @property
   def classes(self): return OldList(impl = IPTR(lib, ffi, self, Application).classes)
   @classes.setter
   def classes(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Application).classes = value.impl

   @property
   def defines(self): return OldList(impl = IPTR(lib, ffi, self, Application).defines)
   @defines.setter
   def defines(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Application).defines = value.impl

   @property
   def functions(self): return OldList(impl = IPTR(lib, ffi, self, Application).functions)
   @functions.setter
   def functions(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Application).functions = value.impl

   @property
   def modules(self): return OldList(impl = IPTR(lib, ffi, self, Application).modules)
   @modules.setter
   def modules(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Application).modules = value.impl

   @property
   def prev(self): return Module(impl = IPTR(lib, ffi, self, Application).prev)
   @prev.setter
   def prev(self, value):
      if not isinstance(value, Module): value = Module(value)
      IPTR(lib, ffi, self, Application).prev = value.impl

   @property
   def next(self): return Module(impl = IPTR(lib, ffi, self, Application).next)
   @next.setter
   def next(self, value):
      if not isinstance(value, Module): value = Module(value)
      IPTR(lib, ffi, self, Application).next = value.impl

   @property
   def name(self): return IPTR(lib, ffi, self, Application).name
   @name.setter
   def name(self, value): IPTR(lib, ffi, self, Application).name = value

   @property
   def library(self): return IPTR(lib, ffi, self, Application).library
   @library.setter
   def library(self, value): IPTR(lib, ffi, self, Application).library = value

   @property
   def Unload(self): return IPTR(lib, ffi, self, Application).Unload
   @Unload.setter
   def Unload(self, value): IPTR(lib, ffi, self, Application).Unload = value

   @property
   def importType(self): return ImportType(impl = IPTR(lib, ffi, self, Application).importType)
   @importType.setter
   def importType(self, value): IPTR(lib, ffi, self, Application).importType = value.impl

   @property
   def origImportType(self): return ImportType(impl = IPTR(lib, ffi, self, Application).origImportType)
   @origImportType.setter
   def origImportType(self, value): IPTR(lib, ffi, self, Application).origImportType = value.impl

   @property
   def privateNameSpace(self): return NameSpace(impl = IPTR(lib, ffi, self, Application).privateNameSpace)
   @privateNameSpace.setter
   def privateNameSpace(self, value):
      if not isinstance(value, NameSpace): value = NameSpace(value)
      IPTR(lib, ffi, self, Application).privateNameSpace = value.impl

   @property
   def publicNameSpace(self): return NameSpace(impl = IPTR(lib, ffi, self, Application).publicNameSpace)
   @publicNameSpace.setter
   def publicNameSpace(self, value):
      if not isinstance(value, NameSpace): value = NameSpace(value)
      IPTR(lib, ffi, self, Application).publicNameSpace = value.impl

   @property
   def argc(self): return IPTR(lib, ffi, self, Application).argc
   @argc.setter
   def argc(self, value): IPTR(lib, ffi, self, Application).argc = value

   @property
   def argv(self): return IPTR(lib, ffi, self, Application).argv
   @argv.setter
   def argv(self, value): IPTR(lib, ffi, self, Application).argv = value

   @property
   def exitCode(self): return IPTR(lib, ffi, self, Application).exitCode
   @exitCode.setter
   def exitCode(self, value): IPTR(lib, ffi, self, Application).exitCode = value

   @property
   def isGUIApp(self): return IPTR(lib, ffi, self, Application).isGUIApp
   @isGUIApp.setter
   def isGUIApp(self, value): IPTR(lib, ffi, self, Application).isGUIApp = value

   @property
   def allModules(self): return OldList(impl = IPTR(lib, ffi, self, Application).allModules)
   @allModules.setter
   def allModules(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, Application).allModules = value.impl

   @property
   def parsedCommand(self): return IPTR(lib, ffi, self, Application).parsedCommand
   @parsedCommand.setter
   def parsedCommand(self, value): IPTR(lib, ffi, self, Application).parsedCommand = value

   @property
   def systemNameSpace(self): return NameSpace(impl = IPTR(lib, ffi, self, Application).systemNameSpace)
   @systemNameSpace.setter
   def systemNameSpace(self, value):
      if not isinstance(value, NameSpace): value = NameSpace(value)
      IPTR(lib, ffi, self, Application).systemNameSpace = value.impl

   def fn_unset_Application_main(self):
      return lib.Application_main(self.impl)

   @property
   def main(self):
      if hasattr(self, 'fn_Application_main'): return self.fn_Application_main
      else: return self.fn_unset_Application_main
   @main.setter
   def main(self, value):
      self.fn_Application_main = value
      lib.Instance_setMethod(self.impl, "Main".encode('utf8'), cb_Application_main)

class Array(Container):
   # hack: hardcoded content
   def __init__(self, templateParams = None, copySrc = None, impl = None):
      Container.__init__(self, templateParams, copySrc, impl=impl)
   # hack: end of hardcoded content

   @property
   def array(self): return IPTR(lib, ffi, self, Array).array
   @array.setter
   def array(self, value): IPTR(lib, ffi, self, Array).array = value

   @property
   def count(self): return IPTR(lib, ffi, self, Array).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, Array).count = value

   @property
   def minAllocSize(self): return IPTR(lib, ffi, self, Array).minAllocSize
   @minAllocSize.setter
   def minAllocSize(self, value): IPTR(lib, ffi, self, Array).minAllocSize = value

   @property
   def size(self): return lib.Array_get_size(self.impl)
   @size.setter
   def size(self, value):
      lib.Array_set_size(self.impl, value)

class BTNamedLink:
   def __init__(self, name = None, parent = None, left = None, right = None, depth = None, data = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("BTNamedLink *", lib.Instance_new(lib.class_BTNamedLink))
         if name is not None:   self.name   = name
         if parent is not None: self.parent = parent
         if left is not None:   self.left   = left
         if right is not None:  self.right  = right
         if depth is not None:  self.depth  = depth
         if data is not None:   self.data   = data

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value):
      if not isinstance(value, BTNamedLink): value = BTNamedLink(value)
      self.impl.parent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value):
      if not isinstance(value, BTNamedLink): value = BTNamedLink(value)
      self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value):
      if not isinstance(value, BTNamedLink): value = BTNamedLink(value)
      self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

class BitMember:
   def __init__(self, prev = None, next = None, name = None, isProperty = None, memberAccess = None, id = None, _class = None, dataTypeString = None, dataTypeClass = None, dataType = None, type = None, size = None, pos = None, mask = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("BitMember *", lib.Instance_new(lib.class_BitMember))
         if prev is not None:           self.prev           = prev
         if next is not None:           self.next           = next
         if name is not None:           self.name           = name
         if isProperty is not None:     self.isProperty     = isProperty
         if memberAccess is not None:   self.memberAccess   = memberAccess
         if id is not None:             self.id             = id
         if _class is not None:         self._class         = _class
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if dataTypeClass is not None:  self.dataTypeClass  = dataTypeClass
         if dataType is not None:       self.dataType       = dataType
         if type is not None:           self.type           = type
         if size is not None:           self.size           = size
         if pos is not None:            self.pos            = pos
         if mask is not None:           self.mask           = mask

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, BitMember): value = BitMember(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, BitMember): value = BitMember(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def isProperty(self): return self.impl.isProperty
   @isProperty.setter
   def isProperty(self, value): self.impl.isProperty = value

   @property
   def memberAccess(self): return self.impl.memberAccess
   @memberAccess.setter
   def memberAccess(self, value): self.impl.memberAccess = value

   @property
   def id(self): return self.impl.id
   @id.setter
   def id(self, value): self.impl.id = value

   @property
   def _class(self): return self.impl._class
   @_class.setter
   def _class(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl._class = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataTypeClass(self): return self.impl.dataTypeClass
   @dataTypeClass.setter
   def dataTypeClass(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.dataTypeClass = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value): self.impl.type = value

   @property
   def size(self): return self.impl.size
   @size.setter
   def size(self, value): self.impl.size = value

   @property
   def pos(self): return self.impl.pos
   @pos.setter
   def pos(self, value): self.impl.pos = value

   @property
   def mask(self): return self.impl.mask
   @mask.setter
   def mask(self, value): self.impl.mask = value

@ffi.callback("void(BuiltInContainer, uint64)")
def cb_BuiltInContainer_add(__b, value):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_add(builtincontainer, value)

@ffi.callback("void(BuiltInContainer, Container)")
def cb_BuiltInContainer_copy(__b, source):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_copy(builtincontainer, pyOrNewObject(Container, source))

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_delete(__b, it):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_delete(builtincontainer, IteratorPointer(impl = it))

@ffi.callback("void(BuiltInContainer, uint64)")
def cb_BuiltInContainer_find(__b, value):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_find(builtincontainer, value)

@ffi.callback("void(BuiltInContainer)")
def cb_BuiltInContainer_free(__b):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_free(builtincontainer)

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_freeIterator(__b, it):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_freeIterator(builtincontainer, IteratorPointer(impl = it))

@ffi.callback("void(BuiltInContainer, const uint64, bool)")
def cb_BuiltInContainer_getAtPosition(__b, pos, create):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getAtPosition(builtincontainer, pos, create)

@ffi.callback("void(BuiltInContainer)")
def cb_BuiltInContainer_getCount(__b):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getCount(builtincontainer)

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_getData(__b, pointer):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getData(builtincontainer, IteratorPointer(impl = pointer))

@ffi.callback("void(BuiltInContainer)")
def cb_BuiltInContainer_getFirst(__b):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getFirst(builtincontainer)

@ffi.callback("void(BuiltInContainer)")
def cb_BuiltInContainer_getLast(__b):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getLast(builtincontainer)

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_getNext(__b, pointer):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getNext(builtincontainer, IteratorPointer(impl = pointer))

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_getPrev(__b, pointer):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_getPrev(builtincontainer, IteratorPointer(impl = pointer))

@ffi.callback("void(BuiltInContainer, IteratorPointer *, uint64)")
def cb_BuiltInContainer_insert(__b, after, value):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_insert(builtincontainer, IteratorPointer(impl = after), value)

@ffi.callback("void(BuiltInContainer, IteratorPointer *, IteratorPointer *)")
def cb_BuiltInContainer_move(__b, it, after):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_move(builtincontainer, IteratorPointer(impl = it), IteratorPointer(impl = after))

@ffi.callback("void(BuiltInContainer, IteratorPointer *)")
def cb_BuiltInContainer_remove(__b, it):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_remove(builtincontainer, IteratorPointer(impl = it))

@ffi.callback("void(BuiltInContainer)")
def cb_BuiltInContainer_removeAll(__b):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_removeAll(builtincontainer)

@ffi.callback("void(BuiltInContainer, IteratorPointer *, uint64)")
def cb_BuiltInContainer_setData(__b, pointer, data):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_setData(builtincontainer, IteratorPointer(impl = pointer), data)

@ffi.callback("void(BuiltInContainer, bool)")
def cb_BuiltInContainer_sort(__b, ascending):
   builtincontainer = pyOrNewObject(BuiltInContainer, __b)
   builtincontainer.fn_BuiltInContainer_sort(builtincontainer, ascending)

class BuiltInContainer:
   def __init__(self, _vTbl = None, _class = None, _refCount = 0, data = None, count = 0, type = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("BuiltInContainer *", impl)
      else:
         if isinstance(_vTbl, Container):
            self.impl = ffi.new("BuiltInContainer *")
            lib.BuiltInContainer_from_Container(self.impl, _vTbl)
            return
         if _class is not None:
            if not isinstance(_class, Class): _class = Class(_class)
            _class = _class.impl
         if type is not None:
            if not isinstance(type, Class): type = Class(type)
            type = type.impl
         self.impl = ffi.new("BuiltInContainer *", { '_vTbl' : _vTbl, '_class' : _class, '_refCount' : _refCount, 'data' : data, 'count' : count, 'type' : type })

   @property
   def _vTbl(self): return self.impl._vTbl
   @_vTbl.setter
   def _vTbl(self, value): self.impl._vTbl = value

   @property
   def _class(self): return self.impl._class
   @_class.setter
   def _class(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl._class = value

   @property
   def _refCount(self): return self.impl._refCount
   @_refCount.setter
   def _refCount(self, value): self.impl._refCount = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.type = value

   # here is a conversion
   # BuiltInContainer_to_Container
   # BuiltInContainer_from_Container

   def fn_unset_BuiltInContainer_add(self, value):
      return lib.BuiltInContainer_add(self.impl, value)

   @property
   def add(self):
      if hasattr(self, 'fn_BuiltInContainer_add'): return self.fn_BuiltInContainer_add
      else: return self.fn_unset_BuiltInContainer_add
   @add.setter
   def add(self, value):
      self.fn_BuiltInContainer_add = value
      lib.Instance_setMethod(self.impl, "Add".encode('utf8'), cb_BuiltInContainer_add)

   def fn_unset_BuiltInContainer_copy(self, source):
      return lib.BuiltInContainer_copy(self.impl, ffi.NULL if source is None else source.impl)

   @property
   def copy(self):
      if hasattr(self, 'fn_BuiltInContainer_copy'): return self.fn_BuiltInContainer_copy
      else: return self.fn_unset_BuiltInContainer_copy
   @copy.setter
   def copy(self, value):
      self.fn_BuiltInContainer_copy = value
      lib.Instance_setMethod(self.impl, "Copy".encode('utf8'), cb_BuiltInContainer_copy)

   def fn_unset_BuiltInContainer_delete(self, it):
      return lib.BuiltInContainer_delete(self.impl, it)

   @property
   def delete(self):
      if hasattr(self, 'fn_BuiltInContainer_delete'): return self.fn_BuiltInContainer_delete
      else: return self.fn_unset_BuiltInContainer_delete
   @delete.setter
   def delete(self, value):
      self.fn_BuiltInContainer_delete = value
      lib.Instance_setMethod(self.impl, "Delete".encode('utf8'), cb_BuiltInContainer_delete)

   def fn_unset_BuiltInContainer_find(self, value):
      return lib.BuiltInContainer_find(self.impl, value)

   @property
   def find(self):
      if hasattr(self, 'fn_BuiltInContainer_find'): return self.fn_BuiltInContainer_find
      else: return self.fn_unset_BuiltInContainer_find
   @find.setter
   def find(self, value):
      self.fn_BuiltInContainer_find = value
      lib.Instance_setMethod(self.impl, "Find".encode('utf8'), cb_BuiltInContainer_find)

   def fn_unset_BuiltInContainer_free(self):
      return lib.BuiltInContainer_free(self.impl)

   @property
   def free(self):
      if hasattr(self, 'fn_BuiltInContainer_free'): return self.fn_BuiltInContainer_free
      else: return self.fn_unset_BuiltInContainer_free
   @free.setter
   def free(self, value):
      self.fn_BuiltInContainer_free = value
      lib.Instance_setMethod(self.impl, "Free".encode('utf8'), cb_BuiltInContainer_free)

   def fn_unset_BuiltInContainer_freeIterator(self, it):
      return lib.BuiltInContainer_freeIterator(self.impl, it)

   @property
   def freeIterator(self):
      if hasattr(self, 'fn_BuiltInContainer_freeIterator'): return self.fn_BuiltInContainer_freeIterator
      else: return self.fn_unset_BuiltInContainer_freeIterator
   @freeIterator.setter
   def freeIterator(self, value):
      self.fn_BuiltInContainer_freeIterator = value
      lib.Instance_setMethod(self.impl, "FreeIterator".encode('utf8'), cb_BuiltInContainer_freeIterator)

   def fn_unset_BuiltInContainer_getAtPosition(self, pos, create):
      return lib.BuiltInContainer_getAtPosition(self.impl, pos, create)

   @property
   def getAtPosition(self):
      if hasattr(self, 'fn_BuiltInContainer_getAtPosition'): return self.fn_BuiltInContainer_getAtPosition
      else: return self.fn_unset_BuiltInContainer_getAtPosition
   @getAtPosition.setter
   def getAtPosition(self, value):
      self.fn_BuiltInContainer_getAtPosition = value
      lib.Instance_setMethod(self.impl, "GetAtPosition".encode('utf8'), cb_BuiltInContainer_getAtPosition)

   def fn_unset_BuiltInContainer_getCount(self):
      return lib.BuiltInContainer_getCount(self.impl)

   @property
   def getCount(self):
      if hasattr(self, 'fn_BuiltInContainer_getCount'): return self.fn_BuiltInContainer_getCount
      else: return self.fn_unset_BuiltInContainer_getCount
   @getCount.setter
   def getCount(self, value):
      self.fn_BuiltInContainer_getCount = value
      lib.Instance_setMethod(self.impl, "GetCount".encode('utf8'), cb_BuiltInContainer_getCount)

   def fn_unset_BuiltInContainer_getData(self, pointer):
      return lib.BuiltInContainer_getData(self.impl, pointer)

   @property
   def getData(self):
      if hasattr(self, 'fn_BuiltInContainer_getData'): return self.fn_BuiltInContainer_getData
      else: return self.fn_unset_BuiltInContainer_getData
   @getData.setter
   def getData(self, value):
      self.fn_BuiltInContainer_getData = value
      lib.Instance_setMethod(self.impl, "GetData".encode('utf8'), cb_BuiltInContainer_getData)

   def fn_unset_BuiltInContainer_getFirst(self):
      return lib.BuiltInContainer_getFirst(self.impl)

   @property
   def getFirst(self):
      if hasattr(self, 'fn_BuiltInContainer_getFirst'): return self.fn_BuiltInContainer_getFirst
      else: return self.fn_unset_BuiltInContainer_getFirst
   @getFirst.setter
   def getFirst(self, value):
      self.fn_BuiltInContainer_getFirst = value
      lib.Instance_setMethod(self.impl, "GetFirst".encode('utf8'), cb_BuiltInContainer_getFirst)

   def fn_unset_BuiltInContainer_getLast(self):
      return lib.BuiltInContainer_getLast(self.impl)

   @property
   def getLast(self):
      if hasattr(self, 'fn_BuiltInContainer_getLast'): return self.fn_BuiltInContainer_getLast
      else: return self.fn_unset_BuiltInContainer_getLast
   @getLast.setter
   def getLast(self, value):
      self.fn_BuiltInContainer_getLast = value
      lib.Instance_setMethod(self.impl, "GetLast".encode('utf8'), cb_BuiltInContainer_getLast)

   def fn_unset_BuiltInContainer_getNext(self, pointer):
      return lib.BuiltInContainer_getNext(self.impl, pointer)

   @property
   def getNext(self):
      if hasattr(self, 'fn_BuiltInContainer_getNext'): return self.fn_BuiltInContainer_getNext
      else: return self.fn_unset_BuiltInContainer_getNext
   @getNext.setter
   def getNext(self, value):
      self.fn_BuiltInContainer_getNext = value
      lib.Instance_setMethod(self.impl, "GetNext".encode('utf8'), cb_BuiltInContainer_getNext)

   def fn_unset_BuiltInContainer_getPrev(self, pointer):
      return lib.BuiltInContainer_getPrev(self.impl, pointer)

   @property
   def getPrev(self):
      if hasattr(self, 'fn_BuiltInContainer_getPrev'): return self.fn_BuiltInContainer_getPrev
      else: return self.fn_unset_BuiltInContainer_getPrev
   @getPrev.setter
   def getPrev(self, value):
      self.fn_BuiltInContainer_getPrev = value
      lib.Instance_setMethod(self.impl, "GetPrev".encode('utf8'), cb_BuiltInContainer_getPrev)

   def fn_unset_BuiltInContainer_insert(self, after, value):
      return lib.BuiltInContainer_insert(self.impl, after, value)

   @property
   def insert(self):
      if hasattr(self, 'fn_BuiltInContainer_insert'): return self.fn_BuiltInContainer_insert
      else: return self.fn_unset_BuiltInContainer_insert
   @insert.setter
   def insert(self, value):
      self.fn_BuiltInContainer_insert = value
      lib.Instance_setMethod(self.impl, "Insert".encode('utf8'), cb_BuiltInContainer_insert)

   def fn_unset_BuiltInContainer_move(self, it, after):
      return lib.BuiltInContainer_move(self.impl, it, after)

   @property
   def move(self):
      if hasattr(self, 'fn_BuiltInContainer_move'): return self.fn_BuiltInContainer_move
      else: return self.fn_unset_BuiltInContainer_move
   @move.setter
   def move(self, value):
      self.fn_BuiltInContainer_move = value
      lib.Instance_setMethod(self.impl, "Move".encode('utf8'), cb_BuiltInContainer_move)

   def fn_unset_BuiltInContainer_remove(self, it):
      return lib.BuiltInContainer_remove(self.impl, it)

   @property
   def remove(self):
      if hasattr(self, 'fn_BuiltInContainer_remove'): return self.fn_BuiltInContainer_remove
      else: return self.fn_unset_BuiltInContainer_remove
   @remove.setter
   def remove(self, value):
      self.fn_BuiltInContainer_remove = value
      lib.Instance_setMethod(self.impl, "Remove".encode('utf8'), cb_BuiltInContainer_remove)

   def fn_unset_BuiltInContainer_removeAll(self):
      return lib.BuiltInContainer_removeAll(self.impl)

   @property
   def removeAll(self):
      if hasattr(self, 'fn_BuiltInContainer_removeAll'): return self.fn_BuiltInContainer_removeAll
      else: return self.fn_unset_BuiltInContainer_removeAll
   @removeAll.setter
   def removeAll(self, value):
      self.fn_BuiltInContainer_removeAll = value
      lib.Instance_setMethod(self.impl, "RemoveAll".encode('utf8'), cb_BuiltInContainer_removeAll)

   def fn_unset_BuiltInContainer_setData(self, pointer, data):
      return lib.BuiltInContainer_setData(self.impl, pointer, data)

   @property
   def setData(self):
      if hasattr(self, 'fn_BuiltInContainer_setData'): return self.fn_BuiltInContainer_setData
      else: return self.fn_unset_BuiltInContainer_setData
   @setData.setter
   def setData(self, value):
      self.fn_BuiltInContainer_setData = value
      lib.Instance_setMethod(self.impl, "SetData".encode('utf8'), cb_BuiltInContainer_setData)

   def fn_unset_BuiltInContainer_sort(self, ascending):
      return lib.BuiltInContainer_sort(self.impl, ascending)

   @property
   def sort(self):
      if hasattr(self, 'fn_BuiltInContainer_sort'): return self.fn_BuiltInContainer_sort
      else: return self.fn_unset_BuiltInContainer_sort
   @sort.setter
   def sort(self, value):
      self.fn_BuiltInContainer_sort = value
      lib.Instance_setMethod(self.impl, "Sort".encode('utf8'), cb_BuiltInContainer_sort)

class CIString(String):
   def __init__(self,
                impl = None):
      String.__init__(self, impl = impl)

class Class:
   def __init__(self,
                prev = None,
                next = None,
                name = None,
                offset = None,
                structSize = None,
                _vTbl = None,
                vTblSize = None,
                Constructor = None,
                Destructor = None,
                offsetClass = None,
                sizeClass = None,
                base = None,
                methods = None,
                members = None,
                prop = None,
                membersAndProperties = None,
                classProperties = None,
                derivatives = None,
                memberID = None,
                startMemberID = None,
                type = None,
                module = None,
                nameSpace = None,
                dataTypeString = None,
                dataType = None,
                typeSize = None,
                defaultAlignment = None,
                Initialize = None,
                memberOffset = None,
                selfWatchers = None,
                designerClass = None,
                noExpansion = None,
                defaultProperty = None,
                comRedefinition = None,
                count = None,
                isRemote = None,
                internalDecl = None,
                data = None,
                computeSize = None,
                structAlignment = None,
                pointerAlignment = None,
                destructionWatchOffset = None,
                fixed = None,
                delayedCPValues = None,
                inheritanceAccess = None,
                fullName = None,
                symbol = None,
                conversions = None,
                templateParams = None,
                templateArgs = None,
                templateClass = None,
                templatized = None,
                numParams = None,
                isInstanceClass = None,
                byValueSystemClass = None,
                bindingsClass = None,
                impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Class *", lib.Instance_new(lib.class_Class))
         if prev is not None:                   self.prev                   = prev
         if next is not None:                   self.next                   = next
         if name is not None:                   self.name                   = name
         if offset is not None:                 self.offset                 = offset
         if structSize is not None:             self.structSize             = structSize
         if _vTbl is not None:                  self._vTbl                  = _vTbl
         if vTblSize is not None:               self.vTblSize               = vTblSize
         if Constructor is not None:            self.Constructor            = Constructor
         if Destructor is not None:             self.Destructor             = Destructor
         if offsetClass is not None:            self.offsetClass            = offsetClass
         if sizeClass is not None:              self.sizeClass              = sizeClass
         if base is not None:                   self.base                   = base
         if methods is not None:                self.methods                = methods
         if members is not None:                self.members                = members
         if prop is not None:                   self.prop                   = prop
         if membersAndProperties is not None:   self.membersAndProperties   = membersAndProperties
         if classProperties is not None:        self.classProperties        = classProperties
         if derivatives is not None:            self.derivatives            = derivatives
         if memberID is not None:               self.memberID               = memberID
         if startMemberID is not None:          self.startMemberID          = startMemberID
         if type is not None:                   self.type                   = type
         if module is not None:                 self.module                 = module
         if nameSpace is not None:              self.nameSpace              = nameSpace
         if dataTypeString is not None:         self.dataTypeString         = dataTypeString
         if dataType is not None:               self.dataType               = dataType
         if typeSize is not None:               self.typeSize               = typeSize
         if defaultAlignment is not None:       self.defaultAlignment       = defaultAlignment
         if Initialize is not None:             self.Initialize             = Initialize
         if memberOffset is not None:           self.memberOffset           = memberOffset
         if selfWatchers is not None:           self.selfWatchers           = selfWatchers
         if designerClass is not None:          self.designerClass          = designerClass
         if noExpansion is not None:            self.noExpansion            = noExpansion
         if defaultProperty is not None:        self.defaultProperty        = defaultProperty
         if comRedefinition is not None:        self.comRedefinition        = comRedefinition
         if count is not None:                  self.count                  = count
         if isRemote is not None:               self.isRemote               = isRemote
         if internalDecl is not None:           self.internalDecl           = internalDecl
         if data is not None:                   self.data                   = data
         if computeSize is not None:            self.computeSize            = computeSize
         if structAlignment is not None:        self.structAlignment        = structAlignment
         if pointerAlignment is not None:       self.pointerAlignment       = pointerAlignment
         if destructionWatchOffset is not None: self.destructionWatchOffset = destructionWatchOffset
         if fixed is not None:                  self.fixed                  = fixed
         if delayedCPValues is not None:        self.delayedCPValues        = delayedCPValues
         if inheritanceAccess is not None:      self.inheritanceAccess      = inheritanceAccess
         if fullName is not None:               self.fullName               = fullName
         if symbol is not None:                 self.symbol                 = symbol
         if conversions is not None:            self.conversions            = conversions
         if templateParams is not None:         self.templateParams         = templateParams
         if templateArgs is not None:           self.templateArgs           = templateArgs
         if templateClass is not None:          self.templateClass          = templateClass
         if templatized is not None:            self.templatized            = templatized
         if numParams is not None:              self.numParams              = numParams
         if isInstanceClass is not None:        self.isInstanceClass        = isInstanceClass
         if byValueSystemClass is not None:     self.byValueSystemClass     = byValueSystemClass
         if bindingsClass is not None:          self.bindingsClass          = bindingsClass

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def offset(self): return self.impl.offset
   @offset.setter
   def offset(self, value): self.impl.offset = value

   @property
   def structSize(self): return self.impl.structSize
   @structSize.setter
   def structSize(self, value): self.impl.structSize = value

   @property
   def _vTbl(self): return self.impl._vTbl
   @_vTbl.setter
   def _vTbl(self, value): self.impl._vTbl = value

   @property
   def vTblSize(self): return self.impl.vTblSize
   @vTblSize.setter
   def vTblSize(self, value): self.impl.vTblSize = value

   @property
   def Constructor(self): return self.impl.Constructor
   @Constructor.setter
   def Constructor(self, value): self.impl.Constructor = value

   @property
   def Destructor(self): return self.impl.Destructor
   @Destructor.setter
   def Destructor(self, value): self.impl.Destructor = value

   @property
   def offsetClass(self): return self.impl.offsetClass
   @offsetClass.setter
   def offsetClass(self, value): self.impl.offsetClass = value

   @property
   def sizeClass(self): return self.impl.sizeClass
   @sizeClass.setter
   def sizeClass(self, value): self.impl.sizeClass = value

   @property
   def base(self): return self.impl.base
   @base.setter
   def base(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.base = value

   @property
   def methods(self): return BinaryTree(impl = self.impl.methods)
   @methods.setter
   def methods(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.methods = value.impl[0]

   @property
   def members(self): return BinaryTree(impl = self.impl.members)
   @members.setter
   def members(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.members = value.impl[0]

   @property
   def prop(self): return BinaryTree(impl = self.impl.prop)
   @prop.setter
   def prop(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.prop = value.impl[0]

   @property
   def membersAndProperties(self): return OldList(impl = self.impl.membersAndProperties)
   @membersAndProperties.setter
   def membersAndProperties(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.membersAndProperties = value.impl[0]

   @property
   def classProperties(self): return BinaryTree(impl = self.impl.classProperties)
   @classProperties.setter
   def classProperties(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.classProperties = value.impl[0]

   @property
   def derivatives(self): return OldList(impl = self.impl.derivatives)
   @derivatives.setter
   def derivatives(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.derivatives = value.impl[0]

   @property
   def memberID(self): return self.impl.memberID
   @memberID.setter
   def memberID(self, value): self.impl.memberID = value

   @property
   def startMemberID(self): return self.impl.startMemberID
   @startMemberID.setter
   def startMemberID(self, value): self.impl.startMemberID = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value): self.impl.type = value

   @property
   def module(self): return pyOrNewObject(Module, self.impl.module)
   @module.setter
   def module(self, value):
      if not isinstance(value, Module): value = Module(value)
      self.impl.module = value

   @property
   def nameSpace(self): return self.impl.nameSpace
   @nameSpace.setter
   def nameSpace(self, value): self.impl.nameSpace = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def typeSize(self): return self.impl.typeSize
   @typeSize.setter
   def typeSize(self, value): self.impl.typeSize = value

   @property
   def defaultAlignment(self): return self.impl.defaultAlignment
   @defaultAlignment.setter
   def defaultAlignment(self, value): self.impl.defaultAlignment = value

   @property
   def Initialize(self): return self.impl.Initialize
   @Initialize.setter
   def Initialize(self, value): self.impl.Initialize = value

   @property
   def memberOffset(self): return self.impl.memberOffset
   @memberOffset.setter
   def memberOffset(self, value): self.impl.memberOffset = value

   @property
   def selfWatchers(self): return OldList(impl = self.impl.selfWatchers)
   @selfWatchers.setter
   def selfWatchers(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.selfWatchers = value.impl[0]

   @property
   def designerClass(self): return self.impl.designerClass
   @designerClass.setter
   def designerClass(self, value): self.impl.designerClass = value

   @property
   def noExpansion(self): return self.impl.noExpansion
   @noExpansion.setter
   def noExpansion(self, value): self.impl.noExpansion = value

   @property
   def defaultProperty(self): return self.impl.defaultProperty
   @defaultProperty.setter
   def defaultProperty(self, value): self.impl.defaultProperty = value

   @property
   def comRedefinition(self): return self.impl.comRedefinition
   @comRedefinition.setter
   def comRedefinition(self, value): self.impl.comRedefinition = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def isRemote(self): return self.impl.isRemote
   @isRemote.setter
   def isRemote(self, value): self.impl.isRemote = value

   @property
   def internalDecl(self): return self.impl.internalDecl
   @internalDecl.setter
   def internalDecl(self, value): self.impl.internalDecl = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

   @property
   def computeSize(self): return self.impl.computeSize
   @computeSize.setter
   def computeSize(self, value): self.impl.computeSize = value

   @property
   def structAlignment(self): return self.impl.structAlignment
   @structAlignment.setter
   def structAlignment(self, value): self.impl.structAlignment = value

   @property
   def pointerAlignment(self): return self.impl.pointerAlignment
   @pointerAlignment.setter
   def pointerAlignment(self, value): self.impl.pointerAlignment = value

   @property
   def destructionWatchOffset(self): return self.impl.destructionWatchOffset
   @destructionWatchOffset.setter
   def destructionWatchOffset(self, value): self.impl.destructionWatchOffset = value

   @property
   def fixed(self): return self.impl.fixed
   @fixed.setter
   def fixed(self, value): self.impl.fixed = value

   @property
   def delayedCPValues(self): return OldList(impl = self.impl.delayedCPValues)
   @delayedCPValues.setter
   def delayedCPValues(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.delayedCPValues = value.impl[0]

   @property
   def inheritanceAccess(self): return self.impl.inheritanceAccess
   @inheritanceAccess.setter
   def inheritanceAccess(self, value): self.impl.inheritanceAccess = value

   @property
   def fullName(self): return self.impl.fullName
   @fullName.setter
   def fullName(self, value): self.impl.fullName = value

   @property
   def symbol(self): return self.impl.symbol
   @symbol.setter
   def symbol(self, value): self.impl.symbol = value

   @property
   def conversions(self): return OldList(impl = self.impl.conversions)
   @conversions.setter
   def conversions(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.conversions = value.impl[0]

   @property
   def templateParams(self): return OldList(impl = self.impl.templateParams)
   @templateParams.setter
   def templateParams(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.templateParams = value.impl[0]

   @property
   def templateArgs(self): return self.impl.templateArgs
   @templateArgs.setter
   def templateArgs(self, value): self.impl.templateArgs = value

   @property
   def templateClass(self): return self.impl.templateClass
   @templateClass.setter
   def templateClass(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.templateClass = value

   @property
   def templatized(self): return OldList(impl = self.impl.templatized)
   @templatized.setter
   def templatized(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.templatized = value.impl[0]

   @property
   def numParams(self): return self.impl.numParams
   @numParams.setter
   def numParams(self, value): self.impl.numParams = value

   @property
   def isInstanceClass(self): return self.impl.isInstanceClass
   @isInstanceClass.setter
   def isInstanceClass(self, value): self.impl.isInstanceClass = value

   @property
   def byValueSystemClass(self): return self.impl.byValueSystemClass
   @byValueSystemClass.setter
   def byValueSystemClass(self, value): self.impl.byValueSystemClass = value

   @property
   def bindingsClass(self): return self.impl.bindingsClass
   @bindingsClass.setter
   def bindingsClass(self, value): self.impl.bindingsClass = value

   # here is a conversion
   # Class_to_char_ptr
   # Class_from_char_ptr

@ffi.callback("void(ClassDesignerBase)")
def cb_ClassDesignerBase_addObject(__c):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_addObject(classdesignerbase)

@ffi.callback("void(ClassDesignerBase, EditBox, Size, const char *, const char *)")
def cb_ClassDesignerBase_createNew(__c, editBox, clientSize, name, inherit):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_createNew(classdesignerbase, pyOrNewObject(EditBox, editBox), Size(impl = clientSize), name.encode('utf8'), inherit.encode('utf8'))

@ffi.callback("void(ClassDesignerBase, DesignerBase, Instance, ObjectInfo *, bool, Instance)")
def cb_ClassDesignerBase_createObject(__c, designer, instance, object, isClass, _class):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_createObject(classdesignerbase, pyOrNewObject(DesignerBase, designer), pyOrNewObject(Instance, instance), ObjectInfo(impl = object), isClass, pyOrNewObject(Instance, _class))

@ffi.callback("void(ClassDesignerBase, Instance)")
def cb_ClassDesignerBase_destroyObject(__c, object):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_destroyObject(classdesignerbase, pyOrNewObject(Instance, object))

@ffi.callback("void(ClassDesignerBase, Instance, ObjectInfo *, bool, Instance)")
def cb_ClassDesignerBase_droppedObject(__c, instance, object, isClass, _class):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_droppedObject(classdesignerbase, pyOrNewObject(Instance, instance), ObjectInfo(impl = object), isClass, pyOrNewObject(Instance, _class))

@ffi.callback("void(ClassDesignerBase, Property *, Instance)")
def cb_ClassDesignerBase_fixProperty(__c, prop, object):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_fixProperty(classdesignerbase, Property(impl = prop), pyOrNewObject(Instance, object))

@ffi.callback("void(ClassDesignerBase, DesignerBase)")
def cb_ClassDesignerBase_listToolBoxClasses(__c, designer):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_listToolBoxClasses(classdesignerbase, pyOrNewObject(DesignerBase, designer))

@ffi.callback("void(ClassDesignerBase, Instance, ObjectInfo *, bool, Instance)")
def cb_ClassDesignerBase_postCreateObject(__c, instance, object, isClass, _class):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_postCreateObject(classdesignerbase, pyOrNewObject(Instance, instance), ObjectInfo(impl = object), isClass, pyOrNewObject(Instance, _class))

@ffi.callback("void(ClassDesignerBase, DesignerBase, Instance)")
def cb_ClassDesignerBase_prepareTestObject(__c, designer, test):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_prepareTestObject(classdesignerbase, pyOrNewObject(DesignerBase, designer), pyOrNewObject(Instance, test))

@ffi.callback("void(ClassDesignerBase)")
def cb_ClassDesignerBase_reset(__c):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_reset(classdesignerbase)

@ffi.callback("void(ClassDesignerBase, ObjectInfo *, Instance)")
def cb_ClassDesignerBase_selectObject(__c, object, control):
   classdesignerbase = pyOrNewObject(ClassDesignerBase, __c)
   classdesignerbase.fn_ClassDesignerBase_selectObject(classdesignerbase, ObjectInfo(impl = object), pyOrNewObject(Instance, control))

class ClassDesignerBase(Window):
   def __init__(self,
                addObject = None,
                createNew = None,
                createObject = None,
                destroyObject = None,
                droppedObject = None,
                fixProperty = None,
                listToolBoxClasses = None,
                postCreateObject = None,
                prepareTestObject = None,
                reset = None,
                selectObject = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if addObject is not None:          self.addObject = addObject
      if createNew is not None:          self.createNew = createNew
      if createObject is not None:       self.createObject = createObject
      if destroyObject is not None:      self.destroyObject = destroyObject
      if droppedObject is not None:      self.droppedObject = droppedObject
      if fixProperty is not None:        self.fixProperty = fixProperty
      if listToolBoxClasses is not None: self.listToolBoxClasses = listToolBoxClasses
      if postCreateObject is not None:   self.postCreateObject = postCreateObject
      if prepareTestObject is not None:  self.prepareTestObject = prepareTestObject
      if reset is not None:              self.reset = reset
      if selectObject is not None:       self.selectObject = selectObject

   def fn_unset_ClassDesignerBase_addObject(self):
      return lib.ClassDesignerBase_addObject(self.impl)

   @property
   def addObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_addObject'): return self.fn_ClassDesignerBase_addObject
      else: return self.fn_unset_ClassDesignerBase_addObject
   @addObject.setter
   def addObject(self, value):
      self.fn_ClassDesignerBase_addObject = value
      lib.Instance_setMethod(self.impl, "AddObject".encode('utf8'), cb_ClassDesignerBase_addObject)

   def fn_unset_ClassDesignerBase_createNew(self, editBox, clientSize, name, inherit):
      return lib.ClassDesignerBase_createNew(self.impl, editBox, clientSize, name, inherit)

   @property
   def createNew(self):
      if hasattr(self, 'fn_ClassDesignerBase_createNew'): return self.fn_ClassDesignerBase_createNew
      else: return self.fn_unset_ClassDesignerBase_createNew
   @createNew.setter
   def createNew(self, value):
      self.fn_ClassDesignerBase_createNew = value
      lib.Instance_setMethod(self.impl, "CreateNew".encode('utf8'), cb_ClassDesignerBase_createNew)

   def fn_unset_ClassDesignerBase_createObject(self, designer, instance, object, isClass, _class):
      return lib.ClassDesignerBase_createObject(self.impl, ffi.NULL if designer is None else designer.impl, ffi.NULL if instance is None else instance.impl, ffi.NULL if object is None else object.impl, isClass, ffi.NULL if _class is None else _class.impl)

   @property
   def createObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_createObject'): return self.fn_ClassDesignerBase_createObject
      else: return self.fn_unset_ClassDesignerBase_createObject
   @createObject.setter
   def createObject(self, value):
      self.fn_ClassDesignerBase_createObject = value
      lib.Instance_setMethod(self.impl, "CreateObject".encode('utf8'), cb_ClassDesignerBase_createObject)

   def fn_unset_ClassDesignerBase_destroyObject(self, object):
      return lib.ClassDesignerBase_destroyObject(self.impl, ffi.NULL if object is None else object.impl)

   @property
   def destroyObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_destroyObject'): return self.fn_ClassDesignerBase_destroyObject
      else: return self.fn_unset_ClassDesignerBase_destroyObject
   @destroyObject.setter
   def destroyObject(self, value):
      self.fn_ClassDesignerBase_destroyObject = value
      lib.Instance_setMethod(self.impl, "DestroyObject".encode('utf8'), cb_ClassDesignerBase_destroyObject)

   def fn_unset_ClassDesignerBase_droppedObject(self, instance, object, isClass, _class):
      return lib.ClassDesignerBase_droppedObject(self.impl, ffi.NULL if instance is None else instance.impl, ffi.NULL if object is None else object.impl, isClass, ffi.NULL if _class is None else _class.impl)

   @property
   def droppedObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_droppedObject'): return self.fn_ClassDesignerBase_droppedObject
      else: return self.fn_unset_ClassDesignerBase_droppedObject
   @droppedObject.setter
   def droppedObject(self, value):
      self.fn_ClassDesignerBase_droppedObject = value
      lib.Instance_setMethod(self.impl, "DroppedObject".encode('utf8'), cb_ClassDesignerBase_droppedObject)

   def fn_unset_ClassDesignerBase_fixProperty(self, prop, object):
      return lib.ClassDesignerBase_fixProperty(self.impl, ffi.NULL if prop is None else prop.impl, ffi.NULL if object is None else object.impl)

   @property
   def fixProperty(self):
      if hasattr(self, 'fn_ClassDesignerBase_fixProperty'): return self.fn_ClassDesignerBase_fixProperty
      else: return self.fn_unset_ClassDesignerBase_fixProperty
   @fixProperty.setter
   def fixProperty(self, value):
      self.fn_ClassDesignerBase_fixProperty = value
      lib.Instance_setMethod(self.impl, "FixProperty".encode('utf8'), cb_ClassDesignerBase_fixProperty)

   def fn_unset_ClassDesignerBase_listToolBoxClasses(self, designer):
      return lib.ClassDesignerBase_listToolBoxClasses(self.impl, ffi.NULL if designer is None else designer.impl)

   @property
   def listToolBoxClasses(self):
      if hasattr(self, 'fn_ClassDesignerBase_listToolBoxClasses'): return self.fn_ClassDesignerBase_listToolBoxClasses
      else: return self.fn_unset_ClassDesignerBase_listToolBoxClasses
   @listToolBoxClasses.setter
   def listToolBoxClasses(self, value):
      self.fn_ClassDesignerBase_listToolBoxClasses = value
      lib.Instance_setMethod(self.impl, "ListToolBoxClasses".encode('utf8'), cb_ClassDesignerBase_listToolBoxClasses)

   def fn_unset_ClassDesignerBase_postCreateObject(self, instance, object, isClass, _class):
      return lib.ClassDesignerBase_postCreateObject(self.impl, ffi.NULL if instance is None else instance.impl, ffi.NULL if object is None else object.impl, isClass, ffi.NULL if _class is None else _class.impl)

   @property
   def postCreateObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_postCreateObject'): return self.fn_ClassDesignerBase_postCreateObject
      else: return self.fn_unset_ClassDesignerBase_postCreateObject
   @postCreateObject.setter
   def postCreateObject(self, value):
      self.fn_ClassDesignerBase_postCreateObject = value
      lib.Instance_setMethod(self.impl, "PostCreateObject".encode('utf8'), cb_ClassDesignerBase_postCreateObject)

   def fn_unset_ClassDesignerBase_prepareTestObject(self, designer, test):
      return lib.ClassDesignerBase_prepareTestObject(self.impl, ffi.NULL if designer is None else designer.impl, ffi.NULL if test is None else test.impl)

   @property
   def prepareTestObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_prepareTestObject'): return self.fn_ClassDesignerBase_prepareTestObject
      else: return self.fn_unset_ClassDesignerBase_prepareTestObject
   @prepareTestObject.setter
   def prepareTestObject(self, value):
      self.fn_ClassDesignerBase_prepareTestObject = value
      lib.Instance_setMethod(self.impl, "PrepareTestObject".encode('utf8'), cb_ClassDesignerBase_prepareTestObject)

   def fn_unset_ClassDesignerBase_reset(self):
      return lib.ClassDesignerBase_reset(self.impl)

   @property
   def reset(self):
      if hasattr(self, 'fn_ClassDesignerBase_reset'): return self.fn_ClassDesignerBase_reset
      else: return self.fn_unset_ClassDesignerBase_reset
   @reset.setter
   def reset(self, value):
      self.fn_ClassDesignerBase_reset = value
      lib.Instance_setMethod(self.impl, "Reset".encode('utf8'), cb_ClassDesignerBase_reset)

   def fn_unset_ClassDesignerBase_selectObject(self, object, control):
      return lib.ClassDesignerBase_selectObject(self.impl, ffi.NULL if object is None else object.impl, ffi.NULL if control is None else control.impl)

   @property
   def selectObject(self):
      if hasattr(self, 'fn_ClassDesignerBase_selectObject'): return self.fn_ClassDesignerBase_selectObject
      else: return self.fn_unset_ClassDesignerBase_selectObject
   @selectObject.setter
   def selectObject(self, value):
      self.fn_ClassDesignerBase_selectObject = value
      lib.Instance_setMethod(self.impl, "SelectObject".encode('utf8'), cb_ClassDesignerBase_selectObject)

class ClassProperty:
   def __init__(self, name = None, parent = None, left = None, right = None, depth = None, Set = None, Get = None, dataTypeString = None, dataType = None, constant = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("ClassProperty *", lib.Instance_new(lib.class_ClassProperty))
         if name is not None:           self.name           = name
         if parent is not None:         self.parent         = parent
         if left is not None:           self.left           = left
         if right is not None:          self.right          = right
         if depth is not None:          self.depth          = depth
         if Set is not None:            self.Set            = Set
         if Get is not None:            self.Get            = Get
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if dataType is not None:       self.dataType       = dataType
         if constant is not None:       self.constant       = constant

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value):
      if not isinstance(value, ClassProperty): value = ClassProperty(value)
      self.impl.parent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value):
      if not isinstance(value, ClassProperty): value = ClassProperty(value)
      self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value):
      if not isinstance(value, ClassProperty): value = ClassProperty(value)
      self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

   @property
   def Set(self): return self.impl.Set
   @Set.setter
   def Set(self, value): self.impl.Set = value

   @property
   def Get(self): return self.impl.Get
   @Get.setter
   def Get(self, value): self.impl.Get = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def constant(self): return self.impl.constant
   @constant.setter
   def constant(self, value): self.impl.constant = value

class ClassTemplateArgument:
   def __init__(self, dataTypeString = None, dataTypeClass = None, expression = None, memberString = None, member = None, prop = None, method = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("ClassTemplateArgument *", impl)
      else:
         if dataTypeClass is not None:
            if not isinstance(dataTypeClass, Class): dataTypeClass = Class(dataTypeClass)
         if expression is not None:
            if not isinstance(expression, DataValue): expression = DataValue(expression)
         if member is not None:
            if not isinstance(member, DataMember): member = DataMember(member)
         if prop is not None:
            if not isinstance(prop, Property): prop = Property(prop)
         if method is not None:
            if not isinstance(method, Method): method = Method(method)
         __members = { }
         if dataTypeString is not None: __members['dataTypeString'] = dataTypeString
         if dataTypeClass is not None:  __members['dataTypeClass']  = dataTypeClass.impl[0]
         if expression is not None:     __members['expression']     = expression.impl[0]
         if memberString is not None:   __members['memberString']   = memberString
         if member is not None:         __members['member']         = member.impl[0]
         if prop is not None:           __members['prop']           = prop.impl[0]
         if method is not None:         __members['method']         = method.impl[0]
         self.impl = ffi.new("ClassTemplateArgument *", __members)

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataTypeClass(self): return self.impl.dataTypeClass
   @dataTypeClass.setter
   def dataTypeClass(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.dataTypeClass = value

   @property
   def expression(self): return DataValue(impl = self.impl.expression)
   @expression.setter
   def expression(self, value):
      if not isinstance(value, DataValue): value = DataValue(value)
      self.impl.expression = value.impl[0]

   @property
   def memberString(self): return self.impl.memberString
   @memberString.setter
   def memberString(self, value): self.impl.memberString = value

   @property
   def member(self): return self.impl.member
   @member.setter
   def member(self, value):
      if not isinstance(value, DataMember): value = DataMember(value)
      self.impl.member = value

   @property
   def prop(self): return self.impl.prop
   @prop.setter
   def prop(self, value):
      if not isinstance(value, Property): value = Property(value)
      self.impl.prop = value

   @property
   def method(self): return self.impl.method
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      self.impl.method = value

class ClassTemplateParameter:
   def __init__(self, prev = None, next = None, name = None, type = None, dataTypeString = None, defaultArg = None, param = None, memberType = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("ClassTemplateParameter *", lib.Instance_new(lib.class_ClassTemplateParameter))
         if prev is not None:           self.prev           = prev
         if next is not None:           self.next           = next
         if name is not None:           self.name           = name
         if type is not None:           self.type           = type
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if defaultArg is not None:     self.defaultArg     = defaultArg
         if param is not None:          self.param          = param
         if memberType is not None:     self.memberType     = memberType

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, ClassTemplateParameter): value = ClassTemplateParameter(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, ClassTemplateParameter): value = ClassTemplateParameter(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value): self.impl.type = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def defaultArg(self): return ClassTemplateArgument(impl = self.impl.defaultArg)
   @defaultArg.setter
   def defaultArg(self, value):
      if not isinstance(value, ClassTemplateArgument): value = ClassTemplateArgument(value)
      self.impl.defaultArg = value.impl[0]

   @property
   def param(self): return self.impl.param
   @param.setter
   def param(self, value): self.impl.param = value

   @property
   def memberType(self): return self.impl.memberType
   @memberType.setter
   def memberType(self, value): self.impl.memberType = value

class ClassType:
   normalClass = lib.ClassType_normalClass
   structClass = lib.ClassType_structClass
   bitClass    = lib.ClassType_bitClass
   unitClass   = lib.ClassType_unitClass
   enumClass   = lib.ClassType_enumClass
   noHeadClass = lib.ClassType_noHeadClass
   unionClass  = lib.ClassType_unionClass
   systemClass = lib.ClassType_systemClass

class DataMember:
   def __init__(self, prev = None, next = None, name = None, isProperty = None, memberAccess = None, id = None, _class = None, dataTypeString = None, dataTypeClass = None, dataType = None, type = None, offset = None, memberID = None, members = None, membersAlpha = None, memberOffset = None, structAlignment = None, pointerAlignment = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("DataMember *", lib.Instance_new(lib.class_DataMember))
         if prev is not None:             self.prev             = prev
         if next is not None:             self.next             = next
         if name is not None:             self.name             = name
         if isProperty is not None:       self.isProperty       = isProperty
         if memberAccess is not None:     self.memberAccess     = memberAccess
         if id is not None:               self.id               = id
         if _class is not None:           self._class           = _class
         if dataTypeString is not None:   self.dataTypeString   = dataTypeString
         if dataTypeClass is not None:    self.dataTypeClass    = dataTypeClass
         if dataType is not None:         self.dataType         = dataType
         if type is not None:             self.type             = type
         if offset is not None:           self.offset           = offset
         if memberID is not None:         self.memberID         = memberID
         if members is not None:          self.members          = members
         if membersAlpha is not None:     self.membersAlpha     = membersAlpha
         if memberOffset is not None:     self.memberOffset     = memberOffset
         if structAlignment is not None:  self.structAlignment  = structAlignment
         if pointerAlignment is not None: self.pointerAlignment = pointerAlignment

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, DataMember): value = DataMember(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, DataMember): value = DataMember(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def isProperty(self): return self.impl.isProperty
   @isProperty.setter
   def isProperty(self, value): self.impl.isProperty = value

   @property
   def memberAccess(self): return self.impl.memberAccess
   @memberAccess.setter
   def memberAccess(self, value): self.impl.memberAccess = value

   @property
   def id(self): return self.impl.id
   @id.setter
   def id(self, value): self.impl.id = value

   @property
   def _class(self): return self.impl._class
   @_class.setter
   def _class(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl._class = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataTypeClass(self): return self.impl.dataTypeClass
   @dataTypeClass.setter
   def dataTypeClass(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.dataTypeClass = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value): self.impl.type = value

   @property
   def offset(self): return self.impl.offset
   @offset.setter
   def offset(self, value): self.impl.offset = value

   @property
   def memberID(self): return self.impl.memberID
   @memberID.setter
   def memberID(self, value): self.impl.memberID = value

   @property
   def members(self): return OldList(impl = self.impl.members)
   @members.setter
   def members(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.members = value.impl[0]

   @property
   def membersAlpha(self): return BinaryTree(impl = self.impl.membersAlpha)
   @membersAlpha.setter
   def membersAlpha(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.membersAlpha = value.impl[0]

   @property
   def memberOffset(self): return self.impl.memberOffset
   @memberOffset.setter
   def memberOffset(self, value): self.impl.memberOffset = value

   @property
   def structAlignment(self): return self.impl.structAlignment
   @structAlignment.setter
   def structAlignment(self, value): self.impl.structAlignment = value

   @property
   def pointerAlignment(self): return self.impl.pointerAlignment
   @pointerAlignment.setter
   def pointerAlignment(self, value): self.impl.pointerAlignment = value

class DataMemberType:
   normalMember = lib.DataMemberType_normalMember
   unionMember  = lib.DataMemberType_unionMember
   structMember = lib.DataMemberType_structMember

class DataValue:
   def __init__(self, c = None, uc = None, s = None, us = None, i = None, ui = None, p = None, f = None, d = None, i64 = None, ui64 = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("DataValue *", impl)
      else:
         __members = { }
         if c is not None:    __members['c']    = c
         if uc is not None:   __members['uc']   = uc
         if s is not None:    __members['s']    = s
         if us is not None:   __members['us']   = us
         if i is not None:    __members['i']    = i
         if ui is not None:   __members['ui']   = ui
         if p is not None:    __members['p']    = p
         if f is not None:    __members['f']    = f
         if d is not None:    __members['d']    = d
         if i64 is not None:  __members['i64']  = i64
         if ui64 is not None: __members['ui64'] = ui64
         self.impl = ffi.new("DataValue *", __members)

   @property
   def c(self): return self.impl.c
   @c.setter
   def c(self, value): self.impl.c = value

   @property
   def uc(self): return self.impl.uc
   @uc.setter
   def uc(self, value): self.impl.uc = value

   @property
   def s(self): return self.impl.s
   @s.setter
   def s(self, value): self.impl.s = value

   @property
   def us(self): return self.impl.us
   @us.setter
   def us(self, value): self.impl.us = value

   @property
   def i(self): return self.impl.i
   @i.setter
   def i(self, value): self.impl.i = value

   @property
   def ui(self): return self.impl.ui
   @ui.setter
   def ui(self, value): self.impl.ui = value

   @property
   def p(self): return self.impl.p
   @p.setter
   def p(self, value): self.impl.p = value

   @property
   def f(self): return self.impl.f
   @f.setter
   def f(self, value): self.impl.f = value

   @property
   def d(self): return self.impl.d
   @d.setter
   def d(self, value): self.impl.d = value

   @property
   def i64(self): return self.impl.i64
   @i64.setter
   def i64(self, value): self.impl.i64 = value

   @property
   def ui64(self): return self.impl.ui64
   @ui64.setter
   def ui64(self, value): self.impl.ui64 = value

class DefinedExpression:
   def __init__(self, prev = None, next = None, name = None, value = None, nameSpace = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("DefinedExpression *", lib.Instance_new(lib.class_DefinedExpression))
         if prev is not None:      self.prev      = prev
         if next is not None:      self.next      = next
         if name is not None:      self.name      = name
         if value is not None:     self.value     = value
         if nameSpace is not None: self.nameSpace = nameSpace

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, DefinedExpression): value = DefinedExpression(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, DefinedExpression): value = DefinedExpression(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def value(self): return self.impl.value
   @value.setter
   def value(self, value): self.impl.value = value

   @property
   def nameSpace(self): return self.impl.nameSpace
   @nameSpace.setter
   def nameSpace(self, value): self.impl.nameSpace = value

@ffi.callback("void(DesignerBase, Instance, Instance)")
def cb_DesignerBase_addDefaultMethod(__d, instance, classInstance):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_addDefaultMethod(designerbase, pyOrNewObject(Instance, instance), pyOrNewObject(Instance, classInstance))

@ffi.callback("void(DesignerBase, Class *)")
def cb_DesignerBase_addToolBoxClass(__d, _class):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_addToolBoxClass(designerbase, Class(impl = _class))

@ffi.callback("void(DesignerBase, Instance, ObjectInfo *)")
def cb_DesignerBase_codeAddObject(__d, instance, object):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_codeAddObject(designerbase, pyOrNewObject(Instance, instance), object)

@ffi.callback("void(DesignerBase, ObjectInfo *)")
def cb_DesignerBase_deleteObject(__d, object):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_deleteObject(designerbase, ObjectInfo(impl = object))

@ffi.callback("void(DesignerBase, Instance *, const char *)")
def cb_DesignerBase_findObject(__d, instance, string):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_findObject(designerbase, instance, string.encode('utf8'))

@ffi.callback("void(DesignerBase)")
def cb_DesignerBase_modifyCode(__d):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_modifyCode(designerbase)

@ffi.callback("void(DesignerBase, ObjectInfo *)")
def cb_DesignerBase_objectContainsCode(__d, object):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_objectContainsCode(designerbase, ObjectInfo(impl = object))

@ffi.callback("void(DesignerBase, ObjectInfo *, const char *)")
def cb_DesignerBase_renameObject(__d, object, name):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_renameObject(designerbase, ObjectInfo(impl = object), name.encode('utf8'))

@ffi.callback("void(DesignerBase, ObjectInfo *)")
def cb_DesignerBase_selectObjectFromDesigner(__d, object):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_selectObjectFromDesigner(designerbase, ObjectInfo(impl = object))

@ffi.callback("void(DesignerBase, ObjectInfo *)")
def cb_DesignerBase_sheetAddObject(__d, object):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_sheetAddObject(designerbase, ObjectInfo(impl = object))

@ffi.callback("void(DesignerBase)")
def cb_DesignerBase_updateProperties(__d):
   designerbase = pyOrNewObject(DesignerBase, __d)
   designerbase.fn_DesignerBase_updateProperties(designerbase)

class DesignerBase(Window):
   def __init__(self,
                classDesigner = None,
                objectClass = None,
                isDragging = None,
                addDefaultMethod = None,
                addToolBoxClass = None,
                codeAddObject = None,
                deleteObject = None,
                findObject = None,
                modifyCode = None,
                objectContainsCode = None,
                renameObject = None,
                selectObjectFromDesigner = None,
                sheetAddObject = None,
                updateProperties = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if classDesigner is not None:            self.classDesigner = classDesigner
      if objectClass is not None:              self.objectClass = objectClass
      if isDragging is not None:               self.isDragging = isDragging
      if addDefaultMethod is not None:         self.addDefaultMethod = addDefaultMethod
      if addToolBoxClass is not None:          self.addToolBoxClass = addToolBoxClass
      if codeAddObject is not None:            self.codeAddObject = codeAddObject
      if deleteObject is not None:             self.deleteObject = deleteObject
      if findObject is not None:               self.findObject = findObject
      if modifyCode is not None:               self.modifyCode = modifyCode
      if objectContainsCode is not None:       self.objectContainsCode = objectContainsCode
      if renameObject is not None:             self.renameObject = renameObject
      if selectObjectFromDesigner is not None: self.selectObjectFromDesigner = selectObjectFromDesigner
      if sheetAddObject is not None:           self.sheetAddObject = sheetAddObject
      if updateProperties is not None:         self.updateProperties = updateProperties

   @property
   def classDesigner(self): return ClassDesignerBase(impl = IPTR(lib, ffi, self, DesignerBase).classDesigner)
   @classDesigner.setter
   def classDesigner(self, value):
      if not isinstance(value, ClassDesignerBase): value = ClassDesignerBase(value)
      IPTR(lib, ffi, self, DesignerBase).classDesigner = value.impl

   @property
   def objectClass(self): return IPTR(lib, ffi, self, DesignerBase).objectClass
   @objectClass.setter
   def objectClass(self, value): IPTR(lib, ffi, self, DesignerBase).objectClass = value

   @property
   def isDragging(self): return IPTR(lib, ffi, self, DesignerBase).isDragging
   @isDragging.setter
   def isDragging(self, value): IPTR(lib, ffi, self, DesignerBase).isDragging = value

   def fn_unset_DesignerBase_addDefaultMethod(self, instance, classInstance):
      return lib.DesignerBase_addDefaultMethod(self.impl, ffi.NULL if instance is None else instance.impl, ffi.NULL if classInstance is None else classInstance.impl)

   @property
   def addDefaultMethod(self):
      if hasattr(self, 'fn_DesignerBase_addDefaultMethod'): return self.fn_DesignerBase_addDefaultMethod
      else: return self.fn_unset_DesignerBase_addDefaultMethod
   @addDefaultMethod.setter
   def addDefaultMethod(self, value):
      self.fn_DesignerBase_addDefaultMethod = value
      lib.Instance_setMethod(self.impl, "AddDefaultMethod".encode('utf8'), cb_DesignerBase_addDefaultMethod)

   def fn_unset_DesignerBase_addToolBoxClass(self, _class):
      return lib.DesignerBase_addToolBoxClass(self.impl, ffi.NULL if _class is None else _class.impl)

   @property
   def addToolBoxClass(self):
      if hasattr(self, 'fn_DesignerBase_addToolBoxClass'): return self.fn_DesignerBase_addToolBoxClass
      else: return self.fn_unset_DesignerBase_addToolBoxClass
   @addToolBoxClass.setter
   def addToolBoxClass(self, value):
      self.fn_DesignerBase_addToolBoxClass = value
      lib.Instance_setMethod(self.impl, "AddToolBoxClass".encode('utf8'), cb_DesignerBase_addToolBoxClass)

   def fn_unset_DesignerBase_codeAddObject(self, instance, object):
      return lib.DesignerBase_codeAddObject(self.impl, ffi.NULL if instance is None else instance.impl, object)

   @property
   def codeAddObject(self):
      if hasattr(self, 'fn_DesignerBase_codeAddObject'): return self.fn_DesignerBase_codeAddObject
      else: return self.fn_unset_DesignerBase_codeAddObject
   @codeAddObject.setter
   def codeAddObject(self, value):
      self.fn_DesignerBase_codeAddObject = value
      lib.Instance_setMethod(self.impl, "CodeAddObject".encode('utf8'), cb_DesignerBase_codeAddObject)

   def fn_unset_DesignerBase_deleteObject(self, object):
      return lib.DesignerBase_deleteObject(self.impl, ffi.NULL if object is None else object.impl)

   @property
   def deleteObject(self):
      if hasattr(self, 'fn_DesignerBase_deleteObject'): return self.fn_DesignerBase_deleteObject
      else: return self.fn_unset_DesignerBase_deleteObject
   @deleteObject.setter
   def deleteObject(self, value):
      self.fn_DesignerBase_deleteObject = value
      lib.Instance_setMethod(self.impl, "DeleteObject".encode('utf8'), cb_DesignerBase_deleteObject)

   def fn_unset_DesignerBase_findObject(self, instance, string):
      return lib.DesignerBase_findObject(self.impl, instance, string)

   @property
   def findObject(self):
      if hasattr(self, 'fn_DesignerBase_findObject'): return self.fn_DesignerBase_findObject
      else: return self.fn_unset_DesignerBase_findObject
   @findObject.setter
   def findObject(self, value):
      self.fn_DesignerBase_findObject = value
      lib.Instance_setMethod(self.impl, "FindObject".encode('utf8'), cb_DesignerBase_findObject)

   def fn_unset_DesignerBase_modifyCode(self):
      return lib.DesignerBase_modifyCode(self.impl)

   @property
   def modifyCode(self):
      if hasattr(self, 'fn_DesignerBase_modifyCode'): return self.fn_DesignerBase_modifyCode
      else: return self.fn_unset_DesignerBase_modifyCode
   @modifyCode.setter
   def modifyCode(self, value):
      self.fn_DesignerBase_modifyCode = value
      lib.Instance_setMethod(self.impl, "ModifyCode".encode('utf8'), cb_DesignerBase_modifyCode)

   def fn_unset_DesignerBase_objectContainsCode(self, object):
      return lib.DesignerBase_objectContainsCode(self.impl, ffi.NULL if object is None else object.impl)

   @property
   def objectContainsCode(self):
      if hasattr(self, 'fn_DesignerBase_objectContainsCode'): return self.fn_DesignerBase_objectContainsCode
      else: return self.fn_unset_DesignerBase_objectContainsCode
   @objectContainsCode.setter
   def objectContainsCode(self, value):
      self.fn_DesignerBase_objectContainsCode = value
      lib.Instance_setMethod(self.impl, "ObjectContainsCode".encode('utf8'), cb_DesignerBase_objectContainsCode)

   def fn_unset_DesignerBase_renameObject(self, object, name):
      return lib.DesignerBase_renameObject(self.impl, ffi.NULL if object is None else object.impl, name)

   @property
   def renameObject(self):
      if hasattr(self, 'fn_DesignerBase_renameObject'): return self.fn_DesignerBase_renameObject
      else: return self.fn_unset_DesignerBase_renameObject
   @renameObject.setter
   def renameObject(self, value):
      self.fn_DesignerBase_renameObject = value
      lib.Instance_setMethod(self.impl, "RenameObject".encode('utf8'), cb_DesignerBase_renameObject)

   def fn_unset_DesignerBase_selectObjectFromDesigner(self, object):
      return lib.DesignerBase_selectObjectFromDesigner(self.impl, ffi.NULL if object is None else object.impl)

   @property
   def selectObjectFromDesigner(self):
      if hasattr(self, 'fn_DesignerBase_selectObjectFromDesigner'): return self.fn_DesignerBase_selectObjectFromDesigner
      else: return self.fn_unset_DesignerBase_selectObjectFromDesigner
   @selectObjectFromDesigner.setter
   def selectObjectFromDesigner(self, value):
      self.fn_DesignerBase_selectObjectFromDesigner = value
      lib.Instance_setMethod(self.impl, "SelectObjectFromDesigner".encode('utf8'), cb_DesignerBase_selectObjectFromDesigner)

   def fn_unset_DesignerBase_sheetAddObject(self, object):
      return lib.DesignerBase_sheetAddObject(self.impl, ffi.NULL if object is None else object.impl)

   @property
   def sheetAddObject(self):
      if hasattr(self, 'fn_DesignerBase_sheetAddObject'): return self.fn_DesignerBase_sheetAddObject
      else: return self.fn_unset_DesignerBase_sheetAddObject
   @sheetAddObject.setter
   def sheetAddObject(self, value):
      self.fn_DesignerBase_sheetAddObject = value
      lib.Instance_setMethod(self.impl, "SheetAddObject".encode('utf8'), cb_DesignerBase_sheetAddObject)

   def fn_unset_DesignerBase_updateProperties(self):
      return lib.DesignerBase_updateProperties(self.impl)

   @property
   def updateProperties(self):
      if hasattr(self, 'fn_DesignerBase_updateProperties'): return self.fn_DesignerBase_updateProperties
      else: return self.fn_unset_DesignerBase_updateProperties
   @updateProperties.setter
   def updateProperties(self, value):
      self.fn_DesignerBase_updateProperties = value
      lib.Instance_setMethod(self.impl, "UpdateProperties".encode('utf8'), cb_DesignerBase_updateProperties)

class EnumClassData:
   def __init__(self, values = None, largest = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("EnumClassData *", lib.Instance_new(lib.class_EnumClassData))
         if values is not None:  self.values  = values
         if largest is not None: self.largest = largest

   @property
   def values(self): return OldList(impl = self.impl.values)
   @values.setter
   def values(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.values = value.impl[0]

   @property
   def largest(self): return self.impl.largest
   @largest.setter
   def largest(self, value): self.impl.largest = value

class GlobalFunction:
   def __init__(self, prev = None, next = None, name = None, function = None, module = None, nameSpace = None, dataTypeString = None, dataType = None, symbol = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("GlobalFunction *", lib.Instance_new(lib.class_GlobalFunction))
         if prev is not None:           self.prev           = prev
         if next is not None:           self.next           = next
         if name is not None:           self.name           = name
         if function is not None:       self.function       = function
         if module is not None:         self.module         = module
         if nameSpace is not None:      self.nameSpace      = nameSpace
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if dataType is not None:       self.dataType       = dataType
         if symbol is not None:         self.symbol         = symbol

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, GlobalFunction): value = GlobalFunction(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, GlobalFunction): value = GlobalFunction(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def function(self): return self.impl.function
   @function.setter
   def function(self, value): self.impl.function = value

   @property
   def module(self): return pyOrNewObject(Module, self.impl.module)
   @module.setter
   def module(self, value):
      if not isinstance(value, Module): value = Module(value)
      self.impl.module = value

   @property
   def nameSpace(self): return self.impl.nameSpace
   @nameSpace.setter
   def nameSpace(self, value): self.impl.nameSpace = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def symbol(self): return self.impl.symbol
   @symbol.setter
   def symbol(self, value): self.impl.symbol = value

class ImportType:
   normalImport   = lib.ImportType_normalImport
   staticImport   = lib.ImportType_staticImport
   remoteImport   = lib.ImportType_remoteImport
   preDeclImport  = lib.ImportType_preDeclImport
   comCheckImport = lib.ImportType_comCheckImport

class Link(ListItem):
   def __init__(self, link = None, data = None, prev = None, next = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Link *", lib.Instance_new(lib.class_Link))
         if link is not None: self.link = link
         if data is not None: self.data = data
         if prev is not None: self.prev = prev
         if next is not None: self.next = next

   @property
   def link(self): return LinkElement(impl = self.impl.link)
   @link.setter
   def link(self, value): self.impl.link = value.impl[0]

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value): self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value): self.impl.next = value

class LinkElement:
   def __init__(self, prev = None, next = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("LinkElement *", impl)
      else:
         if isinstance(prev, tuple):
            __tuple = prev
            prev = None
            if len(__tuple) > 0: prev = __tuple[0]
            if len(__tuple) > 1: next = __tuple[1]
         self.impl = ffi.new("LinkElement *", { 'prev' : prev, 'next' : next })

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value): self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value): self.impl.next = value

class List(LinkList):
   def __init__(self, templateParams = None,
                copySrc = None,
                first = None,
                last = None,
                count = None,
                add = None,
                copy = None,
                delete = None,
                find = None,
                free = None,
                freeIterator = None,
                getAtPosition = None,
                getCount = None,
                getData = None,
                getFirst = None,
                getLast = None,
                getNext = None,
                getPrev = None,
                insert = None,
                move = None,
                remove = None,
                removeAll = None,
                setData = None,
                sort = None,
                impl = None):
      LinkList.__init__(self, templateParams, impl = impl)
      if copySrc is not None:       self.copySrc = copySrc
      if first is not None:         self.first = first
      if last is not None:          self.last = last
      if count is not None:         self.count = count
      if add is not None:           self.add = add
      if copy is not None:          self.copy = copy
      if delete is not None:        self.delete = delete
      if find is not None:          self.find = find
      if free is not None:          self.free = free
      if freeIterator is not None:  self.freeIterator = freeIterator
      if getAtPosition is not None: self.getAtPosition = getAtPosition
      if getCount is not None:      self.getCount = getCount
      if getData is not None:       self.getData = getData
      if getFirst is not None:      self.getFirst = getFirst
      if getLast is not None:       self.getLast = getLast
      if getNext is not None:       self.getNext = getNext
      if getPrev is not None:       self.getPrev = getPrev
      if insert is not None:        self.insert = insert
      if move is not None:          self.move = move
      if remove is not None:        self.remove = remove
      if removeAll is not None:     self.removeAll = removeAll
      if setData is not None:       self.setData = setData
      if sort is not None:          self.sort = sort

   @property
   def first(self): return IPTR(lib, ffi, self, List).first
   @first.setter
   def first(self, value): IPTR(lib, ffi, self, List).first = value

   @property
   def last(self): return IPTR(lib, ffi, self, List).last
   @last.setter
   def last(self, value): IPTR(lib, ffi, self, List).last = value

   @property
   def count(self): return IPTR(lib, ffi, self, List).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, List).count = value

class Map(CustomAVLTree):
   def __init__(self, templateParams = None,
                copySrc = None,
                root = None,
                count = None,
                mapSrc = None,
                add = None,
                copy = None,
                delete = None,
                find = None,
                free = None,
                freeIterator = None,
                getAtPosition = None,
                getCount = None,
                getData = None,
                getFirst = None,
                getLast = None,
                getNext = None,
                getPrev = None,
                insert = None,
                move = None,
                remove = None,
                removeAll = None,
                setData = None,
                sort = None,
                impl = None):
      CustomAVLTree.__init__(self, templateParams, impl = impl)
      if copySrc is not None:       self.copySrc = copySrc
      if root is not None:          self.root = root
      if count is not None:         self.count = count
      if mapSrc is not None:        self.mapSrc = mapSrc
      if add is not None:           self.add = add
      if copy is not None:          self.copy = copy
      if delete is not None:        self.delete = delete
      if find is not None:          self.find = find
      if free is not None:          self.free = free
      if freeIterator is not None:  self.freeIterator = freeIterator
      if getAtPosition is not None: self.getAtPosition = getAtPosition
      if getCount is not None:      self.getCount = getCount
      if getData is not None:       self.getData = getData
      if getFirst is not None:      self.getFirst = getFirst
      if getLast is not None:       self.getLast = getLast
      if getNext is not None:       self.getNext = getNext
      if getPrev is not None:       self.getPrev = getPrev
      if insert is not None:        self.insert = insert
      if move is not None:          self.move = move
      if remove is not None:        self.remove = remove
      if removeAll is not None:     self.removeAll = removeAll
      if setData is not None:       self.setData = setData
      if sort is not None:          self.sort = sort

   @property
   def root(self): return IPTR(lib, ffi, self, Map).root
   @root.setter
   def root(self, value): IPTR(lib, ffi, self, Map).root = value

   @property
   def count(self): return IPTR(lib, ffi, self, Map).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, Map).count = value

   @property
   def mapSrc(self): return None
   @mapSrc.setter
   def mapSrc(self, value):
      if not isinstance(value, Map): value = Map(value)
      lib.Map_set_mapSrc(self.impl, value.impl)

class MapIterator(Iterator):
   def __init__(self, container = None, pointer = None, data = None, map = None, value = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("MapIterator *", impl)
      else:
         if isinstance(container, tuple):
            __tuple = container
            container = None
            if len(__tuple) > 0: container = __tuple[0]
            if len(__tuple) > 1: pointer   = __tuple[1]
            if len(__tuple) > 2: data      = __tuple[2]
            if len(__tuple) > 3: map       = __tuple[3]
         if pointer is not None:
            if not isinstance(pointer, IteratorPointer): pointer = IteratorPointer(pointer)
            pointer = pointer.impl
         self.impl = ffi.new("MapIterator *", { 'container' : container, 'pointer' : pointer })
         if data is not None:      self.data           = data
         if map is not None:       self.map            = map
         if value is not None:     self.value          = value
         if data is not None:      self.data           = data
         if map is not None:       self.map            = map
         if value is not None:     self.value          = value
      if data is not None:      self.data           = data
      if not isinstance(map, Map): map = Map(map)
      if map is not None:       self.map            = map.impl
      if value is not None:     self.value          = value

   @property
   def container(self): return pyOrNewObject(Container, self.impl.container)
   @container.setter
   def container(self, value): self.impl.container = value

   @property
   def pointer(self): return self.impl.pointer
   @pointer.setter
   def pointer(self, value):
      if not isinstance(value, IteratorPointer): value = IteratorPointer(value)
      self.impl.pointer = value

   @property
   def map(self): return pyOrNewObject(Map, lib.MapIterator_get_map(self.impl))
   @map.setter
   def map(self, value):
      if not isinstance(value, Map): value = Map(value)
      lib.MapIterator_set_map(self.impl, value.impl)

   @property
   def key(self): value = lib.MapIterator_get_key(self.impl); return pyOrNewObject(Instance, lib.oTAInstance(value))

   @property
   def value(self): value = lib.MapIterator_get_value(self.impl); return pyOrNewObject(Instance, lib.oTAInstance(value))
   @value.setter
   def value(self, value):
      lib.MapIterator_set_value(self.impl, TA(value))

class MapNode(AVLNode):
   def __init__(self, key = None, value = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("MapNode *", lib.Instance_new(lib.class_MapNode))
         if value is not None: self.value      = value
         if key is not None:   self.key   = key
         if value is not None: self.value = value

   @property
   def key(self): return self.impl.key
   @key.setter
   def key(self, value): self.impl.key = value

   @property
   def value(self): value = lib.MapNode_get_value(self.impl); return pyOrNewObject(Instance, lib.oTAInstance(value))
   @value.setter
   def value(self, value):
      lib.MapNode_set_value(self.impl, TA(value))

class Method:
   def __init__(self, name = None, parent = None, left = None, right = None, depth = None, function = None, vid = None, type = None, _class = None, symbol = None, dataTypeString = None, dataType = None, memberAccess = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Method *", lib.Instance_new(lib.class_Method))
         if name is not None:           self.name           = name
         if parent is not None:         self.parent         = parent
         if left is not None:           self.left           = left
         if right is not None:          self.right          = right
         if depth is not None:          self.depth          = depth
         if function is not None:       self.function       = function
         if vid is not None:            self.vid            = vid
         if type is not None:           self.type           = type
         if _class is not None:         self._class         = _class
         if symbol is not None:         self.symbol         = symbol
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if dataType is not None:       self.dataType       = dataType
         if memberAccess is not None:   self.memberAccess   = memberAccess

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value):
      if not isinstance(value, Method): value = Method(value)
      self.impl.parent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value):
      if not isinstance(value, Method): value = Method(value)
      self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value):
      if not isinstance(value, Method): value = Method(value)
      self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

   @property
   def function(self): return self.impl.function
   @function.setter
   def function(self, value): self.impl.function = value

   @property
   def vid(self): return self.impl.vid
   @vid.setter
   def vid(self, value): self.impl.vid = value

   @property
   def type(self): return self.impl.type
   @type.setter
   def type(self, value): self.impl.type = value

   @property
   def _class(self): return self.impl._class
   @_class.setter
   def _class(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl._class = value

   @property
   def symbol(self): return self.impl.symbol
   @symbol.setter
   def symbol(self, value): self.impl.symbol = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def memberAccess(self): return self.impl.memberAccess
   @memberAccess.setter
   def memberAccess(self, value): self.impl.memberAccess = value

class MethodType:
   normalMethod  = lib.MethodType_normalMethod
   virtualMethod = lib.MethodType_virtualMethod

class NameSpace:
   def __init__(self, name = None, btParent = None, left = None, right = None, depth = 0, parent = None, nameSpaces = None, classes = None, defines = None, functions = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("NameSpace *", impl)
      else:
         if nameSpaces is not None:
            if not isinstance(nameSpaces, BinaryTree): nameSpaces = BinaryTree(nameSpaces)
            nameSpaces = nameSpaces.impl
         if classes is not None:
            if not isinstance(classes, BinaryTree): classes = BinaryTree(classes)
            classes = classes.impl
         if defines is not None:
            if not isinstance(defines, BinaryTree): defines = BinaryTree(defines)
            defines = defines.impl
         if functions is not None:
            if not isinstance(functions, BinaryTree): functions = BinaryTree(functions)
            functions = functions.impl
         self.impl = ffi.new("NameSpace *", { 'name' : name, 'btParent' : btParent, 'left' : left, 'right' : right, 'depth' : depth, 'parent' : parent, 'nameSpaces' : nameSpaces, 'classes' : classes, 'defines' : defines, 'functions' : functions })

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def btParent(self): return self.impl.btParent
   @btParent.setter
   def btParent(self, value): self.impl.btParent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value): self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value): self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value): self.impl.parent = value

   @property
   def nameSpaces(self): return BinaryTree(impl = self.impl.nameSpaces)
   @nameSpaces.setter
   def nameSpaces(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.nameSpaces = value.impl[0]

   @property
   def classes(self): return BinaryTree(impl = self.impl.classes)
   @classes.setter
   def classes(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.classes = value.impl[0]

   @property
   def defines(self): return BinaryTree(impl = self.impl.defines)
   @defines.setter
   def defines(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.defines = value.impl[0]

   @property
   def functions(self): return BinaryTree(impl = self.impl.functions)
   @functions.setter
   def functions(self, value):
      if not isinstance(value, BinaryTree): value = BinaryTree(value)
      self.impl.functions = value.impl[0]

class ObjectInfo:
   def __init__(self, prev = None, next = None, instance = None, name = None, instCode = None, deleted = None, oClass = None, instances = None, classDefinition = None, modified = None, i18nStrings = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("ObjectInfo *", lib.Instance_new(lib.class_ObjectInfo))
         if prev is not None:            self.prev            = prev
         if next is not None:            self.next            = next
         if instance is not None:        self.instance        = instance
         if name is not None:            self.name            = name
         if instCode is not None:        self.instCode        = instCode
         if deleted is not None:         self.deleted         = deleted
         if oClass is not None:          self.oClass          = oClass
         if instances is not None:       self.instances       = instances
         if classDefinition is not None: self.classDefinition = classDefinition
         if modified is not None:        self.modified        = modified
         if i18nStrings is not None:     self.i18nStrings     = i18nStrings

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, ObjectInfo): value = ObjectInfo(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, ObjectInfo): value = ObjectInfo(value)
      self.impl.next = value

   @property
   def instance(self): return pyOrNewObject(Instance, self.impl.instance)
   @instance.setter
   def instance(self, value):
      if not isinstance(value, Instance): value = Instance(value)
      self.impl.instance = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def instCode(self): return self.impl.instCode
   @instCode.setter
   def instCode(self, value): self.impl.instCode = value

   @property
   def deleted(self): return self.impl.deleted
   @deleted.setter
   def deleted(self, value): self.impl.deleted = value

   @property
   def oClass(self): return self.impl.oClass
   @oClass.setter
   def oClass(self, value):
      if not isinstance(value, ObjectInfo): value = ObjectInfo(value)
      self.impl.oClass = value

   @property
   def instances(self): return OldList(impl = self.impl.instances)
   @instances.setter
   def instances(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      self.impl.instances = value.impl[0]

   @property
   def classDefinition(self): return self.impl.classDefinition
   @classDefinition.setter
   def classDefinition(self, value): self.impl.classDefinition = value

   @property
   def modified(self): return self.impl.modified
   @modified.setter
   def modified(self, value): self.impl.modified = value

   @property
   def i18nStrings(self): return self.impl.i18nStrings
   @i18nStrings.setter
   def i18nStrings(self, value): self.impl.i18nStrings = value

class Platform:
   unknown = lib.Platform_unknown
   win32   = lib.Platform_win32
   tux     = lib.Platform_tux
   apple   = lib.Platform_apple

   # here is a conversion
   # Platform_to_char_ptr
   # Platform_from_char_ptr

class Property:
   def __init__(self, prev = None, next = None, name = None, isProperty = None, memberAccess = None, id = None, _class = None, dataTypeString = None, dataTypeClass = None, dataType = None, Set = None, Get = None, IsSet = None, data = None, symbol = None, vid = None, conversion = None, watcherOffset = None, category = None, compiled = None, selfWatchable = None, isWatchable = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Property *", lib.Instance_new(lib.class_Property))
         if prev is not None:           self.prev           = prev
         if next is not None:           self.next           = next
         if name is not None:           self.name           = name
         if isProperty is not None:     self.isProperty     = isProperty
         if memberAccess is not None:   self.memberAccess   = memberAccess
         if id is not None:             self.id             = id
         if _class is not None:         self._class         = _class
         if dataTypeString is not None: self.dataTypeString = dataTypeString
         if dataTypeClass is not None:  self.dataTypeClass  = dataTypeClass
         if dataType is not None:       self.dataType       = dataType
         if Set is not None:            self.Set            = Set
         if Get is not None:            self.Get            = Get
         if IsSet is not None:          self.IsSet          = IsSet
         if data is not None:           self.data           = data
         if symbol is not None:         self.symbol         = symbol
         if vid is not None:            self.vid            = vid
         if conversion is not None:     self.conversion     = conversion
         if watcherOffset is not None:  self.watcherOffset  = watcherOffset
         if category is not None:       self.category       = category
         if compiled is not None:       self.compiled       = compiled
         if selfWatchable is not None:  self.selfWatchable  = selfWatchable
         if isWatchable is not None:    self.isWatchable    = isWatchable

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, Property): value = Property(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, Property): value = Property(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def isProperty(self): return self.impl.isProperty
   @isProperty.setter
   def isProperty(self, value): self.impl.isProperty = value

   @property
   def memberAccess(self): return self.impl.memberAccess
   @memberAccess.setter
   def memberAccess(self, value): self.impl.memberAccess = value

   @property
   def id(self): return self.impl.id
   @id.setter
   def id(self, value): self.impl.id = value

   @property
   def _class(self): return self.impl._class
   @_class.setter
   def _class(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl._class = value

   @property
   def dataTypeString(self): return self.impl.dataTypeString
   @dataTypeString.setter
   def dataTypeString(self, value): self.impl.dataTypeString = value

   @property
   def dataTypeClass(self): return self.impl.dataTypeClass
   @dataTypeClass.setter
   def dataTypeClass(self, value):
      if not isinstance(value, Class): value = Class(value)
      self.impl.dataTypeClass = value

   @property
   def dataType(self): return self.impl.dataType
   @dataType.setter
   def dataType(self, value): self.impl.dataType = value

   @property
   def Set(self): return self.impl.Set
   @Set.setter
   def Set(self, value): self.impl.Set = value

   @property
   def Get(self): return self.impl.Get
   @Get.setter
   def Get(self, value): self.impl.Get = value

   @property
   def IsSet(self): return self.impl.IsSet
   @IsSet.setter
   def IsSet(self, value): self.impl.IsSet = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

   @property
   def symbol(self): return self.impl.symbol
   @symbol.setter
   def symbol(self, value): self.impl.symbol = value

   @property
   def vid(self): return self.impl.vid
   @vid.setter
   def vid(self, value): self.impl.vid = value

   @property
   def conversion(self): return self.impl.conversion
   @conversion.setter
   def conversion(self, value): self.impl.conversion = value

   @property
   def watcherOffset(self): return self.impl.watcherOffset
   @watcherOffset.setter
   def watcherOffset(self, value): self.impl.watcherOffset = value

   @property
   def category(self): return self.impl.category
   @category.setter
   def category(self, value): self.impl.category = value

   @property
   def compiled(self): return self.impl.compiled
   @compiled.setter
   def compiled(self, value): self.impl.compiled = value

   @property
   def selfWatchable(self): return self.impl.selfWatchable
   @selfWatchable.setter
   def selfWatchable(self, value): self.impl.selfWatchable = value

   @property
   def isWatchable(self): return self.impl.isWatchable
   @isWatchable.setter
   def isWatchable(self, value): self.impl.isWatchable = value

class SerialBuffer(IOChannel):
   def __init__(self,
                _buffer = None,
                count = None,
                _size = None,
                pos = None,
                buffer = None,
                size = None,
                readData = None,
                writeData = None,
                impl = None):
      IOChannel.__init__(self, impl = impl)
      if _buffer is not None:   self._buffer = _buffer
      if count is not None:     self.count = count
      if _size is not None:     self._size = _size
      if pos is not None:       self.pos = pos
      if buffer is not None:    self.buffer = buffer
      if size is not None:      self.size = size
      if readData is not None:  self.readData = readData
      if writeData is not None: self.writeData = writeData

   @property
   def _buffer(self): return IPTR(lib, ffi, self, SerialBuffer)._buffer
   @_buffer.setter
   def _buffer(self, value): IPTR(lib, ffi, self, SerialBuffer)._buffer = value

   @property
   def count(self): return IPTR(lib, ffi, self, SerialBuffer).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, SerialBuffer).count = value

   @property
   def _size(self): return IPTR(lib, ffi, self, SerialBuffer)._size
   @_size.setter
   def _size(self, value): IPTR(lib, ffi, self, SerialBuffer)._size = value

   @property
   def pos(self): return IPTR(lib, ffi, self, SerialBuffer).pos
   @pos.setter
   def pos(self, value): IPTR(lib, ffi, self, SerialBuffer).pos = value

   @property
   def buffer(self): return lib.SerialBuffer_get_buffer(self.impl)
   @buffer.setter
   def buffer(self, value):
      lib.SerialBuffer_set_buffer(self.impl, value)

   @property
   def size(self): return lib.SerialBuffer_get_size(self.impl)
   @size.setter
   def size(self, value):
      lib.SerialBuffer_set_size(self.impl, value)

   def free(self):
      lib.SerialBuffer_free(self.impl)

class StaticString:
   def __init__(self, string = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("StaticString *", impl)
      else:
         self.impl = ffi.new("StaticString *", { 'string' : string })

   @property
   def string(self): return self.impl.string
   @string.setter
   def string(self, value): self.impl.string = value

class SubModule:
   def __init__(self, prev = None, next = None, module = None, importMode = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("SubModule *", lib.Instance_new(lib.class_SubModule))
         if prev is not None:       self.prev       = prev
         if next is not None:       self.next       = next
         if module is not None:     self.module     = module
         if importMode is not None: self.importMode = importMode

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, SubModule): value = SubModule(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, SubModule): value = SubModule(value)
      self.impl.next = value

   @property
   def module(self): return pyOrNewObject(Module, self.impl.module)
   @module.setter
   def module(self, value):
      if not isinstance(value, Module): value = Module(value)
      self.impl.module = value

   @property
   def importMode(self): return self.impl.importMode
   @importMode.setter
   def importMode(self, value): self.impl.importMode = value

class TemplateMemberType:
   dataMember = lib.TemplateMemberType_dataMember
   method     = lib.TemplateMemberType_method
   prop       = lib.TemplateMemberType_prop

class TemplateParameterType:
   type       = lib.TemplateParameterType_type
   identifier = lib.TemplateParameterType_identifier
   expression = lib.TemplateParameterType_expression
def checkConsistency(): lib.checkConsistency()
def checkMemory(): lib.checkMemory()
def getActiveDesigner(): lib.getActiveDesigner()
def getRuntimePlatform(): lib.getRuntimePlatform()
def locateModule(name, fileName): lib.locateModule(name, fileName)
def _print(*args): lib.print(*convertTypedArgs(args))
def printBuf(*args): lib.printBuf(*convertTypedArgs(args))
def printLn(*args): lib.printLn(*convertTypedArgs(args))
def printLnBuf(*args): lib.printLnBuf(*convertTypedArgs(args))
def printLnString(*args): lib.printLnString(*convertTypedArgs(args))
def printString(*args): lib.printString(*convertTypedArgs(args))
def setActiveDesigner(designer): lib.setActiveDesigner(ffi.NULL if designer is None else designer.impl)
def log2i(number): lib.log2i(number)
def memswap(a, b, size): lib.memswap(a, b, size)
def pow2i(number): lib.pow2i(number)
def qsortr(base, nel, width, compare, arg): lib.qsortr(base, nel, width, compare, arg)
def qsortrx(base, nel, width, compare, optCompareArgLast, arg, deref, ascending): lib.qsortrx(base, nel, width, compare, optCompareArgLast, arg, deref, ascending)
def queryMemInfo(string): lib.queryMemInfo(string)

class BinaryTree:
   def __init__(self, root = None, count = 0, CompareKey = None, FreeKey = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("BinaryTree *", impl)
      else:
         if isinstance(root, tuple):
            __tuple = root
            root = None
            if len(__tuple) > 0: root       = __tuple[0]
            if len(__tuple) > 1: count      = __tuple[1]
            if len(__tuple) > 2: CompareKey = __tuple[2]
            if len(__tuple) > 3: FreeKey    = __tuple[3]
         if root is not None:
            if not isinstance(root, BTNode): root = BTNode(root)
            root = root.impl
         self.impl = ffi.new("BinaryTree *", { 'root' : root, 'count' : count, 'CompareKey' : CompareKey, 'FreeKey' : FreeKey })

   @property
   def root(self): return self.impl.root
   @root.setter
   def root(self, value):
      if not isinstance(value, BTNode): value = BTNode(value)
      self.impl.root = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def CompareKey(self): return self.impl.CompareKey
   @CompareKey.setter
   def CompareKey(self, value): self.impl.CompareKey = value

   @property
   def FreeKey(self): return self.impl.FreeKey
   @FreeKey.setter
   def FreeKey(self, value): self.impl.FreeKey = value

   @property
   def first(self): return lib.BinaryTree_get_first(self.impl, value.impl)

   @property
   def last(self): return lib.BinaryTree_get_last(self.impl, value.impl)

   def add(self, node):
      if node is not None and not isinstance(node, BTNode): node = BTNode(node)
      if node is None: node = ffi.NULL
      lib.BinaryTree_add(ffi.cast("BinaryTree *", self.impl), node)

   def check(self):
      lib.BinaryTree_check(ffi.cast("BinaryTree *", self.impl))

   def compareInt(self, a, b):
      lib.BinaryTree_compareInt(ffi.cast("BinaryTree *", self.impl), a, b)

   def compareString(self, a, b):
      lib.BinaryTree_compareString(ffi.cast("BinaryTree *", self.impl), a.encode('utf8'), b.encode('utf8'))

   def delete(self, node):
      if node is not None and not isinstance(node, BTNode): node = BTNode(node)
      if node is None: node = ffi.NULL
      lib.BinaryTree_delete(ffi.cast("BinaryTree *", self.impl), node)

   def find(self, key):
      return pyOrNewObject(BTNode, lib.BinaryTree_find(self.impl, key))

   def findAll(self, key):
      return pyOrNewObject(BTNode, lib.BinaryTree_findAll(self.impl, key))

   def findPrefix(self, key):
      return pyOrNewObject(BTNode, lib.BinaryTree_findPrefix(self.impl, key.encode('utf8')))

   def findString(self, key):
      return pyOrNewObject(BTNode, lib.BinaryTree_findString(self.impl, key.encode('utf8')))

   def free(self):
      lib.BinaryTree_free(ffi.cast("BinaryTree *", self.impl))

   def freeString(self, string):
      lib.BinaryTree_freeString(ffi.cast("BinaryTree *", self.impl), string.encode('utf8'))

   def print(self, output, tps):
      lib.BinaryTree_print(ffi.cast("BinaryTree *", self.impl), output.encode('utf8'), tps)

   def remove(self, node):
      if node is not None and not isinstance(node, BTNode): node = BTNode(node)
      if node is None: node = ffi.NULL
      lib.BinaryTree_remove(ffi.cast("BinaryTree *", self.impl), node)

class BTNode:
   def __init__(self, key = None, parent = None, left = None, right = None, depth = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("BTNode *", lib.Instance_new(lib.class_BTNode))
         if key is not None:    self.key    = key
         if parent is not None: self.parent = parent
         if left is not None:   self.left   = left
         if right is not None:  self.right  = right
         if depth is not None:  self.depth  = depth

   @property
   def key(self): return self.impl.key
   @key.setter
   def key(self, value): self.impl.key = value

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value):
      if not isinstance(value, BTNode): value = BTNode(value)
      self.impl.parent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value):
      if not isinstance(value, BTNode): value = BTNode(value)
      self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value):
      if not isinstance(value, BTNode): value = BTNode(value)
      self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

   @property
   def prev(self): return lib.BTNode_get_prev(self.impl, value.impl)

   @property
   def next(self): return lib.BTNode_get_next(self.impl, value.impl)

   @property
   def minimum(self): return lib.BTNode_get_minimum(self.impl, value.impl)

   @property
   def maximum(self): return lib.BTNode_get_maximum(self.impl, value.impl)

   @property
   def count(self): return lib.BTNode_get_count(self.impl)

   @property
   def depthProp(self): return lib.BTNode_get_depthProp(self.impl)

   def findPrefix(self, key):
      return pyOrNewObject(BTNode, lib.BTNode_findPrefix(self.impl, key.encode('utf8')))

   def findString(self, key):
      return pyOrNewObject(BTNode, lib.BTNode_findString(self.impl, key.encode('utf8')))

class BackSlashEscaping(Bool):
   forArgsPassing = bool(lib.BackSlashEscaping_forArgsPassing)

class Item:
   def __init__(self, prev = None, next = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Item *", lib.Instance_new(lib.class_Item))
         if prev is not None: self.prev = prev
         if next is not None: self.next = next

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, Item): value = Item(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, Item): value = Item(value)
      self.impl.next = value

   def copy(self, src, size):
      if src is not None and not isinstance(src, Item): src = Item(src)
      if src is None: src = ffi.NULL
      lib.Item_copy(self.impl, src, size)

class Mutex:
   def __init__(self, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("Mutex *", lib.Instance_new(lib.class_Mutex))

   @property
   def lockCount(self): return lib.Mutex_get_lockCount(self.impl)

   @property
   def owningThread(self): return lib.Mutex_get_owningThread(self.impl)

   def release(self):
      lib.Mutex_release(self.impl)

   def wait(self):
      lib.Mutex_wait(self.impl)

class NamedItem:
   def __init__(self, prev = None, next = None, name = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("NamedItem *", lib.Instance_new(lib.class_NamedItem))
         if prev is not None: self.prev = prev
         if next is not None: self.next = next
         if name is not None: self.name = name

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, NamedItem): value = NamedItem(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, NamedItem): value = NamedItem(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

class NamedLink:
   def __init__(self, prev = None, next = None, name = None, data = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("NamedLink *", lib.Instance_new(lib.class_NamedLink))
         if prev is not None: self.prev = prev
         if next is not None: self.next = next
         if name is not None: self.name = name
         if data is not None: self.data = data

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, NamedLink): value = NamedLink(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, NamedLink): value = NamedLink(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

class NamedLink64:
   def __init__(self, prev = None, next = None, name = None, data = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("NamedLink64 *", lib.Instance_new(lib.class_NamedLink64))
         if prev is not None: self.prev = prev
         if next is not None: self.next = next
         if name is not None: self.name = name
         if data is not None: self.data = data

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, NamedLink64): value = NamedLink64(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, NamedLink64): value = NamedLink64(value)
      self.impl.next = value

   @property
   def name(self): return self.impl.name
   @name.setter
   def name(self, value): self.impl.name = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

class OldLink:
   def __init__(self, prev = None, next = None, data = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("OldLink *", lib.Instance_new(lib.class_OldLink))
         if prev is not None: self.prev = prev
         if next is not None: self.next = next
         if data is not None: self.data = data

   @property
   def prev(self): return self.impl.prev
   @prev.setter
   def prev(self, value):
      if not isinstance(value, OldLink): value = OldLink(value)
      self.impl.prev = value

   @property
   def next(self): return self.impl.next
   @next.setter
   def next(self, value):
      if not isinstance(value, OldLink): value = OldLink(value)
      self.impl.next = value

   @property
   def data(self): return self.impl.data
   @data.setter
   def data(self, value): self.impl.data = value

   def free(self):
      lib.OldLink_free(self.impl)

class OldList:
   def __init__(self, first = None, last = None, count = 0, offset = 0, circ = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("OldList *", impl)
      else:
         if isinstance(first, tuple):
            __tuple = first
            first = None
            if len(__tuple) > 0: first  = __tuple[0]
            if len(__tuple) > 1: last   = __tuple[1]
            if len(__tuple) > 2: count  = __tuple[2]
            if len(__tuple) > 3: offset = __tuple[3]
         self.impl = ffi.new("OldList *", { 'first' : first, 'last' : last, 'count' : count, 'offset' : offset, 'circ' : circ })

   @property
   def first(self): return self.impl.first
   @first.setter
   def first(self, value): self.impl.first = value

   @property
   def last(self): return self.impl.last
   @last.setter
   def last(self, value): self.impl.last = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def offset(self): return self.impl.offset
   @offset.setter
   def offset(self, value): self.impl.offset = value

   @property
   def circ(self): return self.impl.circ
   @circ.setter
   def circ(self, value): self.impl.circ = value

   def add(self, item):
      lib.OldList_add(ffi.cast("OldList *", self.impl), item)

   def addName(self, item):
      lib.OldList_addName(ffi.cast("OldList *", self.impl), item)

   def clear(self):
      lib.OldList_clear(ffi.cast("OldList *", self.impl))

   def copy(self, src, size, copy):
      if src is not None and not isinstance(src, OldList): src = OldList(src)
      src = ffi.NULL if src is None else src.impl
      lib.OldList_copy(ffi.cast("OldList *", self.impl), ffi.cast("OldList *", src), size)

   def delete(self, item):
      lib.OldList_delete(ffi.cast("OldList *", self.impl), item)

   def findLink(self, data):
      return pyOrNewObject(OldLink, lib.OldList_findLink(self.impl, data))

   def findName(self, name, warn):
      lib.OldList_findName(ffi.cast("OldList *", self.impl), name.encode('utf8'), warn)

   def findNamedLink(self, name, warn):
      lib.OldList_findNamedLink(ffi.cast("OldList *", self.impl), name.encode('utf8'), warn)

   def free(self, freeFn):
      lib.OldList_free(ffi.cast("OldList *", self.impl))

   def insert(self, prevItem, item):
      lib.OldList_insert(ffi.cast("OldList *", self.impl), prevItem, item)

   def move(self, item, prevItem):
      lib.OldList_move(ffi.cast("OldList *", self.impl), item, prevItem)

   def placeName(self, name, place):
      lib.OldList_placeName(ffi.cast("OldList *", self.impl), name.encode('utf8'), place)

   def remove(self, item):
      lib.OldList_remove(ffi.cast("OldList *", self.impl), item)

   def removeAll(self, freeFn):
      lib.OldList_removeAll(ffi.cast("OldList *", self.impl))

   def sort(self, compare, data):
      lib.OldList_sort(ffi.cast("OldList *", self.impl), data)

   def swap(self, item1, item2):
      lib.OldList_swap(ffi.cast("OldList *", self.impl), item1, item2)

class StringAllocType:
   pointer = lib.StringAllocType_pointer
   stack   = lib.StringAllocType_stack
   heap    = lib.StringAllocType_heap

class StringBTNode:
   def __init__(self, key = None, parent = None, left = None, right = None, depth = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("StringBTNode *", lib.Instance_new(lib.class_StringBTNode))
         if key is not None:    self.key    = key
         if parent is not None: self.parent = parent
         if left is not None:   self.left   = left
         if right is not None:  self.right  = right
         if depth is not None:  self.depth  = depth

   @property
   def key(self): return String(self.impl.key)
   @key.setter
   def key(self, value):
      if not isinstance(value, String): value = String(value)
      self.impl.key = value.impl

   @property
   def parent(self): return self.impl.parent
   @parent.setter
   def parent(self, value):
      if not isinstance(value, StringBTNode): value = StringBTNode(value)
      self.impl.parent = value

   @property
   def left(self): return self.impl.left
   @left.setter
   def left(self, value):
      if not isinstance(value, StringBTNode): value = StringBTNode(value)
      self.impl.left = value

   @property
   def right(self): return self.impl.right
   @right.setter
   def right(self, value):
      if not isinstance(value, StringBTNode): value = StringBTNode(value)
      self.impl.right = value

   @property
   def depth(self): return self.impl.depth
   @depth.setter
   def depth(self, value): self.impl.depth = value

class StringBinaryTree(BinaryTree):
   def __init__(self, root = None, count = 0, CompareKey = None, FreeKey = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("StringBinaryTree *", impl)
      else:
         if isinstance(root, tuple):
            __tuple = root
            root = None
            if len(__tuple) > 0: root       = __tuple[0]
            if len(__tuple) > 1: count      = __tuple[1]
            if len(__tuple) > 2: CompareKey = __tuple[2]
            if len(__tuple) > 3: FreeKey    = __tuple[3]
         if root is not None:
            if not isinstance(root, BTNode): root = BTNode(root)
            root = root.impl
         self.impl = ffi.new("StringBinaryTree *", { 'root' : root, 'count' : count, 'CompareKey' : CompareKey, 'FreeKey' : FreeKey })

   @property
   def root(self): return self.impl.root
   @root.setter
   def root(self, value):
      if not isinstance(value, BTNode): value = BTNode(value)
      self.impl.root = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def CompareKey(self): return self.impl.CompareKey
   @CompareKey.setter
   def CompareKey(self, value): self.impl.CompareKey = value

   @property
   def FreeKey(self): return self.impl.FreeKey
   @FreeKey.setter
   def FreeKey(self, value): self.impl.FreeKey = value

class TreePrintStyle:
   inOrder    = lib.TreePrintStyle_inOrder
   postOrder  = lib.TreePrintStyle_postOrder
   preOrder   = lib.TreePrintStyle_preOrder
   depthOrder = lib.TreePrintStyle_depthOrder

class ZString(Instance):
   def __init__(self,
                _string = None,
                len = None,
                allocType = None,
                size = None,
                minSize = None,
                maxSize = None,
                string = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if _string is not None:   self._string = _string
      if len is not None:       self.len = len
      if allocType is not None: self.allocType = allocType
      if size is not None:      self.size = size
      if minSize is not None:   self.minSize = minSize
      if maxSize is not None:   self.maxSize = maxSize
      if string is not None:    self.string = string

   @property
   def _string(self): return IPTR(lib, ffi, self, ZString)._string
   @_string.setter
   def _string(self, value): IPTR(lib, ffi, self, ZString)._string = value

   @property
   def len(self): return IPTR(lib, ffi, self, ZString).len
   @len.setter
   def len(self, value): IPTR(lib, ffi, self, ZString).len = value

   @property
   def allocType(self): return StringAllocType(impl = IPTR(lib, ffi, self, ZString).allocType)
   @allocType.setter
   def allocType(self, value): IPTR(lib, ffi, self, ZString).allocType = value.impl

   @property
   def size(self): return IPTR(lib, ffi, self, ZString).size
   @size.setter
   def size(self, value): IPTR(lib, ffi, self, ZString).size = value

   @property
   def minSize(self): return IPTR(lib, ffi, self, ZString).minSize
   @minSize.setter
   def minSize(self, value): IPTR(lib, ffi, self, ZString).minSize = value

   @property
   def maxSize(self): return IPTR(lib, ffi, self, ZString).maxSize
   @maxSize.setter
   def maxSize(self, value): IPTR(lib, ffi, self, ZString).maxSize = value

   @property
   def string(self): value = lib.ZString_get_string(self.impl); return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @string.setter
   def string(self, value):
      lib.ZString_set_string(self.impl, value.encode('utf8'))

   # here is a conversion
   # ZString_to_char_ptr
   # ZString_from_char_ptr

   def concat(self, s):
      if s is not None and not isinstance(s, ZString): s = ZString(s)
      if s is None: s = ffi.NULL
      lib.ZString_concat(self.impl, s)

   def concatf(self, format):
      lib.ZString_concatf(self.impl, format.encode('utf8'))

   def copy(self, s):
      if s is not None and not isinstance(s, ZString): s = ZString(s)
      if s is None: s = ffi.NULL
      lib.ZString_copy(self.impl, s)

   def copyString(self, value, newLen):
      lib.ZString_copyString(self.impl, value.encode('utf8'), newLen)
def changeCh(string, ch1, ch2): lib.changeCh(string, ch1, ch2)
def changeChars(string, chars, alt): lib.changeChars(string, chars, alt)
def changeExtension(string, ext, output): lib.changeExtension(string, ext, output)
def copyString(string): lib.copyString(string)
def floatFromString(string): lib.floatFromString(string)
def getCurrentThreadID(): lib.getCurrentThreadID()
def getExtension(string, output): lib.getExtension(string, output)
def getHexValue(buffer): lib.getHexValue(buffer)
def getLastDirectory(string, output): lib.getLastDirectory(string, output)
def getString(buffer, string, max): lib.getString(buffer, string, max)
def getValue(buffer): lib.getValue(buffer)
def iSO8859_1toUTF8(source, dest, max): lib.iSO8859_1toUTF8(source, dest, max)
def isPathInsideOf(path, of): lib.isPathInsideOf(path, of)
def makePathRelative(path, to, destination): lib.makePathRelative(path, to, destination)
def pathCat(string, addedPath): lib.pathCat(string, addedPath)
def pathCatSlash(string, addedPath): lib.pathCatSlash(string, addedPath)
def printBigSize(string, size, prec): lib.printBigSize(string, size, prec)
def printSize(string, size, prec): lib.printSize(string, size, prec)
def rSearchString(buffer, subStr, maxLen, matchCase, matchWord): lib.rSearchString(buffer, subStr, maxLen, matchCase, matchWord)
def repeatCh(string, count, ch): lib.repeatCh(string, count, ch)
def searchString(buffer, start, subStr, matchCase, matchWord): lib.searchString(buffer, start, subStr, matchCase, matchWord)
def splitArchivePath(fileName, archiveName, archiveFile): lib.splitArchivePath(fileName, archiveName, archiveFile)
def splitDirectory(string, part, rest): lib.splitDirectory(string, part, rest)
def stripExtension(string): lib.stripExtension(string)
def stripLastDirectory(string, output): lib.stripLastDirectory(string, output)
def stripQuotes(string, output): lib.stripQuotes(string, output)
def tokenize(string, maxTokens, tokens, esc): lib.tokenize(string, maxTokens, tokens, esc)
def tokenizeWith(string, maxTokens, tokens, tokenizers, escapeBackSlashes): lib.tokenizeWith(string, maxTokens, tokens, tokenizers, escapeBackSlashes)
def trimLSpaces(string, output): lib.trimLSpaces(string, output)
def trimRSpaces(string, output): lib.trimRSpaces(string, output)
def uTF16toUTF8(source): lib.uTF16toUTF8(source)
def uTF16toUTF8Buffer(source, dest, max): lib.uTF16toUTF8Buffer(source, dest, max)
def uTF32toUTF8Len(source, count, dest, max): lib.uTF32toUTF8Len(source, count, dest, max)
def uTF8GetChar(string, numBytes): lib.uTF8GetChar(string, numBytes)
def uTF8Validate(source): lib.uTF8Validate(source)
def uTF8toUTF16(source, wordCount): lib.uTF8toUTF16(source, wordCount)
def uTF8toUTF16Buffer(source, dest, max): lib.uTF8toUTF16Buffer(source, dest, max)
# hardcoded content
import math

def tan(x):
   if not isinstance(x, Angle): x = Angle(x)
   return math.tan(x.impl)
def sin(x):
   if not isinstance(x, Angle): x = Angle(x)
   return math.sin(x.impl)
def cos(x):
   if not isinstance(x, Angle): x = Angle(x)
   return math.cos(x.impl)

def atan(x):   return Angle(math.atan(x))
def sin(x):    return Angle(math.asin(x))
def cos(x):    return Angle(math.acos(x))

def log(x):    return math.log(x)
def log10(x):  return math.log10(x)
def pow(x, y): return math.pow(x, y)
def ceil(x):   return math.ceil(x)
def floor(x):  return math.floor(x)
# end of hardcoded content
