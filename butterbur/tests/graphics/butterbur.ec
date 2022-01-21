import "ecere"

import "GraphicalSurface"
import "GraphicalPresentation"

define joinType = LineJoin::miter;
define capType = LineCap::round;

class ButterburTest : Window
{
   displayDriver = "OpenGL";
   caption = $"Butterbur's Humble Beginnings";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 800, 600 };

   ButterburTest()
   {
      int i;

      //return true;
      Array<Pointf> points { [ { 350, 200 }, { 400, 250 }, { 300, 250 } ] };
      float px = 250, py = 150;

      /*for(i = 0; i < 8; i++)
      {
         Array<Pointf> tPoints { size = points.count };
         int j;
         Degrees a = i * 45;
         for(j = 0; j < tPoints.count; j++)
         {
            tPoints[j] =
            {
               (float)((points[j].x - px) * cos(a) + (points[j].y - py) * sin(a) + px + 50),
               (float)((points[j].y - py) * cos(a) - (points[j].x - px) * sin(a) + py + 50)
            };
         }
         GraphicalPresentation
         {
            scene, graphic = Path
            {
               nodes = tPoints;
               stroke = { blue, width = 20, cap = round, join = round };
            };
         };
      }*/

      points = { [ { 400, 250 }, { 500, 240 }, { 300, 245 }, { 350, 200 } ] };

      for(i = 0; i < 8; i++)
      {
         Array<Pointf> tPoints { size = points.count };
         int j;
         Degrees a = i * 45;
         for(j = 0; j < tPoints.count; j++)
         {
            tPoints[j] =
            {
               (float)((points[j].x - px) * cos(a) + (points[j].y - py) * sin(a) + px + 150),
               (float)((points[j].y - py) * cos(a) - (points[j].x - px) * sin(a) + py + 150)
            };


         }
         /*GraphicalPresentation
         {
            scene, graphic = Path
            {
               nodes = tPoints;
               stroke = { green, width = 20, cap = round, join = round };
            };
         };
         GraphicalPresentation
         {
            scene, graphic = Path
            {
               nodes = tPoints;
               stroke = { red, width = 2, cap = round, join = round };
            };
         };*/
      }

      //loadImage();

   }

   GraphicalSurface gSurface { };
   MultiPresentation scene { gSurface, pickable = true };
   #define sx ( 1 / 128.0) //256.0f )
   #define sy ( 1 / 128.0) /// 256.0f )
   /*#define sx ( 1 / 64.0 )
   #define sy ( 1 / 64.0  )
   */
   #define sWidth 20 //(25378.6113 / 256.0f)

   #define tx  356
   #define ty  256

   Image imageGE { image = { "../../../installer/ecere.png" }, scaling = 1, hotSpot = { 0, 0.5 }, position2D = { 100, 100 } };
   GraphicalPresentation imagePresentation {/*gSurface*/ scene, pickable = true, graphic = imagesGE };

   // NOTE: both use scene?
   MultiGraphicalElement imagesGE { elements = {} };
   Image imGE1 { parent = imagesGE, image = { "../../../installer/ecere.png" }, scaling = 1, hotSpot = { 0, 0.5 }, position2D = { 100, 100 } };
   Image imGE2 { parent = imagesGE, image = { "../../../installer/ecere.png" }, scaling = 1, hotSpot = { 0, 0.5 }, position2D = { 300, 300 } };
