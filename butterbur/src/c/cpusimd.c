/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2008-2016 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 *
 * The SIMD trigonometry functions are Copyright (C) 2007  Julien Pommier
 * See copyright notice for simd4f_sin_ps(), simd4f_cos_ps(), simd4f_sincos_ps()
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 * claim that you wrote the original software. If you use this software
 * in a product, an acknowledgment in the product documentation would be
 * appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 * misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * -----------------------------------------------------------------------------
 */

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <limits.h>

#include <sys/time.h>


#include "cpusimd.h"

#ifndef M_PI
 #define M_PI (3.14159265358979323846)
#endif

////


const uint32_t simd4fSignMask[4] CPU_ALIGN16 = { 0x80000000, 0x80000000, 0x80000000, 0x80000000 };
const uint32_t simd4fSignMaskInv[4] CPU_ALIGN16 = { 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff };
const float simd4fHalf[4] CPU_ALIGN16 = { 0.5, 0.5, 0.5, 0.5 };
const float simd4fOne[4] CPU_ALIGN16 = { 1.0, 1.0, 1.0, 1.0 };
const uint32_t simd4uOne[4] CPU_ALIGN16 = { 1, 1, 1, 1 };
const uint32_t simd4uOneInv[4] CPU_ALIGN16 = { ~1, ~1, ~1, ~1 };
const uint32_t simd4uTwo[4] CPU_ALIGN16 = { 2, 2, 2, 2 };
const uint32_t simd4uFour[4] CPU_ALIGN16 = { 4, 4, 4, 4 };
const float simd4fQuarter[4] CPU_ALIGN16 = { 0.25, 0.25, 0.25, 0.25 };
const float simd4fPi[4] CPU_ALIGN16 = { M_PI, M_PI, M_PI, M_PI };
const float simd4fZeroOneTwoThree[4] CPU_ALIGN16 = { 0.0, 1.0, 2.0, 3.0 };
const uint32_t simd4fAlphaMask[4] CPU_ALIGN16 = { 0x00000000, 0x00000000, 0x00000000, 0xffffffff };
const float simd4f255[4] CPU_ALIGN16 = { 255.0f, 255.0f, 255.0f, 255.0f };
const float simd4f255Inv[4] CPU_ALIGN16 = { 1.0f/255.0f, 1.0f/255.0f, 1.0f/255.0f, 1.0f/255.0f };


/* Copyright (C) 2007  Julien Pommier

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

  (this is the zlib license)
*/


static const float simd4f_cephes_FOPI[4] CPU_ALIGN16 = { 1.27323954473516, 1.27323954473516, 1.27323954473516, 1.27323954473516 };
static const float simd4f_minus_cephes_DP1[4] CPU_ALIGN16 = { -0.78515625, -0.78515625, -0.78515625, -0.78515625 };
static const float simd4f_minus_cephes_DP2[4] CPU_ALIGN16 = { -2.4187564849853515625e-4, -2.4187564849853515625e-4, -2.4187564849853515625e-4, -2.4187564849853515625e-4 };
static const float simd4f_minus_cephes_DP3[4] CPU_ALIGN16 = { -3.77489497744594108e-8, -3.77489497744594108e-8, -3.77489497744594108e-8, -3.77489497744594108e-8 };
static const float simd4f_sincof_p0[4] CPU_ALIGN16 = { -1.9515295891E-4, -1.9515295891E-4, -1.9515295891E-4, -1.9515295891E-4 };
static const float simd4f_sincof_p1[4] CPU_ALIGN16 = { 8.3321608736E-3, 8.3321608736E-3, 8.3321608736E-3, 8.3321608736E-3 };
static const float simd4f_sincof_p2[4] CPU_ALIGN16 = { -1.6666654611E-1, -1.6666654611E-1, -1.6666654611E-1, -1.6666654611E-1 };
static const float simd4f_coscof_p0[4] CPU_ALIGN16 = { 2.443315711809948E-005, 2.443315711809948E-005, 2.443315711809948E-005, 2.443315711809948E-005 };
static const float simd4f_coscof_p1[4] CPU_ALIGN16 = { -1.388731625493765E-003, -1.388731625493765E-003, -1.388731625493765E-003, -1.388731625493765E-003 };
static const float simd4f_coscof_p2[4] CPU_ALIGN16 = { 4.166664568298827E-002, 4.166664568298827E-002, 4.166664568298827E-002, 4.166664568298827E-002 };

