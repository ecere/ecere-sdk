import "uiWindow"

MultiGraphicalElement mge
{ [
   Ellipse { radius = 10, stroke = { green, width = 2 }, fill = { blue } }
] };

class CircularButton : IButton
{
   elements = [ GraphicInstance { element = mge } ];

   void notifyClicked()
   {
      Ellipse ellipse = (Ellipse)mge.elements[0];
      ellipse.stroke.color = cyan;
      ellipse.radius = 20;
      ((IMElement)ellipse).update(true);
   }
}

class Dialog1 : IDialog
{
   size = { 400, 300 };
   caption = "hello, butterbur!";

   CircularButton btn1 { parent = this, position2D = { 200, 60 } };
   CircularButton btn2 { parent = this, position2D = { 220, 200 } };
   CircularButton btn3 { parent = this, position2D = { 320, 180 } };

   RoundedButton roundButton1 { parent = this, position2D = { 20, 100 }, caption = "Hello" };
   ISlider slider1 { parent = this, position2D = { 20, 150 } };
   ImageButton imageButton1 { parent = this, position2D = { 20, 220 }, source = { "../../../installer/ecere.png" }, image.alphaThreshold = 30 };
}

Dialog1 dialog1
{
   parent = desktopMGE, position2D = { 50, 30 }
};

Dialog1 dialog2
{
   parent = desktopMGE, position2D = { 100, 60 }, active = true
};
