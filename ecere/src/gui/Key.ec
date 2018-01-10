namespace gui;

import "Window"

public class Key
{
public:
   KeyCode code:16;
   bool shift:1, ctrl:1, alt:1, cmd:1;
   Modifiers modifiers:16:16;
   property SmartKey
   {
      get
      {
         SmartKey result = SmartKey { modifiers = modifiers };
         switch(code)
         {
            case keyPadEnter:
               return enter | result;
            case keyPadLeft: return left | result;
            case keyPadRight: return right | result;
            case keyPadUp: return up | result;
            case keyPadDown: return down | result;
            case keyPadPageUp: return pageUp | result;
            case keyPadPageDown: return pageDown | result;
            case keyPadHome: return home | result;
            case keyPadEnd: return end | result;
            case keyPadStar: return k8 | result;
            case keyPadSlash: return slash | result;
            case keyPadMinus: return minus | result;
            case keyPadPlus: return equal | result;
            case keyPadDelete: return del | result;
            case keyPadInsert: return insert | result;
            case leftAlt: case rightAlt: return KeyCode::alt | result;
            case leftControl: case rightControl: return KeyCode::control | result;
            case rightShift: case leftShift: return KeyCode::shift | result;
            default:
               return (uint)this;
         }
      }
   };

   const char * OnGetString(char * stringOutput, void * fieldData, ObjectNotationType * onType)
   {
      const char * string;
      if((string = ((PredefinedKey)this).class::OnGetString(stringOutput, null, onType /*null*/)))
      {
         if(onType) *onType = none;
         return string;
      }
      else if((string = ((KeyCode)this).class::OnGetString(stringOutput, null, onType /*null*/)))
      {
         if(onType) *onType = none;
         return string;
      }
      else
      {
         return class::OnGetString(stringOutput, fieldData, onType);
      }
   }

   bool OnGetDataFromString(const char * string)
   {
      if(((PredefinedKey)this).class::OnGetDataFromString(string))
         return true;
      else
         return class::OnGetDataFromString(string);
   }
};

public class SmartKey
{
public:
   KeyCode code:16;
   bool shift:1, ctrl:1, alt:1;
   Modifiers modifiers:16:16;
};

public enum KeyCode : Key
{
   escape            = 0x01,
   // Characters
   k1                = 0x02,
   bang              = 0x02,
   k2                = 0x03,
   commercial        = 0x03,
   k3                = 0x04,
   pound             = 0x04,
   k4                = 0x05,
   dollar            = 0x05,
   k5                = 0x06,
   percent           = 0x06,
   k6                = 0x07,
   circumflex        = 0x07,
   k7                = 0x08,
   ampersand         = 0x08,
   k8                = 0x09,
   star              = 0x09,
   k9                = 0x0A,
   leftParanthesis   = 0x0A,
   k0                = 0x0B,
   rightParanthesis  = 0x0A,
   minus             = 0x0C,
   underscore        = 0x0C,
   equal             = 0x0D,
   plus              = 0x0D,
   backSpace         = 0x0E,
   tab               = 0x0F,
   q                 = 0x10,
   w                 = 0x11,
   e                 = 0x12,
   r                 = 0x13,
   t                 = 0x14,
   y                 = 0x15,
   u                 = 0x16,
   i                 = 0x17,
   o                 = 0x18,
   p                 = 0x19,
   leftBracket       = 0x1A,
   rightBracket      = 0x1B,
   enter             = 0x1C,
   leftControl       = 0x1D,
   a                 = 0x1E,
   s                 = 0x1F,
   d                 = 0x20,
   f                 = 0x21,
   g                 = 0x22,
   h                 = 0x23,
   j                 = 0x24,
   k                 = 0x25,
   l                 = 0x26,
   semicolon         = 0x27,
   colon             = 0x27,
   quote             = 0x28,
   doubleQuote       = 0x28,
   tilde             = 0x29,
   backQuote         = 0x29,
   leftShift         = 0x2A,
   backSlash         = 0x2B,
   pipe              = 0x2B,
   z                 = 0x2C,
   x                 = 0x2D,
   c                 = 0x2E,
   v                 = 0x2F,
   b                 = 0x30,
   n                 = 0x31,
   m                 = 0x32,
   comma             = 0x33,
   smallerThan       = 0x33,
   period            = 0x34,
   greaterThan       = 0x34,
   slash             = 0x35,
   questionMark      = 0x35,

   rightShift        = 0x36,
   keyPadStar        = 0x37,
   leftAlt           = 0x38,
   space             = 0x39,

   capsLock          = 0x3A,

