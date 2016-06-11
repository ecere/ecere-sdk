import "ecere"
import "autoLayout"
import "guhix"
import "test1"
import "test2"
import "test3"
import "test4"
import "gutest"
import "eltest"
import "frank"

//===========================================================================
//   Test Bench
//===========================================================================

Array<Window> tws { };
class TestWindow : Window
{
   property Array<Window> tests { set { value.Add(this); } }
   OnDestroy = TestOnDestroy;
}
class TestGuhixWindow : GuhixWindow
{
   property Array<Window> tests { set { value.Add(this); } }
   OnDestroy = TestOnDestroy;
}
class TestAutoLayoutForm : AutoLayoutForm
{
   property Array<Window> tests { set { value.Add(this); } }
   OnDestroy = TestOnDestroy;
}
void Window::TestOnDestroy() { for(w : tws; w != this) w.Destroy(0); }

//===========================================================================
//   GUI Tests (AutoLayout API, Guhix Ideas, Frankenstein GUI, etc.)
//===========================================================================

TestAutoLayoutForm alf1 { contents = Elemental1 { }, clientSize = { 640, 320 }, anchor = { horz = 0, bottom = 40 }, tests = tws, caption = "test1" };
TestAutoLayoutForm alf2 { contents = Elemental2 { }, clientSize = { 640, 320 }, anchor = { top = 80, right = 80 }, tests = tws, caption = "test2" };
TestAutoLayoutForm alf3 { contents = Elemental3 { }, clientSize = { 480, 180 }, anchor = { left = 80, bottom = 80 }, tests = tws, caption = "test3" };
TestAutoLayoutForm alf4 { contents = Elemental4 { }, clientSize = { 320, 240 }, anchor = { right = 80, bottom = 80 }, tests = tws, caption = "test4" };

TestHoverScrollTitleTabsBar1 hs1 { tests = tws, anchor = { left = 100, top = 100 } };
//TestNextGenHoverScrollTitleTabsBar1 hs2 { tests = tws };
Test2 t2 { tests = tws, anchor = { top = 460, right = 100 } };
Test3 t3 { tests = tws, anchor = { /*top = 160*/ left = 80/*, horz = 0*/, vert = 0 } };
TestElement1 tElement1 { tests = tws, anchor = { left = 600, top = 400 } };

TestGuhix1 tGuhix1 { tests = tws, anchor = { left = 600, top = 100 } };
//TestTextList tTextList { tests = tws, anchor = { left = 100, top = 100 } };
