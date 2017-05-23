from _pyecere import *
import sys
import inspect
import os

app = ffi.NULL

class Instance:
   instances = []
   def __init__(self, templateParams = None, this = None):
      if this is None:
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

            self.this = lib.Instance_newEx(template, False)
         else:
            self.this = lib.Instance_newEx(pyClass, False)
      else:
         self.this = this
      Instance.instances.append(self)
      self.handle = ffi.new_handle(self)
      ffi.cast("void **", ffi.cast("char *", self.this) + self.this._class.offset)[0] = self.handle

def pyObject(eCObject):
   handle = ffi.cast("void **", ffi.cast("char *", eCObject) + eCObject._class.offset)[0]
   if handle != ffi.NULL: return ffi.from_handle(handle)
   return None

@ffi.callback("void(Instance)")
def cb_Instance_destructor(i):
   instance = pyObject(i)
   if instance is not None:
      Instance.instances.remove(instance)
      instance.handle = 0
   else:
      print("No matching instance! for", ffi.string(i._class.name).decode('utf8'))

@ffi.callback("bool(Instance, bool)")
def cb_Instance_constructor(i, a):
   s = (ffi.string(i._class.name).decode('utf8'))[2:]
   if a: globals()[s](this = i)
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
      if isinstance(a, Instance):   cargs += (a.this._class, a.this)
   return cargs + (ffi.NULL,)

def printLn(*args): lib.printLn(*convertTypedArgs(args))

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
   none         = BorderBits(this = lib.BorderStyle_none)
   contour      = BorderBits(this = lib.BorderStyle_contour)
   fixed        = BorderBits(this = lib.BorderStyle_fixed)
   sizable      = BorderBits(this = lib.BorderStyle_sizable)
   thin         = BorderBits(this = lib.BorderStyle_thin)
   sizableThin  = BorderBits(this = lib.BorderStyle_sizableThin)
   deep         = BorderBits(this = lib.BorderStyle_deep)
   bevel        = BorderBits(this = lib.BorderStyle_bevel)
   sizableDeep  = BorderBits(this = lib.BorderStyle_sizableDeep)
   sizableBevel = BorderBits(this = lib.BorderStyle_sizableBevel)
   fixedDeep    = BorderBits(this = lib.BorderStyle_fixedDeep)
   fixedBevel   = BorderBits(this = lib.BorderStyle_fixedBevel)
   deepContour  = BorderBits(this = lib.BorderStyle_deepContour)

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

class ColorAlpha:
   def __init__(self, a = 0, color = Color()):
      self.value = (a << lib.COLORALPHA_a_SHIFT) | (color.value << lib.COLORALPHA_color_SHIFT)

   @property
   def a(self): return ((((self.value)) & lib.COLORALPHA_a_MASK) >> lib.COLORALPHA_a_SHIFT)
   @a.setter
   def a(self, value): self.value = ((self.value) & ~(lib.COLORALPHA_a_MASK)) | (((value)) << lib.COLORALPHA_a_SHIFT)

   @property
   def color(self): return ((((self.value)) & lib.COLORALPHA_color_MASK) >> lib.COLORALPHA_color_SHIFT)
   @color.setter
   def color(self, value): self.value = ((self.value) & ~(lib.COLORALPHA_color_MASK)) | (((value)) << lib.COLORALPHA_color_SHIFT)

class BitmapResource:
   def __init__(self, fileName = None, this = None):
      Instance.__init__(self, this = this)
      if fileName is not None:      self.fileName = fileName

   @property
   def fileName(self): return ffi.string(lib.BitmapResource_get_fileName(self.this)).decode('utf8')
   @fileName.setter
   def fileName(self, value): lib.BitmapResource_set_fileName(self.this, value.encode('utf8'))

class FontResource(Instance):
   def __init__(self, faceName = None, size = None, outlineSize = None, outlineFade = None, this = None):
      Instance.__init__(self, this = this)
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

class Surface(Instance):
   def __init__(self, this = None):
      Instance.__init__(self, this = this)

   def writeTextf(self, x, y, format):
      lib.Surface_writeTextf(self.this, x, y, format.encode('utf8'))

