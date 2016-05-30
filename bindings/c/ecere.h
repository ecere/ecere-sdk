// Preprocessor directives can be added at the beginning (Can't store them in AST)

/****************************************************************************
===========================================================================
   Ecere Module
===========================================================================
****************************************************************************/
#if !defined(__ECERE_H__)
#define __ECERE_H__

#ifdef __cplusplus
extern "C"
{
#endif

#include "eC.h"

#define ECERE_APP_INTRO(c) \
      APP_INTRO \
      ecere_init(app); \
      loadTranslatedStrings(null, MODULE_NAME); \
      Instance_evolve(&app, class_ ## c);

#define ECERE_APP_OUTRO \
      unloadTranslatedStrings(MODULE_NAME); \
      APP_OUTRO

#define GUIAPP_INTRO ECERE_APP_INTRO(GuiApplication)

// GENERATED:

#define Class           eC_Class
#define Instance        eC_Instance
#define Module          eC_Module

#define Surface         eC_Surface
#define FontResource    eC_FontResource

#define Window          eC_Window
#define Button          eC_Button
#define Label           eC_Label
#define MessageBox      eC_MessageBox
#define GuiApplication  eC_GuiApplication

// Virtual Method Calls
#define Window_onCreate(x)    ({  eC_Window i = x; \
                                  bool (* method)(eC_Window) = (bool (*)(eC_Instance))(i ? i->_vTbl : class_Window->_vTbl)[Window_onCreate_vTblID]; \
                                  method ? method(i) : true; })

#define Window_onRedraw(x, s) ({  eC_Window i = x; \
                                  void (* method)(eC_Window, eC_Surface) = (void (*)(eC_Window, eC_Surface))(i ? i->_vTbl : class_Window->_vTbl)[Window_onRedraw_vTblID]; \
                                  if(method) method(i, s); })

#define Button_notifyClicked(t, m, b, x, y, mods)    ({ eC_Button i = t; \
                                                      bool (* method)(eC_Window, eC_Button, int, int, Modifiers) = (bool (*)(eC_Window, eC_Button, int, int, Modifiers))(i ? i->_vTbl : class_Button->_vTbl)[Button_notifyClicked_vTblID]; \
                                                      method ? method(m, b, x, y, mods) : true; })

// Bit Class Member Access
#define COLOR_r_MASK       0x00FF0000
#define COLOR_r_SHIFT      16
#define COLOR_g_MASK       0x0000FF00
#define COLOR_g_SHIFT      8
#define COLOR_b_MASK       0x000000FF
#define COLOR_b_SHIFT      0

#define COLOR(r, g, b)     ((((Color)(r)) << COLOR_r_SHIFT) | ((Color)(g) << COLOR_g_SHIFT) | ((Color)(b)) << COLOR_b_SHIFT)
#define COLOR_r(x)         ((((Color)(x)) & COLOR_r_MASK) >> COLOR_r_SHIFT)
#define COLOR_g(x)         ((((Color)(x)) & COLOR_g_MASK) >> COLOR_g_SHIFT)
#define COLOR_b(x)         ((((Color)(x)) & COLOR_b_MASK) >> COLOR_b_SHIFT)
#define COLOR_SET_r(x, r)  (x) = ((Color)(x) & ~((Color)COLOR_r_MASK)) | (((Color)(r)) << COLOR_r_SHIFT)
#define COLOR_SET_g(x, g)  (x) = ((Color)(x) & ~((Color)COLOR_g_MASK)) | (((Color)(g)) << COLOR_g_SHIFT)
#define COLOR_SET_b(x, b)  (x) = ((Color)(x) & ~((Color)COLOR_b_MASK)) | (((Color)(b)) << COLOR_b_SHIFT)

#define BORDERBITS_contour_mask  0x00000001
#define BORDERBITS_contour_shift 0
#define BORDERBITS_fixed_mask    0x00000002
#define BORDERBITS_fixed_shift   1
#define BORDERBITS_sizable_mask  0x00000004
#define BORDERBITS_sizable_shift 2
#define BORDERBITS_deep_mask     0x00000008
#define BORDERBITS_deep__shift   3
#define BORDERBITS_bevel_mask    0x00000010
#define BORDERBITS_bevel_shift   4
#define BORDERBITS_thin_mask     0x00000020
#define BORDERBITS_thin_shift    5

#define BORDERBITS_contour(x)    ((((BorderBits)(x)) & BORDERBITS_contour_MASK) >> BORDERBITS_contours_SHIFT)
#define BORDERBITS_fixed(x)      ((((BorderBits)(x)) & BORDERBITS_fixed_MASK) >> BORDERBITS_fixed_SHIFT)
#define BORDERBITS_sizable(x)    ((((BorderBits)(x)) & BORDERBITS_sizable_MASK) >> BORDERBITS_sizable_SHIFT)
#define BORDERBITS_deep(x)       ((((BorderBits)(x)) & BORDERBITS_deep_MASK) >> BORDERBITS_deep_SHIFT)
#define BORDERBITS_bevel(x)      ((((BorderBits)(x)) & BORDERBITS_bevel_MASK) >> BORDERBITS_bevel_SHIFT)
#define BORDERBITS_thin(x)       ((((BorderBits)(x)) & BORDERBITS_thin_MASK) >> BORDERBITS_thin_SHIFT)

// Structs
struct Size { int w, h; };
struct Point { int x, y; };

// Struct Typedefs
typedef struct Size Size;
typedef struct Point Point;

/****************************************************************************
   ecere::gfx Namespace
****************************************************************************/
// Color Bit Class
typedef uint32 Color;

