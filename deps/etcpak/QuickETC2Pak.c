/*
   A slimmed down C port of etcpak with QuickETC2 patch
    - etcpak: https://github.com/wolfpld/etcpak
    - QuickETC2 patches from Nah Jae-Ho (https://nahjaeho.github.io/) on top of etcpak ~0.7 5c1021b
      https://dl.acm.org/doi/10.1145/3414685.3417787
*/
#include <stddef.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <assert.h>

#if (defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__) || defined(_M_X64) || defined(_WIN64) || defined(__LP64__) || defined(__LLP64__)
#define _64_BIT_ARCH
#endif

#if defined __SSE4_1__ || defined __AVX2__ || (defined _MSC_VER && !defined(__UWP__))
#include <x86intrin.h>
#endif

#if defined(__UWP__)
#undef __ARM_NEON
#endif

#ifndef _bswap
#define _bswap(x) __builtin_bswap32(x)
#endif

#ifndef _bswap64
#define _bswap64(x) __builtin_bswap64(x)
#endif

#ifdef __AVX2__
#include <immintrin.h>
#endif

#ifdef __SSE4_1__
#include <smmintrin.h>
#endif

#ifdef __ARM_NEON
#include <arm_neon.h>
#endif

#define QUICK_ETC2

#ifdef QUICK_ETC2
#define MAXIMUM_ERROR 1065369600 // ((38+76+14) * 255)^2
#define QUICK_ETC2_TH // Full ETC2 mode

#endif

#if defined(__GNUC__)
#  define etcpak_force_inline __attribute__((always_inline)) inline
#elif defined(_MSC_VER)
#  define etcpak_force_inline __forceinline
#else
#  define etcpak_force_inline inline
#endif

#if defined(__GNUC__)
#  define etcpak_no_inline __attribute__((noinline))
#elif defined(_MSC_VER)
#  define etcpak_no_inline __declspec(noinline)
#else
#  define etcpak_no_inline
#endif

#define constexpr

#define Min(a, b) ({__typeof(a) ta = (a), tb = (b); ta < tb ? ta : tb;})
#define Max(a, b) ({__typeof(a) ta = (a), tb = (b); ta > tb ? ta : tb;})
#define MAXINT ((int)0x7fffffff)
#define alignas(x) __attribute__((aligned(x)))

typedef struct PairUI64 { uint64_t first, second; } PairUI64;


#ifdef QUICK_ETC2
// thresholds for the early compression-mode decision scheme
// default: 0.03, 0.09, and 0.38
float ecmd_threshold[3] = {0.03f, 0.09f, 0.38f};
#endif //QUICK_ETC2

#if 0 // Dithering is not currently used (not supporting alpha channel?)

#ifdef __AVX2__
void DitherAvx2( uint8_t* data, __m128i px0, __m128i px1, __m128i px2, __m128i px3 )
{
    static constexpr uint8_t a31[] = { 0, 0, 0, 1, 2, 0, 4, 0, 0, 2, 0, 0, 4, 0, 3, 0 };
    static constexpr uint8_t a63[] = { 0, 0, 0, 0, 1, 0, 2, 0, 0, 1, 0, 0, 2, 0, 1, 0 };
    static constexpr uint8_t s31[] = { 5, 0, 4, 0, 0, 2, 0, 1, 3, 0, 4, 0, 0, 0, 0, 2 };
    static constexpr uint8_t s63[] = { 2, 0, 2, 0, 0, 1, 0, 0, 1, 0, 2, 0, 0, 0, 0, 1 };

    const __m256i BayerAdd0 = _mm256_setr_epi8(
        a31[0], a63[0], a31[0], 0, a31[1], a63[1], a31[1], 0, a31[2], a63[2], a31[2], 0, a31[3], a63[3], a31[3], 0,
        a31[4], a63[4], a31[4], 0, a31[5], a63[5], a31[5], 0, a31[6], a63[6], a31[6], 0, a31[7], a63[7], a31[7], 0
    );
    const __m256i BayerAdd1 = _mm256_setr_epi8(
        a31[8],  a63[8],  a31[8],  0, a31[9],  a63[9],  a31[9],  0, a31[10], a63[10], a31[10], 0, a31[11], a63[11], a31[11], 0,
        a31[12], a63[12], a31[12], 0, a31[13], a63[13], a31[13], 0, a31[14], a63[14], a31[14], 0, a31[15], a63[15], a31[15], 0
    );
    const __m256i BayerSub0 = _mm256_setr_epi8(
        s31[0], s63[0], s31[0], 0, s31[1], s63[1], s31[1], 0, s31[2], s63[2], s31[2], 0, s31[3], s63[3], s31[3], 0,
        s31[4], s63[4], s31[4], 0, s31[5], s63[5], s31[5], 0, s31[6], s63[6], s31[6], 0, s31[7], s63[7], s31[7], 0
    );
    const __m256i BayerSub1 = _mm256_setr_epi8(
        s31[8],  s63[8],  s31[8],  0, s31[9],  s63[9],  s31[9],  0, s31[10], s63[10], s31[10], 0, s31[11], s63[11], s31[11], 0,
        s31[12], s63[12], s31[12], 0, s31[13], s63[13], s31[13], 0, s31[14], s63[14], s31[14], 0, s31[15], s63[15], s31[15], 0
    );

    __m256i l0 = _mm256_inserti128_si256( _mm256_castsi128_si256( px0 ), px1, 1 );
    __m256i l1 = _mm256_inserti128_si256( _mm256_castsi128_si256( px2 ), px3, 1 );

    __m256i a0 = _mm256_adds_epu8( l0, BayerAdd0 );
    __m256i a1 = _mm256_adds_epu8( l1, BayerAdd1 );
    __m256i s0 = _mm256_subs_epu8( a0, BayerSub0 );
    __m256i s1 = _mm256_subs_epu8( a1, BayerSub1 );

    _mm256_storeu_si256( (__m256i*)(data   ), s0 );
    _mm256_storeu_si256( (__m256i*)(data+32), s1 );

}
#endif

void Dither( uint8_t* data )
{
#ifdef __AVX2__
    static constexpr uint8_t a31[] = { 0, 0, 0, 1, 2, 0, 4, 0, 0, 2, 0, 0, 4, 0, 3, 0 };
    static constexpr uint8_t a63[] = { 0, 0, 0, 0, 1, 0, 2, 0, 0, 1, 0, 0, 2, 0, 1, 0 };
    static constexpr uint8_t s31[] = { 5, 0, 4, 0, 0, 2, 0, 1, 3, 0, 4, 0, 0, 0, 0, 2 };
    static constexpr uint8_t s63[] = { 2, 0, 2, 0, 0, 1, 0, 0, 1, 0, 2, 0, 0, 0, 0, 1 };

    const __m256i BayerAdd0 = _mm256_setr_epi8(
        a31[0], a63[0], a31[0], 0, a31[1], a63[1], a31[1], 0, a31[2], a63[2], a31[2], 0, a31[3], a63[3], a31[3], 0,
        a31[4], a63[4], a31[4], 0, a31[5], a63[5], a31[5], 0, a31[6], a63[6], a31[6], 0, a31[7], a63[7], a31[7], 0
    );
    const __m256i BayerAdd1 = _mm256_setr_epi8(
        a31[8],  a63[8],  a31[8],  0, a31[9],  a63[9],  a31[9],  0, a31[10], a63[10], a31[10], 0, a31[11], a63[11], a31[11], 0,
        a31[12], a63[12], a31[12], 0, a31[13], a63[13], a31[13], 0, a31[14], a63[14], a31[14], 0, a31[15], a63[15], a31[15], 0
    );
    const __m256i BayerSub0 = _mm256_setr_epi8(
        s31[0], s63[0], s31[0], 0, s31[1], s63[1], s31[1], 0, s31[2], s63[2], s31[2], 0, s31[3], s63[3], s31[3], 0,
        s31[4], s63[4], s31[4], 0, s31[5], s63[5], s31[5], 0, s31[6], s63[6], s31[6], 0, s31[7], s63[7], s31[7], 0
    );
    const __m256i BayerSub1 = _mm256_setr_epi8(
        s31[8],  s63[8],  s31[8],  0, s31[9],  s63[9],  s31[9],  0, s31[10], s63[10], s31[10], 0, s31[11], s63[11], s31[11], 0,
        s31[12], s63[12], s31[12], 0, s31[13], s63[13], s31[13], 0, s31[14], s63[14], s31[14], 0, s31[15], s63[15], s31[15], 0
    );

    __m256i px0 = _mm256_loadu_si256( (__m256i*)(data   ) );
    __m256i px1 = _mm256_loadu_si256( (__m256i*)(data+32) );

    __m256i a0 = _mm256_adds_epu8( px0, BayerAdd0 );
    __m256i a1 = _mm256_adds_epu8( px1, BayerAdd1 );
    __m256i s0 = _mm256_subs_epu8( a0, BayerSub0 );
    __m256i s1 = _mm256_subs_epu8( a1, BayerSub1 );

    _mm256_storeu_si256( (__m256i*)(data   ), s0 );
    _mm256_storeu_si256( (__m256i*)(data+32), s1 );
#else
    static constexpr int8_t Bayer31[16] = {
        ( 0-8)*2/3, ( 8-8)*2/3, ( 2-8)*2/3, (10-8)*2/3,
        (12-8)*2/3, ( 4-8)*2/3, (14-8)*2/3, ( 6-8)*2/3,
        ( 3-8)*2/3, (11-8)*2/3, ( 1-8)*2/3, ( 9-8)*2/3,
        (15-8)*2/3, ( 7-8)*2/3, (13-8)*2/3, ( 5-8)*2/3
    };
    static constexpr int8_t Bayer63[16] = {
        ( 0-8)*2/6, ( 8-8)*2/6, ( 2-8)*2/6, (10-8)*2/6,
        (12-8)*2/6, ( 4-8)*2/6, (14-8)*2/6, ( 6-8)*2/6,
        ( 3-8)*2/6, (11-8)*2/6, ( 1-8)*2/6, ( 9-8)*2/6,
        (15-8)*2/6, ( 7-8)*2/6, (13-8)*2/6, ( 5-8)*2/6
    };
    int i;

    for( i=0; i<16; i++ )
    {
        uint32_t col;
        memcpy( &col, data, 4 );
        uint8_t r = col & 0xFF;
        uint8_t g = ( col >> 8 ) & 0xFF;
        uint8_t b = ( col >> 16 ) & 0xFF;

        r = clampu8( r + Bayer31[i] );
        g = clampu8( g + Bayer63[i] );
        b = clampu8( b + Bayer31[i] );

        col = r | ( g << 8 ) | ( b << 16 );
        memcpy( data, &col, 4 );
        data += 4;
    }
#endif
}

#endif

static etcpak_force_inline uint8_t clampu8( int32_t val )
{
    if( ( val & ~0xFF ) == 0 ) return val;
    return ( ( ~val ) >> 31 ) & 0xFF;
}

static etcpak_force_inline int64_t sq64( int64_t val )
{
   return val * val;
}

static etcpak_force_inline int sq( int val )
{
   return val * val;
}

static etcpak_force_inline int mul8bit( int a, int b )
{
    int t = a*b + 128;
    return ( t + ( t >> 8 ) ) >> 8;
}

static size_t GetLeastError32( const uint32_t * err, size_t num ) { size_t idx = 0; size_t i; for( i=1; i<num; i++ ) if( err[i] < err[idx] ) idx = i; return idx; }
__attribute__((unused)) static size_t GetLeastError64( const uint64_t * err, size_t num ) { size_t idx = 0; size_t i; for( i=1; i<num; i++ ) if( err[i] < err[idx] ) idx = i; return idx; }

static uint64_t FixByteOrder( uint64_t d )
{
    return ( ( d & 0x00000000FFFFFFFF ) ) |
           ( ( d & 0xFF00000000000000 ) >> 24 ) |
           ( ( d & 0x000000FF00000000 ) << 24 ) |
           ( ( d & 0x00FF000000000000 ) >> 8 ) |
           ( ( d & 0x0000FF0000000000 ) << 8 );
}

#if ( defined __SSE4_1__ || defined __ARM_NEON ) && !defined REFERENCE_IMPLEMENTATION
typedef uint32_t TSelectorError;
#define GetLeastErrorSel GetLeastError32
#else
typedef uint64_t TSelectorError;
#define GetLeastErrorSel GetLeastError64
#endif
typedef uint16_t TSelector;

__attribute__((unused)) static uint64_t EncodeSelectors( uint64_t d, const TSelectorError terr[2][8], const TSelector tsel[16][8], const uint32_t* id )
{
    size_t tidx[2];
    int i;
    tidx[0] = GetLeastErrorSel( terr[0], 8 );
    tidx[1] = GetLeastErrorSel( terr[1], 8 );

    d |= tidx[0] << 26;
    d |= tidx[1] << 29;
    for(i=0; i<16; i++)
    {
        uint64_t t = tsel[i][tidx[id[i]%2]];
        d |= ( t & 0x1 ) << ( i + 32 );
        d |= ( t & 0x2 ) << ( i + 47 );
    }

    return d;
}


// ETCPACK math macros and definitions
#define CLAMP(ll,x,ul) (((x)<(ll)) ? (ll) : (((x)>(ul)) ? (ul) : (x)))
#define CLAMP_L(ll,x) (((x)<(ll)) ? (ll) : (x))
#define CLAMP_R(x,ul) (((x)>(ul)) ? (ul) : (x))
#define SQUARE(x) ((x)*(x))
#define SHIFT(size,startpos) ((startpos)-(size)+1)
#define MASK(size, startpos) (((2LL<<(size-1))-1) << SHIFT(size,startpos))
#define PUTBITS( dest, data, size, startpos) dest = ((dest & ~MASK(size, startpos)) | ((data << SHIFT(size, startpos)) & MASK(size,startpos)))
#define GETBITS(source, size, startpos)      (( (source) >> ( (startpos)    -(size)+1) ) & ((1<<(size)) -1))
#define SHIFTHIGH(size, startpos) (((startpos)-32)-(size)+1)
#define MASKHIGH(size, startpos) (((1<<(size))-1) << SHIFTHIGH(size,startpos))
#define PUTBITSHIGH(dest, data, size, startpos) dest = ((dest & ~MASKHIGH(size, startpos)) | ((data << SHIFTHIGH(size, startpos)) & MASKHIGH(size,startpos)))
#define GETBITSHIGH(source, size, startpos)  (( (source) >> (((startpos)-32)-(size)+1) ) & ((1<<(size)) -1))

// reversed RGB order for etcpak
const unsigned int R = 2;
const unsigned int G = 1;
const unsigned int B = 0;

// common T-/H-mode table
static uint8_t tableTH[8] = { 3,6,11,16,23,32,41,64 };  // 3-bit table for the 59-/58-bit T-/H-mode

// three decoding functions come from ETCPACK v2.74 and are slightly changed.
static void decompressColor(uint8_t(colors_RGB444)[2][3], uint8_t(colors)[2][3])
{
    // The color should be retrieved as:
    //
    // c = round(255/(r_bits^2-1))*comp_color
    //
    // This is similar to bit replication
    //
    // Note -- this code only work for bit replication from 4 bits and up --- 3 bits needs
    // two copy operations.
    colors[0][R] = (colors_RGB444[0][R] << 4) | colors_RGB444[0][R];
    colors[0][G] = (colors_RGB444[0][G] << 4) | colors_RGB444[0][G];
    colors[0][B] = (colors_RGB444[0][B] << 4) | colors_RGB444[0][B];
    colors[1][R] = (colors_RGB444[1][R] << 4) | colors_RGB444[1][R];
    colors[1][G] = (colors_RGB444[1][G] << 4) | colors_RGB444[1][G];
    colors[1][B] = (colors_RGB444[1][B] << 4) | colors_RGB444[1][B];
}

// calculates the paint colors from the block colors
// using a distance d and one of the H- or T-patterns.
static void calculatePaintColors59T(uint8_t d, uint8_t(colors)[2][3], uint8_t(possible_colors)[4][3])
{
    //////////////////////////////////////////////
    //
    //		C3      C1		C4----C1---C2
    //		|		|			  |
    //		|		|			  |
    //		|-------|			  |
    //		|		|			  |
    //		|		|			  |
    //		C4      C2			  C3
    //
    //////////////////////////////////////////////

    // C4
    possible_colors[3][R] = CLAMP_L(0, colors[1][R] - tableTH[d]);
    possible_colors[3][G] = CLAMP_L(0, colors[1][G] - tableTH[d]);
    possible_colors[3][B] = CLAMP_L(0, colors[1][B] - tableTH[d]);

    // C3
    possible_colors[0][R] = colors[0][R];
    possible_colors[0][G] = colors[0][G];
    possible_colors[0][B] = colors[0][B];
    // C2
    possible_colors[1][R] = CLAMP_R(colors[1][R] + tableTH[d], 255);
    possible_colors[1][G] = CLAMP_R(colors[1][G] + tableTH[d], 255);
    possible_colors[1][B] = CLAMP_R(colors[1][B] + tableTH[d], 255);
    // C1
    possible_colors[2][R] = colors[1][R];
    possible_colors[2][G] = colors[1][G];
    possible_colors[2][B] = colors[1][B];
}

static void calculatePaintColors58H(uint8_t d, uint8_t(colors)[2][3], uint8_t(possible_colors)[4][3])
{
    possible_colors[3][R] = CLAMP_L(0, colors[1][R] - tableTH[d]);
    possible_colors[3][G] = CLAMP_L(0, colors[1][G] - tableTH[d]);
    possible_colors[3][B] = CLAMP_L(0, colors[1][B] - tableTH[d]);

    // C1
    possible_colors[0][R] = CLAMP_R(colors[0][R] + tableTH[d], 255);
    possible_colors[0][G] = CLAMP_R(colors[0][G] + tableTH[d], 255);
    possible_colors[0][B] = CLAMP_R(colors[0][B] + tableTH[d], 255);
    // C2
    possible_colors[1][R] = CLAMP_L(0, colors[0][R] - tableTH[d]);
    possible_colors[1][G] = CLAMP_L(0, colors[0][G] - tableTH[d]);
    possible_colors[1][B] = CLAMP_L(0, colors[0][B] - tableTH[d]);
    // C3
    possible_colors[2][R] = CLAMP_R(colors[1][R] + tableTH[d], 255);
    possible_colors[2][G] = CLAMP_R(colors[1][G] + tableTH[d], 255);
    possible_colors[2][B] = CLAMP_R(colors[1][B] + tableTH[d], 255);
}


const int32_t g_table[8][4] = {
    {  2,  8,   -2,   -8 },
    {  5, 17,   -5,  -17 },
    {  9, 29,   -9,  -29 },
    { 13, 42,  -13,  -42 },
    { 18, 60,  -18,  -60 },
    { 24, 80,  -24,  -80 },
    { 33, 106, -33, -106 },
    { 47, 183, -47, -183 }
};

const int64_t g_table256[8][4] = {
    {  2*256,  8*256,   -2*256,   -8*256 },
    {  5*256, 17*256,   -5*256,  -17*256 },
    {  9*256, 29*256,   -9*256,  -29*256 },
    { 13*256, 42*256,  -13*256,  -42*256 },
    { 18*256, 60*256,  -18*256,  -60*256 },
    { 24*256, 80*256,  -24*256,  -80*256 },
    { 33*256, 106*256, -33*256, -106*256 },
    { 47*256, 183*256, -47*256, -183*256 }
};

const uint32_t g_id[4][16] = {
    { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2 },
    { 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4 },
    { 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6 }
};

const uint32_t g_avg2[16] = {
    0x00,
    0x11,
    0x22,
    0x33,
    0x44,
    0x55,
    0x66,
    0x77,
    0x88,
    0x99,
    0xAA,
    0xBB,
    0xCC,
    0xDD,
    0xEE,
    0xFF
};

const uint32_t g_flags[64] = {
    0x80800402, 0x80800402, 0x80800402, 0x80800402,
    0x80800402, 0x80800402, 0x80800402, 0x8080E002,
    0x80800402, 0x80800402, 0x8080E002, 0x8080E002,
    0x80800402, 0x8080E002, 0x8080E002, 0x8080E002,
    0x80000402, 0x80000402, 0x80000402, 0x80000402,
    0x80000402, 0x80000402, 0x80000402, 0x8000E002,
    0x80000402, 0x80000402, 0x8000E002, 0x8000E002,
    0x80000402, 0x8000E002, 0x8000E002, 0x8000E002,
    0x00800402, 0x00800402, 0x00800402, 0x00800402,
    0x00800402, 0x00800402, 0x00800402, 0x0080E002,
    0x00800402, 0x00800402, 0x0080E002, 0x0080E002,
    0x00800402, 0x0080E002, 0x0080E002, 0x0080E002,
    0x00000402, 0x00000402, 0x00000402, 0x00000402,
    0x00000402, 0x00000402, 0x00000402, 0x0000E002,
    0x00000402, 0x00000402, 0x0000E002, 0x0000E002,
    0x00000402, 0x0000E002, 0x0000E002, 0x0000E002
};

const int32_t g_alpha[16][8] = {
    { -3, -6,  -9, -15, 2, 5, 8, 14 },
    { -3, -7, -10, -13, 2, 6, 9, 12 },
    { -2, -5,  -8, -13, 1, 4, 7, 12 },
    { -2, -4,  -6, -13, 1, 3, 5, 12 },
    { -3, -6,  -8, -12, 2, 5, 7, 11 },
    { -3, -7,  -9, -11, 2, 6, 8, 10 },
    { -4, -7,  -8, -11, 3, 6, 7, 10 },
    { -3, -5,  -8, -11, 2, 4, 7, 10 },
    { -2, -6,  -8, -10, 1, 5, 7,  9 },
    { -2, -5,  -8, -10, 1, 4, 7,  9 },
    { -2, -4,  -8, -10, 1, 3, 7,  9 },
    { -2, -5,  -7, -10, 1, 4, 6,  9 },
    { -3, -4,  -7, -10, 2, 3, 6,  9 },
    { -1, -2,  -3, -10, 0, 1, 2,  9 },
    { -4, -6,  -8,  -9, 3, 5, 7,  8 },
    { -3, -5,  -7,  -9, 2, 4, 6,  8 }
};

/*const */int32_t g_alphaRange[16];

#ifdef __SSE4_1__
__m128i g_table_SIMD[2];
__m128i g_table128_SIMD[2];
__m128i g_table256_SIMD[4];
__m128i g_alpha_SIMD[16];
__m128i g_alphaRange_SIMD;
#endif

#ifdef __AVX2__
__m256i g_alpha_AVX[8];
__m256i g_alphaRange_AVX;
#endif

#ifdef __ARM_NEON
int16x8_t g_table128_NEON[2];
int32x4_t g_table256_NEON[4];
int16x8_t g_alpha_NEON[16];
int16x8_t g_alphaRange_NEON;
#endif

void initETC2Tables(void)
{
   static int initialized = 0;
   if(initialized) return;

   g_alphaRange[0] = 0x100FF / ( 1 + g_alpha[0][7] - g_alpha[0][3] );
   g_alphaRange[1] = 0x100FF / ( 1 + g_alpha[1][7] - g_alpha[1][3] );
   g_alphaRange[2] = 0x100FF / ( 1 + g_alpha[2][7] - g_alpha[2][3] );
   g_alphaRange[3] = 0x100FF / ( 1 + g_alpha[3][7] - g_alpha[3][3] );
   g_alphaRange[4] = 0x100FF / ( 1 + g_alpha[4][7] - g_alpha[4][3] );
   g_alphaRange[5] = 0x100FF / ( 1 + g_alpha[5][7] - g_alpha[5][3] );
   g_alphaRange[6] = 0x100FF / ( 1 + g_alpha[6][7] - g_alpha[6][3] );
   g_alphaRange[7] = 0x100FF / ( 1 + g_alpha[7][7] - g_alpha[7][3] );
   g_alphaRange[8] = 0x100FF / ( 1 + g_alpha[8][7] - g_alpha[8][3] );
   g_alphaRange[9] = 0x100FF / ( 1 + g_alpha[9][7] - g_alpha[9][3] );
   g_alphaRange[10] = 0x100FF / ( 1 + g_alpha[10][7] - g_alpha[10][3] );
   g_alphaRange[11] = 0x100FF / ( 1 + g_alpha[11][7] - g_alpha[11][3] );
   g_alphaRange[12] = 0x100FF / ( 1 + g_alpha[12][7] - g_alpha[12][3] );
   g_alphaRange[13] = 0x100FF / ( 1 + g_alpha[13][7] - g_alpha[13][3] );
   g_alphaRange[14] = 0x100FF / ( 1 + g_alpha[14][7] - g_alpha[14][3] );
   g_alphaRange[15] = 0x100FF / ( 1 + g_alpha[15][7] - g_alpha[15][3] );

   #ifdef __SSE4_1__
   g_table_SIMD[0] = _mm_setr_epi16(   2,   5,   9,  13,  18,  24,  33,  47);
   g_table_SIMD[1] = _mm_setr_epi16(   8,  17,  29,  42,  60,  80, 106, 183);

   g_table128_SIMD[0] = _mm_setr_epi16(   2*128,   5*128,   9*128,  13*128,  18*128,  24*128,  33*128,  47*128);
   g_table128_SIMD[1] = _mm_setr_epi16(   8*128,  17*128,  29*128,  42*128,  60*128,  80*128, 106*128, 183*128);

   g_table256_SIMD[0] = _mm_setr_epi32(  2*256,   5*256,   9*256,  13*256);
   g_table256_SIMD[1] = _mm_setr_epi32(  8*256,  17*256,  29*256,  42*256);
   g_table256_SIMD[2] = _mm_setr_epi32( 18*256,  24*256,  33*256,  47*256);
   g_table256_SIMD[3] = _mm_setr_epi32( 60*256,  80*256, 106*256, 183*256);

   g_alpha_SIMD[0] = _mm_setr_epi16( g_alpha[ 0][0], g_alpha[ 0][1], g_alpha[ 0][2], g_alpha[ 0][3], g_alpha[ 0][4], g_alpha[ 0][5], g_alpha[ 0][6], g_alpha[ 0][7] );
   g_alpha_SIMD[1] = _mm_setr_epi16( g_alpha[ 1][0], g_alpha[ 1][1], g_alpha[ 1][2], g_alpha[ 1][3], g_alpha[ 1][4], g_alpha[ 1][5], g_alpha[ 1][6], g_alpha[ 1][7] );
   g_alpha_SIMD[2] = _mm_setr_epi16( g_alpha[ 2][0], g_alpha[ 2][1], g_alpha[ 2][2], g_alpha[ 2][3], g_alpha[ 2][4], g_alpha[ 2][5], g_alpha[ 2][6], g_alpha[ 2][7] );
   g_alpha_SIMD[3] = _mm_setr_epi16( g_alpha[ 3][0], g_alpha[ 3][1], g_alpha[ 3][2], g_alpha[ 3][3], g_alpha[ 3][4], g_alpha[ 3][5], g_alpha[ 3][6], g_alpha[ 3][7] );
   g_alpha_SIMD[4] = _mm_setr_epi16( g_alpha[ 4][0], g_alpha[ 4][1], g_alpha[ 4][2], g_alpha[ 4][3], g_alpha[ 4][4], g_alpha[ 4][5], g_alpha[ 4][6], g_alpha[ 4][7] );
   g_alpha_SIMD[5] = _mm_setr_epi16( g_alpha[ 5][0], g_alpha[ 5][1], g_alpha[ 5][2], g_alpha[ 5][3], g_alpha[ 5][4], g_alpha[ 5][5], g_alpha[ 5][6], g_alpha[ 5][7] );
   g_alpha_SIMD[6] = _mm_setr_epi16( g_alpha[ 6][0], g_alpha[ 6][1], g_alpha[ 6][2], g_alpha[ 6][3], g_alpha[ 6][4], g_alpha[ 6][5], g_alpha[ 6][6], g_alpha[ 6][7] );
   g_alpha_SIMD[7] = _mm_setr_epi16( g_alpha[ 7][0], g_alpha[ 7][1], g_alpha[ 7][2], g_alpha[ 7][3], g_alpha[ 7][4], g_alpha[ 7][5], g_alpha[ 7][6], g_alpha[ 7][7] );
   g_alpha_SIMD[8] = _mm_setr_epi16( g_alpha[ 8][0], g_alpha[ 8][1], g_alpha[ 8][2], g_alpha[ 8][3], g_alpha[ 8][4], g_alpha[ 8][5], g_alpha[ 8][6], g_alpha[ 8][7] );
   g_alpha_SIMD[9] = _mm_setr_epi16( g_alpha[ 9][0], g_alpha[ 9][1], g_alpha[ 9][2], g_alpha[ 9][3], g_alpha[ 9][4], g_alpha[ 9][5], g_alpha[ 9][6], g_alpha[ 9][7] );
   g_alpha_SIMD[10] = _mm_setr_epi16( g_alpha[10][0], g_alpha[10][1], g_alpha[10][2], g_alpha[10][3], g_alpha[10][4], g_alpha[10][5], g_alpha[10][6], g_alpha[10][7] );
   g_alpha_SIMD[11] = _mm_setr_epi16( g_alpha[11][0], g_alpha[11][1], g_alpha[11][2], g_alpha[11][3], g_alpha[11][4], g_alpha[11][5], g_alpha[11][6], g_alpha[11][7] );
   g_alpha_SIMD[12] = _mm_setr_epi16( g_alpha[12][0], g_alpha[12][1], g_alpha[12][2], g_alpha[12][3], g_alpha[12][4], g_alpha[12][5], g_alpha[12][6], g_alpha[12][7] );
   g_alpha_SIMD[13] = _mm_setr_epi16( g_alpha[13][0], g_alpha[13][1], g_alpha[13][2], g_alpha[13][3], g_alpha[13][4], g_alpha[13][5], g_alpha[13][6], g_alpha[13][7] );
   g_alpha_SIMD[14] = _mm_setr_epi16( g_alpha[14][0], g_alpha[14][1], g_alpha[14][2], g_alpha[14][3], g_alpha[14][4], g_alpha[14][5], g_alpha[14][6], g_alpha[14][7] );
   g_alpha_SIMD[15] = _mm_setr_epi16( g_alpha[15][0], g_alpha[15][1], g_alpha[15][2], g_alpha[15][3], g_alpha[15][4], g_alpha[15][5], g_alpha[15][6], g_alpha[15][7] );

   g_alphaRange_SIMD = _mm_setr_epi16(
       g_alphaRange[0],
       g_alphaRange[1],
       g_alphaRange[4],
       g_alphaRange[5],
       g_alphaRange[8],
       g_alphaRange[14],
       0,
       0 );
   #endif

   #ifdef __AVX2__
   g_alpha_AVX[0] = _mm256_setr_epi16( g_alpha[ 0][0], g_alpha[ 1][0], g_alpha[ 2][0], g_alpha[ 3][0], g_alpha[ 4][0], g_alpha[ 5][0], g_alpha[ 6][0], g_alpha[ 7][0], g_alpha[ 8][0], g_alpha[ 9][0], g_alpha[10][0], g_alpha[11][0], g_alpha[12][0], g_alpha[13][0], g_alpha[14][0], g_alpha[15][0] );
   g_alpha_AVX[1] = _mm256_setr_epi16( g_alpha[ 0][1], g_alpha[ 1][1], g_alpha[ 2][1], g_alpha[ 3][1], g_alpha[ 4][1], g_alpha[ 5][1], g_alpha[ 6][1], g_alpha[ 7][1], g_alpha[ 8][1], g_alpha[ 9][1], g_alpha[10][1], g_alpha[11][1], g_alpha[12][1], g_alpha[13][1], g_alpha[14][1], g_alpha[15][1] ),
   g_alpha_AVX[2] = _mm256_setr_epi16( g_alpha[ 0][2], g_alpha[ 1][2], g_alpha[ 2][2], g_alpha[ 3][2], g_alpha[ 4][2], g_alpha[ 5][2], g_alpha[ 6][2], g_alpha[ 7][2], g_alpha[ 8][2], g_alpha[ 9][2], g_alpha[10][2], g_alpha[11][2], g_alpha[12][2], g_alpha[13][2], g_alpha[14][2], g_alpha[15][2] ),
   g_alpha_AVX[3] = _mm256_setr_epi16( g_alpha[ 0][3], g_alpha[ 1][3], g_alpha[ 2][3], g_alpha[ 3][3], g_alpha[ 4][3], g_alpha[ 5][3], g_alpha[ 6][3], g_alpha[ 7][3], g_alpha[ 8][3], g_alpha[ 9][3], g_alpha[10][3], g_alpha[11][3], g_alpha[12][3], g_alpha[13][3], g_alpha[14][3], g_alpha[15][3] ),
   g_alpha_AVX[4] = _mm256_setr_epi16( g_alpha[ 0][4], g_alpha[ 1][4], g_alpha[ 2][4], g_alpha[ 3][4], g_alpha[ 4][4], g_alpha[ 5][4], g_alpha[ 6][4], g_alpha[ 7][4], g_alpha[ 8][4], g_alpha[ 9][4], g_alpha[10][4], g_alpha[11][4], g_alpha[12][4], g_alpha[13][4], g_alpha[14][4], g_alpha[15][4] ),
   g_alpha_AVX[5] = _mm256_setr_epi16( g_alpha[ 0][5], g_alpha[ 1][5], g_alpha[ 2][5], g_alpha[ 3][5], g_alpha[ 4][5], g_alpha[ 5][5], g_alpha[ 6][5], g_alpha[ 7][5], g_alpha[ 8][5], g_alpha[ 9][5], g_alpha[10][5], g_alpha[11][5], g_alpha[12][5], g_alpha[13][5], g_alpha[14][5], g_alpha[15][5] ),
   g_alpha_AVX[6] = _mm256_setr_epi16( g_alpha[ 0][6], g_alpha[ 1][6], g_alpha[ 2][6], g_alpha[ 3][6], g_alpha[ 4][6], g_alpha[ 5][6], g_alpha[ 6][6], g_alpha[ 7][6], g_alpha[ 8][6], g_alpha[ 9][6], g_alpha[10][6], g_alpha[11][6], g_alpha[12][6], g_alpha[13][6], g_alpha[14][6], g_alpha[15][6] ),
   g_alpha_AVX[7] = _mm256_setr_epi16( g_alpha[ 0][7], g_alpha[ 1][7], g_alpha[ 2][7], g_alpha[ 3][7], g_alpha[ 4][7], g_alpha[ 5][7], g_alpha[ 6][7], g_alpha[ 7][7], g_alpha[ 8][7], g_alpha[ 9][7], g_alpha[10][7], g_alpha[11][7], g_alpha[12][7], g_alpha[13][7], g_alpha[14][7], g_alpha[15][7] ),

   g_alphaRange_AVX = _mm256_setr_epi16(
       g_alphaRange[ 0], g_alphaRange[ 1], g_alphaRange[ 2], g_alphaRange[ 3], g_alphaRange[ 4], g_alphaRange[ 5], g_alphaRange[ 6], g_alphaRange[ 7],
       g_alphaRange[ 8], g_alphaRange[ 9], g_alphaRange[10], g_alphaRange[11], g_alphaRange[12], g_alphaRange[13], g_alphaRange[14], g_alphaRange[15]
   );
   #endif

   #ifdef __ARM_NEON
   g_table128_NEON[0] = { 2*128,   5*128,   9*128,  13*128,  18*128,  24*128,  33*128,  47*128 };
   g_table128_NEON[1] = { 8*128,  17*128,  29*128,  42*128,  60*128,  80*128, 106*128, 183*128 };

   g_table256_NEON[0] = {  2*256,   5*256,   9*256,  13*256 };
   g_table256_NEON[1] = {  8*256,  17*256,  29*256,  42*256 };
   g_table256_NEON[2] = { 18*256,  24*256,  33*256,  47*256 };
   g_table256_NEON[3] = { 60*256,  80*256, 106*256, 183*256 };

   g_alpha_NEON[ 0] = { -3, -6,  -9, -15, 2, 5, 8, 14 };
   g_alpha_NEON[ 1] = { -3, -7, -10, -13, 2, 6, 9, 12 },
   g_alpha_NEON[ 2] = { -2, -5,  -8, -13, 1, 4, 7, 12 },
   g_alpha_NEON[ 3] = { -2, -4,  -6, -13, 1, 3, 5, 12 },
   g_alpha_NEON[ 4] = { -3, -6,  -8, -12, 2, 5, 7, 11 },
   g_alpha_NEON[ 5] = { -3, -7,  -9, -11, 2, 6, 8, 10 },
   g_alpha_NEON[ 6] = { -4, -7,  -8, -11, 3, 6, 7, 10 },
   g_alpha_NEON[ 7] = { -3, -5,  -8, -11, 2, 4, 7, 10 },
   g_alpha_NEON[ 8] = { -2, -6,  -8, -10, 1, 5, 7,  9 },
   g_alpha_NEON[ 9] = { -2, -5,  -8, -10, 1, 4, 7,  9 },
   g_alpha_NEON[10] = { -2, -4,  -8, -10, 1, 3, 7,  9 },
   g_alpha_NEON[11] = { -2, -5,  -7, -10, 1, 4, 6,  9 },
   g_alpha_NEON[12] = { -3, -4,  -7, -10, 2, 3, 6,  9 },
   g_alpha_NEON[13] = { -1, -2,  -3, -10, 0, 1, 2,  9 },
   g_alpha_NEON[14] = { -4, -6,  -8,  -9, 3, 5, 7,  8 },
   g_alpha_NEON[15] = { -3, -5,  -7,  -9, 2, 4, 6,  8 }
   g_alphaRange_NEON =
   {
       (int16_t)g_alphaRange[0],
       (int16_t)g_alphaRange[1],
       (int16_t)g_alphaRange[4],
       (int16_t)g_alphaRange[5],
       (int16_t)g_alphaRange[8],
       (int16_t)g_alphaRange[14],
       0,
       0
   };
   #endif

   initialized = 1;
}


