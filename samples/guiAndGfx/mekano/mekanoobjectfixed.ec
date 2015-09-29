import "mekanoobject"

define CROSSHAIRWIDTH = 10;

class MekanoObjectFixed : MekanoObject
{
public:
   void draw(MekanoDisplay display)
   {
      display.drawCrossHair(m_Position, CROSSHAIRWIDTH);
   }
};