class Application(Instance):
   def registerClass(module, n):
      pyClass =  lib.eC_registerClass(lib.ClassType_normalClass, ("Py" + n.__name__).encode('utf8'), n.__name__.encode('utf8'), 8, 0,
         ffi.cast("bool(*)(void *)", cb_Instance_constructor),
         ffi.cast("void(*)(void *)", cb_Instance_destructor),
         module.this, lib.AccessMode_publicAccess, lib.AccessMode_publicAccess);
      setattr(n, 'pyClass_' + n.__name__, pyClass)
      pyClass.bindingsClass = ffi.new_handle(n)

   def __init__(self):
      self.this = lib.eC_init(ffi.NULL, True, True, len(sys.argv), [ffi.new("char[]", i.encode('utf8')) for i in sys.argv])
      lib.ecere_init(self.this)
      self.registerClass(Instance)
      self.registerClass(Container)
      self.registerClass(Array)
      self.registerClass(Surface)
      self.registerClass(FontResource)
      self.registerClass(BitmapResource)
      self.registerClass(Window)
      self.registerClass(Button)
      self.registerClass(Picture)
      self.registerClass(MessageBox)
      self.registerClass(WindowController)

   def main(self):
      lib.Application_main(self.this)

class GuiApplication(Application):
   def __init__(self, driver = None):
      Application.__init__(self)
      rApp = ffi.new("Instance *", self.this); lib.Instance_evolve(rApp, lib.class_GuiApplication); self.this = rApp[0]
      if driver is not None: self.driver = driver

   @property
   def driver(self): value = lib.GuiApplication_get_driver(self.this); return ffi.string(value).decode('utf8')
   @driver.setter
   def driver(self, value): lib.GuiApplication_set_driver(self.this, value.encode('utf8'))

class Anchor:
   def __init__(self, left = None, right = None, top = None, bottom = None, horz = None, vert = None):
      self.this = ffi.new("Anchor *")
      # Would generate conversion properties here instead?
      if left is not None:
         if type(left) == int:
            self.this.left.type = lib.AnchorValueType_offset
            self.this.left.distance = left
         elif type(left) == float:
            self.this.left.type = lib.AnchorValueType_relative
            self.this.left.distance = left
      if right is not None:
         if type(right) == int:
            self.this.right.type = lib.AnchorValueType_offset
            self.this.right.distance = right
         elif type(right) == float:
            self.this.right.type = lib.AnchorValueType_relative
            self.this.right.distance = right
      if top is not None:
         if type(top) == int:
            self.this.top.type = lib.AnchorValueType_offset
            self.this.top.distance = top
         elif type(top) == float:
            self.this.top.type = lib.AnchorValueType_relative
            self.this.top.distance = top
      if bottom is not None:
         if type(bottom) == int:
            self.this.bottom.type = lib.AnchorValueType_offset
            self.this.bottom.distance = bottom
         elif type(bottom) == float:
            self.this.bottom.type = lib.AnchorValueType_relative
            self.this.bottom.distance = bottom
      if horz is not None:
         if type(horz) == int:
            self.this.horz.type = lib.AnchorValueType_offset
            self.this.horz.distance = horz
         elif type(horz) == float:
            self.this.horz.type = lib.AnchorValueType_relative
            self.this.horz.distance = horz
      if vert is not None:
         if type(vert) == int:
            self.this.vert.type = lib.AnchorValueType_offset
            self.this.vert.distance = vert
         elif type(vert) == float:
            self.this.vert.type = lib.AnchorValueType_relative
            self.this.vert.distance = vert

@ffi.callback("void(Window, Surface)")
def cb_Window_onRedraw(w, s):
   window = pyObject(w)
   window.fn_onRedraw(window, Surface(this = s))

@ffi.callback("void(Window, Surface)")
def cb_Window_onDrawOverChildren(w, s):
   window = pyObject(w)
   window.fn_onDrawOverChildren(window, Surface(this = s))

class Window(Instance):
   def __init__(self,
      parent = None, caption = None, displayDriver = None,
      hasClose = None, hasMinimize = None, hasMaximize = None,
      controller = None,
      borderStyle = None, clientSize = None, font = None, background = None, foreground = None, position = None):

      Instance.__init__(self)

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
      if controller is not None:    self.controller = controller

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
   def anchor(self): value = Anchor(); lib.Window_get_anchor(self.this, value.this); return value
   @anchor.setter
   def anchor(self, value): lib.Window_set_anchor(self.this, value.this)

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
   def foreground(self): value = ColorAlpha(); lib.Window_get_foreground(self.this, value.this); return value
   @foreground.setter
   def foreground(self, value): lib.Window_set_foreground(self.this, value.value)

   @property
   def background(self): value = ColorAlpha(); lib.Window_get_background(self.this, value.this); return value
   @background.setter
   def background(self, value): lib.Window_set_background(self.this, value.value)

   @property
   def font(self): value = lib.Window_get_font(self.this); return FontResource(this = value)
   @font.setter
   def font(self, value): lib.Window_set_font(self.this, value.this)

   @property
   def controller(self): value = lib.Window_get_controller(self.this); return Window(this = value)
   @controller.setter
   def controller(self, value): lib.Window_set_controller(self.this, value.this)

   @property
   def onRedraw(self): return self.fn_onRedraw
   @onRedraw.setter
   def onRedraw(self, value):
      self.fn_onRedraw = value
      lib.Instance_setMethod(self.this, "OnRedraw".encode('utf8'), cb_Window_onRedraw);

   @property
   def onDrawOverChildren(self): return self.fn_onDrawOverChildren
   @onDrawOverChildren.setter
   def onDrawOverChildren(self, value):
      self.fn_onDrawOverChildren = value
      lib.Instance_setMethod(self.this, "OnDrawOverChildren".encode('utf8'), cb_Window_onDrawOverChildren);