/*

   GraphicalPresentation
   {
      scene, graphic = Path
      {
         //nodes = [ { 21230 * sy + ty, -32767 * sx + tx }, { 21230 * sy + ty, -6726 * sx + tx }, { 21070 * sy + ty, 27258 * sx + tx }, { 21045 * sy + ty, 32767 * sx + tx } ];

         nodes = [ { 21230 * sy + ty, -32767 * sx + tx }, { 21230 * sy + ty, -6726 * sx + tx }, { 21070 * sy + ty, 27258 * sx + tx }, { 21045 * sy + ty, 32767 * sx + tx } ];

         //nodes = [ { 21230 * sy + ty, -6726 * sx + tx }, { 21070 * sy + ty, 27258 * sx + tx }, { 21045 * sy + ty, 32767 * sx + tx } ];
         //nodes = [ { 21230 * sy + ty, -32767 * sx + tx }, { 21230 * sy + ty, -6726 * sx + tx }, { 21070 * sy + ty, 27258 * sx + tx } ];
         // nodes = [ { 21230 * sy + ty, -6726 * sx + tx }, { 21070 * sy + ty, 27258 * sx + tx } ];
         //nodes = [ { 21230 * sy + ty, -32767 * sx + tx }, { 21230 * sy + ty, -6726 * sx + tx } ];
         //nodes = [ { 21070 * sy + ty, 27258 * sx + tx }, { 21045 * sy + ty, 32767 * sx + tx } ];
         stroke = { red, width = sWidth, cap = round, join = round };
      };
   };

   GraphicalPresentation
   {
      scene, graphic = Path
      {
         nodes = [ { 21230 * sy + ty, -32767 * sx + tx }, { 21230 * sy + ty, 32767 * sx + tx } ];
         stroke = { blue, width = sWidth, cap = round, join = round };
      };
   };

   GraphicalPresentation
   {
      scene, graphic = Path
      {
         nodes = [ { 21045 * sy + ty, -32767 * sx + tx }, { 20743 * sy + ty, 32767 * sx + tx } ];
         stroke = { green, width = sWidth, cap = round, join = round };
      };
   };
   */

   /*
   GraphicalPresentation
   {
      scene, graphic = Path
      {
         nodes = [ { -32767 * sx + tx, 21230 * sy + ty }, { -6726 * sx + tx, 21230 * sy + ty }, { 27258 * sx + tx, 21070 * sy + ty }, { 32767 * sx + tx, 21045 * sy + ty } ];
         stroke = { red, width = 20, cap = round, join = round };
      };
   };*/
   /*
   GraphicalPresentation
   {
      scene, graphic = Path
      {
         nodes = [ { -32767 * sx + tx, 21230 * sy + ty }, { 32767 * sx + tx, 21230 * sy + ty } ];
         stroke = { blue, width = 10, cap = round, join = round };
      };
   };
   GraphicalPresentation
   {
      scene, graphic = Path
      {
         nodes = [ { -32767 * sx + tx, 21045 * sy + ty }, { 32767 * sx + tx, 20743 * sy + ty } ];
         stroke = { green, width = 5, cap = round, join = round };
      };
   };
  */
   // GraphicalPresentation overlay {scene, graphic = mge };
#if 0
   Path capTest1
   {
       //nodes = [ { 50, 250 }, { 100, 250 }, { 150, 200 } ];
      //nodes = [ { 50, 250 }, { 51, 250 } ]; //, { 150, 200 } ];
      nodes = [ { 50, 250 }, { 60, 350 }];

      //nodes = [ { 60, 350 }, { 50, 250 } ];

      stroke = { blue, width = 20, cap = round, join = round };
   };
   GraphicalPresentation pCapTest1 { scene, graphic = capTest1 };
#endif

#if 0
   Path capTest0
   {
      nodes = [ { 50, 220 }, { 100, 220 }, { 150, 170 } ];
      stroke = { blue, width = 20, cap = flat, join = round };
   };
   GraphicalPresentation pCapTest0 { scene, graphic = capTest0 };
   Path capTest2
   {
      nodes = [ { 50, 280 }, { 100, 280 }, { 150, 230 } ];
      stroke = { blue, width = 20, cap = square, join = round };
   };
   GraphicalPresentation pCapTest2 { scene, graphic = capTest2 };

#endif

#if 0
   Path capTest3
   {
      nodes = [ { 350, 170 }, { 300, 220 }, { 250, 220 } ];
      stroke = { blue, width = 20, cap = flat, join = round };
   };
   GraphicalPresentation pCapTest3 { scene, graphic = capTest3 };
#endif

#if 0
   Path capTest4
   {
      nodes = [ { 350, 200 }, { 300, 250 }, { 250, 250 } ];
      stroke = { blue, width = 20, cap = round, join = round };
   };
   GraphicalPresentation pCapTest4 { scene, graphic = capTest4 };
   Path capTest5
   {
      nodes = [ { 350, 230 }, { 300, 280 }, { 250, 280 } ];
      stroke = { blue, width = 20, cap = square, join = round };
   };
   GraphicalPresentation pCapTest5 { scene, graphic = capTest5 };
#endif

   // MGE Tests
   // MultiGraphicalElement mge { scene };
