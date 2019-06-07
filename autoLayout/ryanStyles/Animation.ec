import "ecere"
import "Style"

enum TweenMode {
   size,
   background,
   border,
   padding,
   margin,
   position
};

class KeyFrame {
public:
   Style style;
   Array<TweenMode> tween;
   property Container<TweenMode> tween {
      set {
         if(tween == null) {
            tween = {};
         }
         for(mode : value) {
            tween.Add(mode);
         }
      }
   }
};

class Timeline {
   Map<double,KeyFrame> frames {};
};

class Animation {
   Timeline timeline;
};

void Test() {
   Animation a { };
   a.timeline = {
      frames = {[
         {0.0, {
            style = {
               background={color=red}
            },
            tween=[background]
         }},
         {1.0, {
            style = {
               background={color=blue}
            }
         }}
      ]}
   };
}