@ffi.callback("bool(Window, Button, int, int, Modifiers)")
def cb_Button_notifyClicked(m, b, x, y, mods):
   button = pyObject(b)
   button.fn_notifyClicked(pyObject(m), button, x, y, mods)
   return True

class Button(Window):
   def __init__(self, parent = None, caption = None, position = None, font = None, notifyClicked = None):
      Instance.__init__(self)

      if parent is not None:        self.parent = parent
      if caption is not None:       self.caption = caption
      if position is not None:      self.position = position
      if font is not None:          self.font = font
      if notifyClicked is not None: self.notifyClicked = notifyClicked

   def fn_unset_notifyClicked(self, m, b, x, y, mods):
      return lib.Button_notifyClicked(self.this, m.this, b.this, x, y, mods);

   @property
   def notifyClicked(self):
      if hasattr(self, 'fn_notifyClicked'):
         return self.fn_notifyClicked;
      else:
         return self.fn_unset_notifyClicked;

   @notifyClicked.setter
   def notifyClicked(self, value):
      self.fn_notifyClicked = value
      lib.Instance_setMethod(self.this, "NotifyClicked".encode('utf8'), cb_Button_notifyClicked);

class Picture(Window):
   def __init__(self, parent = None, caption = None, image = None, position = None, anchor = None):
      Instance.__init__(self)

      if parent is not None:       self.parent = parent
      if caption is not None:      self.caption = caption
      if image is not None:        self.image = image
      if position is not None:     self.position = position
      if anchor is not None:       self.anchor = anchor

   @property
   def image(self): value = lib.Picture_get_image(self.this); return BitmapResource(this = value)
   @image.setter
   def image(self, value): lib.Picture_set_image(self.this, value.this)

class MessageBox(Window):
   def __init__(self, parent = None, caption = None, contents = None, position = None):
      Instance.__init__(self)

      if parent is not None:       self.parent = parent
      if caption is not None:      self.caption = caption
      if contents is not None:     self.contents = contents
      if position is not None:     self.position = position

   @property
   def contents(self): value = lib.MessageBox_get_contents(self.this); return ffi.string(value).decode('utf8')
   @contents.setter
   def contents(self, value): lib.MessageBox_set_contents(self.this, value.encode('utf8'))

class WindowController(Instance):
   def __init__(self, templateParams = None):
      Instance.__init__(self, templateParams)

def TA(a):
   if type(a) == int:            return lib.TAi(a)
   if type(a) == float:          return lib.TAf(a)
   if isinstance(a, Instance):   return lib.TAo(a.this)
   return 0

class Container(Instance):
   def __init__(self, templateParams = None, copySrc = None):
      Instance.__init__(self, templateParams)
      if copySrc is not None: self.copySrc = copySrc

   def add(self, value):
      lib.Container_add(self.this, TA(value))

   @property
   def copySrc(self): return lib.Container_get_copySrc(self.this)
   @copySrc.setter
   def copySrc(self, value):
      if isinstance(value, Container): lib.Container_set_copySrc(self.this, value)
      if isinstance(value, list):
         bic = ffi.new("BuiltInContainer *")
         bic._vTbl = lib.class_BuiltInContainer._vTbl
         bic._class = lib.class_BuiltInContainer
         bic._refCount = 0
         bic.count = len(value)
         if type(value[0]) == int:
            bic.data = ffi.new("int[]", value)
            bic.type = lib.class_int
         if type(value[0]) == float:
            bic.data = ffi.new("double[]", value)
            bic.type = lib.class_double
         lib.Container_set_copySrc(self.this, ffi.cast("Container", bic))

class Array(Container):
   def __init__(self, templateParams = None, copySrc = None):
      Container.__init__(self, templateParams, copySrc)