#if 0
   RoundedRectangle backdrop
   {
      box = {0, 0, 800, 600},
      stroke = { black, opacity = 0.9, cap = capType, join = round, width = 10 },
      fill = {black, opacity=0.9}
   };
   // GraphicalPresentation backdropPresentation {scene, graphic = backdrop}; //

   RoundedRectangle square
   {
      //mge,
      box = { 450, 50, 550, 150 },
      stroke = { green, opacity = 0.9, cap = capType, join = round, width = 10 }, fill = { magenta, opacity = 0.5 }
   };

   GraphicalPresentation squarePresentation {/*gSurface*/ scene, graphic = square };

   RoundedRectangle rect
   {
      //mge,
      box = { 30, 30, 340, 190 }, rx = 20, ry = 20,
      stroke = { red, opacity = 0.9, cap = capType, join = joinType, width = 4 }, fill = { black, opacity = 0.5 }
   };
   GraphicalPresentation rectPresentation {/*gSurface*/ scene, graphic = rect };

   Ellipse circle  {/*mge, */ center = { 390, 280 }, radius = 100,
      stroke = { green, opacity = 0.5, cap = capType, join = joinType, width = 8 }, fill = { tomato, opacity = 0.66 } };
   GraphicalPresentation circlePresentation {/*gSurface*/ scene, graphic = circle };
   Ellipse ell  {/*mge, */ center = { 250, 310 }, k = 1.3, radius = 100,
      stroke = { yellow, opacity = 0.5, cap = capType, join = joinType, width = 4 }, fill = { black, opacity = 100, opacity = 0.4 } };
   GraphicalPresentation ellPresentation {/*gSurface*/ scene, graphic = ell };

   Path triangle
   {
      //mge,
      nodes = [
         // { 150, 80 },
         { 210, 80 },
         { 50, 220 },
         { 240, 220 }
      ];
      //closed = true;
      //stroke = { blue, opacity = 0.5, width = 20, cap = capType, join = bevel /*miter joinType */ };
      stroke = { blue, width = 20, cap = capType, join = joinType };
      //fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation trianglePresentation {/*gSurface*/ scene, graphic = triangle };

   Arc partialSectorArc
   {
      center = {650, 450},
      radius = 150,
      innerRadius = 100,
      startAngle = 95,
      deltaAngle = 300,
      arcType = sector,

      stroke = { purple, opacity = 0.8, width = 4, join = round };
      fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation sectorArcPresentation {scene, graphic = partialSectorArc};
   Arc partialSectorArc3
   {
      center = {650, 450},
      radius = 80,
      innerRadius = 10,
      startAngle = 25,
      deltaAngle = 300,
      arcType = sector,

      stroke = { purple, opacity = 0.8, width = 4, join = round };
      fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation sectorArc3Presentation {scene, graphic = partialSectorArc3};

   Arc pieArc
   {
      center = {330, 450},
      radius = 150,
      startAngle = 275,
      deltaAngle = 300,
      arcType = sector,

      stroke = { purple, opacity = 0.8, width = 10, join = round };
      fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation pieArcPresentation {scene, graphic = pieArc};

   Arc chordArc
   {
      center = {650, 150},
      radius = 150,
      startAngle = 95,
      deltaAngle = 300,
      arcType = chord,

      stroke = { purple, opacity = 0.8, width = 4, join = miter };
      fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation chordArcPresentation {scene, graphic = chordArc};

   Arc arc
   {
      center = {330, 150},
      radius = 75,
      startAngle = 95,
      deltaAngle = 300,
      arcType = open,

      stroke = { pink, opacity = 0.2, width = 20, cap = round, join = round };
   };
   GraphicalPresentation arcPresentation {scene, graphic = arc};

   Arc sectorArc
   {
      center = {330, 150},
      radius = 65,
      innerRadius = 20;
      startAngle = 95,
      deltaAngle = -60,
      arcType = sector,

      stroke = { red, opacity = 1.0, width = 4, cap = round, join = round };
      fill = { lime, opacity = 0.4 };
   };
   GraphicalPresentation sectorArc2Presentation {scene, graphic = sectorArc};

   Path test
   {
      //mge,
      nodes = [
         { 210, 80 },
         { 50, 220 },
         { 240, 220 }
      ];
      closed = true;
      stroke = { red, width = 1, join = miter, cap = flat };
   };
   GraphicalPresentation testPresentation {/*gSurface*/ scene, graphic = test };

   Path triangle2
   {
      //mge,
      nodes = [
         { 510, 180 }, { 150, 320 }, { 340, 320 }
         // { 340, 320 }, { 150, 320 }, { 510, 180 }
      ];
      closed = true;
      stroke = { purple, opacity = 0.5, width = 9, cap = capType, join = round /*joinType*/ };
      fill = { orange, opacity = 0.4 };
   };
   GraphicalPresentation triangle2Presentation {/*gSurface*/ scene, graphic = triangle2 };

   Dot dot
   {
      //mge,
      point = { 250, 300 };
      stroke = { black, width = 20,
         cap = round
         //cap = square
         };
   };
   GraphicalPresentation dotPresentation {/*gSurface*/ scene, graphic = dot };

   Path concave
   {
      //mge,
      nodes = [
         { 350, 80 },
         { 210, 180 },
         { 250, 120 },
         { 140, 220 },
         { 100, 80 }

         // { 350, 80 }, { 260, 180 }, { 250, 120 }, { 140, 220 }, { 100, 80 }
      ];
      closed = true;
      needTesselation = true;
      stroke = { black, opacity = 0.5, width = 18, cap = round, join = round };
      fill = { orange, opacity = 0.5 };
   };
   GraphicalPresentation concavePresentation {/*gSurface*/ scene, graphic = concave };

   Path concaveOutline
   {
      //mge,
      nodes = [
         { 350, 80 },
         { 210, 180 },
         { 250, 120 },
         { 140, 220 },
         { 100, 80 }
      ];
      //closed = true;
      needTesselation = true;
      stroke = { blue, width = 1, cap = flat, join = miter };
   };
   GraphicalPresentation concaveOutlinePresentation {/*gSurface*/ scene, graphic = concaveOutline };

   Text textGE
   {
      text = "Hello, Ecere 0.45!!";
      font = { face = "DejaVu Sans", color = blue /*white*/, opacity = 0.5, size = 20, bold = true, outline = { color = white, opacity = 1.0, size = 2 } };
      position2D = { 100, 100 };
   };
   GraphicalPresentation textPresentation {/*gSurface*/ scene, graphic = textGE };
   Text textGE2
   {
      text = "Stuff...";
      font = { face = "DejaVu Sans", color = green, opacity = 1.0, size = 18, italic = true, outline = { color = black, opacity = 1.0, size = 2 } };
      position2D = { 100, 100 };
      alignment = { right, bottom };
   };
   GraphicalPresentation textPresentation2 {/*gSurface*/ scene, graphic = textGE2 };
   Image imageGE { image = { "../installer/ecere.png" }, scaling = 1, hotSpot = { 0, 0.5 }, position2D = { 100, 100 } };
   GraphicalPresentation imagePresentation {/*gSurface*/ scene, graphic = imageGE };
#endif

   // TODO: Anchored presentations at 3D cartesian coordinates...

   ///// ANCHORED WITH BILLBOARDS (bbShapes / bbTextAndImages passes) ////////////////
   ///// ANCHORED WITH 3D GE (perspective pass) ////////////////

   void OnRedraw(Surface surface)
   {
      Size clientSize = this.clientSize;

      display.antiAlias = true;
      setupGL(display);
      gSurface.render(clientSize.w, clientSize.h, 0, 0);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Array<PickResult> results = gSurface.pickWithin(Boxf { x, y, x, y });
      PickResult result;

      PrintLn("===\n");
      if(gSurface.pickAt({ x, y }, 4, result))
      {
         PrintLn("Picked a ", result.presentation._class.name);
         if(eClass_IsDerived(result.presentation._class, class(GraphicalPresentation)))
            PrintLn("   (Graphic is a ", result.element._class.name, ")");
      }
      if(results)
      {
         PrintLn("Picked a total of ", results.count, " things:");
         for(r : results)
         {
            PrintLn("   - a ", r.presentation._class.name);
            if(eClass_IsDerived(r.presentation._class, class(GraphicalPresentation)))
               PrintLn("      (Graphic is a ", r.element._class.name, ")");
         }
      }
      return true;
   }
}

ButterburTest bbTest {};
