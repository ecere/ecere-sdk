#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

enum KeywordType { regular, preprocessor };

class SyntaxColorScheme
{
public:
   Color commentColor;
   Color charLiteralColor;
   Color stringLiteralColor;
   Color preprocessorColor;
   Color numberColor;
   Color typeColor;
   Color defColor;
   Color fnColor;

   commentColor = dimGray;
   charLiteralColor = crimson;
   stringLiteralColor = crimson;
   preprocessorColor = green;
   numberColor = teal;
   property::keywordColors = [ blue, blue ];
   typeColor = 0x15CE4C;
   defColor = 0xFFCE7A;
   fnColor = 0x9CB7FF;

   private Array<Color> keywordColors { };   // For each KeywordType

   public property Container<Color> keywordColors
   {
      set
      {
         keywordColors.Copy((void *)value);
         // JSON/ECON Parser expects we'll hang on to this... Better solution with improved ref counting model?
         if(value && value._class != class(BuiltInContainer) && !value._refCount)
            delete value;
      }
      get { return keywordColors; }
   }
};