   // Function keys 1-10
   f1                = 0x3B,
   f2                = 0x3C,
   f3                = 0x3D,
   f4                = 0x3E,
   f5                = 0x3F,
   f6                = 0x40,
   f7                = 0x41,
   f8                = 0x42,
   f9                = 0x43,
   f10               = 0x44,

   // Num Pad
   numLock           = 0x45,
   scrollLock        = 0x46,
   keyPadHome        = 0x47,
   keyPad7           = 0x47,
   keyPadUp          = 0x48,
   keyPad8           = 0x48,
   keyPadPageUp      = 0x49,
   keyPad9           = 0x49,
   keyPadMinus       = 0x4A,
   keyPadLeft        = 0x4B,
   keyPad4           = 0x4B,
   keyPad5           = 0x4C,
   keyPadRight       = 0x4D,
   keyPad6           = 0x4D,
   keyPadPlus        = 0x4E,
   keyPadEnd         = 0x4F,
   keyPad1           = 0x4F,
   keyPadDown        = 0x50,
   keyPad2           = 0x50,
   keyPadPageDown    = 0x51,
   keyPad3           = 0x51,
   keyPadInsert      = 0x52,
   keyPad0           = 0x52,
   keyPadDelete      = 0x53,
   // KeyPadLess        = 0x56,

   // F11-F12
   f11               = 0x57,
   f12               = 0x58,

   keyPadEnter       = 0x60,
   rightControl      = 0x61,
   keyPadSlash       = 0x62,
   printScreen       = 0x63,
   rightAlt          = 0x64,
   pauseBreak        = 0x65,

   // Function Pad
   home              = 0x66,
   up                = 0x67,
   pageUp            = 0x68,
   left              = 0x69,
   right             = 0x6A,
   end               = 0x6B,
   down              = 0x6C,
   pageDown          = 0x6D,
   insert            = 0x6E,
   del               = 0x6F,

   // Pseudo keys
   shift             = 0x100,
   alt               = 0x101,
   control           = 0x102,
   wheelUp           = 0x103,
   wheelDown         = 0x104,
   hotKey            = 0x105,
   defaultKey        = 0x106,
   capsState         = 0x107,
   numState          = 0x108,
   scrollState       = 0x109,

   // Remote Control Buttons
   play              = 0x201,
   record            = 0x202,
   pause             = 0x203,
   rewind            = 0x204,
   fastForward       = 0x205,
   previousTrack     = 0x206,
   nextTrack         = 0x207,
   stop              = 0x208,
   eject             = 0x209,
   volumeUp          = 0x20A,
   volumeDown        = 0x20B,
   mute              = 0x20C,
   remoteHome        = 0x213,
   back              = f1,
   menu1             = f2,
   menu2             = f3,
   menu3             = f4,
   menu4             = f5,
   select            = enter
};

public class Modifiers
{
   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(onType) *onType = none;
      return 0;
   };

   public bool shift:1, ctrl:1, alt:1, cmd:1, left:1, middle:1, right:1, isActivate:1, isSideEffect:1, closingDropDown:1;
};

public enum PredefinedKey : Key
{
   alt0 = Key { k0, alt = true },
   alt1 = Key { k1, alt = true },
   alt2 = Key { k2, alt = true },
   alt3 = Key { k3, alt = true },
   alt4 = Key { k4, alt = true },
   alt5 = Key { k5, alt = true },
   alt6 = Key { k6, alt = true },
   alt7 = Key { k7, alt = true },
   alt8 = Key { k8, alt = true },
   alt9 = Key { k9, alt = true },
   altA = Key { a, alt = true },
   altB = Key { b, alt = true },
   altC = Key { c, alt = true },
   altD = Key { d, alt = true },
   altE = Key { e, alt = true },
   altF = Key { f, alt = true },
   altG = Key { g, alt = true },
   altH = Key { h, alt = true },
   altI = Key { i, alt = true },
   altJ = Key { j, alt = true },
   altK = Key { k, alt = true },
   altL = Key { l, alt = true },
   altM = Key { m, alt = true },
   altN = Key { n, alt = true },
   altO = Key { o, alt = true },
   altP = Key { p, alt = true },
   altQ = Key { q, alt = true },
   altR = Key { r, alt = true },
   altS = Key { s, alt = true },
   altT = Key { t, alt = true },
   altU = Key { u, alt = true },
   altV = Key { v, alt = true },
   altW = Key { w, alt = true },
   altX = Key { x, alt = true },
   altY = Key { y, alt = true },
   altZ = Key { z, alt = true },
   altF1 = Key { f1, alt = true },
   altF2 = Key { f2, alt = true },
   altF3 = Key { f3, alt = true },
   altF4 = Key { f4, alt = true },
   altF5 = Key { f5, alt = true },
   altF6 = Key { f6, alt = true },
   altF7 = Key { f7, alt = true },
   altF8 = Key { f8, alt = true },
   altF9 = Key { f9, alt = true },
   altF10 = Key { f10, alt = true },
   altF11 = Key { f11, alt = true },
   altF12 = Key { f12, alt = true },
   altLeft = Key { left, alt = true },
   altRight = Key { right, alt = true },
   altUp = Key { up, alt = true },
   altDown = Key { down, alt = true },
   altEnter = Key { enter, alt = true },
   altKeyPadEnter = Key { keyPadEnter, alt = true },
   altHome = Key { home, alt = true },
   altEnd = Key { end, alt = true },
   altMinus = Key { minus, alt = true },
   altSpace = Key { space, alt = true },

