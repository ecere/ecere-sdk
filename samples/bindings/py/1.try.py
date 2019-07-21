# -*- coding: utf-8 -*-
"""1.try.py pyecere sample"""
#from pyeC import *
#from pyecere import *
from pyecere import GuiApplication, printLn
# driver="OpenGL"
app = GuiApplication(appGlobals=globals())
printLn("Testing Variadic Functions! ;)\n", 1, " + ", 2, " = ", 1+2)
printLn("Pi = ", 3.141592653589)
