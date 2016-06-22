from _pyEcere import *
import sys
import inspect
import os

app = ffi.NULL

def I18N(s):
   return ffi.string(lib.getTranslatedString(os.path.splitext(os.path.basename(inspect.getfile(sys._getframe(1))))[0].encode('utf8'), s.encode('utf8'), ffi.NULL        )).decode('utf8')
def I18NC(s, c):
   return ffi.string(lib.getTranslatedString(os.path.splitext(os.path.basename(inspect.getfile(sys._getframe(1))))[0].encode('utf8'), s.encode('utf8'), c.encode('utf8'))).decode('utf8')

def convertTypedArgs(args):
   cargs = ()
   for a in args:
      if type(a) == str:   cargs += (lib.class_String, ffi.new("char[]", a.encode('utf8')))
      if type(a) == int:   cargs += (lib.class_int,    ffi.new("int *", a))
      if type(a) == float: cargs += (lib.class_double, ffi.new("double *", a))
   return cargs + (ffi.NULL,)

def printLn(*args): lib.PrintLn(*convertTypedArgs(args))

class BorderBits:
   def __init__(self, this = None, contour = False, fixed = False, sizable = False, deep = False, bevel = False, thin = False):
      if this is not None:
         self.this = this
      else:
         self.this = (
            (contour << lib.BORDERBITS_contour_SHIFT) |
            (fixed   << lib.BORDERBITS_fixed_SHIFT)   |
            (sizable << lib.BORDERBITS_sizable_SHIFT) |
            (deep    << lib.BORDERBITS_deep_SHIFT)    |
            (bevel   << lib.BORDERBITS_bevel_SHIFT)   |
            (thin    << lib.BORDERBITS_thin_SHIFT) )

   @property
   def contour(self): return ((((self.value)) & lib.BORDERBITS_contour_MASK) >> lib.BORDERBITS_contour_SHIFT)
   @contour.setter
   def contour(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_contour_MASK)) | (((value)) << lib.BORDERBITS_contour_SHIFT)

   @property
   def fixed(self): return ((((self.value)) & lib.BORDERBITS_fixed_MASK) >> lib.BORDERBITS_fixed_SHIFT)
   @fixed.setter
   def fixed(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_fixed_MASK)) | (((value)) << lib.BORDERBITS_fixed_SHIFT)

   @property
   def sizable(self): return ((((self.value)) & lib.BORDERBITS_sizable_MASK) >> lib.BORDERBITS_sizable_SHIFT)
   @sizable.setter
   def sizable(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_sizable_MASK)) | (((value)) << lib.BORDERBITS_sizable_SHIFT)

   @property
   def deep(self): return ((((self.value)) & lib.BORDERBITS_deep_MASK) >> lib.BORDERBITS_deep_SHIFT)
   @deep.setter
   def deep(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_deep_MASK)) | (((value)) << lib.BORDERBITS_deep_SHIFT)

   @property
   def bevel(self): return ((((self.value)) & lib.BORDERBITS_bevel_MASK) >> lib.BORDERBITS_bevel_SHIFT)
   @bevel.setter
   def bevel(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_bevel_MASK)) | (((value)) << lib.BORDERBITS_bevel_SHIFT)

   @property
   def thin(self): return ((((self.value)) & lib.BORDERBITS_thin_MASK) >> lib.BORDERBITS_thin_SHIFT)
   @thin.setter
   def thin(self, value): self.value = ((self.value) & ~(lib.BORDERBITS_thin_MASK)) | (((value)) << lib.BORDERBITS_thin_SHIFT)

class BorderStyle(BorderBits):
   none         = BorderBits(this = lib.none)
   contour      = BorderBits(this = lib.contour)
   fixed        = BorderBits(this = lib.fixed)
   sizable      = BorderBits(this = lib.sizable)
   thin         = BorderBits(this = lib.thin)
   sizableThin  = BorderBits(this = lib.sizableThin)
   deep         = BorderBits(this = lib.deep)
   bevel        = BorderBits(this = lib.bevel)
   sizableDeep  = BorderBits(this = lib.sizableDeep)
   sizableBevel = BorderBits(this = lib.sizableBevel)
   fixedDeep    = BorderBits(this = lib.fixedDeep)
   fixedBevel   = BorderBits(this = lib.fixedBevel)
   deepContour  = BorderBits(this = lib.deepContour)

class Color:
   def __init__(self, r = 0, g = 0, b = 0):
      self.value = (r << lib.COLOR_r_SHIFT) | (g << lib.COLOR_g_SHIFT) | (b << lib.COLOR_b_SHIFT)

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

