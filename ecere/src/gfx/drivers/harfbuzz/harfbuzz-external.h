/*******************************************************************
 *
 *  Copyright 2007  Trolltech ASA
 *
 *  This is part of HarfBuzz, an OpenType Layout engine library.
 *
 *  See the file name COPYING for licensing information.
 *
 ******************************************************************/
#ifndef HARFBUZZ_EXTERNAL_H
#define HARFBUZZ_EXTERNAL_H

#include <harfbuzz-global.h>

HB_BEGIN_HEADER

/* This header contains some methods that are not part of
   Harfbuzz itself, but referenced by it.
   They need to be provided by the application/library
*/


/*
 see http://www.unicode.org/reports/tr14/tr14-19.html
 we don't use the XX, AI and CB properties and map them to AL instead.
 as we don't support any EBDIC based OS'es, NL is ignored and mapped to AL as well.
*/
typedef enum {
    HB_LineBreak_OP, HB_LineBreak_CL, HB_LineBreak_QU, HB_LineBreak_GL, HB_LineBreak_NS,
    HB_LineBreak_EX, HB_LineBreak_SY, HB_LineBreak_IS, HB_LineBreak_PR, HB_LineBreak_PO,
    HB_LineBreak_NU, HB_LineBreak_AL, HB_LineBreak_ID, HB_LineBreak_IN, HB_LineBreak_HY,
    HB_LineBreak_BA, HB_LineBreak_BB, HB_LineBreak_B2, HB_LineBreak_ZW, HB_LineBreak_CM,
    HB_LineBreak_WJ, HB_LineBreak_H2, HB_LineBreak_H3, HB_LineBreak_JL, HB_LineBreak_JV,
    HB_LineBreak_JT, HB_LineBreak_SA, HB_LineBreak_SG,
    HB_LineBreak_SP, HB_LineBreak_CR, HB_LineBreak_LF, HB_LineBreak_BK
} HB_LineBreakClass;

typedef enum 
{
    HB_NoCategory,

    HB_Mark_NonSpacing,          /*   Mn */
    HB_Mark_SpacingCombining,    /*   Mc */
    HB_Mark_Enclosing,           /*   Me */

    HB_Number_DecimalDigit,      /*   Nd */
    HB_Number_Letter,            /*   Nl */
    HB_Number_Other,             /*   No */

    HB_Separator_Space,          /*   Zs */
    HB_Separator_Line,           /*   Zl */
    HB_Separator_Paragraph,      /*   Zp */

    HB_Other_Control,            /*   Cc */
    HB_Other_Format,             /*   Cf */
    HB_Other_Surrogate,          /*   Cs */
    HB_Other_PrivateUse,         /*   Co */
    HB_Other_NotAssigned,        /*   Cn */

    HB_Letter_Uppercase,         /*   Lu */
    HB_Letter_Lowercase,         /*   Ll */
    HB_Letter_Titlecase,         /*   Lt */
    HB_Letter_Modifier,          /*   Lm */
    HB_Letter_Other,             /*   Lo */

    HB_Punctuation_Connector,    /*   Pc */
    HB_Punctuation_Dash,         /*   Pd */
    HB_Punctuation_Open,         /*   Ps */
    HB_Punctuation_Close,        /*   Pe */
    HB_Punctuation_InitialQuote, /*   Pi */
    HB_Punctuation_FinalQuote,   /*   Pf */
    HB_Punctuation_Other,        /*   Po */

    HB_Symbol_Math,              /*   Sm */
    HB_Symbol_Currency,          /*   Sc */
    HB_Symbol_Modifier,          /*   Sk */
    HB_Symbol_Other              /*   So */
} HB_CharCategory;

HB_LineBreakClass HB_GetLineBreakClass(HB_UChar32 ch);
void HB_GetUnicodeCharProperties(HB_UChar32 ch, HB_CharCategory *category, int *combiningClass);
HB_CharCategory HB_GetUnicodeCharCategory(HB_UChar32 ch);
int HB_GetUnicodeCharCombiningClass(HB_UChar32 ch);
HB_UChar16 HB_GetMirroredChar(HB_UChar16 ch);

HB_END_HEADER

#endif