#if defined _MSC_VER && !defined __clang__
static etcpak_force_inline unsigned long _bit_scan_forward( unsigned long mask )
{
    unsigned long ret;
    _BitScanForward( &ret, mask );
    return ret;
}
#endif

typedef uint16_t v4i[4];

#ifdef __AVX2__
static etcpak_force_inline __m256i Sum4_AVX2( const uint8_t* data)
{
    __m128i d0 = _mm_loadu_si128(((__m128i*)data) + 0);
    __m128i d1 = _mm_loadu_si128(((__m128i*)data) + 1);
    __m128i d2 = _mm_loadu_si128(((__m128i*)data) + 2);
    __m128i d3 = _mm_loadu_si128(((__m128i*)data) + 3);

    __m128i dm0 = _mm_and_si128(d0, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm1 = _mm_and_si128(d1, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm2 = _mm_and_si128(d2, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm3 = _mm_and_si128(d3, _mm_set1_epi32(0x00FFFFFF));

    __m256i t0 = _mm256_cvtepu8_epi16(dm0);
    __m256i t1 = _mm256_cvtepu8_epi16(dm1);
    __m256i t2 = _mm256_cvtepu8_epi16(dm2);
    __m256i t3 = _mm256_cvtepu8_epi16(dm3);

    __m256i sum0 = _mm256_add_epi16(t0, t1);
    __m256i sum1 = _mm256_add_epi16(t2, t3);

    __m256i s0 = _mm256_permute2x128_si256(sum0, sum1, (0) | (3 << 4)); // 0, 0, 3, 3
    __m256i s1 = _mm256_permute2x128_si256(sum0, sum1, (1) | (2 << 4)); // 1, 1, 2, 2

    __m256i s2 = _mm256_permute4x64_epi64(s0, _MM_SHUFFLE(1, 3, 0, 2));
    __m256i s3 = _mm256_permute4x64_epi64(s0, _MM_SHUFFLE(0, 2, 1, 3));
    __m256i s4 = _mm256_permute4x64_epi64(s1, _MM_SHUFFLE(3, 1, 0, 2));
    __m256i s5 = _mm256_permute4x64_epi64(s1, _MM_SHUFFLE(2, 0, 1, 3));

    __m256i sum5 = _mm256_add_epi16(s2, s3); //   3,   0,   3,   0
    __m256i sum6 = _mm256_add_epi16(s4, s5); //   2,   1,   1,   2
    return _mm256_add_epi16(sum5, sum6);     // 3+2, 0+1, 3+1, 3+2
}

static etcpak_force_inline __m256i Average_AVX2( const __m256i data)
{
    __m256i a = _mm256_add_epi16(data, _mm256_set1_epi16(4));

    return _mm256_srli_epi16(a, 3);
}

static etcpak_force_inline __m128i CalcErrorBlock_AVX2( const __m256i data, const v4i a[8])
{
    //
    __m256i a0 = _mm256_load_si256((__m256i*)a[0]);
    __m256i a1 = _mm256_load_si256((__m256i*)a[4]);

    // err = 8 * ( sq( average[0] ) + sq( average[1] ) + sq( average[2] ) );
    __m256i a4 = _mm256_madd_epi16(a0, a0);
    __m256i a5 = _mm256_madd_epi16(a1, a1);

    __m256i a6 = _mm256_hadd_epi32(a4, a5);
    __m256i a7 = _mm256_slli_epi32(a6, 3);

    __m256i a8 = _mm256_add_epi32(a7, _mm256_set1_epi32(0x3FFFFFFF)); // Big value to prevent negative values, but small enough to prevent overflow

    // average is not swapped
    // err -= block[0] * 2 * average[0];
    // err -= block[1] * 2 * average[1];
    // err -= block[2] * 2 * average[2];
    __m256i a2 = _mm256_slli_epi16(a0, 1);
    __m256i a3 = _mm256_slli_epi16(a1, 1);
    __m256i b0 = _mm256_madd_epi16(a2, data);
    __m256i b1 = _mm256_madd_epi16(a3, data);

    __m256i b2 = _mm256_hadd_epi32(b0, b1);
    __m256i b3 = _mm256_sub_epi32(a8, b2);
    __m256i b4 = _mm256_hadd_epi32(b3, b3);

    __m256i b5 = _mm256_permutevar8x32_epi32(b4, _mm256_set_epi32(0, 0, 0, 0, 5, 1, 4, 0));

    return _mm256_castsi256_si128(b5);
}

static etcpak_force_inline void ProcessAverages_AVX2(const __m256i d, v4i a[8] )
{
    __m256i t = _mm256_add_epi16(_mm256_mullo_epi16(d, _mm256_set1_epi16(31)), _mm256_set1_epi16(128));

    __m256i c = _mm256_srli_epi16(_mm256_add_epi16(t, _mm256_srli_epi16(t, 8)), 8);

    __m256i c1 = _mm256_shuffle_epi32(c, _MM_SHUFFLE(3, 2, 3, 2));
    __m256i diff = _mm256_sub_epi16(c, c1);
    diff = _mm256_max_epi16(diff, _mm256_set1_epi16(-4));
    diff = _mm256_min_epi16(diff, _mm256_set1_epi16(3));

    __m256i co = _mm256_add_epi16(c1, diff);

    c = _mm256_blend_epi16(co, c, 0xF0);

    __m256i a0 = _mm256_or_si256(_mm256_slli_epi16(c, 3), _mm256_srli_epi16(c, 2));

    _mm256_store_si256((__m256i*)a[4], a0);

    __m256i t0 = _mm256_add_epi16(_mm256_mullo_epi16(d, _mm256_set1_epi16(15)), _mm256_set1_epi16(128));
    __m256i t1 = _mm256_srli_epi16(_mm256_add_epi16(t0, _mm256_srli_epi16(t0, 8)), 8);

    __m256i t2 = _mm256_or_si256(t1, _mm256_slli_epi16(t1, 4));

    _mm256_store_si256((__m256i*)a[0], t2);
}

static etcpak_force_inline uint64_t EncodeAverages_AVX2( const v4i a[8], size_t idx )
{
    uint64_t d = ( idx << 24 );
    size_t base = idx << 1;

    __m128i a0 = _mm_load_si128((const __m128i*)a[base]);

    __m128i r0, r1;

    if( ( idx & 0x2 ) == 0 )
    {
        r0 = _mm_srli_epi16(a0, 4);

        __m128i a1 = _mm_unpackhi_epi64(r0, r0);
        r1 = _mm_slli_epi16(a1, 4);
    }
    else
    {
        __m128i a1 = _mm_and_si128(a0, _mm_set1_epi16(-8));

        r0 = _mm_unpackhi_epi64(a1, a1);
        __m128i a2 = _mm_sub_epi16(a1, r0);
        __m128i a3 = _mm_srai_epi16(a2, 3);
        r1 = _mm_and_si128(a3, _mm_set1_epi16(0x07));
    }

    __m128i r2 = _mm_or_si128(r0, r1);
    // do missing swap for average values
    __m128i r3 = _mm_shufflelo_epi16(r2, _MM_SHUFFLE(3, 0, 1, 2));
    __m128i r4 = _mm_packus_epi16(r3, _mm_setzero_si128());
    d |= _mm_cvtsi128_si32(r4);

    return d;
}

static etcpak_force_inline uint64_t CheckSolid_AVX2( const uint8_t* src )
{
    __m256i d0 = _mm256_loadu_si256(((__m256i*)src) + 0);
    __m256i d1 = _mm256_loadu_si256(((__m256i*)src) + 1);

    __m256i c = _mm256_broadcastd_epi32(_mm256_castsi256_si128(d0));

    __m256i c0 = _mm256_cmpeq_epi8(d0, c);
    __m256i c1 = _mm256_cmpeq_epi8(d1, c);

    __m256i m = _mm256_and_si256(c0, c1);

    if (!_mm256_testc_si256(m, _mm256_set1_epi32(-1)))
    {
        return 0;
    }

    return 0x02000000 |
        ( (unsigned int)( src[0] & 0xF8 ) << 16 ) |
        ( (unsigned int)( src[1] & 0xF8 ) << 8 ) |
        ( (unsigned int)( src[2] & 0xF8 ) );
}

static etcpak_force_inline __m128i PrepareAverages_AVX2( v4i a[8], const uint8_t* src)
{
    __m256i sum4 = Sum4_AVX2( src );

    ProcessAverages_AVX2(Average_AVX2( sum4 ), a );

    return CalcErrorBlock_AVX2( sum4, a);
}

static etcpak_force_inline __m128i PrepareAverages_AVX2_256( v4i a[8], const __m256i sum4)
{
    ProcessAverages_AVX2(Average_AVX2( sum4 ), a );

    return CalcErrorBlock_AVX2( sum4, a);
}

static etcpak_force_inline void FindBestFit_4x2_AVX2( uint32_t terr[2][8], uint32_t tsel[8], v4i a[8], const uint32_t offset, const uint8_t* data)
{
    __m256i sel0 = _mm256_setzero_si256();
    __m256i sel1 = _mm256_setzero_si256();
    unsigned int j;

    for(j = 0; j < 2; ++j)
    {
        unsigned int bid = offset + 1 - j;

        __m256i squareErrorSum = _mm256_setzero_si256();

        __m128i a0 = _mm_loadl_epi64((const __m128i*)a[bid]);
        __m256i a1 = _mm256_broadcastq_epi64(a0);
        size_t i;

        // Processing one full row each iteration
        for(i = 0; i < 8; i += 4)
        {
            __m128i rgb = _mm_loadu_si128((const __m128i*)(data + i * 4));

            __m256i rgb16 = _mm256_cvtepu8_epi16(rgb);
            __m256i d = _mm256_sub_epi16(a1, rgb16);

            // The scaling values are divided by two and rounded, to allow the differences to be in the range of signed int16
            // This produces slightly different results, but is significant faster
            __m256i pixel0 = _mm256_madd_epi16(d, _mm256_set_epi16(0, 38, 76, 14, 0, 38, 76, 14, 0, 38, 76, 14, 0, 38, 76, 14));
            __m256i pixel1 = _mm256_packs_epi32(pixel0, pixel0);
            __m256i pixel2 = _mm256_hadd_epi16(pixel1, pixel1);
            __m128i pixel3 = _mm256_castsi256_si128(pixel2);

            __m128i pix0 = _mm_broadcastw_epi16(pixel3);
            __m128i pix1 = _mm_broadcastw_epi16(_mm_srli_epi32(pixel3, 16));
            __m256i pixel = _mm256_insertf128_si256(_mm256_castsi128_si256(pix0), pix1, 1);

            // Processing first two pixels of the row
            {
                __m256i pix = _mm256_abs_epi16(pixel);

                // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
                // Since the selector table is symmetrical, we need to calculate the difference only for half of the entries.
                __m256i error0 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[0])));
                __m256i error1 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[1])));

                __m256i minIndex0 = _mm256_and_si256(_mm256_cmpgt_epi16(error0, error1), _mm256_set1_epi16(1));
                __m256i minError = _mm256_min_epi16(error0, error1);

                // Exploiting symmetry of the selector table and use the sign bit
                // This produces slightly different results, but is significant faster
                __m256i minIndex1 = _mm256_srli_epi16(pixel, 15);

                // Interleaving values so madd instruction can be used
                __m256i minErrorLo = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(1, 1, 0, 0));
                __m256i minErrorHi = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(3, 3, 2, 2));

                __m256i minError2 = _mm256_unpacklo_epi16(minErrorLo, minErrorHi);
                // Squaring the minimum error to produce correct values when adding
                __m256i squareError = _mm256_madd_epi16(minError2, minError2);

                squareErrorSum = _mm256_add_epi32(squareErrorSum, squareError);

                // Packing selector bits
                __m256i minIndexLo2 = _mm256_sll_epi16(minIndex0, _mm_cvtsi64_si128(i + j * 8));
                __m256i minIndexHi2 = _mm256_sll_epi16(minIndex1, _mm_cvtsi64_si128(i + j * 8));

                sel0 = _mm256_or_si256(sel0, minIndexLo2);
                sel1 = _mm256_or_si256(sel1, minIndexHi2);
            }

            pixel3 = _mm256_extracti128_si256(pixel2, 1);
            pix0 = _mm_broadcastw_epi16(pixel3);
            pix1 = _mm_broadcastw_epi16(_mm_srli_epi32(pixel3, 16));
            pixel = _mm256_insertf128_si256(_mm256_castsi128_si256(pix0), pix1, 1);

            // Processing second two pixels of the row
            {
                __m256i pix = _mm256_abs_epi16(pixel);

                // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
                // Since the selector table is symmetrical, we need to calculate the difference only for half of the entries.
                __m256i error0 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[0])));
                __m256i error1 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[1])));

                __m256i minIndex0 = _mm256_and_si256(_mm256_cmpgt_epi16(error0, error1), _mm256_set1_epi16(1));
                __m256i minError = _mm256_min_epi16(error0, error1);

                // Exploiting symmetry of the selector table and use the sign bit
                __m256i minIndex1 = _mm256_srli_epi16(pixel, 15);

                // Interleaving values so madd instruction can be used
                __m256i minErrorLo = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(1, 1, 0, 0));
                __m256i minErrorHi = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(3, 3, 2, 2));

                __m256i minError2 = _mm256_unpacklo_epi16(minErrorLo, minErrorHi);
                // Squaring the minimum error to produce correct values when adding
                __m256i squareError = _mm256_madd_epi16(minError2, minError2);

                squareErrorSum = _mm256_add_epi32(squareErrorSum, squareError);

                // Packing selector bits
                __m256i minIndexLo2 = _mm256_sll_epi16(minIndex0, _mm_cvtsi64_si128(i + j * 8));
                __m256i minIndexHi2 = _mm256_sll_epi16(minIndex1, _mm_cvtsi64_si128(i + j * 8));
                __m256i minIndexLo3 = _mm256_slli_epi16(minIndexLo2, 2);
                __m256i minIndexHi3 = _mm256_slli_epi16(minIndexHi2, 2);

                sel0 = _mm256_or_si256(sel0, minIndexLo3);
                sel1 = _mm256_or_si256(sel1, minIndexHi3);
            }
        }

        data += 8 * 4;

        _mm256_store_si256((__m256i*)terr[1 - j], squareErrorSum);
    }

    // Interleave selector bits
    __m256i minIndexLo0 = _mm256_unpacklo_epi16(sel0, sel1);
    __m256i minIndexHi0 = _mm256_unpackhi_epi16(sel0, sel1);

    __m256i minIndexLo1 = _mm256_permute2x128_si256(minIndexLo0, minIndexHi0, (0) | (2 << 4));
    __m256i minIndexHi1 = _mm256_permute2x128_si256(minIndexLo0, minIndexHi0, (1) | (3 << 4));

    __m256i minIndexHi2 = _mm256_slli_epi32(minIndexHi1, 1);

    __m256i sel = _mm256_or_si256(minIndexLo1, minIndexHi2);

    _mm256_store_si256((__m256i*)tsel, sel);
}

static etcpak_force_inline void FindBestFit_2x4_AVX2( uint32_t terr[2][8], uint32_t tsel[8], v4i a[8], const uint32_t offset, const uint8_t* data)
{
    __m256i sel0 = _mm256_setzero_si256();
    __m256i sel1 = _mm256_setzero_si256();

    __m256i squareErrorSum0 = _mm256_setzero_si256();
    __m256i squareErrorSum1 = _mm256_setzero_si256();

    __m128i a0 = _mm_loadl_epi64((const __m128i*)a[offset + 1]);
    __m128i a1 = _mm_loadl_epi64((const __m128i*)a[offset + 0]);

    __m128i a2 = _mm_broadcastq_epi64(a0);
    __m128i a3 = _mm_broadcastq_epi64(a1);
    __m256i a4 = _mm256_insertf128_si256(_mm256_castsi128_si256(a2), a3, 1);
    size_t i;

    // Processing one full row each iteration
    for(i = 0; i < 16; i += 4)
    {
        __m128i rgb = _mm_loadu_si128((const __m128i*)(data + i * 4));

        __m256i rgb16 = _mm256_cvtepu8_epi16(rgb);
        __m256i d = _mm256_sub_epi16(a4, rgb16);

        // The scaling values are divided by two and rounded, to allow the differences to be in the range of signed int16
        // This produces slightly different results, but is significant faster
        __m256i pixel0 = _mm256_madd_epi16(d, _mm256_set_epi16(0, 38, 76, 14, 0, 38, 76, 14, 0, 38, 76, 14, 0, 38, 76, 14));
        __m256i pixel1 = _mm256_packs_epi32(pixel0, pixel0);
        __m256i pixel2 = _mm256_hadd_epi16(pixel1, pixel1);
        __m128i pixel3 = _mm256_castsi256_si128(pixel2);

        __m128i pix0 = _mm_broadcastw_epi16(pixel3);
        __m128i pix1 = _mm_broadcastw_epi16(_mm_srli_epi32(pixel3, 16));
        __m256i pixel = _mm256_insertf128_si256(_mm256_castsi128_si256(pix0), pix1, 1);

        // Processing first two pixels of the row
        {
            __m256i pix = _mm256_abs_epi16(pixel);

            // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
            // Since the selector table is symmetrical, we need to calculate the difference only for half of the entries.
            __m256i error0 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[0])));
            __m256i error1 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[1])));

            __m256i minIndex0 = _mm256_and_si256(_mm256_cmpgt_epi16(error0, error1), _mm256_set1_epi16(1));
            __m256i minError = _mm256_min_epi16(error0, error1);

            // Exploiting symmetry of the selector table and use the sign bit
            __m256i minIndex1 = _mm256_srli_epi16(pixel, 15);

            // Interleaving values so madd instruction can be used
            __m256i minErrorLo = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(1, 1, 0, 0));
            __m256i minErrorHi = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(3, 3, 2, 2));

            __m256i minError2 = _mm256_unpacklo_epi16(minErrorLo, minErrorHi);
            // Squaring the minimum error to produce correct values when adding
            __m256i squareError = _mm256_madd_epi16(minError2, minError2);

            squareErrorSum0 = _mm256_add_epi32(squareErrorSum0, squareError);

            // Packing selector bits
            __m256i minIndexLo2 = _mm256_sll_epi16(minIndex0, _mm_cvtsi64_si128(i));
            __m256i minIndexHi2 = _mm256_sll_epi16(minIndex1, _mm_cvtsi64_si128(i));

            sel0 = _mm256_or_si256(sel0, minIndexLo2);
            sel1 = _mm256_or_si256(sel1, minIndexHi2);
        }

        pixel3 = _mm256_extracti128_si256(pixel2, 1);
        pix0 = _mm_broadcastw_epi16(pixel3);
        pix1 = _mm_broadcastw_epi16(_mm_srli_epi32(pixel3, 16));
        pixel = _mm256_insertf128_si256(_mm256_castsi128_si256(pix0), pix1, 1);

        // Processing second two pixels of the row
        {
            __m256i pix = _mm256_abs_epi16(pixel);

            // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
            // Since the selector table is symmetrical, we need to calculate the difference only for half of the entries.
            __m256i error0 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[0])));
            __m256i error1 = _mm256_abs_epi16(_mm256_sub_epi16(pix, _mm256_broadcastsi128_si256(g_table128_SIMD[1])));

            __m256i minIndex0 = _mm256_and_si256(_mm256_cmpgt_epi16(error0, error1), _mm256_set1_epi16(1));
            __m256i minError = _mm256_min_epi16(error0, error1);

            // Exploiting symmetry of the selector table and use the sign bit
            __m256i minIndex1 = _mm256_srli_epi16(pixel, 15);

            // Interleaving values so madd instruction can be used
            __m256i minErrorLo = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(1, 1, 0, 0));
            __m256i minErrorHi = _mm256_permute4x64_epi64(minError, _MM_SHUFFLE(3, 3, 2, 2));

            __m256i minError2 = _mm256_unpacklo_epi16(minErrorLo, minErrorHi);
            // Squaring the minimum error to produce correct values when adding
            __m256i squareError = _mm256_madd_epi16(minError2, minError2);

            squareErrorSum1 = _mm256_add_epi32(squareErrorSum1, squareError);

            // Packing selector bits
            __m256i minIndexLo2 = _mm256_sll_epi16(minIndex0, _mm_cvtsi64_si128(i));
            __m256i minIndexHi2 = _mm256_sll_epi16(minIndex1, _mm_cvtsi64_si128(i));
            __m256i minIndexLo3 = _mm256_slli_epi16(minIndexLo2, 2);
            __m256i minIndexHi3 = _mm256_slli_epi16(minIndexHi2, 2);

            sel0 = _mm256_or_si256(sel0, minIndexLo3);
            sel1 = _mm256_or_si256(sel1, minIndexHi3);
        }
    }

    _mm256_store_si256((__m256i*)terr[1], squareErrorSum0);
    _mm256_store_si256((__m256i*)terr[0], squareErrorSum1);

    // Interleave selector bits
    __m256i minIndexLo0 = _mm256_unpacklo_epi16(sel0, sel1);
    __m256i minIndexHi0 = _mm256_unpackhi_epi16(sel0, sel1);

    __m256i minIndexLo1 = _mm256_permute2x128_si256(minIndexLo0, minIndexHi0, (0) | (2 << 4));
    __m256i minIndexHi1 = _mm256_permute2x128_si256(minIndexLo0, minIndexHi0, (1) | (3 << 4));

    __m256i minIndexHi2 = _mm256_slli_epi32(minIndexHi1, 1);

    __m256i sel = _mm256_or_si256(minIndexLo1, minIndexHi2);

    _mm256_store_si256((__m256i*)tsel, sel);
}

static etcpak_force_inline uint64_t EncodeSelectors_AVX2( uint64_t d, const uint32_t terr[2][8], const uint32_t tsel[8], const bool rotate)
{
    size_t tidx[2];

    // Get index of minimum error (terr[0] and terr[1])
    __m256i err0 = _mm256_load_si256((const __m256i*)terr[0]);
    __m256i err1 = _mm256_load_si256((const __m256i*)terr[1]);

    __m256i errLo = _mm256_permute2x128_si256(err0, err1, (0) | (2 << 4));
    __m256i errHi = _mm256_permute2x128_si256(err0, err1, (1) | (3 << 4));

    __m256i errMin0 = _mm256_min_epu32(errLo, errHi);

    __m256i errMin1 = _mm256_shuffle_epi32(errMin0, _MM_SHUFFLE(2, 3, 0, 1));
    __m256i errMin2 = _mm256_min_epu32(errMin0, errMin1);

    __m256i errMin3 = _mm256_shuffle_epi32(errMin2, _MM_SHUFFLE(1, 0, 3, 2));
    __m256i errMin4 = _mm256_min_epu32(errMin3, errMin2);

    __m256i errMin5 = _mm256_permute2x128_si256(errMin4, errMin4, (0) | (0 << 4));
    __m256i errMin6 = _mm256_permute2x128_si256(errMin4, errMin4, (1) | (1 << 4));

    __m256i errMask0 = _mm256_cmpeq_epi32(errMin5, err0);
    __m256i errMask1 = _mm256_cmpeq_epi32(errMin6, err1);

    uint32_t mask0 = _mm256_movemask_epi8(errMask0);
    uint32_t mask1 = _mm256_movemask_epi8(errMask1);

    tidx[0] = _bit_scan_forward(mask0) >> 2;
    tidx[1] = _bit_scan_forward(mask1) >> 2;

    d |= tidx[0] << 26;
    d |= tidx[1] << 29;

    unsigned int t0 = tsel[tidx[0]];
    unsigned int t1 = tsel[tidx[1]];

    if (!rotate)
    {
        t0 &= 0xFF00FF00;
        t1 &= 0x00FF00FF;
    }
    else
    {
        t0 &= 0xCCCCCCCC;
        t1 &= 0x33333333;
    }

    // Flip selectors from sign bit
    unsigned int t2 = (t0 | t1) ^ 0xFFFF0000;

    return d | ((uint64_t)_bswap(t2)) << 32;
}

static etcpak_force_inline __m128i r6g7b6_AVX2(__m128 cof, __m128 chf, __m128 cvf)
{
    __m128i co = _mm_cvttps_epi32(cof);
    __m128i ch = _mm_cvttps_epi32(chf);
    __m128i cv = _mm_cvttps_epi32(cvf);

    __m128i coh = _mm_packus_epi32(co, ch);
    __m128i cv0 = _mm_packus_epi32(cv, _mm_setzero_si128());

    __m256i cohv0 = _mm256_inserti128_si256(_mm256_castsi128_si256(coh), cv0, 1);
    __m256i cohv1 = _mm256_min_epu16(cohv0, _mm256_set1_epi16(1023));

    __m256i cohv2 = _mm256_sub_epi16(cohv1, _mm256_set1_epi16(15));
    __m256i cohv3 = _mm256_srai_epi16(cohv2, 1);

    __m256i cohvrb0 = _mm256_add_epi16(cohv3, _mm256_set1_epi16(11));
    __m256i cohvrb1 = _mm256_add_epi16(cohv3, _mm256_set1_epi16(4));
    __m256i cohvg0 = _mm256_add_epi16(cohv3, _mm256_set1_epi16(9));
    __m256i cohvg1 = _mm256_add_epi16(cohv3, _mm256_set1_epi16(6));

    __m256i cohvrb2 = _mm256_srai_epi16(cohvrb0, 7);
    __m256i cohvrb3 = _mm256_srai_epi16(cohvrb1, 7);
    __m256i cohvg2 = _mm256_srai_epi16(cohvg0, 8);
    __m256i cohvg3 = _mm256_srai_epi16(cohvg1, 8);

    __m256i cohvrb4 = _mm256_sub_epi16(cohvrb0, cohvrb2);
    __m256i cohvrb5 = _mm256_sub_epi16(cohvrb4, cohvrb3);
    __m256i cohvg4 = _mm256_sub_epi16(cohvg0, cohvg2);
    __m256i cohvg5 = _mm256_sub_epi16(cohvg4, cohvg3);

    __m256i cohvrb6 = _mm256_srai_epi16(cohvrb5, 3);
    __m256i cohvg6 = _mm256_srai_epi16(cohvg5, 2);

    __m256i cohv4 = _mm256_blend_epi16(cohvg6, cohvrb6, 0x55);

    __m128i cohv5 = _mm_packus_epi16(_mm256_castsi256_si128(cohv4), _mm256_extracti128_si256(cohv4, 1));
    return _mm_shuffle_epi8(cohv5, _mm_setr_epi8(6, 5, 4, -1, 2, 1, 0, -1, 10, 9, 8, -1, -1, -1, -1, -1));
}

typedef struct Plane
{
    uint64_t plane;
    uint64_t error;
    __m256i sum4;
#ifdef QUICK_ETC2
    bool planar_mode_expected;
    bool th_mode_expected;
    __m128i r8, g8, b8, luma8; //variables to store SSE RGB&luma values
#endif
} Plane;


#ifdef QUICK_ETC2

// horizontal min/max functions. https://stackoverflow.com/questions/22256525/horizontal-minimum-and-maximum-using-sse
// if an error occurs in GCC, please change the value of -march in CFLAGS to a specific value for your CPU (e.g., skylake).
static inline int16_t hMax(__m128i buffer, uint8_t * idx)
{
    __m128i tmp1 = _mm_sub_epi8(_mm_set1_epi8((char)(255)), buffer);
    __m128i tmp2 = _mm_min_epu8(tmp1, _mm_srli_epi16(tmp1, 8));
    __m128i tmp3 = _mm_minpos_epu16(tmp2);
    uint8_t result = 255 - (uint8_t)_mm_cvtsi128_si32(tmp3);
    __m128i mask =_mm_cmpeq_epi8(buffer, _mm_set1_epi8(result));
    *idx = _tzcnt_u32(_mm_movemask_epi8(mask));

    return result;
}

static inline int16_t hMin(__m128i buffer, uint8_t * idx)
{
    __m128i tmp2 = _mm_min_epu8(buffer, _mm_srli_epi16(buffer, 8));
    __m128i tmp3 = _mm_minpos_epu16(tmp2);
    uint8_t result = (uint8_t)_mm_cvtsi128_si32(tmp3);
    __m128i mask = _mm_cmpeq_epi8(buffer, _mm_set1_epi8(result));
    *idx = _tzcnt_u32(_mm_movemask_epi8(mask));
    return result;
}
#endif

static etcpak_force_inline Plane Planar_AVX2(const uint8_t* src)
{
#ifdef QUICK_ETC2
    bool planar_mode_expected = false;
    bool th_mode_expected = false;
#endif
    __m128i d0 = _mm_loadu_si128(((__m128i*)src) + 0);
    __m128i d1 = _mm_loadu_si128(((__m128i*)src) + 1);
    __m128i d2 = _mm_loadu_si128(((__m128i*)src) + 2);
    __m128i d3 = _mm_loadu_si128(((__m128i*)src) + 3);

    __m128i rgb0 = _mm_shuffle_epi8(d0, _mm_setr_epi8(0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, -1, -1, -1, -1));
    __m128i rgb1 = _mm_shuffle_epi8(d1, _mm_setr_epi8(0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, -1, -1, -1, -1));
    __m128i rgb2 = _mm_shuffle_epi8(d2, _mm_setr_epi8(0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, -1, -1, -1, -1));
    __m128i rgb3 = _mm_shuffle_epi8(d3, _mm_setr_epi8(0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, -1, -1, -1, -1));

    __m128i rg0 = _mm_unpacklo_epi32(rgb0, rgb1);
    __m128i rg1 = _mm_unpacklo_epi32(rgb2, rgb3);
    __m128i b0 = _mm_unpackhi_epi32(rgb0, rgb1);
    __m128i b1 = _mm_unpackhi_epi32(rgb2, rgb3);

    // swap channels
    __m128i b8 = _mm_unpacklo_epi64(rg0, rg1);
    __m128i g8 = _mm_unpackhi_epi64(rg0, rg1);
    __m128i r8 = _mm_unpacklo_epi64(b0, b1);

#ifdef QUICK_ETC2
    // luma calculation
    __m256i b16_luma = _mm256_mullo_epi16(_mm256_cvtepu8_epi16(b8), _mm256_set1_epi16(14));
    __m256i g16_luma = _mm256_mullo_epi16(_mm256_cvtepu8_epi16(g8), _mm256_set1_epi16(76));
    __m256i r16_luma = _mm256_mullo_epi16(_mm256_cvtepu8_epi16(r8), _mm256_set1_epi16(38));

    __m256i luma_16bit = _mm256_add_epi16(_mm256_add_epi16(g16_luma, r16_luma), b16_luma);
    __m256i luma_8bit_m256i = _mm256_srli_epi16(luma_16bit, 7);
    __m128i luma_8bit_lo = _mm256_extractf128_si256(luma_8bit_m256i, 0);
    __m128i luma_8bit_hi = _mm256_extractf128_si256(luma_8bit_m256i, 1);

    /*static const */__m128i interleaving_mask_lo = _mm_set_epi8(15, 13, 11, 9, 7, 5, 3, 1, 14, 12, 10, 8, 6, 4, 2, 0);
    /*static const */__m128i interleaving_mask_hi = _mm_set_epi8(14, 12, 10, 8, 6, 4, 2, 0, 15, 13, 11, 9, 7, 5, 3, 1);
    __m128i luma_8bit_lo_moved = _mm_shuffle_epi8(luma_8bit_lo, interleaving_mask_lo);
    __m128i luma_8bit_hi_moved = _mm_shuffle_epi8(luma_8bit_hi, interleaving_mask_hi);
    __m128i luma_8bit = _mm_or_si128(luma_8bit_hi_moved, luma_8bit_lo_moved);

    // min/max calculation
    uint8_t min_idx = 255, max_idx = 255;
    float min_luma = hMin(luma_8bit, &min_idx) * 0.00392156f;
    float max_luma = hMax(luma_8bit, &max_idx) * 0.00392156f;
    float luma_range = max_luma - min_luma;

    // filters a very-low-contrast block
    if (luma_range <= ecmd_threshold[0])
    {
        planar_mode_expected = true;
    }

    // checks whether a pair of the corner pixels in a block has the min/max luma values;
    // if so, the ETC2 planar mode is enabled, and otherwise, the ETC1 mode is enabled
    else if (luma_range <= ecmd_threshold[1])
    {
        planar_mode_expected = false;
        /*static const */__m128i corner_pair = _mm_set_epi8(1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 3, 12, 12, 3, 15, 0);
        __m128i current_max_min
            = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0,
                min_idx, max_idx, min_idx, max_idx,
                min_idx, max_idx, min_idx, max_idx);

        __m128i max_min_result = _mm_cmpeq_epi16(corner_pair, current_max_min);

        int mask = _mm_movemask_epi8(max_min_result);
        if (mask)
        {
            planar_mode_expected = true;
        }
    }

    // filters a high-contrast block for checking both ETC1 mode and the ETC2 T/H mode
    else if (luma_range >= ecmd_threshold[2])
        th_mode_expected = true;
#endif

    __m128i t0 = _mm_sad_epu8(r8, _mm_setzero_si128());
    __m128i t1 = _mm_sad_epu8(g8, _mm_setzero_si128());
    __m128i t2 = _mm_sad_epu8(b8, _mm_setzero_si128());

    __m128i r8s = _mm_shuffle_epi8(r8, _mm_set_epi8(0xF, 0xE, 0xB, 0xA, 0x7, 0x6, 0x3, 0x2, 0xD, 0xC, 0x9, 0x8, 0x5, 0x4, 0x1, 0x0));
    __m128i g8s = _mm_shuffle_epi8(g8, _mm_set_epi8(0xF, 0xE, 0xB, 0xA, 0x7, 0x6, 0x3, 0x2, 0xD, 0xC, 0x9, 0x8, 0x5, 0x4, 0x1, 0x0));
    __m128i b8s = _mm_shuffle_epi8(b8, _mm_set_epi8(0xF, 0xE, 0xB, 0xA, 0x7, 0x6, 0x3, 0x2, 0xD, 0xC, 0x9, 0x8, 0x5, 0x4, 0x1, 0x0));

    __m128i s0 = _mm_sad_epu8(r8s, _mm_setzero_si128());
    __m128i s1 = _mm_sad_epu8(g8s, _mm_setzero_si128());
    __m128i s2 = _mm_sad_epu8(b8s, _mm_setzero_si128());

    __m256i sr0 = _mm256_insertf128_si256(_mm256_castsi128_si256(t0), s0, 1);
    __m256i sg0 = _mm256_insertf128_si256(_mm256_castsi128_si256(t1), s1, 1);
    __m256i sb0 = _mm256_insertf128_si256(_mm256_castsi128_si256(t2), s2, 1);

    __m256i sr1 = _mm256_slli_epi64(sr0, 32);
    __m256i sg1 = _mm256_slli_epi64(sg0, 16);

    __m256i srb = _mm256_or_si256(sr1, sb0);
    __m256i srgb = _mm256_or_si256(srb, sg1);

