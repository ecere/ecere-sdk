/****************************************************************************
   CHESS Game

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   promotion.c - Pawn Promotion Window
****************************************************************************/
import "chessutils.ec"

class Promotion : Window
{
   background = gray, text = "Pawn Promotion", borderStyle = fixed, tabCycle = true,
   minClientSize = Size { 120, 140 };

   bool ButtonClicked(Button button, int x, int y, Modifiers mods)
   {
      Destroy(button.id);
      return true;
   }

   Button
   {
      parent = this, bevel = true, text = "Knight", position = Point { 20, 10 },
      size = Size { 80, 20 }, id = PieceType::Knight, NotifyClicked = ButtonClicked
   };
   Button
   {
      parent = this, bevel = true, text = "Bishop", position = Point { 20, 35 },
      size = Size { 80, 20 }, id = PieceType::Bishop, NotifyClicked = ButtonClicked
   };
   Button
   {
      parent = this, bevel = true, text = "Rook", position = Point { 20, 60 },
      size = Size { 80, 20 }, id = PieceType::Rook, NotifyClicked = ButtonClicked
   };
   Button
   {
      parent = this, bevel = true, text = "Queen", position = Point { 20, 85 },
      size = Size { 80, 20 }, id = PieceType::Queen, NotifyClicked = ButtonClicked,
      isDefault = true
   };
}
