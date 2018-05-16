L 1 "../diskio.c"
N/*-----------------------------------------------------------------------*/
N/* Low level disk I/O module skeleton for FatFs     (C)ChaN, 2014        */
N/*                                                                       */
N/*   Portions COPYRIGHT 2017 STMicroelectronics                          */
N/*   Portions Copyright (C) 2014, ChaN, all right reserved               */
N/*-----------------------------------------------------------------------*/
N/* If a working storage control module is available, it should be        */
N/* attached to the FatFs via a glue function rather than modifying it.   */
N/* This is an example of glue functions to attach various exsisting      */
N/* storage control modules to the FatFs module with a defined API.       */
N/*-----------------------------------------------------------------------*/
N
N/**
N  ******************************************************************************
N  * @file    diskio.c
N  * @author  MCD Application Team
N  * @version V1.4.1
N  * @date    14-February-2017
N  * @brief   FatFs low level disk I/O module.
N  ******************************************************************************
N  * @attention
N  *
N  *
N  * Redistribution and use in source and binary forms, with or without
N  * modification, are permitted, provided that the following conditions are met:
N  *
N  * 1. Redistribution of source code must retain the above copyright notice,
N  *    this list of conditions and the following disclaimer.
N  * 2. Redistributions in binary form must reproduce the above copyright notice,
N  *    this list of conditions and the following disclaimer in the documentation
N  *    and/or other materials provided with the distribution.
N  * 3. Neither the name of STMicroelectronics nor the names of other
N  *    contributors to this software may be used to endorse or promote products
N  *    derived from this software without specific written permission.
N  * 4. This software, including modifications and/or derivative works of this
N  *    software, must execute solely and exclusively on microcontroller or
N  *    microprocessor devices manufactured by or for STMicroelectronics.
N  * 5. Redistribution and use of this software other than as permitted under
N  *    this license is void and will automatically terminate your rights under
N  *    this license.
N  *
N  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS"
N  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT
N  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
N  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
N  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT
N  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
N  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
N  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
N  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
N  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
N  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N  *
N  ******************************************************************************
N  */
N
N/* Includes ------------------------------------------------------------------*/
N#include "diskio.h"
L 1 "..\diskio.h" 1
N/*-----------------------------------------------------------------------
N/  Low level disk interface modlue include file   (C)ChaN, 2013
N/-----------------------------------------------------------------------*/
N
N#ifndef _DISKIO_DEFINED
N#define _DISKIO_DEFINED
N
N#ifdef __cplusplus
Sextern "C" {
N#endif
N
N#define _USE_WRITE  1   /* 1: Enable disk_write function */
N#define _USE_IOCTL  1   /* 1: Enable disk_ioctl fucntion */
N
N#include "integer.h"
L 1 "..\integer.h" 1
N/*-------------------------------------------*/
N/* Integer type definitions for FatFs module */
N/*-------------------------------------------*/
N
N#ifndef _INTEGER
N#define _INTEGER
N
N#ifdef _WIN32   /* FatFs development platform */
S
S#include <windows.h>
S#include <tchar.h>
S
N#else           /* Embedded platform */
N
N/* These types must be 16-bit, 32-bit or larger integer */
Ntypedef int             INT;
Ntypedef unsigned int    UINT;
N
N/* These types must be 8-bit integer */
Ntypedef char            CHAR;
Ntypedef unsigned char   UCHAR;
Ntypedef unsigned char   BYTE;
N
N/* These types must be 16-bit integer */
Ntypedef short           SHORT;
Ntypedef unsigned short  USHORT;
Ntypedef unsigned short  WORD;
Ntypedef unsigned short  WCHAR;
N
N/* These types must be 32-bit integer */
Ntypedef long            LONG;
Ntypedef unsigned long   ULONG;
Ntypedef unsigned long   DWORD;
N
N/* Boolean type */
N//typedef enum { FALSE = 0, TRUE } BOOL;
N
N#endif
N
N#endif
L 16 "..\diskio.h" 2
N
N
N/* Status of Disk Functions */
Ntypedef BYTE    DSTATUS;
N
N/* Results of Disk Functions */
Ntypedef enum {
N    RES_OK = 0,     /* 0: Successful */
N    RES_ERROR,      /* 1: R/W Error */
N    RES_WRPRT,      /* 2: Write Protected */
N    RES_NOTRDY,     /* 3: Not Ready */
N    RES_PARERR      /* 4: Invalid Parameter */
N} DRESULT;
N
N
N/*---------------------------------------*/
N/* Prototypes for disk control functions */
N
N
N//DSTATUS disk_initialize (BYTE pdrv);
N//DSTATUS disk_status (BYTE pdrv);
N//DRESULT disk_read (
N//    BYTE pdrv,      /* Physical drive nmuber to identify the drive */
N//    BYTE *buff,     /* Data buffer to store read data */
N//    DWORD sector,           /* Sector address in LBA */
N//    UINT count      /* Number of sectors to read */
N//);
N//DRESULT disk_write (
N//    BYTE pdrv,      /* Physical drive nmuber to identify the drive */
N//    const BYTE *buff,   /* Data to be written */
N//    DWORD sector,       /* Sector address in LBA */
N//    UINT count          /* Number of sectors to write */
N//);
N//DRESULT disk_ioctl (BYTE pdrv, BYTE cmd, void* buff);
N//void    disk_timerproc (void);
N
N/* Disk Status Bits (DSTATUS) */
N#define STA_NOINIT      0x01    /* Drive not initialized */
N#define STA_NODISK      0x02    /* No medium in the drive */
N#define STA_PROTECT     0x04    /* Write protected */
N
N
N/* Command code for disk_ioctrl fucntion */
N
N/* Generic command (used by FatFs) */
N#define CTRL_SYNC           0   /* Flush disk cache (for write functions) */
N#define GET_SECTOR_COUNT    1   /* Get media size (for only f_mkfs()) */
N#define GET_SECTOR_SIZE     2   /* Get sector size (for multiple sector size (_MAX_SS >= 1024)) */
N#define GET_BLOCK_SIZE      3   /* Get erase block size (for only f_mkfs()) */
N#define CTRL_ERASE_SECTOR   4   /* Force erased a block of sectors (for only _USE_ERASE) */
N
N/* Generic command (not used by FatFs) */
N#define CTRL_POWER          5   /* Get/Set power status */
N#define CTRL_LOCK           6   /* Lock/Unlock media removal */
N#define CTRL_EJECT          7   /* Eject media */
N#define CTRL_FORMAT         8   /* Create physical format on the media */
N
N/* MMC/SDC specific ioctl command */
N#define MMC_GET_TYPE        10  /* Get card type */
N#define MMC_GET_CSD         11  /* Get CSD */
N#define MMC_GET_CID         12  /* Get CID */
N#define MMC_GET_OCR         13  /* Get OCR */
N#define MMC_GET_SDSTAT      14  /* Get SD status */
N
N/* ATA/CF specific ioctl command */
N#define ATA_GET_REV         20  /* Get F/W revision */
N#define ATA_GET_MODEL       21  /* Get model name */
N#define ATA_GET_SN          22  /* Get serial number */
N
N
N/* MMC card type flags (MMC_GET_TYPE) */
N#define CT_MMC      0x01        /* MMC ver 3 */
N#define CT_SD1      0x02        /* SD ver 1 */
N#define CT_SD2      0x04        /* SD ver 2 */
N#define CT_SDC      (CT_SD1|CT_SD2) /* SD */
N#define CT_BLOCK    0x08        /* Block addressing */
N
N
N#ifdef __cplusplus
S}
N#endif
N
N#endif
L 60 "../diskio.c" 2
N#include "ff_gen_drv.h"
L 1 "..\ff_gen_drv.h" 1
N/**
N  ******************************************************************************
N  * @file    ff_gen_drv.h
N  * @author  MCD Application Team
N  * @version V1.4.1
N  * @date    14-February-2017
N  * @brief   Header for ff_gen_drv.c module.
N  ******************************************************************************
N  * @attention
N  *
N  * <h2><center>&copy; COPYRIGHT 2017 STMicroelectronics</center></h2>
N  *
N  * Redistribution and use in source and binary forms, with or without
N  * modification, are permitted, provided that the following conditions are met:
N  *
N  * 1. Redistribution of source code must retain the above copyright notice,
N  *    this list of conditions and the following disclaimer.
N  * 2. Redistributions in binary form must reproduce the above copyright notice,
N  *    this list of conditions and the following disclaimer in the documentation
N  *    and/or other materials provided with the distribution.
N  * 3. Neither the name of STMicroelectronics nor the names of other
N  *    contributors to this software may be used to endorse or promote products
N  *    derived from this software without specific written permission.
N  * 4. This software, including modifications and/or derivative works of this
N  *    software, must execute solely and exclusively on microcontroller or
N  *    microprocessor devices manufactured by or for STMicroelectronics.
N  * 5. Redistribution and use of this software other than as permitted under
N  *    this license is void and will automatically terminate your rights under
N  *    this license.
N  *
N  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS"
N  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT
N  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
N  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
N  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT
N  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
N  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
N  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
N  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
N  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
N  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
N  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
N  *
N  ******************************************************************************
N  */
N
N/* Define to prevent recursive inclusion -------------------------------------*/
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
L 49 "..\ff_gen_drv.h" 2
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
L 50 "..\ff_gen_drv.h" 2
N#include "inc/hw_types.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/inc/hw_types.h" 1
N//*****************************************************************************
N//
N// hw_types.h - Common types and macros.
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
N#ifndef __HW_TYPES_H__
N#define __HW_TYPES_H__
N
N//*****************************************************************************
N//
N// Macros for hardware access, both direct and via the bit-band region.
N//
N//*****************************************************************************
N#define HWREG(x)                                                              \
N        (*((volatile uint32_t *)(x)))
X#define HWREG(x)                                                                      (*((volatile uint32_t *)(x)))
N#define HWREGH(x)                                                             \
N        (*((volatile uint16_t *)(x)))
X#define HWREGH(x)                                                                     (*((volatile uint16_t *)(x)))
N#define HWREGB(x)                                                             \
N        (*((volatile uint8_t *)(x)))
X#define HWREGB(x)                                                                     (*((volatile uint8_t *)(x)))
N#define HWREGBITW(x, b)                                                       \
N        HWREG(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                     \
N              (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
X#define HWREGBITW(x, b)                                                               HWREG(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                                   (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
N#define HWREGBITH(x, b)                                                       \
N        HWREGH(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                    \
N               (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
X#define HWREGBITH(x, b)                                                               HWREGH(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                                   (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
N#define HWREGBITB(x, b)                                                       \
N        HWREGB(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                    \
N               (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
X#define HWREGBITB(x, b)                                                               HWREGB(((uint32_t)(x) & 0xF0000000) | 0x02000000 |                                   (((uint32_t)(x) & 0x000FFFFF) << 5) | ((b) << 2))
N
N//*****************************************************************************
N//
N// Helper Macros for determining silicon revisions, etc.
N//
N// These macros will be used by Driverlib at "run-time" to create necessary
N// conditional code blocks that will allow a single version of the Driverlib
N// "binary" code to support multiple(all) Tiva silicon revisions.
N//
N// It is expected that these macros will be used inside of a standard 'C'
N// conditional block of code, e.g.
N//
N//     if(CLASS_IS_TM4C123)
N//     {
N//         do some TM4C123-class specific code here.
N//     }
N//
N// By default, these macros will be defined as run-time checks of the
N// appropriate register(s) to allow creation of run-time conditional code
N// blocks for a common DriverLib across the entire Tiva family.
N//
N// However, if code-space optimization is required, these macros can be "hard-
N// coded" for a specific version of Tiva silicon.  Many compilers will then
N// detect the "hard-coded" conditionals, and appropriately optimize the code
N// blocks, eliminating any "unreachable" code.  This would result in a smaller
N// Driverlib, thus producing a smaller final application size, but at the cost
N// of limiting the Driverlib binary to a specific Tiva silicon revision.
N//
N//*****************************************************************************
N#ifndef CLASS_IS_TM4C123
N#define CLASS_IS_TM4C123                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_VER_M | SYSCTL_DID0_CLASS_M)) == \
N         (SYSCTL_DID0_VER_1 | SYSCTL_DID0_CLASS_TM4C123))
X#define CLASS_IS_TM4C123                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_VER_M | SYSCTL_DID0_CLASS_M)) ==          (SYSCTL_DID0_VER_1 | SYSCTL_DID0_CLASS_TM4C123))
N#endif
N
N#ifndef CLASS_IS_TM4C129
N#define CLASS_IS_TM4C129                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_VER_M | SYSCTL_DID0_CLASS_M)) == \
N         (SYSCTL_DID0_VER_1 | SYSCTL_DID0_CLASS_TM4C129))
X#define CLASS_IS_TM4C129                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_VER_M | SYSCTL_DID0_CLASS_M)) ==          (SYSCTL_DID0_VER_1 | SYSCTL_DID0_CLASS_TM4C129))
N#endif
N
N#ifndef REVISION_IS_A0
N#define REVISION_IS_A0                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) == \
N         (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_0))
X#define REVISION_IS_A0                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) ==          (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_0))
N#endif
N
N#ifndef REVISION_IS_A1
N#define REVISION_IS_A1                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) == \
N         (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_0))
X#define REVISION_IS_A1                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) ==          (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_0))
N#endif
N
N#ifndef REVISION_IS_A2
N#define REVISION_IS_A2                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) == \
N         (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_2))
X#define REVISION_IS_A2                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) ==          (SYSCTL_DID0_MAJ_REVA | SYSCTL_DID0_MIN_2))
N#endif
N
N#ifndef REVISION_IS_B0
N#define REVISION_IS_B0                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) == \
N         (SYSCTL_DID0_MAJ_REVB | SYSCTL_DID0_MIN_0))
X#define REVISION_IS_B0                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) ==          (SYSCTL_DID0_MAJ_REVB | SYSCTL_DID0_MIN_0))
N#endif
N
N#ifndef REVISION_IS_B1
N#define REVISION_IS_B1                                                     \
N        ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) == \
N         (SYSCTL_DID0_MAJ_REVB | SYSCTL_DID0_MIN_1))
X#define REVISION_IS_B1                                                             ((HWREG(SYSCTL_DID0) & (SYSCTL_DID0_MAJ_M | SYSCTL_DID0_MIN_M)) ==          (SYSCTL_DID0_MAJ_REVB | SYSCTL_DID0_MIN_1))
N#endif
N
N//*****************************************************************************
N//
N// For TivaWare 2.1, we removed all references to Tiva IC codenames from the
N// source.  To ensure that existing customer code doesn't break as a result
N// of this change, make sure that the old definitions are still available at
N// least for the time being.
N//
N//*****************************************************************************
N#ifndef DEPRECATED
N#define CLASS_IS_BLIZZARD CLASS_IS_TM4C123
N#define CLASS_IS_SNOWFLAKE CLASS_IS_TM4C123
N#endif
N
N#endif // __HW_TYPES_H__
L 51 "..\ff_gen_drv.h" 2
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
L 52 "..\ff_gen_drv.h" 2
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
L 53 "..\ff_gen_drv.h" 2
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
L 54 "..\ff_gen_drv.h" 2
N
N
N#ifndef __FF_GEN_DRV_H
N#define __FF_GEN_DRV_H
N
N#ifdef __cplusplus
S extern "C" {
N#endif
N
N/* Includes ------------------------------------------------------------------*/
N#include "diskio.h"
N#include "ff.h"
L 1 "..\ff.h" 1
N/*---------------------------------------------------------------------------/
N/  FatFs - FAT file system module include file  R0.09b    (C)ChaN, 2013
N/----------------------------------------------------------------------------/
N/ FatFs module is a generic FAT file system module for small embedded systems.
N/ This is a free software that opened for education, research and commercial
N/ developments under license policy of following terms.
N/
N/  Copyright (C) 2013, ChaN, all right reserved.
N/
N/ * The FatFs module is a free software and there is NO WARRANTY.
N/ * No restriction on use. You can use, modify and redistribute it for
N/   personal, non-profit or commercial product UNDER YOUR RESPONSIBILITY.
N/ * Redistributions of source code must retain the above copyright notice.
N/
N/----------------------------------------------------------------------------*/
N
N#ifndef _FATFS
N#define _FATFS  82786   /* Revision ID */
N
N#ifdef __cplusplus
Sextern "C" {
N#endif
N
N#include "integer.h"    /* Basic integer types */
N#include "ffconf.h"     /* FatFs configuration options */
L 1 "..\ffconf.h" 1
N/*---------------------------------------------------------------------------/
N/  FatFs - FAT file system module configuration file  R0.09b (C)ChaN, 2013
N/----------------------------------------------------------------------------/
N/
N/ CAUTION! Do not forget to make clean the project after any changes to
N/ the configuration options.
N/
N/----------------------------------------------------------------------------*/
N#ifndef _FFCONF
N#define _FFCONF 82786   /* Revision ID */
N
N
N/*---------------------------------------------------------------------------/
N/ Functions and Buffer Configurations
N/----------------------------------------------------------------------------*/
N
N#define _FS_TINY        0   /* 0:Normal or 1:Tiny */
N/* When _FS_TINY is set to 1, FatFs uses the sector buffer in the file system
N/  object instead of the sector buffer in the individual file object for file
N/  data transfer. This reduces memory consumption 512 bytes each file object. */
N
N
N#define _FS_READONLY    0   /* 0:Read/Write or 1:Read only */
N/* Setting _FS_READONLY to 1 defines read only configuration. This removes
N/  writing functions, f_write, f_sync, f_unlink, f_mkdir, f_chmod, f_rename,
N/  f_truncate and useless f_getfree. */
N
N
N#define _FS_MINIMIZE    0   /* 0 to 3 */
N/* The _FS_MINIMIZE option defines minimization level to remove some functions.
N/
N/   0: Full function.
N/   1: f_stat, f_getfree, f_unlink, f_mkdir, f_chmod, f_truncate and f_rename
N/      are removed.
N/   2: f_opendir and f_readdir are removed in addition to 1.
N/   3: f_lseek is removed in addition to 2. */
N
N
N#define _USE_STRFUNC    0   /* 0:Disable or 1-2:Enable */
N/* To enable string functions, set _USE_STRFUNC to 1 or 2. */
N
N
N#define _USE_MKFS       0   /* 0:Disable or 1:Enable */
N/* To enable f_mkfs function, set _USE_MKFS to 1 and set _FS_READONLY to 0 */
N
N
N#define _USE_FASTSEEK   0   /* 0:Disable or 1:Enable */
N/* To enable fast seek feature, set _USE_FASTSEEK to 1. */
N
N
N#define _USE_LABEL      0   /* 0:Disable or 1:Enable */
N/* To enable volume label functions, set _USE_LAVEL to 1 */
N
N
N#define _USE_FORWARD    0   /* 0:Disable or 1:Enable */
N/* To enable f_forward function, set _USE_FORWARD to 1 and set _FS_TINY to 1. */
N
N
N/*---------------------------------------------------------------------------/
N/ Locale and Namespace Configurations
N/----------------------------------------------------------------------------*/
N
N#define _CODE_PAGE  932
N/* The _CODE_PAGE specifies the OEM code page to be used on the target system.
N/  Incorrect setting of the code page can cause a file open failure.
N/
N/   932  - Japanese Shift-JIS (DBCS, OEM, Windows)
N/   936  - Simplified Chinese GBK (DBCS, OEM, Windows)
N/   949  - Korean (DBCS, OEM, Windows)
N/   950  - Traditional Chinese Big5 (DBCS, OEM, Windows)
N/   1250 - Central Europe (Windows)
N/   1251 - Cyrillic (Windows)
N/   1252 - Latin 1 (Windows)
N/   1253 - Greek (Windows)
N/   1254 - Turkish (Windows)
N/   1255 - Hebrew (Windows)
N/   1256 - Arabic (Windows)
N/   1257 - Baltic (Windows)
N/   1258 - Vietnam (OEM, Windows)
N/   437  - U.S. (OEM)
N/   720  - Arabic (OEM)
N/   737  - Greek (OEM)
N/   775  - Baltic (OEM)
N/   850  - Multilingual Latin 1 (OEM)
N/   858  - Multilingual Latin 1 + Euro (OEM)
N/   852  - Latin 2 (OEM)
N/   855  - Cyrillic (OEM)
N/   866  - Russian (OEM)
N/   857  - Turkish (OEM)
N/   862  - Hebrew (OEM)
N/   874  - Thai (OEM, Windows)
N/   1    - ASCII only (Valid for non LFN cfg.)
N*/
N
N#ifdef ENABLE_LFN
S#define _USE_LFN    1       /* 0 to 3 */
N#else
N#define _USE_LFN    0       /* 0 to 3 */
N#endif
N#define _MAX_LFN    255     /* Maximum LFN length to handle (12 to 255) */
N/* The _USE_LFN option switches the LFN support.
N/
N/   0: Disable LFN feature. _MAX_LFN and _LFN_UNICODE have no effect.
N/   1: Enable LFN with static working buffer on the BSS. Always NOT reentrant.
N/   2: Enable LFN with dynamic working buffer on the STACK.
N/   3: Enable LFN with dynamic working buffer on the HEAP.
N/
N/  The LFN working buffer occupies (_MAX_LFN + 1) * 2 bytes. To enable LFN,
N/  Unicode handling functions ff_convert() and ff_wtoupper() must be added
N/  to the project. When enable to use heap, memory control functions
N/  ff_memalloc() and ff_memfree() must be added to the project. */
N
N
N#define _LFN_UNICODE    0   /* 0:ANSI/OEM or 1:Unicode */
N/* To switch the character code set on FatFs API to Unicode,
N/  enable LFN feature and set _LFN_UNICODE to 1. */
N
N
N#define _FS_RPATH       0   /* 0 to 2 */
N/* The _FS_RPATH option configures relative path feature.
N/
N/   0: Disable relative path feature and remove related functions.
N/   1: Enable relative path. f_chdrive() and f_chdir() are available.
N/   2: f_getcwd() is available in addition to 1.
N/
N/  Note that output of the f_readdir fnction is affected by this option. */
N
N
N/*---------------------------------------------------------------------------/
N/ Physical Drive Configurations
N/----------------------------------------------------------------------------*/
N
N#define _VOLUMES    1
N/* Number of volumes (logical drives) to be used. */
N
N
N#define _MAX_SS     512     /* 512, 1024, 2048 or 4096 */
N/* Maximum sector size to be handled.
N/  Always set 512 for memory card and hard disk but a larger value may be
N/  required for on-board flash memory, floppy disk and optical disk.
N/  When _MAX_SS is larger than 512, it configures FatFs to variable sector size
N/  and GET_SECTOR_SIZE command must be implememted to the disk_ioctl function. */
N
N
N#define _MULTI_PARTITION    0   /* 0:Single partition, 1:Enable multiple partition */
N/* When set to 0, each volume is bound to the same physical drive number and
N/ it can mount only first primaly partition. When it is set to 1, each volume
N/ is tied to the partitions listed in VolToPart[]. */
N
N
N#define _USE_ERASE  0   /* 0:Disable or 1:Enable */
N/* To enable sector erase feature, set _USE_ERASE to 1. CTRL_ERASE_SECTOR command
N/  should be added to the disk_ioctl functio. */
N
N
N
N/*---------------------------------------------------------------------------/
N/ System Configurations
N/----------------------------------------------------------------------------*/
N
N#define _WORD_ACCESS    0   /* 0 or 1 */
N/* Set 0 first and it is always compatible with all platforms. The _WORD_ACCESS
N/  option defines which access method is used to the word data on the FAT volume.
N/
N/   0: Byte-by-byte access.
N/   1: Word access. Do not choose this unless following condition is met.
N/
N/  When the byte order on the memory is big-endian or address miss-aligned word
N/  access results incorrect behavior, the _WORD_ACCESS must be set to 0.
N/  If it is not the case, the value can also be set to 1 to improve the
N/  performance and code size.
N*/
N
N
N/* A header file that defines sync object types on the O/S, such as
N/  windows.h, ucos_ii.h and semphr.h, must be included prior to ff.h. */
N
N#define _FS_REENTRANT   0       /* 0:Disable or 1:Enable */
N#define _FS_TIMEOUT     1000    /* Timeout period in unit of time ticks */
N#define _SYNC_t         HANDLE  /* O/S dependent type of sync object. e.g. HANDLE, OS_EVENT*, ID and etc.. */
N
N/* The _FS_REENTRANT option switches the reentrancy (thread safe) of the FatFs module.
N/
N/   0: Disable reentrancy. _SYNC_t and _FS_TIMEOUT have no effect.
N/   1: Enable reentrancy. Also user provided synchronization handlers,
N/      ff_req_grant, ff_rel_grant, ff_del_syncobj and ff_cre_syncobj
N/      function must be added to the project. */
N
N
N#define _FS_LOCK    0   /* 0:Disable or >=1:Enable */
N/* To enable file lock control feature, set _FS_LOCK to 1 or greater.
N   The value defines how many files can be opened simultaneously. */
N
N
N#endif /* _FFCONFIG */
L 26 "..\ff.h" 2
N
N#if _FATFS != _FFCONF
X#if 82786 != 82786
S#error Wrong configuration file (ffconf.h).
N#endif
N
N
N
N/* Definitions of volume management */
N
N#if _MULTI_PARTITION        /* Multiple partition configuration */
X#if 0         
Stypedef struct {
S    BYTE pd;    /* Physical drive number */
S    BYTE pt;    /* Partition: 0:Auto detect, 1-4:Forced partition) */
S} PARTITION;
Sextern PARTITION VolToPart[];   /* Volume - Partition resolution table */
S#define LD2PD(vol) (VolToPart[vol].pd)  /* Get physical drive number */
S#define LD2PT(vol) (VolToPart[vol].pt)  /* Get partition index */
S
N#else                           /* Single partition configuration */
N#define LD2PD(vol) (BYTE)(vol)  /* Each logical drive is bound to the same physical drive number */
N#define LD2PT(vol) 0            /* Always mounts the 1st partition or in SFD */
N
N#endif
N
N
N
N/* Type of path name strings on FatFs API */
N
N#if _LFN_UNICODE            /* Unicode string */
X#if 0             
S#if !_USE_LFN
S#error _LFN_UNICODE must be 0 in non-LFN cfg.
S#endif
S#ifndef _INC_TCHAR
Stypedef WCHAR TCHAR;
S#define _T(x) L ## x
S#define _TEXT(x) L ## x
S#endif
S
N#else                       /* ANSI/OEM string */
N#ifndef _INC_TCHAR
Ntypedef char TCHAR;
N#define _T(x) x
N#define _TEXT(x) x
N#endif
N
N#endif
N
N
N
N/* File system object structure (FATFS) */
N
Ntypedef struct {
N    BYTE    fs_type;        /* FAT sub-type (0:Not mounted) */
N    BYTE    drv;            /* Physical drive number */
N    BYTE    csize;          /* Sectors per cluster (1,2,4...128) */
N    BYTE    n_fats;         /* Number of FAT copies (1,2) */
N    BYTE    wflag;          /* win[] dirty flag (1:must be written back) */
N    BYTE    fsi_flag;       /* fsinfo dirty flag (1:must be written back) */
N    WORD    id;             /* File system mount ID */
N    WORD    n_rootdir;      /* Number of root directory entries (FAT12/16) */
N#if _MAX_SS != 512
X#if 512 != 512
S    WORD    ssize;          /* Bytes per sector (512, 1024, 2048 or 4096) */
N#endif
N#if _FS_REENTRANT
X#if 0
S    _SYNC_t sobj;           /* Identifier of sync object */
N#endif
N#if !_FS_READONLY
X#if !0
N    DWORD   last_clust;     /* Last allocated cluster */
N    DWORD   free_clust;     /* Number of free clusters */
N    DWORD   fsi_sector;     /* fsinfo sector (FAT32) */
N#endif
N#if _FS_RPATH
X#if 0
S    DWORD   cdir;           /* Current directory start cluster (0:root) */
N#endif
N    DWORD   n_fatent;       /* Number of FAT entries (= number of clusters + 2) */
N    DWORD   fsize;          /* Sectors per FAT */
N    DWORD   volbase;        /* Volume start sector */
N    DWORD   fatbase;        /* FAT start sector */
N    DWORD   dirbase;        /* Root directory start sector (FAT32:Cluster#) */
N    DWORD   database;       /* Data start sector */
N    DWORD   winsect;        /* Current sector appearing in the win[] */
N    BYTE    win[_MAX_SS];   /* Disk access window for Directory, FAT (and Data on tiny cfg) */
X    BYTE    win[512];    
N} FATFS;
N
N
N
N/* File object structure (FIL) */
N
Ntypedef struct {
N    FATFS*  fs;             /* Pointer to the related file system object (**do not change order**) */
N    WORD    id;             /* Owner file system mount ID (**do not change order**) */
N    BYTE    flag;           /* File status flags */
N    BYTE    pad1;
N    DWORD   fptr;           /* File read/write pointer (0ed on file open) */
N    DWORD   fsize;          /* File size */
N    DWORD   sclust;         /* File data start cluster (0:no data cluster, always 0 when fsize is 0) */
N    DWORD   clust;          /* Current cluster of fpter */
N    DWORD   dsect;          /* Current data sector of fpter */
N#if !_FS_READONLY
X#if !0
N    DWORD   dir_sect;       /* Sector containing the directory entry */
N    BYTE*   dir_ptr;        /* Pointer to the directory entry in the window */
N#endif
N#if _USE_FASTSEEK
X#if 0
S    DWORD*  cltbl;          /* Pointer to the cluster link map table (null on file open) */
N#endif
N#if _FS_LOCK
X#if 0
S    UINT    lockid;         /* File lock ID (index of file semaphore table Files[]) */
N#endif
N#if !_FS_TINY
X#if !0
N    BYTE    buf[_MAX_SS];   /* File data read/write buffer */
X    BYTE    buf[512];    
N#endif
N} FIL;
N
N
N
N/* Directory object structure (DIR) */
N
Ntypedef struct {
N    FATFS*  fs;             /* Pointer to the owner file system object (**do not change order**) */
N    WORD    id;             /* Owner file system mount ID (**do not change order**) */
N    WORD    index;          /* Current read/write index number */
N    DWORD   sclust;         /* Table start cluster (0:Root dir) */
N    DWORD   clust;          /* Current cluster */
N    DWORD   sect;           /* Current sector */
N    BYTE*   dir;            /* Pointer to the current SFN entry in the win[] */
N    BYTE*   fn;             /* Pointer to the SFN (in/out) {file[8],ext[3],status[1]} */
N#if _USE_LFN
X#if 0
S    WCHAR*  lfn;            /* Pointer to the LFN working buffer */
S    WORD    lfn_idx;        /* Last matched LFN index number (0xFFFF:No LFN) */
N#endif
N} DIR;
N
N
N
N/* File status structure (FILINFO) */
N
Ntypedef struct {
N    DWORD   fsize;          /* File size */
N    WORD    fdate;          /* Last modified date */
N    WORD    ftime;          /* Last modified time */
N    BYTE    fattrib;        /* Attribute */
N    TCHAR   fname[13];      /* Short file name (8.3 format) */
N#if _USE_LFN
X#if 0
S    TCHAR*  lfname;         /* Pointer to the LFN buffer */
S    UINT    lfsize;         /* Size of LFN buffer in TCHAR */
N#endif
N} FILINFO;
N
N
N
N/* File function return code (FRESULT) */
N
Ntypedef enum {
N    FR_OK = 0,              /* (0) Succeeded */
N    FR_DISK_ERR,            /* (1) A hard error occurred in the low level disk I/O layer */
N    FR_INT_ERR,             /* (2) Assertion failed */
N    FR_NOT_READY,           /* (3) The physical drive cannot work */
N    FR_NO_FILE,             /* (4) Could not find the file */
N    FR_NO_PATH,             /* (5) Could not find the path */
N    FR_INVALID_NAME,        /* (6) The path name format is invalid */
N    FR_DENIED,              /* (7) Access denied due to prohibited access or directory full */
N    FR_EXIST,               /* (8) Access denied due to prohibited access */
N    FR_INVALID_OBJECT,      /* (9) The file/directory object is invalid */
N    FR_WRITE_PROTECTED,     /* (10) The physical drive is write protected */
N    FR_INVALID_DRIVE,       /* (11) The logical drive number is invalid */
N    FR_NOT_ENABLED,         /* (12) The volume has no work area */
N    FR_NO_FILESYSTEM,       /* (13) There is no valid FAT volume */
N    FR_MKFS_ABORTED,        /* (14) The f_mkfs() aborted due to any parameter error */
N    FR_TIMEOUT,             /* (15) Could not get a grant to access the volume within defined period */
N    FR_LOCKED,              /* (16) The operation is rejected according to the file sharing policy */
N    FR_NOT_ENOUGH_CORE,     /* (17) LFN working buffer could not be allocated */
N    FR_TOO_MANY_OPEN_FILES, /* (18) Number of open files > _FS_SHARE */
N    FR_INVALID_PARAMETER    /* (19) Given parameter is invalid */
N} FRESULT;
N
N
N
N/*--------------------------------------------------------------*/
N/* FatFs module application interface                           */
N
NFRESULT f_mount (BYTE vol, FATFS* fs);                              /* Mount/Unmount a logical drive */
NFRESULT f_open (FIL* fp, const TCHAR* path, BYTE mode);             /* Open or create a file */
NFRESULT f_read (FIL* fp, void* buff, UINT btr, UINT* br);           /* Read data from a file */
NFRESULT f_lseek (FIL* fp, DWORD ofs);                               /* Move file pointer of a file object */
NFRESULT f_close (FIL* fp);                                          /* Close an open file object */
NFRESULT f_opendir (DIR* dj, const TCHAR* path);                     /* Open an existing directory */
NFRESULT f_readdir (DIR* dj, FILINFO* fno);                          /* Read a directory item */
NFRESULT f_stat (const TCHAR* path, FILINFO* fno);                   /* Get file status */
NFRESULT f_write (FIL* fp, const void* buff, UINT btw, UINT* bw);    /* Write data to a file */
NFRESULT f_getfree (const TCHAR* path, DWORD* nclst, FATFS** fatfs); /* Get number of free clusters on the drive */
NFRESULT f_truncate (FIL* fp);                                       /* Truncate file */
NFRESULT f_sync (FIL* fp);                                           /* Flush cached data of a writing file */
NFRESULT f_unlink (const TCHAR* path);                               /* Delete an existing file or directory */
NFRESULT f_mkdir (const TCHAR* path);                                /* Create a new directory */
NFRESULT f_chmod (const TCHAR* path, BYTE value, BYTE mask);         /* Change attribute of the file/dir */
NFRESULT f_utime (const TCHAR* path, const FILINFO* fno);            /* Change times-tamp of the file/dir */
NFRESULT f_rename (const TCHAR* path_old, const TCHAR* path_new);    /* Rename/Move a file or directory */
NFRESULT f_chdrive (BYTE drv);                                       /* Change current drive */
NFRESULT f_chdir (const TCHAR* path);                                /* Change current directory */
NFRESULT f_getcwd (TCHAR* buff, UINT len);                           /* Get current directory */
NFRESULT f_getlabel (const TCHAR* path, TCHAR* label, DWORD* sn);    /* Get volume label */
NFRESULT f_setlabel (const TCHAR* label);                            /* Set volume label */
NFRESULT f_forward (FIL* fp, UINT(*func)(const BYTE*,UINT), UINT btf, UINT* bf); /* Forward data to the stream */
NFRESULT f_mkfs (BYTE vol, BYTE sfd, UINT au);                       /* Create a file system on the drive */
NFRESULT f_fdisk (BYTE pdrv, const DWORD szt[], void* work);         /* Divide a physical drive into some partitions */
Nint f_putc (TCHAR c, FIL* fp);                                      /* Put a character to the file */
Nint f_puts (const TCHAR* str, FIL* cp);                             /* Put a string to the file */
Nint f_printf (FIL* fp, const TCHAR* str, ...);                      /* Put a formatted string to the file */
NTCHAR* f_gets (TCHAR* buff, int len, FIL* fp);                      /* Get a string from the file */
N
N#define f_eof(fp) (((fp)->fptr == (fp)->fsize) ? 1 : 0)
N#define f_error(fp) (((fp)->flag & FA__ERROR) ? 1 : 0)
N#define f_tell(fp) ((fp)->fptr)
N#define f_size(fp) ((fp)->fsize)
N
N#ifndef EOF
N#define EOF (-1)
N#endif
N
N
N
N
N/*--------------------------------------------------------------*/
N/* Additional user defined functions                            */
N
N/* RTC function */
N#if !_FS_READONLY
X#if !0
NDWORD get_fattime (void);
N#endif
N
N/* Unicode support functions */
N#if _USE_LFN                            /* Unicode - OEM code conversion */
X#if 0                             
SWCHAR ff_convert (WCHAR chr, UINT dir); /* OEM-Unicode bidirectional conversion */
SWCHAR ff_wtoupper (WCHAR chr);          /* Unicode upper-case conversion */
S#if _USE_LFN == 3                       /* Memory functions */
Svoid* ff_memalloc (UINT msize);         /* Allocate memory block */
Svoid ff_memfree (void* mblock);         /* Free memory block */
S#endif
N#endif
N
N/* Sync functions */
N#if _FS_REENTRANT
X#if 0
Sint ff_cre_syncobj (BYTE vol, _SYNC_t* sobj);   /* Create a sync object */
Sint ff_req_grant (_SYNC_t sobj);                /* Lock sync object */
Svoid ff_rel_grant (_SYNC_t sobj);               /* Unlock sync object */
Sint ff_del_syncobj (_SYNC_t sobj);              /* Delete a sync object */
N#endif
N
N
N
N
N/*--------------------------------------------------------------*/
N/* Flags and offset address                                     */
N
N
N/* File access control and file status flags (FIL.flag) */
N
N#define FA_READ             0x01
N#define FA_OPEN_EXISTING    0x00
N#define FA__ERROR           0x80
N
N#if !_FS_READONLY
X#if !0
N#define FA_WRITE            0x02
N#define FA_CREATE_NEW       0x04
N#define FA_CREATE_ALWAYS    0x08
N#define FA_OPEN_ALWAYS      0x10
N#define FA__WRITTEN         0x20
N#define FA__DIRTY           0x40
N#endif
N
N
N/* FAT sub type (FATFS.fs_type) */
N
N#define FS_FAT12    1
N#define FS_FAT16    2
N#define FS_FAT32    3
N
N
N/* File attribute bits for directory entry */
N
N#define AM_RDO  0x01    /* Read only */
N#define AM_HID  0x02    /* Hidden */
N#define AM_SYS  0x04    /* System */
N#define AM_VOL  0x08    /* Volume label */
N#define AM_LFN  0x0F    /* LFN entry */
N#define AM_DIR  0x10    /* Directory */
N#define AM_ARC  0x20    /* Archive */
N#define AM_MASK 0x3F    /* Mask of defined bits */
N
N
N/* Fast seek feature */
N#define CREATE_LINKMAP  0xFFFFFFFF
N
N
N
N/*--------------------------------*/
N/* Multi-byte word access macros  */
N
N#if _WORD_ACCESS == 1   /* Enable word access to the FAT structure */
X#if 0 == 1    
S#define LD_WORD(ptr)        (WORD)(*(WORD*)(BYTE*)(ptr))
S#define LD_DWORD(ptr)       (DWORD)(*(DWORD*)(BYTE*)(ptr))
S#define ST_WORD(ptr,val)    *(WORD*)(BYTE*)(ptr)=(WORD)(val)
S#define ST_DWORD(ptr,val)   *(DWORD*)(BYTE*)(ptr)=(DWORD)(val)
N#else                   /* Use byte-by-byte access to the FAT structure */
N#define LD_WORD(ptr)        (WORD)(((WORD)*((BYTE*)(ptr)+1)<<8)|(WORD)*(BYTE*)(ptr))
N#define LD_DWORD(ptr)       (DWORD)(((DWORD)*((BYTE*)(ptr)+3)<<24)|((DWORD)*((BYTE*)(ptr)+2)<<16)|((WORD)*((BYTE*)(ptr)+1)<<8)|*(BYTE*)(ptr))
N#define ST_WORD(ptr,val)    *(BYTE*)(ptr)=(BYTE)(val); *((BYTE*)(ptr)+1)=(BYTE)((WORD)(val)>>8)
N#define ST_DWORD(ptr,val)   *(BYTE*)(ptr)=(BYTE)(val); *((BYTE*)(ptr)+1)=(BYTE)((WORD)(val)>>8); *((BYTE*)(ptr)+2)=(BYTE)((DWORD)(val)>>16); *((BYTE*)(ptr)+3)=(BYTE)((DWORD)(val)>>24)
N#endif
N
N#ifdef __cplusplus
S}
N#endif
N
N#endif /* _FATFS */
L 66 "..\ff_gen_drv.h" 2
N
N/* Exported types ------------------------------------------------------------*/
N
N/**
N  * @brief  Disk IO Driver structure definition
N  */
Ntypedef struct
N{
N  DSTATUS (*disk_initialize) (BYTE);                     /*!< Initialize Disk Drive                     */
N  DSTATUS (*disk_status)     (BYTE);                     /*!< Get Disk Status                           */
N  DRESULT (*disk_read)       (BYTE, BYTE*, DWORD, UINT);       /*!< Read Sector(s)                            */
N#if _USE_WRITE == 1
X#if 1 == 1
N  DRESULT (*disk_write)      (BYTE, const BYTE*, DWORD, UINT); /*!< Write Sector(s) when _USE_WRITE = 0       */
N#endif /* _USE_WRITE == 1 */
N#if _USE_IOCTL == 1
X#if 1 == 1
N  DRESULT (*disk_ioctl)      (BYTE, BYTE, void*);              /*!< I/O control operation when _USE_IOCTL = 1 */
N#endif /* _USE_IOCTL == 1 */
N
N}Diskio_drvTypeDef;
N
N/**
N  * @brief  Global Disk IO Drivers structure definition
N  */
Ntypedef struct
N{
N  uint8_t                 is_initialized[_VOLUMES];
X  uint8_t                 is_initialized[1];
N  Diskio_drvTypeDef       *drv[_VOLUMES];
X  Diskio_drvTypeDef       *drv[1];
N  uint8_t                 lun[_VOLUMES];
X  uint8_t                 lun[1];
N  uint8_t            nbr; //__IO
N
N}Disk_drvTypeDef;
N
N/* Exported constants --------------------------------------------------------*/
N/* Exported macro ------------------------------------------------------------*/
N/* Exported functions ------------------------------------------------------- */
Nuint8_t FATFS_LinkDriverEx(Diskio_drvTypeDef *drv, char *path, uint8_t lun);
Nuint8_t FATFS_LinkDriver(Diskio_drvTypeDef *drv, char *path);
Nuint8_t FATFS_UnLinkDriver(char *path);
Nuint8_t FATFS_LinkDriverEx(Diskio_drvTypeDef *drv, char *path, BYTE lun);
Nuint8_t FATFS_UnLinkDriverEx(char *path, BYTE lun);
Nuint8_t FATFS_GetAttachedDriversNbr(void);
N
N#ifdef __cplusplus
S}
N#endif
N
N#endif /* __FF_GEN_DRV_H */
N
N/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
L 61 "../diskio.c" 2
N
N/* Private typedef -----------------------------------------------------------*/
N/* Private define ------------------------------------------------------------*/
N/* Private variables ---------------------------------------------------------*/
Nextern Disk_drvTypeDef  disk;
N
Nstatic volatile BYTE Timer1, Timer2;
N/* Private function prototypes -----------------------------------------------*/
N/* Private functions ---------------------------------------------------------*/
N
N/**
N  * @brief  Gets Disk Status
N  * @param  pdrv: Physical drive number (0..)
N  * @retval DSTATUS: Operation status
N  */
N//DSTATUS disk_status (
N//    BYTE pdrv       /* Physical drive nmuber to identify the drive */
N//)
N//{
N//  DSTATUS stat;
N//
N//  stat = disk.drv[pdrv]->disk_status(disk.lun[pdrv]);
N//  return stat;
N//}
N
N/**
N  * @brief  Initializes a Drive
N  * @param  pdrv: Physical drive number (0..)
N  * @retval DSTATUS: Operation status
N  */
N//DSTATUS disk_initialize (
N//    BYTE pdrv               /* Physical drive nmuber to identify the drive */
N//)
N//{
N//  DSTATUS stat = RES_OK;
N//
N//  if(disk.is_initialized[pdrv] == 0)
N//  {
N//    disk.is_initialized[pdrv] = 1;
N//    stat = disk.drv[pdrv]->disk_initialize(disk.lun[pdrv]);
N//  }
N//  return stat;
N//}
N
N/**
N  * @brief  Reads Sector(s)
N  * @param  pdrv: Physical drive number (0..)
N  * @param  *buff: Data buffer to store read data
N  * @param  sector: Sector address (LBA)
N  * @param  count: Number of sectors to read (1..128)
N  * @retval DRESULT: Operation result
N  */
N//DRESULT disk_read (
N//    BYTE pdrv,      /* Physical drive nmuber to identify the drive */
N//    BYTE *buff,     /* Data buffer to store read data */
N//    DWORD sector,           /* Sector address in LBA */
N//    UINT count      /* Number of sectors to read */
N//)
N//{
N//  DRESULT res;
N//
N//  res = disk.drv[pdrv]->disk_read(disk.lun[pdrv], buff, sector, count);
N//  return res;
N//}
N
N/**
N  * @brief  Writes Sector(s)
N  * @param  pdrv: Physical drive number (0..)
N  * @param  *buff: Data to be written
N  * @param  sector: Sector address (LBA)
N  * @param  count: Number of sectors to write (1..128)
N  * @retval DRESULT: Operation result
N  */
N#if _USE_WRITE == 1
X#if 1 == 1
N//DRESULT disk_write (
N//    BYTE pdrv,      /* Physical drive nmuber to identify the drive */
N//    const BYTE *buff,   /* Data to be written */
N//    DWORD sector,       /* Sector address in LBA */
N//    UINT count          /* Number of sectors to write */
N//)
N//{
N//  DRESULT res;
N//
N//  res = disk.drv[pdrv]->disk_write(disk.lun[pdrv], buff, sector, count);
N//  return res;
N//}
N#endif /* _USE_WRITE == 1 */
N
N/**
N  * @brief  I/O control operation
N  * @param  pdrv: Physical drive number (0..)
N  * @param  cmd: Control code
N  * @param  *buff: Buffer to send/receive control data
N  * @retval DRESULT: Operation result
N  */
N#if _USE_IOCTL == 1
X#if 1 == 1
N//DRESULT disk_ioctl (
N//    BYTE pdrv,      /* Physical drive nmuber (0..) */
N//    BYTE cmd,       /* Control code */
N//    void *buff      /* Buffer to send/receive control data */
N//)
N//{
N//  DRESULT res;
N//
N//  res = disk.drv[pdrv]->disk_ioctl(disk.lun[pdrv], cmd, buff);
N//  return res;
N//}
N#endif /* _USE_IOCTL == 1 */
N
N/**
N  * @brief  Gets Time from RTC
N  * @param  None
N  * @retval Time in DWORD
N  */
N//void disk_timerproc (void)
N//{
N//    BYTE n;
N//
N//
N//    n = Timer1;                        /* 100Hz decrement timer */
N//    if (n) Timer1 = --n;
N//    n = Timer2;
N//    if (n) Timer2 = --n;
N//
N//}
N
N
N/*---------------------------------------------------------*/
N/* User Provided Timer Function for FatFs module           */
N/*---------------------------------------------------------*/
N/* This is a real time clock service to be called from     */
N/* FatFs module. Any valid time must be returned even if   */
N/* the system does not support a real time clock.          */
N
N//DWORD get_fattime (void)
N//{
N//
N//    return    ((2007UL-1980) << 25)    // Year = 2007
N//            | (6UL << 21)            // Month = June
N//            | (5UL << 16)            // Day = 5
N//            | (11U << 11)            // Hour = 11
N//            | (38U << 5)            // Min = 38
N//            | (0U >> 1)                // Sec = 0
N//            ;
N//
N//}
N/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
