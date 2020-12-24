# -*- coding: utf-8 -*-
"""1.try.py ecere sample"""
#from eC import *
#from ecere import *
from ecere import GuiApplication, printLn
# driver="OpenGL"
app = GuiApplication(appGlobals=globals())
printLn("Testing Variadic Functions! ;)\n", 1, " + ", 2, " = ", 1+2)
printLn("Pi = ", 3.141592653589)
