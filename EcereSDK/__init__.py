"""attempt at a monolithic ecere package"""

from EcereSDK.eC import *
from EcereSDK.ecere import *
from EcereSDK.EDA import *

__all__ = [ 'eC', 'ecere', 'EDA' ]

# wondering if this could be here?
# app = GuiApplication(appGlobals=globals())