#ifdef QUICK_ETC2
    if (!planar_mode_expected) //early termination
    {
        Plane plane;
        plane.sum4 = _mm256_permute4x64_epi64(srgb, _MM_SHUFFLE(2, 3, 0, 1));
        plane.planar_mode_expected = false;
        plane.th_mode_expected = th_mode_expected;
        plane.r8 = r8;
        plane.g8 = g8;
        plane.b8 = b8;
        plane.luma8 = luma_8bit;
        return plane;
    }
#endif

    __m128i t3 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(t0), _mm_castsi128_ps(t1), _MM_SHUFFLE(2, 0, 2, 0)));
    __m128i t4 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(3, 1, 2, 0));
    __m128i t5 = _mm_hadd_epi32(t3, t4);
    __m128i t6 = _mm_shuffle_epi32(t5, _MM_SHUFFLE(1, 1, 1, 1));
    __m128i t7 = _mm_shuffle_epi32(t5, _MM_SHUFFLE(2, 2, 2, 2));

    __m256i sr = _mm256_broadcastw_epi16(t5);
    __m256i sg = _mm256_broadcastw_epi16(t6);
    __m256i sb = _mm256_broadcastw_epi16(t7);

    __m256i r08 = _mm256_cvtepu8_epi16(r8);
    __m256i g08 = _mm256_cvtepu8_epi16(g8);
    __m256i b08 = _mm256_cvtepu8_epi16(b8);

    __m256i r16 = _mm256_slli_epi16(r08, 4);
    __m256i g16 = _mm256_slli_epi16(g08, 4);
    __m256i b16 = _mm256_slli_epi16(b08, 4);

    __m256i difR0 = _mm256_sub_epi16(r16, sr);
    __m256i difG0 = _mm256_sub_epi16(g16, sg);
    __m256i difB0 = _mm256_sub_epi16(b16, sb);

    __m256i difRyz = _mm256_madd_epi16(difR0, _mm256_set_epi16(255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255));
    __m256i difGyz = _mm256_madd_epi16(difG0, _mm256_set_epi16(255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255));
    __m256i difByz = _mm256_madd_epi16(difB0, _mm256_set_epi16(255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255, 255, 85, -85, -255));

    __m256i difRxz = _mm256_madd_epi16(difR0, _mm256_set_epi16(255, 255, 255, 255, 85, 85, 85, 85, -85, -85, -85, -85, -255, -255, -255, -255));
    __m256i difGxz = _mm256_madd_epi16(difG0, _mm256_set_epi16(255, 255, 255, 255, 85, 85, 85, 85, -85, -85, -85, -85, -255, -255, -255, -255));
    __m256i difBxz = _mm256_madd_epi16(difB0, _mm256_set_epi16(255, 255, 255, 255, 85, 85, 85, 85, -85, -85, -85, -85, -255, -255, -255, -255));

    __m256i difRGyz = _mm256_hadd_epi32(difRyz, difGyz);
    __m256i difByzxz = _mm256_hadd_epi32(difByz, difBxz);

    __m256i difRGxz = _mm256_hadd_epi32(difRxz, difGxz);

    __m128i sumRGyz = _mm_add_epi32(_mm256_castsi256_si128(difRGyz), _mm256_extracti128_si256(difRGyz, 1));
    __m128i sumByzxz = _mm_add_epi32(_mm256_castsi256_si128(difByzxz), _mm256_extracti128_si256(difByzxz, 1));
    __m128i sumRGxz = _mm_add_epi32(_mm256_castsi256_si128(difRGxz), _mm256_extracti128_si256(difRGxz, 1));

    __m128i sumRGByz = _mm_hadd_epi32(sumRGyz, sumByzxz);
    __m128i sumRGByzxz = _mm_hadd_epi32(sumRGxz, sumByzxz);

    __m128i sumRGBxz = _mm_shuffle_epi32(sumRGByzxz, _MM_SHUFFLE(2, 3, 1, 0));

    __m128 sumRGByzf = _mm_cvtepi32_ps(sumRGByz);
    __m128 sumRGBxzf = _mm_cvtepi32_ps(sumRGBxz);

    const float value = (255 * 255 * 8.0f + 85 * 85 * 8.0f) * 16.0f;

    __m128 scale = _mm_set1_ps(-4.0f / value);

    __m128 af = _mm_mul_ps(sumRGBxzf, scale);
    __m128 bf = _mm_mul_ps(sumRGByzf, scale);

    __m128 df = _mm_mul_ps(_mm_cvtepi32_ps(t5), _mm_set1_ps(4.0f / 16.0f));

    // calculating the three colors RGBO, RGBH, and RGBV.  RGB = df - af * x - bf * y;
    __m128 cof0 = _mm_fnmadd_ps(af, _mm_set1_ps(-255.0f), _mm_fnmadd_ps(bf, _mm_set1_ps(-255.0f), df));
    __m128 chf0 = _mm_fnmadd_ps(af, _mm_set1_ps( 425.0f), _mm_fnmadd_ps(bf, _mm_set1_ps(-255.0f), df));
    __m128 cvf0 = _mm_fnmadd_ps(af, _mm_set1_ps(-255.0f), _mm_fnmadd_ps(bf, _mm_set1_ps( 425.0f), df));

    // convert to r6g7b6
    __m128i cohv = r6g7b6_AVX2(cof0, chf0, cvf0);

    uint64_t rgbho = _mm_extract_epi64(cohv, 0);
    uint32_t rgbv0 = _mm_extract_epi32(cohv, 2);

#ifndef QUICK_ETC2
    // Error calculation
    auto ro0 = (rgbho >> 48) & 0x3F;
    auto go0 = (rgbho >> 40) & 0x7F;
    auto bo0 = (rgbho >> 32) & 0x3F;
    auto ro1 = (ro0 >> 4) | (ro0 << 2);
    auto go1 = (go0 >> 6) | (go0 << 1);
    auto bo1 = (bo0 >> 4) | (bo0 << 2);
    auto ro2 = (ro1 << 2) + 2;
    auto go2 = (go1 << 2) + 2;
    auto bo2 = (bo1 << 2) + 2;

    __m256i ro3 = _mm256_set1_epi16(ro2);
    __m256i go3 = _mm256_set1_epi16(go2);
    __m256i bo3 = _mm256_set1_epi16(bo2);

    auto rh0 = (rgbho >> 16) & 0x3F;
    auto gh0 = (rgbho >>  8) & 0x7F;
    auto bh0 = (rgbho >>  0) & 0x3F;
    auto rh1 = (rh0 >> 4) | (rh0 << 2);
    auto gh1 = (gh0 >> 6) | (gh0 << 1);
    auto bh1 = (bh0 >> 4) | (bh0 << 2);

    auto rh2 = rh1 - ro1;
    auto gh2 = gh1 - go1;
    auto bh2 = bh1 - bo1;

    __m256i rh3 = _mm256_set1_epi16(rh2);
    __m256i gh3 = _mm256_set1_epi16(gh2);
    __m256i bh3 = _mm256_set1_epi16(bh2);

    auto rv0 = (rgbv0 >> 16) & 0x3F;
    auto gv0 = (rgbv0 >>  8) & 0x7F;
    auto bv0 = (rgbv0 >>  0) & 0x3F;
    auto rv1 = (rv0 >> 4) | (rv0 << 2);
    auto gv1 = (gv0 >> 6) | (gv0 << 1);
    auto bv1 = (bv0 >> 4) | (bv0 << 2);

    auto rv2 = rv1 - ro1;
    auto gv2 = gv1 - go1;
    auto bv2 = bv1 - bo1;

    __m256i rv3 = _mm256_set1_epi16(rv2);
    __m256i gv3 = _mm256_set1_epi16(gv2);
    __m256i bv3 = _mm256_set1_epi16(bv2);

    __m256i x = _mm256_set_epi16(3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0);

    __m256i rh4 = _mm256_mullo_epi16(rh3, x);
    __m256i gh4 = _mm256_mullo_epi16(gh3, x);
    __m256i bh4 = _mm256_mullo_epi16(bh3, x);

    __m256i y = _mm256_set_epi16(3, 2, 1, 0, 3, 2, 1, 0, 3, 2, 1, 0, 3, 2, 1, 0);

    __m256i rv4 = _mm256_mullo_epi16(rv3, y);
    __m256i gv4 = _mm256_mullo_epi16(gv3, y);
    __m256i bv4 = _mm256_mullo_epi16(bv3, y);

    __m256i rxy = _mm256_add_epi16(rh4, rv4);
    __m256i gxy = _mm256_add_epi16(gh4, gv4);
    __m256i bxy = _mm256_add_epi16(bh4, bv4);

    __m256i rp0 = _mm256_add_epi16(rxy, ro3);
    __m256i gp0 = _mm256_add_epi16(gxy, go3);
    __m256i bp0 = _mm256_add_epi16(bxy, bo3);

    __m256i rp1 = _mm256_srai_epi16(rp0, 2);
    __m256i gp1 = _mm256_srai_epi16(gp0, 2);
    __m256i bp1 = _mm256_srai_epi16(bp0, 2);

    __m256i rp2 = _mm256_max_epi16(_mm256_min_epi16(rp1, _mm256_set1_epi16(255)), _mm256_setzero_si256());
    __m256i gp2 = _mm256_max_epi16(_mm256_min_epi16(gp1, _mm256_set1_epi16(255)), _mm256_setzero_si256());
    __m256i bp2 = _mm256_max_epi16(_mm256_min_epi16(bp1, _mm256_set1_epi16(255)), _mm256_setzero_si256());

    __m256i rdif = _mm256_sub_epi16(r08, rp2);
    __m256i gdif = _mm256_sub_epi16(g08, gp2);
    __m256i bdif = _mm256_sub_epi16(b08, bp2);

    __m256i rerr = _mm256_mullo_epi16(rdif, _mm256_set1_epi16(38));
    __m256i gerr = _mm256_mullo_epi16(gdif, _mm256_set1_epi16(76));
    __m256i berr = _mm256_mullo_epi16(bdif, _mm256_set1_epi16(14));

    __m256i sum0 = _mm256_add_epi16(rerr, gerr);
    __m256i sum1 = _mm256_add_epi16(sum0, berr);

    __m256i sum2 = _mm256_madd_epi16(sum1, sum1);

    __m128i sum3 = _mm_add_epi32(_mm256_castsi256_si128(sum2), _mm256_extracti128_si256(sum2, 1));

    uint32_t err0 = _mm_extract_epi32(sum3, 0);
    uint32_t err1 = _mm_extract_epi32(sum3, 1);
    uint32_t err2 = _mm_extract_epi32(sum3, 2);
    uint32_t err3 = _mm_extract_epi32(sum3, 3);

    uint64_t error = err0 + err1 + err2 + err3;
    /**/
#endif
    uint32_t rgbv = ( rgbv0 & 0x3F ) | ( ( rgbv0 >> 2 ) & 0x1FC0 ) | ( ( rgbv0 >> 3 ) & 0x7E000 );
    uint64_t rgbho0_ = ( rgbho & 0x3F0000003F ) | ( ( rgbho >> 2 ) & 0x1FC000001FC0 ) | ( ( rgbho >> 3 ) & 0x7E0000007E000 );
    uint64_t rgbho0 = ( rgbho0_ & 0x7FFFF ) | ( ( rgbho0_ >> 13 ) & 0x3FFFF80000 );

    uint32_t hi = rgbv | ((rgbho0 & 0x1FFF) << 19);
    rgbho0 >>= 13;
    uint32_t lo = ( rgbho0 & 0x1 ) | ( ( rgbho0 & 0x1FE ) << 1 ) | ( ( rgbho0 & 0x600 ) << 2 ) | ( ( rgbho0 & 0x3F800 ) << 5 ) | ( ( rgbho0 & 0x1FC0000 ) << 6 );

    uint32_t idx = ( ( rgbho >> 33 ) & 0xF ) | ( ( rgbho >> 41 ) & 0x10 ) | ( ( rgbho >> 48 ) & 0x20 );
    lo |= g_flags[idx];
    uint64_t result = ((uint32_t)_bswap(lo));
    result |= (uint64_t)((((uint32_t)_bswap(hi)))) << 32;

    Plane plane;

    plane.plane = result;
#ifdef QUICK_ETC2
    plane.error = 0;
    plane.planar_mode_expected = planar_mode_expected;
#else
    plane.error = error;
#endif
    plane.sum4 = _mm256_permute4x64_epi64(srgb, _MM_SHUFFLE(2, 3, 0, 1));

    return plane;
}

static etcpak_force_inline uint64_t EncodeSelectors_AVX2_2( uint64_t d, const uint32_t terr[2][8], const uint32_t tsel[8], const bool rotate, const uint64_t value, const uint32_t error)
{
    size_t tidx[2];

    // Get index of minimum error (terr[0] and terr[1])
    __m256i err0 = _mm256_load_si256((const __m256i*)terr[0]);
    __m256i err1 = _mm256_load_si256((const __m256i*)terr[1]);

    __m256i errLo = _mm256_permute2x128_si256(err0, err1, (0) | (2 << 4));
    __m256i errHi = _mm256_permute2x128_si256(err0, err1, (1) | (3 << 4));

    __m256i errMin0 = _mm256_min_epu32(errLo, errHi);

    __m256i errMin1 = _mm256_shuffle_epi32(errMin0, _MM_SHUFFLE(2, 3, 0, 1));
    __m256i errMin2 = _mm256_min_epu32(errMin0, errMin1);

    __m256i errMin3 = _mm256_shuffle_epi32(errMin2, _MM_SHUFFLE(1, 0, 3, 2));
    __m256i errMin4 = _mm256_min_epu32(errMin3, errMin2);

    __m256i errMin5 = _mm256_permute2x128_si256(errMin4, errMin4, (0) | (0 << 4));
    __m256i errMin6 = _mm256_permute2x128_si256(errMin4, errMin4, (1) | (1 << 4));

    __m256i errMask0 = _mm256_cmpeq_epi32(errMin5, err0);
    __m256i errMask1 = _mm256_cmpeq_epi32(errMin6, err1);

    uint32_t mask0 = _mm256_movemask_epi8(errMask0);
    uint32_t mask1 = _mm256_movemask_epi8(errMask1);

    tidx[0] = _bit_scan_forward(mask0) >> 2;
    tidx[1] = _bit_scan_forward(mask1) >> 2;

    if ((terr[0][tidx[0]] + terr[1][tidx[1]]) >= error)
    {
        return value;
    }

    d |= tidx[0] << 26;
    d |= tidx[1] << 29;

    unsigned int t0 = tsel[tidx[0]];
    unsigned int t1 = tsel[tidx[1]];

    if (!rotate)
    {
        t0 &= 0xFF00FF00;
        t1 &= 0x00FF00FF;
    }
    else
    {
        t0 &= 0xCCCCCCCC;
        t1 &= 0x33333333;
    }

    // Flip selectors from sign bit
    unsigned int t2 = (t0 | t1) ^ 0xFFFF0000;

    return d | ((uint64_t)_bswap(t2)) << 32;
}

#endif

static etcpak_force_inline void Average( const uint8_t* data, v4i* a )
{
#ifdef __SSE4_1__
    __m128i d0 = _mm_loadu_si128(((__m128i*)data) + 0);
    __m128i d1 = _mm_loadu_si128(((__m128i*)data) + 1);
    __m128i d2 = _mm_loadu_si128(((__m128i*)data) + 2);
    __m128i d3 = _mm_loadu_si128(((__m128i*)data) + 3);

    __m128i d0l = _mm_unpacklo_epi8(d0, _mm_setzero_si128());
    __m128i d0h = _mm_unpackhi_epi8(d0, _mm_setzero_si128());
    __m128i d1l = _mm_unpacklo_epi8(d1, _mm_setzero_si128());
    __m128i d1h = _mm_unpackhi_epi8(d1, _mm_setzero_si128());
    __m128i d2l = _mm_unpacklo_epi8(d2, _mm_setzero_si128());
    __m128i d2h = _mm_unpackhi_epi8(d2, _mm_setzero_si128());
    __m128i d3l = _mm_unpacklo_epi8(d3, _mm_setzero_si128());
    __m128i d3h = _mm_unpackhi_epi8(d3, _mm_setzero_si128());

    __m128i sum0 = _mm_add_epi16(d0l, d1l);
    __m128i sum1 = _mm_add_epi16(d0h, d1h);
    __m128i sum2 = _mm_add_epi16(d2l, d3l);
    __m128i sum3 = _mm_add_epi16(d2h, d3h);

    __m128i sum0l = _mm_unpacklo_epi16(sum0, _mm_setzero_si128());
    __m128i sum0h = _mm_unpackhi_epi16(sum0, _mm_setzero_si128());
    __m128i sum1l = _mm_unpacklo_epi16(sum1, _mm_setzero_si128());
    __m128i sum1h = _mm_unpackhi_epi16(sum1, _mm_setzero_si128());
    __m128i sum2l = _mm_unpacklo_epi16(sum2, _mm_setzero_si128());
    __m128i sum2h = _mm_unpackhi_epi16(sum2, _mm_setzero_si128());
    __m128i sum3l = _mm_unpacklo_epi16(sum3, _mm_setzero_si128());
    __m128i sum3h = _mm_unpackhi_epi16(sum3, _mm_setzero_si128());

    __m128i b0 = _mm_add_epi32(sum0l, sum0h);
    __m128i b1 = _mm_add_epi32(sum1l, sum1h);
    __m128i b2 = _mm_add_epi32(sum2l, sum2h);
    __m128i b3 = _mm_add_epi32(sum3l, sum3h);

    __m128i a0 = _mm_srli_epi32(_mm_add_epi32(_mm_add_epi32(b2, b3), _mm_set1_epi32(4)), 3);
    __m128i a1 = _mm_srli_epi32(_mm_add_epi32(_mm_add_epi32(b0, b1), _mm_set1_epi32(4)), 3);
    __m128i a2 = _mm_srli_epi32(_mm_add_epi32(_mm_add_epi32(b1, b3), _mm_set1_epi32(4)), 3);
    __m128i a3 = _mm_srli_epi32(_mm_add_epi32(_mm_add_epi32(b0, b2), _mm_set1_epi32(4)), 3);

    _mm_storeu_si128((__m128i*)&a[0], _mm_packus_epi32(_mm_shuffle_epi32(a0, _MM_SHUFFLE(3, 0, 1, 2)), _mm_shuffle_epi32(a1, _MM_SHUFFLE(3, 0, 1, 2))));
    _mm_storeu_si128((__m128i*)&a[2], _mm_packus_epi32(_mm_shuffle_epi32(a2, _MM_SHUFFLE(3, 0, 1, 2)), _mm_shuffle_epi32(a3, _MM_SHUFFLE(3, 0, 1, 2))));
#elif defined __ARM_NEON
    uint8x16x2_t t0 = vzipq_u8(vld1q_u8(data +  0), uint8x16_t());
    uint8x16x2_t t1 = vzipq_u8(vld1q_u8(data + 16), uint8x16_t());
    uint8x16x2_t t2 = vzipq_u8(vld1q_u8(data + 32), uint8x16_t());
    uint8x16x2_t t3 = vzipq_u8(vld1q_u8(data + 48), uint8x16_t());

    uint16x8x2_t d0 = { vreinterpretq_u16_u8(t0.val[0]), vreinterpretq_u16_u8(t0.val[1]) };
    uint16x8x2_t d1 = { vreinterpretq_u16_u8(t1.val[0]), vreinterpretq_u16_u8(t1.val[1]) };
    uint16x8x2_t d2 = { vreinterpretq_u16_u8(t2.val[0]), vreinterpretq_u16_u8(t2.val[1]) };
    uint16x8x2_t d3 = { vreinterpretq_u16_u8(t3.val[0]), vreinterpretq_u16_u8(t3.val[1]) };

    uint16x8x2_t s0 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d0.val[0] ), vreinterpretq_s16_u16( d1.val[0] ) ) ), uint16x8_t());
    uint16x8x2_t s1 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d0.val[1] ), vreinterpretq_s16_u16( d1.val[1] ) ) ), uint16x8_t());
    uint16x8x2_t s2 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d2.val[0] ), vreinterpretq_s16_u16( d3.val[0] ) ) ), uint16x8_t());
    uint16x8x2_t s3 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d2.val[1] ), vreinterpretq_s16_u16( d3.val[1] ) ) ), uint16x8_t());

    uint32x4x2_t sum0 = { vreinterpretq_u32_u16(s0.val[0]), vreinterpretq_u32_u16(s0.val[1]) };
    uint32x4x2_t sum1 = { vreinterpretq_u32_u16(s1.val[0]), vreinterpretq_u32_u16(s1.val[1]) };
    uint32x4x2_t sum2 = { vreinterpretq_u32_u16(s2.val[0]), vreinterpretq_u32_u16(s2.val[1]) };
    uint32x4x2_t sum3 = { vreinterpretq_u32_u16(s3.val[0]), vreinterpretq_u32_u16(s3.val[1]) };

    uint32x4_t b0 = vaddq_u32(sum0.val[0], sum0.val[1]);
    uint32x4_t b1 = vaddq_u32(sum1.val[0], sum1.val[1]);
    uint32x4_t b2 = vaddq_u32(sum2.val[0], sum2.val[1]);
    uint32x4_t b3 = vaddq_u32(sum3.val[0], sum3.val[1]);

    uint32x4_t a0 = vshrq_n_u32(vqaddq_u32(vqaddq_u32(b2, b3), vdupq_n_u32(4)), 3);
    uint32x4_t a1 = vshrq_n_u32(vqaddq_u32(vqaddq_u32(b0, b1), vdupq_n_u32(4)), 3);
    uint32x4_t a2 = vshrq_n_u32(vqaddq_u32(vqaddq_u32(b1, b3), vdupq_n_u32(4)), 3);
    uint32x4_t a3 = vshrq_n_u32(vqaddq_u32(vqaddq_u32(b0, b2), vdupq_n_u32(4)), 3);

    uint16x8_t o0 = vcombine_u16(vqmovun_s32(vreinterpretq_s32_u32( a0 )), vqmovun_s32(vreinterpretq_s32_u32( a1 )));
    uint16x8_t o1 = vcombine_u16(vqmovun_s32(vreinterpretq_s32_u32( a2 )), vqmovun_s32(vreinterpretq_s32_u32( a3 )));

    a[0] = v4i{o0[2], o0[1], o0[0], 0};
    a[1] = v4i{o0[6], o0[5], o0[4], 0};
    a[2] = v4i{o1[2], o1[1], o1[0], 0};
    a[3] = v4i{o1[6], o1[5], o1[4], 0};
#else
    uint32_t r[4];
    uint32_t g[4];
    uint32_t b[4];
    int j;

    memset(r, 0, sizeof(r));
    memset(g, 0, sizeof(g));
    memset(b, 0, sizeof(b));

    for( j=0; j<4; j++ )
    {
        int i;
        for( i=0; i<4; i++ )
        {
            int index = (j & 2) + (i >> 1);
            b[index] += *data++;
            g[index] += *data++;
            r[index] += *data++;
            data++;
        }
    }

    a[0][0] = (uint16_t)( (r[2] + r[3] + 4) / 8 ), a[0][1] = (uint16_t)( (g[2] + g[3] + 4) / 8 ), a[0][2] = (uint16_t)( (b[2] + b[3] + 4) / 8 ), a[0][3] = 0;
    a[1][0] = (uint16_t)( (r[0] + r[1] + 4) / 8 ), a[1][1] = (uint16_t)( (g[0] + g[1] + 4) / 8 ), a[1][2] = (uint16_t)( (b[0] + b[1] + 4) / 8 ), a[1][3] = 0;
    a[2][0] = (uint16_t)( (r[1] + r[3] + 4) / 8 ), a[2][1] = (uint16_t)( (g[1] + g[3] + 4) / 8 ), a[2][2] = (uint16_t)( (b[1] + b[3] + 4) / 8 ), a[2][3] = 0;
    a[3][0] = (uint16_t)( (r[0] + r[2] + 4) / 8 ), a[3][1] = (uint16_t)( (g[0] + g[2] + 4) / 8 ), a[3][2] = (uint16_t)( (b[0] + b[2] + 4) / 8 ), a[3][3] = 0;
#endif
}

static etcpak_force_inline void CalcErrorBlock( const uint8_t* data, unsigned int err[4][4] )
{
#ifdef __SSE4_1__
    __m128i d0 = _mm_loadu_si128(((__m128i*)data) + 0);
    __m128i d1 = _mm_loadu_si128(((__m128i*)data) + 1);
    __m128i d2 = _mm_loadu_si128(((__m128i*)data) + 2);
    __m128i d3 = _mm_loadu_si128(((__m128i*)data) + 3);

    __m128i dm0 = _mm_and_si128(d0, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm1 = _mm_and_si128(d1, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm2 = _mm_and_si128(d2, _mm_set1_epi32(0x00FFFFFF));
    __m128i dm3 = _mm_and_si128(d3, _mm_set1_epi32(0x00FFFFFF));

    __m128i d0l = _mm_unpacklo_epi8(dm0, _mm_setzero_si128());
    __m128i d0h = _mm_unpackhi_epi8(dm0, _mm_setzero_si128());
    __m128i d1l = _mm_unpacklo_epi8(dm1, _mm_setzero_si128());
    __m128i d1h = _mm_unpackhi_epi8(dm1, _mm_setzero_si128());
    __m128i d2l = _mm_unpacklo_epi8(dm2, _mm_setzero_si128());
    __m128i d2h = _mm_unpackhi_epi8(dm2, _mm_setzero_si128());
    __m128i d3l = _mm_unpacklo_epi8(dm3, _mm_setzero_si128());
    __m128i d3h = _mm_unpackhi_epi8(dm3, _mm_setzero_si128());

    __m128i sum0 = _mm_add_epi16(d0l, d1l);
    __m128i sum1 = _mm_add_epi16(d0h, d1h);
    __m128i sum2 = _mm_add_epi16(d2l, d3l);
    __m128i sum3 = _mm_add_epi16(d2h, d3h);

    __m128i sum0l = _mm_unpacklo_epi16(sum0, _mm_setzero_si128());
    __m128i sum0h = _mm_unpackhi_epi16(sum0, _mm_setzero_si128());
    __m128i sum1l = _mm_unpacklo_epi16(sum1, _mm_setzero_si128());
    __m128i sum1h = _mm_unpackhi_epi16(sum1, _mm_setzero_si128());
    __m128i sum2l = _mm_unpacklo_epi16(sum2, _mm_setzero_si128());
    __m128i sum2h = _mm_unpackhi_epi16(sum2, _mm_setzero_si128());
    __m128i sum3l = _mm_unpacklo_epi16(sum3, _mm_setzero_si128());
    __m128i sum3h = _mm_unpackhi_epi16(sum3, _mm_setzero_si128());

    __m128i b0 = _mm_add_epi32(sum0l, sum0h);
    __m128i b1 = _mm_add_epi32(sum1l, sum1h);
    __m128i b2 = _mm_add_epi32(sum2l, sum2h);
    __m128i b3 = _mm_add_epi32(sum3l, sum3h);

    __m128i a0 = _mm_add_epi32(b2, b3);
    __m128i a1 = _mm_add_epi32(b0, b1);
    __m128i a2 = _mm_add_epi32(b1, b3);
    __m128i a3 = _mm_add_epi32(b0, b2);

    _mm_storeu_si128((__m128i*)&err[0], a0);
    _mm_storeu_si128((__m128i*)&err[1], a1);
    _mm_storeu_si128((__m128i*)&err[2], a2);
    _mm_storeu_si128((__m128i*)&err[3], a3);
#elif defined __ARM_NEON
    uint8x16x2_t t0 = vzipq_u8(vld1q_u8(data +  0), uint8x16_t());
    uint8x16x2_t t1 = vzipq_u8(vld1q_u8(data + 16), uint8x16_t());
    uint8x16x2_t t2 = vzipq_u8(vld1q_u8(data + 32), uint8x16_t());
    uint8x16x2_t t3 = vzipq_u8(vld1q_u8(data + 48), uint8x16_t());

    uint16x8x2_t d0 = { vreinterpretq_u16_u8(t0.val[0]), vreinterpretq_u16_u8(t0.val[1]) };
    uint16x8x2_t d1 = { vreinterpretq_u16_u8(t1.val[0]), vreinterpretq_u16_u8(t1.val[1]) };
    uint16x8x2_t d2 = { vreinterpretq_u16_u8(t2.val[0]), vreinterpretq_u16_u8(t2.val[1]) };
    uint16x8x2_t d3 = { vreinterpretq_u16_u8(t3.val[0]), vreinterpretq_u16_u8(t3.val[1]) };

    uint16x8x2_t s0 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d0.val[0] ), vreinterpretq_s16_u16( d1.val[0] ))), uint16x8_t());
    uint16x8x2_t s1 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d0.val[1] ), vreinterpretq_s16_u16( d1.val[1] ))), uint16x8_t());
    uint16x8x2_t s2 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d2.val[0] ), vreinterpretq_s16_u16( d3.val[0] ))), uint16x8_t());
    uint16x8x2_t s3 = vzipq_u16(vreinterpretq_u16_s16( vaddq_s16(vreinterpretq_s16_u16( d2.val[1] ), vreinterpretq_s16_u16( d3.val[1] ))), uint16x8_t());

    uint32x4x2_t sum0 = { vreinterpretq_u32_u16(s0.val[0]), vreinterpretq_u32_u16(s0.val[1]) };
    uint32x4x2_t sum1 = { vreinterpretq_u32_u16(s1.val[0]), vreinterpretq_u32_u16(s1.val[1]) };
    uint32x4x2_t sum2 = { vreinterpretq_u32_u16(s2.val[0]), vreinterpretq_u32_u16(s2.val[1]) };
    uint32x4x2_t sum3 = { vreinterpretq_u32_u16(s3.val[0]), vreinterpretq_u32_u16(s3.val[1]) };

    uint32x4_t b0 = vaddq_u32(sum0.val[0], sum0.val[1]);
    uint32x4_t b1 = vaddq_u32(sum1.val[0], sum1.val[1]);
    uint32x4_t b2 = vaddq_u32(sum2.val[0], sum2.val[1]);
    uint32x4_t b3 = vaddq_u32(sum3.val[0], sum3.val[1]);

    uint32x4_t a0 = vreinterpretq_u32_u8( vandq_u8(vreinterpretq_u8_u32( vqaddq_u32(b2, b3) ), vreinterpretq_u8_u32( vdupq_n_u32(0x00FFFFFF)) ) );
    uint32x4_t a1 = vreinterpretq_u32_u8( vandq_u8(vreinterpretq_u8_u32( vqaddq_u32(b0, b1) ), vreinterpretq_u8_u32( vdupq_n_u32(0x00FFFFFF)) ) );
    uint32x4_t a2 = vreinterpretq_u32_u8( vandq_u8(vreinterpretq_u8_u32( vqaddq_u32(b1, b3) ), vreinterpretq_u8_u32( vdupq_n_u32(0x00FFFFFF)) ) );
    uint32x4_t a3 = vreinterpretq_u32_u8( vandq_u8(vreinterpretq_u8_u32( vqaddq_u32(b0, b2) ), vreinterpretq_u8_u32( vdupq_n_u32(0x00FFFFFF)) ) );

    vst1q_u32(err[0], a0);
    vst1q_u32(err[1], a1);
    vst1q_u32(err[2], a2);
    vst1q_u32(err[3], a3);
#else
    unsigned int terr[4][4];

    memset(terr, 0, 16 * sizeof(unsigned int));

    int i, j;
    for( j=0; j<4; j++ )
    {
        for( i=0; i<4; i++ )
        {
            int index = (j & 2) + (i >> 1);
            unsigned int d = *data++;
            terr[index][0] += d;
            d = *data++;
            terr[index][1] += d;
            d = *data++;
            terr[index][2] += d;
            data++;
        }
    }

    for( i=0; i<3; i++ )
    {
        err[0][i] = terr[2][i] + terr[3][i];
        err[1][i] = terr[0][i] + terr[1][i];
        err[2][i] = terr[1][i] + terr[3][i];
        err[3][i] = terr[0][i] + terr[2][i];
    }
    for( i=0; i<4; i++ )
    {
        err[i][3] = 0;
    }
#endif
}

static etcpak_force_inline unsigned int CalcError( const unsigned int block[4], const v4i average )
{
    unsigned int err = 0x3FFFFFFF; // Big value to prevent negative values, but small enough to prevent overflow
    err -= block[0] * 2 * average[2];
    err -= block[1] * 2 * average[1];
    err -= block[2] * 2 * average[0];
    err += 8 * ( sq( average[0] ) + sq( average[1] ) + sq( average[2] ) );
    return err;
}

static etcpak_force_inline void ProcessAverages( v4i* a )
{
    int i;
#ifdef __SSE4_1__
    for( i=0; i<2; i++ )
    {
        __m128i d = _mm_loadu_si128((__m128i*)a[i*2]);

        __m128i t = _mm_add_epi16(_mm_mullo_epi16(d, _mm_set1_epi16(31)), _mm_set1_epi16(128));

        __m128i c = _mm_srli_epi16(_mm_add_epi16(t, _mm_srli_epi16(t, 8)), 8);

        __m128i c1 = _mm_shuffle_epi32(c, _MM_SHUFFLE(3, 2, 3, 2));
        __m128i diff = _mm_sub_epi16(c, c1);
        diff = _mm_max_epi16(diff, _mm_set1_epi16(-4));
        diff = _mm_min_epi16(diff, _mm_set1_epi16(3));

        __m128i co = _mm_add_epi16(c1, diff);

        c = _mm_blend_epi16(co, c, 0xF0);

        __m128i a0 = _mm_or_si128(_mm_slli_epi16(c, 3), _mm_srli_epi16(c, 2));

        _mm_storeu_si128((__m128i*)a[4+i*2], a0);
    }

    for( i=0; i<2; i++ )
    {
        __m128i d = _mm_loadu_si128((__m128i*)a[i*2]);

        __m128i t0 = _mm_add_epi16(_mm_mullo_epi16(d, _mm_set1_epi16(15)), _mm_set1_epi16(128));
        __m128i t1 = _mm_srli_epi16(_mm_add_epi16(t0, _mm_srli_epi16(t0, 8)), 8);

        __m128i t2 = _mm_or_si128(t1, _mm_slli_epi16(t1, 4));

        _mm_storeu_si128((__m128i*)a[i*2], t2);
    }
#elif defined __ARM_NEON
    for( i=0; i<2; i++ )
    {
        int16x8_t d = vld1q_s16((int16_t*)&a[i*2]);
        int16x8_t t = vaddq_s16(vmulq_s16(d, vdupq_n_s16(31)), vdupq_n_s16(128));
        int16x8_t c = vshrq_n_s16(vaddq_s16(t, vshrq_n_s16(t, 8)), 8);

        int16x8_t c1 = vcombine_s16(vget_high_s16(c), vget_high_s16(c));
        int16x8_t diff = vsubq_s16(c, c1);
        diff = vmaxq_s16(diff, vdupq_n_s16(-4));
        diff = vminq_s16(diff, vdupq_n_s16(3));

        int16x8_t co = vaddq_s16(c1, diff);

        c = vcombine_s16(vget_low_s16(co), vget_high_s16(c));

        int16x8_t a0 = vorrq_s16(vshlq_n_s16(c, 3), vshrq_n_s16(c, 2));

        vst1q_s16((int16_t*)&a[4+i*2], a0);
    }

    for( i=0; i<2; i++ )
    {
        int16x8_t d = vld1q_s16((int16_t*)&a[i*2]);

        int16x8_t t0 = vaddq_s16(vmulq_s16(d, vdupq_n_s16(15)), vdupq_n_s16(128));
        int16x8_t t1 = vshrq_n_s16(vaddq_s16(t0, vshrq_n_s16(t0, 8)), 8);

        int16x8_t t2 = vorrq_s16(t1, vshlq_n_s16(t1, 4));

        vst1q_s16((int16_t*)&a[i*2], t2);
    }
#else
    for( i=0; i<2; i++ )
    {
        int j;
        for( j=0; j<3; j++ )
        {
            int32_t c1 = mul8bit( a[i*2+1][j], 31 );
            int32_t c2 = mul8bit( a[i*2][j], 31 );

            int32_t diff = c2 - c1;
            if( diff > 3 ) diff = 3;
            else if( diff < -4 ) diff = -4;

            int32_t co = c1 + diff;

            a[5+i*2][j] = ( c1 << 3 ) | ( c1 >> 2 );
            a[4+i*2][j] = ( co << 3 ) | ( co >> 2 );
        }
    }

    for( i=0; i<4; i++ )
    {
        a[i][0] = g_avg2[mul8bit( a[i][0], 15 )];
        a[i][1] = g_avg2[mul8bit( a[i][1], 15 )];
        a[i][2] = g_avg2[mul8bit( a[i][2], 15 )];
    }
#endif
}

