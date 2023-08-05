/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/

#ifndef CC_H
#define CC_H

#include <stdarg.h>
#include <stdint.h>
#include <math.h>

#include "cpuconfig.h"

#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__)
asm(".symver pow,pow@GLIBC_2.2.5");
asm(".symver log,log@GLIBC_2.2.5");
asm(".symver exp,exp@GLIBC_2.2.5");
#endif

#if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux)
 #define CC_LINUX (1)
 #define CC_UNIX (1)
#elif defined(__APPLE__)
 #define CC_OSX (1)
 #define CC_UNIX (1)
#elif defined(__unix__) || defined(__unix) || defined(unix)
 #define CC_UNIX (1)
#elif defined(_WIN64) || defined(__WIN64__) || defined(WIN64)
 #define CC_WIN64 (1)
 #define CC_WIN32 (1)
 #define CC_WINDOWS (1)
#elif defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
 #define CC_WIN32 (1)
 #define CC_WINDOWS (1)
#endif

#if CC_UNIX || defined(__MINGW32__)
#include <sys/time.h>
#endif

#if CC_WINDOWS

#if defined(__UWP__) || !defined(__MINGW32__)
/*
struct timeval
{
   long tv_sec;
   long tv_usec;
};
*/
#define WIN32_LEAN_AND_MEAN
#define Size Size_
#define Alignment Alignment_
#define String String_
#define String2 String2_
#define Arc Arc_
#define Polygon Polygon_
#define Ellipse Ellipse_
#include <winsock.h>
#undef Arc
#undef Ellipse
#undef Polygon
#undef Size
#undef Alignment
#undef String
#undef String2
#endif

#if !defined(ssize_t) && !defined(__MINGW32__)
#if defined(_WIN64)
#define ssize_t long long
#else
#define ssize_t long
#endif
#endif

#endif
////


#ifndef ADDRESS
 #define ADDRESS(p,o) ((void *)(((char *)p)+(o)))
#endif

#ifndef ADDRESSDIFF
 #define ADDRESSDIFF(a,b) (((char *)a)-((char *)b))
#endif

#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
 #define CC_NOINLINE __attribute__((noinline))
 #define CC_ALWAYSINLINE __attribute__((always_inline)) __attribute__((unused))
 #define CC_LIKELY(x) __builtin_expect(!!(x), 1)
 #define CC_UNLIKELY(x) __builtin_expect(!!(x), 0)
 #define CC_UNUSED __attribute__((unused))
 #define CC_DEPRECATED __attribute__((deprecated))
 #define CC_DEPRECATED_MSG(x) __attribute__((deprecated(x)))
 #define MM_UNREACHABLE __builtin_unreachable()
#elif defined(_MSC_VER)
 #define CC_NOINLINE __declspec(noinline)
 #define CC_ALWAYSINLINE __forceinline
 #define CC_LIKELY(x) (x)
 #define CC_UNLIKELY(x) (x)
 #define CC_UNUSED
 #define CC_DEPRECATED _declspec(deprecated)
 #define CC_DEPRECATED_MSG(x) _declspec(deprecated(x))
 #define MM_UNREACHABLE _assume(0)
 #ifndef inline
  #define inline __inline
 #endif
 #ifndef restrict
  #define restrict __restrict
 #endif
 #ifndef ssize_t
  #if CC_ARCH_AMD64
   #define ssize_t int64_t
  #else
   #define ssize_t int32_t
  #endif
 #endif
#else
 #define CC_NOINLINE
 #define CC_ALWAYSINLINE
 #define CC_LIKELY(x) (x)
 #define CC_UNLIKELY(x) (x)
 #define CC_UNUSED
 #define CC_DEPRECATED
 #define CC_DEPRECATED_MSG(x)
 #define MM_UNREACHABLE
#endif

#if CC_UNIX
 #define CC_DIR_SEPARATOR_CHAR '/'
 #define CC_DIR_SEPARATOR_STRING "/"
#elif CC_WINDOWS
 #define CC_DIR_SEPARATOR_CHAR '\\'
 #define CC_DIR_SEPARATOR_STRING "\\"
#else
 #define CC_DIR_SEPARATOR_CHAR '/'
 #define CC_DIR_SEPARATOR_STRING "/"
#endif

#if CC_WINDOWS
 #define CC_LL "I64"
 #define CC_LLD "%I64d"
 #define CC_LLU "%I64u"
 #define CC_LLX "%I64x"
#else
 #define CC_LL "ll"
 #define CC_LLD "%lld"
 #define CC_LLU "%llu"
 #define CC_LLX "%llx"
#endif

#define CC_SIZEOF_ALIGN4(x) ((sizeof(x)+0x3)&~0x3)
#define CC_SIZEOF_ALIGN8(x) ((sizeof(x)+0x7)&~0x7)
#define CC_SIZEOF_ALIGN16(x) ((sizeof(x)+0xF)&~0xF)
#define CC_SIZEOF_ALIGN32(x) ((sizeof(x)+0x1F)&~0x1F)
#define CC_SIZEOF_ALIGN64(x) ((sizeof(x)+0x3F)&~0x3F)


////


#define CC_MIN(x,y) ((x)>(y)?(y):(x))
#define CC_MAX(x,y) ((x)<(y)?(y):(x))
#define CC_CLAMP(x,min,max) ((x)<(min)?(min):((x)>(max)?(max):(x)))


#define CC_MAX_INT8(x,y) (((int8_t)x)-((((int8_t)x)-((int8_t)y))&((((int8_t)x)-((int8_t)y))>>7)))
#define CC_MAX_INT16(x,y) (((int16_t)x)-((((int16_t)x)-((int16_t)y))&((((int16_t)x)-((int16_t)y))>>15)))
#define CC_MAX_INT32(x,y) (((int32_t)x)-((((int32_t)x)-((int32_t)y))&((((int32_t)x)-((int32_t)y))>>31)))
#define CC_MAX_INT64(x,y) (((int64_t)x)-((((int64_t)x)-((int64_t)y))&((((int64_t)x)-((int64_t)y))>>63)))

#define CC_MIN_INT8(x,y) (((int8_t)y)+((((int8_t)x)-((int8_t)y))&((((int8_t)x)-((int8_t)y))>>7)))
#define CC_MIN_INT16(x,y) (((int16_t)y)+((((int16_t)x)-((int16_t)y))&((((int16_t)x)-((int16_t)y))>>15)))
#define CC_MIN_INT32(x,y) (((int32_t)y)+((((int32_t)x)-((int32_t)y))&((((int32_t)x)-((int32_t)y))>>31)))
#define CC_MIN_INT64(x,y) (((int64_t)y)+((((int64_t)x)-((int64_t)y))&((((int64_t)x)-((int64_t)y))>>63)))

#define CC_SHIFTDIV_INT8(value,shift) ({uint8_t _s=((uint8_t)value)>>7;((int8_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT16(value,shift) ({uint16_t _s=((uint16_t)value)>>15;((int16_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT32(value,shift) ({uint32_t _s=((uint32_t)value)>>31;((int32_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT64(value,shift) ({uint64_t _s=((uint64_t)value)>>63;((int64_t)((value)+(_s<<shift)-_s))>>shift;})