__m128 simd4f_sin_ps( __m128 x )
{
  __m128 xmm1, xmm2, xmm3, sign_bit, y;
  __m128i emm0, emm2;

  xmm2 = _mm_setzero_ps();

  sign_bit = x;
  /* take the absolute value */
  x = _mm_and_ps( x, *(__m128 *)simd4fSignMaskInv );
  /* extract the sign bit (upper one) */
  sign_bit = _mm_and_ps(sign_bit, *(__m128 *)simd4fSignMask);

  /* scale by 4/Pi */
  y = _mm_mul_ps(x, *(__m128 *)simd4f_cephes_FOPI);

  /* store the integer part of y in mm0 */
  emm2 = _mm_cvttps_epi32(y);
  /* j=(j+1) & (~1) (see the cephes sources) */
  emm2 = _mm_add_epi32(emm2, *(__m128i*)simd4uOne);
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uOneInv);
  y = _mm_cvtepi32_ps(emm2);

  /* get the swap sign flag */
  emm0 = _mm_and_si128(emm2, *(__m128i*)simd4uFour);
  emm0 = _mm_slli_epi32(emm0, 29);
  /* get the polynom selection mask
     there is one polynom for 0 <= x <= Pi/4
     and another one for Pi/4<x<=Pi/2
     Both branches will be computed.
  */
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uTwo);
  emm2 = _mm_cmpeq_epi32(emm2, _mm_setzero_si128());

  __m128 swap_sign_bit = _mm_castsi128_ps(emm0);
  __m128 poly_mask = _mm_castsi128_ps(emm2);
  sign_bit = _mm_xor_ps(sign_bit, swap_sign_bit);

  /* The magic pass: "Extended precision modular arithmetic"
     x = ((x - y * DP1) - y * DP2) - y * DP3; */
  xmm1 = *(__m128 *)simd4f_minus_cephes_DP1;
  xmm2 = *(__m128 *)simd4f_minus_cephes_DP2;
  xmm3 = *(__m128 *)simd4f_minus_cephes_DP3;
  xmm1 = _mm_mul_ps(y, xmm1);
  xmm2 = _mm_mul_ps(y, xmm2);
  xmm3 = _mm_mul_ps(y, xmm3);
  x = _mm_add_ps(x, xmm1);
  x = _mm_add_ps(x, xmm2);
  x = _mm_add_ps(x, xmm3);

  /* Evaluate the first polynom  (0 <= x <= Pi/4) */
  y = *(__m128 *)simd4f_coscof_p0;
  __m128 z = _mm_mul_ps(x,x);

  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128 *)simd4f_coscof_p1);
  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128 *)simd4f_coscof_p2);
  y = _mm_mul_ps(y, z);
  y = _mm_mul_ps(y, z);
  __m128 tmp = _mm_mul_ps(z, *(__m128 *)simd4fHalf);
  y = _mm_sub_ps(y, tmp);
  y = _mm_add_ps(y, *(__m128 *)simd4fOne);

  /* Evaluate the second polynom  (Pi/4 <= x <= 0) */

  __m128 y2 = *(__m128 *)simd4f_sincof_p0;
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128 *)simd4f_sincof_p1);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128 *)simd4f_sincof_p2);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_mul_ps(y2, x);
  y2 = _mm_add_ps(y2, x);

  /* select the correct result from the two polynoms */
  xmm3 = poly_mask;
  y2 = _mm_and_ps(xmm3, y2);
  y = _mm_andnot_ps(xmm3, y);
  y = _mm_add_ps(y,y2);
  /* update the sign */
  y = _mm_xor_ps(y, sign_bit);

  return y;
}



