#ifdef BUILDING_ECERE_COM
namespace gui::controls;
import "Window"
import "Array"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

public class IconBag<class TT>
{
public:
   Window window;
   bool alphaBlend;

   Array<char *> iconNames { };
   property Container<char *> iconNames
   {
      set
      {
         iconNames.Copy(value);
      }
   }

   Array<BitmapResource> icons { };

   void Load()
   {
      int i;
      icons.RemoveAll();
      for(i = 0; i < iconNames.count; i++)
      {
         char * s = iconNames[i];
         BitmapResource br = BitmapResource { iconNames[i], alphaBlend = alphaBlend };
         //Bitmap b = br.bitmap;
         window.AddResource(br);
         //b = br.bitmap;
         icons.Add(br);
      }
   }
   
   void Unload()
   {
      icons.RemoveAll();
   }

   char * GetIconName(TT icon)
   {
      int i = (int)icon;
      return i <= iconNames.count ? iconNames[(int)icon] : null;
   }

   /*
   BitmapResource GetIcon(TT icon)
   {
      int i = (int)icon;
      return icons[i];
   }
   */

   /*
   ~IconBag()
   {
      //window = null;
      //icons.RemoveAll();
      //iconNames.RemoveAll();
   }
   */
}