static etcpak_force_inline void EncodeAverages( uint64_t * _d, const v4i* a, size_t idx )
{
    uint64_t d = *_d;
    d |= ( idx << 24 );
    size_t base = idx << 1;
    int i;

    if( ( idx & 0x2 ) == 0 )
    {
        for( i=0; i<3; i++ )
        {
            d |= ( (uint64_t)a[base+0][i] >> 4 ) << ( i*8 );
            d |= ( (uint64_t)a[base+1][i] >> 4 ) << ( i*8 + 4 );
        }
    }
    else
    {
        for( i=0; i<3; i++ )
        {
            d |= ( (uint64_t)a[base+1][i] & 0xF8 ) << ( i*8 );
            int32_t c = ( ( a[base+0][i] & 0xF8 ) - ( a[base+1][i] & 0xF8 ) ) >> 3;
            c &= ~0xFFFFFFF8;
            d |= ((uint64_t)c) << ( i*8 );
        }
    }
    *_d = d;
}

static etcpak_force_inline uint64_t CheckSolid( const uint8_t* src )
{
#ifdef __SSE4_1__
    __m128i d0 = _mm_loadu_si128(((__m128i*)src) + 0);
    __m128i d1 = _mm_loadu_si128(((__m128i*)src) + 1);
    __m128i d2 = _mm_loadu_si128(((__m128i*)src) + 2);
    __m128i d3 = _mm_loadu_si128(((__m128i*)src) + 3);

    __m128i c = _mm_shuffle_epi32(d0, _MM_SHUFFLE(0, 0, 0, 0));

    __m128i c0 = _mm_cmpeq_epi8(d0, c);
    __m128i c1 = _mm_cmpeq_epi8(d1, c);
    __m128i c2 = _mm_cmpeq_epi8(d2, c);
    __m128i c3 = _mm_cmpeq_epi8(d3, c);

    __m128i m0 = _mm_and_si128(c0, c1);
    __m128i m1 = _mm_and_si128(c2, c3);
    __m128i m = _mm_and_si128(m0, m1);

    if (!_mm_testc_si128(m, _mm_set1_epi32(-1)))
    {
        return 0;
    }
#elif defined __ARM_NEON
    int32x4_t d0 = vld1q_s32((int32_t*)src +  0);
    int32x4_t d1 = vld1q_s32((int32_t*)src +  4);
    int32x4_t d2 = vld1q_s32((int32_t*)src +  8);
    int32x4_t d3 = vld1q_s32((int32_t*)src + 12);

    int32x4_t c = vdupq_n_s32(d0[0]);

    int32x4_t c0 = vreinterpretq_s32_u32(vceqq_s32(d0, c));
    int32x4_t c1 = vreinterpretq_s32_u32(vceqq_s32(d1, c));
    int32x4_t c2 = vreinterpretq_s32_u32(vceqq_s32(d2, c));
    int32x4_t c3 = vreinterpretq_s32_u32(vceqq_s32(d3, c));

    int32x4_t m0 = vandq_s32(c0, c1);
    int32x4_t m1 = vandq_s32(c2, c3);
    int64x2_t m = vreinterpretq_s64_s32(vandq_s32(m0, m1));

    if (m[0] != -1 || m[1] != -1)
    {
        return 0;
    }
#else
    const uint8_t* ptr = src + 4;
    int i;
    for( i=1; i<16; i++ )
    {
        if( memcmp( src, ptr, 4 ) != 0 )
        {
            return 0;
        }
        ptr += 4;
    }
#endif
    return 0x02000000 |
        ( (unsigned int)( src[0] & 0xF8 ) << 16 ) |
        ( (unsigned int)( src[1] & 0xF8 ) << 8 ) |
        ( (unsigned int)( src[2] & 0xF8 ) );
}

static etcpak_force_inline void PrepareAverages( v4i a[8], const uint8_t* src, unsigned int err[4] )
{
    Average( src, a );
    ProcessAverages( a );

    unsigned int errblock[4][4];
    int i;
    CalcErrorBlock( src, errblock );

    for( i=0; i<4; i++ )
    {
        err[i/2] += CalcError( errblock[i], a[i] );
        err[2+i/2] += CalcError( errblock[i], a[i+4] );
    }
}

#if defined __SSE4_1__ || defined __ARM_NEON
// Non-reference implementation, but faster. Produces same results as the AVX2 version
static etcpak_force_inline void FindBestFit( uint32_t terr[2][8], uint16_t tsel[16][8], v4i a[8], const uint32_t* id, const uint8_t* data )
{
    size_t i;
    for( i=0; i<16; i++ )
    {
        uint16_t* sel = tsel[i];
        unsigned int bid = id[i];
        uint32_t* ter = terr[bid%2];

        uint8_t b = *data++;
        uint8_t g = *data++;
        uint8_t r = *data++;
        data++;

        int dr = a[bid][0] - r;
        int dg = a[bid][1] - g;
        int db = a[bid][2] - b;

#ifdef __SSE4_1__
        // The scaling values are divided by two and rounded, to allow the differences to be in the range of signed int16
        // This produces slightly different results, but is significant faster
        __m128i pixel = _mm_set1_epi16(dr * 38 + dg * 76 + db * 14);
        __m128i pix = _mm_abs_epi16(pixel);

        // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
        // Since the selector table is symmetrical, we need to calculate the difference only for half of the entries.
        __m128i error0 = _mm_abs_epi16(_mm_sub_epi16(pix, g_table128_SIMD[0]));
        __m128i error1 = _mm_abs_epi16(_mm_sub_epi16(pix, g_table128_SIMD[1]));

        __m128i index = _mm_and_si128(_mm_cmplt_epi16(error1, error0), _mm_set1_epi16(1));
        __m128i minError = _mm_min_epi16(error0, error1);

        // Exploiting symmetry of the selector table and use the sign bit
        // This produces slightly different results, but is needed to produce same results as AVX2 implementation
        __m128i indexBit = _mm_andnot_si128(_mm_srli_epi16(pixel, 15), _mm_set1_epi8(-1));
        __m128i minIndex = _mm_or_si128(index, _mm_add_epi16(indexBit, indexBit));

        // Squaring the minimum error to produce correct values when adding
        __m128i squareErrorLo = _mm_mullo_epi16(minError, minError);
        __m128i squareErrorHi = _mm_mulhi_epi16(minError, minError);

        __m128i squareErrorLow = _mm_unpacklo_epi16(squareErrorLo, squareErrorHi);
        __m128i squareErrorHigh = _mm_unpackhi_epi16(squareErrorLo, squareErrorHi);

        squareErrorLow = _mm_add_epi32(squareErrorLow, _mm_loadu_si128(((__m128i*)ter) + 0));
        _mm_storeu_si128(((__m128i*)ter) + 0, squareErrorLow);
        squareErrorHigh = _mm_add_epi32(squareErrorHigh, _mm_loadu_si128(((__m128i*)ter) + 1));
        _mm_storeu_si128(((__m128i*)ter) + 1, squareErrorHigh);

        _mm_storeu_si128((__m128i*)sel, minIndex);
#elif defined __ARM_NEON
        int16x8_t pixel = vdupq_n_s16( dr * 38 + dg * 76 + db * 14 );
        int16x8_t pix = vabsq_s16( pixel );

        int16x8_t error0 = vabsq_s16( vsubq_s16( pix, g_table128_NEON[0] ) );
        int16x8_t error1 = vabsq_s16( vsubq_s16( pix, g_table128_NEON[1] ) );

        int16x8_t index = vandq_s16( vreinterpretq_s16_u16( vcltq_s16( error1, error0 ) ), vdupq_n_s16( 1 ) );
        int16x8_t minError = vminq_s16( error0, error1 );

        int16x8_t indexBit = vandq_s16( vmvnq_s16( vshrq_n_s16( pixel, 15 ) ), vdupq_n_s16( -1 ) );
        int16x8_t minIndex = vorrq_s16( index, vaddq_s16( indexBit, indexBit ) );

        int16x4_t minErrorLow = vget_low_s16( minError );
        int16x4_t minErrorHigh = vget_high_s16( minError );

        int32x4_t squareErrorLow = vmull_s16( minErrorLow, minErrorLow );
        int32x4_t squareErrorHigh = vmull_s16( minErrorHigh, minErrorHigh );

        int32x4_t squareErrorSumLow = vaddq_s32( squareErrorLow, vld1q_s32( (int32_t*)ter ) );
        int32x4_t squareErrorSumHigh = vaddq_s32( squareErrorHigh, vld1q_s32( (int32_t*)ter + 4 ) );

        vst1q_s32( (int32_t*)ter, squareErrorSumLow );
        vst1q_s32( (int32_t*)ter + 4, squareErrorSumHigh );

        vst1q_s16( (int16_t*)sel, minIndex );
#endif
    }
}
#else
static etcpak_force_inline void FindBestFit( uint64_t terr[2][8], uint16_t tsel[16][8], v4i a[8], const uint32_t* id, const uint8_t* data )
{
    size_t i;
    for( i=0; i<16; i++ )
    {
        uint16_t* sel = tsel[i];
        unsigned int bid = id[i];
        uint64_t* ter = terr[bid%2];

        uint8_t b = *data++;
        uint8_t g = *data++;
        uint8_t r = *data++;
        data++;

        int dr = a[bid][0] - r;
        int dg = a[bid][1] - g;
        int db = a[bid][2] - b;

#ifdef __SSE4_1__
        // Reference implementation

        __m128i pix = _mm_set1_epi32(dr * 77 + dg * 151 + db * 28);
        // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
        __m128i error0 = _mm_abs_epi32(_mm_add_epi32(pix, g_table256_SIMD[0]));
        __m128i error1 = _mm_abs_epi32(_mm_add_epi32(pix, g_table256_SIMD[1]));
        __m128i error2 = _mm_abs_epi32(_mm_sub_epi32(pix, g_table256_SIMD[0]));
        __m128i error3 = _mm_abs_epi32(_mm_sub_epi32(pix, g_table256_SIMD[1]));

        __m128i index0 = _mm_and_si128(_mm_cmplt_epi32(error1, error0), _mm_set1_epi32(1));
        __m128i minError0 = _mm_min_epi32(error0, error1);

        __m128i index1 = _mm_sub_epi32(_mm_set1_epi32(2), _mm_cmplt_epi32(error3, error2));
        __m128i minError1 = _mm_min_epi32(error2, error3);

        __m128i minIndex0 = _mm_blendv_epi8(index0, index1, _mm_cmplt_epi32(minError1, minError0));
        __m128i minError = _mm_min_epi32(minError0, minError1);

        // Squaring the minimum error to produce correct values when adding
        __m128i minErrorLow = _mm_shuffle_epi32(minError, _MM_SHUFFLE(1, 1, 0, 0));
        __m128i squareErrorLow = _mm_mul_epi32(minErrorLow, minErrorLow);
        squareErrorLow = _mm_add_epi64(squareErrorLow, _mm_loadu_si128(((__m128i*)ter) + 0));
        _mm_storeu_si128(((__m128i*)ter) + 0, squareErrorLow);
        __m128i minErrorHigh = _mm_shuffle_epi32(minError, _MM_SHUFFLE(3, 3, 2, 2));
        __m128i squareErrorHigh = _mm_mul_epi32(minErrorHigh, minErrorHigh);
        squareErrorHigh = _mm_add_epi64(squareErrorHigh, _mm_loadu_si128(((__m128i*)ter) + 1));
        _mm_storeu_si128(((__m128i*)ter) + 1, squareErrorHigh);

        // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
        error0 = _mm_abs_epi32(_mm_add_epi32(pix, g_table256_SIMD[2]));
        error1 = _mm_abs_epi32(_mm_add_epi32(pix, g_table256_SIMD[3]));
        error2 = _mm_abs_epi32(_mm_sub_epi32(pix, g_table256_SIMD[2]));
        error3 = _mm_abs_epi32(_mm_sub_epi32(pix, g_table256_SIMD[3]));

        index0 = _mm_and_si128(_mm_cmplt_epi32(error1, error0), _mm_set1_epi32(1));
        minError0 = _mm_min_epi32(error0, error1);

        index1 = _mm_sub_epi32(_mm_set1_epi32(2), _mm_cmplt_epi32(error3, error2));
        minError1 = _mm_min_epi32(error2, error3);

        __m128i minIndex1 = _mm_blendv_epi8(index0, index1, _mm_cmplt_epi32(minError1, minError0));
        minError = _mm_min_epi32(minError0, minError1);

        // Squaring the minimum error to produce correct values when adding
        minErrorLow = _mm_shuffle_epi32(minError, _MM_SHUFFLE(1, 1, 0, 0));
        squareErrorLow = _mm_mul_epi32(minErrorLow, minErrorLow);
        squareErrorLow = _mm_add_epi64(squareErrorLow, _mm_loadu_si128(((__m128i*)ter) + 2));
        _mm_storeu_si128(((__m128i*)ter) + 2, squareErrorLow);
        minErrorHigh = _mm_shuffle_epi32(minError, _MM_SHUFFLE(3, 3, 2, 2));
        squareErrorHigh = _mm_mul_epi32(minErrorHigh, minErrorHigh);
        squareErrorHigh = _mm_add_epi64(squareErrorHigh, _mm_loadu_si128(((__m128i*)ter) + 3));
        _mm_storeu_si128(((__m128i*)ter) + 3, squareErrorHigh);
        __m128i minIndex = _mm_packs_epi32(minIndex0, minIndex1);
        _mm_storeu_si128((__m128i*)sel, minIndex);
#elif defined __ARM_NEON
        int32x4_t pix = vdupq_n_s32(dr * 77 + dg * 151 + db * 28);

        // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
        uint32x4_t error0 = vreinterpretq_u32_s32(vabsq_s32(vaddq_s32(pix, g_table256_NEON[0])));
        uint32x4_t error1 = vreinterpretq_u32_s32(vabsq_s32(vaddq_s32(pix, g_table256_NEON[1])));
        uint32x4_t error2 = vreinterpretq_u32_s32(vabsq_s32(vsubq_s32(pix, g_table256_NEON[0])));
        uint32x4_t error3 = vreinterpretq_u32_s32(vabsq_s32(vsubq_s32(pix, g_table256_NEON[1])));

        uint32x4_t index0 = vandq_u32(vcltq_u32(error1, error0), vdupq_n_u32(1));
        uint32x4_t minError0 = vminq_u32(error0, error1);

        uint32x4_t index1 = vreinterpretq_u32_s32(vsubq_s32(vdupq_n_s32(2), vreinterpretq_s32_u32(vcltq_u32(error3, error2))));
        uint32x4_t minError1 = vminq_u32(error2, error3);

        uint32x4_t blendMask = vcltq_u32(minError1, minError0);
        uint32x4_t minIndex0 = vorrq_u32(vbicq_u32(index0, blendMask), vandq_u32(index1, blendMask));
        uint32x4_t minError = vminq_u32(minError0, minError1);

        // Squaring the minimum error to produce correct values when adding
        uint32x4_t squareErrorLow = vmulq_u32(minError, minError);
        uint32x4_t squareErrorHigh = vshrq_n_u32(vreinterpretq_u32_s32(vqdmulhq_s32(vreinterpretq_s32_u32(minError), vreinterpretq_s32_u32(minError))), 1);
        uint32x4x2_t squareErrorZip = vzipq_u32(squareErrorLow, squareErrorHigh);
        uint64x2x2_t squareError = { vreinterpretq_u64_u32(squareErrorZip.val[0]), vreinterpretq_u64_u32(squareErrorZip.val[1]) };
        squareError.val[0] = vaddq_u64(squareError.val[0], vld1q_u64(ter + 0));
        squareError.val[1] = vaddq_u64(squareError.val[1], vld1q_u64(ter + 2));
        vst1q_u64(ter + 0, squareError.val[0]);
        vst1q_u64(ter + 2, squareError.val[1]);

        // Taking the absolute value is way faster. The values are only used to sort, so the result will be the same.
        error0 = vreinterpretq_u32_s32( vabsq_s32(vaddq_s32(pix, g_table256_NEON[2])));
        error1 = vreinterpretq_u32_s32( vabsq_s32(vaddq_s32(pix, g_table256_NEON[3])));
        error2 = vreinterpretq_u32_s32( vabsq_s32(vsubq_s32(pix, g_table256_NEON[2])));
        error3 = vreinterpretq_u32_s32( vabsq_s32(vsubq_s32(pix, g_table256_NEON[3])));

        index0 = vandq_u32(vcltq_u32(error1, error0), vdupq_n_u32(1));
        minError0 = vminq_u32(error0, error1);

        index1 = vreinterpretq_u32_s32( vsubq_s32(vdupq_n_s32(2), vreinterpretq_s32_u32(vcltq_u32(error3, error2))) );
        minError1 = vminq_u32(error2, error3);

        blendMask = vcltq_u32(minError1, minError0);
        uint32x4_t minIndex1 = vorrq_u32(vbicq_u32(index0, blendMask), vandq_u32(index1, blendMask));
        minError = vminq_u32(minError0, minError1);

        // Squaring the minimum error to produce correct values when adding
        squareErrorLow = vmulq_u32(minError, minError);
        squareErrorHigh = vshrq_n_u32(vreinterpretq_u32_s32( vqdmulhq_s32(vreinterpretq_s32_u32(minError), vreinterpretq_s32_u32(minError)) ), 1 );
        squareErrorZip = vzipq_u32(squareErrorLow, squareErrorHigh);
        squareError.val[0] = vaddq_u64(vreinterpretq_u64_u32( squareErrorZip.val[0] ), vld1q_u64(ter + 4));
        squareError.val[1] = vaddq_u64(vreinterpretq_u64_u32( squareErrorZip.val[1] ), vld1q_u64(ter + 6));
        vst1q_u64(ter + 4, squareError.val[0]);
        vst1q_u64(ter + 6, squareError.val[1]);

        uint16x8_t minIndex = vcombine_u16(vqmovn_u32(minIndex0), vqmovn_u32(minIndex1));
        vst1q_u16(sel, minIndex);
#else
        int pix = dr * 77 + dg * 151 + db * 28;
        int t;

        for( t=0; t<8; t++ )
        {
            const int64_t* tab = g_table256[t];
            unsigned int idx = 0;
            uint64_t err = sq64( tab[0] + pix );
            int j;
            for( j=1; j<4; j++ )
            {
                uint64_t local = sq64( tab[j] + pix );
                if( local < err )
                {
                    err = local;
                    idx = j;
                }
            }
            *sel++ = idx;
            *ter++ += err;
        }
#endif
    }
}

#endif

static etcpak_force_inline uint8_t convert6(float f)
{
    int i = (Min(Max(((int)f), 0), 1023) - 15) >> 1;
    return (i + 11 - ((i + 11) >> 7) - ((i + 4) >> 7)) >> 3;
}

static etcpak_force_inline uint8_t convert7(float f)
{
    int i = (Min(Max(((int)f), 0), 1023) - 15) >> 1;
    return (i + 9 - ((i + 9) >> 8) - ((i + 6) >> 8)) >> 2;
}

#ifdef QUICK_ETC2
static etcpak_force_inline PairUI64 Planar(const uint8_t* src, uint8_t* luma, bool * th_mode_expected)
#else
static etcpak_force_inline PairUI64 Planar(const uint8_t* src)
#endif
{
    int32_t r = 0;
    int32_t g = 0;
    int32_t b = 0;

#ifdef QUICK_ETC2
    uint8_t max_luma = 0;
    uint8_t max_luma_idx = 0;
    uint8_t min_luma = 255;
    uint8_t min_luma_idx = 0;
    bool planar_mode_expected = false;
#endif
    int i;
    for(i = 0; i < 16; ++i)
    {
        b += src[i * 4 + 0];
        g += src[i * 4 + 1];
        r += src[i * 4 + 2];
#ifdef QUICK_ETC2
        luma [i] = (src[i*4+2]*76 + src[i*4+1]*150 + src[i*4]*28) / 254; // luma calculation
        if (min_luma > luma[i])
        {
            min_luma = luma[i];
            min_luma_idx = i;
        }
        if (max_luma < luma[i])
        {
            max_luma = luma[i];
            max_luma_idx = i;
        }
#endif
    }

#ifdef QUICK_ETC2
    float luma_range = (max_luma - min_luma) / 255.0f;
    // filters a very-low-contrast block
    if (luma_range <= ecmd_threshold[0])
    {
        planar_mode_expected = true;
    }
    // checks whether a pair of the corner pixels in a block has the min/max luma values;
    // if so, the ETC2 planar mode is enabled, and otherwise, the ETC1 mode is enabled
    else if (luma_range <= ecmd_threshold[1])
    {
        // check whether a pair of the corner pixels in a block has the min/max luma values;
        // if so, the ETC2 planar mode is enabled.
        if ((min_luma_idx == 0 && max_luma_idx == 15) ||
            (min_luma_idx == 15 && max_luma_idx == 0) ||
            (min_luma_idx == 3 && max_luma_idx == 12) ||
            (min_luma_idx == 12 && max_luma_idx == 3))
        {
            planar_mode_expected = true;
        }
    }
    // filters a high-contrast block for checking both ETC1 mode and the ETC2 T/H mode
    else if (luma_range >= ecmd_threshold[2])
        *th_mode_expected = true;
#endif

    int32_t difRyz = 0;
    int32_t difGyz = 0;
    int32_t difByz = 0;
    int32_t difRxz = 0;
    int32_t difGxz = 0;
    int32_t difBxz = 0;

    const int32_t scaling[] = { -255, -85, 85, 255 };

    for(i = 0; i < 16; ++i)
    {
        int32_t difB = (((int)src[i * 4 + 0]) << 4) - b;
        int32_t difG = (((int)src[i * 4 + 1]) << 4) - g;
        int32_t difR = (((int)src[i * 4 + 2]) << 4) - r;

        difRyz += difR * scaling[i % 4];
        difGyz += difG * scaling[i % 4];
        difByz += difB * scaling[i % 4];

        difRxz += difR * scaling[i / 4];
        difGxz += difG * scaling[i / 4];
        difBxz += difB * scaling[i / 4];
    }

    const float scale = -4.0f / ((255 * 255 * 8.0f + 85 * 85 * 8.0f) * 16.0f);

    float aR = difRxz * scale;
    float aG = difGxz * scale;
    float aB = difBxz * scale;

    float bR = difRyz * scale;
    float bG = difGyz * scale;
    float bB = difByz * scale;

    float dR = r * (4.0f / 16.0f);
    float dG = g * (4.0f / 16.0f);
    float dB = b * (4.0f / 16.0f);

    // calculating the three colors RGBO, RGBH, and RGBV.  RGB = df - af * x - bf * y;
    float cofR = fmaf(aR,  255.0f, fmaf(bR,  255.0f, dR));
    float cofG = fmaf(aG,  255.0f, fmaf(bG,  255.0f, dG));
    float cofB = fmaf(aB,  255.0f, fmaf(bB,  255.0f, dB));
    float chfR = fmaf(aR, -425.0f, fmaf(bR,  255.0f, dR));
    float chfG = fmaf(aG, -425.0f, fmaf(bG,  255.0f, dG));
    float chfB = fmaf(aB, -425.0f, fmaf(bB,  255.0f, dB));
    float cvfR = fmaf(aR,  255.0f, fmaf(bR, -425.0f, dR));
    float cvfG = fmaf(aG,  255.0f, fmaf(bG, -425.0f, dG));
    float cvfB = fmaf(aB,  255.0f, fmaf(bB, -425.0f, dB));

    // convert to r6g7b6
    int32_t coR = convert6(cofR);
    int32_t coG = convert7(cofG);
    int32_t coB = convert6(cofB);
    int32_t chR = convert6(chfR);
    int32_t chG = convert7(chfG);
    int32_t chB = convert6(chfB);
    int32_t cvR = convert6(cvfR);
    int32_t cvG = convert7(cvfG);
    int32_t cvB = convert6(cvfB);

    // Error calculation
    uint64_t error = 0;
#ifdef QUICK_ETC2
    if (planar_mode_expected == false)
    {
#endif
    int32_t ro0 = coR;
    int32_t go0 = coG;
    int32_t bo0 = coB;
    int32_t ro1 = (ro0 >> 4) | (ro0 << 2);
    int32_t go1 = (go0 >> 6) | (go0 << 1);
    int32_t bo1 = (bo0 >> 4) | (bo0 << 2);
    int32_t ro2 = (ro1 << 2) + 2;
    int32_t go2 = (go1 << 2) + 2;
    int32_t bo2 = (bo1 << 2) + 2;

    int32_t rh0 = chR;
    int32_t gh0 = chG;
    int32_t bh0 = chB;
    int32_t rh1 = (rh0 >> 4) | (rh0 << 2);
    int32_t gh1 = (gh0 >> 6) | (gh0 << 1);
    int32_t bh1 = (bh0 >> 4) | (bh0 << 2);

    int32_t rh2 = rh1 - ro1;
    int32_t gh2 = gh1 - go1;
    int32_t bh2 = bh1 - bo1;

    int32_t rv0 = cvR;
    int32_t gv0 = cvG;
    int32_t bv0 = cvB;
    int32_t rv1 = (rv0 >> 4) | (rv0 << 2);
    int32_t gv1 = (gv0 >> 6) | (gv0 << 1);
    int32_t bv1 = (bv0 >> 4) | (bv0 << 2);

    int32_t rv2 = rv1 - ro1;
    int32_t gv2 = gv1 - go1;
    int32_t bv2 = bv1 - bo1;
    int i;
    for(i = 0; i < 16; ++i)
    {
        int32_t cR = clampu8((rh2 * (i / 4) + rv2 * (i % 4) + ro2) >> 2);
        int32_t cG = clampu8((gh2 * (i / 4) + gv2 * (i % 4) + go2) >> 2);
        int32_t cB = clampu8((bh2 * (i / 4) + bv2 * (i % 4) + bo2) >> 2);

        int32_t difB = ((int)src[i * 4 + 0]) - cB;
        int32_t difG = ((int)src[i * 4 + 1]) - cG;
        int32_t difR = ((int)src[i * 4 + 2]) - cR;

        int32_t dif = difR * 38 + difG * 76 + difB * 14;

        error += dif * dif;
    }
#ifdef QUICK_ETC2
    }
#endif

    /**/
    uint32_t rgbv = cvB | (cvG << 6) | (cvR << 13);
    uint32_t rgbh = chB | (chG << 6) | (chR << 13);
    uint32_t hi = rgbv | ((rgbh & 0x1FFF) << 19);
    uint32_t lo = (chR & 0x1) | 0x2 | ((chR << 1) & 0x7C);
    lo |= ((coB & 0x07) <<  7) | ((coB & 0x18) <<  8) | ((coB & 0x20) << 11);
    lo |= ((coG & 0x3F) << 17) | ((coG & 0x40) << 18);
    lo |= coR << 25;

    const int idx = (coR & 0x20) | ((coG & 0x20) >> 1) | ((coB & 0x1E) >> 1);

    lo |= g_flags[idx];

    uint64_t result = ((uint32_t)_bswap(lo));
    result |= ((uint64_t)((uint32_t)_bswap(hi))) << 32;

    PairUI64 pair = { result, error };
    return pair;
}

#ifdef __ARM_NEON

static etcpak_force_inline int32x2_t Planar_NEON_DifXZ( int16x8_t dif_lo, int16x8_t dif_hi )
{
    int32x4_t dif0 = vmull_n_s16( vget_low_s16( dif_lo ), -255 );
    int32x4_t dif1 = vmull_n_s16( vget_high_s16( dif_lo ), -85 );
    int32x4_t dif2 = vmull_n_s16( vget_low_s16( dif_hi ), 85 );
    int32x4_t dif3 = vmull_n_s16( vget_high_s16( dif_hi ), 255 );
    int32x4_t dif4 = vaddq_s32( vaddq_s32( dif0, dif1 ), vaddq_s32( dif2, dif3 ) );

#ifndef __aarch64__
    int32x2_t dif5 = vpadd_s32( vget_low_s32( dif4 ), vget_high_s32( dif4 ) );
    return vpadd_s32( dif5, dif5 );
#else
    return vdup_n_s32( vaddvq_s32( dif4 ) );
#endif
}

static etcpak_force_inline int32x2_t Planar_NEON_DifYZ( int16x8_t dif_lo, int16x8_t dif_hi )
{
    int16x4_t scaling = { -255, -85, 85, 255 };
    int32x4_t dif0 = vmull_s16( vget_low_s16( dif_lo ), scaling );
    int32x4_t dif1 = vmull_s16( vget_high_s16( dif_lo ), scaling );
    int32x4_t dif2 = vmull_s16( vget_low_s16( dif_hi ), scaling );
    int32x4_t dif3 = vmull_s16( vget_high_s16( dif_hi ), scaling );
    int32x4_t dif4 = vaddq_s32( vaddq_s32( dif0, dif1 ), vaddq_s32( dif2, dif3 ) );

#ifndef __aarch64__
    int32x2_t dif5 = vpadd_s32( vget_low_s32( dif4 ), vget_high_s32( dif4 ) );
    return vpadd_s32( dif5, dif5 );
#else
    return vdup_n_s32( vaddvq_s32( dif4 ) );
#endif
}

static etcpak_force_inline int16x8_t Planar_NEON_SumWide( uint8x16_t src )
{
    uint16x8_t accu8 = vpaddlq_u8( src );
#ifndef __aarch64__
    uint16x4_t accu4 = vpadd_u16( vget_low_u16( accu8 ), vget_high_u16( accu8 ) );
    uint16x4_t accu2 = vpadd_u16( accu4, accu4 );
    uint16x4_t accu1 = vpadd_u16( accu2, accu2 );
    return vreinterpretq_s16_u16( vcombine_u16( accu1, accu1 ) );
#else
    return vdupq_n_s16( vaddvq_u16( accu8 ) );
#endif
}

static etcpak_force_inline int16x8_t convert6_NEON( int32x4_t lo, int32x4_t hi )
{
    uint16x8_t x = vcombine_u16( vqmovun_s32( lo ), vqmovun_s32( hi ) );
    int16x8_t i = vreinterpretq_s16_u16( vshrq_n_u16( vqshlq_n_u16( x, 6 ), 6) ); // clamp 0-1023
    i = vhsubq_s16( i, vdupq_n_s16( 15 ) );

    int16x8_t ip11 = vaddq_s16( i, vdupq_n_s16( 11 ) );
    int16x8_t ip4 = vaddq_s16( i, vdupq_n_s16( 4 ) );

    return vshrq_n_s16( vsubq_s16( vsubq_s16( ip11, vshrq_n_s16( ip11, 7 ) ), vshrq_n_s16( ip4, 7) ), 3 );
}

static etcpak_force_inline int16x4_t convert7_NEON( int32x4_t x )
{
    int16x4_t i = vreinterpret_s16_u16( vshr_n_u16( vqshl_n_u16( vqmovun_s32( x ), 6 ), 6 ) ); // clamp 0-1023
    i = vhsub_s16( i, vdup_n_s16( 15 ) );

    int16x4_t p9 = vadd_s16( i, vdup_n_s16( 9 ) );
    int16x4_t p6 = vadd_s16( i, vdup_n_s16( 6 ) );
    return vshr_n_s16( vsub_s16( vsub_s16( p9, vshr_n_s16( p9, 8 ) ), vshr_n_s16( p6, 8 ) ), 2 );
}