#define CC_SHIFTDIVROUND(value,shift) ((value>>shift)+(((value&((1<<shift)-1))<<1)>=(1<<shift)))

#define CC_SHIFTDIVROUND_INT8(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint8_t)value>>7))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT16(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint16_t)value>>15))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT32(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint32_t)value>>31))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT64(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint64_t)value>>63))<<1)>=(1<<shift)))


#define CC_NUMBITS2(n) ((n&2)?1:0)
#define CC_NUMBITS4(n) ((n&(0xC))?(2+CC_NUMBITS2(n>>2)):(CC_NUMBITS2(n)))
#define CC_NUMBITS8(n) ((n&0xF0)?(4+CC_NUMBITS4(n>>4)):(CC_NUMBITS4(n)))
#define CC_NUMBITS16(n) ((n&0xFF00)?(8+CC_NUMBITS8(n>>8)):(CC_NUMBITS8(n)))
#define CC_NUMBITS32(n) ((n&0xFFFF0000)?(16+CC_NUMBITS16(n>>16)):(CC_NUMBITS16(n)))
#define CC_NUMBITS(n) (n==0?0:CC_NUMBITS32(n)+1)


////


#define CC_STRINGIFY_IN(s) #s
#define CC_STRINGIFY(s) CC_STRINGIFY_IN(s)

#define CC_CONCATENATE_IN(s,n) s ## n
#define CC_CONCATENATE(s,n) CC_CONCATENATE_IN(s,n)

