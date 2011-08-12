#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

default:

private:

public class LayoutPage : Stacker
{
   direction = vertical;
   gap = 4;
   opacity = 0.0f;
   //clickThrough = true;
   tabCycle = true;
}

public class LayoutLine : Stacker
{
   direction = horizontal;
   gap = 8;
   opacity = 0.0f;
   tabCycle = true;

   size = { h = 26 };
   anchor = { left = 0, right = 0 };
}

public class LayoutSeperatorLine : Window
{
   background = black;
   size = { h = 1 };
   anchor = { left = 8, right = 8 };
   tabCycle = true;
}
