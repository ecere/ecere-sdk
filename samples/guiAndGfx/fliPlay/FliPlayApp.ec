/****************************************************************************
   FLC/FLI Player

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   FliPlayApp.ec - Main Module
****************************************************************************/
import "fliPlay"

class FliPlayApp : GuiApplication
{   
   appName = "ECERE FLC Player";

   // driver = "OpenGL";
   // driver = "Direct3D";

   bool Init()
   {
      if(argc>1)
      {
         FliPlay
         {
            borderStyle = sizable, hasClose = true, hasMaximize = true, hasMinimize = true, 
            text = "ECERE FLC Player", anchor = { left = 0.125, top = 0.125, right = 0.125, bottom = 0.125 },
            animation = argv[1]
         };
      }
      else
         Log("Syntax:\n   FLIPLAY <FLI/FLC Movie>\n");
      return true;
   }
}