#define CC_STRINGIFY_BYTE_0 "\x00"
#define CC_STRINGIFY_BYTE_1 "\x01"
#define CC_STRINGIFY_BYTE_2 "\x02"
#define CC_STRINGIFY_BYTE_3 "\x03"
#define CC_STRINGIFY_BYTE_4 "\x04"
#define CC_STRINGIFY_BYTE_5 "\x05"
#define CC_STRINGIFY_BYTE_6 "\x06"
#define CC_STRINGIFY_BYTE_7 "\x07"
#define CC_STRINGIFY_BYTE_8 "\x08"
#define CC_STRINGIFY_BYTE_9 "\x09"
#define CC_STRINGIFY_BYTE_10 "\x0a"
#define CC_STRINGIFY_BYTE_11 "\x0b"
#define CC_STRINGIFY_BYTE_12 "\x0c"
#define CC_STRINGIFY_BYTE_13 "\x0d"
#define CC_STRINGIFY_BYTE_14 "\x0e"
#define CC_STRINGIFY_BYTE_15 "\x0f"
#define CC_STRINGIFY_BYTE_16 "\x10"
#define CC_STRINGIFY_BYTE_17 "\x11"
#define CC_STRINGIFY_BYTE_18 "\x12"
#define CC_STRINGIFY_BYTE_19 "\x13"
#define CC_STRINGIFY_BYTE_20 "\x14"
#define CC_STRINGIFY_BYTE_21 "\x15"
#define CC_STRINGIFY_BYTE_22 "\x16"
#define CC_STRINGIFY_BYTE_23 "\x17"
#define CC_STRINGIFY_BYTE_24 "\x18"
#define CC_STRINGIFY_BYTE_25 "\x19"
#define CC_STRINGIFY_BYTE_26 "\x1a"
#define CC_STRINGIFY_BYTE_27 "\x1b"
#define CC_STRINGIFY_BYTE_28 "\x1c"
#define CC_STRINGIFY_BYTE_29 "\x1d"
#define CC_STRINGIFY_BYTE_30 "\x1e"
#define CC_STRINGIFY_BYTE_31 "\x1f"
#define CC_STRINGIFY_BYTE_32 "\x20"
#define CC_STRINGIFY_BYTE_33 "\x21"
#define CC_STRINGIFY_BYTE_34 "\x22"
#define CC_STRINGIFY_BYTE_35 "\x23"
#define CC_STRINGIFY_BYTE_36 "\x24"
#define CC_STRINGIFY_BYTE_37 "\x25"
#define CC_STRINGIFY_BYTE_38 "\x26"
#define CC_STRINGIFY_BYTE_39 "\x27"
#define CC_STRINGIFY_BYTE_40 "\x28"
#define CC_STRINGIFY_BYTE_41 "\x29"
#define CC_STRINGIFY_BYTE_42 "\x2a"
#define CC_STRINGIFY_BYTE_43 "\x2b"
#define CC_STRINGIFY_BYTE_44 "\x2c"
#define CC_STRINGIFY_BYTE_45 "\x2d"
#define CC_STRINGIFY_BYTE_46 "\x2e"
#define CC_STRINGIFY_BYTE_47 "\x2f"
#define CC_STRINGIFY_BYTE_48 "\x30"
#define CC_STRINGIFY_BYTE_49 "\x31"
#define CC_STRINGIFY_BYTE_50 "\x32"
#define CC_STRINGIFY_BYTE_51 "\x33"
#define CC_STRINGIFY_BYTE_52 "\x34"
#define CC_STRINGIFY_BYTE_53 "\x35"
#define CC_STRINGIFY_BYTE_54 "\x36"
#define CC_STRINGIFY_BYTE_55 "\x37"
#define CC_STRINGIFY_BYTE_56 "\x38"
#define CC_STRINGIFY_BYTE_57 "\x39"
#define CC_STRINGIFY_BYTE_58 "\x3a"
#define CC_STRINGIFY_BYTE_59 "\x3b"
#define CC_STRINGIFY_BYTE_60 "\x3c"
#define CC_STRINGIFY_BYTE_61 "\x3d"
#define CC_STRINGIFY_BYTE_62 "\x3e"
#define CC_STRINGIFY_BYTE_63 "\x3f"
#define CC_STRINGIFY_BYTE_64 "\x40"
#define CC_STRINGIFY_BYTE_65 "\x41"
#define CC_STRINGIFY_BYTE_66 "\x42"
#define CC_STRINGIFY_BYTE_67 "\x43"
#define CC_STRINGIFY_BYTE_68 "\x44"
#define CC_STRINGIFY_BYTE_69 "\x45"
#define CC_STRINGIFY_BYTE_70 "\x46"
#define CC_STRINGIFY_BYTE_71 "\x47"
#define CC_STRINGIFY_BYTE_72 "\x48"
#define CC_STRINGIFY_BYTE_73 "\x49"
#define CC_STRINGIFY_BYTE_74 "\x4a"
#define CC_STRINGIFY_BYTE_75 "\x4b"
#define CC_STRINGIFY_BYTE_76 "\x4c"
#define CC_STRINGIFY_BYTE_77 "\x4d"
#define CC_STRINGIFY_BYTE_78 "\x4e"
#define CC_STRINGIFY_BYTE_79 "\x4f"
#define CC_STRINGIFY_BYTE_80 "\x50"
#define CC_STRINGIFY_BYTE_81 "\x51"
#define CC_STRINGIFY_BYTE_82 "\x52"
#define CC_STRINGIFY_BYTE_83 "\x53"
#define CC_STRINGIFY_BYTE_84 "\x54"
#define CC_STRINGIFY_BYTE_85 "\x55"
#define CC_STRINGIFY_BYTE_86 "\x56"
#define CC_STRINGIFY_BYTE_87 "\x57"
#define CC_STRINGIFY_BYTE_88 "\x58"
#define CC_STRINGIFY_BYTE_89 "\x59"
#define CC_STRINGIFY_BYTE_90 "\x5a"
#define CC_STRINGIFY_BYTE_91 "\x5b"
#define CC_STRINGIFY_BYTE_92 "\x5c"
#define CC_STRINGIFY_BYTE_93 "\x5d"
#define CC_STRINGIFY_BYTE_94 "\x5e"
#define CC_STRINGIFY_BYTE_95 "\x5f"
#define CC_STRINGIFY_BYTE_96 "\x60"
#define CC_STRINGIFY_BYTE_97 "\x61"
#define CC_STRINGIFY_BYTE_98 "\x62"
#define CC_STRINGIFY_BYTE_99 "\x63"
#define CC_STRINGIFY_BYTE_100 "\x64"
#define CC_STRINGIFY_BYTE_101 "\x65"
#define CC_STRINGIFY_BYTE_102 "\x66"
#define CC_STRINGIFY_BYTE_103 "\x67"
#define CC_STRINGIFY_BYTE_104 "\x68"
#define CC_STRINGIFY_BYTE_105 "\x69"
#define CC_STRINGIFY_BYTE_106 "\x6a"
#define CC_STRINGIFY_BYTE_107 "\x6b"
#define CC_STRINGIFY_BYTE_108 "\x6c"
#define CC_STRINGIFY_BYTE_109 "\x6d"
#define CC_STRINGIFY_BYTE_110 "\x6e"
#define CC_STRINGIFY_BYTE_111 "\x6f"
#define CC_STRINGIFY_BYTE_112 "\x70"
#define CC_STRINGIFY_BYTE_113 "\x71"
#define CC_STRINGIFY_BYTE_114 "\x72"
#define CC_STRINGIFY_BYTE_115 "\x73"
#define CC_STRINGIFY_BYTE_116 "\x74"
#define CC_STRINGIFY_BYTE_117 "\x75"
#define CC_STRINGIFY_BYTE_118 "\x76"
#define CC_STRINGIFY_BYTE_119 "\x77"
#define CC_STRINGIFY_BYTE_120 "\x78"
#define CC_STRINGIFY_BYTE_121 "\x79"
#define CC_STRINGIFY_BYTE_122 "\x7a"
#define CC_STRINGIFY_BYTE_123 "\x7b"
#define CC_STRINGIFY_BYTE_124 "\x7c"
#define CC_STRINGIFY_BYTE_125 "\x7d"
#define CC_STRINGIFY_BYTE_126 "\x7e"
#define CC_STRINGIFY_BYTE_127 "\x7f"
#define CC_STRINGIFY_BYTE_128 "\x80"
#define CC_STRINGIFY_BYTE_129 "\x81"
#define CC_STRINGIFY_BYTE_130 "\x82"
#define CC_STRINGIFY_BYTE_131 "\x83"
#define CC_STRINGIFY_BYTE_132 "\x84"
#define CC_STRINGIFY_BYTE_133 "\x85"
#define CC_STRINGIFY_BYTE_134 "\x86"
#define CC_STRINGIFY_BYTE_135 "\x87"
#define CC_STRINGIFY_BYTE_136 "\x88"
#define CC_STRINGIFY_BYTE_137 "\x89"
#define CC_STRINGIFY_BYTE_138 "\x8a"
#define CC_STRINGIFY_BYTE_139 "\x8b"
#define CC_STRINGIFY_BYTE_140 "\x8c"
#define CC_STRINGIFY_BYTE_141 "\x8d"
#define CC_STRINGIFY_BYTE_142 "\x8e"
#define CC_STRINGIFY_BYTE_143 "\x8f"
#define CC_STRINGIFY_BYTE_144 "\x90"
#define CC_STRINGIFY_BYTE_145 "\x91"
#define CC_STRINGIFY_BYTE_146 "\x92"
#define CC_STRINGIFY_BYTE_147 "\x93"
#define CC_STRINGIFY_BYTE_148 "\x94"
#define CC_STRINGIFY_BYTE_149 "\x95"
#define CC_STRINGIFY_BYTE_150 "\x96"
#define CC_STRINGIFY_BYTE_151 "\x97"
#define CC_STRINGIFY_BYTE_152 "\x98"
#define CC_STRINGIFY_BYTE_153 "\x99"
#define CC_STRINGIFY_BYTE_154 "\x9a"
#define CC_STRINGIFY_BYTE_155 "\x9b"
#define CC_STRINGIFY_BYTE_156 "\x9c"
#define CC_STRINGIFY_BYTE_157 "\x9d"
#define CC_STRINGIFY_BYTE_158 "\x9e"
#define CC_STRINGIFY_BYTE_159 "\x9f"
#define CC_STRINGIFY_BYTE_160 "\xa0"
#define CC_STRINGIFY_BYTE_161 "\xa1"
#define CC_STRINGIFY_BYTE_162 "\xa2"
#define CC_STRINGIFY_BYTE_163 "\xa3"
#define CC_STRINGIFY_BYTE_164 "\xa4"
#define CC_STRINGIFY_BYTE_165 "\xa5"
#define CC_STRINGIFY_BYTE_166 "\xa6"
#define CC_STRINGIFY_BYTE_167 "\xa7"
#define CC_STRINGIFY_BYTE_168 "\xa8"
#define CC_STRINGIFY_BYTE_169 "\xa9"
#define CC_STRINGIFY_BYTE_170 "\xaa"
#define CC_STRINGIFY_BYTE_171 "\xab"
#define CC_STRINGIFY_BYTE_172 "\xac"
#define CC_STRINGIFY_BYTE_173 "\xad"
#define CC_STRINGIFY_BYTE_174 "\xae"
#define CC_STRINGIFY_BYTE_175 "\xaf"
#define CC_STRINGIFY_BYTE_176 "\xb0"
#define CC_STRINGIFY_BYTE_177 "\xb1"
#define CC_STRINGIFY_BYTE_178 "\xb2"
#define CC_STRINGIFY_BYTE_179 "\xb3"
#define CC_STRINGIFY_BYTE_180 "\xb4"
#define CC_STRINGIFY_BYTE_181 "\xb5"
#define CC_STRINGIFY_BYTE_182 "\xb6"
#define CC_STRINGIFY_BYTE_183 "\xb7"
#define CC_STRINGIFY_BYTE_184 "\xb8"
#define CC_STRINGIFY_BYTE_185 "\xb9"
#define CC_STRINGIFY_BYTE_186 "\xba"
#define CC_STRINGIFY_BYTE_187 "\xbb"
#define CC_STRINGIFY_BYTE_188 "\xbc"
#define CC_STRINGIFY_BYTE_189 "\xbd"
#define CC_STRINGIFY_BYTE_190 "\xbe"
#define CC_STRINGIFY_BYTE_191 "\xbf"
#define CC_STRINGIFY_BYTE_192 "\xc0"
#define CC_STRINGIFY_BYTE_193 "\xc1"
#define CC_STRINGIFY_BYTE_194 "\xc2"
#define CC_STRINGIFY_BYTE_195 "\xc3"
#define CC_STRINGIFY_BYTE_196 "\xc4"
#define CC_STRINGIFY_BYTE_197 "\xc5"
#define CC_STRINGIFY_BYTE_198 "\xc6"
#define CC_STRINGIFY_BYTE_199 "\xc7"
#define CC_STRINGIFY_BYTE_200 "\xc8"
#define CC_STRINGIFY_BYTE_201 "\xc9"
#define CC_STRINGIFY_BYTE_202 "\xca"
#define CC_STRINGIFY_BYTE_203 "\xcb"
#define CC_STRINGIFY_BYTE_204 "\xcc"
#define CC_STRINGIFY_BYTE_205 "\xcd"
#define CC_STRINGIFY_BYTE_206 "\xce"
#define CC_STRINGIFY_BYTE_207 "\xcf"
#define CC_STRINGIFY_BYTE_208 "\xd0"
#define CC_STRINGIFY_BYTE_209 "\xd1"
#define CC_STRINGIFY_BYTE_210 "\xd2"
#define CC_STRINGIFY_BYTE_211 "\xd3"
#define CC_STRINGIFY_BYTE_212 "\xd4"
#define CC_STRINGIFY_BYTE_213 "\xd5"
#define CC_STRINGIFY_BYTE_214 "\xd6"
#define CC_STRINGIFY_BYTE_215 "\xd7"
#define CC_STRINGIFY_BYTE_216 "\xd8"
#define CC_STRINGIFY_BYTE_217 "\xd9"
#define CC_STRINGIFY_BYTE_218 "\xda"
#define CC_STRINGIFY_BYTE_219 "\xdb"
#define CC_STRINGIFY_BYTE_220 "\xdc"
#define CC_STRINGIFY_BYTE_221 "\xdd"
#define CC_STRINGIFY_BYTE_222 "\xde"
#define CC_STRINGIFY_BYTE_223 "\xdf"
#define CC_STRINGIFY_BYTE_224 "\xe0"
#define CC_STRINGIFY_BYTE_225 "\xe1"
#define CC_STRINGIFY_BYTE_226 "\xe2"
#define CC_STRINGIFY_BYTE_227 "\xe3"
#define CC_STRINGIFY_BYTE_228 "\xe4"
#define CC_STRINGIFY_BYTE_229 "\xe5"
#define CC_STRINGIFY_BYTE_230 "\xe6"
#define CC_STRINGIFY_BYTE_231 "\xe7"
#define CC_STRINGIFY_BYTE_232 "\xe8"
#define CC_STRINGIFY_BYTE_233 "\xe9"
#define CC_STRINGIFY_BYTE_234 "\xea"
#define CC_STRINGIFY_BYTE_235 "\xeb"
#define CC_STRINGIFY_BYTE_236 "\xec"
#define CC_STRINGIFY_BYTE_237 "\xed"
#define CC_STRINGIFY_BYTE_238 "\xee"
#define CC_STRINGIFY_BYTE_239 "\xef"
#define CC_STRINGIFY_BYTE_240 "\xf0"
#define CC_STRINGIFY_BYTE_241 "\xf1"
#define CC_STRINGIFY_BYTE_242 "\xf2"
#define CC_STRINGIFY_BYTE_243 "\xf3"
#define CC_STRINGIFY_BYTE_244 "\xf4"
#define CC_STRINGIFY_BYTE_245 "\xf5"
#define CC_STRINGIFY_BYTE_246 "\xf6"
#define CC_STRINGIFY_BYTE_247 "\xf7"
#define CC_STRINGIFY_BYTE_248 "\xf8"
#define CC_STRINGIFY_BYTE_249 "\xf9"
#define CC_STRINGIFY_BYTE_250 "\xfa"
#define CC_STRINGIFY_BYTE_251 "\xfb"
#define CC_STRINGIFY_BYTE_252 "\xfc"
#define CC_STRINGIFY_BYTE_253 "\xfd"
#define CC_STRINGIFY_BYTE_254 "\xfe"
#define CC_STRINGIFY_BYTE_255 "\xff"
#define CC_STRINGIFY_BYTE(x) CC_STRINGIFY_BYTE_##x


