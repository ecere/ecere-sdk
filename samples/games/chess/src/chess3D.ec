import "chess.ec"

static char * names[Player][PieceType] =
{
   { "", "WhitePawn", "WhiteKnigh", "WhiteBisho", "WhiteRook", "WhiteQueen", "WhiteKing" },
   { "", "BlackPawn", "BlackKnigh", "BlackBisho", "BlackRook", "BlackQueen", "BlackKing" }
};

define SQUARE = squareSize; // 160;
define SQUARE_OFFSET = SQUARE * 3.5f;

class Chess3D : Window
{
   Camera camera
   {
      attached, fov = 45, zMin = 50,zMax = 5000,
      position = { 0, 0, -1000 },
      orientation = Euler { 30, 30, 0 }
   };

   Object chessSet { };

   Object chessBoard;
   bool moving, lightMoving;
   Point startPosition;
   Euler startOrientation;
   Light light;
   FillModeValue fillMode;
   ChessState * chessState;
   double squareSize;
   double offsetY;

   bool pieceSelected;
   Point start;

   // Dragging
   bool useDrag;
   Point dragging;
   double dragY;

   bool antiAlias;

   antiAlias = true;

   menu = Menu {};
   Menu viewMenu { menu, "View", v };
   MenuItem itemAntiAlias
   {
      viewMenu, "Anti Aliased", s, checkable = true, checked = antiAlias;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         antiAlias ^= true;
         Update(null);
         return true;
      }
   };

   isActiveClient = true, background = black, borderStyle = sizable, hasMaximize = true, hasMinimize = true;

   void RenderPiece(Piece atBoard, int x, int y, bool high)
   {
      Player player = atBoard.player;
      PieceType type = atBoard.type;

      if(type)
      {
         char * name = names[player][type];
         Object object = chessSet.Find(name);
         if(object)
         {

            float height = 0;
            if(high)
            {
               Piece overAtBoard = chessState->board[y][x];
               Player overPlayer = overAtBoard.player;
               PieceType overType = overAtBoard.type;
               if(overType)
               {
                  char * name = names[overPlayer][overType];
                  Object over = chessSet.Find(name);
                  if(over)
                     height = over.max.y - over.min.y;
               }
            }

            object.flags.root = true;

            object.transform.position = {
               x * SQUARE - SQUARE_OFFSET,
               offsetY - height;
               y * SQUARE - SQUARE_OFFSET };

            object.UpdateTransform();

            object.tag = (void *)(((y)*8)+(x)+1);
            display.DrawObject(object);
         }
      }
   }

   void RenderSquare(int x, int y)
   {
      if(x >= 0 && x < 8 && y >= 0 && y < 8)
      {
         Piece atBoard = chessState->board[y][x];

         if(useDrag && pieceSelected)
         {
            if(x == start.x && y == start.y) return;
            if(x == dragging.x && y == dragging.y)
            {
               Piece atBoardStart = chessState->board[start.y][start.x];
               if(atBoard && atBoard.player != atBoardStart.player) return;
            }
         }
         RenderPiece(atBoard, x, y, false);
      }
   }

   void RenderBoard()
   {
      display.DrawObject(chessBoard);

      if(chessState->gameRunning)
      {
         int x,y;
         for(y=0; y<8; y++)
	         for(x=0; x<8; x++)
               RenderSquare(x, y);

         if(useDrag && pieceSelected)
         {
            Piece atBoard = chessState->board[start.y][start.x];
            Piece atBoardDrag = chessState->board[dragging.y][dragging.x];
            RenderPiece(atBoard, dragging.x, dragging.y,
               (dragging.x != start.x || dragging.y != start.y) &&
               atBoardDrag && atBoardDrag.player == atBoard.player);
         }
      }
   }

   void OnUnloadGraphics()
   {
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
   }

   void OnPosition(int x, int y, int w, int h)
   {
      camera.Setup(w, h, null);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      OldList list {};

      display.StartSelection(x,y, 0,0);
      display.SetCamera(null, camera);
      display.CollectHits();


      if(chessState->gameRunning)
      {
         int cx,cy;
         for(cy = 0; cy < 8; cy++)
	         for(cx = 0; cx < 8; cx++)
               RenderSquare(cx, cy);
      }

      if(display.GetHits(list))
      {
         HitRecord hit = list.first;
         int tag = ((int)hit.tags[0]) - 1;
         int sx = tag & 7, sy = tag >> 3;

         if(pieceSelected)
         {
            pieceSelected = false;
            ((Chess)master).ProcessUserMove(start.x, start.y, sx, sy);
         }
         else if(chessState->board[sy][sx] &&
            chessState->isLocalPlayer[chessState->turn] &&
            chessState->board[sy][sx].player == chessState->turn)
         {
            if(useDrag)
            {
               Vector3D viewSpace, worldSpace;
               display.IntersectPolygons();
               RenderSquare(sx, sy);
               display.GetIntersect(viewSpace);

               camera.Untransform(viewSpace, worldSpace);

               dragY = worldSpace.y;
               dragging.x = sx;
               dragging.y = sy;
            }
            Capture();
            pieceSelected = true;
            start.x = sx;
            start.y = sy;
            Update(null);

            OnMouseMove(x, y, mods);
         }

         list.Free(null);
      }
      else if(display.DrawObject(chessBoard) && !moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = camera.orientation;
         Capture();
         moving = true;
      }
      display.SetCamera(null, null);
      display.StopSelection();
      Update(null);

      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      if(useDrag && pieceSelected)
      {
         ReleaseCapture();
         ((Chess)master).ProcessUserMove(start.x, start.y, dragging.x, dragging.y);
         Update(null);
         pieceSelected = false;
      }
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = light.orientation;
         Capture();
         lightMoving = true;
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(lightMoving)
      {
         ReleaseCapture();
         lightMoving = false;
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         Euler angle
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            0
         };
         if(angle.pitch > 90) angle.pitch = 90;
         if(angle.pitch < 2)  angle.pitch = 2;
         camera.orientation = angle;

         Update(null);
      }
      else if(lightMoving)
      {
         light.orientation = Euler
         {
            startOrientation.yaw + (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            90
         };

         Update(null);
      }
      else if(pieceSelected && useDrag)
      {
         Vector3D p, v1, v2, w1, w2, vector;
         Line line;
         Plane plane;
         int sx, sy;

         // Compute ray of pixel
         v1.x = 0;
         v1.y = 0;
         v1.z = 0;
         p.x = (float)x;
         p.y = (float)y;
         p.z = 0;
         camera.Unproject(p, v2);

         // Convert ray to world space
         camera.Untransform(v1, w1);
         camera.Untransform(v2, w2);
         line.p0 = w1;
         line.delta.x = w2.x - w1.x;
         line.delta.y = w2.y - w1.y;
         line.delta.z = w2.z - w1.z;

         // Compute plane of selection in world space
         vector   = { 0,dragY,0 };
         w1       = { 1,dragY,0 };
         w2       = { 0,dragY,1 };
         plane.FromPoints(vector, w1, w2);

         // Find intersection
         plane.IntersectLine(line, vector);

         sx = (int)((vector.x + SQUARE * 4) / SQUARE);
         sy = (int)((vector.z + SQUARE * 4) / SQUARE);
         sx = Max(Min(sx, 7), 0);
         sy = Max(Min(sy, 7), 0);

         dragging.x = sx;
         dragging.y = sy;
         Update(null);
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey)key)
      {
         case wheelDown:
         case minus:
            camera.position.z *= 1.1f;
            if(camera.position.z <= -3800)
               camera.position.z = -3800;
            Update(null);
            break;
         case wheelUp:
         case equal: camera.position.z /= 1.1f;
            if(camera.position.z >= -1100)
               camera.position.z = -1100;
            Update(null);
            break;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      display.vSync = true;
      chessSet.Load(":chessSet.3ds", null, displaySystem);

      //chessSet.transform.orientation.RotateY(45);
      //chessSet.UpdateTransform();

      chessBoard = chessSet.Find("Rectangle0");
      chessBoard.flags.root = true;

      {
         Object queen = chessSet.Find(names[White][Queen]);
         Object king  = chessSet.Find(names[White][King]);

         squareSize = king.transform.position.x - queen.transform.position.x;
         offsetY = king.transform.position.y;
      }

      if(chessBoard)
         camera.position.z = - chessBoard.radius * 2.5f;

      camera.target = chessBoard;

      return true;
   }

   void OnRedraw(Surface surface)
   {
      //surface.SetBackground(white);
      surface.Clear(colorAndDepth);

      camera.Update();
      display.antiAlias = antiAlias;
      display.SetCamera(surface, camera);
      //display.fogDensity = 0.0002f;
      display.antiAlias = antiAlias;

      display.SetLight(0, light);
      display.fillMode = fillMode;

      RenderBoard();

      display.SetCamera(surface, null);

      display.fillMode = solid;
   }

   bool OnCreate()
   {
      fillMode = solid;
      //fillMode = wireframe;

      light.diffuse = white;
      light.specular = white;

      light.orientation = Euler { pitch = 90 };
      useDrag = true;

      return true;
   }
   property ChessState * chessState { set { chessState = value; } }
}