/* almost the same as sin_ps */
__m128 simd4f_cos_ps( __m128 x )
{
  __m128 xmm1, xmm2, xmm3, y;
  __m128i emm0, emm2;

  xmm2 = _mm_setzero_ps();

  /* take the absolute value */
  x = _mm_and_ps(x, *(__m128*)simd4fSignMaskInv);

  /* scale by 4/Pi */
  y = _mm_mul_ps(x, *(__m128*)simd4f_cephes_FOPI);

  /* store the integer part of y in mm0 */
  emm2 = _mm_cvttps_epi32(y);
  /* j=(j+1) & (~1) (see the cephes sources) */
  emm2 = _mm_add_epi32(emm2, *(__m128i*)simd4uOne);
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uOneInv);
  y = _mm_cvtepi32_ps(emm2);

  emm2 = _mm_sub_epi32(emm2, *(__m128i*)simd4uTwo);

  /* get the swap sign flag */
  emm0 = _mm_andnot_si128(emm2, *(__m128i*)simd4uFour);
  emm0 = _mm_slli_epi32(emm0, 29);
  /* get the polynom selection mask */
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uTwo);
  emm2 = _mm_cmpeq_epi32(emm2, _mm_setzero_si128());

  __m128 sign_bit = _mm_castsi128_ps(emm0);
  __m128 poly_mask = _mm_castsi128_ps(emm2);
  /* The magic pass: "Extended precision modular arithmetic"
     x = ((x - y * DP1) - y * DP2) - y * DP3; */
  xmm1 = *(__m128*)simd4f_minus_cephes_DP1;
  xmm2 = *(__m128*)simd4f_minus_cephes_DP2;
  xmm3 = *(__m128*)simd4f_minus_cephes_DP3;
  xmm1 = _mm_mul_ps(y, xmm1);
  xmm2 = _mm_mul_ps(y, xmm2);
  xmm3 = _mm_mul_ps(y, xmm3);
  x = _mm_add_ps(x, xmm1);
  x = _mm_add_ps(x, xmm2);
  x = _mm_add_ps(x, xmm3);

  /* Evaluate the first polynom  (0 <= x <= Pi/4) */
  y = *(__m128*)simd4f_coscof_p0;
  __m128 z = _mm_mul_ps(x,x);

  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128*)simd4f_coscof_p1);
  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128*)simd4f_coscof_p2);
  y = _mm_mul_ps(y, z);
  y = _mm_mul_ps(y, z);
  __m128 tmp = _mm_mul_ps(z, *(__m128*)simd4fHalf);
  y = _mm_sub_ps(y, tmp);
  y = _mm_add_ps(y, *(__m128*)simd4fOne);

  /* Evaluate the second polynom  (Pi/4 <= x <= 0) */

  __m128 y2 = *(__m128*)simd4f_sincof_p0;
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128*)simd4f_sincof_p1);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128*)simd4f_sincof_p2);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_mul_ps(y2, x);
  y2 = _mm_add_ps(y2, x);

  /* select the correct result from the two polynoms */
  xmm3 = poly_mask;
  y2 = _mm_and_ps(xmm3, y2); //, xmm3);
  y = _mm_andnot_ps(xmm3, y);
  y = _mm_add_ps(y,y2);
  /* update the sign */
  y = _mm_xor_ps(y, sign_bit);

  return y;
}

/* since sin_ps and cos_ps are almost identical, sincos_ps could replace both of them..
   it is almost as fast, and gives you a free cosine with your sine */