////


enum
{
  CC_TYPE_UINT8,
  CC_TYPE_INT8,
  CC_TYPE_UINT16,
  CC_TYPE_INT16,
  CC_TYPE_UINT32,
  CC_TYPE_INT32,
  CC_TYPE_UINT64,
  CC_TYPE_INT64,
  CC_TYPE_FLOAT,
  CC_TYPE_DOUBLE,

  CC_TYPE_COUNT
};

extern const size_t ccTypeSize[CC_TYPE_COUNT];


////


uint32_t ccHash32Data( void *data, int size );
uint32_t ccHash32Int32( uint32_t data );
uint32_t ccHash32Int64( uint64_t data );
uint32_t ccHash32Array32( uint32_t *data, int count );
uint32_t ccHash32Array64( uint64_t *data, int count );

static inline CC_ALWAYSINLINE uint32_t ccHash32Int16Inline( uint32_t i )
{
  uint32_t hash;
  hash = ( i << 16 ) ^ i;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Int32Inline( uint32_t i )
{
  uint32_t hash;
  hash = i & 0xFFFF;
  hash = ( ( hash << 16 ) ^ hash ) ^ ( ( i & 0xFFFF0000 ) >> 5 );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Int64Inline( uint64_t i )
{
  uint32_t hash;
  hash = (uint32_t)(i & 0xFFFF);
  hash = ( ( hash << 16 ) ^ hash ) ^ ( ( (uint32_t)( i >> 16 ) & 0xFFFF ) << 11 );
  hash += ( hash >> 11 ) + ( (uint32_t)( i >> 32 ) & 0xFFFF );
  hash = ( ( hash << 16 ) ^ hash ) ^ (uint32_t)( ( i >> 37 ) & 0x7FFF800 );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data3Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash ^= hash << 16;
  hash ^= (uint32_t)data[2] << 18;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data4Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data5Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += (uint32_t)data[4];
  hash ^= hash << 10;
  hash += hash >> 1;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data6Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash ^= hash << 11;
  hash += hash >> 17;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data7Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  data = ADDRESS( data, 4 );
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash ^= hash << 16;
  hash ^= (uint32_t)data[6] << 18;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Data8Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[7] << 19 ) | ( (uint32_t)data[6] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}


////


typedef struct
{
  uint32_t a;
  uint32_t b;
  uint32_t c;
  uint32_t d;
} ccQuickRandState32;

static inline CC_ALWAYSINLINE uint32_t ccQuickRand32( ccQuickRandState32 *randstate )
{
  uint32_t e;
  e = randstate->a - ( ( randstate->b << 27 ) | ( randstate->b >> (32-27) ) );
  randstate->a = randstate->b ^ ( ( randstate->c << 17 ) | ( randstate->c >> (32-17) ) );
  randstate->b = randstate->c + randstate->d;
  randstate->c = randstate->d + e;
  randstate->d = e + randstate->a;
  return randstate->d;
}

static inline CC_ALWAYSINLINE void ccQuickRand32Seed( ccQuickRandState32 *randstate, uint32_t seed )
{
  uint32_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed;
  randstate->c = seed;
  randstate->d = seed;
  for( i = 0 ; i < 20 ; i++ )
    ccQuickRand32( randstate );
  return;
}

static inline CC_ALWAYSINLINE void ccQuickRand32SeedFast( ccQuickRandState32 *randstate, uint32_t seed0, uint32_t seed1, uint32_t seed2 )
{
  uint32_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed0;
  randstate->c = seed1;
  randstate->d = seed2;
  for( i = 0 ; i < 4 ; i++ )
    ccQuickRand32( randstate );
  return;
}


typedef struct
{
  uint64_t a;
  uint64_t b;
  uint64_t c;
  uint64_t d;
} ccQuickRandState64;

static inline CC_ALWAYSINLINE uint64_t ccQuickRand64( ccQuickRandState64 *randstate )
{
  uint64_t e;
  e = randstate->a - ( ( randstate->b << 7 ) | ( randstate->b >> (64-7) ) );
  randstate->a = randstate->b ^ ( ( randstate->c << 13 ) | ( randstate->c >> (64-13) ) );
  randstate->b = randstate->c + ( ( randstate->d << 37 ) | ( randstate->d >> (64-37) ) );
  randstate->c = randstate->d + e;
  randstate->d = e + randstate->a;
  return randstate->d;
}

static inline CC_ALWAYSINLINE void ccQuickRand64Seed( ccQuickRandState64 *randstate, uint64_t seed )
{
  uint64_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed;
  randstate->c = seed;
  randstate->d = seed;
  for( i = 0 ; i < 20 ; i++ )
    ccQuickRand64( randstate );
  return;
}


////


int ccMemCmp( void *s0, void *s1, int size );
int ccMemCmp32( uint32_t *s0, uint32_t *s1, int count );
int ccMemCmp64( uint64_t *s0, uint64_t *s1, int count );
int ccMemCmpRetSize( void *s0, void *s1, int size );

static inline CC_ALWAYSINLINE int ccMemCmpInline( void *s0, void *s1, int size )
{
  int i;
  uint8_t *t0, *t1;
  t0 = s0;
  t1 = s1;
  for( i = 0 ; i < size ; i++ )
  {
    if( t0[i] != t1[i] )
      return 0;
  }
  return 1;
}

static inline CC_ALWAYSINLINE int ccMemCmpSizeInline( void *s0, void *s1, int size )
{
  int i;
  uint8_t *t0, *t1;
  t0 = s0;
  t1 = s1;
  for( i = 0 ; i < size ; i++ )
  {
    if( t0[i] != t1[i] )
      break;
  }
  return i;
}


////


uint8_t ccLog2Int8( uint8_t i );
uint16_t ccLog2Int16( uint16_t i );
uint32_t ccLog2Int32( uint32_t i );
uint64_t ccLog2Int64( uint64_t i );
#if CPUCONF_LONG_SIZE == 8
 #define ccLog2IntL(v) ccLog2Int64(v)
#else
 #define ccLog2IntL(v) ccLog2Int32(v)
#endif


////


static inline CC_ALWAYSINLINE int8_t ccPowInt8( int8_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return (int8_t)result;
}

static inline CC_ALWAYSINLINE int16_t ccPowInt16( int16_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return (int16_t)result;
}

static inline CC_ALWAYSINLINE int32_t ccPowInt32( int32_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return result;
}

static inline CC_ALWAYSINLINE int64_t ccPowInt64( int64_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return result;
}


////


static inline CC_ALWAYSINLINE uint8_t ccMergeIntMask8( uint8_t i0, uint8_t i1, uint8_t mask )
{
  return (uint8_t)(i0 ^ ( ( i0 ^ i1 ) & mask ));
}

static inline CC_ALWAYSINLINE uint16_t ccMergeIntMask16( uint16_t i0, uint16_t i1, uint16_t mask )
{
  return (uint16_t)(i0 ^ ( ( i0 ^ i1 ) & mask ));
}

static inline CC_ALWAYSINLINE uint32_t ccMergeIntMask32( uint32_t i0, uint32_t i1, uint32_t mask )
{
  return i0 ^ ( ( i0 ^ i1 ) & mask );
}

static inline CC_ALWAYSINLINE uint64_t ccMergeIntMask64( uint64_t i0, uint64_t i1, uint64_t mask )
{
  return i0 ^ ( ( i0 ^ i1 ) & mask );
}

#if CPUCONF_LONG_SIZE == 8
 #define ccMergeIntMaskL(v) ccMergeIntMask64(v)
#else
 #define ccMergeIntMaskL(v) ccMergeIntMask32(v)
#endif


////


static inline CC_ALWAYSINLINE int ccCountBits64( uint64_t i )
{
  int r;
  for( r = 0 ; i ; r++ )
    i &= i - 1;
  return r;
}


static inline CC_ALWAYSINLINE int ccCountBits32( uint32_t v )
{
  int c;
  v = v - ( ( v >> 1 ) & 0x55555555 );
  v = ( v & 0x33333333 ) + ( ( v >> 2 ) & 0x33333333 );
  c = ( ( ( v + ( v >> 4 ) ) & 0xF0F0F0F ) * 0x1010101 ) >> 24;
  return c;
}


////


static inline CC_ALWAYSINLINE int ccTrailingCount32( uint32_t v )
{
  int c;
  if( v & 0x1 )
    c = 0;
  else
  {
    c = 1;
    if( !( v & 0xffff ) )
    {
      v >>= 16;
      c += 16;
    }
    if( !( v & 0xff ) )
    {
      v >>= 8;
      c += 8;
    }
    if( !( v & 0xf ) )
    {
      v >>= 4;
      c += 4;
    }
    if( !( v & 0x3 ) )
    {
      v >>= 2;
      c += 2;
    }
    c -= v & 0x1;
  }
  return c;
}


static inline CC_ALWAYSINLINE int ccTrailingCount64( uint64_t v )
{
  int c;
  if( v & 0x1 )
    c = 0;
  else
  {
    c = 1;
    if( !( v & 0xffffffff ) )
    {
      v >>= 32;
      c += 32;
    }
    if( !( v & 0xffff ) )
    {
      v >>= 16;
      c += 16;
    }
    if( !( v & 0xff ) )
    {
      v >>= 8;
      c += 8;
    }
    if( !( v & 0xf ) )
    {
      v >>= 4;
      c += 4;
    }
    if( !( v & 0x3 ) )
    {
      v >>= 2;
      c += 2;
    }
    c -= v & 0x1;
  }
  return c;
}


////


static inline CC_ALWAYSINLINE uint32_t ccReverseBits32( uint32_t value )
{
  uint32_t result;
  int shift;

  result = value;
  shift = 32-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;

  return result;
}

static inline CC_ALWAYSINLINE uint64_t ccReverseBits64( uint64_t value )
{
  uint64_t result;
  int shift;

  result = value;
  shift = 64-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;

  return result;
}

static inline CC_ALWAYSINLINE uint32_t ccReverseBitsVar32( uint32_t value, int numbits )
{
  uint32_t result;
  int shift;

  value &= ( ((uint32_t)1) << numbits ) - 1;
  result = value;
  shift = 32-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;
  result >>= 32 - numbits;

  return result;
}

static inline CC_ALWAYSINLINE uint64_t ccReverseBitsVar64( uint64_t value, int numbits )
{
  uint64_t result;
  int shift;

  value &= ( ((uint64_t)1) << numbits ) - 1;
  result = value;
  shift = 64-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;
  result >>= 64 - numbits;

  return result;
}


////


static inline CC_ALWAYSINLINE uint8_t ccIsPow2Int8( uint8_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline CC_ALWAYSINLINE uint16_t ccIsPow2Int16( uint16_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline CC_ALWAYSINLINE uint32_t ccIsPow2Int32( uint32_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline CC_ALWAYSINLINE uint64_t ccIsPow2Int64( uint64_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}


static inline CC_ALWAYSINLINE uint8_t ccPow2Round8( uint8_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v++;
  return v;
}

static inline CC_ALWAYSINLINE uint16_t ccPow2Round16( uint16_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v++;
  return v;
}

static inline CC_ALWAYSINLINE uint32_t ccPow2Round32( uint32_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v |= v >> 16;
  v++;
  return v;
}

static inline CC_ALWAYSINLINE uint64_t ccPow2Round64( uint64_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v |= v >> 16;
  v |= v >> 32;
  v++;
  return v;
}

#if CPUCONF_LONG_SIZE == 8
 #define ccPow2RoundL(v) ccPow2Round64(v)
#else
 #define ccPow2RoundL(v) ccPow2Round32(v)
#endif


////


static inline uint32_t ccDivMod10in32( uint32_t in, uint32_t *mod )
{
  uint32_t x, q, div;
  x = ( in | 1 ) - ( in >> 2 );
  q = ( x >> 4 ) + x;
  x = q;
  q = ( q >> 8 ) + x;
  q = ( q >> 16 ) + ( x >> 8 ) + x;
  q = ( q >> 8 ) + x;
  div = ( q >> 3 );
  *mod = in - ( ( q & ~0x7 ) + ( div << 1 ) );
  return div;
}


////


static inline CC_ALWAYSINLINE uint32_t ccTestNullByte32( uint32_t v )
{
  return ( v - 0x01010101 ) & ~v & 0x80808080;
}

static inline CC_ALWAYSINLINE uint64_t ccTestNullByte64( uint64_t v )
{
  return ( v - 0x0101010101010101ULL ) & ~v & 0x8080808080808080ULL;
}

static inline CC_ALWAYSINLINE uint32_t ccSignBit32( uint32_t v )
{
  return v >> 31;
}

static inline CC_ALWAYSINLINE uint64_t ccSignBit64( uint64_t v )
{
  return v >> 63;
}

static inline CC_ALWAYSINLINE uint32_t ccAbs32( int32_t v )
{
  int32_t mask;
  mask = v >> 31;
  return ( v ^ mask ) - mask;
}

static inline CC_ALWAYSINLINE uint64_t ccAbs64( int64_t v )
{
  int64_t mask;
  mask = (int32_t)(v >> 63);
  return ( v ^ mask ) - mask;
}


////


static inline CC_ALWAYSINLINE int32_t ccMortonNumber32( int32_t x, int32_t y )
{
  int i;
  uint32_t z;
  z = 0;
  for( i = 0 ; i < 16 ; i++ )
  {
    z |= ( x & ( ((uint32_t)1) << i ) ) << i;
    z |= ( y & ( ((uint32_t)1) << i ) ) << ( i + 1 );
  }
  return z;
}

static inline CC_ALWAYSINLINE int64_t ccMortonNumber64( int32_t x, int32_t y )
{
  int i;
  uint64_t z;
  z = 0;
  for( i = 0 ; i < 16 ; i++ )
  {
    z |= ( x & ( ((uint64_t)1) << i ) ) << i;
    z |= ( y & ( ((uint64_t)1) << i ) ) << ( i + 1 );
  }
  return z;
}


////


#define CC_FLT_INT_MAPPING

#if CPUCONF_FLOAT_SIZE == 4
typedef uint32_t ccuintf;
#elif CPUCONF_FLOAT_SIZE == 8
typedef uint64_t ccuintf;
#else
 #undef CC_FLT_INT_MAPPING
#endif

#if CPUCONF_DOUBLE_SIZE == 4
typedef uint32_t ccuintd;
#elif CPUCONF_DOUBLE_SIZE == 8
typedef uint64_t ccuintd;
#else
 #undef CC_FLT_INT_MAPPING
#endif


#ifdef CC_FLT_INT_MAPPING

static inline CC_ALWAYSINLINE ccuintf ccFloatToUint( float f )
{
  void *p = &f;
  return *((ccuintf *)p);
}

static inline CC_ALWAYSINLINE float ccUintToFloat( ccuintf f )
{
  void *p = &f;
  return *((float *)p);
}


static inline CC_ALWAYSINLINE ccuintd ccDoubleToUint( double d )
{
  void *p = &d;
  return *((ccuintd *)p);
}

static inline CC_ALWAYSINLINE double ccUintToDouble( ccuintd d )
{
  void *p = &d;
  return *((double *)p);
}

#endif


////


#define CC_LOG2_E 1.4426950408889634073599246810018921

static inline CC_ALWAYSINLINE float ccFastExpFloat( float x )
{
  union
  {
    uint32_t i;
    float f;
  } u;
  if( x > 88.0 )
    return expf( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int32_t)( x * ( (float)0x800000 * (float)CC_LOG2_E ) ) + ( 0x3f800000 - 486408 );
  return u.f;
}

static inline CC_ALWAYSINLINE float ccFastExpFloatNearZero( float x )
{
  union
  {
    uint32_t i;
    float f;
  } u;
  if( x > 88.0 )
    return expf( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int32_t)( x * ( (float)0x800000 * (float)CC_LOG2_E ) ) + 0x3f800000;
  return u.f;
}

static inline CC_ALWAYSINLINE double ccFastExpDouble( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  union
  {
    uint64_t i;
    double d;
  } u;
  if( x > 88.0 )
    return exp( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int64_t)( x * ( (double)0x10000000000000 * CC_LOG2_E ) ) + ( (uint64_t)0x3ff0000000000000 - (uint64_t)261138306564096 );
  return u.d;
#else
  union
  {
    uint32_t i[2];
    double d;
  } u;
  if( x > 88.0 )
    return expf( (float)x );
  else if( x < -80.0 )
    return 0.0;
 #ifdef CPUCONF_LITTLE_ENDIAN
  u.i[1] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + ( 0x3ff00000 - 60801 );
  u.i[0] = 0;
 #else
  u.i[0] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + ( 0x3ff00000 - 60801 );
  u.i[1] = 0;
 #endif
  return u.d;
#endif
}

static inline CC_ALWAYSINLINE double ccFastExpDoubleNearZero( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  union
  {
    uint64_t i;
    double d;
  } u;
  if( x > 88.0 )
    return exp( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int64_t)( x * ( (double)0x10000000000000 * CC_LOG2_E ) ) + (uint64_t)0x3ff0000000000000;
  return u.d;
#else
  union
  {
    uint32_t i[2];
    double d;
  } u;
  if( x > 88.0 )
    return expf( (float)x );
  else if( x < -80.0 )
    return 0.0;
 #ifdef CPUCONF_LITTLE_ENDIAN
  u.i[1] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + 0x3ff00000;
  u.i[0] = 0;
 #else
  u.i[0] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + 0x3ff00000;
  u.i[1] = 0;
 #endif
  return u.d;
#endif
}


////


static inline CC_ALWAYSINLINE float ccFastLog2Float( float x )
{
  int base;
  union
  {
    uint32_t i;
    float f;
  } u;
  u.f = x;
  base = ( ( u.i >> 23 ) & 0xff ) - 0x80;
  u.i &= ~( (uint32_t)0xff << 23 );
  u.i += (uint32_t)0x7f << 23;
  return (float)base + ( u.f * ( 2.0f + u.f * ( -1.0f/3.0f ) ) ) - ( 2.0f/3.0f );
}

static inline CC_ALWAYSINLINE float ccFastLog2Double( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  int base;
  union
  {
    uint64_t i;
    double f;
  } u;
  u.f = x;
  base = (int)(( ( u.i >> 52 ) & 0x7ff ) - 0x400);
  u.i &= ~( (uint64_t)0x7ff << 52 );
  u.i += (uint64_t)0x3ff << 52;
#else
  int base;
  union
  {
    uint32_t i[2];
    double f;
  } u;
  u.f = x;
  base = ( ( u.i[1] >> 20 ) & 0x7ff ) - 0x400;
  u.i[1] &= ~( (uint32_t)0x7ff << 20 );
  u.i[1] += (uint32_t)0x3ff << 20;
#endif
  return (double)base + ( u.f * ( 2.0 + u.f * ( -1.0/3.0 ) ) ) - ( 2.0/3.0 );
}


////


/* Only valid between -M_PI and M_PI */
static inline CC_ALWAYSINLINE float ccFastSinFloat( float x )
{
  float s;
  s = (float)(( 1.27323954474 * x ) + ( -0.405284734569 * x * fabsf( x ) ));
  return s;
}

/* Only valid between -M_PI and M_PI */
static inline CC_ALWAYSINLINE double ccFastSinDouble( double x )
{
  double s;
  s = ( 1.27323954474 * x ) + ( -0.405284734569 * x * fabs( x ) );
  return s;
}


////


#define CC_INT16_BSWAP(i) (__extension__({uint16_t bsw=(i);((bsw&0xff)<<8)|(bsw>>8);}))
#define CC_INT32_BSWAP(i) (__extension__({uint32_t bsw=(i);(bsw<<24)|((bsw&0xff00)<<8)|((bsw>>8)&0xff00)|(bsw>>24);}))
#define CC_INT64_BSWAP(i) (__extension__({uint64_t bsw=(i);(bsw>>56)|((bsw&0x00ff000000000000LL)>>40)|((bsw&0x0000ff0000000000LL)>>24)|((bsw&0x000000ff00000000LL)>>8)|((bsw&0x00000000ff000000LL)<<8)|((bsw&0x0000000000ff0000LL)<<24)|((bsw&0x000000000000ff00LL)<<40)|(bsw<<56);}))


static inline CC_ALWAYSINLINE uint16_t ccByteSwap16( uint16_t i )
{
  return (uint16_t)(CC_INT16_BSWAP( i ));
}

#if defined(__GNUC__) && defined(__i386__)

static inline CC_ALWAYSINLINE uint32_t ccByteSwap32( uint32_t i )
{
  __asm__( "bswap %0" : "=r" (i) : "0" (i) );
  return i;
}

static inline CC_ALWAYSINLINE uint64_t ccByteSwap64( uint64_t i )
{
  union {
    uint32_t s[2];
    uint64_t i;
  } u;
  u.i = i;
  __asm__( "bswapl %0 ; bswapl %1 ; xchgl %0,%1" : "=r" (u.s[0]), "=r" (u.s[1]) : "0" (u.s[0]), "1" (u.s[1]) );
  return u.i;
}

#elif defined(__GNUC__) && defined(__x86_64__)

static inline CC_ALWAYSINLINE uint32_t ccByteSwap32( uint32_t i )
{
  __asm__( "bswapl %0" : "=r" (i) : "0" (i) );
  return i;
}

static inline CC_ALWAYSINLINE uint64_t ccByteSwap64( uint64_t i )
{
  __asm__( "bswapq %0" : "=r" (i) : "0" (i) );
  return i;
}

#else

static inline CC_ALWAYSINLINE uint32_t ccByteSwap32( uint32_t i )
{
  return CC_INT32_BSWAP( i );
}

static inline CC_ALWAYSINLINE uint64_t ccByteSwap64( uint64_t i )
{
  return CC_INT64_BSWAP( i );
}

#endif

static inline CC_ALWAYSINLINE float ccByteSwapf( float f )
{
  uint32_t i;
  void *p;
  p = &f;
  i = ccByteSwap32( *((uint32_t *)p) );
  p = &i;
  return *((float *)p);
}

static inline CC_ALWAYSINLINE double ccByteSwapd( double f )
{
  uint64_t i;
  void *p;
  p = &f;
  i = ccByteSwap64( *((uint64_t *)p) );
  p = &i;
  return *((double *)p);
}


////


static inline CC_ALWAYSINLINE uint32_t ccAlignInt32( uint32_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
  return i + 1;
}

static inline CC_ALWAYSINLINE uint64_t ccAlignInt64( uint64_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
  i |= i >> 32;
  return i + 1;
}

static inline CC_ALWAYSINLINE uintptr_t ccAlignIntPtr( uintptr_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
#if CPUCONF_INTPTR_BITS > 32
  i |= i >> 32;
#endif
  return i + 1;
}


////


static inline CC_ALWAYSINLINE uint8_t ccRotateLeft8( uint8_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 8 - bits ) );
}

static inline CC_ALWAYSINLINE uint16_t ccRotateLeft16( uint16_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 16 - bits ) );
}

static inline CC_ALWAYSINLINE uint32_t ccRotateLeft32( uint32_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 32 - bits ) );
}