class FontResource:
   def __init__(self, faceName = None, size = None, outlineSize = None, outlineFade = None):
      self.this = lib.Instance_new(lib.class_FontResource)
      if faceName is not None:      self.faceName = faceName
      if size is not None:          self.size = size
      if outlineSize is not None:   self.outlineSize = outlineSize
      if outlineFade is not None:   self.outlineFade = outlineFade

   @property
   def faceName(self): return ffi.string(lib.FontResource_get_faceName(self.this)).decode('utf8')
   @faceName.setter
   def faceName(self, value): lib.FontResource_set_faceName(self.this, value.encode('utf8'))

   @property
   def size(self): return lib.FontResource_get_size(self.this)
   @size.setter
   def size(self, value): lib.FontResource_set_size(self.this, value)

   @property
   def outlineSize(self): return lib.FontResource_get_outlineSize(self.this)
   @outlineSize.setter
   def outlineSize(self, value): lib.FontResource_set_outlineSize(self.this, value)

   @property
   def outlineFade(self): return lib.FontResource_get_outlineFade(self.this)
   @outlineFade.setter
   def outlineFade(self, value): lib.FontResource_set_outlineFade(self.this, value)

   @property
   def size(self): return lib.FontResource_get_size(self.this)
   @size.setter
   def size(self, value): lib.FontResource_set_size(self.this, value)

class Size:
   def __init__(self, w = 0, h = 0):
      self.this = ffi.new("Size *")
      self.this.w = w
      self.this.h = h

class Point:
   def __init__(self, x = 0, y = 0):
      self.this = ffi.new("Point *")
      self.this.x = x
      self.this.y = y

class Instance:
   def __init__(self): self.this = ffi.NULL

@ffi.callback("void(Instance)")
def cb_Instance_destructor(w):
   instance = ffi.from_handle(ffi.cast("void **", ffi.cast("char *", w) + w._class.offset)[0])
   #print("Instance destroyed now!")
   instance.handle = 0

class Surface(Instance):
   def __init__(self, this = None):
      if this is not None:
         self.this = this

   def writeTextf(self, x, y, format):
      lib.Surface_writeTextf(self.this, x, y, format.encode('utf8'))

class Application(Instance):
   def __init__(self):
      self.this = lib.eC_init(True, True, len(sys.argv), [ffi.new("char[]", i.encode('utf8')) for i in sys.argv])
      lib.ecere_init(self.this)
      Window.pyClass_Window         = lib.eC_registerClass(lib.normalClass, "PyWindow"    .encode('utf8'), "Window"     .encode('utf8'), 8, 0, ffi.NULL, ffi.cast("void(*)(void *)", cb_Instance_destructor), self.this, lib.publicAccess, lib.publicAccess);
      Button.pyClass_Button         = lib.eC_registerClass(lib.normalClass, "PyButton"    .encode('utf8'), "Button"     .encode('utf8'), 8, 0, ffi.NULL, ffi.cast("void(*)(void *)", cb_Instance_destructor), self.this, lib.publicAccess, lib.publicAccess);
      MessageBox.pyClass_MessageBox = lib.eC_registerClass(lib.normalClass, "PyMessageBox".encode('utf8'), "MessageBox" .encode('utf8'), 8, 0, ffi.NULL, ffi.cast("void(*)(void *)", cb_Instance_destructor), self.this, lib.publicAccess, lib.publicAccess);

   def main(self):
      lib.Application_main(self.this)

class GuiApplication(Application):
   def __init__(self):
      Application.__init__(self)
      rApp = ffi.new("Instance *", self.this); lib.Instance_evolve(rApp, lib.class_GuiApplication); self.this = rApp[0]

@ffi.callback("void(Window, Surface)")
def cb_Window_onRedraw(w, s):
   window = ffi.from_handle(ffi.cast("void **", ffi.cast("char *", w) + w._class.offset)[0])
   surface = Surface(this = s)
   window.fn_onRedraw(window, surface)

