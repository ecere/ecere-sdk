import "ecere"
import "Image"
import "Layout"
import "Button"

class LayoutArea : LayoutWindow
{
   text = "Rectangle Layout Demo";
   background = peru;
   borderStyle = sizable; //fixed;
   hasClose = true;
   font = { "Verdana", 14.0f };
   size={0,0};

   // these need to be managed by a resource or similar
   WindowBorder blackBorder {2,solid,black};
   WindowBorder whiteBorder {1,solid,white};
   WindowBorder blueBorder  {5,solid,blue};
   //ColorAlpha a {alpha,color};
   List<Image> upGradient {
      [GradientImage { keys = [{Color{223,81,30}  , 0},
                               {Color{241,110,62} , 1}],
                       bottom={0.5f}
                     },
       GradientImage { keys = [{Color{215,75,25} , 0},
                               {Color{245,105,55} , 1}],
                       top={0.5f}
                     }]
   };
   List<Image> overGradient {
      [GradientImage { keys = [{Color{229,113,71}  , 0},
                               {Color{251,140,100} , 1}],
                       bottom={0.5f}
                     },
       GradientImage { keys = [{Color{221,106,65}  , 0},
                               {Color{251,136,95}  , 1}],
                       top={0.5f}
                     }]
   };
   List<Image> downGradient {
      [GradientImage { keys = [{Color{163,63,17}   , 0},
                               {Color{188,93,49}  , 1}],
                       bottom={0.5f}
                     },
       GradientImage { keys = [{Color{156,57,11}   , 0},
                               {Color{187,87,42}  , 1}],
                       top={0.5f}
                     }]
   };
   List<Image> topBorder {
      [
         ColorFillImage{ top = { 0 },    bottom = { 0.5f }, left={offset=3}, right={ratio=1,offset=-3}, color=ColorAlpha{50,black}},
         ColorFillImage{ top = { 0.5f }, bottom = { 1 },    left={offset=6}, right={ratio=1,offset=-6}, color=ColorAlpha{50,white}}
      ]
   };
   List<Image> leftBorder {
      [
         ColorFillImage{left = { 0 }, right = { 0.5f }, color=ColorAlpha{50,black}},
         ColorFillImage{left = { 0.5f }, right = { 1 }, top={offset=3}, bottom={ratio=1,offset=-3}, color=ColorAlpha{50,white}}
      ]
   };
   List<Image> rightBorder {
      [
         ColorFillImage{left = { 0 }, right = { 0.5f }, top={offset=3}, bottom={ratio=1,offset=-3}, color=ColorAlpha{50,white}},
         ColorFillImage{left = { 0.5f }, right = { 1 }, color=ColorAlpha{50,black}}
      ]
   };
   List<Image> bottomBorder {
      [
         ColorFillImage{top = { 0 }, bottom = { 0.5f }, left={offset=6}, right={ratio=1,offset=-6}, color=ColorAlpha{50,white}},
         ColorFillImage{top = { 0.5f }, bottom = { 1 }, left={offset=3}, right={ratio=1,offset=-3}, color=ColorAlpha{50,black}}
      ]
   };
   WindowBorder ghostLeft {6,solid,0,images=leftBorder};
   WindowBorder ghostTop {6,solid,0,images=topBorder};
   WindowBorder ghostRight {6,solid,0,images=rightBorder};
   WindowBorder ghostBottom {6,solid,0,images=bottomBorder};

   bool OnCreate() {

      LayoutWindow a {
         parent=this,
         styleDefault = {
            size = {100,200},
            block=false,
            background={color=darkSlateGray},
            padding={50,25,50,25}
         }
      };
      LayoutWindow aa {
         parent=a,
         styleDefault = {
            size={100,20},
            block=true,
            background={color=yellow},
            border={bottom=blueBorder},
            sizeType=grow,
            margin={bottom=10}
         }
      };
      LayoutWindow ab {
         parent=a,
         background=hotPink,
         styleDefault = {
            size={100,30},
            block=true,
            padding=5,
            sizeType=grow
         }
      };
      LayoutWindow aba {
         parent=ab,
         background=azure,
         styleDefault = {
            size={50,30},
            block=false
         }
      };
      LayoutWindow abb {
         parent=ab,
         background=royalBlue,
         styleDefault = {
            size={50,30},
            margin={left=5},
            sizeType=shrink,
            block=false
         }
      };
      LayoutButton ac {
         parent=a,
         styleDefault = {
            size={10,10},
            padding={top=10,bottom=10,left=37},
            block=true,
            margin={top=40,bottom=40},
            sizeType=grow,
            background={images=upGradient},
            border = { left = ghostLeft, top = ghostTop, right = ghostRight, bottom = ghostBottom }
         },
         styleOver = {
            background={images=overGradient},
            show=false;
         },
         styleDown = {
            background={images=downGradient},
            show=false;
         },
         text="LOL"
      };
      LayoutWindow ad {
         parent=a,
         background=mediumSeaGreen,
         styleDefault = {
            size={100,100},
            block=true,
            //border=blackBorder,
            border = {top=blackBorder,right=blackBorder,bottom=blackBorder,left=blackBorder},
            sizeType=grow
         }
      };
      LayoutWindow b {
         parent=this,
         styleDefault = {
            size={500,200},
            block=false,
            background={color=lightCoral},
            border={bottom={1,solid,white}}
         },
         styleOver = {
            background={color=aquamarine},
            border={bottom={1,solid,black}},
            show=0
         },
         styleActive = {
            background={color=yellow},
            show=0
         };
         bool OnLeftButtonDown(int x, int y, Modifiers mods)
         {
            style.size.w += 50;
            parent.Position(0,0);
            return true;
         }
      };
      LayoutWindow c {
         parent=this,
         background=darkSlateGray,
         styleDefault = {
            size={100,200},
            block=false,
            padding={top=35,bottom=35}
         }
      };

      LayoutWindow ca {
         parent=c,
         background=crimson,
         styleDefault = {
            size={100,100},
            block=true,
            margin=10,
            border={left=blackBorder}
         }
      };
      LayoutWindow cb {
         parent=c,
         background=violet,
         styleDefault = {
            size={100,100},
            block=true,
            margin=10,
            border={left=blackBorder}
         }
      };

      return true;
   }

   bool OnPostCreate()
   {
      Position(0,0);
      return true;
   }
}

LayoutArea test {};