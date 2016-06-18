import sys
from _pyEcere import *

#   lib.PrintLn(lib.class_String, fun.encode('utf8'), ffi.NULL)

def app_init():
   app = lib.eC_init(True, len(sys.argv), [ffi.new("char[]", i.encode('utf8')) for i in sys.argv])
   lib.ecere_init(app)
   rApp = ffi.new("Instance *"); rApp[0] = app; lib.Instance_evolve(rApp, lib.class_GuiApplication); app = rApp[0]

class Size:
   def __init__(self, w = 0, h = 0):
      self.this = ffi.new("Size *")
      self.this.w = w
      self.this.h = h

class Instance(object):
   def __init__(self): self.this = ffi.NULL

class Window(Instance):
   def __init__(self, hasClose = None, clientSize = None):
      self.this = lib.Instance_new(lib.class_Window)
      if hasClose != None:     self.hasClose = hasClose
      if clientSize != None:   self.clientSize = clientSize

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