void simd4f_sincos_ps( __m128 x, __m128 *s, __m128 *c )
{
  __m128 xmm1, xmm2, xmm3, sign_bit_sin, y;
  __m128i emm0, emm2, emm4;

  xmm3 = _mm_setzero_ps();

  sign_bit_sin = x;
  /* take the absolute value */
  x = _mm_and_ps(x, *(__m128*)simd4fSignMaskInv);
  /* extract the sign bit (upper one) */
  sign_bit_sin = _mm_and_ps(sign_bit_sin, *(__m128*)simd4fSignMask);

  /* scale by 4/Pi */
  y = _mm_mul_ps(x, *(__m128*)simd4f_cephes_FOPI);

  /* store the integer part of y in emm2 */
  emm2 = _mm_cvttps_epi32(y);

  /* j=(j+1) & (~1) (see the cephes sources) */
  emm2 = _mm_add_epi32(emm2, *(__m128i*)simd4uOne);
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uOneInv);
  y = _mm_cvtepi32_ps(emm2);

  emm4 = emm2;

  /* get the swap sign flag for the sine */
  emm0 = _mm_and_si128(emm2, *(__m128i*)simd4uFour);
  emm0 = _mm_slli_epi32(emm0, 29);
  __m128 swap_sign_bit_sin = _mm_castsi128_ps(emm0);

  /* get the polynom selection mask for the sine*/
  emm2 = _mm_and_si128(emm2, *(__m128i*)simd4uTwo);
  emm2 = _mm_cmpeq_epi32(emm2, _mm_setzero_si128());
  __m128 poly_mask = _mm_castsi128_ps(emm2);

  /* The magic pass: "Extended precision modular arithmetic"
     x = ((x - y * DP1) - y * DP2) - y * DP3; */
  xmm1 = *(__m128*)simd4f_minus_cephes_DP1;
  xmm2 = *(__m128*)simd4f_minus_cephes_DP2;
  xmm3 = *(__m128*)simd4f_minus_cephes_DP3;
  xmm1 = _mm_mul_ps(y, xmm1);
  xmm2 = _mm_mul_ps(y, xmm2);
  xmm3 = _mm_mul_ps(y, xmm3);
  x = _mm_add_ps(x, xmm1);
  x = _mm_add_ps(x, xmm2);
  x = _mm_add_ps(x, xmm3);

  emm4 = _mm_sub_epi32(emm4, *(__m128i*)simd4uTwo);
  emm4 = _mm_andnot_si128(emm4, *(__m128i*)simd4uFour);
  emm4 = _mm_slli_epi32(emm4, 29);
  __m128 sign_bit_cos = _mm_castsi128_ps(emm4);

  sign_bit_sin = _mm_xor_ps(sign_bit_sin, swap_sign_bit_sin);

  /* Evaluate the first polynom  (0 <= x <= Pi/4) */
  __m128 z = _mm_mul_ps(x,x);
  y = *(__m128*)simd4f_coscof_p0;

  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128*)simd4f_coscof_p1);
  y = _mm_mul_ps(y, z);
  y = _mm_add_ps(y, *(__m128*)simd4f_coscof_p2);
  y = _mm_mul_ps(y, z);
  y = _mm_mul_ps(y, z);
  __m128 tmp = _mm_mul_ps(z, *(__m128*)simd4fHalf);
  y = _mm_sub_ps(y, tmp);
  y = _mm_add_ps(y, *(__m128*)simd4fOne);

  /* Evaluate the second polynom  (Pi/4 <= x <= 0) */

  __m128 y2 = *(__m128*)simd4f_sincof_p0;
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128*)simd4f_sincof_p1);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_add_ps(y2, *(__m128*)simd4f_sincof_p2);
  y2 = _mm_mul_ps(y2, z);
  y2 = _mm_mul_ps(y2, x);
  y2 = _mm_add_ps(y2, x);

  /* select the correct result from the two polynoms */
  xmm3 = poly_mask;
  __m128 ysin2 = _mm_and_ps(xmm3, y2);
  __m128 ysin1 = _mm_andnot_ps(xmm3, y);
  y2 = _mm_sub_ps(y2,ysin2);
  y = _mm_sub_ps(y, ysin1);

  xmm1 = _mm_add_ps(ysin1,ysin2);
  xmm2 = _mm_add_ps(y,y2);

  /* update the sign */
  *s = _mm_xor_ps(xmm1, sign_bit_sin);
  *c = _mm_xor_ps(xmm2, sign_bit_cos);
}