class Window(Instance):
   def __init__(self,
      parent = None, caption = None, displayDriver = None,
      hasClose = None, hasMinimize = None, hasMaximize = None,
      borderStyle = None, clientSize = None, font = None, background = None, foreground = None, position = None):

      self.this = lib.Instance_new(Window.pyClass_Window)
      self.handle = ffi.new_handle(self)
      ffi.cast("void **", ffi.cast("char *", self.this) + self.this._class.offset)[0] = self.handle

      if parent is not None:        self.parent = parent
      if caption is not None:       self.caption = caption
      if displayDriver is not None: self.displayDriver = displayDriver
      if hasClose is not None:      self.hasClose = hasClose
      if hasMinimize is not None:   self.hasMinimize = hasMinimize
      if hasMaximize is not None:   self.hasMaximize = hasMaximize
      if borderStyle is not None:   self.borderStyle = borderStyle
      if clientSize is not None:    self.clientSize = clientSize
      if font is not None:          self.font = font
      if position is not None:      self.position = position
      if background is not None:    self.background = background
      if foreground is not None:    self.foreground = foreground

   #def __del__(self):
      #print("Window object is gone!")

   def create(self): lib.Window_create(self.this)
   def modal(self): lib.Window_modal(self.this)

   @property
   def parent(self): value = lib.Window_get_parent(self.this); return Window(this = value)
   @parent.setter
   def parent(self, value): lib.Window_set_parent(self.this, value.this)

   @property
   def position(self): value = Point(); lib.Window_get_position(self.this, value.this); return value
   @position.setter
   def position(self, value): lib.Window_set_position(self.this, value.this)

   @property
   def clientSize(self): value = Size(); lib.Window_get_size(self.this, value.this); return value
   @clientSize.setter
   def clientSize(self, value): lib.Window_set_size(self.this, value.this)

   @property
   def hasClose(self): value = lib.Window_get_hasClose(self.this); return value
   @hasClose.setter
   def hasClose(self, value): lib.Window_set_hasClose(self.this, value)

   @property
   def hasMaximize(self): value = lib.Window_get_hasMaximize(self.this); return value
   @hasMaximize.setter
   def hasMaximize(self, value): lib.Window_set_hasMaximize(self.this, value)

   @property
   def hasMinimize(self): value = lib.Window_get_hasMinimize(self.this); return value
   @hasMinimize.setter
   def hasMinimize(self, value): lib.Window_set_hasMinimize(self.this, value)

   @property
   def borderStyle(self): value = lib.Window_get_borderStyle(self.this); return BorderStyle(this = value)
   @borderStyle.setter
   def borderStyle(self, value): lib.Window_set_borderStyle(self.this, value.this)

   @property
   def caption(self): value = lib.Window_get_caption(self.this); return ffi.string(value).decode('utf8')
   @caption.setter
   def caption(self, value): lib.Window_set_caption(self.this, value.encode('utf8'))

   @property
   def displayDriver(self): value = lib.Window_get_displayDriver(self.this); return ffi.string(value).decode('utf8')
   @displayDriver.setter
   def displayDriver(self, value): lib.Window_set_displayDriver(self.this, value.encode('utf8'))

   @property
   def foreground(self): value = Color(); lib.Window_get_foreground(self.this, value.this); return value
   @foreground.setter
   def foreground(self, value): lib.Window_set_foreground(self.this, value.value)

   @property
   def background(self): value = Color(); lib.Window_get_background(self.this, value.this); return value
   @background.setter
   def background(self, value): lib.Window_set_background(self.this, value.value)

   @property
   def font(self): value = lib.Window_get_font(self.this); return FontResource(this = value)
   @font.setter
   def font(self, value): lib.Window_set_font(self.this, value.this)

   @property
   def onRedraw(self): return self.fn_onRedraw
   @onRedraw.setter
   def onRedraw(self, value):
      self.fn_onRedraw = value
      lib.Instance_setMethod(self.this, "OnRedraw".encode('utf8'), cb_Window_onRedraw);

@ffi.callback("bool(Window, Button, int, int, Modifiers)")
def cb_Button_notifyClicked(m, b, x, y, mods):
   button = ffi.from_handle(ffi.cast("void **", ffi.cast("char *", b) + b._class.offset)[0])
   master = ffi.from_handle(ffi.cast("void **", ffi.cast("char *", m) + m._class.offset)[0])
   button.fn_notifyClicked(master, button, x, y, mods)
   return True

class Button(Window):
   def __init__(self, parent = None, caption = None, position = None, font = None, notifyClicked = None):
      self.this = lib.Instance_new(Button.pyClass_Button)
      self.handle = ffi.new_handle(self)
      ffi.cast("void **", ffi.cast("char *", self.this) + self.this._class.offset)[0] = self.handle

      if parent is not None:        self.parent = parent
      if caption is not None:       self.caption = caption
      if position is not None:      self.position = position
      if font is not None:          self.font = font
      if notifyClicked is not None: self.notifyClicked = notifyClicked

   @property
   def notifyClicked(self): return self.fn_notifyClicked
   @notifyClicked.setter
   def notifyClicked(self, value):
      self.fn_notifyClicked = value
      lib.Instance_setMethod(self.this, "NotifyClicked".encode('utf8'), cb_Button_notifyClicked);

class MessageBox(Window):
   def __init__(self, parent = None, caption = None, contents = None, position = None):
      self.this = lib.Instance_new(MessageBox.pyClass_MessageBox)
      self.handle = ffi.new_handle(self)
      ffi.cast("void **", ffi.cast("char *", self.this) + self.this._class.offset)[0] = self.handle

      if parent is not None:       self.parent = parent
      if caption is not None:      self.caption = caption
      if contents is not None:     self.contents = contents
      if position is not None:     self.position = position

   @property
   def contents(self): value = lib.MessageBox_get_contents(self.this); return ffi.string(value).decode('utf8')
   @contents.setter
   def contents(self, value): lib.MessageBox_set_contents(self.this, value.encode('utf8'))