static etcpak_force_inline PairUI64 Planar_NEON( const uint8_t* src )
{
    uint8x16x4_t srcBlock = vld4q_u8( src );

    int16x8_t bSumWide = Planar_NEON_SumWide( srcBlock.val[0] );
    int16x8_t gSumWide = Planar_NEON_SumWide( srcBlock.val[1] );
    int16x8_t rSumWide = Planar_NEON_SumWide( srcBlock.val[2] );

    int16x8_t dif_R_lo = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_low_u8( srcBlock.val[2] ), 4) ), rSumWide );
    int16x8_t dif_R_hi = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_high_u8( srcBlock.val[2] ), 4) ), rSumWide );

    int16x8_t dif_G_lo = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_low_u8( srcBlock.val[1] ), 4 ) ), gSumWide );
    int16x8_t dif_G_hi = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_high_u8( srcBlock.val[1] ), 4 ) ), gSumWide );

    int16x8_t dif_B_lo = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_low_u8( srcBlock.val[0] ), 4) ), bSumWide );
    int16x8_t dif_B_hi = vsubq_s16( vreinterpretq_s16_u16( vshll_n_u8( vget_high_u8( srcBlock.val[0] ), 4) ), bSumWide );

    int32x2x2_t dif_xz_z = vzip_s32( vzip_s32( Planar_NEON_DifXZ( dif_B_lo, dif_B_hi ), Planar_NEON_DifXZ( dif_R_lo, dif_R_hi ) ).val[0], Planar_NEON_DifXZ( dif_G_lo, dif_G_hi ) );
    int32x4_t dif_xz = vcombine_s32( dif_xz_z.val[0], dif_xz_z.val[1] );
    int32x2x2_t dif_yz_z = vzip_s32( vzip_s32( Planar_NEON_DifYZ( dif_B_lo, dif_B_hi ), Planar_NEON_DifYZ( dif_R_lo, dif_R_hi ) ).val[0], Planar_NEON_DifYZ( dif_G_lo, dif_G_hi ) );
    int32x4_t dif_yz = vcombine_s32( dif_yz_z.val[0], dif_yz_z.val[1] );

    const float fscale = -4.0f / ( (255 * 255 * 8.0f + 85 * 85 * 8.0f ) * 16.0f );
    float32x4_t fa = vmulq_n_f32( vcvtq_f32_s32( dif_xz ), fscale );
    float32x4_t fb = vmulq_n_f32( vcvtq_f32_s32( dif_yz ), fscale );
    int16x4_t bgrgSum = vzip_s16( vzip_s16( vget_low_s16( bSumWide ), vget_low_s16( rSumWide ) ).val[0], vget_low_s16( gSumWide ) ).val[0];
    float32x4_t fd = vmulq_n_f32( vcvtq_f32_s32( vmovl_s16( bgrgSum ) ), 4.0f / 16.0f);

    float32x4_t cof = vmlaq_n_f32( vmlaq_n_f32( fd, fb, 255.0f ), fa, 255.0f );
    float32x4_t chf = vmlaq_n_f32( vmlaq_n_f32( fd, fb, 255.0f ), fa, -425.0f );
    float32x4_t cvf = vmlaq_n_f32( vmlaq_n_f32( fd, fb, -425.0f ), fa, 255.0f );

    int32x4_t coi = vcvtq_s32_f32( cof );
    int32x4_t chi = vcvtq_s32_f32( chf );
    int32x4_t cvi = vcvtq_s32_f32( cvf );

    int32x4x2_t tr_hv = vtrnq_s32( chi, cvi );
    int32x4x2_t tr_o = vtrnq_s32( coi, coi );

    int16x8_t c_hvoo_br_6 = convert6_NEON( tr_hv.val[0], tr_o.val[0] );
    int16x4_t c_hvox_g_7 = convert7_NEON( vcombine_s32( vget_low_s32( tr_hv.val[1] ), vget_low_s32( tr_o.val[1] ) ) );
    int16x8_t c_hvoo_br_8 = vorrq_s16( vshrq_n_s16( c_hvoo_br_6, 4 ), vshlq_n_s16( c_hvoo_br_6, 2 ) );
    int16x4_t c_hvox_g_8 = vorr_s16( vshr_n_s16( c_hvox_g_7, 6 ), vshl_n_s16( c_hvox_g_7, 1 ) );

    int16x4_t rec_gxbr_o = vext_s16( c_hvox_g_8, vget_high_s16( c_hvoo_br_8 ), 3 );

    rec_gxbr_o = vadd_s16( vshl_n_s16( rec_gxbr_o, 2 ), vdup_n_s16( 2 ) );
    int16x8_t rec_ro_wide = vdupq_lane_s16( rec_gxbr_o, 3 );
    int16x8_t rec_go_wide = vdupq_lane_s16( rec_gxbr_o, 0 );
    int16x8_t rec_bo_wide = vdupq_lane_s16( rec_gxbr_o, 1 );

    int16x4_t br_hv2 = vsub_s16( vget_low_s16( c_hvoo_br_8 ), vget_high_s16( c_hvoo_br_8 ) );
    int16x4_t gg_hv2 = vsub_s16( c_hvox_g_8, vdup_lane_s16( c_hvox_g_8, 2 ) );

    int16x8_t scaleh_lo = { 0, 0, 0, 0, 1, 1, 1, 1 };
    int16x8_t scaleh_hi = { 2, 2, 2, 2, 3, 3, 3, 3 };
    int16x8_t scalev = { 0, 1, 2, 3, 0, 1, 2, 3 };

    int16x8_t rec_r_1 = vmlaq_lane_s16( rec_ro_wide, scalev, br_hv2, 3 );
    int16x8_t rec_r_lo = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_r_1, scaleh_lo, br_hv2, 2 ), 2 ) ) );
    int16x8_t rec_r_hi = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_r_1, scaleh_hi, br_hv2, 2 ), 2 ) ) );

    int16x8_t rec_b_1 = vmlaq_lane_s16( rec_bo_wide, scalev, br_hv2, 1 );
    int16x8_t rec_b_lo = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_b_1, scaleh_lo, br_hv2, 0 ), 2 ) ) );
    int16x8_t rec_b_hi = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_b_1, scaleh_hi, br_hv2, 0 ), 2 ) ) );

    int16x8_t rec_g_1 = vmlaq_lane_s16( rec_go_wide, scalev, gg_hv2, 1 );
    int16x8_t rec_g_lo = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_g_1, scaleh_lo, gg_hv2, 0 ), 2 ) ) );
    int16x8_t rec_g_hi = vreinterpretq_s16_u16( vmovl_u8( vqshrun_n_s16( vmlaq_lane_s16( rec_g_1, scaleh_hi, gg_hv2, 0 ), 2 ) ) );

    int16x8_t dif_r_lo = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_low_u8( srcBlock.val[2] ) ) ), rec_r_lo );
    int16x8_t dif_r_hi = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_high_u8( srcBlock.val[2] ) ) ), rec_r_hi );

    int16x8_t dif_g_lo = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_low_u8( srcBlock.val[1] ) ) ), rec_g_lo );
    int16x8_t dif_g_hi = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_high_u8( srcBlock.val[1] ) ) ), rec_g_hi );

    int16x8_t dif_b_lo = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_low_u8( srcBlock.val[0] ) ) ), rec_b_lo );
    int16x8_t dif_b_hi = vsubq_s16( vreinterpretq_s16_u16( vmovl_u8( vget_high_u8( srcBlock.val[0] ) ) ), rec_b_hi );

    int16x8_t dif_lo = vmlaq_n_s16( vmlaq_n_s16( vmulq_n_s16( dif_r_lo, 38 ), dif_g_lo, 76 ), dif_b_lo, 14 );
    int16x8_t dif_hi = vmlaq_n_s16( vmlaq_n_s16( vmulq_n_s16( dif_r_hi, 38 ), dif_g_hi, 76 ), dif_b_hi, 14 );

    int16x4_t tmpDif = vget_low_s16( dif_lo );
    int32x4_t difsq_0 = vmull_s16( tmpDif, tmpDif );
    tmpDif = vget_high_s16( dif_lo );
    int32x4_t difsq_1 = vmull_s16( tmpDif, tmpDif );
    tmpDif = vget_low_s16( dif_hi );
    int32x4_t difsq_2 = vmull_s16( tmpDif, tmpDif );
    tmpDif = vget_high_s16( dif_hi );
    int32x4_t difsq_3 = vmull_s16( tmpDif, tmpDif );

    uint32x4_t difsq_5 = vaddq_u32( vreinterpretq_u32_s32( difsq_0 ), vreinterpretq_u32_s32( difsq_1 ) );
    uint32x4_t difsq_6 = vaddq_u32( vreinterpretq_u32_s32( difsq_2 ), vreinterpretq_u32_s32( difsq_3) );

    uint64x2_t difsq_7 = vaddl_u32( vget_low_u32( difsq_5 ), vget_high_u32( difsq_5 ) );
    uint64x2_t difsq_8 = vaddl_u32( vget_low_u32( difsq_6 ), vget_high_u32( difsq_6 ) );

    uint64x2_t difsq_9 = vaddq_u64( difsq_7, difsq_8 );

#ifdef __aarch64__
    uint64_t error = vaddvq_u64( difsq_9 );
#else
    uint64_t error = vgetq_lane_u64( difsq_9, 0 ) + vgetq_lane_u64( difsq_9, 1 );
#endif

    int32_t coR = c_hvoo_br_6[6];
    int32_t coG = c_hvox_g_7[2];
    int32_t coB = c_hvoo_br_6[4];

    int32_t chR = c_hvoo_br_6[2];
    int32_t chG = c_hvox_g_7[0];
    int32_t chB = c_hvoo_br_6[0];

    int32_t cvR = c_hvoo_br_6[3];
    int32_t cvG = c_hvox_g_7[1];
    int32_t cvB = c_hvoo_br_6[1];

    uint32_t rgbv = cvB | ( cvG << 6 ) | ( cvR << 13 );
    uint32_t rgbh = chB | ( chG << 6 ) | ( chR << 13 );
    uint32_t hi = rgbv | ( ( rgbh & 0x1FFF ) << 19 );
    uint32_t lo = ( chR & 0x1 ) | 0x2 | ( ( chR << 1 ) & 0x7C );
    lo |= ( ( coB & 0x07 ) << 7 ) | ( ( coB & 0x18 ) << 8 ) | ( ( coB & 0x20 ) << 11 );
    lo |= ( ( coG & 0x3F) << 17) | ( (coG & 0x40 ) << 18 );
    lo |= coR << 25;

    const auto idx = ( coR & 0x20 ) | ( ( coG & 0x20 ) >> 1 ) | ( ( coB & 0x1E ) >> 1 );

    lo |= g_flags[idx];

    uint64_t result = ( (uint32_t)_bswap(lo) );
    result |= ( (uint64_t)( (uint32_t)_bswap( hi ) ) ) << 32;

    PairUI64 pair = { result, error };
    return pair;
}

#endif

static etcpak_force_inline uint64_t EncodeSelectors2( uint64_t d, const TSelectorError terr[2][8], const TSelector tsel[16][8],
   const uint32_t* id, const uint64_t value, const uint64_t error)
{
    size_t tidx[2];
    tidx[0] = GetLeastErrorSel( terr[0], 8 );
    tidx[1] = GetLeastErrorSel( terr[1], 8 );

    if ((terr[0][tidx[0]] + terr[1][tidx[1]]) >= error)
    {
        return value;
    }

    d |= tidx[0] << 26;
    d |= tidx[1] << 29;
    int i;
    for( i=0; i<16; i++ )
    {
        uint64_t t = tsel[i][tidx[id[i]%2]];
        d |= ( t & 0x1 ) << ( i + 32 );
        d |= ( t & 0x2 ) << ( i + 47 );
    }

    return FixByteOrder(d);
}

static etcpak_force_inline uint64_t ProcessRGB( const uint8_t* src )
{
#ifdef __AVX2__
    uint64_t d = CheckSolid_AVX2( src );
    if( d != 0 ) return d;

    alignas(32) v4i a[8];

    __m128i err0 = PrepareAverages_AVX2( a, src );

    // Get index of minimum error (err0)
    __m128i err1 = _mm_shuffle_epi32(err0, _MM_SHUFFLE(2, 3, 0, 1));
    __m128i errMin0 = _mm_min_epu32(err0, err1);

    __m128i errMin1 = _mm_shuffle_epi32(errMin0, _MM_SHUFFLE(1, 0, 3, 2));
    __m128i errMin2 = _mm_min_epu32(errMin1, errMin0);

    __m128i errMask = _mm_cmpeq_epi32(errMin2, err0);

    uint32_t mask = _mm_movemask_epi8(errMask);

    uint32_t idx = _bit_scan_forward(mask) >> 2;

    d |= EncodeAverages_AVX2( a, idx );

    alignas(32) uint32_t terr[2][8] = { 0 };
    alignas(32) uint32_t tsel[8];

    if ((idx == 0) || (idx == 2))
    {
        FindBestFit_4x2_AVX2( terr, tsel, a, idx * 2, src );
    }
    else
    {
        FindBestFit_2x4_AVX2( terr, tsel, a, idx * 2, src );
    }

    return EncodeSelectors_AVX2( d, terr, tsel, (idx % 2) == 1 );
#else
    uint64_t d = CheckSolid( src );
    if( d != 0 ) return d;

    v4i a[8];
    unsigned int err[4] = { 0 };
    PrepareAverages( a, src, err );
    size_t idx = GetLeastError32( err, 4 );
    EncodeAverages( &d, a, idx );

#if ( defined __SSE4_1__ || defined __ARM_NEON ) && !defined REFERENCE_IMPLEMENTATION
    uint32_t terr[2][8] = { 0 };
#else
    uint64_t terr[2][8] = { 0 };
#endif
    uint16_t tsel[16][8];
    const uint32_t * id = g_id[idx];
    FindBestFit( terr, tsel, a, id, src );

    return FixByteOrder( EncodeSelectors( d, terr, tsel, id ) );
#endif
   return 0;
}


#ifdef QUICK_ETC2_TH
//converts indices from  |a0|a1|e0|e1|i0|i1|m0|m1|b0|b1|f0|f1|j0|j1|n0|n1|c0|c1|g0|g1|k0|k1|o0|o1|d0|d1|h0|h1|l0|l1|p0|p1| previously used by T- and H-modes
//                     into  |p0|o0|n0|m0|l0|k0|j0|i0|h0|g0|f0|e0|d0|c0|b0|a0|p1|o1|n1|m1|l1|k1|j1|i1|h1|g1|f1|e1|d1|c1|b1|a1| which should be used for all modes.
// NO WARRANTY --- SEE STATEMENT IN TOP OF FILE (C) Ericsson AB 2005-2013. All Rights Reserved.
int indexConversion(int pixelIndices)
{
    int correctIndices = 0;
    int LSB[4][4];
    int MSB[4][4];
    int shift = 0;
    int x, y;
    for(y = 3; y >= 0; y--)
    {
        for(x = 3; x >= 0; x--)
        {
            LSB[x][y] = (pixelIndices >> shift) & 1;
            shift++;
            MSB[x][y] = (pixelIndices >> shift) & 1;
            shift++;
        }
    }
    shift = 0;
    for(x = 0; x<4; x++)
    {
        for(y = 0; y<4; y++)
        {
            correctIndices |= (LSB[x][y] << shift);
            correctIndices |= (MSB[x][y] << (16 + shift));
            shift++;
        }
    }
    return correctIndices;
}

// Swapping two RGB-colors
// NO WARRANTY --- SEE STATEMENT IN TOP OF FILE (C) Ericsson AB 2005-2013. All Rights Reserved.
void swapColors(uint8_t(colors)[2][3])
{
    uint8_t temp = colors[0][R];
    colors[0][R] = colors[1][R];
    colors[1][R] = temp;

    temp = colors[0][G];
    colors[0][G] = colors[1][G];
    colors[1][G] = temp;

    temp = colors[0][B];
    colors[0][B] = colors[1][B];
    colors[1][B] = temp;
}

// During search it is not convenient to store the bits the way they are stored in the
// file format. Hence, after search, it is converted to this format.
// NO WARRANTY --- SEE STATEMENT IN TOP OF FILE (C) Ericsson AB 2005-2013. All Rights Reserved.
void stuff59bits(unsigned int thumbT59_word1, unsigned int thumbT59_word2, unsigned int * thumbT_word1, unsigned int * thumbT_word2)
{
    // Put bits in twotimer configuration for 59 (red overflows)
    //
    // Go from this bit layout:
    //
    //     |63 62 61 60 59|58 57 56 55|54 53 52 51|50 49 48 47|46 45 44 43|42 41 40 39|38 37 36 35|34 33 32|
    //     |----empty-----|---red 0---|--green 0--|--blue 0---|---red 1---|--green 1--|--blue 1---|--dist--|
    //
    //     |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00|
    //     |----------------------------------------index bits---------------------------------------------|
    //
    //
    //  To this:
    //
    //      63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
    //      -----------------------------------------------------------------------------------------------
    //     |// // //|R0a  |//|R0b  |G0         |B0         |R1         |G1         |B1          |da  |df|db|
    //      -----------------------------------------------------------------------------------------------
    //
    //     |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00|
    //     |----------------------------------------index bits---------------------------------------------|
    //
    //      63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
    //      -----------------------------------------------------------------------------------------------
    //     | base col1    | dcol 2 | base col1    | dcol 2 | base col 1   | dcol 2 | table  | table  |df|fp|
    //     | R1' (5 bits) | dR2    | G1' (5 bits) | dG2    | B1' (5 bits) | dB2    | cw 1   | cw 2   |bt|bt|
    //      ------------------------------------------------------------------------------------------------

    uint8_t R0a;
    uint8_t bit, a, b, c, d, bits;
    unsigned int word1;

    R0a = GETBITSHIGH(thumbT59_word1, 2, 58);

    // Fix middle part
    word1 = thumbT59_word1 << 1;
    // Fix R0a (top two bits of R0)
    PUTBITSHIGH(word1, R0a, 2, 60);
    // Fix db (lowest bit of d)
    PUTBITSHIGH(word1, thumbT59_word1, 1, 32);
    //
    // Make sure that red overflows:
    a = GETBITSHIGH(word1, 1, 60);
    b = GETBITSHIGH(word1, 1, 59);
    c = GETBITSHIGH(word1, 1, 57);
    d = GETBITSHIGH(word1, 1, 56);
    // The following bit abcd bit sequences should be padded with ones: 0111, 1010, 1011, 1101, 1110, 1111
    // The following logical expression checks for the presence of any of those:
    bit = (a & c) | ((!a) & b & c & d) | (a & b & (!c) & d);
    bits = 0xf * bit;
    PUTBITSHIGH(word1, bits, 3, 63);
    PUTBITSHIGH(word1, !bit, 1, 58);

    // Set diffbit
    PUTBITSHIGH(word1, 1, 1, 33);
    *thumbT_word1 = word1;
    *thumbT_word2 = thumbT59_word2;
}

// During search it is not convenient to store the bits the way they are stored in the
// file format. Hence, after search, it is converted to this format.
// NO WARRANTY --- SEE STATEMENT IN TOP OF FILE (C) Ericsson AB 2005-2013. All Rights Reserved.
void stuff58bits(unsigned int thumbH58_word1, unsigned int thumbH58_word2, unsigned int * thumbH_word1, unsigned int * thumbH_word2)
{
    // Put bits in twotimer configuration for 58 (red doesn't overflow, green does)
    //
    // Go from this bit layout:
    //
    //
    //     |63 62 61 60 59 58|57 56 55 54|53 52 51 50|49 48 47 46|45 44 43 42|41 40 39 38|37 36 35 34|33 32|
    //     |-------empty-----|---red 0---|--green 0--|--blue 0---|---red 1---|--green 1--|--blue 1---|d2 d1|
    //
    //     |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00|
    //     |---------------------------------------index bits----------------------------------------------|
    //
    //  To this:
    //
    //      63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
    //      -----------------------------------------------------------------------------------------------
    //     |//|R0         |G0      |// // //|G0|B0|//|B0b     |R1         |G1         |B0         |d2|df|d1|
    //      -----------------------------------------------------------------------------------------------
    //
    //     |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00|
    //     |---------------------------------------index bits----------------------------------------------|
    //
    //      63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
    //      -----------------------------------------------------------------------------------------------
    //     | base col1    | dcol 2 | base col1    | dcol 2 | base col 1   | dcol 2 | table  | table  |df|fp|
    //     | R1' (5 bits) | dR2    | G1' (5 bits) | dG2    | B1' (5 bits) | dB2    | cw 1   | cw 2   |bt|bt|
    //      -----------------------------------------------------------------------------------------------
    //
    //
    // Thus, what we are really doing is going from this bit layout:
    //
    //
    //     |63 62 61 60 59 58|57 56 55 54 53 52 51|50 49|48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33|32   |
    //     |-------empty-----|part0---------------|part1|part2------------------------------------------|part3|
    //
    //  To this:
    //
    //      63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
    //      --------------------------------------------------------------------------------------------------|
    //     |//|part0               |// // //|part1|//|part2                                          |df|part3|
    //      --------------------------------------------------------------------------------------------------|

    unsigned int part0, part1, part2, part3;
    uint8_t bit, a, b, c, d, bits;
    unsigned int word1 = 0;

    // move parts
    part0 = GETBITSHIGH(thumbH58_word1, 7, 57);
    part1 = GETBITSHIGH(thumbH58_word1, 2, 50);
    part2 = GETBITSHIGH(thumbH58_word1, 16, 48);
    part3 = GETBITSHIGH(thumbH58_word1, 1, 32);

    PUTBITSHIGH(word1, part0, 7, 62);
    PUTBITSHIGH(word1, part1, 2, 52);
    PUTBITSHIGH(word1, part2, 16, 49);
    PUTBITSHIGH(word1, part3, 1, 32);

    // Make sure that red does not overflow:
    bit = GETBITSHIGH(word1, 1, 62);
    PUTBITSHIGH(word1, !bit, 1, 63);

    // Make sure that green overflows:
    a = GETBITSHIGH(word1, 1, 52);
    b = GETBITSHIGH(word1, 1, 51);
    c = GETBITSHIGH(word1, 1, 49);
    d = GETBITSHIGH(word1, 1, 48);
    // The following bit abcd bit sequences should be padded with ones: 0111, 1010, 1011, 1101, 1110, 1111
    // The following logical expression checks for the presence of any of those:
    bit = (a & c) | ((!a) & b & c & d) | (a & b & (!c) & d);
    bits = 0xf * bit;
    PUTBITSHIGH(word1, bits, 3, 55);
    PUTBITSHIGH(word1, !bit, 1, 50);

    // Set diffbit
    PUTBITSHIGH(word1, 1, 1, 33);
    *thumbH_word1 = word1;
    *thumbH_word2 = thumbH58_word2;
}

// calculates quantized colors for T or H modes
void compressColor(uint8_t(current_color)[2][3], uint8_t(quantized_color)[2][3], bool t_mode)
{
    if (t_mode)
    {
        quantized_color[0][R] = CLAMP_R(15 * (current_color[0][R] + 8) / 255, 15);
        quantized_color[0][G] = CLAMP_R(15 * (current_color[0][G] + 8) / 255, 15);
        quantized_color[0][B] = CLAMP_R(15 * (current_color[0][B] + 8) / 255, 15);
    }
    else // clamped to [1,14] to get a wider range
    {
        quantized_color[0][R] = CLAMP(1, 15 * (current_color[0][R] + 8) / 255, 14);
        quantized_color[0][G] = CLAMP(1, 15 * (current_color[0][G] + 8) / 255, 14);
        quantized_color[0][B] = CLAMP(1, 15 * (current_color[0][B] + 8) / 255, 14);
    }

    // clamped to [1,14] to get a wider range
    quantized_color[1][R] = CLAMP(1, 15 * (current_color[1][R] + 8) / 255, 14);
    quantized_color[1][G] = CLAMP(1, 15 * (current_color[1][G] + 8) / 255, 14);
    quantized_color[1][B] = CLAMP(1, 15 * (current_color[1][B] + 8) / 255, 14);
}


// calculates errors for T or H modes
#ifdef __AVX2__
// Vectorized ver
uint32_t calculateErrorTH(bool t_mode, uint8_t(colorsRGB444)[2][3], uint8_t * distance, uint32_t *pixel_indices, uint8_t start_distance, __m128i r8, __m128i g8, __m128i b8)
#else
// Scalar ver
uint32_t calculateErrorTH(bool t_mode, uint8_t* srcimg, uint8_t(colorsRGB444)[2][3], uint8_t* distance, uint32_t* pixel_indices, uint8_t start_distance)
#endif
{
    uint32_t block_error = 0,
        best_block_error = MAXIMUM_ERROR;

    uint32_t pixel_colors;
    uint8_t possible_colors[4][3];
    uint8_t colors[2][3];

    decompressColor(colorsRGB444, colors);

#ifdef __AVX2__
    __m128i reverse_mask = _mm_set_epi8(0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15);
#endif

    // test distances
    uint8_t d;
    for(d = start_distance; d < 8; ++d)
    {
        if (d >= 2 && *distance == d - 2) break;
        block_error = 0;
        pixel_colors = 0;

        if (t_mode)
            calculatePaintColors59T(d, colors, possible_colors);
        else
            calculatePaintColors58H(d, colors, possible_colors);

#ifdef __AVX2__
        // RGB ordering
        __m128i b8_reversed = _mm_shuffle_epi8(b8, reverse_mask);
        __m128i g8_reversed = _mm_shuffle_epi8(g8, reverse_mask);
        __m128i r8_reversed = _mm_shuffle_epi8(r8, reverse_mask);

        // extends 3x128 bits RGB into 3x256 bits RGB for error comparisons
        /*static const */__m128i zero = _mm_setzero_si128();
        __m128i b8_lo = _mm_unpacklo_epi8(b8_reversed, zero);
        __m128i g8_lo = _mm_unpacklo_epi8(g8_reversed, zero);
        __m128i r8_lo = _mm_unpacklo_epi8(r8_reversed, zero);
        __m128i b8_hi = _mm_unpackhi_epi8(b8_reversed, zero);
        __m128i g8_hi = _mm_unpackhi_epi8(g8_reversed, zero);
        __m128i r8_hi = _mm_unpackhi_epi8(r8_reversed, zero);

        __m256i b8_256i = _mm256_set_m128i(b8_hi, b8_lo);
        __m256i g8_256i = _mm256_set_m128i(g8_hi, g8_lo);
        __m256i r8_256i = _mm256_set_m128i(r8_hi, r8_lo);

        // caculates differences between the pixel colrs and the palette colors
        __m256i diffb = _mm256_abs_epi16(_mm256_sub_epi16(b8_256i, _mm256_set1_epi16(possible_colors[0][B])));
        __m256i diffg = _mm256_abs_epi16(_mm256_sub_epi16(g8_256i, _mm256_set1_epi16(possible_colors[0][G])));
        __m256i diffr = _mm256_abs_epi16(_mm256_sub_epi16(r8_256i, _mm256_set1_epi16(possible_colors[0][R])));

        // luma-based error calculations
        /*static const */__m256i b_weight = _mm256_set1_epi16(14);
        /*static const */__m256i g_weight = _mm256_set1_epi16(76);
        /*static const */__m256i r_weight = _mm256_set1_epi16(38);

        diffb = _mm256_mullo_epi16(diffb, b_weight);
        diffg = _mm256_mullo_epi16(diffg, g_weight);
        diffr = _mm256_mullo_epi16(diffr, r_weight);

        // obtains the error with the current palette color
        __m256i lowest_pixel_error = _mm256_add_epi16(_mm256_add_epi16(diffb, diffg), diffr);

        // error calucations with the remaining three palette colors
        static const uint32_t masks[4] = {0, 0x55555555, 0xAAAAAAAA, 0xFFFFFFFF};
        uint8_t c;
        for(c = 1; c < 4; c++)
        {
            __m256i diffb = _mm256_abs_epi16(_mm256_sub_epi16(b8_256i, _mm256_set1_epi16(possible_colors[c][B])));
            __m256i diffg = _mm256_abs_epi16(_mm256_sub_epi16(g8_256i, _mm256_set1_epi16(possible_colors[c][G])));
            __m256i diffr = _mm256_abs_epi16(_mm256_sub_epi16(r8_256i, _mm256_set1_epi16(possible_colors[c][R])));

            diffb = _mm256_mullo_epi16(diffb, b_weight);
            diffg = _mm256_mullo_epi16(diffg, g_weight);
            diffr = _mm256_mullo_epi16(diffr, r_weight);

            // error comparison with the previous best color
            __m256i pixel_errors = _mm256_add_epi16(_mm256_add_epi16(diffb, diffg), diffr);
            __m256i min_error = _mm256_min_epu16(lowest_pixel_error, pixel_errors);
            __m256i cmp_result = _mm256_cmpeq_epi16(pixel_errors, min_error);
            lowest_pixel_error = min_error;

            // update pixel colors
            uint32_t updated_pixel_colors = _mm256_movemask_epi8(cmp_result);
            uint32_t previous_pixel_colors = pixel_colors & ~updated_pixel_colors;
            uint32_t masked_pixel_colors = masks[c] & updated_pixel_colors;
            pixel_colors = previous_pixel_colors | masked_pixel_colors;
        }

        // accumulate the block error
        alignas(32) uint16_t pixel_error16[16] = { 0, };
        _mm256_storeu_si256((__m256i*)pixel_error16, lowest_pixel_error);
        uint8_t p;
        for(p = 0; p < 16; p++)
        {
            block_error += (int)(pixel_error16[p]) * pixel_error16[p];
        }
#else //__AVX2__
        // Loop block
        size_t y;
        for(y = 0; y < 4; ++y)
        {
            size_t x;
            for(x = 0; x < 4; ++x)
            {
                uint32_t best_pixel_error = MAXIMUM_ERROR;
                uint8_t c;
                pixel_colors <<= 2; // Make room for next value

                // Loop possible block colors
                for(c = 0; c < 4; ++c)
                {
                    int diff[3];
                    diff[R] = srcimg[4 * (x * 4 + y) + R] - possible_colors[c][R];
                    diff[G] = srcimg[4 * (x * 4 + y) + G] - possible_colors[c][G];
                    diff[B] = srcimg[4 * (x * 4 + y) + B] - possible_colors[c][B];

                    uint32_t pixel_error = SQUARE(38 * abs(diff[R]) +
                        76 * abs(diff[G]) +
                        14 * abs(diff[B]));

                    // Choose best error
                    if (pixel_error < best_pixel_error)
                    {
                        best_pixel_error = pixel_error;
                        pixel_colors ^= (pixel_colors & 3); // Reset the two first bits
                        pixel_colors |= c;
                    }
                }
                block_error += best_pixel_error;
            }
        }
#endif

        if (block_error < best_block_error)
        {
            best_block_error = block_error;
            *distance = d;
            *pixel_indices = pixel_colors;
        }
    }

    return best_block_error;
}

// slightly faster than std:sort
void static_insertion_sort(uint8_t* arr1, uint8_t *arr2)
{
    uint8_t i;
    for(i = 1; i < 16; ++i)
    {
        uint8_t value = arr1[i];
        uint8_t hole = i;

        for(; hole > 0 && value < arr1[hole - 1]; --hole)
        {
            arr1[hole] = arr1[hole - 1];
            arr2[hole] = arr2[hole - 1];
        }
        arr1[hole] = value;
        arr2[hole] = i;
    }
}

// main T-/H-mode compression function
#ifdef __AVX2__
uint32_t compressBlockTH
(uint8_t* src, __m128i luma8, uint32_t * compressed1, uint32_t * compressed2, bool * t_mode,
    __m128i r8, __m128i g8, __m128i b8)
#else
uint32_t  compressBlockTH
(uint8_t *src, uint8_t* luma, uint32_t *compressed1, uint32_t * compressed2, bool * t_mode)

#endif
{

#ifdef __AVX2__
    alignas(8) uint8_t luma[16] = { 0, };
    _mm_storeu_si128((__m128i*)luma, luma8);
#endif

    uint8_t pixel_idx[16] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

    // 1) sorts the pairs of (luma, pix_idx)
    static_insertion_sort(luma, pixel_idx);

    // 2) finds the min (left+right)
    uint8_t min_sum_range_idx = 0;
    uint16_t min_sum_range_value;
    uint16_t sum;
    static const uint8_t diff_bonus[15] = {8, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 8};
    const int16_t temp = luma[15] - luma[0];
    uint8_t i;

    min_sum_range_value = luma[15] - luma[1] + diff_bonus[0];
    for(i = 1; i < 14; i++)
    {
        sum = temp - luma[i+1] + luma[i] + diff_bonus[i];
        if (min_sum_range_value > sum)
        {
            min_sum_range_value = sum;
            min_sum_range_idx = i;
        }
    }

    sum = luma[14] - luma[0] + diff_bonus[14];
    if (min_sum_range_value > sum)
    {
        min_sum_range_value = sum;
        min_sum_range_idx = 14;
    }
    uint8_t left_range, right_range;

    left_range = luma[min_sum_range_idx] - luma[0];
    right_range = luma[15] - luma[min_sum_range_idx + 1];

    // 3) sets a proper mode
    bool sw = false; //swap
    if (left_range >= right_range)
    {
        if (left_range >= right_range * 2)
        {
            sw = true;
            *t_mode = true;
        }
    }
    else
    {
        if (left_range * 2 <= right_range)
            *t_mode = true;
    }
    // 4) calculates the two base colors
    uint8_t range_idx[4] = { pixel_idx[0], pixel_idx[min_sum_range_idx], pixel_idx[min_sum_range_idx + 1], pixel_idx[15] };

    uint16_t r[4], g[4], b[4];
    for(i = 0; i < 4; ++i)
    {
        uint8_t idx = range_idx[i] * 4;
        b[i] = src[idx];
        g[i] = src[idx + 1];
        r[i] = src[idx + 2];
    }

    uint8_t mid_rgb[2][3];
    if (sw)
    {
        mid_rgb[1][B] = (b[0] + b[1]) / 2;
        mid_rgb[1][G] = (g[0] + g[1]) / 2;
        mid_rgb[1][R] = (r[0] + r[1]) / 2;

        uint16_t sum_rgb[3] = { 0, 0, 0 };
        for(i = min_sum_range_idx + 1; i < 16; i++)
        {
            uint8_t idx = pixel_idx[i] * 4;
            sum_rgb[B] += src[idx];
            sum_rgb[G] += src[idx + 1];
            sum_rgb[R] += src[idx + 2];
        }
        const uint8_t temp = 15 - min_sum_range_idx;
        mid_rgb[0][B] = sum_rgb[B] / temp;
        mid_rgb[0][G] = sum_rgb[G] / temp;
        mid_rgb[0][R] = sum_rgb[R] / temp;
    }
    else
    {
        mid_rgb[0][B] = (b[0] + b[1]) / 2;
        mid_rgb[0][G] = (g[0] + g[1]) / 2;
        mid_rgb[0][R] = (r[0] + r[1]) / 2;
        if (*t_mode)
        {
            uint16_t sum_rgb[3] = { 0, 0, 0 };
            for(i = min_sum_range_idx + 1; i < 16; i++)
            {
                uint8_t idx = pixel_idx[i] * 4;
                sum_rgb[B] += src[idx];
                sum_rgb[G] += src[idx + 1];
                sum_rgb[R] += src[idx + 2];
            }
            const uint8_t temp = 15 - min_sum_range_idx;
            mid_rgb[1][B] = sum_rgb[B] / temp;
            mid_rgb[1][G] = sum_rgb[G] / temp;
            mid_rgb[1][R] = sum_rgb[R] / temp;
        }
        else
        {
            mid_rgb[1][B] = (b[2] + b[3]) / 2;
            mid_rgb[1][G] = (g[2] + g[3]) / 2;
            mid_rgb[1][R] = (r[2] + r[3]) / 2;
        }
    }

    // 5) sets the start distance index
    uint32_t start_distance_candidate;
    uint32_t avg_dist;
    if (*t_mode)
    {
        if (sw) avg_dist = (b[1] - b[0] + g[1] - g[0] + r[1] - r[0]) / 6;
        else avg_dist = (b[3] - b[2] + g[3] - g[2] + r[3] - r[2]) / 6;
    }
    else
        avg_dist = (b[1] - b[0] + g[1] - g[0] + r[1] - r[0] + b[3] - b[2] + g[3] - g[2] + r[3] - r[2]) / 12;

    if (avg_dist <= 16) start_distance_candidate = 0;
    else if (avg_dist <= 23) start_distance_candidate = 1;
    else if (avg_dist <= 32) start_distance_candidate = 2;
    else if (avg_dist <= 41) start_distance_candidate = 3;
    else start_distance_candidate = 4;

    uint32_t best_error = MAXIMUM_ERROR;
    uint32_t best_pixel_indices;
    uint8_t best_distance = 10;
    uint8_t colorsRGB444[2][3];
    compressColor(mid_rgb, colorsRGB444, *t_mode);
    uint32_t comp1 = 0;

    // 6) finds the best candidate with the lowest error
#ifdef __AVX2__
    // Vectorized ver
    best_error = calculateErrorTH(*t_mode, colorsRGB444, &best_distance, &best_pixel_indices, start_distance_candidate, r8, g8, b8);
#else
    // Scalar ver
    best_error = calculateErrorTH(*t_mode, src, colorsRGB444, &best_distance, &best_pixel_indices, start_distance_candidate);
#endif

    // 7) outputs the final T or H block
    if (*t_mode)
    {
        // Put the compress params into the compression block
        PUTBITSHIGH(comp1, colorsRGB444[0][R], 4, 58);
        PUTBITSHIGH(comp1, colorsRGB444[0][G], 4, 54);
        PUTBITSHIGH(comp1, colorsRGB444[0][B], 4, 50);
        PUTBITSHIGH(comp1, colorsRGB444[1][R], 4, 46);
        PUTBITSHIGH(comp1, colorsRGB444[1][G], 4, 42);
        PUTBITSHIGH(comp1, colorsRGB444[1][B], 4, 38);
        PUTBITSHIGH(comp1, best_distance, 3, 34);
    }
    else
    {
        int best_colorsRGB444_packed[2];
        best_colorsRGB444_packed[0] = (colorsRGB444[0][R] << 8) + (colorsRGB444[0][G] << 4) + colorsRGB444[0][B];
        best_colorsRGB444_packed[1] = (colorsRGB444[1][R] << 8) + (colorsRGB444[1][G] << 4) + colorsRGB444[1][B];
        if ((best_colorsRGB444_packed[0] >= best_colorsRGB444_packed[1]) ^ ((best_distance & 1) == 1))
        {
            swapColors(colorsRGB444);
            // Reshuffle pixel indices to to exchange C1 with C3, and C2 with C4
            best_pixel_indices = (0x55555555 & best_pixel_indices) | (0xaaaaaaaa & (~best_pixel_indices));
        }

        // Put the compress params into the compression block
        PUTBITSHIGH(comp1, colorsRGB444[0][R], 4, 57);
        PUTBITSHIGH(comp1, colorsRGB444[0][G], 4, 53);
        PUTBITSHIGH(comp1, colorsRGB444[0][B], 4, 49);
        PUTBITSHIGH(comp1, colorsRGB444[1][R], 4, 45);
        PUTBITSHIGH(comp1, colorsRGB444[1][G], 4, 41);
        PUTBITSHIGH(comp1, colorsRGB444[1][B], 4, 37);
        PUTBITSHIGH(comp1, (best_distance >> 1), 2, 33);
    }
    *compressed1 = comp1;

    best_pixel_indices = indexConversion(best_pixel_indices);
    *compressed2 = 0;
    PUTBITS(*compressed2, best_pixel_indices, 32, 31);
    return best_error;
}
#endif

