import sys
from _pyEcere import *

def convertTypedArgs(args):
   cargs = ()
   for a in args:
      if type(a) == str:   cargs += (lib.class_String, ffi.new("char[]", a.encode('utf8')))
      if type(a) == int:   cargs += (lib.class_int,    ffi.new("int *", a))
      if type(a) == float: cargs += (lib.class_double, ffi.new("double *", a))
   return cargs + (ffi.NULL,)

def printLn(*args): lib.PrintLn(*convertTypedArgs(args))

class Color:
   def __init__(self, r = 0, g = 0, b = 0):
      self.value = ((((r)) << lib.COLOR_r_SHIFT) | ((g) << lib.COLOR_g_SHIFT) | ((b)) << lib.COLOR_b_SHIFT)

   @property
   def r(self): return ((((self.value)) & lib.COLOR_r_MASK) >> lib.COLOR_r_SHIFT)
   @r.setter
   def r(self, value): self.value = ((self.value) & ~(lib.COLOR_r_MASK)) | (((value)) << lib.COLOR_r_SHIFT)

   @property
   def g(self): return ((((self.value)) & lib.COLOR_g_MASK) >> lib.COLOR_g_SHIFT)
   @g.setter
   def g(self, value): self.value = ((self.value) & ~(lib.COLOR_g_MASK)) | (((value)) << lib.COLOR_g_SHIFT)

   @property
   def b(self): return ((((self.value)) & lib.COLOR_b_MASK) >> lib.COLOR_r_SHIFT)
   @b.setter
   def b(self, value): self.value = ((self.value) & ~(lib.COLOR_b_MASK)) | (((value)) << lib.COLOR_b_SHIFT)

class Size:
   def __init__(self, w = 0, h = 0):
      self.this = ffi.new("Size *")
      self.this.w = w
      self.this.h = h

class Instance(object):
   def __init__(self): self.this = ffi.NULL

class Application(Instance):
   def __init__(self):
      self.this = lib.eC_init(True, len(sys.argv), [ffi.new("char[]", i.encode('utf8')) for i in sys.argv])
      lib.ecere_init(self.this)

   def main(self):
      lib.Application_main(self.this)

class GuiApplication(Application):
   def __init__(self):
      Application.__init__(self)
      rApp = ffi.new("Instance *"); rApp[0] = self.this; lib.Instance_evolve(rApp, lib.class_GuiApplication); self.this = rApp[0]

class Window(Instance):
   def __init__(self, caption = None, hasClose = None, clientSize = None, background = None):
      self.this = lib.Instance_new(lib.class_Window)
      if caption != None:      self.caption = caption
      if hasClose != None:     self.hasClose = hasClose
      if clientSize != None:   self.clientSize = clientSize
      if background != None:   self.background = background

   def create(self): lib.Window_create(self.this)
   def modal(self): lib.Window_modal(self.this)

   @property
   def clientSize(self): value = Size(); lib.Window_get_size(self.this, value.this); return value
   @clientSize.setter
   def clientSize(self, value): lib.Window_set_size(self.this, value.this)

   @property
   def hasClose(self): value = ffi.new("bool *"); lib.Window_get_hasClose(self.this, value); return value
   @hasClose.setter
   def hasClose(self, value): lib.Window_set_hasClose(self.this, value)

   @property
   def caption(self): value = lib.Window_get_caption(self.this); return ffi.string(value).decode('utf8')
   @caption.setter
   def caption(self, value): lib.Window_set_caption(self.this, value.encode('utf8'))

   @property
   def background(self): value = Color(); lib.Window_get_background(self.this, value.this); return value
   @background.setter
   def background(self, value): lib.Window_set_background(self.this, value.value)