static inline CC_ALWAYSINLINE uint64_t ccRotateLeft64( uint64_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 64 - bits ) );
}


static inline CC_ALWAYSINLINE uint8_t ccRotateRight8( uint8_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 8 - bits ) );
}

static inline CC_ALWAYSINLINE uint16_t ccRotateRight16( uint16_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 16 - bits ) );
}

static inline CC_ALWAYSINLINE uint32_t ccRotateRight32( uint32_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 32 - bits ) );
}

static inline CC_ALWAYSINLINE uint64_t ccRotateRight64( uint64_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 64 - bits ) );
}


////


static inline CC_ALWAYSINLINE void ccQuickCipherPerm32( uint32_t *data, int datacount, uint32_t c0, uint32_t c1 )
{
  int i;
  uint32_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ( data[i] + c0accum ) ^ c1;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherPerm32Inv( uint32_t *data, int datacount, uint32_t c0, uint32_t c1 )
{
  int i;
  uint32_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ( data[i] ^ c1 ) - c0accum;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherRot32( uint32_t *data, int datacount, uint32_t c0, int rotbits )
{
  int i;
  uint32_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ccRotateLeft32( data[i] + c0accum, rotbits );
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherRot32Inv( uint32_t *data, int datacount, uint32_t c0, int rotbits )
{
  int i;
  uint32_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ccRotateRight32( data[i], rotbits ) - c0accum;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherMix32( uint32_t *data, int datacount, uint32_t mix, uint32_t c0, uint32_t c1 )
{
  int i;
  uint32_t block, newblock, carry, mixinv;
  mixinv = ~mix;
  block = data[datacount-1];
  carry = block & mix;
  for( i = 0 ; i < datacount ; i++ )
  {
    block = data[i];
    newblock = ( block & mixinv ) | carry;
    carry = block & mix;
    data[i] = ( newblock + c0 ) ^ c1;
  }
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherMix32Inv( uint32_t *data, int datacount, uint32_t mix, uint32_t c0, uint32_t c1 )
{
  int i;
  uint32_t block, newblock, carry, mixinv;
  mixinv = ~mix;
  block = ( data[0] ^ c1 ) - c0;
  carry = block & mix;
  for( i = datacount-1 ; i >= 0 ; i-- )
  {
    block = ( data[i] ^ c1 ) - c0;
    newblock = ( block & mixinv ) | carry;
    carry = block & mix;
    data[i] = newblock;
  }
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherPerm64( uint64_t *data, int datacount, uint64_t c0, uint64_t c1 )
{
  int i;
  uint64_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ( data[i] + c0accum ) ^ c1;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherPerm64Inv( uint64_t *data, int datacount, uint64_t c0, uint64_t c1 )
{
  int i;
  uint64_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ( data[i] ^ c1 ) - c0accum;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherRot64( uint64_t *data, int datacount, uint64_t c0, int rotbits )
{
  int i;
  uint64_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ccRotateLeft64( data[i] + c0accum, rotbits );
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherRot64Inv( uint64_t *data, int datacount, uint64_t c0, int rotbits )
{
  int i;
  uint64_t c0accum;
  c0accum = c0;
  for( i = 0 ; i < datacount ; i++, c0accum += c0 )
    data[i] = ccRotateRight64( data[i], rotbits ) - c0accum;
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherMix64( uint64_t *data, int datacount, uint64_t mix, uint64_t c0, uint64_t c1 )
{
  int i;
  uint64_t block, newblock, carry, mixinv;
  mixinv = ~mix;
  block = data[datacount-1];
  carry = block & mix;
  for( i = 0 ; i < datacount ; i++ )
  {
    block = data[i];
    newblock = ( block & mixinv ) | carry;
    carry = block & mix;
    data[i] = ( newblock + c0 ) ^ c1;
  }
  return;
}

static inline CC_ALWAYSINLINE void ccQuickCipherMix64Inv( uint64_t *data, int datacount, uint64_t mix, uint64_t c0, uint64_t c1 )
{
  int i;
  uint64_t block, newblock, carry, mixinv;
  mixinv = ~mix;
  block = ( data[0] ^ c1 ) - c0;
  carry = block & mix;
  for( i = datacount-1 ; i >= 0 ; i-- )
  {
    block = ( data[i] ^ c1 ) - c0;
    newblock = ( block & mixinv ) | carry;
    carry = block & mix;
    data[i] = newblock;
  }
  return;
}


////


#define CC_INT32_MAX ((((uint32_t)1)<<31)-1)

static inline CC_ALWAYSINLINE int32_t ccFloatToInt32Sat( float f )
{
  if( f >= (float)CC_INT32_MAX )
    return CC_INT32_MAX;
  else if( f <= -(float)CC_INT32_MAX )
    return -CC_INT32_MAX;
  else
    return (int32_t)f;
}


static inline CC_ALWAYSINLINE int32_t ccDoubleToInt32Sat( double f )
{
  if( f >= (double)CC_INT32_MAX )
    return CC_INT32_MAX;
  else if( f <= -(double)CC_INT32_MAX )
    return -CC_INT32_MAX;
  else
    return (int32_t)f;
}


#define CC_INT64_MAX ((((uint64_t)1)<<63)-1)

static inline CC_ALWAYSINLINE int64_t ccFloatToInt64Sat( float f )
{
  if( f >= (float)CC_INT64_MAX )
    return CC_INT64_MAX;
  else if( f <= -(float)CC_INT64_MAX )
    return -CC_INT64_MAX;
  else
    return (int64_t)f;
}


static inline CC_ALWAYSINLINE int64_t ccDoubleToInt64Sat( double f )
{
  if( f >= (double)CC_INT64_MAX )
    return CC_INT64_MAX;
  else if( f <= -(double)CC_INT64_MAX )
    return -CC_INT64_MAX;
  else
    return (int64_t)f;
}



static inline CC_ALWAYSINLINE float ccFastNextAfterPositivef( float f )
{
  ccuintf i;
  i = ccFloatToUint( f );
  i++;
  f = ccUintToFloat( i );
  return f;
}


////

////


void ccQuickSort( void **table, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask );
void ccQuickSortContext( void **table, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask );

int ccMergeSort( void **src, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ) );
int ccMergeSortContext( void **src, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context );

void ccHybridSort( void **table, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask );
void ccHybridSortContext( void **table, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask );


////


void ccDebugLog( char *filename, char *string, ... );


////


typedef struct
{
  size_t allocsize;
  size_t offset;
  char *data;
} ccGrowth;

void ccGrowthInit( ccGrowth *growth, int defaultsize );
int ccGrowthPrintf( ccGrowth *growth, char *format, ... );
int ccGrowthData( ccGrowth *growth, void *data, size_t size );
int ccGrowthSeek( ccGrowth *growth, int offset );
void ccGrowthFree( ccGrowth *growth );
void ccGrowthElapsedTimeString( ccGrowth *growth, int64_t timecount, int maxfieldcount );


////


void *ccFileLoad( const char *path, size_t maxsize, size_t *retsize );
size_t ccFileLoadDirect( const char *path, void *data, size_t minsize, size_t maxsize );
int ccFileStore( const char *path, void *data, size_t datasize, int fsyncflag );
int ccFileExists( char *path );
int ccFileStat( char *path, size_t *retfilesize, time_t *retfiletime );
int ccRenameFile( char *oldpath, char *newpath );


////


typedef struct _ccDir ccDir;

ccDir *ccOpenDir( char *path );
char *ccReadDir( ccDir *dir );
void ccCloseDir( ccDir *dir );


////


int64_t ccGetFreeDiskSpace( char *dirpath );


////


int ccGetTimeOfDay( struct timeval *tv );

void ccSleep( int milliseconds );

static inline CC_ALWAYSINLINE uint64_t ccGetMillisecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000 ) + ( (uint64_t)lntime.tv_usec / 1000 );
}

static inline CC_ALWAYSINLINE uint64_t ccGetMicrosecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000000 ) + (uint64_t)lntime.tv_usec;
}

static inline CC_ALWAYSINLINE uint64_t ccGetNanosecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000000000 ) + ( (uint64_t)lntime.tv_usec * 1000 );
}


////


/* Returned string must be free()d */
char *ccGetSystemName();


#endif