static etcpak_force_inline uint64_t ProcessRGB_ETC2( const uint8_t* src )
{
#ifdef __AVX2__
    uint64_t d = CheckSolid_AVX2( src );
    if( d != 0 ) return d;

    Plane plane = Planar_AVX2( src );

#ifdef QUICK_ETC2
    if (plane.planar_mode_expected) return plane.plane;
#endif

    alignas(32) v4i a[8];

    __m128i err0 = PrepareAverages_AVX2_256( a, plane.sum4 );

    // Get index of minimum error (err0)
    __m128i err1 = _mm_shuffle_epi32(err0, _MM_SHUFFLE(2, 3, 0, 1));
    __m128i errMin0 = _mm_min_epu32(err0, err1);

    __m128i errMin1 = _mm_shuffle_epi32(errMin0, _MM_SHUFFLE(1, 0, 3, 2));
    __m128i errMin2 = _mm_min_epu32(errMin1, errMin0);

    __m128i errMask = _mm_cmpeq_epi32(errMin2, err0);

    uint32_t mask = _mm_movemask_epi8(errMask);

    size_t idx = _bit_scan_forward(mask) >> 2;

    d = EncodeAverages_AVX2( a, idx );

    alignas(32) uint32_t terr[2][8] = { 0 };
    alignas(32) uint32_t tsel[8];

    if ((idx == 0) || (idx == 2))
    {
        FindBestFit_4x2_AVX2( terr, tsel, a, idx * 2, src );
    }
    else
    {
        FindBestFit_2x4_AVX2( terr, tsel, a, idx * 2, src );
    }

#ifdef QUICK_ETC2_TH
    Plane planeTH;
    if (plane.th_mode_expected)
    {
        uint64_t result = 0;
        uint64_t error = 0;
        uint32_t compressed[4] = { 0, 0, 0, 0};
        bool t_mode = false;

        error = compressBlockTH((uint8_t*)src, plane.luma8, &compressed[0], &compressed[1], &t_mode, plane.r8, plane.g8, plane.b8);
        if (t_mode)
            stuff59bits(compressed[0], compressed[1], &compressed[2], &compressed[3]);
        else
            stuff58bits(compressed[0], compressed[1], &compressed[2], &compressed[3]);

        result = (uint32_t)_bswap(compressed[2]);
        result |= ((uint64_t)_bswap(compressed[3])) << 32;

        planeTH.plane = result;
        planeTH.error = error;
    }
    else
    {
        planeTH.plane = 0;
        planeTH.error = MAXIMUM_ERROR;
    }
#endif

#ifdef QUICK_ETC2
#ifdef QUICK_ETC2_TH
    return EncodeSelectors_AVX2_2(d, terr, tsel, (idx % 2) == 1, planeTH.plane, planeTH.error);
#else
    return EncodeSelectors_AVX2(d, terr, tsel, (idx % 2) == 1);
#endif
#else
    return EncodeSelectors_AVX2( d, terr, tsel, (idx % 2) == 1, plane.plane, plane.error );
#endif
#else
    uint64_t d = CheckSolid( src );
    if (d != 0) return d;

#ifdef QUICK_ETC2
    uint8_t luma[16];
    bool th_mode_expected = false;
    PairUI64 result = Planar( src, luma, &th_mode_expected );
    if (result.second == 0)
    {
        return result.first;
    }
#else
#ifdef __ARM_NEON
    PairUI64 result = Planar_NEON( src );
#else
    PairUI64 result = Planar( src );
#endif
#endif


#ifdef QUICK_ETC2_TH
    uint64_t plane = 0;
    uint64_t error = MAXIMUM_ERROR;
    if (th_mode_expected)
    {
        uint64_t result = 0;
        uint32_t compressed[4] = { 0, 0, 0, 0};
        bool t_mode = false;
        error = compressBlockTH((uint8_t*)src, luma, &compressed[0], &compressed[1], &t_mode);

        if (t_mode)
            stuff59bits(compressed[0], compressed[1], &compressed[2], &compressed[3]);
        else
            stuff58bits(compressed[0], compressed[1], &compressed[2], &compressed[3]);

        result = (uint32_t)_bswap(compressed[2]);
        result |= ((uint64_t)_bswap(compressed[3])) << 32;

        plane = result;
    }
    result.first = plane;
    result.second = error;
#endif

    v4i a[8];
    unsigned int err[4] = { 0 };
    PrepareAverages( a, src, err );
    size_t idx = GetLeastError32( err, 4 );
    EncodeAverages( &d, a, idx );

#if ( defined __SSE4_1__ || defined __ARM_NEON ) && !defined REFERENCE_IMPLEMENTATION
    uint32_t terr[2][8] = { 0 };
#else
    uint64_t terr[2][8] = { 0 };
#endif
    uint16_t tsel[16][8];
    const uint32_t * id = g_id[idx];
    FindBestFit( terr, tsel, a, id, src );

    return EncodeSelectors2( d, terr, tsel, id, result.first, result.second );
#endif
}

#ifdef __SSE4_1__

#define WIDEN_DEF(n, lohi, s1, s2) \
   static etcpak_force_inline __m128i Widen ## n( const __m128i src ) \
   { \
      __m128i tmp = _mm_shuffle ## lohi ## _epi16( src, _MM_SHUFFLE(s1, s1, s1, s1) ); \
      return _mm_shuffle_epi32( tmp, _MM_SHUFFLE(s2, s2, s2, s2) ); \
   }

WIDEN_DEF(0, lo, 0, 0)
WIDEN_DEF(1, lo, 1, 0)
WIDEN_DEF(2, lo, 2, 0)
WIDEN_DEF(3, lo, 3, 0)
WIDEN_DEF(4, hi, 0, 2)
WIDEN_DEF(5, hi, 1, 2)
WIDEN_DEF(6, hi, 2, 2)
WIDEN_DEF(7, hi, 3, 2)

#define Widen(n, src) Widen ## n(src)

static etcpak_force_inline int GetMulSel( int sel )
{
    switch( sel )
    {
      case 0: default:                                    return 0;
      case 1: case 2: case 3:                             return 1;
      case 4:                                             return 2;
      case 5: case 6: case 7:                             return 3;
      case 8: case 9: case 10: case 11: case 12: case 13: return 4;
      case 14: case 15:                                   return 5;
    }
}

#endif

#ifdef __ARM_NEON

static constexpr etcpak_force_inline int GetMulSel(int sel)
{
    return ( sel < 1 ) ? 0 : ( sel < 4 ) ? 1 : ( sel < 5 ) ? 2 : ( sel < 8 ) ? 3 : ( sel < 14 ) ? 4 : 5;
}

static constexpr int ClampConstant( int x, int min, int max )
{
    return x < min ? min : x > max ? max : x;
}

template <int Index>
etcpak_force_inline static uint16x8_t ErrorProbe_EAC_NEON( uint8x8_t recVal, uint8x16_t alphaBlock )
{
    uint8x8_t srcValWide;
#ifndef __aarch64__
    if( Index < 8 )
        srcValWide = vdup_lane_u8( vget_low_u8( alphaBlock ), ClampConstant( Index, 0, 8 ) );
    else
        srcValWide = vdup_lane_u8( vget_high_u8( alphaBlock ), ClampConstant( Index - 8, 0, 8 ) );
#else
    srcValWide = vdup_laneq_u8( alphaBlock, Index );
#endif

    uint8x8_t deltaVal = vabd_u8( srcValWide, recVal );
    return vmull_u8( deltaVal, deltaVal );
}

etcpak_force_inline static uint16_t MinError_EAC_NEON( uint16x8_t errProbe )
{
#ifndef __aarch64__
    uint16x4_t tmpErr = vpmin_u16( vget_low_u16( errProbe ), vget_high_u16( errProbe ) );
    tmpErr = vpmin_u16( tmpErr, tmpErr );
    return vpmin_u16( tmpErr, tmpErr )[0];
#else
    return vminvq_u16( errProbe );
#endif
}

template <int Index>
etcpak_force_inline static uint64_t MinErrorIndex_EAC_NEON( uint8x8_t recVal, uint8x16_t alphaBlock )
{
    uint16x8_t errProbe = ErrorProbe_EAC_NEON<Index>( recVal, alphaBlock );
    uint16x8_t minErrMask = vceqq_u16( errProbe, vdupq_n_u16( MinError_EAC_NEON( errProbe ) ) );
    uint64_t idx = __builtin_ctzll( vget_lane_u64( vreinterpret_u64_u8( vqmovn_u16( minErrMask ) ), 0 ) );
    idx >>= 3;
    idx <<= 45 - Index * 3;

    return idx;
}

template <int Index>
etcpak_force_inline static int16x8_t WidenMultiplier_EAC_NEON( int16x8_t multipliers )
{
    constexpr int Lane = GetMulSel( Index );
#ifndef __aarch64__
    if( Lane < 4 )
        return vdupq_lane_s16( vget_low_s16( multipliers ), ClampConstant( Lane, 0, 4 ) );
    else
        return vdupq_lane_s16( vget_high_s16( multipliers ), ClampConstant( Lane - 4, 0, 4 ) );
#else
    return vdupq_laneq_s16( multipliers, Lane );
#endif
}

#endif

static etcpak_force_inline uint64_t ProcessAlpha_ETC2( const uint8_t* src )
{
#if defined(__SSE4_1__) && defined(_64_BIT_ARCH) // _mm_cvtsi128_si64() is not available on 32-bit architectures
    // Check solid
    __m128i s = _mm_loadu_si128( (__m128i*)src );
    __m128i solidCmp = _mm_set1_epi8( src[0] );
    __m128i cmpRes = _mm_cmpeq_epi8( s, solidCmp );
    if( _mm_testc_si128( cmpRes, _mm_set1_epi32( -1 ) ) )
    {
        return src[0];
    }

    // Calculate min, max
    __m128i s1 = _mm_shuffle_epi32( s, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i max1 = _mm_max_epu8( s, s1 );
    __m128i min1 = _mm_min_epu8( s, s1 );
    __m128i smax2 = _mm_shuffle_epi32( max1, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i smin2 = _mm_shuffle_epi32( min1, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i max2 = _mm_max_epu8( max1, smax2 );
    __m128i min2 = _mm_min_epu8( min1, smin2 );
    __m128i smax3 = _mm_alignr_epi8( max2, max2, 2 );
    __m128i smin3 = _mm_alignr_epi8( min2, min2, 2 );
    __m128i max3 = _mm_max_epu8( max2, smax3 );
    __m128i min3 = _mm_min_epu8( min2, smin3 );
    __m128i smax4 = _mm_alignr_epi8( max3, max3, 1 );
    __m128i smin4 = _mm_alignr_epi8( min3, min3, 1 );
    __m128i max = _mm_max_epu8( max3, smax4 );
    __m128i min = _mm_min_epu8( min3, smin4 );
    __m128i max16 = _mm_unpacklo_epi8( max, _mm_setzero_si128() );
    __m128i min16 = _mm_unpacklo_epi8( min, _mm_setzero_si128() );

    // src range, mid
    __m128i srcRange = _mm_sub_epi16( max16, min16 );
    __m128i srcRangeHalf = _mm_srli_epi16( srcRange, 1 );
    __m128i srcMid = _mm_add_epi16( min16, srcRangeHalf );

    // multiplier
    __m128i mul1 = _mm_mulhi_epi16( srcRange, g_alphaRange_SIMD );
    __m128i mul = _mm_add_epi16( mul1, _mm_set1_epi16( 1 ) );

    // wide source
    __m128i s16_1 = _mm_shuffle_epi32( s, _MM_SHUFFLE( 3, 2, 3, 2 ) );
    __m128i s16[2] = { _mm_unpacklo_epi8( s, _mm_setzero_si128() ), _mm_unpacklo_epi8( s16_1, _mm_setzero_si128() ) };

    __m128i sr[16] = {
        Widen(0, s16[0] ),
        Widen(1, s16[0] ),
        Widen(2, s16[0] ),
        Widen(3, s16[0] ),
        Widen(4, s16[0] ),
        Widen(5, s16[0] ),
        Widen(6, s16[0] ),
        Widen(7, s16[0] ),
        Widen(0, s16[1] ),
        Widen(1, s16[1] ),
        Widen(2, s16[1] ),
        Widen(3, s16[1] ),
        Widen(4, s16[1] ),
        Widen(5, s16[1] ),
        Widen(6, s16[1] ),
        Widen(7, s16[1] )
    };

#ifdef __AVX2__
    __m256i srcRangeWide = _mm256_broadcastsi128_si256( srcRange );
    __m256i srcMidWide = _mm256_broadcastsi128_si256( srcMid );

    __m256i mulWide1 = _mm256_mulhi_epi16( srcRangeWide, g_alphaRange_AVX );
    __m256i mulWide = _mm256_add_epi16( mulWide1, _mm256_set1_epi16( 1 ) );

    __m256i modMul[8] = {
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[0] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[0] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[1] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[1] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[2] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[2] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[3] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[3] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[4] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[4] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[5] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[5] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[6] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[6] ) ) ), _mm256_setzero_si256() ),
        _mm256_unpacklo_epi8( _mm256_packus_epi16( _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[7] ) ), _mm256_add_epi16( srcMidWide, _mm256_mullo_epi16( mulWide, g_alpha_AVX[7] ) ) ), _mm256_setzero_si256() ),
    };

    // find selector
    __m256i mulErr = _mm256_setzero_si256();
    int j;
    for( j=0; j<16; j++ )
    {
        __m256i s16Wide = _mm256_broadcastsi128_si256( sr[j] );
        __m256i err1, err2;

        err1 = _mm256_sub_epi16( s16Wide, modMul[0] );
        __m256i localErr = _mm256_mullo_epi16( err1, err1 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[1] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[2] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[3] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[4] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[5] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[6] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        err1 = _mm256_sub_epi16( s16Wide, modMul[7] );
        err2 = _mm256_mullo_epi16( err1, err1 );
        localErr = _mm256_min_epu16( localErr, err2 );

        // note that this can overflow, but since we're looking for the smallest error, it shouldn't matter
        mulErr = _mm256_adds_epu16( mulErr, localErr );
    }
    uint64_t minPos1 = _mm_cvtsi128_si64( _mm_minpos_epu16( _mm256_castsi256_si128( mulErr ) ) );
    uint64_t minPos2 = _mm_cvtsi128_si64( _mm_minpos_epu16( _mm256_extracti128_si256( mulErr, 1 ) ) );
    int sel = ( ( minPos1 & 0xFFFF ) < ( minPos2 & 0xFFFF ) ) ? ( minPos1 >> 16 ) : ( 8 + ( minPos2 >> 16 ) );

    __m128i recVal16;
    switch( sel )
    {
    case 0:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(0, mul ), g_alpha_SIMD[0] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(0, mul ), g_alpha_SIMD[0] ) ) ), _mm_setzero_si128() );
        break;
    case 1:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[1] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[1] ) ) ), _mm_setzero_si128() );
        break;
    case 2:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[2] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[2] ) ) ), _mm_setzero_si128() );
        break;
    case 3:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[3] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[3] ) ) ), _mm_setzero_si128() );
        break;
    case 4:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(2, mul ), g_alpha_SIMD[4] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(2, mul ), g_alpha_SIMD[4] ) ) ), _mm_setzero_si128() );
        break;
    case 5:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[5] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[5] ) ) ), _mm_setzero_si128() );
        break;
    case 6:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[6] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[6] ) ) ), _mm_setzero_si128() );
        break;
    case 7:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[7] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[7] ) ) ), _mm_setzero_si128() );
        break;
    case 8:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[8] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[8] ) ) ), _mm_setzero_si128() );
        break;
    case 9:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[9] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[9] ) ) ), _mm_setzero_si128() );
        break;
    case 10:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[10] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[10] ) ) ), _mm_setzero_si128() );
        break;
    case 11:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[11] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[11] ) ) ), _mm_setzero_si128() );
        break;
    case 12:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[12] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[12] ) ) ), _mm_setzero_si128() );
        break;
    case 13:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[13] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[13] ) ) ), _mm_setzero_si128() );
        break;
    case 14:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[14] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[14] ) ) ), _mm_setzero_si128() );
        break;
    case 15:
        recVal16 = _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[15] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[15] ) ) ), _mm_setzero_si128() );
        break;
    default:
        assert( false );
        break;
    }
