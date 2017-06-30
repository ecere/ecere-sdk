# -*- coding: utf-8 -*-
"""2.sample.py pyecere sample"""
from pyecere import *
# driver = "OpenGL"
app = GuiApplication(appGlobals=globals())
printLn("Testing Variadic Functions!\n", 1, " + ", 2, " = ", 1+2)
printLn("Pi = ", 3.141592653589)

a = Array("<int>")
a.add(3)
a.add(4)
a.add(5)
printLn(a)

#b = Array("<int>", [6, 7, 8])
#printLn(b)

#c = Array("<double>", [3.4, 5.6, 1.4142135])
#printLn(c)

class MyThing:
   def something(self):
      pass

class MyController(WindowController):
   def  __init__(self):
      WindowController.__init__(self, "<MyThing>")

@regclass
class MyForm(Window):
   def __init__(self):
      Window.__init__(self,
                      displayDriver="OpenGL",
                      caption=I18N("Hello, Python!!"),
                      hasClose=True,
                      hasMaximize=True,
                      hasMinimize=True,
                      controller=MyController(),
                      borderStyle=BorderStyle.sizable,
                      clientSize=Size(640, 480),
                      background=ColorAlpha(a=255, color=Color(b=255)),
                      foreground=ColorAlpha(a=255, color=Color(r=235, b=115, g=200)),
                      font=FontResource("Merriweather", 30, outlineSize=4.0, outlineFade=0.2))
      printLn("end of MyForm(Window) __init__")

      def myOnRedraw(self, surface):
         surface.writeTextf(20, 20, I18N("Writing Stuff on the wall!!"))
      self.onDrawOverChildren = myOnRedraw

      def button1Clicked(self, button, x, y, mods):
         printLn("I got pushed! (master is ", self.caption, ")")
         self.background = ColorAlpha(a=255, color=Color(b=255, g=192, r=64))
         MessageBox(caption=I18N("Hello, Python!"),
                    contents=I18N("Python is pretty nifty.")).modal()
         self.button2.notifyClicked(self, button, x, y, mods)
         return True

      self.picture1 = Picture(parent=self, anchor=Anchor(0, 0, 0, 0),
                              image=BitmapResource("picture.jpg"))

      self.button1 = Button(
          parent=self,
          caption=I18N("Push It!"),
          position=Point(80, 80),
          font=FontResource("Merriweather", 30),
          notifyClicked=button1Clicked)

      self.button2 = Button(
          parent=self,
          caption="Another button",
          position=Point(280, 280),
          font=FontResource("Merriweather", 20),
          size=Size(160, 40))

MyForm()

Window(
   caption = "Bindings are cool, 中文 too!",
   hasClose = True,
   clientSize = Size(320, 200),
   background = ColorAlpha(a = 255, color = Color(255)))

printLn("app.main()")
app.main()
