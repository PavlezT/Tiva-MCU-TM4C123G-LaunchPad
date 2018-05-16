L 1 "../bmp280.c"
N
N#include "BMP280.h"
L 1 "..\BMP280.h" 1
N#pragma once
N
N#include <stdint.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/stdint.h" 1
N/*****************************************************************************/
N/* STDINT.H v5.2.6                                                           */
N/*                                                                           */
N/* Copyright (c) 2002-2015 Texas Instruments Incorporated                    */
N/* http://www.ti.com/                                                        */
N/*                                                                           */
N/*  Redistribution and  use in source  and binary forms, with  or without    */
N/*  modification,  are permitted provided  that the  following conditions    */
N/*  are met:                                                                 */
N/*                                                                           */
N/*     Redistributions  of source  code must  retain the  above copyright    */
N/*     notice, this list of conditions and the following disclaimer.         */
N/*                                                                           */
N/*     Redistributions in binary form  must reproduce the above copyright    */
N/*     notice, this  list of conditions  and the following  disclaimer in    */
N/*     the  documentation  and/or   other  materials  provided  with  the    */
N/*     distribution.                                                         */
N/*                                                                           */
N/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
N/*     of its  contributors may  be used to  endorse or  promote products    */
N/*     derived  from   this  software  without   specific  prior  written    */
N/*     permission.                                                           */
N/*                                                                           */
N/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
N/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
N/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
N/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
N/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
N/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
N/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
N/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
N/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
N/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
N/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
N/*                                                                           */
N/*****************************************************************************/
N#ifndef _STDINT_H_
N#define _STDINT_H_
N
N/* 7.18.1.1 Exact-width integer types */
N
N    typedef   signed char   int8_t;
N    typedef unsigned char  uint8_t;
N    typedef          short  int16_t;
N    typedef unsigned short uint16_t;
N    typedef          int    int32_t;
N    typedef unsigned int   uint32_t;
N
N
N    typedef          long long  int64_t;
N    typedef unsigned long long uint64_t;
N
N/* 7.18.1.2 Minimum-width integer types */
N
N    typedef  int8_t   int_least8_t;
N    typedef uint8_t  uint_least8_t;
N
N    typedef  int16_t  int_least16_t;
N    typedef uint16_t uint_least16_t;
N    typedef  int32_t  int_least32_t;
N    typedef uint32_t uint_least32_t;
N
N
N    typedef  int64_t  int_least64_t;
N    typedef uint64_t uint_least64_t;
N
N/* 7.18.1.3 Fastest minimum-width integer types */
N
N    typedef  int32_t  int_fast8_t;
N    typedef uint32_t uint_fast8_t;
N    typedef  int32_t  int_fast16_t;
N    typedef uint32_t uint_fast16_t;
N
N    typedef  int32_t  int_fast32_t;
N    typedef uint32_t uint_fast32_t;
N
N
N    typedef  int64_t  int_fast64_t;
N    typedef uint64_t uint_fast64_t;
N
N/* 7.18.1.4 Integer types capable of holding object pointers */
N    typedef          int intptr_t;
N    typedef unsigned int uintptr_t;
N
N/* 7.18.1.5 Greatest-width integer types */
N    typedef          long long intmax_t;
N    typedef unsigned long long uintmax_t;
N
N/* 
N   According to footnotes in the 1999 C standard, "C++ implementations
N   should define these macros only when __STDC_LIMIT_MACROS is defined
N   before <stdint.h> is included." 
N*/
N#if !defined(__cplusplus) || defined(__STDC_LIMIT_MACROS)
X#if !0L || 0L
N
N/* 7.18.2 Limits of specified width integer types */
N
N    #define  INT8_MAX   0x7f
N    #define  INT8_MIN   (-INT8_MAX-1)
N    #define UINT8_MAX   0xff
N
N    #define  INT16_MAX  0x7fff
N    #define  INT16_MIN  (-INT16_MAX-1)
N    #define UINT16_MAX  0xffff
N
N    #define  INT32_MAX  0x7fffffff
N    #define  INT32_MIN  (-INT32_MAX-1)
N    #define UINT32_MAX  0xffffffff
N
N
N    #define  INT64_MAX  0x7fffffffffffffff
N    #define  INT64_MIN  (-INT64_MAX-1)
N    #define UINT64_MAX  0xffffffffffffffff
N
N    #define  INT_LEAST8_MAX   (INT8_MAX)
N    #define  INT_LEAST8_MIN   (INT8_MIN)
N    #define UINT_LEAST8_MAX   (UINT8_MAX)
N
N    #define  INT_LEAST16_MAX  (INT16_MAX)
N    #define  INT_LEAST16_MIN  (INT16_MIN)
N    #define UINT_LEAST16_MAX  (UINT16_MAX)
N    #define  INT_LEAST32_MAX  (INT32_MAX)
N    #define  INT_LEAST32_MIN  (INT32_MIN)
N    #define UINT_LEAST32_MAX  (UINT32_MAX)
N
N
N    #define  INT_LEAST64_MAX  (INT64_MAX)
N    #define  INT_LEAST64_MIN  (INT64_MIN)
N    #define UINT_LEAST64_MAX  (UINT64_MAX)
N
N    #define  INT_FAST8_MAX   (INT32_MAX)
N    #define  INT_FAST8_MIN   (INT32_MIN)
N    #define UINT_FAST8_MAX   (UINT32_MAX)
N    #define  INT_FAST16_MAX  (INT32_MAX)
N    #define  INT_FAST16_MIN  (INT32_MIN)
N    #define UINT_FAST16_MAX  (UINT32_MAX)
N
N    #define  INT_FAST32_MAX  (INT32_MAX)
N    #define  INT_FAST32_MIN  (INT32_MIN)
N    #define UINT_FAST32_MAX  (UINT32_MAX)
N
N
N    #define  INT_FAST64_MAX  (INT64_MAX)
N    #define  INT_FAST64_MIN  (INT64_MIN)
N    #define UINT_FAST64_MAX  (UINT64_MAX)
N
N    #define INTPTR_MAX   (INT32_MAX)
N    #define INTPTR_MIN   (INT32_MIN)
N    #define UINTPTR_MAX  (UINT32_MAX)
N
N    #define INTMAX_MIN   (INT64_MIN)
N    #define INTMAX_MAX   (INT64_MAX)
N    #define UINTMAX_MAX  (UINT64_MAX)
N
N/* 7.18.3 Limits of other integer types */
N
N    #define PTRDIFF_MAX (INT32_MAX)
N    #define PTRDIFF_MIN (INT32_MIN)
N
N    #define SIG_ATOMIC_MIN (INT32_MIN)
N    #define SIG_ATOMIC_MAX (INT32_MAX)
N
N    #define SIZE_MAX (UINT32_MAX)
N
N#ifndef WCHAR_MAX
N#if !defined(__TI_WCHAR_T_BITS__) || __TI_WCHAR_T_BITS__ == 16
X#if !1L || 16 == 16
N#define WCHAR_MAX 0xffffu
N#else 
S#define WCHAR_MAX 0xffffffffu
N#endif
N#endif
N
N#ifndef WCHAR_MIN
N#define WCHAR_MIN 0
N#endif
N
N    #define WINT_MIN (INT32_MIN)
N    #define WINT_MAX (INT32_MAX)
N
N/* 7.18.4.1 Macros for minimum-width integer constants */
N
N/*
N   There is a defect report filed against the C99 standard concerning how 
N   the (U)INTN_C macros should be implemented.  Please refer to --
N   http://wwwold.dkuug.dk/JTC1/SC22/WG14/www/docs/dr_209.htm 
N   for more information.  These macros are implemented according to the
N   suggestion given at this web site.
N*/
N
N    #define  INT8_C(value)  ((int_least8_t)(value))
N    #define UINT8_C(value)  ((uint_least8_t)(value))
N    #define  INT16_C(value) ((int_least16_t)(value))
N    #define UINT16_C(value) ((uint_least16_t)(value))
N    #define  INT32_C(value) ((int_least32_t)(value))
N    #define UINT32_C(value) ((uint_least32_t)(value))
N
N
N    #define  INT64_C(value) ((int_least64_t)(value))
N    #define UINT64_C(value) ((uint_least64_t)(value))
N
N/* 7.18.4.2 Macros for greatest-width integer constants */
N
N    #define  INTMAX_C(value) ((intmax_t)(value))
N    #define UINTMAX_C(value) ((uintmax_t)(value))
N
N#endif /* !defined(__cplusplus) || defined(__STDC_LIMIT_MACROS) */
N
N#endif /* _STDINT_H_ */
L 4 "..\BMP280.h" 2
N#include <stdbool.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/stdbool.h" 1
N/* stdbool.h standard header */
N#ifndef _STDBOOL
N#define _STDBOOL
N#ifndef _YVALS
N #include <yvals.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/yvals.h" 1
N/* yvals.h values header for conforming compilers on various systems */
N#ifndef _YVALS
N#define _YVALS
N
N#pragma diag_push
N#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
N#pragma CHECK_MISRA("-19.4") /* macros required for implementation */
N#pragma CHECK_MISRA("-19.6") /* undef required for implementation */
N#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
N#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
N
N#include <stdarg.h> 
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/stdarg.h" 1
N/*****************************************************************************/
N/* stdarg.h   v5.2.6                                                         */
N/*                                                                           */
N/* Copyright (c) 1996-2015 Texas Instruments Incorporated                    */
N/* http://www.ti.com/                                                        */
N/*                                                                           */
N/*  Redistribution and  use in source  and binary forms, with  or without    */
N/*  modification,  are permitted provided  that the  following conditions    */
N/*  are met:                                                                 */
N/*                                                                           */
N/*     Redistributions  of source  code must  retain the  above copyright    */
N/*     notice, this list of conditions and the following disclaimer.         */
N/*                                                                           */
N/*     Redistributions in binary form  must reproduce the above copyright    */
N/*     notice, this  list of conditions  and the following  disclaimer in    */
N/*     the  documentation  and/or   other  materials  provided  with  the    */
N/*     distribution.                                                         */
N/*                                                                           */
N/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
N/*     of its  contributors may  be used to  endorse or  promote products    */
N/*     derived  from   this  software  without   specific  prior  written    */
N/*     permission.                                                           */
N/*                                                                           */
N/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
N/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
N/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
N/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
N/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
N/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
N/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
N/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
N/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
N/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
N/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
N/*                                                                           */
N/*****************************************************************************/
N
N#ifndef _STDARG
N#define _STDARG
N
N#pragma diag_push
N#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */
N#pragma CHECK_MISRA("-19.10") /* need types as macro arguments */
N
N#ifdef __cplusplus
S#define _NS_PREFIX std::
Snamespace std {
N#else
N#define _NS_PREFIX
N#endif /* __cplusplus */
N
N#ifdef __TI_EABI_SUPPORT__
Ntypedef struct __va_list {
N    void * __ap;
N} va_list;
N#else
Stypedef char *va_list;
N#endif
N
N#ifdef __cplusplus
S} /* namespace std */
N#endif
N
N#define _VA_RNDUP(sz) 	(((sz) + 3) & ~3)
N#define _VA_MASK(tp)     ((__ALIGNOF__(tp) == 8) ? 7 : 3)
N#define _VA_ALN(ap,tp)  (((int)(ap) + _VA_MASK(tp)) & ~(_VA_MASK(tp)))
N
N#ifdef __TI_EABI_SUPPORT__
N#define va_start(ap, parmN)						      \
N   ((ap).__ap = ((void *)((((int)__va_parmadr(parmN))&~3) +                   \
N		                              _VA_RNDUP(sizeof(parmN)))))
X#define va_start(ap, parmN)						         ((ap).__ap = ((void *)((((int)__va_parmadr(parmN))&~3) +                   		                              _VA_RNDUP(sizeof(parmN)))))
N#else
S#define va_start(ap, parmN)						      \
S   ((ap) = (__va_argref(parmN) 						      \
S	    ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 )	      \
S	    : (sizeof(parmN) < sizeof(int)) 				      \
S	      ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 & ~3)	      \
S	      : (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + sizeof(parmN))))
X#define va_start(ap, parmN)						         ((ap) = (__va_argref(parmN) 						      	    ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 )	      	    : (sizeof(parmN) < sizeof(int)) 				      	      ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 & ~3)	      	      : (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + sizeof(parmN))))
N#endif
N
N#ifdef __big_endian__
S#ifdef __TI_EABI_SUPPORT__
S#define va_arg(_ap, _type)					 	      \
S    (((_ap).__ap = (void*)(_VA_ALN((_ap).__ap, _type) +                       \
S			                         _VA_RNDUP(sizeof(_type)))),  \
S     (*(_type *)((int)(_ap).__ap -                                            \
S		   (__va_argcsu(_type) ? _VA_RNDUP(sizeof(_type))	      \
S		                       : (sizeof(_type))))))
X#define va_arg(_ap, _type)					 	          (((_ap).__ap = (void*)(_VA_ALN((_ap).__ap, _type) +                       			                         _VA_RNDUP(sizeof(_type)))),       (*(_type *)((int)(_ap).__ap -                                            		   (__va_argcsu(_type) ? _VA_RNDUP(sizeof(_type))	      		                       : (sizeof(_type))))))
S#else
S#define va_arg(_ap, _type)                                       	      \
S        (__va_argref(_type)                                		      \
S	 ? ((_ap += sizeof(_type*)),(**(_type**)(_ap-(sizeof(_type*)))))      \
S	 : ((_ap += _VA_RNDUP(sizeof(_type))),(*(_type*)(_ap-(sizeof(_type))))))
X#define va_arg(_ap, _type)                                       	              (__va_argref(_type)                                		      	 ? ((_ap += sizeof(_type*)),(**(_type**)(_ap-(sizeof(_type*)))))      	 : ((_ap += _VA_RNDUP(sizeof(_type))),(*(_type*)(_ap-(sizeof(_type))))))
S#endif
N#else
N#ifdef __TI_EABI_SUPPORT__
N#define va_arg(_ap, _type) 						      \
N   (((_ap).__ap = (void *)(_VA_ALN((_ap).__ap,_type) +                        \
N			   _VA_RNDUP(sizeof(_type)))),                        \
N	     (*(_type *) ((int)(_ap).__ap - _VA_RNDUP(sizeof(_type)))))
X#define va_arg(_ap, _type) 						         (((_ap).__ap = (void *)(_VA_ALN((_ap).__ap,_type) +                        			   _VA_RNDUP(sizeof(_type)))),                        	     (*(_type *) ((int)(_ap).__ap - _VA_RNDUP(sizeof(_type)))))
N#else
S#define va_arg(_ap, _type)                                       	      \
S        (__va_argref(_type)                         		              \
S	 ? ((_ap += sizeof(_type*)), (**(_type**)(_ap- sizeof(_type*))))      \
S	 : ((_ap += _VA_RNDUP(sizeof(_type))),				      \
S	     (*(_type*)(_ap- _VA_RNDUP(sizeof(_type))))))
X#define va_arg(_ap, _type)                                       	              (__va_argref(_type)                         		              	 ? ((_ap += sizeof(_type*)), (**(_type**)(_ap- sizeof(_type*))))      	 : ((_ap += _VA_RNDUP(sizeof(_type))),				      	     (*(_type*)(_ap- _VA_RNDUP(sizeof(_type))))))
N#endif
N#endif
N
N#define va_end(ap) ((void)0)
N
N#pragma diag_pop
N
N#endif /* _STDARG */
N
N#pragma diag_push
N
N/* using declarations must occur outside header guard to support including both
N   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
N/* this code is for C++ mode only and thus also not relevant for MISRA */
N#pragma CHECK_MISRA("-19.15")
N
N#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
X#if 0L && !0L
Susing std::va_list;
N#endif /* _CPP_STYLE_HEADER */
N
N#pragma diag_pop
L 13 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/yvals.h" 2
N
N#define _CPPLIB_VER	402
N
N/*---------------------------------------------------------------------------*/
N/* A header file conforming to ARM CLIB ABI (GENC-003539), should            */
N/* define _AEABI_PORTABLE when _AEABI_PORTABILITY_LEVEL is defined.          */
N/*---------------------------------------------------------------------------*/
N#if defined(_AEABI_PORTABILITY_LEVEL) && !defined(_AEABI_PORTABLE)
X#if 0L && !0L
S#define _AEABI_PORTABLE
N#endif
N
N/*---------------------------------------------------------------------------*/
N/* The macro definition that guards CLIB ABI (GENC-003539) requirements.     */
N/*---------------------------------------------------------------------------*/
N#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__)
X#if 1L && 1L
N#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) && \
N                                  defined(__TI_EABI_SUPPORT__) && \
N                                  defined(_AEABI_PORTABILITY_LEVEL) && \
N                                  _AEABI_PORTABILITY_LEVEL != 0)
X#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) &&                                   defined(__TI_EABI_SUPPORT__) &&                                   defined(_AEABI_PORTABILITY_LEVEL) &&                                   _AEABI_PORTABILITY_LEVEL != 0)
N#else
S#define _AEABI_PORTABILITY_CHECK 0
N#endif
N
N/* You can predefine (on the compile command line, for example):
N
N_ALT_NS=1 -- to use namespace _Dinkum_std for C++
N_ALT_NS=2 -- to use namespace _Dinkum_std for C++ and C
N_C_AS_CPP -- to compile C library as C++
N_C_IN_NS -- to define C names in std/_Dinkum_std instead of global namespace
N_C99 -- to turn ON C99 library support
N_ABRCPP -- to turn ON Abridged C++ dialect (implies _ECPP)
N_ECPP -- to turn ON Embedded C++ dialect
N_NO_EX -- to turn OFF use of try/throw
N_NO_MT -- to turn OFF thread synchronization
N_NO_NS -- to turn OFF use of namespace declarations
N_STL_DB (or _STLP_DEBUG) -- to turn ON iterator/range debugging
N__NO_LONG_LONG -- to define _Longlong as long, not long long
N
NYou can change (in this header):
N
N_ADDED_C_LIB -- from 1 to 0 to omit declarations for C extensions
N_COMPILER_TLS -- from 0 to 1 if _TLS_QUAL is not nil
N_EXFAIL -- from 1 to any nonzero value for EXIT_FAILURE
N_FILE_OP_LOCKS -- from 0 to 1 for file atomic locks
N_GLOBAL_LOCALE -- from 0 to 1 for shared locales instead of per-thread
N_HAS_IMMUTABLE_SETS -- from 1 to 0 to permit alterable set elements
N_HAS_STRICT_CONFORMANCE -- from 0 to 1 to disable nonconforming extensions
N_HAS_TRADITIONAL_IOSTREAMS -- from 1 to 0 to omit old iostreams functions
N_HAS_TRADITIONAL_ITERATORS -- from 0 to 1 for vector/string pointer iterators
N_HAS_TRADITIONAL_POS_TYPE -- from 0 to 1 for streampos same as streamoff
N_HAS_TRADITIONAL_STL -- from 1 to 0 to omit old STL functions
N_IOSTREAM_OP_LOCKS -- from 0 to 1 for iostream atomic locks
N_TLS_QUAL -- from nil to compiler TLS qualifier, such as __declspec(thread)
N_USE_EXISTING_SYSTEM_NAMES -- from 1 to 0 to disable mappings (_Open to open)
N
NInclude directories needed to compile with Dinkum C:
N
NC -- include/c
NC99 -- include/c (define _C99)
NEmbedded C++ -- include/c include/embedded (define _ECPP)
NAbridged C++ -- include/c include/embedded include (define _ABRCPP)
NStandard C++ -- include/c include
NStandard C++ with export -- include/c include/export include
N	(--export --template_dir=lib/export)
N
NInclude directories needed to compile with native C:
N
NC -- none
NC99 -- N/A
NEmbedded C++ -- include/embedded (define _ECPP)
NAbridged C++ -- include/embedded include (define _ABRCPP)
NStandard C++ -- include
NStandard C++ with export -- include/export include
N	(--export --template_dir=lib/export)
N */
N
N #define _C_IN_NS 1
N #define __EDG__  1
N #define __FPUTS_RETURN_NUM_BYTES__ 1
N #ifdef __EXCEPTIONS
S    #undef _NO_EX 
N #else
N    #define _NO_EX 1
N #endif /* __EXCEPTIONS */
N #if defined(__unsigned_chars__)
X #if 1L
N   #define __CHAR_UNSIGNED__ 1
N #else
S   #undef __CHAR_UNSIGNED__
S   #undef _CHAR_UNSIGNED
N #endif /* defined(__unsigned_chars__) */
N #undef _32_BIT_DOUBLE
N #undef _32_BIT_LDOUBLE
N
N /* targets with "native" mode libraries don't support C9X */
N #define _HAS_C9X 0
N
N /* TI RTS supports the C9X snprintf() and vsnprintf() functions */
N #ifndef _C9X_SNPRINTF
N  #define _C9X_SNPRINTF 1
N #endif /* _C9X_SNPRINTF */
N
N /* TI C6x supports complex arithmetic */
N #ifndef _C9X_COMPLEX
N  #define _C9X_COMPLEX (_TMS320C6X || 199901L <= __STDC_VERSION__)
N #endif /* _C9X_COMPLEX */
N
N
N #ifndef __STDC_HOSTED__
N  #define __STDC_HOSTED__	1
N #endif /* __STDC_HOSTED__ */
N
N  #undef __STDC_IEC_559__
N  #undef __STDC_IEC_559_COMPLEX__
N
N #ifndef __STDC_ISO_10646__
N  #define __STDC_ISO_10646__	200009L	/* match glibc */
N #endif /* __STDC_ISO_10646__ */
N
N		/* DETERMINE MACHINE TYPE */
N
N
N   /* _C99_MATH must be defined for using Dinkum Math */
N  #if !defined(_C99_MATH)
X  #if !0L
N    #define _C99_MATH 1
N  #endif
N
N  #if defined(__TI_VFPLIB_SUPPORT__)
X  #if 0L
S    #if defined(__TI_FPV4SPD16_SUPPORT__)
S      #define _HAS_C9X_FAST_FMAF 1
S    #else
S      #define _HAS_C9X_FAST_FMA 1
S    #endif
N  #endif
N  
N   #if defined(__big_endian__)
X   #if 0L
S       #define _D0	0	/* 0: big endian, 3: little endian floating-point */
N   #elif defined(__little_endian__)
X   #elif 1L
N      #if defined(__TI_VFPLIB_SUPPORT__)
X      #if 0L
S          #define _D0   3       /* MSW offset 3 */
S      #elif defined(__TI_FPALIB_SUPPORT__)
X      #elif 0L
S          #define _D0   1       /* MSW offset 1, special FPALIB endianness */
N      #else
N          #define _D0   3       /* MSW offset 3 */
N      #endif
N   #endif
N  #define _DLONG	0	/* 0: 64, 1: 80, 2: 128 long double bits */
N  #define _LBIAS	0x3fe	/* 64 long double bits */
N  #define _LOFF		4	/* 64 long double bits */
N  #define _FPP_TYPE	_FPP_NONE   /* set to _FPP_NONE because of software emulation */
N
N
N		/* DETERMINE _Ptrdifft AND _Sizet FROM MACHINE TYPE */
N
Ntypedef long _Int32t;
Ntypedef unsigned long _Uint32t;
N
Ntypedef  __PTRDIFF_T_TYPE__  _Ptrdifft;
Xtypedef  int  _Ptrdifft;
N
Ntypedef  __SIZE_T_TYPE__ _Sizet;
Xtypedef  unsigned _Sizet;
N
N #if defined(__linux)
X #if 0L
S  #define _LINUX_C_LIB	1	/* Linux-specific conventions */
N #endif /* defined(__linux) */
N
N   #undef _POSIX_C_LIB
N
N #if !defined(_HAS_C9X) && defined(_C99)
X #if !1L && 0L
S  #define _HAS_C9X	1
N #endif /* !defined(_HAS_C9X) etc. */
N
N #define _HAS_C9X_IMAGINARY_TYPE	(_C9X_COMPLEX && __EDG__ \
N	&& !defined(__cplusplus))
X #define _HAS_C9X_IMAGINARY_TYPE	(_C9X_COMPLEX && __EDG__ 	&& !defined(__cplusplus))
N
N #if !defined(_ECPP) && defined(_ABRCPP)
X #if !0L && 0L
S  #define _ECPP
N #endif /* !defined(_ECPP) && defined(_ABRCPP) */
N
N #if !defined(_IS_EMBEDDED) && defined(_ECPP)
X #if !0L && 0L
S  #define _IS_EMBEDDED	1	/* 1 for Embedded C++ */
N #endif /* _IS_EMBEDDED */
N
N		/* EXCEPTION CONTROL */
N #ifndef _HAS_EXCEPTIONS
N  #ifndef _NO_EX	/* don't simplify */
S   #define _HAS_EXCEPTIONS	1	/* 1 for try/throw logic */
S
N  #else	/* _NO_EX */
N   #define _HAS_EXCEPTIONS	0
N  #endif /* _NO_EX */
N
N #endif /* _HAS_EXCEPTIONS */
N
N		/* NAMING PROPERTIES */
N/* #define _STD_LINKAGE	defines C names as extern "C++" */
N/* #define _STD_USING	defines C names in namespace std or _Dinkum_std */
N
N #ifndef _HAS_NAMESPACE
N  #ifndef _NO_NS	/* don't simplify */
N   #define _HAS_NAMESPACE	1	/* 1 for C++ names in std */
N
N  #else	/* _NO_NS */
S   #define _HAS_NAMESPACE	0
N  #endif /* _NO_NS */
N
N #endif /* _HAS_NAMESPACE */
N 
N #if !defined(_STD_USING) && defined(__cplusplus) \
N	&& defined(_C_IN_NS)
X #if !0L && 0L 	&& 1L
S  #define _STD_USING	/* exports C names to global, else reversed */
S
S #elif defined(_STD_USING) && !defined(__cplusplus)
X #elif 0L && !0L
S  #undef _STD_USING	/* define only for C++ */
N #endif /* !defined(_STD_USING) */
N
N #if !defined(_HAS_STRICT_LINKAGE) \
N	&& __EDG__ && !defined(_WIN32_C_LIB)
X #if !0L 	&& 1 && !0L
N  #define _HAS_STRICT_LINKAGE __TI_STRICT_ANSI_MODE__   /* extern "C" in function type */
N #endif /* !defined(_HAS_STRICT_LINKAGE) */
N
N		/* THREAD AND LOCALE CONTROL */
N  #define _NO_MT 1
N  #define _MULTI_THREAD	0
N 
N#define _GLOBAL_LOCALE	0	/* 0 for per-thread locales, 1 for shared */
N#define _FILE_OP_LOCKS	0	/* 0 for no FILE locks, 1 for atomic */
N#define _IOSTREAM_OP_LOCKS	0	/* 0 for no iostream locks, 1 for atomic */
N
N		/* THREAD-LOCAL STORAGE */
N#define _COMPILER_TLS	0	/* 1 if compiler supports TLS directly */
N#define _TLS_QUAL	/* TLS qualifier, such as __declspec(thread), if any */
N
N #define _HAS_IMMUTABLE_SETS	1
N #define _HAS_IMMUTABLE_SETS	1
N #define _HAS_TRADITIONAL_IOSTREAMS	0
N #define _HAS_TRADITIONAL_ITERATORS	0
N #define _HAS_TRADITIONAL_POS_TYPE	0
N #define _HAS_TRADITIONAL_STL	1
N #define _HAS_TRADITIONAL_IOSTREAMS	0
N #define _HAS_TRADITIONAL_ITERATORS	0
N #define _HAS_TRADITIONAL_POS_TYPE	0
N #define _HAS_TRADITIONAL_STL	1
N
N #define _ADDED_C_LIB	1
N #define _USE_EXISTING_SYSTEM_NAMES	1 /* _Open => open etc. */
N
N #if !defined(_HAS_STRICT_CONFORMANCE)
X #if !0L
N  #define _HAS_STRICT_CONFORMANCE	0	/* enable nonconforming extensions */
N #endif /* !defined(_HAS_STRICT_CONFORMANCE) */
N
N #if !defined(_HAS_ITERATOR_DEBUGGING) \
N	&& (defined(_STL_DB) || defined(_STLP_DEBUG))
X #if !0L 	&& (0L || 0L)
S  #define _HAS_ITERATOR_DEBUGGING	1	/* for range checks, etc. */
N #endif /* define _HAS_ITERATOR_DEBUGGING */
N
N		/* NAMESPACE CONTROL */
N
N #if defined(__cplusplus)
X #if 0L
S
S #if _HAS_NAMESPACE
Snamespace std {}
S
S #if defined(_C_AS_CPP)
S  #define _NO_CPP_INLINES	/* just for compiling C library as C++ */
S #endif /* _C_AS_CPP */
S
S #if defined(_STD_USING)
S  #if defined(_C_AS_CPP)	/* define library in std */
S   #define _STD_BEGIN	namespace std {_C_LIB_DECL
S   #define _STD_END		_END_C_LIB_DECL }
S
S  #else /* _C_AS_CPP */
S   #define _STD_BEGIN	namespace std {
S   #define _STD_END		}
S  #endif /* _C_AS_CPP */
S
S   #define _C_STD_BEGIN	namespace std {
S   #define _C_STD_END	}
S   #define _CSTD	        ::std::
S   #define _STD			::std::
S
S #else /* _ALT_NS == 0 && !defined(_STD_USING) */
S
S  #if defined(_C_AS_CPP)	/* define C++ library in std, C in global */
S   #define _STD_BEGIN	_C_LIB_DECL
S   #define _STD_END		_END_C_LIB_DECL
S
S  #else /* _C_AS_CPP */
S   #define _STD_BEGIN	namespace std {
S   #define _STD_END		}
S  #endif /* _C_AS_CPP */
S
S   #define _C_STD_BEGIN	
S   #define _C_STD_END	
S   #define _CSTD		::
S   #define _STD			::std::
S #endif /* _ALT_NS etc */
S
S  #define _X_STD_BEGIN	namespace std {
S  #define _X_STD_END	}
S  #define _XSTD			::std::
S
S  #if defined(_STD_USING)
S   #undef _GLOBAL_USING		/* c* in std namespace, *.h imports to global */
S
S  #else
S   #define _GLOBAL_USING	/* *.h in global namespace, c* imports to std */
S  #endif /* defined(_STD_USING) */
S
S  #if defined(_STD_LINKAGE)
S   #define _C_LIB_DECL		extern "C++" {	/* C has extern "C++" linkage */
S
S  #else /* defined(_STD_LINKAGE) */
S   #define _C_LIB_DECL		extern "C" {	/* C has extern "C" linkage */
S  #endif /* defined(_STD_LINKAGE) */
S
S  #define _END_C_LIB_DECL	}
S  #define _EXTERN_C			extern "C" {
S  #define _END_EXTERN_C		}
S
S #else /* _HAS_NAMESPACE */
S
S  #define _STD_BEGIN
S  #define _STD_END
S  #define _STD	::
S
S  #define _X_STD_BEGIN
S  #define _X_STD_END
S  #define _XSTD	::
S
S  #define _C_STD_BEGIN
S  #define _C_STD_END
S  #define _CSTD	::
S
S  #define _C_LIB_DECL		extern "C" {
S  #define _END_C_LIB_DECL	}
S  #define _EXTERN_C			extern "C" {
S  #define _END_EXTERN_C		}
S #endif /* _HAS_NAMESPACE */
S
N #else /* __cplusplus */
N  #define _STD_BEGIN
N  #define _STD_END
N  #define _STD
N
N  #define _X_STD_BEGIN
N  #define _X_STD_END
N  #define _XSTD
N
N  #define _C_STD_BEGIN
N  #define _C_STD_END
N  #define _CSTD
N
N  #define _C_LIB_DECL
N  #define _END_C_LIB_DECL
N  #define _EXTERN_C
N  #define _END_EXTERN_C
N #endif /* __cplusplus */
N
N #if 199901L <= __STDC_VERSION__
X #if 199901L <= 199409L
S
S #if defined(__GNUC__) || defined(__cplusplus)
S  #define _Restrict
S
S #else /* defined(__GNUC__) || defined(__cplusplus) */
S  #define _Restrict restrict
S #endif /* defined(__GNUC__) || defined(__cplusplus) */
S
S
N #else /* 199901L <= __STDC_VERSION__ */
N #define _Restrict
N #endif /* 199901L <= __STDC_VERSION__ */
N
N #ifdef __cplusplus
S_STD_BEGIN
Stypedef bool _Bool;
S_STD_END
N #endif /* __cplusplus */
N
N		/* VC++ COMPILER PARAMETERS */
N #define _CRTIMP
N #define _CDECL
N
N
N #ifdef __NO_LONG_LONG
S
N #else
N        /* defined(__NO_LONG_LONG) && !defined (_MSC_VER) && ! TI 32 bit processor*/
N  #define _LONGLONG	long long
N  #define _ULONGLONG	unsigned long long
N  #define _LLONG_MAX	0x7fffffffffffffffLL
N  #define _ULLONG_MAX	0xffffffffffffffffULL
N #endif /* __NO_LONG_LONG */
N
N		/* MAKE MINGW LOOK LIKE WIN32 HEREAFTER */
N
N
N
N_C_STD_BEGIN
X
N		/* FLOATING-POINT PROPERTIES */
N#if (!defined(_32_BIT_DOUBLE))
X#if (!0L)
N#define _DBIAS	0x3fe	/* IEEE format double and float */
N#define _DOFF	4
N#define _FBIAS	0x7e
N#define _FOFF	7
N#define _FRND	1
N#endif /* (!defined(_32_BIT_DOUBLE)) */
N
N#define _BITS_BYTE	8
N#define _C2		1	/* 0 if not 2's complement */
N#define _MBMAX		8	/* MB_LEN_MAX */
N#define _ILONG		1	/* 0 if 16-bit int */
N
N #if defined(__s390__) || defined(__CHAR_UNSIGNED__)  \
N	|| defined(_CHAR_UNSIGNED) 
X #if 0L || 1L  	|| 0L 
N  #define _CSIGN	0	/* 0 if char is not signed */ 
N #else /* defined(__s390__) etc */
S  #define _CSIGN	1
N #endif /* defined(__s390__) etc */
N
N#define _MAX_EXP_DIG	8	/* for parsing numerics */
N#define _MAX_INT_DIG	32
N#define _MAX_SIG_DIG	36
N
N #if defined(_LONGLONG)
X #if 1L
Ntypedef _LONGLONG _Longlong;
Xtypedef long long _Longlong;
Ntypedef _ULONGLONG _ULonglong;
Xtypedef unsigned long long _ULonglong;
N
N #else /* defined(_LONGLONG) */
S     typedef long long _Longlong;
S     typedef unsigned long long  _ULonglong;
S     #define _LLONG_MAX  0x7fffffffffffffff
S     #define _ULLONG_MAX 0xffffffffffffffff
N #endif /* defined(_LONGLONG) */
N
N		/* wchar_t AND wint_t PROPERTIES */
N #if defined(_WCHAR_T) || defined(_WCHAR_T_DEFINED) \
N	|| defined (_MSL_WCHAR_T_TYPE)
X #if 0L || 0L 	|| 0L
S  #define _WCHART
N #endif /* defined(_WCHAR_T) || defined(_WCHAR_T_DEFINED) */
N
N #if defined(_WINT_T)
X #if 0L
S  #define _WINTT
N #endif /* _WINT_T */
N
N #ifdef __cplusplus
S  #define _WCHART
Stypedef wchar_t _Wchart;
Stypedef wchar_t _Wintt;
N #endif /* __cplusplus */
N
N #if defined(__WCHAR_TYPE__)
X #if 0L
S  #define _WCMIN	(-_WCMAX - _C2)
S  #define _WCMAX	0x7fffffff	/* assume signed 32-bit wchar_t */
S
S  #ifndef __cplusplus
Stypedef __WCHAR_TYPE__ _Wchart;
Stypedef __WCHAR_TYPE__ _Wintt;
S  #endif /* __cplusplus */
S/******************************************************************************/
S/* Here we define the _Wchart _Wintt for TI processors, they are all defined  */
S/* as 16 bit unsigned integer type by the predefined macro __WCHAR_T_TYPE__   */
S/******************************************************************************/
N #else
N   #if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK
X   #if 1L && (1L && 1L && 0L && _AEABI_PORTABILITY_LEVEL != 0)
S      #ifndef __cplusplus
S       typedef int  _Wchart;
S       typedef int  _Wintt;
S      #endif /* __cplusplus */
S      #define _WCMIN	0
S      #define _WCMAX	0xffffffff
N   #else 
N    #ifndef __cplusplus
N       typedef __WCHAR_T_TYPE__ _Wchart;
X       typedef unsigned short _Wchart;
N       typedef __WCHAR_T_TYPE__ _Wintt;
X       typedef unsigned short _Wintt;
N    #endif /* __cplusplus */
N    #define _WCMIN	0
N    #define _WCMAX	0xffff
N   #endif /* _AEABI_PORTABILITY_CHECK */
N #endif /* compiler/library type */
N
N		/* POINTER PROPERTIES */
N#define _NULL		0	/* 0L if pointer same as long */
N
N		/* signal PROPERTIES */
N
N#define _SIGABRT	6
N#define _SIGMAX		44
N
N		/* stdarg PROPERTIES */
Ntypedef _CSTD va_list _Va_list;
Xtypedef  va_list _Va_list;
N
N #if _HAS_C9X
X #if 0
S
S #if __EDG__
S  #undef va_copy
S #endif /* __EDG__ */
S
S #ifndef va_copy
S_EXTERN_C
Svoid _Vacopy(va_list *apd, va_list aps);
S_END_EXTERN_C
S  #define va_copy(apd, aps)	_Vacopy(&(apd), aps)
S #endif /* va_copy */
S
N #endif /* _IS_C9X */
N
N		/* stdlib PROPERTIES */
N#define _EXFAIL	1	/* EXIT_FAILURE */
N
N_EXTERN_C
X
Nvoid _Atexit(void (*fn)(void));
N_END_EXTERN_C
X
N
N		/* stdio PROPERTIES */
N#define _FNAMAX	256           /* Dinkum original value 260 */
N#define _FOPMAX	10            /* Dinkum original value 20 */
N#define _TNAMAX	16
N
N #define _FD_TYPE	signed char
N  #define _FD_NO(str) ((str)->_Handle)
N #define _FD_VALID(fd)	(0 <= (fd))	/* fd is signed integer */
N #define _FD_INVALID	(-1)
N #define _SYSCH(x)	(x)
Ntypedef char _Sysch_t;
N
N		/* STORAGE ALIGNMENT PROPERTIES */
N#define _MEMBND	3U /* eight-byte boundaries (2^^3) */
N
N		/* time PROPERTIES */
N  #if _AEABI_PORTABILITY_CHECK
X  #if (1L && 1L && 0L && _AEABI_PORTABILITY_LEVEL != 0)
S    #define _CPS (__aeabi_CLOCKS_PER_SEC)
N  #else
N    #define _CPS    1000
N  #endif /* _AEABI_PORTABILITY_CHECK */
N  #define _TBIAS	0
N_C_STD_END
X
N
N		/* MULTITHREAD PROPERTIES */
N #if _MULTI_THREAD
X #if 0
S_EXTERN_C
Svoid _Locksyslock(int);
Svoid _Unlocksyslock(int);
S_END_EXTERN_C
S
N #else /* _MULTI_THREAD */
N     #define _Locksyslock(x)   _lock()
N     #define _Unlocksyslock(x) _unlock()
N #endif /* _MULTI_THREAD */
N
N		/* LOCK MACROS */
N #define _LOCK_LOCALE	0
N #define _LOCK_MALLOC	1
N #define _LOCK_STREAM	2
N #define _LOCK_DEBUG	3
N #define _MAX_LOCK		4	/* one more than highest lock number */
N
N #if _IOSTREAM_OP_LOCKS
X #if 0
S  #define _MAYBE_LOCK
S
N #else /* _IOSTREAM_OP_LOCKS */
N  #define _MAYBE_LOCK	\
N	if (_Locktype == _LOCK_MALLOC || _Locktype == _LOCK_DEBUG)
X  #define _MAYBE_LOCK		if (_Locktype == _LOCK_MALLOC || _Locktype == _LOCK_DEBUG)
N #endif /* _IOSTREAM_OP_LOCKS */
N
N #ifdef __cplusplus
S_STD_BEGIN
Sextern "C++" {	/* in case of _C_AS_CPP */
S		/* CLASS _Lockit */
Sclass _Lockit
S	{	/* lock while object in existence -- MUST NEST */
Spublic:
S
S  #if !_MULTI_THREAD
S   #define _LOCKIT(x)
S
S	explicit _Lockit()
S		{	/* do nothing */
S		}
S
S	explicit _Lockit(int)
S		{	/* do nothing */
S		}
S
S	~_Lockit()
S		{	/* do nothing */
S		}
S
S  #else /* non-Windows multithreading */
S   #define _LOCKIT(x)	lockit x
S
S	explicit _Lockit()
S		: _Locktype(_LOCK_MALLOC)
S		{	/* set default lock */
S		_MAYBE_LOCK
S			_Locksyslock(_Locktype);
S		}
S
S	explicit _Lockit(int _Type)
S		: _Locktype(_Type)
S		{	/* set the lock */
S		_MAYBE_LOCK
S			_Locksyslock(_Locktype);
S		}
S
S	~_Lockit()
S		{	/* clear the lock */
S		_MAYBE_LOCK
S			_Unlocksyslock(_Locktype);
S		}
S
Sprivate:
S	int _Locktype;
S  #endif /* _MULTI_THREAD */
S
Spublic:
S	_Lockit(const _Lockit&);			/* not defined */
S	_Lockit& operator=(const _Lockit&);	/* not defined */
S	};
S
Sclass _Mutex
S	{	/* lock under program control */
Spublic:
S
S  #if !_MULTI_THREAD || !_IOSTREAM_OP_LOCKS
S    void _Lock()
S		{	/* do nothing */
S		}
S
S	void _Unlock()
S		{	/* do nothing */
S	}
S
S  #else /* !_MULTI_THREAD || !_IOSTREAM_OP_LOCKS */
S	_Mutex();
S	~_Mutex();
S	void _Lock();
S	void _Unlock();
S
Sprivate:
S	_Mutex(const _Mutex&);				/* not defined */
S	_Mutex& operator=(const _Mutex&);	/* not defined */
S	void *_Mtx;
S  #endif /* !_MULTI_THREAD || !_IOSTREAM_OP_LOCKS */
S
S	};
S}	/* extern "C++" */
S_STD_END
N #endif /* __cplusplus */
N
N		/* MISCELLANEOUS MACROS */
N#define _ATEXIT_T	void
N
N#define _MAX	max
N#define _MIN	min
N
N#define _TEMPLATE_STAT
N
N #pragma diag_push
N #pragma CHECK_MISRA("-19.10") /* need types as macro arguments */
N
N  #define _NO_RETURN(fun)	void fun
N
N #pragma diag_pop
N
N #if _HAS_NAMESPACE
X #if 1
N
N #ifdef __cplusplus
S  #ifndef _STDARG
S  #if defined(_STD_USING)
S_STD_BEGIN
Susing _CSTD va_list;
S_STD_END
S  #endif /* !defined(_C_AS_CPP) && defined(_GLOBAL_USING) */
S  #endif /* _STDARG */
N #endif /* __cplusplus */
N #endif /* _HAS_NAMESPACE */
N
N#include <linkage.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/linkage.h" 1
N/*****************************************************************************/
N/* linkage.h   v5.2.6                                                        */
N/*                                                                           */
N/* Copyright (c) 1998-2015 Texas Instruments Incorporated                    */
N/* http://www.ti.com/                                                        */
N/*                                                                           */
N/*  Redistribution and  use in source  and binary forms, with  or without    */
N/*  modification,  are permitted provided  that the  following conditions    */
N/*  are met:                                                                 */
N/*                                                                           */
N/*     Redistributions  of source  code must  retain the  above copyright    */
N/*     notice, this list of conditions and the following disclaimer.         */
N/*                                                                           */
N/*     Redistributions in binary form  must reproduce the above copyright    */
N/*     notice, this  list of conditions  and the following  disclaimer in    */
N/*     the  documentation  and/or   other  materials  provided  with  the    */
N/*     distribution.                                                         */
N/*                                                                           */
N/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
N/*     of its  contributors may  be used to  endorse or  promote products    */
N/*     derived  from   this  software  without   specific  prior  written    */
N/*     permission.                                                           */
N/*                                                                           */
N/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
N/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
N/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
N/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
N/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
N/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
N/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
N/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
N/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
N/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
N/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
N/*                                                                           */
N/*****************************************************************************/
N
N#ifndef _LINKAGE
N#define _LINKAGE
N
N#pragma diag_push
N#pragma CHECK_MISRA("-19.4") /* macros required for implementation */
N
N/* No modifiers are needed to access code or data */
N
N#define _CODE_ACCESS
N#define _DATA_ACCESS
N#define _DATA_ACCESS_NEAR
N
N/*--------------------------------------------------------------------------*/
N/* Define _IDECL ==> how inline functions are declared                      */
N/*--------------------------------------------------------------------------*/
N#ifdef _INLINE
N#define _IDECL static __inline
N#define _IDEFN static __inline
N#define __INLINE static __inline
N#else
S#define _IDECL extern _CODE_ACCESS
S#define _IDEFN _CODE_ACCESS
S#define __INLINE __EXTERN
N#endif
N
N#pragma diag_pop
N
N#endif /* ifndef _LINKAGE */
L 691 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/yvals.h" 2
N#ifndef __LOCK_H
N#include <_lock.h>
L 1 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/_lock.h" 1
N/*****************************************************************************/
N/*  _lock.h v5.2.6                                                           */
N/*                                                                           */
N/* Copyright (c) 2000-2015 Texas Instruments Incorporated                    */
N/* http://www.ti.com/                                                        */
N/*                                                                           */
N/*  Redistribution and  use in source  and binary forms, with  or without    */
N/*  modification,  are permitted provided  that the  following conditions    */
N/*  are met:                                                                 */
N/*                                                                           */
N/*     Redistributions  of source  code must  retain the  above copyright    */
N/*     notice, this list of conditions and the following disclaimer.         */
N/*                                                                           */
N/*     Redistributions in binary form  must reproduce the above copyright    */
N/*     notice, this  list of conditions  and the following  disclaimer in    */
N/*     the  documentation  and/or   other  materials  provided  with  the    */
N/*     distribution.                                                         */
N/*                                                                           */
N/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
N/*     of its  contributors may  be used to  endorse or  promote products    */
N/*     derived  from   this  software  without   specific  prior  written    */
N/*     permission.                                                           */
N/*                                                                           */
N/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
N/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
N/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
N/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
N/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
N/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
N/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
N/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
N/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
N/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
N/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
N/*                                                                           */
N/*****************************************************************************/
N
N#ifndef __LOCK_H
N#define __LOCK_H
N
N#include <linkage.h>
N
N#ifdef __cplusplus
Sextern "C" {
N#endif
N
N#pragma diag_push
N
N/* _nop(), _lock(), and _unlock() all accept zero or more optional arguments,
N   which must remain as empty rather than (void) parameter lists to avoid
N   breaking the API */
N#pragma CHECK_MISRA("-16.5")
N
N_CODE_ACCESS void _nop();
X void _nop();
N
Nextern _DATA_ACCESS void (  *_lock)();
Xextern  void (  *_lock)();
Nextern _DATA_ACCESS void (*_unlock)();
Xextern  void (*_unlock)();
N
N_CODE_ACCESS void _register_lock  (void (  *lock)());
X void _register_lock  (void (  *lock)());
N_CODE_ACCESS void _register_unlock(void (*unlock)());
X void _register_unlock(void (*unlock)());
N
N#pragma diag_pop
N
N#define SYSTEM_WIDE_LOCK_REGISTERED	(_lock != _nop)
N#define SYSTEM_WIDE_UNLOCK_REGISTERED	(_unlock != _nop)
N
N#ifdef __cplusplus
S} /* extern "C" */
N#endif
N
N#endif /* __LOCK_H */
L 693 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/yvals.h" 2
N#endif /* __LOCK_H */
N
N#pragma diag_pop
N
N#endif /* _YVALS */
N
N/*
N * Copyright (c) 1992-2004 by P.J. Plauger.  ALL RIGHTS RESERVED.
N * Consult your license regarding permissions and restrictions.
NV4.02:1476 */
N
L 6 "C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include/stdbool.h" 2
N#endif /* _YVALS */
N
N_C_STD_BEGIN
X
N
N #define __bool_true_false_are_defined	1
N
N #ifndef __cplusplus
N		/* TYPES */
N
N #if 199901L <= __STDC_VERSION__
X #if 199901L <= 199409L
S
S
N #else /* 199901L <= __STDC_VERSION__ */
N#if __TI_STRICT_ANSI_MODE__
X#if 0
Stypedef unsigned char _Bool;
N#endif
N #endif /* 199901L <= __STDC_VERSION__ */
N
N		/* MACROS */
N #define bool	_Bool
N #define false	0
N #define true	1
N #endif /* __cplusplus */
N
N_C_STD_END
X
N#endif /* _STDBOOL */
N
N/*
N * Copyright (c) 1992-2004 by P.J. Plauger.  ALL RIGHTS RESERVED.
N * Consult your license regarding permissions and restrictions.
NV4.02:1476 */
L 5 "..\BMP280.h" 2
N
N
N
N
N
N
N
N
N
Nbool bmp_initI2C(void) ;
X_Bool bmp_initI2C(void) ;
Nvoid bmp_i2cWrite(uint8_t addr, uint8_t regAddr, uint8_t data);
Nvoid bmp_i2cWriteData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length);
Nuint8_t bmp_i2cRead(uint8_t addr, uint8_t regAddr);
Nvoid bmp_i2cReadData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length);
Nfloat bmp_readTemperature(void);
Nfloat readHumidity(void);
Nfloat readPressure(void);
Nvoid calibration();
L 3 "../bmp280.c" 2
N
N#include "inc/hw_memmap.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/inc/hw_memmap.h" 1
N//*****************************************************************************
N//
N// hw_memmap.h - Macros defining the memory map of the device.
N//
N// Copyright (c) 2005-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N//   Redistribution and use in source and binary forms, with or without
N//   modification, are permitted provided that the following conditions
N//   are met:
N// 
N//   Redistributions of source code must retain the above copyright
N//   notice, this list of conditions and the following disclaimer.
N// 
N//   Redistributions in binary form must reproduce the above copyright
N//   notice, this list of conditions and the following disclaimer in the
N//   documentation and/or other materials provided with the  
N//   distribution.
N// 
N//   Neither the name of Texas Instruments Incorporated nor the names of
N//   its contributors may be used to endorse or promote products derived
N//   from this software without specific prior written permission.
N// 
N// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
N// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
N// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
N// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
N// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
N// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
N// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
N// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
N// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N// 
N// This is part of revision 2.1.3.156 of the Tiva Firmware Development Package.
N//
N//*****************************************************************************
N
N#ifndef __HW_MEMMAP_H__
N#define __HW_MEMMAP_H__
N
N//*****************************************************************************
N//
N// The following are defines for the base address of the memories and
N// peripherals.
N//
N//*****************************************************************************
N#define FLASH_BASE              0x00000000  // FLASH memory
N#define SRAM_BASE               0x20000000  // SRAM memory
N#define WATCHDOG0_BASE          0x40000000  // Watchdog0
N#define WATCHDOG1_BASE          0x40001000  // Watchdog1
N#define GPIO_PORTA_BASE         0x40004000  // GPIO Port A
N#define GPIO_PORTB_BASE         0x40005000  // GPIO Port B
N#define GPIO_PORTC_BASE         0x40006000  // GPIO Port C
N#define GPIO_PORTD_BASE         0x40007000  // GPIO Port D
N#define SSI0_BASE               0x40008000  // SSI0
N#define SSI1_BASE               0x40009000  // SSI1
N#define SSI2_BASE               0x4000A000  // SSI2
N#define SSI3_BASE               0x4000B000  // SSI3
N#define UART0_BASE              0x4000C000  // UART0
N#define UART1_BASE              0x4000D000  // UART1
N#define UART2_BASE              0x4000E000  // UART2
N#define UART3_BASE              0x4000F000  // UART3
N#define UART4_BASE              0x40010000  // UART4
N#define UART5_BASE              0x40011000  // UART5
N#define UART6_BASE              0x40012000  // UART6
N#define UART7_BASE              0x40013000  // UART7
N#define I2C0_BASE               0x40020000  // I2C0
N#define I2C1_BASE               0x40021000  // I2C1
N#define I2C2_BASE               0x40022000  // I2C2
N#define I2C3_BASE               0x40023000  // I2C3
N#define GPIO_PORTE_BASE         0x40024000  // GPIO Port E
N#define GPIO_PORTF_BASE         0x40025000  // GPIO Port F
N#define GPIO_PORTG_BASE         0x40026000  // GPIO Port G
N#define GPIO_PORTH_BASE         0x40027000  // GPIO Port H
N#define PWM0_BASE               0x40028000  // Pulse Width Modulator (PWM)
N#define PWM1_BASE               0x40029000  // Pulse Width Modulator (PWM)
N#define QEI0_BASE               0x4002C000  // QEI0
N#define QEI1_BASE               0x4002D000  // QEI1
N#define TIMER0_BASE             0x40030000  // Timer0
N#define TIMER1_BASE             0x40031000  // Timer1
N#define TIMER2_BASE             0x40032000  // Timer2
N#define TIMER3_BASE             0x40033000  // Timer3
N#define TIMER4_BASE             0x40034000  // Timer4
N#define TIMER5_BASE             0x40035000  // Timer5
N#define WTIMER0_BASE            0x40036000  // Wide Timer0
N#define WTIMER1_BASE            0x40037000  // Wide Timer1
N#define ADC0_BASE               0x40038000  // ADC0
N#define ADC1_BASE               0x40039000  // ADC1
N#define COMP_BASE               0x4003C000  // Analog comparators
N#define GPIO_PORTJ_BASE         0x4003D000  // GPIO Port J
N#define CAN0_BASE               0x40040000  // CAN0
N#define CAN1_BASE               0x40041000  // CAN1
N#define WTIMER2_BASE            0x4004C000  // Wide Timer2
N#define WTIMER3_BASE            0x4004D000  // Wide Timer3
N#define WTIMER4_BASE            0x4004E000  // Wide Timer4
N#define WTIMER5_BASE            0x4004F000  // Wide Timer5
N#define USB0_BASE               0x40050000  // USB 0 Controller
N#define GPIO_PORTA_AHB_BASE     0x40058000  // GPIO Port A (high speed)
N#define GPIO_PORTB_AHB_BASE     0x40059000  // GPIO Port B (high speed)
N#define GPIO_PORTC_AHB_BASE     0x4005A000  // GPIO Port C (high speed)
N#define GPIO_PORTD_AHB_BASE     0x4005B000  // GPIO Port D (high speed)
N#define GPIO_PORTE_AHB_BASE     0x4005C000  // GPIO Port E (high speed)
N#define GPIO_PORTF_AHB_BASE     0x4005D000  // GPIO Port F (high speed)
N#define GPIO_PORTG_AHB_BASE     0x4005E000  // GPIO Port G (high speed)
N#define GPIO_PORTH_AHB_BASE     0x4005F000  // GPIO Port H (high speed)
N#define GPIO_PORTJ_AHB_BASE     0x40060000  // GPIO Port J (high speed)
N#define GPIO_PORTK_BASE         0x40061000  // GPIO Port K
N#define GPIO_PORTL_BASE         0x40062000  // GPIO Port L
N#define GPIO_PORTM_BASE         0x40063000  // GPIO Port M
N#define GPIO_PORTN_BASE         0x40064000  // GPIO Port N
N#define GPIO_PORTP_BASE         0x40065000  // GPIO Port P
N#define GPIO_PORTQ_BASE         0x40066000  // GPIO Port Q
N#define GPIO_PORTR_BASE         0x40067000  // General-Purpose Input/Outputs
N                                            // (GPIOs)
N#define GPIO_PORTS_BASE         0x40068000  // General-Purpose Input/Outputs
N                                            // (GPIOs)
N#define GPIO_PORTT_BASE         0x40069000  // General-Purpose Input/Outputs
N                                            // (GPIOs)
N#define EEPROM_BASE             0x400AF000  // EEPROM memory
N#define ONEWIRE0_BASE           0x400B6000  // 1-Wire Master Module
N#define I2C8_BASE               0x400B8000  // I2C8
N#define I2C9_BASE               0x400B9000  // I2C9
N#define I2C4_BASE               0x400C0000  // I2C4
N#define I2C5_BASE               0x400C1000  // I2C5
N#define I2C6_BASE               0x400C2000  // I2C6
N#define I2C7_BASE               0x400C3000  // I2C7
N#define EPI0_BASE               0x400D0000  // EPI0
N#define TIMER6_BASE             0x400E0000  // General-Purpose Timers
N#define TIMER7_BASE             0x400E1000  // General-Purpose Timers
N#define EMAC0_BASE              0x400EC000  // Ethernet Controller
N#define SYSEXC_BASE             0x400F9000  // System Exception Module
N#define HIB_BASE                0x400FC000  // Hibernation Module
N#define FLASH_CTRL_BASE         0x400FD000  // FLASH Controller
N#define SYSCTL_BASE             0x400FE000  // System Control
N#define UDMA_BASE               0x400FF000  // uDMA Controller
N#define CCM0_BASE               0x44030000  // Cyclical Redundancy Check (CRC)
N#define SHAMD5_BASE             0x44034000  // SHA/MD5 Accelerator
N#define AES_BASE                0x44036000  // Advance Encryption
N                                            // Hardware-Accelerated Module
N#define DES_BASE                0x44038000  // Data Encryption Standard
N                                            // Accelerator (DES)
N#define LCD0_BASE               0x44050000  // LCD Controller
N#define ITM_BASE                0xE0000000  // Instrumentation Trace Macrocell
N#define DWT_BASE                0xE0001000  // Data Watchpoint and Trace
N#define FPB_BASE                0xE0002000  // FLASH Patch and Breakpoint
N#define NVIC_BASE               0xE000E000  // Nested Vectored Interrupt Ctrl
N#define TPIU_BASE               0xE0040000  // Trace Port Interface Unit
N
N#endif // __HW_MEMMAP_H__
L 5 "../bmp280.c" 2
N#include "driverlib/gpio.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/driverlib/gpio.h" 1
N//*****************************************************************************
N//
N// gpio.h - Defines and Macros for GPIO API.
N//
N// Copyright (c) 2005-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N//   Redistribution and use in source and binary forms, with or without
N//   modification, are permitted provided that the following conditions
N//   are met:
N// 
N//   Redistributions of source code must retain the above copyright
N//   notice, this list of conditions and the following disclaimer.
N// 
N//   Redistributions in binary form must reproduce the above copyright
N//   notice, this list of conditions and the following disclaimer in the
N//   documentation and/or other materials provided with the  
N//   distribution.
N// 
N//   Neither the name of Texas Instruments Incorporated nor the names of
N//   its contributors may be used to endorse or promote products derived
N//   from this software without specific prior written permission.
N// 
N// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
N// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
N// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
N// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
N// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
N// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
N// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
N// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
N// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N// 
N// This is part of revision 2.1.3.156 of the Tiva Peripheral Driver Library.
N//
N//*****************************************************************************
N
N#ifndef __DRIVERLIB_GPIO_H__
N#define __DRIVERLIB_GPIO_H__
N
N//*****************************************************************************
N//
N// If building with a C++ compiler, make all of the definitions in this header
N// have a C binding.
N//
N//*****************************************************************************
N#ifdef __cplusplus
Sextern "C"
S{
N#endif
N
N//*****************************************************************************
N//
N// The following values define the bit field for the ui8Pins argument to
N// several of the APIs.
N//
N//*****************************************************************************
N#define GPIO_PIN_0              0x00000001  // GPIO pin 0
N#define GPIO_PIN_1              0x00000002  // GPIO pin 1
N#define GPIO_PIN_2              0x00000004  // GPIO pin 2
N#define GPIO_PIN_3              0x00000008  // GPIO pin 3
N#define GPIO_PIN_4              0x00000010  // GPIO pin 4
N#define GPIO_PIN_5              0x00000020  // GPIO pin 5
N#define GPIO_PIN_6              0x00000040  // GPIO pin 6
N#define GPIO_PIN_7              0x00000080  // GPIO pin 7
N
N//*****************************************************************************
N//
N// Values that can be passed to GPIODirModeSet as the ui32PinIO parameter, and
N// returned from GPIODirModeGet.
N//
N//*****************************************************************************
N#define GPIO_DIR_MODE_IN        0x00000000  // Pin is a GPIO input
N#define GPIO_DIR_MODE_OUT       0x00000001  // Pin is a GPIO output
N#define GPIO_DIR_MODE_HW        0x00000002  // Pin is a peripheral function
N
N//*****************************************************************************
N//
N// Values that can be passed to GPIOIntTypeSet as the ui32IntType parameter,
N// and returned from GPIOIntTypeGet.
N//
N//*****************************************************************************
N#define GPIO_FALLING_EDGE       0x00000000  // Interrupt on falling edge
N#define GPIO_RISING_EDGE        0x00000004  // Interrupt on rising edge
N#define GPIO_BOTH_EDGES         0x00000001  // Interrupt on both edges
N#define GPIO_LOW_LEVEL          0x00000002  // Interrupt on low level
N#define GPIO_HIGH_LEVEL         0x00000006  // Interrupt on high level
N#define GPIO_DISCRETE_INT       0x00010000  // Interrupt for individual pins
N
N//*****************************************************************************
N//
N// Values that can be passed to GPIOPadConfigSet as the ui32Strength parameter,
N// and returned by GPIOPadConfigGet in the *pui32Strength parameter.
N//
N//*****************************************************************************
N#define GPIO_STRENGTH_2MA       0x00000001  // 2mA drive strength
N#define GPIO_STRENGTH_4MA       0x00000002  // 4mA drive strength
N#define GPIO_STRENGTH_6MA       0x00000065  // 6mA drive strength
N#define GPIO_STRENGTH_8MA       0x00000066  // 8mA drive strength
N#define GPIO_STRENGTH_8MA_SC    0x0000006E  // 8mA drive with slew rate control
N#define GPIO_STRENGTH_10MA      0x00000075  // 10mA drive strength
N#define GPIO_STRENGTH_12MA      0x00000077  // 12mA drive strength
N
N//*****************************************************************************
N//
N// Values that can be passed to GPIOPadConfigSet as the ui32PadType parameter,
N// and returned by GPIOPadConfigGet in the *pui32PadType parameter.
N//
N//*****************************************************************************
N#define GPIO_PIN_TYPE_STD       0x00000008  // Push-pull
N#define GPIO_PIN_TYPE_STD_WPU   0x0000000A  // Push-pull with weak pull-up
N#define GPIO_PIN_TYPE_STD_WPD   0x0000000C  // Push-pull with weak pull-down
N#define GPIO_PIN_TYPE_OD        0x00000009  // Open-drain
N#define GPIO_PIN_TYPE_ANALOG    0x00000000  // Analog comparator
N#define GPIO_PIN_TYPE_WAKE_HIGH 0x00000208  // Hibernate wake, high
N#define GPIO_PIN_TYPE_WAKE_LOW  0x00000108  // Hibernate wake, low
N
N//*****************************************************************************
N//
N// Values that can be passed to GPIOIntEnable() and GPIOIntDisable() functions
N// in the ui32IntFlags parameter.
N//
N//*****************************************************************************
N#define GPIO_INT_PIN_0          0x00000001
N#define GPIO_INT_PIN_1          0x00000002
N#define GPIO_INT_PIN_2          0x00000004
N#define GPIO_INT_PIN_3          0x00000008
N#define GPIO_INT_PIN_4          0x00000010
N#define GPIO_INT_PIN_5          0x00000020
N#define GPIO_INT_PIN_6          0x00000040
N#define GPIO_INT_PIN_7          0x00000080
N#define GPIO_INT_DMA            0x00000100
N
N//*****************************************************************************
N//
N// Prototypes for the APIs.
N//
N//*****************************************************************************
Nextern void GPIODirModeSet(uint32_t ui32Port, uint8_t ui8Pins,
N                           uint32_t ui32PinIO);
Nextern uint32_t GPIODirModeGet(uint32_t ui32Port, uint8_t ui8Pin);
Nextern void GPIOIntTypeSet(uint32_t ui32Port, uint8_t ui8Pins,
N                           uint32_t ui32IntType);
Nextern uint32_t GPIOIntTypeGet(uint32_t ui32Port, uint8_t ui8Pin);
Nextern void GPIOPadConfigSet(uint32_t ui32Port, uint8_t ui8Pins,
N                             uint32_t ui32Strength, uint32_t ui32PadType);
Nextern void GPIOPadConfigGet(uint32_t ui32Port, uint8_t ui8Pin,
N                             uint32_t *pui32Strength, uint32_t *pui32PadType);
Nextern void GPIOIntEnable(uint32_t ui32Port, uint32_t ui32IntFlags);
Nextern void GPIOIntDisable(uint32_t ui32Port, uint32_t ui32IntFlags);
Nextern uint32_t GPIOIntStatus(uint32_t ui32Port, bool bMasked);
Xextern uint32_t GPIOIntStatus(uint32_t ui32Port, _Bool bMasked);
Nextern void GPIOIntClear(uint32_t ui32Port, uint32_t ui32IntFlags);
Nextern void GPIOIntRegister(uint32_t ui32Port, void (*pfnIntHandler)(void));
Nextern void GPIOIntUnregister(uint32_t ui32Port);
Nextern int32_t GPIOPinRead(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinWrite(uint32_t ui32Port, uint8_t ui8Pins, uint8_t ui8Val);
Nextern void GPIOPinConfigure(uint32_t ui32PinConfig);
Nextern void GPIOPinTypeADC(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeCAN(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeComparator(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeComparatorOutput(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeDIVSCLK(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeEPI(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeEthernetLED(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeEthernetMII(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeGPIOInput(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeGPIOOutput(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeGPIOOutputOD(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeHibernateRTCCLK(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeI2C(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeI2CSCL(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeLCD(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeOneWire(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypePWM(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeQEI(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeSSI(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeTimer(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeTrace(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeUART(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeUSBAnalog(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeUSBDigital(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeWakeHigh(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOPinTypeWakeLow(uint32_t ui32Port, uint8_t ui8Pins);
Nextern uint32_t GPIOPinWakeStatus(uint32_t ui32Port);
Nextern void GPIODMATriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIODMATriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOADCTriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
Nextern void GPIOADCTriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);
N
N//*****************************************************************************
N//
N// Mark the end of the C bindings section for C++ compilers.
N//
N//*****************************************************************************
N#ifdef __cplusplus
S}
N#endif
N
N#endif // __DRIVERLIB_GPIO_H__
L 6 "../bmp280.c" 2
N#include "driverlib/pin_map.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/driverlib/pin_map.h" 1
N//*****************************************************************************
N//
N// pin_map.h - Mapping of peripherals to pins for all parts.
N//
N// Copyright (c) 2007-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N//   Redistribution and use in source and binary forms, with or without
N//   modification, are permitted provided that the following conditions
N//   are met:
N// 
N//   Redistributions of source code must retain the above copyright
N//   notice, this list of conditions and the following disclaimer.
N// 
N//   Redistributions in binary form must reproduce the above copyright
N//   notice, this list of conditions and the following disclaimer in the
N//   documentation and/or other materials provided with the  
N//   distribution.
N// 
N//   Neither the name of Texas Instruments Incorporated nor the names of
N//   its contributors may be used to endorse or promote products derived
N//   from this software without specific prior written permission.
N// 
N// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
N// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
N// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
N// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
N// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
N// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
N// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
N// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
N// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N// 
N// This is part of revision 2.1.3.156 of the Tiva Peripheral Driver Library.
N//
N//*****************************************************************************
N
N#ifndef __DRIVERLIB_PIN_MAP_H__
N#define __DRIVERLIB_PIN_MAP_H__
N
N//*****************************************************************************
N//
N// TM4C1230C3PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1230C3PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1230C3PM
N
N//*****************************************************************************
N//
N// TM4C1230D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1230D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1230D5PM
N
N//*****************************************************************************
N//
N// TM4C1230E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1230E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1230E6PM
N
N//*****************************************************************************
N//
N// TM4C1230H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1230H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1230H6PM
N
N//*****************************************************************************
N//
N// TM4C1231C3PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231C3PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1231C3PM
N
N//*****************************************************************************
N//
N// TM4C1231D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1231D5PM
N
N//*****************************************************************************
N//
N// TM4C1231D5PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231D5PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1231D5PZ
N
N//*****************************************************************************
N//
N// TM4C1231E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1231E6PM
N
N//*****************************************************************************
N//
N// TM4C1231E6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231E6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1231E6PZ
N
N//*****************************************************************************
N//
N// TM4C1231H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1231H6PM
N
N//*****************************************************************************
N//
N// TM4C1231H6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231H6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1231H6PZ
N
N//*****************************************************************************
N//
N// TM4C1232C3PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1232C3PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1232C3PM
N
N//*****************************************************************************
N//
N// TM4C1232D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1232D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1232D5PM
N
N//*****************************************************************************
N//
N// TM4C1232E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1232E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1232E6PM
N
N//*****************************************************************************
N//
N// TM4C1232H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1232H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C1232H6PM
N
N//*****************************************************************************
N//
N// TM4C1233C3PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233C3PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1233C3PM
N
N//*****************************************************************************
N//
N// TM4C1233D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1233D5PM
N
N//*****************************************************************************
N//
N// TM4C1233D5PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233D5PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1233D5PZ
N
N//*****************************************************************************
N//
N// TM4C1233E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1233E6PM
N
N//*****************************************************************************
N//
N// TM4C1233E6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233E6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1233E6PZ
N
N//*****************************************************************************
N//
N// TM4C1233H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C1233H6PM
N
N//*****************************************************************************
N//
N// TM4C1233H6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233H6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1233H6PZ
N
N//*****************************************************************************
N//
N// TM4C1236D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1236D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
N#endif // PART_TM4C1236D5PM
N
N//*****************************************************************************
N//
N// TM4C1236E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1236E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
N#endif // PART_TM4C1236E6PM
N
N//*****************************************************************************
N//
N// TM4C1236H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1236H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
N#endif // PART_TM4C1236H6PM
N
N//*****************************************************************************
N//
N// TM4C1237D5PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237D5PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
N#endif // PART_TM4C1237D5PM
N
N//*****************************************************************************
N//
N// TM4C1237D5PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237D5PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1237D5PZ
N
N//*****************************************************************************
N//
N// TM4C1237E6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237E6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
N#endif // PART_TM4C1237E6PM
N
N//*****************************************************************************
N//
N// TM4C1237E6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237E6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1237E6PZ
N
N//*****************************************************************************
N//
N// TM4C1237H6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237H6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
N#endif // PART_TM4C1237H6PM
N
N//*****************************************************************************
N//
N// TM4C1237H6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237H6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
N#endif // PART_TM4C1237H6PZ
N
N//*****************************************************************************
N//
N// TM4C123AE6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123AE6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C123AE6PM
N
N//*****************************************************************************
N//
N// TM4C123AH6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123AH6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
N#endif // PART_TM4C123AH6PM
N
N//*****************************************************************************
N//
N// TM4C123BE6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BE6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C123BE6PM
N
N//*****************************************************************************
N//
N// TM4C123BE6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BE6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
N#endif // PART_TM4C123BE6PZ
N
N//*****************************************************************************
N//
N// TM4C123BH6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BH6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S
N#endif // PART_TM4C123BH6PM
N
N//*****************************************************************************
N//
N// TM4C123BH6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BH6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
N#endif // PART_TM4C123BH6PZ
N
N//*****************************************************************************
N//
N// TM4C123FE6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123FE6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
N#endif // PART_TM4C123FE6PM
N
N//*****************************************************************************
N//
N// TM4C123FH6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123FH6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
N#endif // PART_TM4C123FH6PM
N
N//*****************************************************************************
N//
N// TM4C123GE6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GE6PM
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S
N#endif // PART_TM4C123GE6PM
N
N//*****************************************************************************
N//
N// TM4C123GE6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GE6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
N#endif // PART_TM4C123GE6PZ
N
N//*****************************************************************************
N//
N// TM4C123GH6PM Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GH6PM
N
N#define GPIO_PA0_U0RX           0x00000001
N#define GPIO_PA0_CAN1RX         0x00000008
N
N#define GPIO_PA1_U0TX           0x00000401
N#define GPIO_PA1_CAN1TX         0x00000408
N
N#define GPIO_PA2_SSI0CLK        0x00000802
N
N#define GPIO_PA3_SSI0FSS        0x00000C02
N
N#define GPIO_PA4_SSI0RX         0x00001002
N
N#define GPIO_PA5_SSI0TX         0x00001402
N
N#define GPIO_PA6_I2C1SCL        0x00001803
N#define GPIO_PA6_M1PWM2         0x00001805
N
N#define GPIO_PA7_I2C1SDA        0x00001C03
N#define GPIO_PA7_M1PWM3         0x00001C05
N
N#define GPIO_PB0_U1RX           0x00010001
N#define GPIO_PB0_T2CCP0         0x00010007
N
N#define GPIO_PB1_U1TX           0x00010401
N#define GPIO_PB1_T2CCP1         0x00010407
N
N#define GPIO_PB2_I2C0SCL        0x00010803
N#define GPIO_PB2_T3CCP0         0x00010807
N
N#define GPIO_PB3_I2C0SDA        0x00010C03
N#define GPIO_PB3_T3CCP1         0x00010C07
N
N#define GPIO_PB4_SSI2CLK        0x00011002
N#define GPIO_PB4_M0PWM2         0x00011004
N#define GPIO_PB4_T1CCP0         0x00011007
N#define GPIO_PB4_CAN0RX         0x00011008
N
N#define GPIO_PB5_SSI2FSS        0x00011402
N#define GPIO_PB5_M0PWM3         0x00011404
N#define GPIO_PB5_T1CCP1         0x00011407
N#define GPIO_PB5_CAN0TX         0x00011408
N
N#define GPIO_PB6_SSI2RX         0x00011802
N#define GPIO_PB6_M0PWM0         0x00011804
N#define GPIO_PB6_T0CCP0         0x00011807
N
N#define GPIO_PB7_SSI2TX         0x00011C02
N#define GPIO_PB7_M0PWM1         0x00011C04
N#define GPIO_PB7_T0CCP1         0x00011C07
N
N#define GPIO_PC0_TCK            0x00020001
N#define GPIO_PC0_SWCLK          0x00020001
N#define GPIO_PC0_T4CCP0         0x00020007
N
N#define GPIO_PC1_TMS            0x00020401
N#define GPIO_PC1_SWDIO          0x00020401
N#define GPIO_PC1_T4CCP1         0x00020407
N
N#define GPIO_PC2_TDI            0x00020801
N#define GPIO_PC2_T5CCP0         0x00020807
N
N#define GPIO_PC3_SWO            0x00020C01
N#define GPIO_PC3_TDO            0x00020C01
N#define GPIO_PC3_T5CCP1         0x00020C07
N
N#define GPIO_PC4_U4RX           0x00021001
N#define GPIO_PC4_U1RX           0x00021002
N#define GPIO_PC4_M0PWM6         0x00021004
N#define GPIO_PC4_IDX1           0x00021006
N#define GPIO_PC4_WT0CCP0        0x00021007
N#define GPIO_PC4_U1RTS          0x00021008
N
N#define GPIO_PC5_U4TX           0x00021401
N#define GPIO_PC5_U1TX           0x00021402
N#define GPIO_PC5_M0PWM7         0x00021404
N#define GPIO_PC5_PHA1           0x00021406
N#define GPIO_PC5_WT0CCP1        0x00021407
N#define GPIO_PC5_U1CTS          0x00021408
N
N#define GPIO_PC6_U3RX           0x00021801
N#define GPIO_PC6_PHB1           0x00021806
N#define GPIO_PC6_WT1CCP0        0x00021807
N#define GPIO_PC6_USB0EPEN       0x00021808
N
N#define GPIO_PC7_U3TX           0x00021C01
N#define GPIO_PC7_WT1CCP1        0x00021C07
N#define GPIO_PC7_USB0PFLT       0x00021C08
N
N#define GPIO_PD0_SSI3CLK        0x00030001
N#define GPIO_PD0_SSI1CLK        0x00030002
N#define GPIO_PD0_I2C3SCL        0x00030003
N#define GPIO_PD0_M0PWM6         0x00030004
N#define GPIO_PD0_M1PWM0         0x00030005
N#define GPIO_PD0_WT2CCP0        0x00030007
N
N#define GPIO_PD1_SSI3FSS        0x00030401
N#define GPIO_PD1_SSI1FSS        0x00030402
N#define GPIO_PD1_I2C3SDA        0x00030403
N#define GPIO_PD1_M0PWM7         0x00030404
N#define GPIO_PD1_M1PWM1         0x00030405
N#define GPIO_PD1_WT2CCP1        0x00030407
N
N#define GPIO_PD2_SSI3RX         0x00030801
N#define GPIO_PD2_SSI1RX         0x00030802
N#define GPIO_PD2_M0FAULT0       0x00030804
N#define GPIO_PD2_WT3CCP0        0x00030807
N#define GPIO_PD2_USB0EPEN       0x00030808
N
N#define GPIO_PD3_SSI3TX         0x00030C01
N#define GPIO_PD3_SSI1TX         0x00030C02
N#define GPIO_PD3_IDX0           0x00030C06
N#define GPIO_PD3_WT3CCP1        0x00030C07
N#define GPIO_PD3_USB0PFLT       0x00030C08
N
N#define GPIO_PD4_U6RX           0x00031001
N#define GPIO_PD4_WT4CCP0        0x00031007
N
N#define GPIO_PD5_U6TX           0x00031401
N#define GPIO_PD5_WT4CCP1        0x00031407
N
N#define GPIO_PD6_U2RX           0x00031801
N#define GPIO_PD6_M0FAULT0       0x00031804
N#define GPIO_PD6_PHA0           0x00031806
N#define GPIO_PD6_WT5CCP0        0x00031807
N
N#define GPIO_PD7_U2TX           0x00031C01
N#define GPIO_PD7_PHB0           0x00031C06
N#define GPIO_PD7_WT5CCP1        0x00031C07
N#define GPIO_PD7_NMI            0x00031C08
N
N#define GPIO_PE0_U7RX           0x00040001
N
N#define GPIO_PE1_U7TX           0x00040401
N
N#define GPIO_PE4_U5RX           0x00041001
N#define GPIO_PE4_I2C2SCL        0x00041003
N#define GPIO_PE4_M0PWM4         0x00041004
N#define GPIO_PE4_M1PWM2         0x00041005
N#define GPIO_PE4_CAN0RX         0x00041008
N
N#define GPIO_PE5_U5TX           0x00041401
N#define GPIO_PE5_I2C2SDA        0x00041403
N#define GPIO_PE5_M0PWM5         0x00041404
N#define GPIO_PE5_M1PWM3         0x00041405
N#define GPIO_PE5_CAN0TX         0x00041408
N
N#define GPIO_PF0_U1RTS          0x00050001
N#define GPIO_PF0_SSI1RX         0x00050002
N#define GPIO_PF0_CAN0RX         0x00050003
N#define GPIO_PF0_M1PWM4         0x00050005
N#define GPIO_PF0_PHA0           0x00050006
N#define GPIO_PF0_T0CCP0         0x00050007
N#define GPIO_PF0_NMI            0x00050008
N#define GPIO_PF0_C0O            0x00050009
N
N#define GPIO_PF1_U1CTS          0x00050401
N#define GPIO_PF1_SSI1TX         0x00050402
N#define GPIO_PF1_M1PWM5         0x00050405
N#define GPIO_PF1_PHB0           0x00050406
N#define GPIO_PF1_T0CCP1         0x00050407
N#define GPIO_PF1_C1O            0x00050409
N#define GPIO_PF1_TRD1           0x0005040E
N
N#define GPIO_PF2_SSI1CLK        0x00050802
N#define GPIO_PF2_M0FAULT0       0x00050804
N#define GPIO_PF2_M1PWM6         0x00050805
N#define GPIO_PF2_T1CCP0         0x00050807
N#define GPIO_PF2_TRD0           0x0005080E
N
N#define GPIO_PF3_SSI1FSS        0x00050C02
N#define GPIO_PF3_CAN0TX         0x00050C03
N#define GPIO_PF3_M1PWM7         0x00050C05
N#define GPIO_PF3_T1CCP1         0x00050C07
N#define GPIO_PF3_TRCLK          0x00050C0E
N
N#define GPIO_PF4_M1FAULT0       0x00051005
N#define GPIO_PF4_IDX0           0x00051006
N#define GPIO_PF4_T2CCP0         0x00051007
N#define GPIO_PF4_USB0EPEN       0x00051008
N
N#endif // PART_TM4C123GH6PM
N
N//*****************************************************************************
N//
N// TM4C123GH6PZ Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GH6PZ
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
N#endif // PART_TM4C123GH6PZ
N
N//*****************************************************************************
N//
N// TM4C1231H6PGE Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1231H6PGE
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_T5CCP0         0x000D0807
S
N#endif // PART_TM4C1231H6PGE
N
N//*****************************************************************************
N//
N// TM4C1233H6PGE Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1233H6PGE
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_T5CCP0         0x000D0807
S
N#endif // PART_TM4C1233H6PGE
N
N//*****************************************************************************
N//
N// TM4C1237H6PGE Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1237H6PGE
S
S#define GPIO_PA0_U0RX           0x00000001
S
S#define GPIO_PA1_U0TX           0x00000401
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE7_U1RI           0x00041C01
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S
S#define GPIO_PK2_SSI3RX         0x00090802
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_T5CCP0         0x000D0807
S
N#endif // PART_TM4C1237H6PGE
N
N//*****************************************************************************
N//
N// TM4C123BH6PGE Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BH6PGE
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_M0FAULT0       0x00091006
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_M0FAULT1       0x00091406
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_M0FAULT2       0x00091806
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_M0FAULT3       0x00091C06
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_M0PWM4         0x000B1802
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_M0PWM5         0x000B1C02
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_M0PWM6         0x000C0802
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_M0PWM7         0x000C0C02
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_M1PWM4         0x000C1002
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_M1PWM5         0x000C1402
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_M1PWM6         0x000C1802
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_M1PWM7         0x000C1C02
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_M0PWM0         0x000D0001
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_M0PWM1         0x000D0401
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_M0PWM2         0x000D0801
S#define GPIO_PP2_T5CCP0         0x000D0807
S
N#endif // PART_TM4C123BH6PGE
N
N//*****************************************************************************
N//
N// TM4C123BH6ZRB Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123BH6ZRB
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_M0FAULT0       0x00091006
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_M0FAULT1       0x00091406
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_M0FAULT2       0x00091806
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_M0FAULT3       0x00091C06
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_M0PWM4         0x000B1802
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_M0PWM5         0x000B1C02
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_M0PWM6         0x000C0802
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_M0PWM7         0x000C0C02
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_M1PWM4         0x000C1002
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_M1PWM5         0x000C1402
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_M1PWM6         0x000C1802
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_M1PWM7         0x000C1C02
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_M0PWM0         0x000D0001
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_M0PWM1         0x000D0401
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_M0PWM2         0x000D0801
S#define GPIO_PP2_T5CCP0         0x000D0807
S
S#define GPIO_PP3_M0PWM3         0x000D0C01
S#define GPIO_PP3_T5CCP1         0x000D0C07
S
S#define GPIO_PP4_M0PWM4         0x000D1001
S#define GPIO_PP4_WT0CCP0        0x000D1007
S
S#define GPIO_PP5_M0PWM5         0x000D1401
S#define GPIO_PP5_WT0CCP1        0x000D1407
S
S#define GPIO_PP6_M0PWM6         0x000D1801
S#define GPIO_PP6_WT1CCP0        0x000D1807
S
S#define GPIO_PP7_M0PWM7         0x000D1C01
S#define GPIO_PP7_WT1CCP1        0x000D1C07
S
S#define GPIO_PQ0_M1PWM0         0x000E0001
S#define GPIO_PQ0_WT2CCP0        0x000E0007
S
S#define GPIO_PQ1_M1PWM1         0x000E0401
S#define GPIO_PQ1_WT2CCP1        0x000E0407
S
S#define GPIO_PQ2_M1PWM2         0x000E0801
S#define GPIO_PQ2_WT3CCP0        0x000E0807
S
S#define GPIO_PQ3_M1PWM3         0x000E0C01
S#define GPIO_PQ3_WT3CCP1        0x000E0C07
S
S#define GPIO_PQ4_M1PWM4         0x000E1001
S#define GPIO_PQ4_WT4CCP0        0x000E1007
S
S#define GPIO_PQ5_M1PWM5         0x000E1401
S#define GPIO_PQ5_WT4CCP1        0x000E1407
S
S#define GPIO_PQ6_M1PWM6         0x000E1801
S#define GPIO_PQ6_WT5CCP0        0x000E1807
S
S#define GPIO_PQ7_M1PWM7         0x000E1C01
S#define GPIO_PQ7_WT5CCP1        0x000E1C07
S
N#endif // PART_TM4C123BH6ZRB
N
N//*****************************************************************************
N//
N// TM4C123GH6PGE Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GH6PGE
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_M0FAULT0       0x00091006
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_M0FAULT1       0x00091406
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_M0FAULT2       0x00091806
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_M0FAULT3       0x00091C06
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_M0PWM4         0x000B1802
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_M0PWM5         0x000B1C02
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_M0PWM6         0x000C0802
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_M0PWM7         0x000C0C02
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_M1PWM4         0x000C1002
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_M1PWM5         0x000C1402
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_M1PWM6         0x000C1802
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_M1PWM7         0x000C1C02
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_M0PWM0         0x000D0001
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_M0PWM1         0x000D0401
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_M0PWM2         0x000D0801
S#define GPIO_PP2_T5CCP0         0x000D0807
S
N#endif // PART_TM4C123GH6PGE
N
N//*****************************************************************************
N//
N// TM4C123GH6ZRB Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GH6ZRB
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_M0FAULT0       0x00091006
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_M0FAULT1       0x00091406
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_M0FAULT2       0x00091806
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_M0FAULT3       0x00091C06
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_M0PWM4         0x000B1802
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_M0PWM5         0x000B1C02
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_M0PWM6         0x000C0802
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_M0PWM7         0x000C0C02
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_M1PWM4         0x000C1002
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_M1PWM5         0x000C1402
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_M1PWM6         0x000C1802
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_M1PWM7         0x000C1C02
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_M0PWM0         0x000D0001
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_M0PWM1         0x000D0401
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_M0PWM2         0x000D0801
S#define GPIO_PP2_T5CCP0         0x000D0807
S
S#define GPIO_PP3_M0PWM3         0x000D0C01
S#define GPIO_PP3_T5CCP1         0x000D0C07
S
S#define GPIO_PP4_M0PWM4         0x000D1001
S#define GPIO_PP4_WT0CCP0        0x000D1007
S
S#define GPIO_PP5_M0PWM5         0x000D1401
S#define GPIO_PP5_WT0CCP1        0x000D1407
S
S#define GPIO_PP6_M0PWM6         0x000D1801
S#define GPIO_PP6_WT1CCP0        0x000D1807
S
S#define GPIO_PP7_M0PWM7         0x000D1C01
S#define GPIO_PP7_WT1CCP1        0x000D1C07
S
S#define GPIO_PQ0_M1PWM0         0x000E0001
S#define GPIO_PQ0_WT2CCP0        0x000E0007
S
S#define GPIO_PQ1_M1PWM1         0x000E0401
S#define GPIO_PQ1_WT2CCP1        0x000E0407
S
S#define GPIO_PQ2_M1PWM2         0x000E0801
S#define GPIO_PQ2_WT3CCP0        0x000E0807
S
S#define GPIO_PQ3_M1PWM3         0x000E0C01
S#define GPIO_PQ3_WT3CCP1        0x000E0C07
S
S#define GPIO_PQ4_M1PWM4         0x000E1001
S#define GPIO_PQ4_WT4CCP0        0x000E1007
S
S#define GPIO_PQ5_M1PWM5         0x000E1401
S#define GPIO_PQ5_WT4CCP1        0x000E1407
S
S#define GPIO_PQ6_M1PWM6         0x000E1801
S#define GPIO_PQ6_WT5CCP0        0x000E1807
S
S#define GPIO_PQ7_M1PWM7         0x000E1C01
S#define GPIO_PQ7_WT5CCP1        0x000E1C07
S
N#endif // PART_TM4C123GH6ZRB
N
N//*****************************************************************************
N//
N// TM4C123GH6ZXR Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C123GH6ZXR
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_CAN1RX         0x00000008
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_CAN1TX         0x00000408
S
S#define GPIO_PA2_SSI0CLK        0x00000802
S
S#define GPIO_PA3_SSI0FSS        0x00000C02
S
S#define GPIO_PA4_SSI0RX         0x00001002
S
S#define GPIO_PA5_SSI0TX         0x00001402
S
S#define GPIO_PA6_I2C1SCL        0x00001803
S#define GPIO_PA6_M1PWM2         0x00001805
S
S#define GPIO_PA7_I2C1SDA        0x00001C03
S#define GPIO_PA7_M1PWM3         0x00001C05
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_T2CCP0         0x00010007
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_T2CCP1         0x00010407
S
S#define GPIO_PB2_I2C0SCL        0x00010803
S#define GPIO_PB2_T3CCP0         0x00010807
S
S#define GPIO_PB3_I2C0SDA        0x00010C03
S#define GPIO_PB3_T3CCP1         0x00010C07
S
S#define GPIO_PB4_SSI2CLK        0x00011002
S#define GPIO_PB4_M0PWM2         0x00011004
S#define GPIO_PB4_T1CCP0         0x00011007
S#define GPIO_PB4_CAN0RX         0x00011008
S
S#define GPIO_PB5_SSI2FSS        0x00011402
S#define GPIO_PB5_M0PWM3         0x00011404
S#define GPIO_PB5_T1CCP1         0x00011407
S#define GPIO_PB5_CAN0TX         0x00011408
S
S#define GPIO_PB6_SSI2RX         0x00011802
S#define GPIO_PB6_I2C5SCL        0x00011803
S#define GPIO_PB6_M0PWM0         0x00011804
S#define GPIO_PB6_T0CCP0         0x00011807
S
S#define GPIO_PB7_SSI2TX         0x00011C02
S#define GPIO_PB7_I2C5SDA        0x00011C03
S#define GPIO_PB7_M0PWM1         0x00011C04
S#define GPIO_PB7_T0CCP1         0x00011C07
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S#define GPIO_PC0_T4CCP0         0x00020007
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S#define GPIO_PC1_T4CCP1         0x00020407
S
S#define GPIO_PC2_TDI            0x00020801
S#define GPIO_PC2_T5CCP0         0x00020807
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S#define GPIO_PC3_T5CCP1         0x00020C07
S
S#define GPIO_PC4_U4RX           0x00021001
S#define GPIO_PC4_U1RX           0x00021002
S#define GPIO_PC4_M0PWM6         0x00021004
S#define GPIO_PC4_IDX1           0x00021006
S#define GPIO_PC4_WT0CCP0        0x00021007
S#define GPIO_PC4_U1RTS          0x00021008
S
S#define GPIO_PC5_U4TX           0x00021401
S#define GPIO_PC5_U1TX           0x00021402
S#define GPIO_PC5_M0PWM7         0x00021404
S#define GPIO_PC5_PHA1           0x00021406
S#define GPIO_PC5_WT0CCP1        0x00021407
S#define GPIO_PC5_U1CTS          0x00021408
S
S#define GPIO_PC6_U3RX           0x00021801
S#define GPIO_PC6_PHB1           0x00021806
S#define GPIO_PC6_WT1CCP0        0x00021807
S#define GPIO_PC6_USB0EPEN       0x00021808
S
S#define GPIO_PC7_U3TX           0x00021C01
S#define GPIO_PC7_WT1CCP1        0x00021C07
S#define GPIO_PC7_USB0PFLT       0x00021C08
S
S#define GPIO_PD0_SSI3CLK        0x00030001
S#define GPIO_PD0_SSI1CLK        0x00030002
S#define GPIO_PD0_I2C3SCL        0x00030003
S#define GPIO_PD0_M0PWM6         0x00030004
S#define GPIO_PD0_M1PWM0         0x00030005
S#define GPIO_PD0_WT2CCP0        0x00030007
S
S#define GPIO_PD1_SSI3FSS        0x00030401
S#define GPIO_PD1_SSI1FSS        0x00030402
S#define GPIO_PD1_I2C3SDA        0x00030403
S#define GPIO_PD1_M0PWM7         0x00030404
S#define GPIO_PD1_M1PWM1         0x00030405
S#define GPIO_PD1_WT2CCP1        0x00030407
S
S#define GPIO_PD2_SSI3RX         0x00030801
S#define GPIO_PD2_SSI1RX         0x00030802
S#define GPIO_PD2_M0FAULT0       0x00030804
S#define GPIO_PD2_WT3CCP0        0x00030807
S#define GPIO_PD2_USB0EPEN       0x00030808
S
S#define GPIO_PD3_SSI3TX         0x00030C01
S#define GPIO_PD3_SSI1TX         0x00030C02
S#define GPIO_PD3_IDX0           0x00030C06
S#define GPIO_PD3_WT3CCP1        0x00030C07
S#define GPIO_PD3_USB0PFLT       0x00030C08
S
S#define GPIO_PD4_U6RX           0x00031001
S#define GPIO_PD4_WT4CCP0        0x00031007
S
S#define GPIO_PD5_U6TX           0x00031401
S#define GPIO_PD5_WT4CCP1        0x00031407
S
S#define GPIO_PD6_U2RX           0x00031801
S#define GPIO_PD6_M0FAULT0       0x00031804
S#define GPIO_PD6_PHA0           0x00031806
S#define GPIO_PD6_WT5CCP0        0x00031807
S
S#define GPIO_PD7_U2TX           0x00031C01
S#define GPIO_PD7_M0FAULT1       0x00031C04
S#define GPIO_PD7_PHB0           0x00031C06
S#define GPIO_PD7_WT5CCP1        0x00031C07
S#define GPIO_PD7_NMI            0x00031C08
S
S#define GPIO_PE0_U7RX           0x00040001
S
S#define GPIO_PE1_U7TX           0x00040401
S
S#define GPIO_PE4_U5RX           0x00041001
S#define GPIO_PE4_I2C2SCL        0x00041003
S#define GPIO_PE4_M0PWM4         0x00041004
S#define GPIO_PE4_M1PWM2         0x00041005
S#define GPIO_PE4_CAN0RX         0x00041008
S
S#define GPIO_PE5_U5TX           0x00041401
S#define GPIO_PE5_I2C2SDA        0x00041403
S#define GPIO_PE5_M0PWM5         0x00041404
S#define GPIO_PE5_M1PWM3         0x00041405
S#define GPIO_PE5_CAN0TX         0x00041408
S
S#define GPIO_PE6_CAN1RX         0x00041808
S
S#define GPIO_PE7_U1RI           0x00041C01
S#define GPIO_PE7_CAN1TX         0x00041C08
S
S#define GPIO_PF0_U1RTS          0x00050001
S#define GPIO_PF0_SSI1RX         0x00050002
S#define GPIO_PF0_CAN0RX         0x00050003
S#define GPIO_PF0_M1PWM4         0x00050005
S#define GPIO_PF0_PHA0           0x00050006
S#define GPIO_PF0_T0CCP0         0x00050007
S#define GPIO_PF0_NMI            0x00050008
S#define GPIO_PF0_C0O            0x00050009
S#define GPIO_PF0_TRD2           0x0005000E
S
S#define GPIO_PF1_U1CTS          0x00050401
S#define GPIO_PF1_SSI1TX         0x00050402
S#define GPIO_PF1_M1PWM5         0x00050405
S#define GPIO_PF1_PHB0           0x00050406
S#define GPIO_PF1_T0CCP1         0x00050407
S#define GPIO_PF1_C1O            0x00050409
S#define GPIO_PF1_TRD1           0x0005040E
S
S#define GPIO_PF2_U1DCD          0x00050801
S#define GPIO_PF2_SSI1CLK        0x00050802
S#define GPIO_PF2_M0FAULT0       0x00050804
S#define GPIO_PF2_M1PWM6         0x00050805
S#define GPIO_PF2_T1CCP0         0x00050807
S#define GPIO_PF2_C2O            0x00050809
S#define GPIO_PF2_TRD0           0x0005080E
S
S#define GPIO_PF3_U1DSR          0x00050C01
S#define GPIO_PF3_SSI1FSS        0x00050C02
S#define GPIO_PF3_CAN0TX         0x00050C03
S#define GPIO_PF3_M0FAULT1       0x00050C04
S#define GPIO_PF3_M1PWM7         0x00050C05
S#define GPIO_PF3_T1CCP1         0x00050C07
S#define GPIO_PF3_TRCLK          0x00050C0E
S
S#define GPIO_PF4_U1DTR          0x00051001
S#define GPIO_PF4_M0FAULT2       0x00051004
S#define GPIO_PF4_M1FAULT0       0x00051005
S#define GPIO_PF4_IDX0           0x00051006
S#define GPIO_PF4_T2CCP0         0x00051007
S#define GPIO_PF4_USB0EPEN       0x00051008
S#define GPIO_PF4_TRD3           0x0005100E
S
S#define GPIO_PF5_M0FAULT3       0x00051404
S#define GPIO_PF5_T2CCP1         0x00051407
S#define GPIO_PF5_USB0PFLT       0x00051408
S
S#define GPIO_PF6_I2C2SCL        0x00051803
S#define GPIO_PF6_T3CCP0         0x00051807
S
S#define GPIO_PF7_I2C2SDA        0x00051C03
S#define GPIO_PF7_M1FAULT0       0x00051C05
S#define GPIO_PF7_T3CCP1         0x00051C07
S
S#define GPIO_PG0_I2C3SCL        0x00060003
S#define GPIO_PG0_M1FAULT1       0x00060005
S#define GPIO_PG0_PHA1           0x00060006
S#define GPIO_PG0_T4CCP0         0x00060007
S
S#define GPIO_PG1_I2C3SDA        0x00060403
S#define GPIO_PG1_M1FAULT2       0x00060405
S#define GPIO_PG1_PHB1           0x00060406
S#define GPIO_PG1_T4CCP1         0x00060407
S
S#define GPIO_PG2_I2C4SCL        0x00060803
S#define GPIO_PG2_M0FAULT1       0x00060804
S#define GPIO_PG2_M1PWM0         0x00060805
S#define GPIO_PG2_T5CCP0         0x00060807
S
S#define GPIO_PG3_I2C4SDA        0x00060C03
S#define GPIO_PG3_M0FAULT2       0x00060C04
S#define GPIO_PG3_M1PWM1         0x00060C05
S#define GPIO_PG3_PHA1           0x00060C06
S#define GPIO_PG3_T5CCP1         0x00060C07
S
S#define GPIO_PG4_U2RX           0x00061001
S#define GPIO_PG4_I2C1SCL        0x00061003
S#define GPIO_PG4_M0PWM4         0x00061004
S#define GPIO_PG4_M1PWM2         0x00061005
S#define GPIO_PG4_PHB1           0x00061006
S#define GPIO_PG4_WT0CCP0        0x00061007
S#define GPIO_PG4_USB0EPEN       0x00061008
S
S#define GPIO_PG5_U2TX           0x00061401
S#define GPIO_PG5_I2C1SDA        0x00061403
S#define GPIO_PG5_M0PWM5         0x00061404
S#define GPIO_PG5_M1PWM3         0x00061405
S#define GPIO_PG5_IDX1           0x00061406
S#define GPIO_PG5_WT0CCP1        0x00061407
S#define GPIO_PG5_USB0PFLT       0x00061408
S
S#define GPIO_PG6_I2C5SCL        0x00061803
S#define GPIO_PG6_M0PWM6         0x00061804
S#define GPIO_PG6_WT1CCP0        0x00061807
S
S#define GPIO_PG7_I2C5SDA        0x00061C03
S#define GPIO_PG7_M0PWM7         0x00061C04
S#define GPIO_PG7_IDX1           0x00061C05
S#define GPIO_PG7_WT1CCP1        0x00061C07
S
S#define GPIO_PH0_SSI3CLK        0x00070002
S#define GPIO_PH0_M0PWM0         0x00070004
S#define GPIO_PH0_M0FAULT0       0x00070006
S#define GPIO_PH0_WT2CCP0        0x00070007
S
S#define GPIO_PH1_SSI3FSS        0x00070402
S#define GPIO_PH1_M0PWM1         0x00070404
S#define GPIO_PH1_IDX0           0x00070405
S#define GPIO_PH1_M0FAULT1       0x00070406
S#define GPIO_PH1_WT2CCP1        0x00070407
S
S#define GPIO_PH2_SSI3RX         0x00070802
S#define GPIO_PH2_M0PWM2         0x00070804
S#define GPIO_PH2_M0FAULT2       0x00070806
S#define GPIO_PH2_WT5CCP0        0x00070807
S
S#define GPIO_PH3_SSI3TX         0x00070C02
S#define GPIO_PH3_M0PWM3         0x00070C04
S#define GPIO_PH3_M0FAULT3       0x00070C06
S#define GPIO_PH3_WT5CCP1        0x00070C07
S
S#define GPIO_PH4_SSI2CLK        0x00071002
S#define GPIO_PH4_M0PWM4         0x00071004
S#define GPIO_PH4_PHA0           0x00071005
S#define GPIO_PH4_WT3CCP0        0x00071007
S
S#define GPIO_PH5_SSI2FSS        0x00071402
S#define GPIO_PH5_M0PWM5         0x00071404
S#define GPIO_PH5_PHB0           0x00071405
S#define GPIO_PH5_WT3CCP1        0x00071407
S
S#define GPIO_PH6_SSI2RX         0x00071802
S#define GPIO_PH6_M0PWM6         0x00071804
S#define GPIO_PH6_WT4CCP0        0x00071807
S
S#define GPIO_PH7_SSI2TX         0x00071C02
S#define GPIO_PH7_M0PWM7         0x00071C04
S#define GPIO_PH7_WT4CCP1        0x00071C07
S
S#define GPIO_PJ0_U4RX           0x00080001
S#define GPIO_PJ0_T1CCP0         0x00080007
S
S#define GPIO_PJ1_U4TX           0x00080401
S#define GPIO_PJ1_T1CCP1         0x00080407
S
S#define GPIO_PJ2_U5RX           0x00080801
S#define GPIO_PJ2_IDX0           0x00080805
S#define GPIO_PJ2_T2CCP0         0x00080807
S
S#define GPIO_PJ3_U5TX           0x00080C01
S#define GPIO_PJ3_T2CCP1         0x00080C07
S
S#define GPIO_PJ4_U6RX           0x00081001
S#define GPIO_PJ4_T3CCP0         0x00081007
S
S#define GPIO_PJ5_U6TX           0x00081401
S#define GPIO_PJ5_T3CCP1         0x00081407
S
S#define GPIO_PK0_SSI3CLK        0x00090002
S#define GPIO_PK0_M1FAULT0       0x00090006
S
S#define GPIO_PK1_SSI3FSS        0x00090402
S#define GPIO_PK1_M1FAULT1       0x00090406
S
S#define GPIO_PK2_SSI3RX         0x00090802
S#define GPIO_PK2_M1FAULT2       0x00090806
S
S#define GPIO_PK3_SSI3TX         0x00090C02
S#define GPIO_PK3_M1FAULT3       0x00090C06
S
S#define GPIO_PK4_U7RX           0x00091001
S#define GPIO_PK4_M0FAULT0       0x00091006
S#define GPIO_PK4_RTCCLK         0x00091007
S#define GPIO_PK4_C0O            0x00091008
S
S#define GPIO_PK5_U7TX           0x00091401
S#define GPIO_PK5_M0FAULT1       0x00091406
S#define GPIO_PK5_C1O            0x00091408
S
S#define GPIO_PK6_M0FAULT2       0x00091806
S#define GPIO_PK6_WT1CCP0        0x00091807
S#define GPIO_PK6_C2O            0x00091808
S
S#define GPIO_PK7_M0FAULT3       0x00091C06
S#define GPIO_PK7_WT1CCP1        0x00091C07
S
S#define GPIO_PL0_T0CCP0         0x000A0007
S#define GPIO_PL0_WT0CCP0        0x000A0008
S
S#define GPIO_PL1_T0CCP1         0x000A0407
S#define GPIO_PL1_WT0CCP1        0x000A0408
S
S#define GPIO_PL2_T1CCP0         0x000A0807
S#define GPIO_PL2_WT1CCP0        0x000A0808
S
S#define GPIO_PL3_T1CCP1         0x000A0C07
S#define GPIO_PL3_WT1CCP1        0x000A0C08
S
S#define GPIO_PL4_T2CCP0         0x000A1007
S#define GPIO_PL4_WT2CCP0        0x000A1008
S
S#define GPIO_PL5_T2CCP1         0x000A1407
S#define GPIO_PL5_WT2CCP1        0x000A1408
S
S#define GPIO_PL6_T3CCP0         0x000A1807
S#define GPIO_PL6_WT3CCP0        0x000A1808
S
S#define GPIO_PL7_T3CCP1         0x000A1C07
S#define GPIO_PL7_WT3CCP1        0x000A1C08
S
S#define GPIO_PM0_T4CCP0         0x000B0007
S#define GPIO_PM0_WT4CCP0        0x000B0008
S
S#define GPIO_PM1_T4CCP1         0x000B0407
S#define GPIO_PM1_WT4CCP1        0x000B0408
S
S#define GPIO_PM2_T5CCP0         0x000B0807
S#define GPIO_PM2_WT5CCP0        0x000B0808
S
S#define GPIO_PM3_T5CCP1         0x000B0C07
S#define GPIO_PM3_WT5CCP1        0x000B0C08
S
S#define GPIO_PM6_M0PWM4         0x000B1802
S#define GPIO_PM6_WT0CCP0        0x000B1807
S
S#define GPIO_PM7_M0PWM5         0x000B1C02
S#define GPIO_PM7_WT0CCP1        0x000B1C07
S
S#define GPIO_PN0_CAN0RX         0x000C0001
S
S#define GPIO_PN1_CAN0TX         0x000C0401
S
S#define GPIO_PN2_M0PWM6         0x000C0802
S#define GPIO_PN2_WT2CCP0        0x000C0807
S
S#define GPIO_PN3_M0PWM7         0x000C0C02
S#define GPIO_PN3_WT2CCP1        0x000C0C07
S
S#define GPIO_PN4_M1PWM4         0x000C1002
S#define GPIO_PN4_WT3CCP0        0x000C1007
S
S#define GPIO_PN5_M1PWM5         0x000C1402
S#define GPIO_PN5_WT3CCP1        0x000C1407
S
S#define GPIO_PN6_M1PWM6         0x000C1802
S#define GPIO_PN6_WT4CCP0        0x000C1807
S
S#define GPIO_PN7_M1PWM7         0x000C1C02
S#define GPIO_PN7_WT4CCP1        0x000C1C07
S
S#define GPIO_PP0_M0PWM0         0x000D0001
S#define GPIO_PP0_T4CCP0         0x000D0007
S
S#define GPIO_PP1_M0PWM1         0x000D0401
S#define GPIO_PP1_T4CCP1         0x000D0407
S
S#define GPIO_PP2_M0PWM2         0x000D0801
S#define GPIO_PP2_T5CCP0         0x000D0807
S
S#define GPIO_PP3_M0PWM3         0x000D0C01
S#define GPIO_PP3_T5CCP1         0x000D0C07
S
S#define GPIO_PP4_M0PWM4         0x000D1001
S#define GPIO_PP4_WT0CCP0        0x000D1007
S
S#define GPIO_PP5_M0PWM5         0x000D1401
S#define GPIO_PP5_WT0CCP1        0x000D1407
S
S#define GPIO_PP6_M0PWM6         0x000D1801
S#define GPIO_PP6_WT1CCP0        0x000D1807
S
S#define GPIO_PP7_M0PWM7         0x000D1C01
S#define GPIO_PP7_WT1CCP1        0x000D1C07
S
S#define GPIO_PQ0_M1PWM0         0x000E0001
S#define GPIO_PQ0_WT2CCP0        0x000E0007
S
S#define GPIO_PQ1_M1PWM1         0x000E0401
S#define GPIO_PQ1_WT2CCP1        0x000E0407
S
S#define GPIO_PQ2_M1PWM2         0x000E0801
S#define GPIO_PQ2_WT3CCP0        0x000E0807
S
S#define GPIO_PQ3_M1PWM3         0x000E0C01
S#define GPIO_PQ3_WT3CCP1        0x000E0C07
S
S#define GPIO_PQ4_M1PWM4         0x000E1001
S#define GPIO_PQ4_WT4CCP0        0x000E1007
S
S#define GPIO_PQ5_M1PWM5         0x000E1401
S#define GPIO_PQ5_WT4CCP1        0x000E1407
S
S#define GPIO_PQ6_M1PWM6         0x000E1801
S#define GPIO_PQ6_WT5CCP0        0x000E1807
S
S#define GPIO_PQ7_M1PWM7         0x000E1C01
S#define GPIO_PQ7_WT5CCP1        0x000E1C07
S
N#endif // PART_TM4C123GH6ZXR
N
N//*****************************************************************************
N//
N// TM4C1290NCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1290NCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
N#endif // PART_TM4C1290NCPDT
N
N//*****************************************************************************
N//
N// TM4C1290NCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1290NCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C1290NCZAD
N
N//*****************************************************************************
N//
N// TM4C1292NCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1292NCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
N#endif // PART_TM4C1292NCPDT
N
N//*****************************************************************************
N//
N// TM4C1292NCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1292NCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_EN0TXER        0x000C180E
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_EN0TXEN        0x000F1C0E
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_EN0TXD0        0x0010100E
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_EN0TXD1        0x0010140E
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_EN0RXER        0x0010180E
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_EN0RXDV        0x00101C0E
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_EN0RXD0        0x0011000E
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_EN0RXD1        0x0011040E
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C1292NCZAD
N
N//*****************************************************************************
N//
N// TM4C1294KCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1294KCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
N#endif // PART_TM4C1294KCPDT
N
N//*****************************************************************************
N//
N// TM4C1294NCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1294NCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
N#endif // PART_TM4C1294NCPDT
N
N//*****************************************************************************
N//
N// TM4C1294NCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1294NCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C1294NCZAD
N
N//*****************************************************************************
N//
N// TM4C1297NCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1297NCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C1297NCZAD
N
N//*****************************************************************************
N//
N// TM4C1299KCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1299KCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C1299KCZAD
N
N//*****************************************************************************
N//
N// TM4C1299NCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C1299NCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C1299NCZAD
N
N//*****************************************************************************
N//
N// TM4C129CNCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129CNCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
N#endif // PART_TM4C129CNCPDT
N
N//*****************************************************************************
N//
N// TM4C129CNCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129CNCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C129CNCZAD
N
N//*****************************************************************************
N//
N// TM4C129DNCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129DNCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
N#endif // PART_TM4C129DNCPDT
N
N//*****************************************************************************
N//
N// TM4C129DNCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129DNCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_EN0TXER        0x000C180E
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_EN0TXEN        0x000F1C0E
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_EN0TXD0        0x0010100E
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_EN0TXD1        0x0010140E
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_EN0RXER        0x0010180E
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_EN0RXDV        0x00101C0E
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_EN0RXD0        0x0011000E
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_EN0RXD1        0x0011040E
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C129DNCZAD
N
N//*****************************************************************************
N//
N// TM4C129EKCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129EKCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
N#endif // PART_TM4C129EKCPDT
N
N//*****************************************************************************
N//
N// TM4C129ENCPDT Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129ENCPDT
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
N#endif // PART_TM4C129ENCPDT
N
N//*****************************************************************************
N//
N// TM4C129ENCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129ENCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S
S#define GPIO_PJ4_U3RTS          0x00081001
S
S#define GPIO_PJ5_U3CTS          0x00081401
S
S#define GPIO_PJ6_U4RTS          0x00081801
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S
N#endif // PART_TM4C129ENCZAD
N
N//*****************************************************************************
N//
N// TM4C129LNCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129LNCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C129LNCZAD
N
N//*****************************************************************************
N//
N// TM4C129XKCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129XKCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S#define GPIO_PE3_OWIRE          0x00040C05
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_OWIRE          0x00061005
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_OWALT          0x00061405
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_OWIRE          0x00061805
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_OWIRE          0x00061C05
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_EN0TXER        0x000C180E
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_OWIRE          0x000D1004
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_OWALT          0x000D1404
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PP7_OWIRE          0x000D1C05
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_EN0TXEN        0x000F1C0E
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_EN0TXD0        0x0010100E
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_EN0TXD1        0x0010140E
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_EN0RXER        0x0010180E
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_EN0RXDV        0x00101C0E
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_EN0RXD0        0x0011000E
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_EN0RXD1        0x0011040E
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C129XKCZAD
N
N//*****************************************************************************
N//
N// TM4C129XNCZAD Port/Pin Mapping Definitions
N//
N//*****************************************************************************
N#ifdef PART_TM4C129XNCZAD
S
S#define GPIO_PA0_U0RX           0x00000001
S#define GPIO_PA0_I2C9SCL        0x00000002
S#define GPIO_PA0_T0CCP0         0x00000003
S#define GPIO_PA0_CAN0RX         0x00000007
S
S#define GPIO_PA1_U0TX           0x00000401
S#define GPIO_PA1_I2C9SDA        0x00000402
S#define GPIO_PA1_T0CCP1         0x00000403
S#define GPIO_PA1_CAN0TX         0x00000407
S
S#define GPIO_PA2_U4RX           0x00000801
S#define GPIO_PA2_I2C8SCL        0x00000802
S#define GPIO_PA2_T1CCP0         0x00000803
S#define GPIO_PA2_SSI0CLK        0x0000080F
S
S#define GPIO_PA3_U4TX           0x00000C01
S#define GPIO_PA3_I2C8SDA        0x00000C02
S#define GPIO_PA3_T1CCP1         0x00000C03
S#define GPIO_PA3_SSI0FSS        0x00000C0F
S
S#define GPIO_PA4_U3RX           0x00001001
S#define GPIO_PA4_T2CCP0         0x00001003
S#define GPIO_PA4_I2C7SCL        0x00001002
S#define GPIO_PA4_SSI0XDAT0      0x0000100F
S
S#define GPIO_PA5_U3TX           0x00001401
S#define GPIO_PA5_T2CCP1         0x00001403
S#define GPIO_PA5_I2C7SDA        0x00001402
S#define GPIO_PA5_SSI0XDAT1      0x0000140F
S
S#define GPIO_PA6_U2RX           0x00001801
S#define GPIO_PA6_I2C6SCL        0x00001802
S#define GPIO_PA6_T3CCP0         0x00001803
S#define GPIO_PA6_USB0EPEN       0x00001805
S#define GPIO_PA6_SSI0XDAT2      0x0000180D
S#define GPIO_PA6_EN0RXCK        0x0000180E
S#define GPIO_PA6_EPI0S8         0x0000180F
S
S#define GPIO_PA7_U2TX           0x00001C01
S#define GPIO_PA7_I2C6SDA        0x00001C02
S#define GPIO_PA7_T3CCP1         0x00001C03
S#define GPIO_PA7_USB0PFLT       0x00001C05
S#define GPIO_PA7_USB0EPEN       0x00001C0B
S#define GPIO_PA7_SSI0XDAT3      0x00001C0D
S#define GPIO_PA7_EPI0S9         0x00001C0F
S
S#define GPIO_PB0_U1RX           0x00010001
S#define GPIO_PB0_I2C5SCL        0x00010002
S#define GPIO_PB0_CAN1RX         0x00010007
S#define GPIO_PB0_T4CCP0         0x00010003
S
S#define GPIO_PB1_U1TX           0x00010401
S#define GPIO_PB1_I2C5SDA        0x00010402
S#define GPIO_PB1_CAN1TX         0x00010407
S#define GPIO_PB1_T4CCP1         0x00010403
S
S#define GPIO_PB2_T5CCP0         0x00010803
S#define GPIO_PB2_I2C0SCL        0x00010802
S#define GPIO_PB2_EN0MDC         0x00010805
S#define GPIO_PB2_USB0STP        0x0001080E
S#define GPIO_PB2_EPI0S27        0x0001080F
S
S#define GPIO_PB3_I2C0SDA        0x00010C02
S#define GPIO_PB3_T5CCP1         0x00010C03
S#define GPIO_PB3_EN0MDIO        0x00010C05
S#define GPIO_PB3_USB0CLK        0x00010C0E
S#define GPIO_PB3_EPI0S28        0x00010C0F
S
S#define GPIO_PB4_U0CTS          0x00011001
S#define GPIO_PB4_I2C5SCL        0x00011002
S#define GPIO_PB4_SSI1FSS        0x0001100F
S
S#define GPIO_PB5_U0RTS          0x00011401
S#define GPIO_PB5_I2C5SDA        0x00011402
S#define GPIO_PB5_SSI1CLK        0x0001140F
S
S#define GPIO_PB6_I2C6SCL        0x00011802
S#define GPIO_PB6_T6CCP0         0x00011803
S
S#define GPIO_PB7_I2C6SDA        0x00011C02
S#define GPIO_PB7_T6CCP1         0x00011C03
S
S#define GPIO_PC0_TCK            0x00020001
S#define GPIO_PC0_SWCLK          0x00020001
S
S#define GPIO_PC1_TMS            0x00020401
S#define GPIO_PC1_SWDIO          0x00020401
S
S#define GPIO_PC2_TDI            0x00020801
S
S#define GPIO_PC3_SWO            0x00020C01
S#define GPIO_PC3_TDO            0x00020C01
S
S#define GPIO_PC4_U7RX           0x00021001
S#define GPIO_PC4_T7CCP0         0x00021003
S#define GPIO_PC4_EPI0S7         0x0002100F
S
S#define GPIO_PC5_U7TX           0x00021401
S#define GPIO_PC5_T7CCP1         0x00021403
S#define GPIO_PC5_RTCCLK         0x00021407
S#define GPIO_PC5_EPI0S6         0x0002140F
S
S#define GPIO_PC6_U5RX           0x00021801
S#define GPIO_PC6_EPI0S5         0x0002180F
S
S#define GPIO_PC7_U5TX           0x00021C01
S#define GPIO_PC7_EPI0S4         0x00021C0F
S
S#define GPIO_PD0_I2C7SCL        0x00030002
S#define GPIO_PD0_T0CCP0         0x00030003
S#define GPIO_PD0_C0O            0x00030005
S#define GPIO_PD0_SSI2XDAT1      0x0003000F
S
S#define GPIO_PD1_I2C7SDA        0x00030402
S#define GPIO_PD1_T0CCP1         0x00030403
S#define GPIO_PD1_C1O            0x00030405
S#define GPIO_PD1_SSI2XDAT0      0x0003040F
S
S#define GPIO_PD2_I2C8SCL        0x00030802
S#define GPIO_PD2_T1CCP0         0x00030803
S#define GPIO_PD2_C2O            0x00030805
S#define GPIO_PD2_SSI2FSS        0x0003080F
S
S#define GPIO_PD3_I2C8SDA        0x00030C02
S#define GPIO_PD3_T1CCP1         0x00030C03
S#define GPIO_PD3_SSI2CLK        0x00030C0F
S
S#define GPIO_PD4_U2RX           0x00031001
S#define GPIO_PD4_T3CCP0         0x00031003
S#define GPIO_PD4_SSI1XDAT2      0x0003100F
S
S#define GPIO_PD5_U2TX           0x00031401
S#define GPIO_PD5_T3CCP1         0x00031403
S#define GPIO_PD5_SSI1XDAT3      0x0003140F
S
S#define GPIO_PD6_U2RTS          0x00031801
S#define GPIO_PD6_T4CCP0         0x00031803
S#define GPIO_PD6_USB0EPEN       0x00031805
S#define GPIO_PD6_SSI2XDAT3      0x0003180F
S
S#define GPIO_PD7_U2CTS          0x00031C01
S#define GPIO_PD7_T4CCP1         0x00031C03
S#define GPIO_PD7_USB0PFLT       0x00031C05
S#define GPIO_PD7_NMI            0x00031C08
S#define GPIO_PD7_SSI2XDAT2      0x00031C0F
S
S#define GPIO_PE0_U1RTS          0x00040001
S
S#define GPIO_PE1_U1DSR          0x00040401
S
S#define GPIO_PE2_U1DCD          0x00040801
S
S#define GPIO_PE3_U1DTR          0x00040C01
S#define GPIO_PE3_OWIRE          0x00040C05
S
S#define GPIO_PE4_U1RI           0x00041001
S#define GPIO_PE4_SSI1XDAT0      0x0004100F
S
S#define GPIO_PE5_SSI1XDAT1      0x0004140F
S
S#define GPIO_PE6_U0CTS          0x00041801
S#define GPIO_PE6_I2C9SCL        0x00041802
S
S#define GPIO_PE7_U0RTS          0x00041C01
S#define GPIO_PE7_I2C9SDA        0x00041C02
S#define GPIO_PE7_NMI            0x00041C08
S
S#define GPIO_PF0_EN0LED0        0x00050005
S#define GPIO_PF0_M0PWM0         0x00050006
S#define GPIO_PF0_SSI3XDAT1      0x0005000E
S#define GPIO_PF0_TRD2           0x0005000F
S
S#define GPIO_PF1_EN0LED2        0x00050405
S#define GPIO_PF1_M0PWM1         0x00050406
S#define GPIO_PF1_SSI3XDAT0      0x0005040E
S#define GPIO_PF1_TRD1           0x0005040F
S
S#define GPIO_PF2_EN0MDC         0x00050805
S#define GPIO_PF2_M0PWM2         0x00050806
S#define GPIO_PF2_SSI3FSS        0x0005080E
S#define GPIO_PF2_TRD0           0x0005080F
S
S#define GPIO_PF3_EN0MDIO        0x00050C05
S#define GPIO_PF3_M0PWM3         0x00050C06
S#define GPIO_PF3_SSI3CLK        0x00050C0E
S#define GPIO_PF3_TRCLK          0x00050C0F
S
S#define GPIO_PF4_EN0LED1        0x00051005
S#define GPIO_PF4_M0FAULT0       0x00051006
S#define GPIO_PF4_SSI3XDAT2      0x0005100E
S#define GPIO_PF4_TRD3           0x0005100F
S
S#define GPIO_PF5_SSI3XDAT3      0x0005140E
S
S#define GPIO_PF6_LCDMCLK        0x0005180F
S
S#define GPIO_PF7_LCDDATA02      0x00051C0F
S
S#define GPIO_PG0_I2C1SCL        0x00060002
S#define GPIO_PG0_EN0PPS         0x00060005
S#define GPIO_PG0_M0PWM4         0x00060006
S#define GPIO_PG0_EPI0S11        0x0006000F
S
S#define GPIO_PG1_I2C1SDA        0x00060402
S#define GPIO_PG1_M0PWM5         0x00060406
S#define GPIO_PG1_EPI0S10        0x0006040F
S
S#define GPIO_PG2_I2C2SCL        0x00060802
S#define GPIO_PG2_EN0TXCK        0x0006080E
S#define GPIO_PG2_SSI2XDAT3      0x0006080F
S
S#define GPIO_PG3_I2C2SDA        0x00060C02
S#define GPIO_PG3_EN0TXEN        0x00060C0E
S#define GPIO_PG3_SSI2XDAT2      0x00060C0F
S
S#define GPIO_PG4_U0CTS          0x00061001
S#define GPIO_PG4_I2C3SCL        0x00061002
S#define GPIO_PG4_OWIRE          0x00061005
S#define GPIO_PG4_EN0TXD0        0x0006100E
S#define GPIO_PG4_SSI2XDAT1      0x0006100F
S
S#define GPIO_PG5_U0RTS          0x00061401
S#define GPIO_PG5_I2C3SDA        0x00061402
S#define GPIO_PG5_OWALT          0x00061405
S#define GPIO_PG5_EN0TXD1        0x0006140E
S#define GPIO_PG5_SSI2XDAT0      0x0006140F
S
S#define GPIO_PG6_I2C4SCL        0x00061802
S#define GPIO_PG6_OWIRE          0x00061805
S#define GPIO_PG6_EN0RXER        0x0006180E
S#define GPIO_PG6_SSI2FSS        0x0006180F
S
S#define GPIO_PG7_I2C4SDA        0x00061C02
S#define GPIO_PG7_OWIRE          0x00061C05
S#define GPIO_PG7_EN0RXDV        0x00061C0E
S#define GPIO_PG7_SSI2CLK        0x00061C0F
S
S#define GPIO_PH0_U0RTS          0x00070001
S#define GPIO_PH0_EPI0S0         0x0007000F
S
S#define GPIO_PH1_U0CTS          0x00070401
S#define GPIO_PH1_EPI0S1         0x0007040F
S
S#define GPIO_PH2_U0DCD          0x00070801
S#define GPIO_PH2_EPI0S2         0x0007080F
S
S#define GPIO_PH3_U0DSR          0x00070C01
S#define GPIO_PH3_EPI0S3         0x00070C0F
S
S#define GPIO_PH4_U0DTR          0x00071001
S
S#define GPIO_PH5_U0RI           0x00071401
S#define GPIO_PH5_EN0PPS         0x00071405
S
S#define GPIO_PH6_U5RX           0x00071801
S#define GPIO_PH6_U7RX           0x00071802
S
S#define GPIO_PH7_U5TX           0x00071C01
S#define GPIO_PH7_U7TX           0x00071C02
S
S#define GPIO_PJ0_U3RX           0x00080001
S#define GPIO_PJ0_EN0PPS         0x00080005
S
S#define GPIO_PJ1_U3TX           0x00080401
S
S#define GPIO_PJ2_U2RTS          0x00080801
S#define GPIO_PJ2_LCDDATA14      0x0008080F
S
S#define GPIO_PJ3_U2CTS          0x00080C01
S#define GPIO_PJ3_LCDDATA15      0x00080C0F
S
S#define GPIO_PJ4_U3RTS          0x00081001
S#define GPIO_PJ4_LCDDATA16      0x0008100F
S
S#define GPIO_PJ5_U3CTS          0x00081401
S#define GPIO_PJ5_LCDDATA17      0x0008140F
S
S#define GPIO_PJ6_U4RTS          0x00081801
S#define GPIO_PJ6_LCDAC          0x0008180F
S
S#define GPIO_PJ7_U4CTS          0x00081C01
S
S#define GPIO_PK0_U4RX           0x00090001
S#define GPIO_PK0_EPI0S0         0x0009000F
S
S#define GPIO_PK1_U4TX           0x00090401
S#define GPIO_PK1_EPI0S1         0x0009040F
S
S#define GPIO_PK2_U4RTS          0x00090801
S#define GPIO_PK2_EPI0S2         0x0009080F
S
S#define GPIO_PK3_U4CTS          0x00090C01
S#define GPIO_PK3_EPI0S3         0x00090C0F
S
S#define GPIO_PK4_I2C3SCL        0x00091002
S#define GPIO_PK4_EN0LED0        0x00091005
S#define GPIO_PK4_M0PWM6         0x00091006
S#define GPIO_PK4_EN0INTRN       0x00091007
S#define GPIO_PK4_EN0RXD3        0x0009100E
S#define GPIO_PK4_EPI0S32        0x0009100F
S
S#define GPIO_PK5_I2C3SDA        0x00091402
S#define GPIO_PK5_EN0LED2        0x00091405
S#define GPIO_PK5_M0PWM7         0x00091406
S#define GPIO_PK5_EN0RXD2        0x0009140E
S#define GPIO_PK5_EPI0S31        0x0009140F
S
S#define GPIO_PK6_I2C4SCL        0x00091802
S#define GPIO_PK6_EN0LED1        0x00091805
S#define GPIO_PK6_M0FAULT1       0x00091806
S#define GPIO_PK6_EN0TXD2        0x0009180E
S#define GPIO_PK6_EPI0S25        0x0009180F
S
S#define GPIO_PK7_U0RI           0x00091C01
S#define GPIO_PK7_I2C4SDA        0x00091C02
S#define GPIO_PK7_RTCCLK         0x00091C05
S#define GPIO_PK7_M0FAULT2       0x00091C06
S#define GPIO_PK7_EN0TXD3        0x00091C0E
S#define GPIO_PK7_EPI0S24        0x00091C0F
S
S#define GPIO_PL0_I2C2SDA        0x000A0002
S#define GPIO_PL0_M0FAULT3       0x000A0006
S#define GPIO_PL0_USB0D0         0x000A000E
S#define GPIO_PL0_EPI0S16        0x000A000F
S
S#define GPIO_PL1_I2C2SCL        0x000A0402
S#define GPIO_PL1_PHA0           0x000A0406
S#define GPIO_PL1_USB0D1         0x000A040E
S#define GPIO_PL1_EPI0S17        0x000A040F
S
S#define GPIO_PL2_C0O            0x000A0805
S#define GPIO_PL2_PHB0           0x000A0806
S#define GPIO_PL2_USB0D2         0x000A080E
S#define GPIO_PL2_EPI0S18        0x000A080F
S
S#define GPIO_PL3_C1O            0x000A0C05
S#define GPIO_PL3_IDX0           0x000A0C06
S#define GPIO_PL3_USB0D3         0x000A0C0E
S#define GPIO_PL3_EPI0S19        0x000A0C0F
S
S#define GPIO_PL4_T0CCP0         0x000A1003
S#define GPIO_PL4_USB0D4         0x000A100E
S#define GPIO_PL4_EPI0S26        0x000A100F
S
S#define GPIO_PL5_T0CCP1         0x000A1403
S#define GPIO_PL5_EPI0S33        0x000A140F
S#define GPIO_PL5_USB0D5         0x000A140E
S
S#define GPIO_PL6_T1CCP0         0x000A1803
S
S#define GPIO_PL7_T1CCP1         0x000A1C03
S
S#define GPIO_PM0_T2CCP0         0x000B0003
S#define GPIO_PM0_EPI0S15        0x000B000F
S
S#define GPIO_PM1_T2CCP1         0x000B0403
S#define GPIO_PM1_EPI0S14        0x000B040F
S
S#define GPIO_PM2_T3CCP0         0x000B0803
S#define GPIO_PM2_EPI0S13        0x000B080F
S
S#define GPIO_PM3_T3CCP1         0x000B0C03
S#define GPIO_PM3_EPI0S12        0x000B0C0F
S
S#define GPIO_PM4_U0CTS          0x000B1001
S#define GPIO_PM4_T4CCP0         0x000B1003
S#define GPIO_PM4_EN0RREF_CLK    0x000B100E
S
S#define GPIO_PM5_U0DCD          0x000B1401
S#define GPIO_PM5_T4CCP1         0x000B1403
S
S#define GPIO_PM6_U0DSR          0x000B1801
S#define GPIO_PM6_T5CCP0         0x000B1803
S#define GPIO_PM6_EN0CRS         0x000B180E
S
S#define GPIO_PM7_U0RI           0x000B1C01
S#define GPIO_PM7_T5CCP1         0x000B1C03
S#define GPIO_PM7_EN0COL         0x000B1C0E
S
S#define GPIO_PN0_U1RTS          0x000C0001
S
S#define GPIO_PN1_U1CTS          0x000C0401
S
S#define GPIO_PN2_U1DCD          0x000C0801
S#define GPIO_PN2_U2RTS          0x000C0802
S#define GPIO_PN2_EPI0S29        0x000C080F
S
S#define GPIO_PN3_U1DSR          0x000C0C01
S#define GPIO_PN3_U2CTS          0x000C0C02
S#define GPIO_PN3_EPI0S30        0x000C0C0F
S
S#define GPIO_PN4_U1DTR          0x000C1001
S#define GPIO_PN4_U3RTS          0x000C1002
S#define GPIO_PN4_I2C2SDA        0x000C1003
S#define GPIO_PN4_EPI0S34        0x000C100F
S
S#define GPIO_PN5_U1RI           0x000C1401
S#define GPIO_PN5_U3CTS          0x000C1402
S#define GPIO_PN5_I2C2SCL        0x000C1403
S#define GPIO_PN5_EPI0S35        0x000C140F
S
S#define GPIO_PN6_U4RTS          0x000C1802
S#define GPIO_PN6_EN0TXER        0x000C180E
S#define GPIO_PN6_LCDDATA13      0x000C180F
S
S#define GPIO_PN7_U1RTS          0x000C1C01
S#define GPIO_PN7_U4CTS          0x000C1C02
S#define GPIO_PN7_LCDDATA12      0x000C1C0F
S
S#define GPIO_PP0_U6RX           0x000D0001
S#define GPIO_PP0_T6CCP0         0x000D0005
S#define GPIO_PP0_EN0INTRN       0x000D0007
S#define GPIO_PP0_SSI3XDAT2      0x000D000F
S
S#define GPIO_PP1_U6TX           0x000D0401
S#define GPIO_PP1_T6CCP1         0x000D0405
S#define GPIO_PP1_SSI3XDAT3      0x000D040F
S
S#define GPIO_PP2_U0DTR          0x000D0801
S#define GPIO_PP2_USB0NXT        0x000D080E
S#define GPIO_PP2_EPI0S29        0x000D080F
S
S#define GPIO_PP3_U1CTS          0x000D0C01
S#define GPIO_PP3_U0DCD          0x000D0C02
S#define GPIO_PP3_RTCCLK         0x000D0C07
S#define GPIO_PP3_USB0DIR        0x000D0C0E
S#define GPIO_PP3_EPI0S30        0x000D0C0F
S
S#define GPIO_PP4_U3RTS          0x000D1001
S#define GPIO_PP4_U0DSR          0x000D1002
S#define GPIO_PP4_OWIRE          0x000D1004
S#define GPIO_PP4_USB0D7         0x000D100E
S
S#define GPIO_PP5_U3CTS          0x000D1401
S#define GPIO_PP5_I2C2SCL        0x000D1402
S#define GPIO_PP5_OWALT          0x000D1404
S#define GPIO_PP5_USB0D6         0x000D140E
S
S#define GPIO_PP6_U1DCD          0x000D1801
S#define GPIO_PP6_I2C2SDA        0x000D1802
S
S#define GPIO_PP7_OWIRE          0x000D1C05
S
S#define GPIO_PQ0_T6CCP0         0x000E0003
S#define GPIO_PQ0_SSI3CLK        0x000E000E
S#define GPIO_PQ0_EPI0S20        0x000E000F
S
S#define GPIO_PQ1_T6CCP1         0x000E0403
S#define GPIO_PQ1_SSI3FSS        0x000E040E
S#define GPIO_PQ1_EPI0S21        0x000E040F
S
S#define GPIO_PQ2_T7CCP0         0x000E0803
S#define GPIO_PQ2_SSI3XDAT0      0x000E080E
S#define GPIO_PQ2_EPI0S22        0x000E080F
S
S#define GPIO_PQ3_T7CCP1         0x000E0C03
S#define GPIO_PQ3_SSI3XDAT1      0x000E0C0E
S#define GPIO_PQ3_EPI0S23        0x000E0C0F
S
S#define GPIO_PQ4_U1RX           0x000E1001
S#define GPIO_PQ4_DIVSCLK        0x000E1007
S
S#define GPIO_PQ5_U1TX           0x000E1401
S#define GPIO_PQ5_EN0RXD0        0x000E140E
S
S#define GPIO_PQ6_U1DTR          0x000E1801
S#define GPIO_PQ6_EN0RXD1        0x000E180E
S
S#define GPIO_PQ7_U1RI           0x000E1C01
S
S#define GPIO_PR0_U4TX           0x000F0001
S#define GPIO_PR0_I2C1SCL        0x000F0002
S#define GPIO_PR0_M0PWM0         0x000F0006
S#define GPIO_PR0_LCDCP          0x000F000F
S
S#define GPIO_PR1_U4RX           0x000F0401
S#define GPIO_PR1_I2C1SDA        0x000F0402
S#define GPIO_PR1_M0PWM1         0x000F0406
S#define GPIO_PR1_LCDFP          0x000F040F
S
S#define GPIO_PR2_I2C2SCL        0x000F0802
S#define GPIO_PR2_M0PWM2         0x000F0806
S#define GPIO_PR2_LCDLP          0x000F080F
S
S#define GPIO_PR3_I2C2SDA        0x000F0C02
S#define GPIO_PR3_M0PWM3         0x000F0C06
S#define GPIO_PR3_LCDDATA03      0x000F0C0F
S
S#define GPIO_PR4_I2C3SCL        0x000F1002
S#define GPIO_PR4_T0CCP0         0x000F1003
S#define GPIO_PR4_M0PWM4         0x000F1006
S#define GPIO_PR4_LCDDATA00      0x000F100F
S
S#define GPIO_PR5_U1RX           0x000F1401
S#define GPIO_PR5_I2C3SDA        0x000F1402
S#define GPIO_PR5_T0CCP1         0x000F1403
S#define GPIO_PR5_M0PWM5         0x000F1406
S#define GPIO_PR5_LCDDATA01      0x000F140F
S
S#define GPIO_PR6_U1TX           0x000F1801
S#define GPIO_PR6_I2C4SCL        0x000F1802
S#define GPIO_PR6_T1CCP0         0x000F1803
S#define GPIO_PR6_M0PWM6         0x000F1806
S#define GPIO_PR6_LCDDATA04      0x000F180F
S
S#define GPIO_PR7_I2C4SDA        0x000F1C02
S#define GPIO_PR7_T1CCP1         0x000F1C03
S#define GPIO_PR7_M0PWM7         0x000F1C06
S#define GPIO_PR7_EN0TXEN        0x000F1C0E
S#define GPIO_PR7_LCDDATA05      0x000F1C0F
S
S#define GPIO_PS0_T2CCP0         0x00100003
S#define GPIO_PS0_M0FAULT0       0x00100006
S#define GPIO_PS0_LCDDATA20      0x0010000F
S
S#define GPIO_PS1_T2CCP1         0x00100403
S#define GPIO_PS1_M0FAULT1       0x00100406
S#define GPIO_PS1_LCDDATA21      0x0010040F
S
S#define GPIO_PS2_U1DSR          0x00100801
S#define GPIO_PS2_T3CCP0         0x00100803
S#define GPIO_PS2_M0FAULT2       0x00100806
S#define GPIO_PS2_LCDDATA22      0x0010080F
S
S#define GPIO_PS3_T3CCP1         0x00100C03
S#define GPIO_PS3_M0FAULT3       0x00100C06
S#define GPIO_PS3_LCDDATA23      0x00100C0F
S
S#define GPIO_PS4_T4CCP0         0x00101003
S#define GPIO_PS4_PHA0           0x00101006
S#define GPIO_PS4_EN0TXD0        0x0010100E
S#define GPIO_PS4_LCDDATA06      0x0010100F
S
S#define GPIO_PS5_T4CCP1         0x00101403
S#define GPIO_PS5_PHB0           0x00101406
S#define GPIO_PS5_EN0TXD1        0x0010140E
S#define GPIO_PS5_LCDDATA07      0x0010140F
S
S#define GPIO_PS6_T5CCP0         0x00101803
S#define GPIO_PS6_IDX0           0x00101806
S#define GPIO_PS6_EN0RXER        0x0010180E
S#define GPIO_PS6_LCDDATA08      0x0010180F
S
S#define GPIO_PS7_T5CCP1         0x00101C03
S#define GPIO_PS7_EN0RXDV        0x00101C0E
S#define GPIO_PS7_LCDDATA09      0x00101C0F
S
S#define GPIO_PT0_T6CCP0         0x00110003
S#define GPIO_PT0_CAN0RX         0x00110007
S#define GPIO_PT0_EN0RXD0        0x0011000E
S#define GPIO_PT0_LCDDATA10      0x0011000F
S
S#define GPIO_PT1_T6CCP1         0x00110403
S#define GPIO_PT1_CAN0TX         0x00110407
S#define GPIO_PT1_EN0RXD1        0x0011040E
S#define GPIO_PT1_LCDDATA11      0x0011040F
S
S#define GPIO_PT2_T7CCP0         0x00110803
S#define GPIO_PT2_CAN1RX         0x00110807
S#define GPIO_PT2_LCDDATA18      0x0011080F
S
S#define GPIO_PT3_T7CCP1         0x00110C03
S#define GPIO_PT3_CAN1TX         0x00110C07
S#define GPIO_PT3_LCDDATA19      0x00110C0F
S
N#endif // PART_TM4C129XNCZAD
N
N#endif // __DRIVERLIB_PIN_MAP_H__
L 7 "../bmp280.c" 2
N#include "driverlib/i2c.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/driverlib/i2c.h" 1
N//*****************************************************************************
N//
N// i2c.h - Prototypes for the I2C Driver.
N//
N// Copyright (c) 2005-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N//   Redistribution and use in source and binary forms, with or without
N//   modification, are permitted provided that the following conditions
N//   are met:
N// 
N//   Redistributions of source code must retain the above copyright
N//   notice, this list of conditions and the following disclaimer.
N// 
N//   Redistributions in binary form must reproduce the above copyright
N//   notice, this list of conditions and the following disclaimer in the
N//   documentation and/or other materials provided with the  
N//   distribution.
N// 
N//   Neither the name of Texas Instruments Incorporated nor the names of
N//   its contributors may be used to endorse or promote products derived
N//   from this software without specific prior written permission.
N// 
N// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
N// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
N// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
N// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
N// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
N// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
N// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
N// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
N// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N// 
N// This is part of revision 2.1.3.156 of the Tiva Peripheral Driver Library.
N//
N//*****************************************************************************
N
N#ifndef __DRIVERLIB_I2C_H__
N#define __DRIVERLIB_I2C_H__
N
N//*****************************************************************************
N//
N// If building with a C++ compiler, make all of the definitions in this header
N// have a C binding.
N//
N//*****************************************************************************
N#ifdef __cplusplus
Sextern "C"
S{
N#endif
N
N//*****************************************************************************
N//
N// Defines for the API.
N//
N//*****************************************************************************
N
N//*****************************************************************************
N//
N// Interrupt defines.
N//
N//*****************************************************************************
N#define I2C_INT_MASTER          0x00000001
N#define I2C_INT_SLAVE           0x00000002
N
N//*****************************************************************************
N//
N// I2C Master commands.
N//
N//*****************************************************************************
N#define I2C_MASTER_CMD_SINGLE_SEND                                            \
N                                0x00000007
X#define I2C_MASTER_CMD_SINGLE_SEND                                                                            0x00000007
N#define I2C_MASTER_CMD_SINGLE_RECEIVE                                         \
N                                0x00000007
X#define I2C_MASTER_CMD_SINGLE_RECEIVE                                                                         0x00000007
N#define I2C_MASTER_CMD_BURST_SEND_START                                       \
N                                0x00000003
X#define I2C_MASTER_CMD_BURST_SEND_START                                                                       0x00000003
N#define I2C_MASTER_CMD_BURST_SEND_CONT                                        \
N                                0x00000001
X#define I2C_MASTER_CMD_BURST_SEND_CONT                                                                        0x00000001
N#define I2C_MASTER_CMD_BURST_SEND_FINISH                                      \
N                                0x00000005
X#define I2C_MASTER_CMD_BURST_SEND_FINISH                                                                      0x00000005
N#define I2C_MASTER_CMD_BURST_SEND_STOP                                        \
N                                0x00000004
X#define I2C_MASTER_CMD_BURST_SEND_STOP                                                                        0x00000004
N#define I2C_MASTER_CMD_BURST_SEND_ERROR_STOP                                  \
N                                0x00000004
X#define I2C_MASTER_CMD_BURST_SEND_ERROR_STOP                                                                  0x00000004
N#define I2C_MASTER_CMD_BURST_RECEIVE_START                                    \
N                                0x0000000b
X#define I2C_MASTER_CMD_BURST_RECEIVE_START                                                                    0x0000000b
N#define I2C_MASTER_CMD_BURST_RECEIVE_CONT                                     \
N                                0x00000009
X#define I2C_MASTER_CMD_BURST_RECEIVE_CONT                                                                     0x00000009
N#define I2C_MASTER_CMD_BURST_RECEIVE_FINISH                                   \
N                                0x00000005
X#define I2C_MASTER_CMD_BURST_RECEIVE_FINISH                                                                   0x00000005
N#define I2C_MASTER_CMD_BURST_RECEIVE_ERROR_STOP                               \
N                                0x00000004
X#define I2C_MASTER_CMD_BURST_RECEIVE_ERROR_STOP                                                               0x00000004
N#define I2C_MASTER_CMD_QUICK_COMMAND                                          \
N                                0x00000027
X#define I2C_MASTER_CMD_QUICK_COMMAND                                                                          0x00000027
N#define I2C_MASTER_CMD_HS_MASTER_CODE_SEND                                    \
N                                0x00000013
X#define I2C_MASTER_CMD_HS_MASTER_CODE_SEND                                                                    0x00000013
N#define I2C_MASTER_CMD_FIFO_SINGLE_SEND                                       \
N                                0x00000046
X#define I2C_MASTER_CMD_FIFO_SINGLE_SEND                                                                       0x00000046
N#define I2C_MASTER_CMD_FIFO_SINGLE_RECEIVE                                    \
N                                0x00000046
X#define I2C_MASTER_CMD_FIFO_SINGLE_RECEIVE                                                                    0x00000046
N#define I2C_MASTER_CMD_FIFO_BURST_SEND_START                                  \
N                                0x00000042
X#define I2C_MASTER_CMD_FIFO_BURST_SEND_START                                                                  0x00000042
N#define I2C_MASTER_CMD_FIFO_BURST_SEND_CONT                                   \
N                                0x00000040
X#define I2C_MASTER_CMD_FIFO_BURST_SEND_CONT                                                                   0x00000040
N#define I2C_MASTER_CMD_FIFO_BURST_SEND_FINISH                                 \
N                                0x00000044
X#define I2C_MASTER_CMD_FIFO_BURST_SEND_FINISH                                                                 0x00000044
N#define I2C_MASTER_CMD_FIFO_BURST_SEND_ERROR_STOP                             \
N                                0x00000004
X#define I2C_MASTER_CMD_FIFO_BURST_SEND_ERROR_STOP                                                             0x00000004
N#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_START                               \
N                                0x0000004a
X#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_START                                                               0x0000004a
N#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_CONT                                \
N                                0x00000048
X#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_CONT                                                                0x00000048
N#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_FINISH                              \
N                                0x00000044
X#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_FINISH                                                              0x00000044
N#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_ERROR_STOP                          \
N                                0x00000004
X#define I2C_MASTER_CMD_FIFO_BURST_RECEIVE_ERROR_STOP                                                          0x00000004
N
N//*****************************************************************************
N//
N// I2C Master glitch filter configuration.
N//
N//*****************************************************************************
N#define I2C_MASTER_GLITCH_FILTER_DISABLED                                     \
N                                0
X#define I2C_MASTER_GLITCH_FILTER_DISABLED                                                                     0
N#define I2C_MASTER_GLITCH_FILTER_1                                            \
N                                0x00010000
X#define I2C_MASTER_GLITCH_FILTER_1                                                                            0x00010000
N#define I2C_MASTER_GLITCH_FILTER_2                                            \
N                                0x00020000
X#define I2C_MASTER_GLITCH_FILTER_2                                                                            0x00020000
N#define I2C_MASTER_GLITCH_FILTER_3                                            \
N                                0x00030000
X#define I2C_MASTER_GLITCH_FILTER_3                                                                            0x00030000
N#define I2C_MASTER_GLITCH_FILTER_4                                            \
N                                0x00040000
X#define I2C_MASTER_GLITCH_FILTER_4                                                                            0x00040000
N#define I2C_MASTER_GLITCH_FILTER_8                                            \
N                                0x00050000
X#define I2C_MASTER_GLITCH_FILTER_8                                                                            0x00050000
N#define I2C_MASTER_GLITCH_FILTER_16                                           \
N                                0x00060000
X#define I2C_MASTER_GLITCH_FILTER_16                                                                           0x00060000
N#define I2C_MASTER_GLITCH_FILTER_32                                           \
N                                0x00070000
X#define I2C_MASTER_GLITCH_FILTER_32                                                                           0x00070000
N
N//*****************************************************************************
N//
N// I2C Master error status.
N//
N//*****************************************************************************
N#define I2C_MASTER_ERR_NONE     0
N#define I2C_MASTER_ERR_ADDR_ACK 0x00000004
N#define I2C_MASTER_ERR_DATA_ACK 0x00000008
N#define I2C_MASTER_ERR_ARB_LOST 0x00000010
N#define I2C_MASTER_ERR_CLK_TOUT 0x00000080
N
N//*****************************************************************************
N//
N// I2C Slave action requests
N//
N//*****************************************************************************
N#define I2C_SLAVE_ACT_NONE      0
N#define I2C_SLAVE_ACT_RREQ      0x00000001  // Master has sent data
N#define I2C_SLAVE_ACT_TREQ      0x00000002  // Master has requested data
N#define I2C_SLAVE_ACT_RREQ_FBR  0x00000005  // Master has sent first byte
N#define I2C_SLAVE_ACT_OWN2SEL   0x00000008  // Master requested secondary slave
N#define I2C_SLAVE_ACT_QCMD      0x00000010  // Master has sent a Quick Command
N#define I2C_SLAVE_ACT_QCMD_DATA 0x00000020  // Master Quick Command value
N
N//*****************************************************************************
N//
N// Miscellaneous I2C driver definitions.
N//
N//*****************************************************************************
N#define I2C_MASTER_MAX_RETRIES  1000        // Number of retries
N
N//*****************************************************************************
N//
N// I2C Master interrupts.
N//
N//*****************************************************************************
N#define I2C_MASTER_INT_RX_FIFO_FULL                                           \
N                                0x00000800  // RX FIFO Full Interrupt
X#define I2C_MASTER_INT_RX_FIFO_FULL                                                                           0x00000800  
N#define I2C_MASTER_INT_TX_FIFO_EMPTY                                          \
N                                0x00000400  // TX FIFO Empty Interrupt
X#define I2C_MASTER_INT_TX_FIFO_EMPTY                                                                          0x00000400  
N#define I2C_MASTER_INT_RX_FIFO_REQ                                            \
N                                0x00000200  // RX FIFO Request Interrupt
X#define I2C_MASTER_INT_RX_FIFO_REQ                                                                            0x00000200  
N#define I2C_MASTER_INT_TX_FIFO_REQ                                            \
N                                0x00000100  // TX FIFO Request Interrupt
X#define I2C_MASTER_INT_TX_FIFO_REQ                                                                            0x00000100  
N#define I2C_MASTER_INT_ARB_LOST                                               \
N                                0x00000080  // Arb Lost Interrupt
X#define I2C_MASTER_INT_ARB_LOST                                                                               0x00000080  
N#define I2C_MASTER_INT_STOP     0x00000040  // Stop Condition Interrupt
N#define I2C_MASTER_INT_START    0x00000020  // Start Condition Interrupt
N#define I2C_MASTER_INT_NACK     0x00000010  // Addr/Data NACK Interrupt
N#define I2C_MASTER_INT_TX_DMA_DONE                                            \
N                                0x00000008  // TX DMA Complete Interrupt
X#define I2C_MASTER_INT_TX_DMA_DONE                                                                            0x00000008  
N#define I2C_MASTER_INT_RX_DMA_DONE                                            \
N                                0x00000004  // RX DMA Complete Interrupt
X#define I2C_MASTER_INT_RX_DMA_DONE                                                                            0x00000004  
N#define I2C_MASTER_INT_TIMEOUT  0x00000002  // Clock Timeout Interrupt
N#define I2C_MASTER_INT_DATA     0x00000001  // Data Interrupt
N
N//*****************************************************************************
N//
N// I2C Slave interrupts.
N//
N//*****************************************************************************
N#define I2C_SLAVE_INT_RX_FIFO_FULL                                            \
N                                0x00000100  // RX FIFO Full Interrupt
X#define I2C_SLAVE_INT_RX_FIFO_FULL                                                                            0x00000100  
N#define I2C_SLAVE_INT_TX_FIFO_EMPTY                                           \
N                                0x00000080  // TX FIFO Empty Interrupt
X#define I2C_SLAVE_INT_TX_FIFO_EMPTY                                                                           0x00000080  
N#define I2C_SLAVE_INT_RX_FIFO_REQ                                             \
N                                0x00000040  // RX FIFO Request Interrupt
X#define I2C_SLAVE_INT_RX_FIFO_REQ                                                                             0x00000040  
N#define I2C_SLAVE_INT_TX_FIFO_REQ                                             \
N                                0x00000020  // TX FIFO Request Interrupt
X#define I2C_SLAVE_INT_TX_FIFO_REQ                                                                             0x00000020  
N#define I2C_SLAVE_INT_TX_DMA_DONE                                             \
N                                0x00000010  // TX DMA Complete Interrupt
X#define I2C_SLAVE_INT_TX_DMA_DONE                                                                             0x00000010  
N#define I2C_SLAVE_INT_RX_DMA_DONE                                             \
N                                0x00000008  // RX DMA Complete Interrupt
X#define I2C_SLAVE_INT_RX_DMA_DONE                                                                             0x00000008  
N#define I2C_SLAVE_INT_STOP      0x00000004  // Stop Condition Interrupt
N#define I2C_SLAVE_INT_START     0x00000002  // Start Condition Interrupt
N#define I2C_SLAVE_INT_DATA      0x00000001  // Data Interrupt
N
N//*****************************************************************************
N//
N// I2C Slave FIFO configuration macros.
N//
N//*****************************************************************************
N#define I2C_SLAVE_TX_FIFO_ENABLE                                              \
N                                0x00000002
X#define I2C_SLAVE_TX_FIFO_ENABLE                                                                              0x00000002
N#define I2C_SLAVE_RX_FIFO_ENABLE                                              \
N                                0x00000004
X#define I2C_SLAVE_RX_FIFO_ENABLE                                                                              0x00000004
N
N//*****************************************************************************
N//
N// I2C FIFO configuration macros.
N//
N//*****************************************************************************
N#define I2C_FIFO_CFG_TX_MASTER  0x00000000
N#define I2C_FIFO_CFG_TX_SLAVE   0x00008000
N#define I2C_FIFO_CFG_RX_MASTER  0x00000000
N#define I2C_FIFO_CFG_RX_SLAVE   0x80000000
N#define I2C_FIFO_CFG_TX_MASTER_DMA                                            \
N                                0x00002000
X#define I2C_FIFO_CFG_TX_MASTER_DMA                                                                            0x00002000
N#define I2C_FIFO_CFG_TX_SLAVE_DMA                                             \
N                                0x0000a000
X#define I2C_FIFO_CFG_TX_SLAVE_DMA                                                                             0x0000a000
N#define I2C_FIFO_CFG_RX_MASTER_DMA                                            \
N                                0x20000000
X#define I2C_FIFO_CFG_RX_MASTER_DMA                                                                            0x20000000
N#define I2C_FIFO_CFG_RX_SLAVE_DMA                                             \
N                                0xa0000000
X#define I2C_FIFO_CFG_RX_SLAVE_DMA                                                                             0xa0000000
N#define I2C_FIFO_CFG_TX_NO_TRIG 0x00000000
N#define I2C_FIFO_CFG_TX_TRIG_1  0x00000001
N#define I2C_FIFO_CFG_TX_TRIG_2  0x00000002
N#define I2C_FIFO_CFG_TX_TRIG_3  0x00000003
N#define I2C_FIFO_CFG_TX_TRIG_4  0x00000004
N#define I2C_FIFO_CFG_TX_TRIG_5  0x00000005
N#define I2C_FIFO_CFG_TX_TRIG_6  0x00000006
N#define I2C_FIFO_CFG_TX_TRIG_7  0x00000007
N#define I2C_FIFO_CFG_TX_TRIG_8  0x00000008
N#define I2C_FIFO_CFG_RX_NO_TRIG 0x00000000
N#define I2C_FIFO_CFG_RX_TRIG_1  0x00010000
N#define I2C_FIFO_CFG_RX_TRIG_2  0x00020000
N#define I2C_FIFO_CFG_RX_TRIG_3  0x00030000
N#define I2C_FIFO_CFG_RX_TRIG_4  0x00040000
N#define I2C_FIFO_CFG_RX_TRIG_5  0x00050000
N#define I2C_FIFO_CFG_RX_TRIG_6  0x00060000
N#define I2C_FIFO_CFG_RX_TRIG_7  0x00070000
N#define I2C_FIFO_CFG_RX_TRIG_8  0x00080000
N
N//*****************************************************************************
N//
N// I2C FIFO status.
N//
N//*****************************************************************************
N#define I2C_FIFO_RX_BELOW_TRIG_LEVEL                                          \
N                                0x00040000
X#define I2C_FIFO_RX_BELOW_TRIG_LEVEL                                                                          0x00040000
N#define I2C_FIFO_RX_FULL        0x00020000
N#define I2C_FIFO_RX_EMPTY       0x00010000
N#define I2C_FIFO_TX_BELOW_TRIG_LEVEL                                          \
N                                0x00000004
X#define I2C_FIFO_TX_BELOW_TRIG_LEVEL                                                                          0x00000004
N#define I2C_FIFO_TX_FULL        0x00000002
N#define I2C_FIFO_TX_EMPTY       0x00000001
N
N//*****************************************************************************
N//
N// Prototypes for the APIs.
N//
N//*****************************************************************************
Nextern void I2CIntRegister(uint32_t ui32Base, void(*pfnHandler)(void));
Nextern void I2CIntUnregister(uint32_t ui32Base);
Nextern void I2CTxFIFOConfigSet(uint32_t ui32Base, uint32_t ui32Config);
Nextern void I2CTxFIFOFlush(uint32_t ui32Base);
Nextern void I2CRxFIFOConfigSet(uint32_t ui32Base, uint32_t ui32Config);
Nextern void I2CRxFIFOFlush(uint32_t ui32Base);
Nextern uint32_t I2CFIFOStatus(uint32_t ui32Base);
Nextern void I2CFIFODataPut(uint32_t ui32Base, uint8_t ui8Data);
Nextern uint32_t I2CFIFODataPutNonBlocking(uint32_t ui32Base,
N                                          uint8_t ui8Data);
Nextern uint32_t I2CFIFODataGet(uint32_t ui32Base);
Nextern uint32_t I2CFIFODataGetNonBlocking(uint32_t ui32Base,
N                                          uint8_t *pui8Data);
Nextern void I2CMasterBurstLengthSet(uint32_t ui32Base,
N                                    uint8_t ui8Length);
Nextern uint32_t I2CMasterBurstCountGet(uint32_t ui32Base);
Nextern void I2CMasterGlitchFilterConfigSet(uint32_t ui32Base,
N                                           uint32_t ui32Config);
Nextern void I2CSlaveFIFOEnable(uint32_t ui32Base, uint32_t ui32Config);
Nextern void I2CSlaveFIFODisable(uint32_t ui32Base);
Nextern bool I2CMasterBusBusy(uint32_t ui32Base);
Xextern _Bool I2CMasterBusBusy(uint32_t ui32Base);
Nextern bool I2CMasterBusy(uint32_t ui32Base);
Xextern _Bool I2CMasterBusy(uint32_t ui32Base);
Nextern void I2CMasterControl(uint32_t ui32Base, uint32_t ui32Cmd);
Nextern uint32_t I2CMasterDataGet(uint32_t ui32Base);
Nextern void I2CMasterDataPut(uint32_t ui32Base, uint8_t ui8Data);
Nextern void I2CMasterDisable(uint32_t ui32Base);
Nextern void I2CMasterEnable(uint32_t ui32Base);
Nextern uint32_t I2CMasterErr(uint32_t ui32Base);
Nextern void I2CMasterInitExpClk(uint32_t ui32Base, uint32_t ui32I2CClk,
N                                bool bFast);
X                                _Bool bFast);
Nextern void I2CMasterIntClear(uint32_t ui32Base);
Nextern void I2CMasterIntDisable(uint32_t ui32Base);
Nextern void I2CMasterIntEnable(uint32_t ui32Base);
Nextern bool I2CMasterIntStatus(uint32_t ui32Base, bool bMasked);
Xextern _Bool I2CMasterIntStatus(uint32_t ui32Base, _Bool bMasked);
Nextern void I2CMasterIntEnableEx(uint32_t ui32Base,
N                                 uint32_t ui32IntFlags);
Nextern void I2CMasterIntDisableEx(uint32_t ui32Base,
N                                  uint32_t ui32IntFlags);
Nextern uint32_t I2CMasterIntStatusEx(uint32_t ui32Base,
N                                       bool bMasked);
X                                       _Bool bMasked);
Nextern void I2CMasterIntClearEx(uint32_t ui32Base,
N                                uint32_t ui32IntFlags);
Nextern void I2CMasterTimeoutSet(uint32_t ui32Base, uint32_t ui32Value);
Nextern void I2CSlaveACKOverride(uint32_t ui32Base, bool bEnable);
Xextern void I2CSlaveACKOverride(uint32_t ui32Base, _Bool bEnable);
Nextern void I2CSlaveACKValueSet(uint32_t ui32Base, bool bACK);
Xextern void I2CSlaveACKValueSet(uint32_t ui32Base, _Bool bACK);
Nextern uint32_t I2CMasterLineStateGet(uint32_t ui32Base);
Nextern void I2CMasterSlaveAddrSet(uint32_t ui32Base,
N                                  uint8_t ui8SlaveAddr,
N                                  bool bReceive);
X                                  _Bool bReceive);
Nextern uint32_t I2CSlaveDataGet(uint32_t ui32Base);
Nextern void I2CSlaveDataPut(uint32_t ui32Base, uint8_t ui8Data);
Nextern void I2CSlaveDisable(uint32_t ui32Base);
Nextern void I2CSlaveEnable(uint32_t ui32Base);
Nextern void I2CSlaveInit(uint32_t ui32Base, uint8_t ui8SlaveAddr);
Nextern void I2CSlaveAddressSet(uint32_t ui32Base, uint8_t ui8AddrNum,
N                                 uint8_t ui8SlaveAddr);
Nextern void I2CSlaveIntClear(uint32_t ui32Base);
Nextern void I2CSlaveIntDisable(uint32_t ui32Base);
Nextern void I2CSlaveIntEnable(uint32_t ui32Base);
Nextern void I2CSlaveIntClearEx(uint32_t ui32Base, uint32_t ui32IntFlags);
Nextern void I2CSlaveIntDisableEx(uint32_t ui32Base,
N                                 uint32_t ui32IntFlags);
Nextern void I2CSlaveIntEnableEx(uint32_t ui32Base, uint32_t ui32IntFlags);
Nextern bool I2CSlaveIntStatus(uint32_t ui32Base, bool bMasked);
Xextern _Bool I2CSlaveIntStatus(uint32_t ui32Base, _Bool bMasked);
Nextern uint32_t I2CSlaveIntStatusEx(uint32_t ui32Base,
N                                      bool bMasked);
X                                      _Bool bMasked);
Nextern uint32_t I2CSlaveStatus(uint32_t ui32Base);
Nextern void I2CLoopbackEnable(uint32_t ui32Base);
N
N//*****************************************************************************
N//
N// Mark the end of the C bindings section for C++ compilers.
N//
N//*****************************************************************************
N#ifdef __cplusplus
S}
N#endif
N
N#endif // __DRIVERLIB_I2C_H__
L 8 "../bmp280.c" 2
N#include "driverlib/sysctl.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/driverlib/sysctl.h" 1
N//*****************************************************************************
N//
N// sysctl.h - Prototypes for the system control driver.
N//
N// Copyright (c) 2005-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N//   Redistribution and use in source and binary forms, with or without
N//   modification, are permitted provided that the following conditions
N//   are met:
N// 
N//   Redistributions of source code must retain the above copyright
N//   notice, this list of conditions and the following disclaimer.
N// 
N//   Redistributions in binary form must reproduce the above copyright
N//   notice, this list of conditions and the following disclaimer in the
N//   documentation and/or other materials provided with the  
N//   distribution.
N// 
N//   Neither the name of Texas Instruments Incorporated nor the names of
N//   its contributors may be used to endorse or promote products derived
N//   from this software without specific prior written permission.
N// 
N// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
N// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
N// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
N// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
N// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
N// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
N// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
N// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
N// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N// 
N// This is part of revision 2.1.3.156 of the Tiva Peripheral Driver Library.
N//
N//*****************************************************************************
N
N#ifndef __DRIVERLIB_SYSCTL_H__
N#define __DRIVERLIB_SYSCTL_H__
N
N//*****************************************************************************
N//
N// If building with a C++ compiler, make all of the definitions in this header
N// have a C binding.
N//
N//*****************************************************************************
N#ifdef __cplusplus
Sextern "C"
S{
N#endif
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the
N// SysCtlPeripheralPresent(), SysCtlPeripheralEnable(),
N// SysCtlPeripheralDisable(), and SysCtlPeripheralReset() APIs as the
N// ui32Peripheral parameter.  The peripherals in the fourth group (upper nibble
N// is 3) can only be used with the SysCtlPeripheralPresent() API.
N//
N//*****************************************************************************
N#define SYSCTL_PERIPH_ADC0      0xf0003800  // ADC 0
N#define SYSCTL_PERIPH_ADC1      0xf0003801  // ADC 1
N#define SYSCTL_PERIPH_CAN0      0xf0003400  // CAN 0
N#define SYSCTL_PERIPH_CAN1      0xf0003401  // CAN 1
N#define SYSCTL_PERIPH_COMP0     0xf0003c00  // Analog Comparator Module 0
N#define SYSCTL_PERIPH_EMAC0     0xf0009c00  // Ethernet MAC0
N#define SYSCTL_PERIPH_EPHY0     0xf0003000  // Ethernet PHY0
N#define SYSCTL_PERIPH_EPI0      0xf0001000  // EPI0
N#define SYSCTL_PERIPH_GPIOA     0xf0000800  // GPIO A
N#define SYSCTL_PERIPH_GPIOB     0xf0000801  // GPIO B
N#define SYSCTL_PERIPH_GPIOC     0xf0000802  // GPIO C
N#define SYSCTL_PERIPH_GPIOD     0xf0000803  // GPIO D
N#define SYSCTL_PERIPH_GPIOE     0xf0000804  // GPIO E
N#define SYSCTL_PERIPH_GPIOF     0xf0000805  // GPIO F
N#define SYSCTL_PERIPH_GPIOG     0xf0000806  // GPIO G
N#define SYSCTL_PERIPH_GPIOH     0xf0000807  // GPIO H
N#define SYSCTL_PERIPH_GPIOJ     0xf0000808  // GPIO J
N#define SYSCTL_PERIPH_HIBERNATE 0xf0001400  // Hibernation module
N#define SYSCTL_PERIPH_CCM0      0xf0007400  // CCM 0
N#define SYSCTL_PERIPH_EEPROM0   0xf0005800  // EEPROM 0
N#define SYSCTL_PERIPH_FAN0      0xf0005400  // FAN 0
N#define SYSCTL_PERIPH_FAN1      0xf0005401  // FAN 1
N#define SYSCTL_PERIPH_GPIOK     0xf0000809  // GPIO K
N#define SYSCTL_PERIPH_GPIOL     0xf000080a  // GPIO L
N#define SYSCTL_PERIPH_GPIOM     0xf000080b  // GPIO M
N#define SYSCTL_PERIPH_GPION     0xf000080c  // GPIO N
N#define SYSCTL_PERIPH_GPIOP     0xf000080d  // GPIO P
N#define SYSCTL_PERIPH_GPIOQ     0xf000080e  // GPIO Q
N#define SYSCTL_PERIPH_GPIOR     0xf000080f  // GPIO R
N#define SYSCTL_PERIPH_GPIOS     0xf0000810  // GPIO S
N#define SYSCTL_PERIPH_GPIOT     0xf0000811  // GPIO T
N#define SYSCTL_PERIPH_I2C0      0xf0002000  // I2C 0
N#define SYSCTL_PERIPH_I2C1      0xf0002001  // I2C 1
N#define SYSCTL_PERIPH_I2C2      0xf0002002  // I2C 2
N#define SYSCTL_PERIPH_I2C3      0xf0002003  // I2C 3
N#define SYSCTL_PERIPH_I2C4      0xf0002004  // I2C 4
N#define SYSCTL_PERIPH_I2C5      0xf0002005  // I2C 5
N#define SYSCTL_PERIPH_I2C6      0xf0002006  // I2C 6
N#define SYSCTL_PERIPH_I2C7      0xf0002007  // I2C 7
N#define SYSCTL_PERIPH_I2C8      0xf0002008  // I2C 8
N#define SYSCTL_PERIPH_I2C9      0xf0002009  // I2C 9
N#define SYSCTL_PERIPH_LCD0      0xf0009000  // LCD 0
N#define SYSCTL_PERIPH_ONEWIRE0  0xf0009800  // One Wire 0
N#define SYSCTL_PERIPH_PWM0      0xf0004000  // PWM 0
N#define SYSCTL_PERIPH_PWM1      0xf0004001  // PWM 1
N#define SYSCTL_PERIPH_QEI0      0xf0004400  // QEI 0
N#define SYSCTL_PERIPH_QEI1      0xf0004401  // QEI 1
N#define SYSCTL_PERIPH_SSI0      0xf0001c00  // SSI 0
N#define SYSCTL_PERIPH_SSI1      0xf0001c01  // SSI 1
N#define SYSCTL_PERIPH_SSI2      0xf0001c02  // SSI 2
N#define SYSCTL_PERIPH_SSI3      0xf0001c03  // SSI 3
N#define SYSCTL_PERIPH_TIMER0    0xf0000400  // Timer 0
N#define SYSCTL_PERIPH_TIMER1    0xf0000401  // Timer 1
N#define SYSCTL_PERIPH_TIMER2    0xf0000402  // Timer 2
N#define SYSCTL_PERIPH_TIMER3    0xf0000403  // Timer 3
N#define SYSCTL_PERIPH_TIMER4    0xf0000404  // Timer 4
N#define SYSCTL_PERIPH_TIMER5    0xf0000405  // Timer 5
N#define SYSCTL_PERIPH_TIMER6    0xf0000406  // Timer 6
N#define SYSCTL_PERIPH_TIMER7    0xf0000407  // Timer 7
N#define SYSCTL_PERIPH_UART0     0xf0001800  // UART 0
N#define SYSCTL_PERIPH_UART1     0xf0001801  // UART 1
N#define SYSCTL_PERIPH_UART2     0xf0001802  // UART 2
N#define SYSCTL_PERIPH_UART3     0xf0001803  // UART 3
N#define SYSCTL_PERIPH_UART4     0xf0001804  // UART 4
N#define SYSCTL_PERIPH_UART5     0xf0001805  // UART 5
N#define SYSCTL_PERIPH_UART6     0xf0001806  // UART 6
N#define SYSCTL_PERIPH_UART7     0xf0001807  // UART 7
N#define SYSCTL_PERIPH_UDMA      0xf0000c00  // uDMA
N#define SYSCTL_PERIPH_USB0      0xf0002800  // USB 0
N#define SYSCTL_PERIPH_WDOG0     0xf0000000  // Watchdog 0
N#define SYSCTL_PERIPH_WDOG1     0xf0000001  // Watchdog 1
N#define SYSCTL_PERIPH_WTIMER0   0xf0005c00  // Wide Timer 0
N#define SYSCTL_PERIPH_WTIMER1   0xf0005c01  // Wide Timer 1
N#define SYSCTL_PERIPH_WTIMER2   0xf0005c02  // Wide Timer 2
N#define SYSCTL_PERIPH_WTIMER3   0xf0005c03  // Wide Timer 3
N#define SYSCTL_PERIPH_WTIMER4   0xf0005c04  // Wide Timer 4
N#define SYSCTL_PERIPH_WTIMER5   0xf0005c05  // Wide Timer 5
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlLDOSleepSet() and
N// SysCtlLDODeepSleepSet() APIs as the ui32Voltage value, or returned by the
N// SysCtlLDOSleepGet() and SysCtlLDODeepSleepGet() APIs.
N//
N//*****************************************************************************
N#define SYSCTL_LDO_0_90V        0x80000012  // LDO output of 0.90V
N#define SYSCTL_LDO_0_95V        0x80000013  // LDO output of 0.95V
N#define SYSCTL_LDO_1_00V        0x80000014  // LDO output of 1.00V
N#define SYSCTL_LDO_1_05V        0x80000015  // LDO output of 1.05V
N#define SYSCTL_LDO_1_10V        0x80000016  // LDO output of 1.10V
N#define SYSCTL_LDO_1_15V        0x80000017  // LDO output of 1.15V
N#define SYSCTL_LDO_1_20V        0x80000018  // LDO output of 1.20V
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlIntEnable(),
N// SysCtlIntDisable(), and SysCtlIntClear() APIs, or returned in the bit mask
N// by the SysCtlIntStatus() API.
N//
N//*****************************************************************************
N#define SYSCTL_INT_BOR0         0x00000800  // VDD under BOR0
N#define SYSCTL_INT_VDDA_OK      0x00000400  // VDDA Power OK
N#define SYSCTL_INT_MOSC_PUP     0x00000100  // MOSC power-up interrupt
N#define SYSCTL_INT_USBPLL_LOCK  0x00000080  // USB PLL lock interrupt
N#define SYSCTL_INT_PLL_LOCK     0x00000040  // PLL lock interrupt
N#define SYSCTL_INT_MOSC_FAIL    0x00000008  // Main oscillator failure int
N#define SYSCTL_INT_BOR1         0x00000002  // VDD under BOR1
N#define SYSCTL_INT_BOR          0x00000002  // Brown out interrupt
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlResetCauseClear()
N// API or returned by the SysCtlResetCauseGet() API.
N//
N//*****************************************************************************
N#define SYSCTL_CAUSE_HSRVREQ    0x00001000  // Hardware System Service Request
N#define SYSCTL_CAUSE_HIB        0x00000040  // Hibernate reset
N#define SYSCTL_CAUSE_WDOG1      0x00000020  // Watchdog 1 reset
N#define SYSCTL_CAUSE_SW         0x00000010  // Software reset
N#define SYSCTL_CAUSE_WDOG0      0x00000008  // Watchdog 0 reset
N#ifndef DEPRECATED
N#define SYSCTL_CAUSE_WDOG       SYSCTL_CAUSE_WDOG0
N                                            // Watchdog reset(Deprecated)
N#endif
N#define SYSCTL_CAUSE_BOR        0x00000004  // Brown-out reset
N#define SYSCTL_CAUSE_POR        0x00000002  // Power on reset
N#define SYSCTL_CAUSE_EXT        0x00000001  // External reset
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlBrownOutConfigSet()
N// API as the ui32Config parameter.
N//
N//*****************************************************************************
N#define SYSCTL_BOR_RESET        0x00000002  // Reset instead of interrupting
N#define SYSCTL_BOR_RESAMPLE     0x00000001  // Resample BOR before asserting
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlPWMClockSet() API
N// as the ui32Config parameter, and can be returned by the SysCtlPWMClockGet()
N// API.
N//
N//*****************************************************************************
N#define SYSCTL_PWMDIV_1         0x00000000  // PWM clock is processor clock /1
N#define SYSCTL_PWMDIV_2         0x00100000  // PWM clock is processor clock /2
N#define SYSCTL_PWMDIV_4         0x00120000  // PWM clock is processor clock /4
N#define SYSCTL_PWMDIV_8         0x00140000  // PWM clock is processor clock /8
N#define SYSCTL_PWMDIV_16        0x00160000  // PWM clock is processor clock /16
N#define SYSCTL_PWMDIV_32        0x00180000  // PWM clock is processor clock /32
N#define SYSCTL_PWMDIV_64        0x001A0000  // PWM clock is processor clock /64
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlClockSet() API as
N// the ui32Config parameter.
N//
N//*****************************************************************************
N#define SYSCTL_SYSDIV_1         0x07800000  // Processor clock is osc/pll /1
N#define SYSCTL_SYSDIV_2         0x00C00000  // Processor clock is osc/pll /2
N#define SYSCTL_SYSDIV_3         0x01400000  // Processor clock is osc/pll /3
N#define SYSCTL_SYSDIV_4         0x01C00000  // Processor clock is osc/pll /4
N#define SYSCTL_SYSDIV_5         0x02400000  // Processor clock is osc/pll /5
N#define SYSCTL_SYSDIV_6         0x02C00000  // Processor clock is osc/pll /6
N#define SYSCTL_SYSDIV_7         0x03400000  // Processor clock is osc/pll /7
N#define SYSCTL_SYSDIV_8         0x03C00000  // Processor clock is osc/pll /8
N#define SYSCTL_SYSDIV_9         0x04400000  // Processor clock is osc/pll /9
N#define SYSCTL_SYSDIV_10        0x04C00000  // Processor clock is osc/pll /10
N#define SYSCTL_SYSDIV_11        0x05400000  // Processor clock is osc/pll /11
N#define SYSCTL_SYSDIV_12        0x05C00000  // Processor clock is osc/pll /12
N#define SYSCTL_SYSDIV_13        0x06400000  // Processor clock is osc/pll /13
N#define SYSCTL_SYSDIV_14        0x06C00000  // Processor clock is osc/pll /14
N#define SYSCTL_SYSDIV_15        0x07400000  // Processor clock is osc/pll /15
N#define SYSCTL_SYSDIV_16        0x07C00000  // Processor clock is osc/pll /16
N#define SYSCTL_SYSDIV_17        0x88400000  // Processor clock is osc/pll /17
N#define SYSCTL_SYSDIV_18        0x88C00000  // Processor clock is osc/pll /18
N#define SYSCTL_SYSDIV_19        0x89400000  // Processor clock is osc/pll /19
N#define SYSCTL_SYSDIV_20        0x89C00000  // Processor clock is osc/pll /20
N#define SYSCTL_SYSDIV_21        0x8A400000  // Processor clock is osc/pll /21
N#define SYSCTL_SYSDIV_22        0x8AC00000  // Processor clock is osc/pll /22
N#define SYSCTL_SYSDIV_23        0x8B400000  // Processor clock is osc/pll /23
N#define SYSCTL_SYSDIV_24        0x8BC00000  // Processor clock is osc/pll /24
N#define SYSCTL_SYSDIV_25        0x8C400000  // Processor clock is osc/pll /25
N#define SYSCTL_SYSDIV_26        0x8CC00000  // Processor clock is osc/pll /26
N#define SYSCTL_SYSDIV_27        0x8D400000  // Processor clock is osc/pll /27
N#define SYSCTL_SYSDIV_28        0x8DC00000  // Processor clock is osc/pll /28
N#define SYSCTL_SYSDIV_29        0x8E400000  // Processor clock is osc/pll /29
N#define SYSCTL_SYSDIV_30        0x8EC00000  // Processor clock is osc/pll /30
N#define SYSCTL_SYSDIV_31        0x8F400000  // Processor clock is osc/pll /31
N#define SYSCTL_SYSDIV_32        0x8FC00000  // Processor clock is osc/pll /32
N#define SYSCTL_SYSDIV_33        0x90400000  // Processor clock is osc/pll /33
N#define SYSCTL_SYSDIV_34        0x90C00000  // Processor clock is osc/pll /34
N#define SYSCTL_SYSDIV_35        0x91400000  // Processor clock is osc/pll /35
N#define SYSCTL_SYSDIV_36        0x91C00000  // Processor clock is osc/pll /36
N#define SYSCTL_SYSDIV_37        0x92400000  // Processor clock is osc/pll /37
N#define SYSCTL_SYSDIV_38        0x92C00000  // Processor clock is osc/pll /38
N#define SYSCTL_SYSDIV_39        0x93400000  // Processor clock is osc/pll /39
N#define SYSCTL_SYSDIV_40        0x93C00000  // Processor clock is osc/pll /40
N#define SYSCTL_SYSDIV_41        0x94400000  // Processor clock is osc/pll /41
N#define SYSCTL_SYSDIV_42        0x94C00000  // Processor clock is osc/pll /42
N#define SYSCTL_SYSDIV_43        0x95400000  // Processor clock is osc/pll /43
N#define SYSCTL_SYSDIV_44        0x95C00000  // Processor clock is osc/pll /44
N#define SYSCTL_SYSDIV_45        0x96400000  // Processor clock is osc/pll /45
N#define SYSCTL_SYSDIV_46        0x96C00000  // Processor clock is osc/pll /46
N#define SYSCTL_SYSDIV_47        0x97400000  // Processor clock is osc/pll /47
N#define SYSCTL_SYSDIV_48        0x97C00000  // Processor clock is osc/pll /48
N#define SYSCTL_SYSDIV_49        0x98400000  // Processor clock is osc/pll /49
N#define SYSCTL_SYSDIV_50        0x98C00000  // Processor clock is osc/pll /50
N#define SYSCTL_SYSDIV_51        0x99400000  // Processor clock is osc/pll /51
N#define SYSCTL_SYSDIV_52        0x99C00000  // Processor clock is osc/pll /52
N#define SYSCTL_SYSDIV_53        0x9A400000  // Processor clock is osc/pll /53
N#define SYSCTL_SYSDIV_54        0x9AC00000  // Processor clock is osc/pll /54
N#define SYSCTL_SYSDIV_55        0x9B400000  // Processor clock is osc/pll /55
N#define SYSCTL_SYSDIV_56        0x9BC00000  // Processor clock is osc/pll /56
N#define SYSCTL_SYSDIV_57        0x9C400000  // Processor clock is osc/pll /57
N#define SYSCTL_SYSDIV_58        0x9CC00000  // Processor clock is osc/pll /58
N#define SYSCTL_SYSDIV_59        0x9D400000  // Processor clock is osc/pll /59
N#define SYSCTL_SYSDIV_60        0x9DC00000  // Processor clock is osc/pll /60
N#define SYSCTL_SYSDIV_61        0x9E400000  // Processor clock is osc/pll /61
N#define SYSCTL_SYSDIV_62        0x9EC00000  // Processor clock is osc/pll /62
N#define SYSCTL_SYSDIV_63        0x9F400000  // Processor clock is osc/pll /63
N#define SYSCTL_SYSDIV_64        0x9FC00000  // Processor clock is osc/pll /64
N#define SYSCTL_SYSDIV_2_5       0xC1000000  // Processor clock is pll / 2.5
N#define SYSCTL_SYSDIV_3_5       0xC1800000  // Processor clock is pll / 3.5
N#define SYSCTL_SYSDIV_4_5       0xC2000000  // Processor clock is pll / 4.5
N#define SYSCTL_SYSDIV_5_5       0xC2800000  // Processor clock is pll / 5.5
N#define SYSCTL_SYSDIV_6_5       0xC3000000  // Processor clock is pll / 6.5
N#define SYSCTL_SYSDIV_7_5       0xC3800000  // Processor clock is pll / 7.5
N#define SYSCTL_SYSDIV_8_5       0xC4000000  // Processor clock is pll / 8.5
N#define SYSCTL_SYSDIV_9_5       0xC4800000  // Processor clock is pll / 9.5
N#define SYSCTL_SYSDIV_10_5      0xC5000000  // Processor clock is pll / 10.5
N#define SYSCTL_SYSDIV_11_5      0xC5800000  // Processor clock is pll / 11.5
N#define SYSCTL_SYSDIV_12_5      0xC6000000  // Processor clock is pll / 12.5
N#define SYSCTL_SYSDIV_13_5      0xC6800000  // Processor clock is pll / 13.5
N#define SYSCTL_SYSDIV_14_5      0xC7000000  // Processor clock is pll / 14.5
N#define SYSCTL_SYSDIV_15_5      0xC7800000  // Processor clock is pll / 15.5
N#define SYSCTL_SYSDIV_16_5      0xC8000000  // Processor clock is pll / 16.5
N#define SYSCTL_SYSDIV_17_5      0xC8800000  // Processor clock is pll / 17.5
N#define SYSCTL_SYSDIV_18_5      0xC9000000  // Processor clock is pll / 18.5
N#define SYSCTL_SYSDIV_19_5      0xC9800000  // Processor clock is pll / 19.5
N#define SYSCTL_SYSDIV_20_5      0xCA000000  // Processor clock is pll / 20.5
N#define SYSCTL_SYSDIV_21_5      0xCA800000  // Processor clock is pll / 21.5
N#define SYSCTL_SYSDIV_22_5      0xCB000000  // Processor clock is pll / 22.5
N#define SYSCTL_SYSDIV_23_5      0xCB800000  // Processor clock is pll / 23.5
N#define SYSCTL_SYSDIV_24_5      0xCC000000  // Processor clock is pll / 24.5
N#define SYSCTL_SYSDIV_25_5      0xCC800000  // Processor clock is pll / 25.5
N#define SYSCTL_SYSDIV_26_5      0xCD000000  // Processor clock is pll / 26.5
N#define SYSCTL_SYSDIV_27_5      0xCD800000  // Processor clock is pll / 27.5
N#define SYSCTL_SYSDIV_28_5      0xCE000000  // Processor clock is pll / 28.5
N#define SYSCTL_SYSDIV_29_5      0xCE800000  // Processor clock is pll / 29.5
N#define SYSCTL_SYSDIV_30_5      0xCF000000  // Processor clock is pll / 30.5
N#define SYSCTL_SYSDIV_31_5      0xCF800000  // Processor clock is pll / 31.5
N#define SYSCTL_SYSDIV_32_5      0xD0000000  // Processor clock is pll / 32.5
N#define SYSCTL_SYSDIV_33_5      0xD0800000  // Processor clock is pll / 33.5
N#define SYSCTL_SYSDIV_34_5      0xD1000000  // Processor clock is pll / 34.5
N#define SYSCTL_SYSDIV_35_5      0xD1800000  // Processor clock is pll / 35.5
N#define SYSCTL_SYSDIV_36_5      0xD2000000  // Processor clock is pll / 36.5
N#define SYSCTL_SYSDIV_37_5      0xD2800000  // Processor clock is pll / 37.5
N#define SYSCTL_SYSDIV_38_5      0xD3000000  // Processor clock is pll / 38.5
N#define SYSCTL_SYSDIV_39_5      0xD3800000  // Processor clock is pll / 39.5
N#define SYSCTL_SYSDIV_40_5      0xD4000000  // Processor clock is pll / 40.5
N#define SYSCTL_SYSDIV_41_5      0xD4800000  // Processor clock is pll / 41.5
N#define SYSCTL_SYSDIV_42_5      0xD5000000  // Processor clock is pll / 42.5
N#define SYSCTL_SYSDIV_43_5      0xD5800000  // Processor clock is pll / 43.5
N#define SYSCTL_SYSDIV_44_5      0xD6000000  // Processor clock is pll / 44.5
N#define SYSCTL_SYSDIV_45_5      0xD6800000  // Processor clock is pll / 45.5
N#define SYSCTL_SYSDIV_46_5      0xD7000000  // Processor clock is pll / 46.5
N#define SYSCTL_SYSDIV_47_5      0xD7800000  // Processor clock is pll / 47.5
N#define SYSCTL_SYSDIV_48_5      0xD8000000  // Processor clock is pll / 48.5
N#define SYSCTL_SYSDIV_49_5      0xD8800000  // Processor clock is pll / 49.5
N#define SYSCTL_SYSDIV_50_5      0xD9000000  // Processor clock is pll / 50.5
N#define SYSCTL_SYSDIV_51_5      0xD9800000  // Processor clock is pll / 51.5
N#define SYSCTL_SYSDIV_52_5      0xDA000000  // Processor clock is pll / 52.5
N#define SYSCTL_SYSDIV_53_5      0xDA800000  // Processor clock is pll / 53.5
N#define SYSCTL_SYSDIV_54_5      0xDB000000  // Processor clock is pll / 54.5
N#define SYSCTL_SYSDIV_55_5      0xDB800000  // Processor clock is pll / 55.5
N#define SYSCTL_SYSDIV_56_5      0xDC000000  // Processor clock is pll / 56.5
N#define SYSCTL_SYSDIV_57_5      0xDC800000  // Processor clock is pll / 57.5
N#define SYSCTL_SYSDIV_58_5      0xDD000000  // Processor clock is pll / 58.5
N#define SYSCTL_SYSDIV_59_5      0xDD800000  // Processor clock is pll / 59.5
N#define SYSCTL_SYSDIV_60_5      0xDE000000  // Processor clock is pll / 60.5
N#define SYSCTL_SYSDIV_61_5      0xDE800000  // Processor clock is pll / 61.5
N#define SYSCTL_SYSDIV_62_5      0xDF000000  // Processor clock is pll / 62.5
N#define SYSCTL_SYSDIV_63_5      0xDF800000  // Processor clock is pll / 63.5
N#define SYSCTL_CFG_VCO_480      0xF1000000  // VCO is 480 MHz
N#define SYSCTL_CFG_VCO_320      0xF0000000  // VCO is 320 MHz
N#define SYSCTL_USE_PLL          0x00000000  // System clock is the PLL clock
N#define SYSCTL_USE_OSC          0x00003800  // System clock is the osc clock
N#define SYSCTL_XTAL_1MHZ        0x00000000  // External crystal is 1MHz
N#define SYSCTL_XTAL_1_84MHZ     0x00000040  // External crystal is 1.8432MHz
N#define SYSCTL_XTAL_2MHZ        0x00000080  // External crystal is 2MHz
N#define SYSCTL_XTAL_2_45MHZ     0x000000C0  // External crystal is 2.4576MHz
N#define SYSCTL_XTAL_3_57MHZ     0x00000100  // External crystal is 3.579545MHz
N#define SYSCTL_XTAL_3_68MHZ     0x00000140  // External crystal is 3.6864MHz
N#define SYSCTL_XTAL_4MHZ        0x00000180  // External crystal is 4MHz
N#define SYSCTL_XTAL_4_09MHZ     0x000001C0  // External crystal is 4.096MHz
N#define SYSCTL_XTAL_4_91MHZ     0x00000200  // External crystal is 4.9152MHz
N#define SYSCTL_XTAL_5MHZ        0x00000240  // External crystal is 5MHz
N#define SYSCTL_XTAL_5_12MHZ     0x00000280  // External crystal is 5.12MHz
N#define SYSCTL_XTAL_6MHZ        0x000002C0  // External crystal is 6MHz
N#define SYSCTL_XTAL_6_14MHZ     0x00000300  // External crystal is 6.144MHz
N#define SYSCTL_XTAL_7_37MHZ     0x00000340  // External crystal is 7.3728MHz
N#define SYSCTL_XTAL_8MHZ        0x00000380  // External crystal is 8MHz
N#define SYSCTL_XTAL_8_19MHZ     0x000003C0  // External crystal is 8.192MHz
N#define SYSCTL_XTAL_10MHZ       0x00000400  // External crystal is 10 MHz
N#define SYSCTL_XTAL_12MHZ       0x00000440  // External crystal is 12 MHz
N#define SYSCTL_XTAL_12_2MHZ     0x00000480  // External crystal is 12.288 MHz
N#define SYSCTL_XTAL_13_5MHZ     0x000004C0  // External crystal is 13.56 MHz
N#define SYSCTL_XTAL_14_3MHZ     0x00000500  // External crystal is 14.31818 MHz
N#define SYSCTL_XTAL_16MHZ       0x00000540  // External crystal is 16 MHz
N#define SYSCTL_XTAL_16_3MHZ     0x00000580  // External crystal is 16.384 MHz
N#define SYSCTL_XTAL_18MHZ       0x000005C0  // External crystal is 18.0 MHz
N#define SYSCTL_XTAL_20MHZ       0x00000600  // External crystal is 20.0 MHz
N#define SYSCTL_XTAL_24MHZ       0x00000640  // External crystal is 24.0 MHz
N#define SYSCTL_XTAL_25MHZ       0x00000680  // External crystal is 25.0 MHz
N#define SYSCTL_OSC_MAIN         0x00000000  // Osc source is main osc
N#define SYSCTL_OSC_INT          0x00000010  // Osc source is int. osc
N#define SYSCTL_OSC_INT4         0x00000020  // Osc source is int. osc /4
N#define SYSCTL_OSC_INT30        0x00000030  // Osc source is int. 30 KHz
N#define SYSCTL_OSC_EXT32        0x80000038  // Osc source is ext. 32 KHz
N#define SYSCTL_INT_OSC_DIS      0x00000002  // Disable internal oscillator
N#define SYSCTL_MAIN_OSC_DIS     0x00000001  // Disable main oscillator
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlDeepSleepClockSet()
N// API as the ui32Config parameter.
N//
N//*****************************************************************************
N#define SYSCTL_DSLP_DIV_1       0x00000000  // Deep-sleep clock is osc /1
N#define SYSCTL_DSLP_DIV_2       0x00800000  // Deep-sleep clock is osc /2
N#define SYSCTL_DSLP_DIV_3       0x01000000  // Deep-sleep clock is osc /3
N#define SYSCTL_DSLP_DIV_4       0x01800000  // Deep-sleep clock is osc /4
N#define SYSCTL_DSLP_DIV_5       0x02000000  // Deep-sleep clock is osc /5
N#define SYSCTL_DSLP_DIV_6       0x02800000  // Deep-sleep clock is osc /6
N#define SYSCTL_DSLP_DIV_7       0x03000000  // Deep-sleep clock is osc /7
N#define SYSCTL_DSLP_DIV_8       0x03800000  // Deep-sleep clock is osc /8
N#define SYSCTL_DSLP_DIV_9       0x04000000  // Deep-sleep clock is osc /9
N#define SYSCTL_DSLP_DIV_10      0x04800000  // Deep-sleep clock is osc /10
N#define SYSCTL_DSLP_DIV_11      0x05000000  // Deep-sleep clock is osc /11
N#define SYSCTL_DSLP_DIV_12      0x05800000  // Deep-sleep clock is osc /12
N#define SYSCTL_DSLP_DIV_13      0x06000000  // Deep-sleep clock is osc /13
N#define SYSCTL_DSLP_DIV_14      0x06800000  // Deep-sleep clock is osc /14
N#define SYSCTL_DSLP_DIV_15      0x07000000  // Deep-sleep clock is osc /15
N#define SYSCTL_DSLP_DIV_16      0x07800000  // Deep-sleep clock is osc /16
N#define SYSCTL_DSLP_DIV_17      0x08000000  // Deep-sleep clock is osc /17
N#define SYSCTL_DSLP_DIV_18      0x08800000  // Deep-sleep clock is osc /18
N#define SYSCTL_DSLP_DIV_19      0x09000000  // Deep-sleep clock is osc /19
N#define SYSCTL_DSLP_DIV_20      0x09800000  // Deep-sleep clock is osc /20
N#define SYSCTL_DSLP_DIV_21      0x0A000000  // Deep-sleep clock is osc /21
N#define SYSCTL_DSLP_DIV_22      0x0A800000  // Deep-sleep clock is osc /22
N#define SYSCTL_DSLP_DIV_23      0x0B000000  // Deep-sleep clock is osc /23
N#define SYSCTL_DSLP_DIV_24      0x0B800000  // Deep-sleep clock is osc /24
N#define SYSCTL_DSLP_DIV_25      0x0C000000  // Deep-sleep clock is osc /25
N#define SYSCTL_DSLP_DIV_26      0x0C800000  // Deep-sleep clock is osc /26
N#define SYSCTL_DSLP_DIV_27      0x0D000000  // Deep-sleep clock is osc /27
N#define SYSCTL_DSLP_DIV_28      0x0D800000  // Deep-sleep clock is osc /28
N#define SYSCTL_DSLP_DIV_29      0x0E000000  // Deep-sleep clock is osc /29
N#define SYSCTL_DSLP_DIV_30      0x0E800000  // Deep-sleep clock is osc /30
N#define SYSCTL_DSLP_DIV_31      0x0F000000  // Deep-sleep clock is osc /31
N#define SYSCTL_DSLP_DIV_32      0x0F800000  // Deep-sleep clock is osc /32
N#define SYSCTL_DSLP_DIV_33      0x10000000  // Deep-sleep clock is osc /33
N#define SYSCTL_DSLP_DIV_34      0x10800000  // Deep-sleep clock is osc /34
N#define SYSCTL_DSLP_DIV_35      0x11000000  // Deep-sleep clock is osc /35
N#define SYSCTL_DSLP_DIV_36      0x11800000  // Deep-sleep clock is osc /36
N#define SYSCTL_DSLP_DIV_37      0x12000000  // Deep-sleep clock is osc /37
N#define SYSCTL_DSLP_DIV_38      0x12800000  // Deep-sleep clock is osc /38
N#define SYSCTL_DSLP_DIV_39      0x13000000  // Deep-sleep clock is osc /39
N#define SYSCTL_DSLP_DIV_40      0x13800000  // Deep-sleep clock is osc /40
N#define SYSCTL_DSLP_DIV_41      0x14000000  // Deep-sleep clock is osc /41
N#define SYSCTL_DSLP_DIV_42      0x14800000  // Deep-sleep clock is osc /42
N#define SYSCTL_DSLP_DIV_43      0x15000000  // Deep-sleep clock is osc /43
N#define SYSCTL_DSLP_DIV_44      0x15800000  // Deep-sleep clock is osc /44
N#define SYSCTL_DSLP_DIV_45      0x16000000  // Deep-sleep clock is osc /45
N#define SYSCTL_DSLP_DIV_46      0x16800000  // Deep-sleep clock is osc /46
N#define SYSCTL_DSLP_DIV_47      0x17000000  // Deep-sleep clock is osc /47
N#define SYSCTL_DSLP_DIV_48      0x17800000  // Deep-sleep clock is osc /48
N#define SYSCTL_DSLP_DIV_49      0x18000000  // Deep-sleep clock is osc /49
N#define SYSCTL_DSLP_DIV_50      0x18800000  // Deep-sleep clock is osc /50
N#define SYSCTL_DSLP_DIV_51      0x19000000  // Deep-sleep clock is osc /51
N#define SYSCTL_DSLP_DIV_52      0x19800000  // Deep-sleep clock is osc /52
N#define SYSCTL_DSLP_DIV_53      0x1A000000  // Deep-sleep clock is osc /53
N#define SYSCTL_DSLP_DIV_54      0x1A800000  // Deep-sleep clock is osc /54
N#define SYSCTL_DSLP_DIV_55      0x1B000000  // Deep-sleep clock is osc /55
N#define SYSCTL_DSLP_DIV_56      0x1B800000  // Deep-sleep clock is osc /56
N#define SYSCTL_DSLP_DIV_57      0x1C000000  // Deep-sleep clock is osc /57
N#define SYSCTL_DSLP_DIV_58      0x1C800000  // Deep-sleep clock is osc /58
N#define SYSCTL_DSLP_DIV_59      0x1D000000  // Deep-sleep clock is osc /59
N#define SYSCTL_DSLP_DIV_60      0x1D800000  // Deep-sleep clock is osc /60
N#define SYSCTL_DSLP_DIV_61      0x1E000000  // Deep-sleep clock is osc /61
N#define SYSCTL_DSLP_DIV_62      0x1E800000  // Deep-sleep clock is osc /62
N#define SYSCTL_DSLP_DIV_63      0x1F000000  // Deep-sleep clock is osc /63
N#define SYSCTL_DSLP_DIV_64      0x1F800000  // Deep-sleep clock is osc /64
N#define SYSCTL_DSLP_OSC_MAIN    0x00000000  // Osc source is main osc
N#define SYSCTL_DSLP_OSC_INT     0x00000010  // Osc source is int. osc
N#define SYSCTL_DSLP_OSC_INT30   0x00000030  // Osc source is int. 30 KHz
N#define SYSCTL_DSLP_OSC_EXT32   0x00000070  // Osc source is ext. 32 KHz
N#define SYSCTL_DSLP_PIOSC_PD    0x00000002  // Power down PIOSC in deep-sleep
N#define SYSCTL_DSLP_MOSC_PD     0x40000000  // Power down MOSC in deep-sleep
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlPIOSCCalibrate()
N// API as the ui32Type parameter.
N//
N//*****************************************************************************
N#define SYSCTL_PIOSC_CAL_AUTO   0x00000200  // Automatic calibration
N#define SYSCTL_PIOSC_CAL_FACT   0x00000100  // Factory calibration
N#define SYSCTL_PIOSC_CAL_USER   0x80000100  // User-supplied calibration
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlMOSCConfigSet() API
N// as the ui32Config parameter.
N//
N//*****************************************************************************
N#define SYSCTL_MOSC_VALIDATE    0x00000001  // Enable MOSC validation
N#define SYSCTL_MOSC_INTERRUPT   0x00000002  // Generate interrupt on MOSC fail
N#define SYSCTL_MOSC_NO_XTAL     0x00000004  // No crystal is attached to MOSC
N#define SYSCTL_MOSC_PWR_DIS     0x00000008  // Power down the MOSC.
N#define SYSCTL_MOSC_LOWFREQ     0x00000000  // MOSC is less than 10MHz
N#define SYSCTL_MOSC_HIGHFREQ    0x00000010  // MOSC is greater than 10MHz
N#define SYSCTL_MOSC_SESRC       0x00000020  // Singled ended oscillator source.
N
N//*****************************************************************************
N//
N// The following are values that can be passed to the SysCtlSleepPowerSet() and
N// SysCtlDeepSleepPowerSet() APIs as the ui32Config parameter.
N//
N//*****************************************************************************
N#define SYSCTL_LDO_SLEEP        0x00000200  // LDO in sleep mode
N                                            // (Deep Sleep Only)
N#define SYSCTL_TEMP_LOW_POWER   0x00000100  // Temp sensor in low power mode
N                                            // (Deep Sleep Only)
N#define SYSCTL_FLASH_NORMAL     0x00000000  // Flash in normal mode
N#define SYSCTL_FLASH_LOW_POWER  0x00000020  // Flash in low power mode
N#define SYSCTL_SRAM_NORMAL      0x00000000  // SRAM in normal mode
N#define SYSCTL_SRAM_STANDBY     0x00000001  // SRAM in standby mode
N#define SYSCTL_SRAM_LOW_POWER   0x00000003  // SRAM in low power mode
N
N//*****************************************************************************
N//
N// Defines for the SysCtlResetBehaviorSet() and SysCtlResetBehaviorGet() APIs.
N//
N//*****************************************************************************
N#define SYSCTL_ONRST_WDOG0_POR  0x00000030
N#define SYSCTL_ONRST_WDOG0_SYS  0x00000020
N#define SYSCTL_ONRST_WDOG1_POR  0x000000C0
N#define SYSCTL_ONRST_WDOG1_SYS  0x00000080
N#define SYSCTL_ONRST_BOR_POR    0x0000000C
N#define SYSCTL_ONRST_BOR_SYS    0x00000008
N#define SYSCTL_ONRST_EXT_POR    0x00000003
N#define SYSCTL_ONRST_EXT_SYS    0x00000002
N
N//*****************************************************************************
N//
N// Values used with the SysCtlVoltageEventConfig() API.
N//
N//*****************************************************************************
N#define SYSCTL_VEVENT_VDDABO_NONE                                             \
N                                0x00000000
X#define SYSCTL_VEVENT_VDDABO_NONE                                                                             0x00000000
N#define SYSCTL_VEVENT_VDDABO_INT                                              \
N                                0x00000100
X#define SYSCTL_VEVENT_VDDABO_INT                                                                              0x00000100
N#define SYSCTL_VEVENT_VDDABO_NMI                                              \
N                                0x00000200
X#define SYSCTL_VEVENT_VDDABO_NMI                                                                              0x00000200
N#define SYSCTL_VEVENT_VDDABO_RST                                              \
N                                0x00000300
X#define SYSCTL_VEVENT_VDDABO_RST                                                                              0x00000300
N#define SYSCTL_VEVENT_VDDBO_NONE                                              \
N                                0x00000000
X#define SYSCTL_VEVENT_VDDBO_NONE                                                                              0x00000000
N#define SYSCTL_VEVENT_VDDBO_INT 0x00000001
N#define SYSCTL_VEVENT_VDDBO_NMI 0x00000002
N#define SYSCTL_VEVENT_VDDBO_RST 0x00000003
N
N//*****************************************************************************
N//
N// Values used with the SysCtlVoltageEventStatus() and
N// SysCtlVoltageEventClear() APIs.
N//
N//*****************************************************************************
N#define SYSCTL_VESTAT_VDDBOR    0x00000040
N#define SYSCTL_VESTAT_VDDABOR   0x00000010
N
N//*****************************************************************************
N//
N// Values used with the SysCtlNMIStatus() API.
N//
N//*****************************************************************************
N#define SYSCTL_NMI_MOSCFAIL     0x00010000
N#define SYSCTL_NMI_TAMPER       0x00000200
N#define SYSCTL_NMI_WDT1         0x00000020
N#define SYSCTL_NMI_WDT0         0x00000008
N#define SYSCTL_NMI_POWER        0x00000004
N#define SYSCTL_NMI_EXTERNAL     0x00000001
N
N//*****************************************************************************
N//
N// The defines for the SysCtlClockOutConfig() API.
N//
N//*****************************************************************************
N#define SYSCTL_CLKOUT_EN        0x80000000
N#define SYSCTL_CLKOUT_DIS       0x00000000
N#define SYSCTL_CLKOUT_SYSCLK    0x00000000
N#define SYSCTL_CLKOUT_PIOSC     0x00010000
N#define SYSCTL_CLKOUT_MOSC      0x00020000
N
N//*****************************************************************************
N//
N// The following defines are used with the SysCtlAltClkConfig() function.
N//
N//*****************************************************************************
N#define SYSCTL_ALTCLK_PIOSC     0x00000000
N#define SYSCTL_ALTCLK_RTCOSC    0x00000003
N#define SYSCTL_ALTCLK_LFIOSC    0x00000004
N
N//*****************************************************************************
N//
N// Prototypes for the APIs.
N//
N//*****************************************************************************
Nextern uint32_t SysCtlSRAMSizeGet(void);
Nextern uint32_t SysCtlFlashSizeGet(void);
Nextern uint32_t SysCtlFlashSectorSizeGet(void);
Nextern bool SysCtlPeripheralPresent(uint32_t ui32Peripheral);
Xextern _Bool SysCtlPeripheralPresent(uint32_t ui32Peripheral);
Nextern bool SysCtlPeripheralReady(uint32_t ui32Peripheral);
Xextern _Bool SysCtlPeripheralReady(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralPowerOn(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralPowerOff(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralReset(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralEnable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralDisable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralSleepEnable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralSleepDisable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralDeepSleepEnable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralDeepSleepDisable(uint32_t ui32Peripheral);
Nextern void SysCtlPeripheralClockGating(bool bEnable);
Xextern void SysCtlPeripheralClockGating(_Bool bEnable);
Nextern void SysCtlIntRegister(void (*pfnHandler)(void));
Nextern void SysCtlIntUnregister(void);
Nextern void SysCtlIntEnable(uint32_t ui32Ints);
Nextern void SysCtlIntDisable(uint32_t ui32Ints);
Nextern void SysCtlIntClear(uint32_t ui32Ints);
Nextern uint32_t SysCtlIntStatus(bool bMasked);
Xextern uint32_t SysCtlIntStatus(_Bool bMasked);
Nextern void SysCtlLDOSleepSet(uint32_t ui32Voltage);
Nextern uint32_t SysCtlLDOSleepGet(void);
Nextern void SysCtlLDODeepSleepSet(uint32_t ui32Voltage);
Nextern uint32_t SysCtlLDODeepSleepGet(void);
Nextern void SysCtlSleepPowerSet(uint32_t ui32Config);
Nextern void SysCtlDeepSleepPowerSet(uint32_t ui32Config);
Nextern void SysCtlReset(void);
Nextern void SysCtlSleep(void);
Nextern void SysCtlDeepSleep(void);
Nextern uint32_t SysCtlResetCauseGet(void);
Nextern void SysCtlResetCauseClear(uint32_t ui32Causes);
Nextern void SysCtlBrownOutConfigSet(uint32_t ui32Config,
N                                    uint32_t ui32Delay);
Nextern void SysCtlDelay(uint32_t ui32Count);
Nextern void SysCtlMOSCConfigSet(uint32_t ui32Config);
Nextern uint32_t SysCtlPIOSCCalibrate(uint32_t ui32Type);
Nextern void SysCtlClockSet(uint32_t ui32Config);
Nextern uint32_t SysCtlClockGet(void);
Nextern void SysCtlDeepSleepClockSet(uint32_t ui32Config);
Nextern void SysCtlDeepSleepClockConfigSet(uint32_t ui32Div,
N                                          uint32_t ui32Config);
Nextern void SysCtlPWMClockSet(uint32_t ui32Config);
Nextern uint32_t SysCtlPWMClockGet(void);
Nextern void SysCtlIOSCVerificationSet(bool bEnable);
Xextern void SysCtlIOSCVerificationSet(_Bool bEnable);
Nextern void SysCtlMOSCVerificationSet(bool bEnable);
Xextern void SysCtlMOSCVerificationSet(_Bool bEnable);
Nextern void SysCtlPLLVerificationSet(bool bEnable);
Xextern void SysCtlPLLVerificationSet(_Bool bEnable);
Nextern void SysCtlClkVerificationClear(void);
Nextern void SysCtlGPIOAHBEnable(uint32_t ui32GPIOPeripheral);
Nextern void SysCtlGPIOAHBDisable(uint32_t ui32GPIOPeripheral);
Nextern void SysCtlUSBPLLEnable(void);
Nextern void SysCtlUSBPLLDisable(void);
Nextern uint32_t SysCtlClockFreqSet(uint32_t ui32Config,
N                                   uint32_t ui32SysClock);
Nextern void SysCtlResetBehaviorSet(uint32_t ui32Behavior);
Nextern uint32_t SysCtlResetBehaviorGet(void);
Nextern void SysCtlClockOutConfig(uint32_t ui32Config, uint32_t ui32Div);
Nextern void SysCtlAltClkConfig(uint32_t ui32Config);
Nextern uint32_t SysCtlNMIStatus(void);
Nextern void SysCtlNMIClear(uint32_t ui32Status);
Nextern void SysCtlVoltageEventConfig(uint32_t ui32Config);
Nextern uint32_t SysCtlVoltageEventStatus(void);
Nextern void SysCtlVoltageEventClear(uint32_t ui32Status);
Nextern bool SysCtlVCOGet(uint32_t ui32Crystal, uint32_t *pui32VCOFrequency);
Xextern _Bool SysCtlVCOGet(uint32_t ui32Crystal, uint32_t *pui32VCOFrequency);
N
N//*****************************************************************************
N//
N// Mark the end of the C bindings section for C++ compilers.
N//
N//*****************************************************************************
N#ifdef __cplusplus
S}
N#endif
N
N#endif // __DRIVERLIB_SYSCTL_H__
L 9 "../bmp280.c" 2
N
N
N#define  I2CADDR            0x76
N
N
N
N#define      BME280_REGISTER_DIG_T1            0x88
N#define      BME280_REGISTER_DIG_T2            0x8A
N#define      BME280_REGISTER_DIG_T3            0x8C
N
N#define      BME280_REGISTER_DIG_P1            0x8E
N#define      BME280_REGISTER_DIG_P2            0x90
N#define      BME280_REGISTER_DIG_P3            0x92
N#define      BME280_REGISTER_DIG_P4            0x94
N#define      BME280_REGISTER_DIG_P5            0x96
N#define      BME280_REGISTER_DIG_P6            0x98
N#define      BME280_REGISTER_DIG_P7            0x9A
N#define      BME280_REGISTER_DIG_P8            0x9C
N#define      BME280_REGISTER_DIG_P9            0x9E
N
N#define      BME280_REGISTER_DIG_H1            0xA1
N#define      BME280_REGISTER_DIG_H2            0xE1
N#define      BME280_REGISTER_DIG_H3            0xE3
N#define      BME280_REGISTER_DIG_H4            0xE4
N#define      BME280_REGISTER_DIG_H5            0xE5
N#define      BME280_REGISTER_DIG_H6            0xE7
N
N#define      BME280_REGISTER_CHIPID            0xD0
N#define      BME280_REGISTER_VERSION           0xD1
N#define      BME280_REGISTER_SOFTRESET         0xE0
N
N#define      BME280_REGISTER_CAL26             0xE1  // R calibration stored in 0xE1-0xF0
N
N#define      BME280_REGISTER_CONTROLHUMID      0xF2
N#define      BME280_REGISTER_CONTROL           0xF4
N#define      BME280_REGISTER_CONFIG            0xF5
N#define      BME280_REGISTER_PRESSUREDATA      0xF7
N#define      BME280_REGISTER_TEMPDATA          0xFA
N#define      BME280_REGISTER_HUMIDDATA         0xFD
N#define OVERSAMPLING_T1		  0x20
N#define OVERSAMPLING_T2		  0x40
N#define OVERSAMPLING_T4		  0x60
N#define OVERSAMPLING_T8		  0x80
N#define OVERSAMPLING_T16	  0xA0
N#define OVERSAMPLING_P1		  0x04
N#define OVERSAMPLING_P2		  0x08
N#define OVERSAMPLING_P4		  0x0C
N#define OVERSAMPLING_P8		  0x10
N#define OVERSAMPLING_P16	  0x14
N#define MODE_SLEEP			  0x00
N#define MODE_FORCED			  0x01
N#define MODE_NORMAL			  0x03
N#define TSB_0_5				  0x00
N#define TSB_62_5			  0x20
N#define TSB_125				  0x40
N#define TSB_250				  0x60
N#define TSB_500				  0x80
N#define TSB_1000			  0xA0
N#define TSB_2000			  0xC0
N#define TSB_4000			  0xE0
N#define FILTER_OFF			  0x00
N#define FILTER_COEFFICIENT2	  0x04
N#define FILTER_COEFFICIENT4	  0x08
N#define FILTER_COEFFICIENT8	  0x0C
N#define FILTER_COEFFICIENT16  0x10
N#define SPI_OFF	              0x00
N#define SPI_ON	              0x01
N
N    typedef struct
N    {
N      uint16_t dig_T1;
N      int16_t  dig_T2;
N      int16_t  dig_T3;
N
N      uint16_t dig_P1;
N      int16_t  dig_P2;
N      int16_t  dig_P3;
N      int16_t  dig_P4;
N      int16_t  dig_P5;
N      int16_t  dig_P6;
N      int16_t  dig_P7;
N      int16_t  dig_P8;
N      int16_t  dig_P9;
N
N      uint8_t  dig_H1;
N      int16_t  dig_H2;
N      uint8_t  dig_H3;
N      int16_t  dig_H4;
N      int16_t  dig_H5;
N      int8_t   dig_H6;
N    } bme280_calib_data;
N
N
Nbme280_calib_data cal_data;
Nint32_t t_fine;
N
Nvoid write8(uint8_t regAddr, uint8_t data);
Nuint8_t read8( uint8_t regAddr);
Nuint16_t readS16_LE( uint8_t regAddr);
Nuint16_t read16_LE( uint8_t regAddr);
Nint32_t read24(uint8_t regAddr);
N
Nbool bmp_initI2C(void)
X_Bool bmp_initI2C(void)
N{
N    SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C1); // Enable I2C1 peripheral
X    SysCtlPeripheralEnable(0xf0002001); 
N    SysCtlDelay(2); // Insert a few cycles after enabling the peripheral to allow the clock to be fully activated
N    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA); // Enable GPIOA peripheral
X    SysCtlPeripheralEnable(0xf0000800); 
N    SysCtlDelay(2); // Insert a few cycles after enabling the peripheral to allow the clock to be fully activated
N
N    // Use alternate function
N    GPIOPinConfigure(GPIO_PA6_I2C1SCL);
X    GPIOPinConfigure(0x00001803);
N    GPIOPinConfigure(GPIO_PA7_I2C1SDA);
X    GPIOPinConfigure(0x00001C03);
N
N    GPIOPinTypeI2CSCL(GPIO_PORTA_BASE, GPIO_PIN_6); // Use pin with I2C SCL peripheral
X    GPIOPinTypeI2CSCL(0x40004000, 0x00000040); 
N    GPIOPinTypeI2C(GPIO_PORTA_BASE, GPIO_PIN_7); // Use pin with I2C peripheral
X    GPIOPinTypeI2C(0x40004000, 0x00000080); 
N
N    I2CMasterInitExpClk(I2C1_BASE, SysCtlClockGet(), true); // Enable and set frequency to 400 kHz
X    I2CMasterInitExpClk(0x40021000, SysCtlClockGet(), 1); 
N
N    SysCtlDelay(2); // Insert a few cycles after enabling the I2C to allow the clock to be fully activated
N
N
N
N    volatile int id = read8(BME280_REGISTER_CHIPID) ;
X    volatile int id = read8(0xD0) ;
N//
N//
N//    volatile int a = (id == 0x60);
N//
N//    volatile id_const = 0x60;
N//
N//    volatile int a1 = (id == id_const);
N//
N//    volatile bool a2 = (id == id_const);
N
N      if (id != 0x60) return false;
X      if (id != 0x60) return 0;
N
N
N
N      return 0;//a2;
N
N
N
N
N}
N
N
Nvoid calibration(){
N        cal_data.dig_T1 = read16_LE(BME280_REGISTER_DIG_T1);
X        cal_data.dig_T1 = read16_LE(0x88);
N
N        cal_data.dig_T2 = readS16_LE(BME280_REGISTER_DIG_T2);
X        cal_data.dig_T2 = readS16_LE(0x8A);
N
N        cal_data.dig_T3 = readS16_LE(BME280_REGISTER_DIG_T3);
X        cal_data.dig_T3 = readS16_LE(0x8C);
N
N        cal_data.dig_P1 = read16_LE(BME280_REGISTER_DIG_P1);
X        cal_data.dig_P1 = read16_LE(0x8E);
N
N        cal_data.dig_P2 = readS16_LE(BME280_REGISTER_DIG_P2);
X        cal_data.dig_P2 = readS16_LE(0x90);
N
N        cal_data.dig_P3 = readS16_LE(BME280_REGISTER_DIG_P3);
X        cal_data.dig_P3 = readS16_LE(0x92);
N
N        cal_data.dig_P4 = readS16_LE(BME280_REGISTER_DIG_P4);
X        cal_data.dig_P4 = readS16_LE(0x94);
N
N        cal_data.dig_P5 = readS16_LE(BME280_REGISTER_DIG_P5);
X        cal_data.dig_P5 = readS16_LE(0x96);
N
N        cal_data.dig_P6 = readS16_LE(BME280_REGISTER_DIG_P6);
X        cal_data.dig_P6 = readS16_LE(0x98);
N
N        cal_data.dig_P7 = readS16_LE(BME280_REGISTER_DIG_P7);
X        cal_data.dig_P7 = readS16_LE(0x9A);
N
N        cal_data.dig_P8 = readS16_LE(BME280_REGISTER_DIG_P8);
X        cal_data.dig_P8 = readS16_LE(0x9C);
N
N        cal_data.dig_P9 = readS16_LE(BME280_REGISTER_DIG_P9);
X        cal_data.dig_P9 = readS16_LE(0x9E);
N
N        cal_data.dig_H1 = read8(BME280_REGISTER_DIG_H1);
X        cal_data.dig_H1 = read8(0xA1);
N
N        cal_data.dig_H2 = readS16_LE(BME280_REGISTER_DIG_H2);
X        cal_data.dig_H2 = readS16_LE(0xE1);
N
N        cal_data.dig_H3 = read8(BME280_REGISTER_DIG_H3);
X        cal_data.dig_H3 = read8(0xE3);
N
N        cal_data.dig_H4 = (read8(BME280_REGISTER_DIG_H4) << 4) | (read8(BME280_REGISTER_DIG_H4+1) & 0xF);
X        cal_data.dig_H4 = (read8(0xE4) << 4) | (read8(0xE4+1) & 0xF);
N
N        cal_data.dig_H5 = (read8(BME280_REGISTER_DIG_H5+1) << 4) | (read8(BME280_REGISTER_DIG_H5) >> 4);
X        cal_data.dig_H5 = (read8(0xE5+1) << 4) | (read8(0xE5) >> 4);
N
N        cal_data.dig_H6 = (int8_t)read8(BME280_REGISTER_DIG_H6);
X        cal_data.dig_H6 = (int8_t)read8(0xE7);
N
N}
N
N
Nfloat bmp_readTemperature(void)
N{
N    int32_t var1, var2;
N
N    int32_t adc_T = read24(BME280_REGISTER_TEMPDATA);
X    int32_t adc_T = read24(0xFA);
N
N    adc_T >>= 4;
N
N    var1  = ((((adc_T>>3) - ((int32_t)cal_data.dig_T1 <<1))) *
N
N             ((int32_t)cal_data.dig_T2)) >> 11;
N
N    var2  = (((((adc_T>>4) - ((int32_t)cal_data.dig_T1)) *
N
N               ((adc_T>>4) - ((int32_t)cal_data.dig_T1))) >> 12) *
N
N             ((int32_t)cal_data.dig_T3)) >> 14;
N
N    t_fine = var1 + var2;
N
N    volatile float temperature;
N    temperature  = (t_fine * 5 + 128) >> 8;
N
N    temperature = temperature / 100;
N    return temperature;
N}
N
Nfloat readPressure(void) {
N
N    int64_t var1, var2, p;
N    volatile float pressure;
N
N    int32_t adc_P = read24(BME280_REGISTER_PRESSUREDATA);
X    int32_t adc_P = read24(0xF7);
N    adc_P >>= 4;
N
N    var1 = ((int64_t)t_fine) - 128000;
N
N    var2 = var1 * var1 * (int64_t)cal_data.dig_P6;
N
N    var2 = var2 + ((var1*(int64_t)cal_data.dig_P5)<<17);
N
N    var2 = var2 + (((int64_t)cal_data.dig_P4)<<35);
N
N    var1 = ((var1 * var1 * (int64_t)cal_data.dig_P3)>>8) +
N
N    ((var1 * (int64_t)cal_data.dig_P2)<<12);
N
N    var1 = (((((int64_t)1)<<47)+var1))*((int64_t)cal_data.dig_P1)>>33;
N
N
N    if (var1 == 0) {
N
N        // return 0;  // avoid exception caused by division by zero
N        pressure = 0.0;
N    }
N
N    p = 1048576 - adc_P;
N
N    p = (((p<<31) - var2)*3125) / var1;
N
N    var1 = (((int64_t)cal_data.dig_P9) * (p>>13) * (p>>13)) >> 25;
N
N    var2 = (((int64_t)cal_data.dig_P8) * p) >> 19;
N
N
N    p = ((p + var1 + var2) >> 8) + (((int64_t)cal_data.dig_P7)<<4);
N
N    // return (float)p/256;
N
N    pressure = (float)p/256;
N
N    return pressure;
N}
N
N
Nfloat readHumidity(void) {
N
N    int32_t adc_H = read16_LE(BME280_REGISTER_HUMIDDATA);
X    int32_t adc_H = read16_LE(0xFD);
N
N    int32_t v_x1_u32r;
N
N    v_x1_u32r = (t_fine - ((int32_t)76800));
N
N    v_x1_u32r = (((((adc_H << 14) - (((int32_t)cal_data.dig_H4) << 20) -
N
N                    (((int32_t)cal_data.dig_H5) * v_x1_u32r)) + ((int32_t)16384)) >> 15) *
N
N                 (((((((v_x1_u32r * ((int32_t)cal_data.dig_H6)) >> 10) *
N
N                      (((v_x1_u32r * ((int32_t)cal_data.dig_H3)) >> 11) + ((int32_t)32768))) >> 10) +
N
N                    ((int32_t)2097152)) * ((int32_t)cal_data.dig_H2) + 8192) >> 14));
N
N
N    v_x1_u32r = (v_x1_u32r - (((((v_x1_u32r >> 15) * (v_x1_u32r >> 15)) >> 7) *
N
N                               ((int32_t)cal_data.dig_H1)) >> 4));
N
N
N    v_x1_u32r = (v_x1_u32r < 0) ? 0 : v_x1_u32r;
N
N    v_x1_u32r = (v_x1_u32r > 419430400) ? 419430400 : v_x1_u32r;
N
N    float h = (v_x1_u32r>>12);
N
N    // return  h / 1024.0;
N    volatile float humidity = (h <= 0 ? 50000 : h) / 1024.0;
N    return humidity;
N}
N
N
N
N
Nint32_t read24(uint8_t regAddr)
N{
N
N	uint8_t d[3];
N	bmp_i2cReadData(I2CADDR, regAddr, d,3);
X	bmp_i2cReadData(0x76, regAddr, d,3);
N	return ((uint32_t)d[2]) | (((uint32_t)d[1])<<8) | (((uint32_t)d[0])<<16);
N}
N
N
N
N
Nvoid write8(uint8_t regAddr, uint8_t data)
N{
N
N	bmp_i2cWriteData(I2CADDR, regAddr, &data, 1);
X	bmp_i2cWriteData(0x76, regAddr, &data, 1);
R "../bmp280.c" 321 37 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
N
Nuint8_t read8( uint8_t regAddr)
N{
N	return bmp_i2cRead(I2CADDR,  regAddr);
X	return bmp_i2cRead(0x76,  regAddr);
N}
N
Nuint16_t read16_LE( uint8_t regAddr)
N{
N	uint8_t d[2];
N	bmp_i2cReadData(I2CADDR, regAddr, d,2);
X	bmp_i2cReadData(0x76, regAddr, d,2);
N	return ((uint16_t)d[0]) | (((uint16_t)d[1]) << 8);
N}
N
N
Nuint16_t readS16_LE( uint8_t regAddr)
N{
N	return (int16_t)read16_LE(regAddr);
N}
N
N
N
N
Nvoid bmp_i2cWrite(uint8_t addr, uint8_t regAddr, uint8_t data)
N{
N    bmp_i2cWriteData(addr, regAddr, &data, 1);
R "../bmp280.c" 348 37 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
N}
N
Nvoid bmp_i2cWriteData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length)
N{
N	uint8_t i;
N
N    I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode
X    I2CMasterSlaveAddrSet(0x40021000, addr, 0); 
N
N    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
X    I2CMasterDataPut(0x40021000, regAddr); 
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_START); // Send start condition
X    I2CMasterControl(0x40021000, 0x00000003); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
N
N    for (i = 0; i < length - 1; i++)
N    {
N        I2CMasterDataPut(I2C1_BASE, data[i]); // Place data into data register
X        I2CMasterDataPut(0x40021000, data[i]); 
N        I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_CONT); // Send continues condition
X        I2CMasterControl(0x40021000, 0x00000001); 
N        while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X        while (I2CMasterBusy(0x40021000)); 
N    }
N
N    I2CMasterDataPut(I2C1_BASE, data[length - 1]); // Place data into data register
X    I2CMasterDataPut(0x40021000, data[length - 1]); 
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH); // Send finish condition
X    I2CMasterControl(0x40021000, 0x00000005); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
R "../bmp280.c" 359 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../bmp280.c" 365 9 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../bmp280.c" 361 34 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../bmp280.c" 370 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
N
Nuint8_t bmp_i2cRead(uint8_t addr, uint8_t regAddr) {
N    I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode
X    I2CMasterSlaveAddrSet(0x40021000, addr, 0); 
N
N    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
X    I2CMasterDataPut(0x40021000, regAddr); 
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_SEND); // Send data
X    I2CMasterControl(0x40021000, 0x00000007); 
N
N
N    uint32_t fuse=0;
N    while (I2CMasterBusy(I2C1_BASE))
X    while (I2CMasterBusy(0x40021000))
N    {
N    	fuse++;
N    	if (fuse>100000) return 0;
N    };
N
N    I2CMasterSlaveAddrSet(I2C1_BASE, addr, true); // Set to read mode
X    I2CMasterSlaveAddrSet(0x40021000, addr, 1); 
N
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE); // Tell master to read data
X    I2CMasterControl(0x40021000, 0x00000007); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
N    return I2CMasterDataGet(I2C1_BASE); // Read data
X    return I2CMasterDataGet(0x40021000); 
R "../bmp280.c" 390 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
N
Nvoid bmp_i2cReadData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length)
N{
N
N	uint8_t i;
N
N	I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode
X	I2CMasterSlaveAddrSet(0x40021000, addr, 0); 
N
N    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
X    I2CMasterDataPut(0x40021000, regAddr); 
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_SEND); // Send data
X    I2CMasterControl(0x40021000, 0x00000007); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
N
N    I2CMasterSlaveAddrSet(I2C1_BASE, addr, true); // Set to read mode
X    I2CMasterSlaveAddrSet(0x40021000, addr, 1); 
N
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_START); // Send start condition
X    I2CMasterControl(0x40021000, 0x0000000b); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
N    data[0] = I2CMasterDataGet(I2C1_BASE); // Place data into data register
X    data[0] = I2CMasterDataGet(0x40021000); 
N
N    for (i = 1; i < length - 1; i++)
N    {
N        I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_CONT); // Send continues condition
X        I2CMasterControl(0x40021000, 0x00000009); 
N        while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X        while (I2CMasterBusy(0x40021000)); 
N        data[i] = I2CMasterDataGet(I2C1_BASE); // Place data into data register
X        data[i] = I2CMasterDataGet(0x40021000); 
N    }
N
N    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_FINISH); // Send finish condition
X    I2CMasterControl(0x40021000, 0x00000005); 
N    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
X    while (I2CMasterBusy(0x40021000)); 
N    data[length - 1] = I2CMasterDataGet(I2C1_BASE); // Place data into data register
X    data[length - 1] = I2CMasterDataGet(0x40021000); 
R "../bmp280.c" 403 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../bmp280.c" 408 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../bmp280.c" 414 9 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
R "../bmp280.c" 411 34 (ULP 5.4) Detected an assignment to a type with size less than int. To avoid unnecessary sign extension, use int-sized types for local varaibles and convert to smaller types for static storage.
R "../bmp280.c" 419 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