#else
    // wide multiplier
    __m128i rangeMul[16] = {
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(0, mul ), g_alpha_SIMD[0] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(0, mul ), g_alpha_SIMD[0] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[1] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[1] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[2] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[2] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[3] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(1, mul ), g_alpha_SIMD[3] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(2, mul ), g_alpha_SIMD[4] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(2, mul ), g_alpha_SIMD[4] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[5] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[5] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[6] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[6] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[7] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(3, mul ), g_alpha_SIMD[7] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[8] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[8] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[9] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[9] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[10] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[10] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[11] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[11] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[12] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[12] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[13] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(4, mul ), g_alpha_SIMD[13] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[14] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[14] ) ) ), _mm_setzero_si128() ),
        _mm_unpacklo_epi8( _mm_packus_epi16( _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[15] ) ), _mm_add_epi16( srcMid, _mm_mullo_epi16( Widen(5, mul ), g_alpha_SIMD[15] ) ) ), _mm_setzero_si128() )
    };

    // find selector
    int err = MAXINT;
    int sel;
    int r;
    for( r=0; r<16; r++ )
    {
        __m128i err1, err2, minerr;
        __m128i recVal16 = rangeMul[r];
        int rangeErr;

        err1 = _mm_sub_epi16( sr[0], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr = _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[1], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[2], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[3], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[4], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[5], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[6], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[7], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[8], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[9], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[10], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[11], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[12], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[13], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[14], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        err1 = _mm_sub_epi16( sr[15], recVal16 );
        err2 = _mm_mullo_epi16( err1, err1 );
        minerr = _mm_minpos_epu16( err2 );
        rangeErr += _mm_cvtsi128_si64( minerr ) & 0xFFFF;

        if( rangeErr < err )
        {
            err = rangeErr;
            sel = r;
            if( err == 0 ) break;
        }
    }

    __m128i recVal16 = rangeMul[sel];
#endif

    // find indices
    __m128i err1, err2, minerr;
    uint64_t idx = 0, tmp;

    err1 = _mm_sub_epi16( sr[0], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 15*3;

    err1 = _mm_sub_epi16( sr[1], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 14*3;

    err1 = _mm_sub_epi16( sr[2], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 13*3;

    err1 = _mm_sub_epi16( sr[3], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 12*3;

    err1 = _mm_sub_epi16( sr[4], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 11*3;

    err1 = _mm_sub_epi16( sr[5], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 10*3;

    err1 = _mm_sub_epi16( sr[6], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 9*3;

    err1 = _mm_sub_epi16( sr[7], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 8*3;

    err1 = _mm_sub_epi16( sr[8], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 7*3;

    err1 = _mm_sub_epi16( sr[9], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 6*3;

    err1 = _mm_sub_epi16( sr[10], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 5*3;

    err1 = _mm_sub_epi16( sr[11], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 4*3;

    err1 = _mm_sub_epi16( sr[12], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 3*3;

    err1 = _mm_sub_epi16( sr[13], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 2*3;

    err1 = _mm_sub_epi16( sr[14], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 1*3;

    err1 = _mm_sub_epi16( sr[15], recVal16 );
    err2 = _mm_mullo_epi16( err1, err1 );
    minerr = _mm_minpos_epu16( err2 );
    tmp = _mm_cvtsi128_si64( minerr );
    idx |= ( tmp >> 16 ) << 0*3;

    uint16_t rm[8];
    _mm_storeu_si128( (__m128i*)rm, mul );
    uint16_t sm = _mm_cvtsi128_si64( srcMid );

    uint64_t d = ( ( (uint64_t)sm ) << 56 ) |
        ( ( (uint64_t)rm[GetMulSel( sel )] ) << 52 ) |
        ( ( (uint64_t)sel ) << 48 ) |
        idx;

    return _bswap64( d );
#elif defined __ARM_NEON

    int16x8_t srcMidWide, multipliers;
    int srcMid;
    uint8x16_t srcAlphaBlock = vld1q_u8( src );
    {
        uint8_t ref = src[0];
        uint8x16_t a0 = vdupq_n_u8( ref );
        uint8x16_t r = vceqq_u8( srcAlphaBlock, a0 );
        int64x2_t m = vreinterpretq_s64_u8( r );
        if( m[0] == -1 && m[1] == -1 )
            return ref;

        // srcRange
#ifdef __aarch64__
        uint8_t min = vminvq_u8( srcAlphaBlock );
        uint8_t max = vmaxvq_u8( srcAlphaBlock );
        uint8_t srcRange = max - min;
        multipliers = vqaddq_s16( vshrq_n_s16( vqdmulhq_n_s16( g_alphaRange_NEON, srcRange ), 1 ), vdupq_n_s16( 1 ) );
        srcMid = min + srcRange / 2;
        srcMidWide = vdupq_n_s16( srcMid );
#else
        uint8x8_t vmin = vpmin_u8( vget_low_u8( srcAlphaBlock ), vget_high_u8( srcAlphaBlock ) );
        vmin = vpmin_u8( vmin, vmin );
        vmin = vpmin_u8( vmin, vmin );
        vmin = vpmin_u8( vmin, vmin );
        uint8x8_t vmax = vpmax_u8( vget_low_u8( srcAlphaBlock ), vget_high_u8( srcAlphaBlock ) );
        vmax = vpmax_u8( vmax, vmax );
        vmax = vpmax_u8( vmax, vmax );
        vmax = vpmax_u8( vmax, vmax );

        int16x8_t srcRangeWide = vreinterpretq_s16_u16( vsubl_u8( vmax, vmin ) );
        multipliers = vqaddq_s16( vshrq_n_s16( vqdmulhq_s16( g_alphaRange_NEON, srcRangeWide ), 1 ), vdupq_n_s16( 1 ) );
        srcMidWide = vsraq_n_s16( vreinterpretq_s16_u16(vmovl_u8(vmin)), srcRangeWide, 1);
        srcMid = vgetq_lane_s16( srcMidWide, 0 );
#endif
    }

    // calculate reconstructed values
#define EAC_APPLY_16X( m ) m( 0 ) m( 1 ) m( 2 ) m( 3 ) m( 4 ) m( 5 ) m( 6 ) m( 7 ) m( 8 ) m( 9 ) m( 10 ) m( 11 ) m( 12 ) m( 13 ) m( 14 ) m( 15 )

#define EAC_RECONSTRUCT_VALUE( n ) vqmovun_s16( vmlaq_s16( srcMidWide, g_alpha_NEON[n], WidenMultiplier_EAC_NEON<n>( multipliers ) ) ),
    uint8x8_t recVals[16] = { EAC_APPLY_16X( EAC_RECONSTRUCT_VALUE ) };

    // find selector
    int err = MAXINT;
    int sel = 0;
    int r;
    for( r = 0; r < 16; r++ )
    {
        uint8x8_t recVal = recVals[r];

        int rangeErr = 0;
#define EAC_ACCUMULATE_ERROR( n ) rangeErr += MinError_EAC_NEON( ErrorProbe_EAC_NEON<n>( recVal, srcAlphaBlock ) );
        EAC_APPLY_16X( EAC_ACCUMULATE_ERROR )

        if( rangeErr < err )
        {
            err = rangeErr;
            sel = r;
            if ( err == 0 ) break;
        }
    }

    // combine results
    uint64_t d = ( uint64_t( srcMid ) << 56 ) |
        ( uint64_t( multipliers[GetMulSel( sel )] ) << 52 ) |
        ( uint64_t( sel ) << 48);

    // generate indices
    uint8x8_t recVal = recVals[sel];
#define EAC_INSERT_INDEX(n) d |= MinErrorIndex_EAC_NEON<n>( recVal, srcAlphaBlock );
    EAC_APPLY_16X( EAC_INSERT_INDEX )

    return _bswap64( d );

#undef EAC_APPLY_16X
#undef EAC_INSERT_INDEX
#undef EAC_ACCUMULATE_ERROR
#undef EAC_RECONSTRUCT_VALUE

#else
    {
        bool solid = true;
        const uint8_t* ptr = src + 1;
        const uint8_t ref = *src;
        int i;
        for( i=1; i<16; i++ )
        {
            if( ref != *ptr++ )
            {
                solid = false;
                break;
            }
        }
        if( solid )
        {
            return ref;
        }
    }

    uint8_t min = src[0];
    uint8_t max = src[0];
    int i;
    for( i=1; i<16; i++ )
    {
        if( min > src[i] ) min = src[i];
        else if( max < src[i] ) max = src[i];
    }
    int srcRange = max - min;
    int srcMid = min + srcRange / 2;

    uint8_t buf[16][16];
    int err = MAXINT;
    int sel = 0;
    int selmul = 0;
    int r;
    for( r=0; r<16; r++ )
    {
        int mul = ( ( srcRange * g_alphaRange[r] ) >> 16 ) + 1;

        int rangeErr = 0;
        int i;
        for( i=0; i<16; i++ )
        {
            const uint8_t srcVal = src[i];

            int idx = 0;
            const int modVal = g_alpha[r][0] * mul;
            const uint8_t recVal = clampu8( srcMid + modVal );
            int localErr = sq( srcVal - recVal );

            if( localErr != 0 )
            {
                int j;
                for( j=1; j<8; j++ )
                {
                    const int32_t modVal = g_alpha[r][j] * mul;
                    const uint8_t recVal = clampu8( srcMid + modVal );
                    const int errProbe = sq( srcVal - recVal );
                    if( errProbe < localErr )
                    {
                        localErr = errProbe;
                        idx = j;
                    }
                }
            }

            buf[r][i] = idx;
            rangeErr += localErr;
        }

        if( rangeErr < err )
        {
            err = rangeErr;
            sel = r;
            selmul = mul;
            if( err == 0 ) break;
        }
    }

    uint64_t d = ( ( (uint64_t)srcMid ) << 56 ) |
        ( ( (uint64_t)selmul ) << 52 ) |
        ( ( (uint64_t)sel ) << 48 );

    int offset = 45;
    uint8_t * ptr = buf[sel];
    for( i=0; i<16; i++ )
    {
        d |= ( (uint64_t)*ptr++ ) << offset;
        offset -= 3;
    }

    return _bswap64( d );
#endif
}

#if 0 // We only use CompressEtc2Rgba()

void CompressEtc1Alpha( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t buf[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

        __m128i c0 = _mm_castps_si128( px0 );
        __m128i c1 = _mm_castps_si128( px1 );
        __m128i c2 = _mm_castps_si128( px2 );
        __m128i c3 = _mm_castps_si128( px3 );

        __m128i mask = _mm_setr_epi32( 0x03030303, 0x07070707, 0x0b0b0b0b, 0x0f0f0f0f );
        __m128i p0 = _mm_shuffle_epi8( c0, mask );
        __m128i p1 = _mm_shuffle_epi8( c1, mask );
        __m128i p2 = _mm_shuffle_epi8( c2, mask );
        __m128i p3 = _mm_shuffle_epi8( c3, mask );

        _mm_store_si128( (__m128i*)(buf + 0),  p0 );
        _mm_store_si128( (__m128i*)(buf + 4),  p1 );
        _mm_store_si128( (__m128i*)(buf + 8),  p2 );
        _mm_store_si128( (__m128i*)(buf + 12), p3 );

        src += 4;
#else
        uint32_t * ptr = buf;
        int x;
        for( x=0; x<4; x++ )
        {
            unsigned int a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessRGB( (uint8_t*)buf );
    }
    while( --blocks );
}

void CompressEtc2Alpha( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t buf[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

        __m128i c0 = _mm_castps_si128( px0 );
        __m128i c1 = _mm_castps_si128( px1 );
        __m128i c2 = _mm_castps_si128( px2 );
        __m128i c3 = _mm_castps_si128( px3 );

        __m128i mask = _mm_setr_epi32( 0x03030303, 0x07070707, 0x0b0b0b0b, 0x0f0f0f0f );
        __m128i p0 = _mm_shuffle_epi8( c0, mask );
        __m128i p1 = _mm_shuffle_epi8( c1, mask );
        __m128i p2 = _mm_shuffle_epi8( c2, mask );
        __m128i p3 = _mm_shuffle_epi8( c3, mask );

        _mm_store_si128( (__m128i*)(buf + 0),  p0 );
        _mm_store_si128( (__m128i*)(buf + 4),  p1 );
        _mm_store_si128( (__m128i*)(buf + 8),  p2 );
        _mm_store_si128( (__m128i*)(buf + 12), p3 );

        src += 4;
#else
        uint32_t * ptr = buf;
        int x;
        for( x=0; x<4; x++ )
        {
            unsigned int a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src += width;
            a = *src >> 24;
            *ptr++ = a | ( a << 8 ) | ( a << 16 );
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessRGB_ETC2( (uint8_t*)buf );
    }
    while( --blocks );
}

void CompressEtc1Rgb( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t buf[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

        _mm_store_si128( (__m128i*)(buf + 0),  _mm_castps_si128( px0 ) );
        _mm_store_si128( (__m128i*)(buf + 4),  _mm_castps_si128( px1 ) );
        _mm_store_si128( (__m128i*)(buf + 8),  _mm_castps_si128( px2 ) );
        _mm_store_si128( (__m128i*)(buf + 12), _mm_castps_si128( px3 ) );

        src += 4;
#else
        uint32_t * ptr = buf;
        int x;
        for( x=0; x<4; x++ )
        {
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessRGB( (uint8_t*)buf );
    }
    while( --blocks );
}

void CompressEtc1RgbDither( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t buf[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

#  ifdef __AVX2__
        DitherAvx2( (uint8_t*)buf, _mm_castps_si128( px0 ), _mm_castps_si128( px1 ), _mm_castps_si128( px2 ), _mm_castps_si128( px3 ) );
#  else
        _mm_store_si128( (__m128i*)(buf + 0),  _mm_castps_si128( px0 ) );
        _mm_store_si128( (__m128i*)(buf + 4),  _mm_castps_si128( px1 ) );
        _mm_store_si128( (__m128i*)(buf + 8),  _mm_castps_si128( px2 ) );
        _mm_store_si128( (__m128i*)(buf + 12), _mm_castps_si128( px3 ) );

        Dither( (uint8_t*)buf );
#  endif

        src += 4;
#else
        uint32_t * ptr = buf;
        int x;
        for( x=0; x<4; x++ )
        {
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessRGB( (uint8_t*)buf );
    }
    while( --blocks );
}

void CompressEtc2Rgb( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t buf[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

        _mm_store_si128( (__m128i*)(buf + 0),  _mm_castps_si128( px0 ) );
        _mm_store_si128( (__m128i*)(buf + 4),  _mm_castps_si128( px1 ) );
        _mm_store_si128( (__m128i*)(buf + 8),  _mm_castps_si128( px2 ) );
        _mm_store_si128( (__m128i*)(buf + 12), _mm_castps_si128( px3 ) );

        src += 4;
#else
        uint32_t * ptr = buf;
        int x;
        for( x=0; x<4; x++ )
        {
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src += width;
            *ptr++ = *src;
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessRGB_ETC2( (uint8_t*)buf );
    }
    while( --blocks );
}

#endif

void CompressEtc2Rgba( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int w = 0;
    uint32_t rgba[4*4];
    uint8_t alpha[4*4];
    initETC2Tables();
    do
    {
#ifdef __SSE4_1__
        __m128 px0 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 0 ) ) );
        __m128 px1 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 1 ) ) );
        __m128 px2 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 2 ) ) );
        __m128 px3 = _mm_castsi128_ps( _mm_loadu_si128( (__m128i*)( src + width * 3 ) ) );

        _MM_TRANSPOSE4_PS( px0, px1, px2, px3 );

        __m128i c0 = _mm_castps_si128( px0 );
        __m128i c1 = _mm_castps_si128( px1 );
        __m128i c2 = _mm_castps_si128( px2 );
        __m128i c3 = _mm_castps_si128( px3 );

        _mm_store_si128( (__m128i*)(rgba + 0),  c0 );
        _mm_store_si128( (__m128i*)(rgba + 4),  c1 );
        _mm_store_si128( (__m128i*)(rgba + 8),  c2 );
        _mm_store_si128( (__m128i*)(rgba + 12), c3 );

        __m128i mask = _mm_setr_epi32( 0x0f0b0703, -1, -1, -1 );

        __m128i a0 = _mm_shuffle_epi8( c0, mask );
        __m128i a1 = _mm_shuffle_epi8( c1, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 3, 3, 0, 3 ) ) );
        __m128i a2 = _mm_shuffle_epi8( c2, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 3, 0, 3, 3 ) ) );
        __m128i a3 = _mm_shuffle_epi8( c3, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 0, 3, 3, 3 ) ) );

        __m128i s0 = _mm_or_si128( a0, a1 );
        __m128i s1 = _mm_or_si128( a2, a3 );
        __m128i s2 = _mm_or_si128( s0, s1 );

        _mm_store_si128( (__m128i*)alpha, s2 );

        src += 4;
#else
        uint32_t * ptr = rgba;
        uint8_t * ptr8 = alpha;
        int x;
        for( x=0; x<4; x++ )
        {
            uint32_t v = *src;
            *ptr++ = v;
            *ptr8++ = v >> 24;
            src += width;
            v = *src;
            *ptr++ = v;
            *ptr8++ = v >> 24;
            src += width;
            v = *src;
            *ptr++ = v;
            *ptr8++ = v >> 24;
            src += width;
            v = *src;
            *ptr++ = v;
            *ptr8++ = v >> 24;
            src -= width * 3 - 1;
        }
#endif
        if( ++w == width/4 )
        {
            src += width * 3;
            w = 0;
        }
        *dst++ = ProcessAlpha_ETC2( alpha );
        *dst++ = ProcessRGB_ETC2( (uint8_t*)rgba );
    }
    while( --blocks );
}


static etcpak_force_inline uint16_t to565RGB( uint8_t r, uint8_t g, uint8_t b )
{
    return ( ( r & 0xF8 ) << 8 ) | ( ( g & 0xFC ) << 3 ) | ( b >> 3 );
}

static etcpak_force_inline uint16_t to565( uint32_t c )
{
    return
        ( ( c & 0xF80000 ) >> 19 ) |
        ( ( c & 0x00FC00 ) >> 5 ) |
        ( ( c & 0x0000F8 ) << 8 );
}

static const uint8_t DxtcIndexTable[256] = {
    85,     87,     86,     84,     93,     95,     94,     92,     89,     91,     90,     88,     81,     83,     82,     80,
    117,    119,    118,    116,    125,    127,    126,    124,    121,    123,    122,    120,    113,    115,    114,    112,
    101,    103,    102,    100,    109,    111,    110,    108,    105,    107,    106,    104,    97,     99,     98,     96,
    69,     71,     70,     68,     77,     79,     78,     76,     73,     75,     74,     72,     65,     67,     66,     64,
    213,    215,    214,    212,    221,    223,    222,    220,    217,    219,    218,    216,    209,    211,    210,    208,
    245,    247,    246,    244,    253,    255,    254,    252,    249,    251,    250,    248,    241,    243,    242,    240,
    229,    231,    230,    228,    237,    239,    238,    236,    233,    235,    234,    232,    225,    227,    226,    224,
    197,    199,    198,    196,    205,    207,    206,    204,    201,    203,    202,    200,    193,    195,    194,    192,
    149,    151,    150,    148,    157,    159,    158,    156,    153,    155,    154,    152,    145,    147,    146,    144,
    181,    183,    182,    180,    189,    191,    190,    188,    185,    187,    186,    184,    177,    179,    178,    176,
    165,    167,    166,    164,    173,    175,    174,    172,    169,    171,    170,    168,    161,    163,    162,    160,
    133,    135,    134,    132,    141,    143,    142,    140,    137,    139,    138,    136,    129,    131,    130,    128,
    21,     23,     22,     20,     29,     31,     30,     28,     25,     27,     26,     24,     17,     19,     18,     16,
    53,     55,     54,     52,     61,     63,     62,     60,     57,     59,     58,     56,     49,     51,     50,     48,
    37,     39,     38,     36,     45,     47,     46,     44,     41,     43,     42,     40,     33,     35,     34,     32,
    5,      7,      6,      4,      13,     15,     14,     12,     9,      11,     10,     8,      1,      3,      2,      0
};

#if defined(__SSE4_1__) && defined(_64_BIT_ARCH)
static const uint8_t AlphaIndexTable_SSE[64] = {
    9,      15,     14,     13,     12,     11,     10,     8,      57,     63,     62,     61,     60,     59,     58,     56,
    49,     55,     54,     53,     52,     51,     50,     48,     41,     47,     46,     45,     44,     43,     42,     40,
    33,     39,     38,     37,     36,     35,     34,     32,     25,     31,     30,     29,     28,     27,     26,     24,
    17,     23,     22,     21,     20,     19,     18,     16,     1,      7,      6,      5,      4,      3,      2,      0,
};
#endif

static const uint16_t DivTable[255*3+1] = {
    0xffff, 0xffff, 0xffff, 0xffff, 0xcccc, 0xaaaa, 0x9249, 0x8000, 0x71c7, 0x6666, 0x5d17, 0x5555, 0x4ec4, 0x4924, 0x4444, 0x4000,
    0x3c3c, 0x38e3, 0x35e5, 0x3333, 0x30c3, 0x2e8b, 0x2c85, 0x2aaa, 0x28f5, 0x2762, 0x25ed, 0x2492, 0x234f, 0x2222, 0x2108, 0x2000,
    0x1f07, 0x1e1e, 0x1d41, 0x1c71, 0x1bac, 0x1af2, 0x1a41, 0x1999, 0x18f9, 0x1861, 0x17d0, 0x1745, 0x16c1, 0x1642, 0x15c9, 0x1555,
    0x14e5, 0x147a, 0x1414, 0x13b1, 0x1352, 0x12f6, 0x129e, 0x1249, 0x11f7, 0x11a7, 0x115b, 0x1111, 0x10c9, 0x1084, 0x1041, 0x1000,
    0x0fc0, 0x0f83, 0x0f48, 0x0f0f, 0x0ed7, 0x0ea0, 0x0e6c, 0x0e38, 0x0e07, 0x0dd6, 0x0da7, 0x0d79, 0x0d4c, 0x0d20, 0x0cf6, 0x0ccc,
    0x0ca4, 0x0c7c, 0x0c56, 0x0c30, 0x0c0c, 0x0be8, 0x0bc5, 0x0ba2, 0x0b81, 0x0b60, 0x0b40, 0x0b21, 0x0b02, 0x0ae4, 0x0ac7, 0x0aaa,
    0x0a8e, 0x0a72, 0x0a57, 0x0a3d, 0x0a23, 0x0a0a, 0x09f1, 0x09d8, 0x09c0, 0x09a9, 0x0991, 0x097b, 0x0964, 0x094f, 0x0939, 0x0924,
    0x090f, 0x08fb, 0x08e7, 0x08d3, 0x08c0, 0x08ad, 0x089a, 0x0888, 0x0876, 0x0864, 0x0853, 0x0842, 0x0831, 0x0820, 0x0810, 0x0800,
    0x07f0, 0x07e0, 0x07d1, 0x07c1, 0x07b3, 0x07a4, 0x0795, 0x0787, 0x0779, 0x076b, 0x075d, 0x0750, 0x0743, 0x0736, 0x0729, 0x071c,
    0x070f, 0x0703, 0x06f7, 0x06eb, 0x06df, 0x06d3, 0x06c8, 0x06bc, 0x06b1, 0x06a6, 0x069b, 0x0690, 0x0685, 0x067b, 0x0670, 0x0666,
    0x065c, 0x0652, 0x0648, 0x063e, 0x0634, 0x062b, 0x0621, 0x0618, 0x060f, 0x0606, 0x05fd, 0x05f4, 0x05eb, 0x05e2, 0x05d9, 0x05d1,
    0x05c9, 0x05c0, 0x05b8, 0x05b0, 0x05a8, 0x05a0, 0x0598, 0x0590, 0x0588, 0x0581, 0x0579, 0x0572, 0x056b, 0x0563, 0x055c, 0x0555,
    0x054e, 0x0547, 0x0540, 0x0539, 0x0532, 0x052b, 0x0525, 0x051e, 0x0518, 0x0511, 0x050b, 0x0505, 0x04fe, 0x04f8, 0x04f2, 0x04ec,
    0x04e6, 0x04e0, 0x04da, 0x04d4, 0x04ce, 0x04c8, 0x04c3, 0x04bd, 0x04b8, 0x04b2, 0x04ad, 0x04a7, 0x04a2, 0x049c, 0x0497, 0x0492,
    0x048d, 0x0487, 0x0482, 0x047d, 0x0478, 0x0473, 0x046e, 0x0469, 0x0465, 0x0460, 0x045b, 0x0456, 0x0452, 0x044d, 0x0448, 0x0444,
    0x043f, 0x043b, 0x0436, 0x0432, 0x042d, 0x0429, 0x0425, 0x0421, 0x041c, 0x0418, 0x0414, 0x0410, 0x040c, 0x0408, 0x0404, 0x0400,
    0x03fc, 0x03f8, 0x03f4, 0x03f0, 0x03ec, 0x03e8, 0x03e4, 0x03e0, 0x03dd, 0x03d9, 0x03d5, 0x03d2, 0x03ce, 0x03ca, 0x03c7, 0x03c3,
    0x03c0, 0x03bc, 0x03b9, 0x03b5, 0x03b2, 0x03ae, 0x03ab, 0x03a8, 0x03a4, 0x03a1, 0x039e, 0x039b, 0x0397, 0x0394, 0x0391, 0x038e,
    0x038b, 0x0387, 0x0384, 0x0381, 0x037e, 0x037b, 0x0378, 0x0375, 0x0372, 0x036f, 0x036c, 0x0369, 0x0366, 0x0364, 0x0361, 0x035e,
    0x035b, 0x0358, 0x0355, 0x0353, 0x0350, 0x034d, 0x034a, 0x0348, 0x0345, 0x0342, 0x0340, 0x033d, 0x033a, 0x0338, 0x0335, 0x0333,
    0x0330, 0x032e, 0x032b, 0x0329, 0x0326, 0x0324, 0x0321, 0x031f, 0x031c, 0x031a, 0x0317, 0x0315, 0x0313, 0x0310, 0x030e, 0x030c,
    0x0309, 0x0307, 0x0305, 0x0303, 0x0300, 0x02fe, 0x02fc, 0x02fa, 0x02f7, 0x02f5, 0x02f3, 0x02f1, 0x02ef, 0x02ec, 0x02ea, 0x02e8,
    0x02e6, 0x02e4, 0x02e2, 0x02e0, 0x02de, 0x02dc, 0x02da, 0x02d8, 0x02d6, 0x02d4, 0x02d2, 0x02d0, 0x02ce, 0x02cc, 0x02ca, 0x02c8,
    0x02c6, 0x02c4, 0x02c2, 0x02c0, 0x02be, 0x02bc, 0x02bb, 0x02b9, 0x02b7, 0x02b5, 0x02b3, 0x02b1, 0x02b0, 0x02ae, 0x02ac, 0x02aa,
    0x02a8, 0x02a7, 0x02a5, 0x02a3, 0x02a1, 0x02a0, 0x029e, 0x029c, 0x029b, 0x0299, 0x0297, 0x0295, 0x0294, 0x0292, 0x0291, 0x028f,
    0x028d, 0x028c, 0x028a, 0x0288, 0x0287, 0x0285, 0x0284, 0x0282, 0x0280, 0x027f, 0x027d, 0x027c, 0x027a, 0x0279, 0x0277, 0x0276,
    0x0274, 0x0273, 0x0271, 0x0270, 0x026e, 0x026d, 0x026b, 0x026a, 0x0268, 0x0267, 0x0265, 0x0264, 0x0263, 0x0261, 0x0260, 0x025e,
    0x025d, 0x025c, 0x025a, 0x0259, 0x0257, 0x0256, 0x0255, 0x0253, 0x0252, 0x0251, 0x024f, 0x024e, 0x024d, 0x024b, 0x024a, 0x0249,
    0x0247, 0x0246, 0x0245, 0x0243, 0x0242, 0x0241, 0x0240, 0x023e, 0x023d, 0x023c, 0x023b, 0x0239, 0x0238, 0x0237, 0x0236, 0x0234,
    0x0233, 0x0232, 0x0231, 0x0230, 0x022e, 0x022d, 0x022c, 0x022b, 0x022a, 0x0229, 0x0227, 0x0226, 0x0225, 0x0224, 0x0223, 0x0222,
    0x0220, 0x021f, 0x021e, 0x021d, 0x021c, 0x021b, 0x021a, 0x0219, 0x0218, 0x0216, 0x0215, 0x0214, 0x0213, 0x0212, 0x0211, 0x0210,
    0x020f, 0x020e, 0x020d, 0x020c, 0x020b, 0x020a, 0x0209, 0x0208, 0x0207, 0x0206, 0x0205, 0x0204, 0x0203, 0x0202, 0x0201, 0x0200,
    0x01ff, 0x01fe, 0x01fd, 0x01fc, 0x01fb, 0x01fa, 0x01f9, 0x01f8, 0x01f7, 0x01f6, 0x01f5, 0x01f4, 0x01f3, 0x01f2, 0x01f1, 0x01f0,
    0x01ef, 0x01ee, 0x01ed, 0x01ec, 0x01eb, 0x01ea, 0x01e9, 0x01e9, 0x01e8, 0x01e7, 0x01e6, 0x01e5, 0x01e4, 0x01e3, 0x01e2, 0x01e1,
    0x01e0, 0x01e0, 0x01df, 0x01de, 0x01dd, 0x01dc, 0x01db, 0x01da, 0x01da, 0x01d9, 0x01d8, 0x01d7, 0x01d6, 0x01d5, 0x01d4, 0x01d4,
    0x01d3, 0x01d2, 0x01d1, 0x01d0, 0x01cf, 0x01cf, 0x01ce, 0x01cd, 0x01cc, 0x01cb, 0x01cb, 0x01ca, 0x01c9, 0x01c8, 0x01c7, 0x01c7,
    0x01c6, 0x01c5, 0x01c4, 0x01c3, 0x01c3, 0x01c2, 0x01c1, 0x01c0, 0x01c0, 0x01bf, 0x01be, 0x01bd, 0x01bd, 0x01bc, 0x01bb, 0x01ba,
    0x01ba, 0x01b9, 0x01b8, 0x01b7, 0x01b7, 0x01b6, 0x01b5, 0x01b4, 0x01b4, 0x01b3, 0x01b2, 0x01b2, 0x01b1, 0x01b0, 0x01af, 0x01af,
    0x01ae, 0x01ad, 0x01ad, 0x01ac, 0x01ab, 0x01aa, 0x01aa, 0x01a9, 0x01a8, 0x01a8, 0x01a7, 0x01a6, 0x01a6, 0x01a5, 0x01a4, 0x01a4,
    0x01a3, 0x01a2, 0x01a2, 0x01a1, 0x01a0, 0x01a0, 0x019f, 0x019e, 0x019e, 0x019d, 0x019c, 0x019c, 0x019b, 0x019a, 0x019a, 0x0199,
    0x0198, 0x0198, 0x0197, 0x0197, 0x0196, 0x0195, 0x0195, 0x0194, 0x0193, 0x0193, 0x0192, 0x0192, 0x0191, 0x0190, 0x0190, 0x018f,
    0x018f, 0x018e, 0x018d, 0x018d, 0x018c, 0x018b, 0x018b, 0x018a, 0x018a, 0x0189, 0x0189, 0x0188, 0x0187, 0x0187, 0x0186, 0x0186,
    0x0185, 0x0184, 0x0184, 0x0183, 0x0183, 0x0182, 0x0182, 0x0181, 0x0180, 0x0180, 0x017f, 0x017f, 0x017e, 0x017e, 0x017d, 0x017d,
    0x017c, 0x017b, 0x017b, 0x017a, 0x017a, 0x0179, 0x0179, 0x0178, 0x0178, 0x0177, 0x0177, 0x0176, 0x0175, 0x0175, 0x0174, 0x0174,
    0x0173, 0x0173, 0x0172, 0x0172, 0x0171, 0x0171, 0x0170, 0x0170, 0x016f, 0x016f, 0x016e, 0x016e, 0x016d, 0x016d, 0x016c, 0x016c,
    0x016b, 0x016b, 0x016a, 0x016a, 0x0169, 0x0169, 0x0168, 0x0168, 0x0167, 0x0167, 0x0166, 0x0166, 0x0165, 0x0165, 0x0164, 0x0164,
    0x0163, 0x0163, 0x0162, 0x0162, 0x0161, 0x0161, 0x0160, 0x0160, 0x015f, 0x015f, 0x015e, 0x015e, 0x015d, 0x015d, 0x015d, 0x015c,
    0x015c, 0x015b, 0x015b, 0x015a, 0x015a, 0x0159, 0x0159, 0x0158, 0x0158, 0x0158, 0x0157, 0x0157, 0x0156, 0x0156
};

#if defined __ARM_NEON
static const uint16_t DivTableNEON[255*3+1] = {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x1c71, 0x1af2, 0x1999, 0x1861, 0x1745, 0x1642, 0x1555, 0x147a, 0x13b1, 0x12f6, 0x1249, 0x11a7, 0x1111, 0x1084, 0x1000,
    0x0f83, 0x0f0f, 0x0ea0, 0x0e38, 0x0dd6, 0x0d79, 0x0d20, 0x0ccc, 0x0c7c, 0x0c30, 0x0be8, 0x0ba2, 0x0b60, 0x0b21, 0x0ae4, 0x0aaa,
    0x0a72, 0x0a3d, 0x0a0a, 0x09d8, 0x09a9, 0x097b, 0x094f, 0x0924, 0x08fb, 0x08d3, 0x08ad, 0x0888, 0x0864, 0x0842, 0x0820, 0x0800,
    0x07e0, 0x07c1, 0x07a4, 0x0787, 0x076b, 0x0750, 0x0736, 0x071c, 0x0703, 0x06eb, 0x06d3, 0x06bc, 0x06a6, 0x0690, 0x067b, 0x0666,
    0x0652, 0x063e, 0x062b, 0x0618, 0x0606, 0x05f4, 0x05e2, 0x05d1, 0x05c0, 0x05b0, 0x05a0, 0x0590, 0x0581, 0x0572, 0x0563, 0x0555,
    0x0547, 0x0539, 0x052b, 0x051e, 0x0511, 0x0505, 0x04f8, 0x04ec, 0x04e0, 0x04d4, 0x04c8, 0x04bd, 0x04b2, 0x04a7, 0x049c, 0x0492,
    0x0487, 0x047d, 0x0473, 0x0469, 0x0460, 0x0456, 0x044d, 0x0444, 0x043b, 0x0432, 0x0429, 0x0421, 0x0418, 0x0410, 0x0408, 0x0400,
    0x03f8, 0x03f0, 0x03e8, 0x03e0, 0x03d9, 0x03d2, 0x03ca, 0x03c3, 0x03bc, 0x03b5, 0x03ae, 0x03a8, 0x03a1, 0x039b, 0x0394, 0x038e,
    0x0387, 0x0381, 0x037b, 0x0375, 0x036f, 0x0369, 0x0364, 0x035e, 0x0358, 0x0353, 0x034d, 0x0348, 0x0342, 0x033d, 0x0338, 0x0333,
    0x032e, 0x0329, 0x0324, 0x031f, 0x031a, 0x0315, 0x0310, 0x030c, 0x0307, 0x0303, 0x02fe, 0x02fa, 0x02f5, 0x02f1, 0x02ec, 0x02e8,
    0x02e4, 0x02e0, 0x02dc, 0x02d8, 0x02d4, 0x02d0, 0x02cc, 0x02c8, 0x02c4, 0x02c0, 0x02bc, 0x02b9, 0x02b5, 0x02b1, 0x02ae, 0x02aa,
    0x02a7, 0x02a3, 0x02a0, 0x029c, 0x0299, 0x0295, 0x0292, 0x028f, 0x028c, 0x0288, 0x0285, 0x0282, 0x027f, 0x027c, 0x0279, 0x0276,
    0x0273, 0x0270, 0x026d, 0x026a, 0x0267, 0x0264, 0x0261, 0x025e, 0x025c, 0x0259, 0x0256, 0x0253, 0x0251, 0x024e, 0x024b, 0x0249,
    0x0246, 0x0243, 0x0241, 0x023e, 0x023c, 0x0239, 0x0237, 0x0234, 0x0232, 0x0230, 0x022d, 0x022b, 0x0229, 0x0226, 0x0224, 0x0222,
    0x021f, 0x021d, 0x021b, 0x0219, 0x0216, 0x0214, 0x0212, 0x0210, 0x020e, 0x020c, 0x020a, 0x0208, 0x0206, 0x0204, 0x0202, 0x0200,
    0x01fe, 0x01fc, 0x01fa, 0x01f8, 0x01f6, 0x01f4, 0x01f2, 0x01f0, 0x01ee, 0x01ec, 0x01ea, 0x01e9, 0x01e7, 0x01e5, 0x01e3, 0x01e1,
    0x01e0, 0x01de, 0x01dc, 0x01da, 0x01d9, 0x01d7, 0x01d5, 0x01d4, 0x01d2, 0x01d0, 0x01cf, 0x01cd, 0x01cb, 0x01ca, 0x01c8, 0x01c7,
    0x01c5, 0x01c3, 0x01c2, 0x01c0, 0x01bf, 0x01bd, 0x01bc, 0x01ba, 0x01b9, 0x01b7, 0x01b6, 0x01b4, 0x01b3, 0x01b2, 0x01b0, 0x01af,
    0x01ad, 0x01ac, 0x01aa, 0x01a9, 0x01a8, 0x01a6, 0x01a5, 0x01a4, 0x01a2, 0x01a1, 0x01a0, 0x019e, 0x019d, 0x019c, 0x019a, 0x0199,
    0x0198, 0x0197, 0x0195, 0x0194, 0x0193, 0x0192, 0x0190, 0x018f, 0x018e, 0x018d, 0x018b, 0x018a, 0x0189, 0x0188, 0x0187, 0x0186,
    0x0184, 0x0183, 0x0182, 0x0181, 0x0180, 0x017f, 0x017e, 0x017d, 0x017b, 0x017a, 0x0179, 0x0178, 0x0177, 0x0176, 0x0175, 0x0174,
    0x0173, 0x0172, 0x0171, 0x0170, 0x016f, 0x016e, 0x016d, 0x016c, 0x016b, 0x016a, 0x0169, 0x0168, 0x0167, 0x0166, 0x0165, 0x0164,
    0x0163, 0x0162, 0x0161, 0x0160, 0x015f, 0x015e, 0x015d, 0x015c, 0x015b, 0x015a, 0x0159, 0x0158, 0x0158, 0x0157, 0x0156, 0x0155,
    0x0154, 0x0153, 0x0152, 0x0151, 0x0150, 0x0150, 0x014f, 0x014e, 0x014d, 0x014c, 0x014b, 0x014a, 0x014a, 0x0149, 0x0148, 0x0147,
    0x0146, 0x0146, 0x0145, 0x0144, 0x0143, 0x0142, 0x0142, 0x0141, 0x0140, 0x013f, 0x013e, 0x013e, 0x013d, 0x013c, 0x013b, 0x013b,
    0x013a, 0x0139, 0x0138, 0x0138, 0x0137, 0x0136, 0x0135, 0x0135, 0x0134, 0x0133, 0x0132, 0x0132, 0x0131, 0x0130, 0x0130, 0x012f,
    0x012e, 0x012e, 0x012d, 0x012c, 0x012b, 0x012b, 0x012a, 0x0129, 0x0129, 0x0128, 0x0127, 0x0127, 0x0126, 0x0125, 0x0125, 0x0124,
    0x0123, 0x0123, 0x0122, 0x0121, 0x0121, 0x0120, 0x0120, 0x011f, 0x011e, 0x011e, 0x011d, 0x011c, 0x011c, 0x011b, 0x011b, 0x011a,
    0x0119, 0x0119, 0x0118, 0x0118, 0x0117, 0x0116, 0x0116, 0x0115, 0x0115, 0x0114, 0x0113, 0x0113, 0x0112, 0x0112, 0x0111, 0x0111,
    0x0110, 0x010f, 0x010f, 0x010e, 0x010e, 0x010d, 0x010d, 0x010c, 0x010c, 0x010b, 0x010a, 0x010a, 0x0109, 0x0109, 0x0108, 0x0108,
    0x0107, 0x0107, 0x0106, 0x0106, 0x0105, 0x0105, 0x0104, 0x0104, 0x0103, 0x0103, 0x0102, 0x0102, 0x0101, 0x0101, 0x0100, 0x0100,
    0x00ff, 0x00ff, 0x00fe, 0x00fe, 0x00fd, 0x00fd, 0x00fc, 0x00fc, 0x00fb, 0x00fb, 0x00fa, 0x00fa, 0x00f9, 0x00f9, 0x00f8, 0x00f8,
    0x00f7, 0x00f7, 0x00f6, 0x00f6, 0x00f5, 0x00f5, 0x00f4, 0x00f4, 0x00f4, 0x00f3, 0x00f3, 0x00f2, 0x00f2, 0x00f1, 0x00f1, 0x00f0,
    0x00f0, 0x00f0, 0x00ef, 0x00ef, 0x00ee, 0x00ee, 0x00ed, 0x00ed, 0x00ed, 0x00ec, 0x00ec, 0x00eb, 0x00eb, 0x00ea, 0x00ea, 0x00ea,
    0x00e9, 0x00e9, 0x00e8, 0x00e8, 0x00e7, 0x00e7, 0x00e7, 0x00e6, 0x00e6, 0x00e5, 0x00e5, 0x00e5, 0x00e4, 0x00e4, 0x00e3, 0x00e3,
    0x00e3, 0x00e2, 0x00e2, 0x00e1, 0x00e1, 0x00e1, 0x00e0, 0x00e0, 0x00e0, 0x00df, 0x00df, 0x00de, 0x00de, 0x00de, 0x00dd, 0x00dd,
    0x00dd, 0x00dc, 0x00dc, 0x00db, 0x00db, 0x00db, 0x00da, 0x00da, 0x00da, 0x00d9, 0x00d9, 0x00d9, 0x00d8, 0x00d8, 0x00d7, 0x00d7,
    0x00d7, 0x00d6, 0x00d6, 0x00d6, 0x00d5, 0x00d5, 0x00d5, 0x00d4, 0x00d4, 0x00d4, 0x00d3, 0x00d3, 0x00d3, 0x00d2, 0x00d2, 0x00d2,
    0x00d1, 0x00d1, 0x00d1, 0x00d0, 0x00d0, 0x00d0, 0x00cf, 0x00cf, 0x00cf, 0x00ce, 0x00ce, 0x00ce, 0x00cd, 0x00cd, 0x00cd, 0x00cc,
    0x00cc, 0x00cc, 0x00cb, 0x00cb, 0x00cb, 0x00ca, 0x00ca, 0x00ca, 0x00c9, 0x00c9, 0x00c9, 0x00c9, 0x00c8, 0x00c8, 0x00c8, 0x00c7,
    0x00c7, 0x00c7, 0x00c6, 0x00c6, 0x00c6, 0x00c5, 0x00c5, 0x00c5, 0x00c5, 0x00c4, 0x00c4, 0x00c4, 0x00c3, 0x00c3, 0x00c3, 0x00c3,
    0x00c2, 0x00c2, 0x00c2, 0x00c1, 0x00c1, 0x00c1, 0x00c1, 0x00c0, 0x00c0, 0x00c0, 0x00bf, 0x00bf, 0x00bf, 0x00bf, 0x00be, 0x00be,
    0x00be, 0x00bd, 0x00bd, 0x00bd, 0x00bd, 0x00bc, 0x00bc, 0x00bc, 0x00bc, 0x00bb, 0x00bb, 0x00bb, 0x00ba, 0x00ba, 0x00ba, 0x00ba,
    0x00b9, 0x00b9, 0x00b9, 0x00b9, 0x00b8, 0x00b8, 0x00b8, 0x00b8, 0x00b7, 0x00b7, 0x00b7, 0x00b7, 0x00b6, 0x00b6, 0x00b6, 0x00b6,
    0x00b5, 0x00b5, 0x00b5, 0x00b5, 0x00b4, 0x00b4, 0x00b4, 0x00b4, 0x00b3, 0x00b3, 0x00b3, 0x00b3, 0x00b2, 0x00b2, 0x00b2, 0x00b2,
    0x00b1, 0x00b1, 0x00b1, 0x00b1, 0x00b0, 0x00b0, 0x00b0, 0x00b0, 0x00af, 0x00af, 0x00af, 0x00af, 0x00ae, 0x00ae, 0x00ae, 0x00ae,
    0x00ae, 0x00ad, 0x00ad, 0x00ad, 0x00ad, 0x00ac, 0x00ac, 0x00ac, 0x00ac, 0x00ac, 0x00ab, 0x00ab, 0x00ab, 0x00ab,
};
#endif

#if defined(__SSE4_1__) && defined(_64_BIT_ARCH)
static const uint16_t DivTableAlpha[256] = {
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xe38e, 0xcccc, 0xba2e, 0xaaaa, 0x9d89, 0x9249, 0x8888, 0x8000,
    0x7878, 0x71c7, 0x6bca, 0x6666, 0x6186, 0x5d17, 0x590b, 0x5555, 0x51eb, 0x4ec4, 0x4bda, 0x4924, 0x469e, 0x4444, 0x4210, 0x4000,
    0x3e0f, 0x3c3c, 0x3a83, 0x38e3, 0x3759, 0x35e5, 0x3483, 0x3333, 0x31f3, 0x30c3, 0x2fa0, 0x2e8b, 0x2d82, 0x2c85, 0x2b93, 0x2aaa,
    0x29cb, 0x28f5, 0x2828, 0x2762, 0x26a4, 0x25ed, 0x253c, 0x2492, 0x23ee, 0x234f, 0x22b6, 0x2222, 0x2192, 0x2108, 0x2082, 0x2000,
    0x1f81, 0x1f07, 0x1e91, 0x1e1e, 0x1dae, 0x1d41, 0x1cd8, 0x1c71, 0x1c0e, 0x1bac, 0x1b4e, 0x1af2, 0x1a98, 0x1a41, 0x19ec, 0x1999,
    0x1948, 0x18f9, 0x18ac, 0x1861, 0x1818, 0x17d0, 0x178a, 0x1745, 0x1702, 0x16c1, 0x1681, 0x1642, 0x1605, 0x15c9, 0x158e, 0x1555,
    0x151d, 0x14e5, 0x14af, 0x147a, 0x1446, 0x1414, 0x13e2, 0x13b1, 0x1381, 0x1352, 0x1323, 0x12f6, 0x12c9, 0x129e, 0x1273, 0x1249,
    0x121f, 0x11f7, 0x11cf, 0x11a7, 0x1181, 0x115b, 0x1135, 0x1111, 0x10ec, 0x10c9, 0x10a6, 0x1084, 0x1062, 0x1041, 0x1020, 0x1000,
    0x0fe0, 0x0fc0, 0x0fa2, 0x0f83, 0x0f66, 0x0f48, 0x0f2b, 0x0f0f, 0x0ef2, 0x0ed7, 0x0ebb, 0x0ea0, 0x0e86, 0x0e6c, 0x0e52, 0x0e38,
    0x0e1f, 0x0e07, 0x0dee, 0x0dd6, 0x0dbe, 0x0da7, 0x0d90, 0x0d79, 0x0d62, 0x0d4c, 0x0d36, 0x0d20, 0x0d0b, 0x0cf6, 0x0ce1, 0x0ccc,
    0x0cb8, 0x0ca4, 0x0c90, 0x0c7c, 0x0c69, 0x0c56, 0x0c43, 0x0c30, 0x0c1e, 0x0c0c, 0x0bfa, 0x0be8, 0x0bd6, 0x0bc5, 0x0bb3, 0x0ba2,
    0x0b92, 0x0b81, 0x0b70, 0x0b60, 0x0b50, 0x0b40, 0x0b30, 0x0b21, 0x0b11, 0x0b02, 0x0af3, 0x0ae4, 0x0ad6, 0x0ac7, 0x0ab8, 0x0aaa,
    0x0a9c, 0x0a8e, 0x0a80, 0x0a72, 0x0a65, 0x0a57, 0x0a4a, 0x0a3d, 0x0a30, 0x0a23, 0x0a16, 0x0a0a, 0x09fd, 0x09f1, 0x09e4, 0x09d8,
    0x09cc, 0x09c0, 0x09b4, 0x09a9, 0x099d, 0x0991, 0x0986, 0x097b, 0x0970, 0x0964, 0x095a, 0x094f, 0x0944, 0x0939, 0x092f, 0x0924,
    0x091a, 0x090f, 0x0905, 0x08fb, 0x08f1, 0x08e7, 0x08dd, 0x08d3, 0x08ca, 0x08c0, 0x08b7, 0x08ad, 0x08a4, 0x089a, 0x0891, 0x0888,
    0x087f, 0x0876, 0x086d, 0x0864, 0x085b, 0x0853, 0x084a, 0x0842, 0x0839, 0x0831, 0x0828, 0x0820, 0x0818, 0x0810, 0x0808, 0x0800,
};
#endif

static etcpak_force_inline uint64_t ProcessRGB_DXTC( const uint8_t* src )
{
#ifdef __SSE4_1__
    __m128i px0 = _mm_loadu_si128(((__m128i*)src) + 0);
    __m128i px1 = _mm_loadu_si128(((__m128i*)src) + 1);
    __m128i px2 = _mm_loadu_si128(((__m128i*)src) + 2);
    __m128i px3 = _mm_loadu_si128(((__m128i*)src) + 3);

    __m128i smask = _mm_set1_epi32( 0xF8FCF8 );
    __m128i sd0 = _mm_and_si128( px0, smask );
    __m128i sd1 = _mm_and_si128( px1, smask );
    __m128i sd2 = _mm_and_si128( px2, smask );
    __m128i sd3 = _mm_and_si128( px3, smask );

    __m128i sc = _mm_shuffle_epi32(sd0, _MM_SHUFFLE(0, 0, 0, 0));

    __m128i sc0 = _mm_cmpeq_epi8(sd0, sc);
    __m128i sc1 = _mm_cmpeq_epi8(sd1, sc);
    __m128i sc2 = _mm_cmpeq_epi8(sd2, sc);
    __m128i sc3 = _mm_cmpeq_epi8(sd3, sc);

    __m128i sm0 = _mm_and_si128(sc0, sc1);
    __m128i sm1 = _mm_and_si128(sc2, sc3);
    __m128i sm = _mm_and_si128(sm0, sm1);

    if( _mm_testc_si128(sm, _mm_set1_epi32(-1)) )
    {
        uint32_t c;
        memcpy( &c, src, 4 );
        return ( (uint64_t)to565( c ) ) << 16;
    }

    __m128i min0 = _mm_min_epu8( px0, px1 );
    __m128i min1 = _mm_min_epu8( px2, px3 );
    __m128i min2 = _mm_min_epu8( min0, min1 );

    __m128i max0 = _mm_max_epu8( px0, px1 );
    __m128i max1 = _mm_max_epu8( px2, px3 );
    __m128i max2 = _mm_max_epu8( max0, max1 );

    __m128i min3 = _mm_shuffle_epi32( min2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i max3 = _mm_shuffle_epi32( max2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i min4 = _mm_min_epu8( min2, min3 );
    __m128i max4 = _mm_max_epu8( max2, max3 );

    __m128i min5 = _mm_shuffle_epi32( min4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i max5 = _mm_shuffle_epi32( max4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i rmin = _mm_min_epu8( min4, min5 );
    __m128i rmax = _mm_max_epu8( max4, max5 );

    __m128i range1 = _mm_subs_epu8( rmax, rmin );
    __m128i range2 = _mm_sad_epu8( rmax, rmin );

    uint32_t vrange = _mm_cvtsi128_si32( range2 ) >> 1;
    __m128i range = _mm_set1_epi16( DivTable[vrange] );

    __m128i inset1 = _mm_srli_epi16( range1, 4 );
    __m128i inset = _mm_and_si128( inset1, _mm_set1_epi8( 0xF ) );
    __m128i min = _mm_adds_epu8( rmin, inset );
    __m128i max = _mm_subs_epu8( rmax, inset );

    __m128i c0 = _mm_subs_epu8( px0, rmin );
    __m128i c1 = _mm_subs_epu8( px1, rmin );
    __m128i c2 = _mm_subs_epu8( px2, rmin );
    __m128i c3 = _mm_subs_epu8( px3, rmin );

    __m128i is0 = _mm_maddubs_epi16( c0, _mm_set1_epi8( 1 ) );
    __m128i is1 = _mm_maddubs_epi16( c1, _mm_set1_epi8( 1 ) );
    __m128i is2 = _mm_maddubs_epi16( c2, _mm_set1_epi8( 1 ) );
    __m128i is3 = _mm_maddubs_epi16( c3, _mm_set1_epi8( 1 ) );

    __m128i s0 = _mm_hadd_epi16( is0, is1 );
    __m128i s1 = _mm_hadd_epi16( is2, is3 );

    __m128i m0 = _mm_mulhi_epu16( s0, range );
    __m128i m1 = _mm_mulhi_epu16( s1, range );

    __m128i p0 = _mm_packus_epi16( m0, m1 );

    __m128i p1 = _mm_or_si128( _mm_srai_epi32( p0, 6 ), _mm_srai_epi32( p0, 12 ) );
    __m128i p2 = _mm_or_si128( _mm_srai_epi32( p0, 18 ), p0 );
    __m128i p3 = _mm_or_si128( p1, p2 );
    __m128i p =_mm_shuffle_epi8( p3, _mm_set1_epi32( 0x0C080400 ) );

    uint32_t vmin = _mm_cvtsi128_si32( min );
    uint32_t vmax = _mm_cvtsi128_si32( max );
    uint32_t vp = _mm_cvtsi128_si32( p );

    return ( (uint64_t)( ( (uint64_t)to565( vmin ) ) << 16 ) | to565( vmax ) | ( ( (uint64_t)vp ) << 32 ) );
#elif defined __ARM_NEON
#  ifdef __aarch64__
    uint8x16x4_t px = vld4q_u8( src );

    uint8x16_t lr = px.val[0];
    uint8x16_t lg = px.val[1];
    uint8x16_t lb = px.val[2];

    uint8_t rmaxr = vmaxvq_u8( lr );
    uint8_t rmaxg = vmaxvq_u8( lg );
    uint8_t rmaxb = vmaxvq_u8( lb );

    uint8_t rminr = vminvq_u8( lr );
    uint8_t rming = vminvq_u8( lg );
    uint8_t rminb = vminvq_u8( lb );

    int rr = rmaxr - rminr;
    int rg = rmaxg - rming;
    int rb = rmaxb - rminb;

    int vrange1 = rr + rg + rb;
    uint16_t vrange2 = DivTableNEON[vrange1];

    uint8_t insetr = rr >> 4;
    uint8_t insetg = rg >> 4;
    uint8_t insetb = rb >> 4;

    uint8_t minr = rminr + insetr;
    uint8_t ming = rming + insetg;
    uint8_t minb = rminb + insetb;

    uint8_t maxr = rmaxr - insetr;
    uint8_t maxg = rmaxg - insetg;
    uint8_t maxb = rmaxb - insetb;

    uint8x16_t cr = vsubq_u8( lr, vdupq_n_u8( rminr ) );
    uint8x16_t cg = vsubq_u8( lg, vdupq_n_u8( rming ) );
    uint8x16_t cb = vsubq_u8( lb, vdupq_n_u8( rminb ) );

    uint16x8_t is0l = vaddl_u8( vget_low_u8( cr ), vget_low_u8( cg ) );
    uint16x8_t is0h = vaddl_u8( vget_high_u8( cr ), vget_high_u8( cg ) );
    uint16x8_t is1l = vaddw_u8( is0l, vget_low_u8( cb ) );
    uint16x8_t is1h = vaddw_u8( is0h, vget_high_u8( cb ) );

    int16x8_t range = vdupq_n_s16( vrange2 );
    uint16x8_t m0 = vreinterpretq_u16_s16( vqdmulhq_s16( vreinterpretq_s16_u16( is1l ), range ) );
    uint16x8_t m1 = vreinterpretq_u16_s16( vqdmulhq_s16( vreinterpretq_s16_u16( is1h ), range ) );

    uint8x8_t p00 = vmovn_u16( m0 );
    uint8x8_t p01 = vmovn_u16( m1 );
    uint8x16_t p0 = vcombine_u8( p00, p01 );

    uint32x4_t p1 = vaddq_u32( vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 6 ), vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 12 ) );
    uint32x4_t p2 = vaddq_u32( vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 18 ), vreinterpretq_u32_u8( p0 ) );
    uint32x4_t p3 = vaddq_u32( p1, p2 );

    uint16x4x2_t p4 = vuzp_u16( vget_low_u16( vreinterpretq_u16_u32( p3 ) ), vget_high_u16( vreinterpretq_u16_u32( p3 ) ) );
    uint8x8x2_t p = vuzp_u8( vreinterpret_u8_u16( p4.val[0] ), vreinterpret_u8_u16( p4.val[0] ) );

    uint32_t vp;
    vst1_lane_u32( &vp, vreinterpret_u32_u8( p.val[0] ), 0 );

    return uint64_t( ( uint64_t( to565( minr, ming, minb ) ) << 16 ) | to565( maxr, maxg, maxb ) | ( uint64_t( vp ) << 32 ) );
#  else
    uint32x4_t px0 = vld1q_u32( (uint32_t*)src );
    uint32x4_t px1 = vld1q_u32( (uint32_t*)src + 4 );
    uint32x4_t px2 = vld1q_u32( (uint32_t*)src + 8 );
    uint32x4_t px3 = vld1q_u32( (uint32_t*)src + 12 );

    uint32x4_t smask = vdupq_n_u32( 0xF8FCF8 );
    uint32x4_t sd0 = vandq_u32( smask, px0 );
    uint32x4_t sd1 = vandq_u32( smask, px1 );
    uint32x4_t sd2 = vandq_u32( smask, px2 );
    uint32x4_t sd3 = vandq_u32( smask, px3 );

    uint32x4_t sc = vdupq_n_u32( sd0[0] );

    uint32x4_t sc0 = vceqq_u32( sd0, sc );
    uint32x4_t sc1 = vceqq_u32( sd1, sc );
    uint32x4_t sc2 = vceqq_u32( sd2, sc );
    uint32x4_t sc3 = vceqq_u32( sd3, sc );

    uint32x4_t sm0 = vandq_u32( sc0, sc1 );
    uint32x4_t sm1 = vandq_u32( sc2, sc3 );
    int64x2_t sm = vreinterpretq_s64_u32( vandq_u32( sm0, sm1 ) );

    if( sm[0] == -1 && sm[1] == -1 )
    {
        return uint64_t( to565( src[0], src[1], src[2] ) ) << 16;
    }

    uint32x4_t mask = vdupq_n_u32( 0xFFFFFF );
    uint8x16_t l0 = vreinterpretq_u8_u32( vandq_u32( mask, px0 ) );
    uint8x16_t l1 = vreinterpretq_u8_u32( vandq_u32( mask, px1 ) );
    uint8x16_t l2 = vreinterpretq_u8_u32( vandq_u32( mask, px2 ) );
    uint8x16_t l3 = vreinterpretq_u8_u32( vandq_u32( mask, px3 ) );

    uint8x16_t min0 = vminq_u8( l0, l1 );
    uint8x16_t min1 = vminq_u8( l2, l3 );
    uint8x16_t min2 = vminq_u8( min0, min1 );

    uint8x16_t max0 = vmaxq_u8( l0, l1 );
    uint8x16_t max1 = vmaxq_u8( l2, l3 );
    uint8x16_t max2 = vmaxq_u8( max0, max1 );

    uint8x16_t min3 = vreinterpretq_u8_u32( vrev64q_u32( vreinterpretq_u32_u8( min2 ) ) );
    uint8x16_t max3 = vreinterpretq_u8_u32( vrev64q_u32( vreinterpretq_u32_u8( max2 ) ) );

    uint8x16_t min4 = vminq_u8( min2, min3 );
    uint8x16_t max4 = vmaxq_u8( max2, max3 );

    uint8x16_t min5 = vcombine_u8( vget_high_u8( min4 ), vget_low_u8( min4 ) );
    uint8x16_t max5 = vcombine_u8( vget_high_u8( max4 ), vget_low_u8( max4 ) );

    uint8x16_t rmin = vminq_u8( min4, min5 );
    uint8x16_t rmax = vmaxq_u8( max4, max5 );

    uint8x16_t range1 = vsubq_u8( rmax, rmin );
    uint8x8_t range2 = vget_low_u8( range1 );
    uint8x8x2_t range3 = vzip_u8( range2, vdup_n_u8( 0 ) );
    uint16x4_t range4 = vreinterpret_u16_u8( range3.val[0] );

    uint16_t vrange1;
    uint16x4_t range5 = vpadd_u16( range4, range4 );
    uint16x4_t range6 = vpadd_u16( range5, range5 );
    vst1_lane_u16( &vrange1, range6, 0 );

    uint32_t vrange2 = ( 2 << 16 ) / uint32_t( vrange1 + 1 );
    uint16x8_t range = vdupq_n_u16( vrange2 );

    uint8x16_t inset = vshrq_n_u8( range1, 4 );
    uint8x16_t min = vaddq_u8( rmin, inset );
    uint8x16_t max = vsubq_u8( rmax, inset );

    uint8x16_t c0 = vsubq_u8( l0, rmin );
    uint8x16_t c1 = vsubq_u8( l1, rmin );
    uint8x16_t c2 = vsubq_u8( l2, rmin );
    uint8x16_t c3 = vsubq_u8( l3, rmin );

    uint16x8_t is0 = vpaddlq_u8( c0 );
    uint16x8_t is1 = vpaddlq_u8( c1 );
    uint16x8_t is2 = vpaddlq_u8( c2 );
    uint16x8_t is3 = vpaddlq_u8( c3 );

    uint16x4_t is4 = vpadd_u16( vget_low_u16( is0 ), vget_high_u16( is0 ) );
    uint16x4_t is5 = vpadd_u16( vget_low_u16( is1 ), vget_high_u16( is1 ) );
    uint16x4_t is6 = vpadd_u16( vget_low_u16( is2 ), vget_high_u16( is2 ) );
    uint16x4_t is7 = vpadd_u16( vget_low_u16( is3 ), vget_high_u16( is3 ) );

    uint16x8_t s0 = vcombine_u16( is4, is5 );
    uint16x8_t s1 = vcombine_u16( is6, is7 );

    uint16x8_t m0 = vreinterpretq_u16_s16( vqdmulhq_s16( vreinterpretq_s16_u16( s0 ), vreinterpretq_s16_u16( range ) ) );
    uint16x8_t m1 = vreinterpretq_u16_s16( vqdmulhq_s16( vreinterpretq_s16_u16( s1 ), vreinterpretq_s16_u16( range ) ) );

    uint8x8_t p00 = vmovn_u16( m0 );
    uint8x8_t p01 = vmovn_u16( m1 );
    uint8x16_t p0 = vcombine_u8( p00, p01 );

    uint32x4_t p1 = vaddq_u32( vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 6 ), vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 12 ) );
    uint32x4_t p2 = vaddq_u32( vshrq_n_u32( vreinterpretq_u32_u8( p0 ), 18 ), vreinterpretq_u32_u8( p0 ) );
    uint32x4_t p3 = vaddq_u32( p1, p2 );

    uint16x4x2_t p4 = vuzp_u16( vget_low_u16( vreinterpretq_u16_u32( p3 ) ), vget_high_u16( vreinterpretq_u16_u32( p3 ) ) );
    uint8x8x2_t p = vuzp_u8( vreinterpret_u8_u16( p4.val[0] ), vreinterpret_u8_u16( p4.val[0] ) );

    uint32_t vmin, vmax, vp;
    vst1q_lane_u32( &vmin, vreinterpretq_u32_u8( min ), 0 );
    vst1q_lane_u32( &vmax, vreinterpretq_u32_u8( max ), 0 );
    vst1_lane_u32( &vp, vreinterpret_u32_u8( p.val[0] ), 0 );

    return uint64_t( ( uint64_t( to565( vmin ) ) << 16 ) | to565( vmax ) | ( uint64_t( vp ) << 32 ) );
#  endif
#else
    uint32_t ref;
    memcpy( &ref, src, 4 );
    uint32_t refMask = ref & 0xF8FCF8;
    const uint8_t * stmp = src + 4;
    int i;
    for( i=1; i<16; i++ )
    {
        uint32_t px;
        memcpy( &px, stmp, 4 );
        if( ( px & 0xF8FCF8 ) != refMask ) break;
        stmp += 4;
    }
    if( stmp == src + 64 )
    {
        return ( (uint64_t)to565( ref ) ) << 16;
    }

    uint8_t min[3] = { src[0], src[1], src[2] };
    uint8_t max[3] = { src[0], src[1], src[2] };
    const uint8_t * tmp = src + 4;
    for( i=1; i<16; i++ )
    {
        int j;
        for( j=0; j<3; j++ )
        {
            if( tmp[j] < min[j] ) min[j] = tmp[j];
            else if( tmp[j] > max[j] ) max[j] = tmp[j];
        }
        tmp += 4;
    }

    const uint32_t range = DivTable[max[0] - min[0] + max[1] - min[1] + max[2] - min[2]];
    const uint32_t rmin = min[0] + min[1] + min[2];
    for( i=0; i<3; i++ )
    {
        const uint8_t inset = ( max[i] - min[i] ) >> 4;
        min[i] += inset;
        max[i] -= inset;
    }

    uint32_t data = 0;
    for( i=0; i<16; i++ )
    {
        const uint32_t c = src[0] + src[1] + src[2] - rmin;
        const uint8_t idx = ( c * range ) >> 16;
        data |= idx << (i*2);
        src += 4;
    }

    return ( (uint64_t)( ( (uint64_t)to565RGB( min[0], min[1], min[2] ) ) << 16 ) | to565RGB( max[0], max[1], max[2] ) | ( ( (uint64_t)data ) << 32 ) );
#endif
}

#ifdef __AVX2__
static etcpak_force_inline void ProcessRGB_AVX( const uint8_t* src, char** dst )
{
    __m256i px0 = _mm256_loadu_si256(((__m256i*)src) + 0);
    __m256i px1 = _mm256_loadu_si256(((__m256i*)src) + 1);
    __m256i px2 = _mm256_loadu_si256(((__m256i*)src) + 2);
    __m256i px3 = _mm256_loadu_si256(((__m256i*)src) + 3);

    __m256i smask = _mm256_set1_epi32( 0xF8FCF8 );
    __m256i sd0 = _mm256_and_si256( px0, smask );
    __m256i sd1 = _mm256_and_si256( px1, smask );
    __m256i sd2 = _mm256_and_si256( px2, smask );
    __m256i sd3 = _mm256_and_si256( px3, smask );

    __m256i sc = _mm256_shuffle_epi32(sd0, _MM_SHUFFLE(0, 0, 0, 0));

    __m256i sc0 = _mm256_cmpeq_epi8(sd0, sc);
    __m256i sc1 = _mm256_cmpeq_epi8(sd1, sc);
    __m256i sc2 = _mm256_cmpeq_epi8(sd2, sc);
    __m256i sc3 = _mm256_cmpeq_epi8(sd3, sc);

    __m256i sm0 = _mm256_and_si256(sc0, sc1);
    __m256i sm1 = _mm256_and_si256(sc2, sc3);
    __m256i sm = _mm256_and_si256(sm0, sm1);

    const int64_t solid0 = 1 - _mm_testc_si128( _mm256_castsi256_si128( sm ), _mm_set1_epi32( -1 ) );
    const int64_t solid1 = 1 - _mm_testc_si128( _mm256_extracti128_si256( sm, 1 ), _mm_set1_epi32( -1 ) );

    if( solid0 + solid1 == 0 )
    {
        const uint64_t c0 = ( (uint64_t)to565RGB( src[0], src[1], src[2] ) );
        const uint64_t c1 = ( (uint64_t)to565RGB( src[16], src[17], src[18] ) );
        memcpy( dst[0], &c0, 8 );
        memcpy( dst[0]+8, &c1, 8 );
        dst[0] += 16;
        return;
    }

    __m256i min0 = _mm256_min_epu8( px0, px1 );
    __m256i min1 = _mm256_min_epu8( px2, px3 );
    __m256i min2 = _mm256_min_epu8( min0, min1 );

    __m256i max0 = _mm256_max_epu8( px0, px1 );
    __m256i max1 = _mm256_max_epu8( px2, px3 );
    __m256i max2 = _mm256_max_epu8( max0, max1 );

    __m256i min3 = _mm256_shuffle_epi32( min2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m256i max3 = _mm256_shuffle_epi32( max2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m256i min4 = _mm256_min_epu8( min2, min3 );
    __m256i max4 = _mm256_max_epu8( max2, max3 );

    __m256i min5 = _mm256_shuffle_epi32( min4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m256i max5 = _mm256_shuffle_epi32( max4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m256i rmin = _mm256_min_epu8( min4, min5 );
    __m256i rmax = _mm256_max_epu8( max4, max5 );

    __m256i range1 = _mm256_subs_epu8( rmax, rmin );
    __m256i range2 = _mm256_sad_epu8( rmax, rmin );

    uint16_t vrange0 = DivTable[_mm256_cvtsi256_si32( range2 ) >> 1];
    uint16_t vrange1 = DivTable[_mm256_extract_epi16( range2, 8 ) >> 1];
    __m256i range00 = _mm256_set1_epi16( vrange0 );
    __m256i range = _mm256_inserti128_si256( range00, _mm_set1_epi16( vrange1 ), 1 );

    __m256i inset1 = _mm256_srli_epi16( range1, 4 );
    __m256i inset = _mm256_and_si256( inset1, _mm256_set1_epi8( 0xF ) );
    __m256i min = _mm256_adds_epu8( rmin, inset );
    __m256i max = _mm256_subs_epu8( rmax, inset );

    __m256i c0 = _mm256_subs_epu8( px0, rmin );
    __m256i c1 = _mm256_subs_epu8( px1, rmin );
    __m256i c2 = _mm256_subs_epu8( px2, rmin );
    __m256i c3 = _mm256_subs_epu8( px3, rmin );

    __m256i is0 = _mm256_maddubs_epi16( c0, _mm256_set1_epi8( 1 ) );
    __m256i is1 = _mm256_maddubs_epi16( c1, _mm256_set1_epi8( 1 ) );
    __m256i is2 = _mm256_maddubs_epi16( c2, _mm256_set1_epi8( 1 ) );
    __m256i is3 = _mm256_maddubs_epi16( c3, _mm256_set1_epi8( 1 ) );

    __m256i s0 = _mm256_hadd_epi16( is0, is1 );
    __m256i s1 = _mm256_hadd_epi16( is2, is3 );

    __m256i m0 = _mm256_mulhi_epu16( s0, range );
    __m256i m1 = _mm256_mulhi_epu16( s1, range );

    __m256i p0 = _mm256_packus_epi16( m0, m1 );

    __m256i p1 = _mm256_or_si256( _mm256_srai_epi32( p0, 6 ), _mm256_srai_epi32( p0, 12 ) );
    __m256i p2 = _mm256_or_si256( _mm256_srai_epi32( p0, 18 ), p0 );
    __m256i p3 = _mm256_or_si256( p1, p2 );
    __m256i p =_mm256_shuffle_epi8( p3, _mm256_set1_epi32( 0x0C080400 ) );

    __m256i mm0 = _mm256_unpacklo_epi8( _mm256_setzero_si256(), min );
    __m256i mm1 = _mm256_unpacklo_epi8( _mm256_setzero_si256(), max );
    __m256i mm2 = _mm256_unpacklo_epi64( mm1, mm0 );
    __m256i mmr = _mm256_slli_epi64( _mm256_srli_epi64( mm2, 11 ), 11 );
    __m256i mmg = _mm256_slli_epi64( _mm256_srli_epi64( mm2, 26 ), 5 );
    __m256i mmb = _mm256_srli_epi64( _mm256_slli_epi64( mm2, 16 ), 59 );
    __m256i mm3 = _mm256_or_si256( mmr, mmg );
    __m256i mm4 = _mm256_or_si256( mm3, mmb );
    __m256i mm5 = _mm256_shuffle_epi8( mm4, _mm256_set1_epi32( 0x09080100 ) );

    __m256i d0 = _mm256_unpacklo_epi32( mm5, p );
    __m256i d1 = _mm256_permute4x64_epi64( d0, _MM_SHUFFLE( 3, 2, 2, 0 ) );
    __m128i d2 = _mm256_castsi256_si128( d1 );

    __m128i mask = _mm_set_epi64x( 0xFFFF0000 | -solid1, 0xFFFF0000 | -solid0 );
    __m128i d3 = _mm_and_si128( d2, mask );
    _mm_storeu_si128( (__m128i*)dst[0], d3 );

    int j;
    for( j=4; j<8; j++ ) dst[0][j] = (char)DxtcIndexTable[(uint8_t)dst[0][j]];
    for( j=12; j<16; j++ ) dst[0][j] = (char)DxtcIndexTable[(uint8_t)dst[0][j]];

    dst[0] += 16;
}
#endif

static const uint8_t AlphaIndexTable[8] = { 1, 7, 6, 5, 4, 3, 2, 0 };

static etcpak_force_inline uint64_t ProcessAlpha_DXTC( const uint8_t* src )
{
    uint8_t solid8 = *src;
    uint16_t solid16 = ( (uint16_t)solid8 ) | ( ( (uint16_t)solid8 ) << 8 );
    uint32_t solid32 = ( (uint32_t)solid16 ) | ( ( (uint32_t)solid16 ) << 16 );
    uint64_t solid64 = ( (uint64_t)solid32 ) | ( ( (uint64_t)solid32 ) << 32 );
    if( memcmp( src, &solid64, 8 ) == 0 && memcmp( src+8, &solid64, 8 ) == 0 )
    {
        return solid8;
    }

    uint8_t min = src[0];
    uint8_t max = min;
    int i;
    for( i=1; i<16; i++ )
    {
        const uint8_t v = src[i];
        if( v > max ) max = v;
        else if( v < min ) min = v;
    }

    uint32_t range = ( 8 << 13 ) / ( 1 + max - min );
    uint64_t data = 0;
    for( i=0; i<16; i++ )
    {
        uint8_t a = src[i] - min;
        uint64_t idx = AlphaIndexTable[( a * range ) >> 13];
        data |= idx << (i*3);
    }

    return max | ( min << 8 ) | ( data << 16 );
}

#ifdef __SSE4_1__
static etcpak_force_inline uint64_t ProcessRGB_SSE( __m128i px0, __m128i px1, __m128i px2, __m128i px3 )
{
    __m128i smask = _mm_set1_epi32( 0xF8FCF8 );
    __m128i sd0 = _mm_and_si128( px0, smask );
    __m128i sd1 = _mm_and_si128( px1, smask );
    __m128i sd2 = _mm_and_si128( px2, smask );
    __m128i sd3 = _mm_and_si128( px3, smask );

    __m128i sc = _mm_shuffle_epi32(sd0, _MM_SHUFFLE(0, 0, 0, 0));

    __m128i sc0 = _mm_cmpeq_epi8(sd0, sc);
    __m128i sc1 = _mm_cmpeq_epi8(sd1, sc);
    __m128i sc2 = _mm_cmpeq_epi8(sd2, sc);
    __m128i sc3 = _mm_cmpeq_epi8(sd3, sc);

    __m128i sm0 = _mm_and_si128(sc0, sc1);
    __m128i sm1 = _mm_and_si128(sc2, sc3);
    __m128i sm = _mm_and_si128(sm0, sm1);

    if( _mm_testc_si128(sm, _mm_set1_epi32(-1)) )
    {
        return ( (uint64_t)to565( _mm_cvtsi128_si32( px0 ) ) ) << 16;
    }

    px0 = _mm_and_si128( px0, _mm_set1_epi32( 0xFFFFFF ) );
    px1 = _mm_and_si128( px1, _mm_set1_epi32( 0xFFFFFF ) );
    px2 = _mm_and_si128( px2, _mm_set1_epi32( 0xFFFFFF ) );
    px3 = _mm_and_si128( px3, _mm_set1_epi32( 0xFFFFFF ) );

    __m128i min0 = _mm_min_epu8( px0, px1 );
    __m128i min1 = _mm_min_epu8( px2, px3 );
    __m128i min2 = _mm_min_epu8( min0, min1 );

    __m128i max0 = _mm_max_epu8( px0, px1 );
    __m128i max1 = _mm_max_epu8( px2, px3 );
    __m128i max2 = _mm_max_epu8( max0, max1 );

    __m128i min3 = _mm_shuffle_epi32( min2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i max3 = _mm_shuffle_epi32( max2, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i min4 = _mm_min_epu8( min2, min3 );
    __m128i max4 = _mm_max_epu8( max2, max3 );

    __m128i min5 = _mm_shuffle_epi32( min4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i max5 = _mm_shuffle_epi32( max4, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i rmin = _mm_min_epu8( min4, min5 );
    __m128i rmax = _mm_max_epu8( max4, max5 );

    __m128i range1 = _mm_subs_epu8( rmax, rmin );
    __m128i range2 = _mm_sad_epu8( rmax, rmin );

    uint32_t vrange = _mm_cvtsi128_si32( range2 ) >> 1;
    __m128i range = _mm_set1_epi16( DivTable[vrange] );

    __m128i inset1 = _mm_srli_epi16( range1, 4 );
    __m128i inset = _mm_and_si128( inset1, _mm_set1_epi8( 0xF ) );
    __m128i min = _mm_adds_epu8( rmin, inset );
    __m128i max = _mm_subs_epu8( rmax, inset );

    __m128i c0 = _mm_subs_epu8( px0, rmin );
    __m128i c1 = _mm_subs_epu8( px1, rmin );
    __m128i c2 = _mm_subs_epu8( px2, rmin );
    __m128i c3 = _mm_subs_epu8( px3, rmin );

    __m128i is0 = _mm_maddubs_epi16( c0, _mm_set1_epi8( 1 ) );
    __m128i is1 = _mm_maddubs_epi16( c1, _mm_set1_epi8( 1 ) );
    __m128i is2 = _mm_maddubs_epi16( c2, _mm_set1_epi8( 1 ) );
    __m128i is3 = _mm_maddubs_epi16( c3, _mm_set1_epi8( 1 ) );

    __m128i s0 = _mm_hadd_epi16( is0, is1 );
    __m128i s1 = _mm_hadd_epi16( is2, is3 );

    __m128i m0 = _mm_mulhi_epu16( s0, range );
    __m128i m1 = _mm_mulhi_epu16( s1, range );

    __m128i p0 = _mm_packus_epi16( m0, m1 );

    __m128i p1 = _mm_or_si128( _mm_srai_epi32( p0, 6 ), _mm_srai_epi32( p0, 12 ) );
    __m128i p2 = _mm_or_si128( _mm_srai_epi32( p0, 18 ), p0 );
    __m128i p3 = _mm_or_si128( p1, p2 );
    __m128i p =_mm_shuffle_epi8( p3, _mm_set1_epi32( 0x0C080400 ) );

    uint32_t vmin = _mm_cvtsi128_si32( min );
    uint32_t vmax = _mm_cvtsi128_si32( max );
    uint32_t vp = _mm_cvtsi128_si32( p );

    return ( (uint64_t)( ( (uint64_t)to565( vmin ) ) << 16 ) | to565( vmax ) | ( ( (uint64_t)vp ) << 32 ) );
}
#endif

#if defined(__SSE4_1__) && defined(_64_BIT_ARCH) // _mm_cvtsi128_si64() is not available on 32-bit architectures
static etcpak_force_inline uint64_t ProcessAlpha_SSE( __m128i px0, __m128i px1, __m128i px2, __m128i px3 )
{
    __m128i mask = _mm_setr_epi32( 0x0f0b0703, -1, -1, -1 );

    __m128i m0 = _mm_shuffle_epi8( px0, mask );
    __m128i m1 = _mm_shuffle_epi8( px1, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 3, 3, 0, 3 ) ) );
    __m128i m2 = _mm_shuffle_epi8( px2, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 3, 0, 3, 3 ) ) );
    __m128i m3 = _mm_shuffle_epi8( px3, _mm_shuffle_epi32( mask, _MM_SHUFFLE( 0, 3, 3, 3 ) ) );
    __m128i m4 = _mm_or_si128( m0, m1 );
    __m128i m5 = _mm_or_si128( m2, m3 );
    __m128i a = _mm_or_si128( m4, m5 );

    __m128i solidCmp = _mm_shuffle_epi8( a, _mm_setzero_si128() );
    __m128i cmpRes = _mm_cmpeq_epi8( a, solidCmp );
    if( _mm_testc_si128( cmpRes, _mm_set1_epi32( -1 ) ) )
    {
        return _mm_cvtsi128_si32( a ) & 0xFF;
    }

    __m128i a1 = _mm_shuffle_epi32( a, _MM_SHUFFLE( 2, 3, 0, 1 ) );
    __m128i max1 = _mm_max_epu8( a, a1 );
    __m128i min1 = _mm_min_epu8( a, a1 );
    __m128i amax2 = _mm_shuffle_epi32( max1, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i amin2 = _mm_shuffle_epi32( min1, _MM_SHUFFLE( 0, 0, 2, 2 ) );
    __m128i max2 = _mm_max_epu8( max1, amax2 );
    __m128i min2 = _mm_min_epu8( min1, amin2 );
    __m128i amax3 = _mm_alignr_epi8( max2, max2, 2 );
    __m128i amin3 = _mm_alignr_epi8( min2, min2, 2 );
    __m128i max3 = _mm_max_epu8( max2, amax3 );
    __m128i min3 = _mm_min_epu8( min2, amin3 );
    __m128i amax4 = _mm_alignr_epi8( max3, max3, 1 );
    __m128i amin4 = _mm_alignr_epi8( min3, min3, 1 );
    __m128i max = _mm_max_epu8( max3, amax4 );
    __m128i min = _mm_min_epu8( min3, amin4 );
    __m128i minmax = _mm_unpacklo_epi8( max, min );

    __m128i r = _mm_sub_epi8( max, min );
    int range = _mm_cvtsi128_si32( r ) & 0xFF;
    __m128i rv = _mm_set1_epi16( DivTableAlpha[range] );

    __m128i v = _mm_sub_epi8( a, min );

    __m128i lo16 = _mm_unpacklo_epi8( v, _mm_setzero_si128() );
    __m128i hi16 = _mm_unpackhi_epi8( v, _mm_setzero_si128() );

    __m128i lomul = _mm_mulhi_epu16( lo16, rv );
    __m128i himul = _mm_mulhi_epu16( hi16, rv );

    __m128i p0 = _mm_packus_epi16( lomul, himul );
    __m128i p1 = _mm_or_si128( _mm_and_si128( p0, _mm_set1_epi16( 0x3F ) ), _mm_srai_epi16( _mm_and_si128( p0, _mm_set1_epi16( 0x3F00 ) ), 5 ) );
    __m128i p2 = _mm_packus_epi16( p1, p1 );

    uint64_t pi = _mm_cvtsi128_si64( p2 );
    uint64_t data = 0;
    int i;
    for( i=0; i<8; i++ )
    {
        uint64_t idx = AlphaIndexTable_SSE[(pi>>(i*8)) & 0x3F];
        data |= idx << (i*6);
    }
    return (uint64_t)(uint16_t)_mm_cvtsi128_si32( minmax ) | ( data << 16 );
}
#endif

void CompressDxt1( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
#ifdef __AVX2__
    if( width%8 == 0 )
    {
        blocks /= 2;
        uint32_t buf[8*4];
        int i = 0;
        char* dst8 = (char*)dst;

        do
        {
            char* tmp = (char*)buf;
            memcpy( tmp,        src + width * 0, 8*4 );
            memcpy( tmp + 8*4,  src + width * 1, 8*4 );
            memcpy( tmp + 16*4, src + width * 2, 8*4 );
            memcpy( tmp + 24*4, src + width * 3, 8*4 );
            src += 8;
            if( ++i == width/8 )
            {
                src += width * 3;
                i = 0;
            }

            ProcessRGB_AVX( (uint8_t*)buf, &dst8 );
        }
        while( --blocks );
    }
    else
#endif
    {
        uint32_t buf[4*4];
        int i = 0;

        uint64_t * ptr = dst;
        do
        {
            char * tmp = (char*)buf;
            memcpy( tmp,        src + width * 0, 4*4 );
            memcpy( tmp + 4*4,  src + width * 1, 4*4 );
            memcpy( tmp + 8*4,  src + width * 2, 4*4 );
            memcpy( tmp + 12*4, src + width * 3, 4*4 );
            src += 4;
            if( ++i == width/4 )
            {
                src += width * 3;
                i = 0;
            }

            const uint64_t c = ProcessRGB_DXTC( (uint8_t*)buf );
            uint8_t fix[8];
            int j;

            memcpy( fix, &c, 8 );
            for( j=4; j<8; j++ ) fix[j] = DxtcIndexTable[fix[j]];
            memcpy( ptr, fix, sizeof( uint64_t ) );
            ptr++;
        }
        while( --blocks );
    }
}

#if 0
void CompressDxt1Dither( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    uint32_t buf[4*4];
    int i = 0;

    uint64_t * ptr = dst;
    do
    {
        char * tmp = (char*)buf;
        memcpy( tmp,        src + width * 0, 4*4 );
        memcpy( tmp + 4*4,  src + width * 1, 4*4 );
        memcpy( tmp + 8*4,  src + width * 2, 4*4 );
        memcpy( tmp + 12*4, src + width * 3, 4*4 );
        src += 4;
        if( ++i == width/4 )
        {
            src += width * 3;
            i = 0;
        }

        Dither( (uint8_t*)buf );

        const auto c = ProcessRGB_DXTC( (uint8_t*)buf );
        uint8_t fix[8];
        int j;
        memcpy( fix, &c, 8 );
        for( j=4; j<8; j++ ) fix[j] = DxtcIndexTable[fix[j]];
        memcpy( ptr, fix, sizeof( uint64_t ) );
        ptr++;
    }
    while( --blocks );
}
#endif

void CompressDxt5( const uint32_t* src, uint64_t* dst, uint32_t blocks, size_t width )
{
    int i = 0;
    uint64_t * ptr = dst;
    do
    {
#if defined(__SSE4_1__) && defined(_64_BIT_ARCH)  // _mm_cvtsi128_si64() is not available on 32-bit architectures
        __m128i px0 = _mm_loadu_si128( (__m128i*)( src + width * 0 ) );
        __m128i px1 = _mm_loadu_si128( (__m128i*)( src + width * 1 ) );
        __m128i px2 = _mm_loadu_si128( (__m128i*)( src + width * 2 ) );
        __m128i px3 = _mm_loadu_si128( (__m128i*)( src + width * 3 ) );

        src += 4;
        if( ++i == width/4 )
        {
            src += width * 3;
            i = 0;
        }

        *ptr++ = ProcessAlpha_SSE( px0, px1, px2, px3 );

        const uint64_t c = ProcessRGB_SSE( px0, px1, px2, px3 );
        uint8_t fix[8];
        int j;

        memcpy( fix, &c, 8 );
        for( j=4; j<8; j++ ) fix[j] = DxtcIndexTable[fix[j]];
        memcpy( ptr, fix, sizeof( uint64_t ) );
        ptr++;
#else
        uint32_t rgba[4*4];
        uint8_t alpha[4*4];
        int j;

        char * tmp = (char*)rgba;
        memcpy( tmp,        src + width * 0, 4*4 );
        memcpy( tmp + 4*4,  src + width * 1, 4*4 );
        memcpy( tmp + 8*4,  src + width * 2, 4*4 );
        memcpy( tmp + 12*4, src + width * 3, 4*4 );
        src += 4;
        if( ++i == width/4 )
        {
            src += width * 3;
            i = 0;
        }

        for( j=0; j<16; j++ )
        {
            alpha[j] = rgba[j] >> 24;
            rgba[j] &= 0xFFFFFF;
        }
        *ptr++ = ProcessAlpha_DXTC( alpha );

        const uint64_t c = ProcessRGB_DXTC( (uint8_t*)rgba );
        uint8_t fix[8];
        memcpy( fix, &c, 8 );
        for( j=4; j<8; j++ ) fix[j] = DxtcIndexTable[fix[j]];
        memcpy( ptr, fix, sizeof( uint64_t ) );
        ptr++;
#endif
    }
    while( --blocks );
}

// Input pixelData is actually PixelFormat::ColorRGBA (as in PNG)
/*extern "C"*/ __attribute__((visibility("default"))) void * etc2Compress(float * pixelData, unsigned int width, unsigned int height,
   unsigned int * dSize, unsigned int * dw, unsigned int * dh, int format) /* format = 0: etc2/rgba, 1: dxt5 */
{
   int w = (width  < 4) ? 4 : (width  + 3) & ~3;
   int h = (height < 4) ? 4 : (height + 3) & ~3;
   int numBlocks = (w * h) / 16;
   int size = numBlocks * 16; // 128 bit per 4x4 block in RGBA mode
   uint64_t * cData = (uint64_t *)malloc(size);
   int freeData = 0;

   if(w > width || h > height)
   {
      float * data = malloc(w * h * 4);
      int fx = w / width, fy = h / height;
      int x, y;

      for(y = 0; y < h; y++)
         for(x = 0; x < w; x++)
         {
            int sy = y / fy; if(sy >= height) sy = height-1;
            int sx = x / fx; if(sx >= width)  sx = width-1;
            data[y * w + x] = pixelData[sy * width + sx];
         }
      freeData = 1;
      pixelData = data;
   }

   if(format == 0)
      CompressEtc2Rgba((uint32_t *)(void *)pixelData, cData, numBlocks, w);
   else
      CompressDxt5((uint32_t *)(void *)pixelData, cData, numBlocks, w);

   if(dw) *dw = w;
   if(dh) *dh = h;
   if(dSize) *dSize = size;
   if(freeData) free(pixelData);
   return cData;
}

/*extern "C" */__attribute__((visibility("default"))) void * etc2Alloc(size_t size)
{
   return malloc(size);
}

/*extern "C" */__attribute__((visibility("default"))) void etc2Free(void * data)
{
   free(data);
}