// System Color Enum
#if !CPP11
typedef Color SystemColor;
#endif

enum SystemColor
#if CPP11
   : Color
#endif
{
   formColor = COLOR(229, 234, 245)
};

///////////// Surface Class /////////////////////////////////////////////////

typedef Instance Surface;

extern Class * class_Surface;

// Methods
extern Method * method_Surface_writeTextf;

extern void (* Surface_writeTextf)(Surface s, int x, int y, const char * format, ...);


///////////// FontResource Class /////////////////////////////////////////////////
extern Class * class_FontResource;

typedef Instance FontResource;

// Properties
extern Property * property_FontResource_faceName;
extern Property * property_FontResource_size;

extern void (* FontResource_set_faceName)(FontResource f, constString v);
extern constString (* FontResource_get_faceName)(FontResource f);

extern void (* FontResource_set_size)(FontResource f, float v);
extern float (* FontResource_get_size)(FontResource f);

extern void (* FontResource_set_bold)(FontResource f, bool v);
extern bool (* FontResource_get_bold)(FontResource f);

extern void (* FontResource_set_italic)(FontResource f, bool v);
extern bool (* FontResource_get_italic)(FontResource f);

/****************************************************************************
   ecere::gui Namespace
****************************************************************************/

// Bit Class Typedefs
typedef uint32 Modifiers;
typedef uint32 BorderBits;

// Enum Typedefs
#if !CPP11
typedef BorderBits BorderStyle;
#endif

#if !CPP11
typedef int64 DialogResult;
#endif

// Enumerations
enum DialogResult
#if CPP11
   : int64
#endif
{
   cancel = 0,
   yes = 1,
   no = 2,
   ok = 3
};

enum BorderStyle
#if CPP11
   : BorderBits
#endif
{
   none,
   contour      = BORDERBITS_contour_mask,
   fixed        = BORDERBITS_fixed_mask | contour,
   sizable      = BORDERBITS_sizable_mask | fixed,
   thin         = BORDERBITS_thin_mask | fixed,
   sizableThin  = BORDERBITS_sizable_mask | thin,
   deep         = BORDERBITS_deep_mask,
   bevel        = BORDERBITS_bevel_mask,
   sizableDeep  = sizable|deep,
   sizableBevel = sizable|bevel,
   fixedDeep    = fixed|deep,
   fixedBevel   = fixed|bevel,
   deepContour  = deep|contour
};

///////////// Window Class /////////////////////////////////////////////////
typedef Instance Window;

extern Class * class_Window;

// Properties
extern Property * property_Window_caption;
extern Property * property_Window_caption;
extern Property * property_Window_size;
extern Property * property_Window_clientSize;
extern Property * property_Window_hasClose;
extern Property * property_Window_hasMinimize;
extern Property * property_Window_hasMaximize;
extern Property * property_Window_borderStyle;
extern Property * property_Window_background;
extern Property * property_Window_parent;
extern Property * property_Window_position;
extern Property * property_Window_font;

extern void (* Window_set_borderStyle)(Window w, BorderStyle v);
extern BorderStyle (* Window_get_borderStyle)(Window w);

extern void (* Window_set_size)(Window w, const Size * v);
extern void (* Window_get_size)(Window w, Size * v);

extern void (* Window_set_clientSize)(Window w, const Size * v);
extern void (* Window_get_clientSize)(Window w, Size * v);

extern void (* Window_set_hasClose)(Window w, bool v);
extern bool (* Window_get_hasClose)(Window w);

extern void (* Window_set_hasMaximize)(Window w, bool v);
extern bool (* Window_get_hasMaximize)(Window w);

extern void (* Window_set_hasMinimize)(Window w, bool v);
extern bool (* Window_get_hasMinimize)(Window w);

extern void (* Window_set_parent)(Window w, Window v);
extern Window (* Window_get_parent)(Window w);

extern void (* Window_set_background)(Window w, Color v);
extern Color (* Window_get_background)(Window w);

extern void (* Window_set_position)(Window w, const Point * v);
extern void (* Window_get_position)(Window w, Point * v);

extern void (* Window_set_font)(Window w, FontResource v);
extern FontResource (* Window_get_font)(Window w);

extern void (* Window_set_caption)(Window w, constString v);
extern constString (* Window_get_caption)(Window w);

// Methods
extern DialogResult (* Window_modal)(Window);

extern Method * method_Window_modal;
extern Method * method_Window_onCreate;

extern int Window_onCreate_vTblID;
extern int Window_onRedraw_vTblID;

///////////// Label Class /////////////////////////////////////////////////
extern Class * class_Label;

typedef Instance Label;

///////////// MessageBox Class /////////////////////////////////////////////////
typedef Window MessageBox;

extern Class * class_MessageBox;

// Properties
extern Property * property_MessageBox_contents;

extern void (* MessageBox_set_contents)(MessageBox m, constString v);
extern constString (* MessageBox_get_contents)(MessageBox m);

///////////// Button Class /////////////////////////////////////////////////
typedef Window Button;

extern Class * class_Button;

// Method IDs
extern int Button_notifyClicked_vTblID;


extern Class * class_ToolButton;

///////////// GuiApplication Class /////////////////////////////////////////////////
extern Class * class_GuiApplication;

typedef Instance GuiApplication;

Module ecere_init(Module fromModule);

#ifdef __cplusplus
   #undef Button
   #undef MessageBox
   #undef Label
   #undef Window
   #undef GuiApplication

   #undef FontResource
   #undef Surface

   #undef Module
   #undef Class
   #undef Instance
};
#endif

#endif