   ctrl0 = Key { k0, ctrl = true },
   ctrl1 = Key { k1, ctrl = true },
   ctrl2 = Key { k2, ctrl = true },
   ctrl3 = Key { k3, ctrl = true },
   ctrl4 = Key { k4, ctrl = true },
   ctrl5 = Key { k5, ctrl = true },
   ctrl6 = Key { k6, ctrl = true },
   ctrl7 = Key { k7, ctrl = true },
   ctrl8 = Key { k8, ctrl = true },
   ctrl9 = Key { k9, ctrl = true },
   ctrlA = Key { a, ctrl = true },
   ctrlB = Key { b, ctrl = true },
   ctrlC = Key { c, ctrl = true },
   ctrlD = Key { d, ctrl = true },
   ctrlE = Key { e, ctrl = true },
   ctrlF = Key { f, ctrl = true },
   ctrlG = Key { g, ctrl = true },
   ctrlH = Key { h, ctrl = true },
   ctrlI = Key { i, ctrl = true },
   ctrlJ = Key { j, ctrl = true },
   ctrlK = Key { k, ctrl = true },
   ctrlL = Key { l, ctrl = true },
   ctrlM = Key { m, ctrl = true },
   ctrlN = Key { n, ctrl = true },
   ctrlO = Key { o, ctrl = true },
   ctrlP = Key { p, ctrl = true },
   ctrlQ = Key { q, ctrl = true },
   ctrlR = Key { r, ctrl = true },
   ctrlS = Key { s, ctrl = true },
   ctrlT = Key { t, ctrl = true },
   ctrlU = Key { u, ctrl = true },
   ctrlV = Key { v, ctrl = true },
   ctrlW = Key { w, ctrl = true },
   ctrlX = Key { x, ctrl = true },
   ctrlY = Key { y, ctrl = true },
   ctrlZ = Key { z, ctrl = true },
   ctrlF1 = Key { f1, ctrl = true },
   ctrlF2 = Key { f2, ctrl = true },
   ctrlF3 = Key { f3, ctrl = true },
   ctrlF4 = Key { f4, ctrl = true },
   ctrlF5 = Key { f5, ctrl = true },
   ctrlF6 = Key { f6, ctrl = true },
   ctrlF7 = Key { f7, ctrl = true },
   ctrlF8 = Key { f8, ctrl = true },
   ctrlF9 = Key { f9, ctrl = true },
   ctrlF10 = Key { f10, ctrl = true },
   ctrlF11 = Key { f11, ctrl = true },
   ctrlF12 = Key { f12, ctrl = true },
   ctrlLeft = Key { left, ctrl = true },
   ctrlRight = Key { right, ctrl = true },
   ctrlUp = Key { up, ctrl = true },
   ctrlDown = Key { down, ctrl = true },
   ctrlEnter = Key { enter, ctrl = true },
   ctrlHome = Key { home, ctrl = true },
   ctrlEnd = Key { end, ctrl = true },
   ctrlPageUp = Key { pageUp, ctrl = true },
   ctrlPageDown = Key { pageDown, ctrl = true },
   ctrlInsert = Key { insert, ctrl = true },
   ctrlSpace = Key { space, ctrl = true },

   shiftTab = Key { tab, shift = true },
   shiftF1 = Key { f1, shift = true },
   shiftF2 = Key { f2, shift = true },
   shiftF3 = Key { f3, shift = true },
   shiftF4 = Key { f4, shift = true },
   shiftF5 = Key { f5, shift = true },
   shiftF6 = Key { f6, shift = true },
   shiftF7 = Key { f7, shift = true },
   shiftF8 = Key { f8, shift = true },
   shiftF9 = Key { f9, shift = true },
   shiftF10 = Key { f10, shift = true },
   shiftF11 = Key { f11, shift = true },
   shiftF12 = Key { f12, shift = true },
   shiftInsert = Key { insert, shift = true },
   shiftDel = Key { del, shift = true }
};
