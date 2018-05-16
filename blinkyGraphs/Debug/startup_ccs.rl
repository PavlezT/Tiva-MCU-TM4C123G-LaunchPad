L 1 "../startup_ccs.c"
N//*****************************************************************************
N//
N// startup_ccs.c - Startup code for use with TI's Code Composer Studio.
N//
N// Copyright (c) 2012-2016 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
N// Texas Instruments (TI) is supplying this software for use solely and
N// exclusively on TI's microcontroller products. The software is owned by
N// TI and/or its suppliers, and is protected under applicable copyright
N// laws. You may not combine this software with "viral" open-source
N// software in order to form a larger program.
N// 
N// THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
N// NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
N// NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
N// A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
N// CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
N// DAMAGES, FOR ANY REASON WHATSOEVER.
N// 
N// This is part of revision 2.1.3.156 of the EK-TM4C123GXL Firmware Package.
N//
N//*****************************************************************************
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
L 26 "../startup_ccs.c" 2
N#include "inc/hw_nvic.h"
L 1 "C:/ti/TivaWare_C_Series-2.1.3.156/inc/hw_nvic.h" 1
N//*****************************************************************************
N//
N// hw_nvic.h - Macros used when accessing the NVIC hardware.
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
N#ifndef __HW_NVIC_H__
N#define __HW_NVIC_H__
N
N//*****************************************************************************
N//
N// The following are defines for the NVIC register addresses.
N//
N//*****************************************************************************
N#define NVIC_ACTLR              0xE000E008  // Auxiliary Control
N#define NVIC_ST_CTRL            0xE000E010  // SysTick Control and Status
N                                            // Register
N#define NVIC_ST_RELOAD          0xE000E014  // SysTick Reload Value Register
N#define NVIC_ST_CURRENT         0xE000E018  // SysTick Current Value Register
N#define NVIC_EN0                0xE000E100  // Interrupt 0-31 Set Enable
N#define NVIC_EN1                0xE000E104  // Interrupt 32-63 Set Enable
N#define NVIC_EN2                0xE000E108  // Interrupt 64-95 Set Enable
N#define NVIC_EN3                0xE000E10C  // Interrupt 96-127 Set Enable
N#define NVIC_EN4                0xE000E110  // Interrupt 128-159 Set Enable
N#define NVIC_DIS0               0xE000E180  // Interrupt 0-31 Clear Enable
N#define NVIC_DIS1               0xE000E184  // Interrupt 32-63 Clear Enable
N#define NVIC_DIS2               0xE000E188  // Interrupt 64-95 Clear Enable
N#define NVIC_DIS3               0xE000E18C  // Interrupt 96-127 Clear Enable
N#define NVIC_DIS4               0xE000E190  // Interrupt 128-159 Clear Enable
N#define NVIC_PEND0              0xE000E200  // Interrupt 0-31 Set Pending
N#define NVIC_PEND1              0xE000E204  // Interrupt 32-63 Set Pending
N#define NVIC_PEND2              0xE000E208  // Interrupt 64-95 Set Pending
N#define NVIC_PEND3              0xE000E20C  // Interrupt 96-127 Set Pending
N#define NVIC_PEND4              0xE000E210  // Interrupt 128-159 Set Pending
N#define NVIC_UNPEND0            0xE000E280  // Interrupt 0-31 Clear Pending
N#define NVIC_UNPEND1            0xE000E284  // Interrupt 32-63 Clear Pending
N#define NVIC_UNPEND2            0xE000E288  // Interrupt 64-95 Clear Pending
N#define NVIC_UNPEND3            0xE000E28C  // Interrupt 96-127 Clear Pending
N#define NVIC_UNPEND4            0xE000E290  // Interrupt 128-159 Clear Pending
N#define NVIC_ACTIVE0            0xE000E300  // Interrupt 0-31 Active Bit
N#define NVIC_ACTIVE1            0xE000E304  // Interrupt 32-63 Active Bit
N#define NVIC_ACTIVE2            0xE000E308  // Interrupt 64-95 Active Bit
N#define NVIC_ACTIVE3            0xE000E30C  // Interrupt 96-127 Active Bit
N#define NVIC_ACTIVE4            0xE000E310  // Interrupt 128-159 Active Bit
N#define NVIC_PRI0               0xE000E400  // Interrupt 0-3 Priority
N#define NVIC_PRI1               0xE000E404  // Interrupt 4-7 Priority
N#define NVIC_PRI2               0xE000E408  // Interrupt 8-11 Priority
N#define NVIC_PRI3               0xE000E40C  // Interrupt 12-15 Priority
N#define NVIC_PRI4               0xE000E410  // Interrupt 16-19 Priority
N#define NVIC_PRI5               0xE000E414  // Interrupt 20-23 Priority
N#define NVIC_PRI6               0xE000E418  // Interrupt 24-27 Priority
N#define NVIC_PRI7               0xE000E41C  // Interrupt 28-31 Priority
N#define NVIC_PRI8               0xE000E420  // Interrupt 32-35 Priority
N#define NVIC_PRI9               0xE000E424  // Interrupt 36-39 Priority
N#define NVIC_PRI10              0xE000E428  // Interrupt 40-43 Priority
N#define NVIC_PRI11              0xE000E42C  // Interrupt 44-47 Priority
N#define NVIC_PRI12              0xE000E430  // Interrupt 48-51 Priority
N#define NVIC_PRI13              0xE000E434  // Interrupt 52-55 Priority
N#define NVIC_PRI14              0xE000E438  // Interrupt 56-59 Priority
N#define NVIC_PRI15              0xE000E43C  // Interrupt 60-63 Priority
N#define NVIC_PRI16              0xE000E440  // Interrupt 64-67 Priority
N#define NVIC_PRI17              0xE000E444  // Interrupt 68-71 Priority
N#define NVIC_PRI18              0xE000E448  // Interrupt 72-75 Priority
N#define NVIC_PRI19              0xE000E44C  // Interrupt 76-79 Priority
N#define NVIC_PRI20              0xE000E450  // Interrupt 80-83 Priority
N#define NVIC_PRI21              0xE000E454  // Interrupt 84-87 Priority
N#define NVIC_PRI22              0xE000E458  // Interrupt 88-91 Priority
N#define NVIC_PRI23              0xE000E45C  // Interrupt 92-95 Priority
N#define NVIC_PRI24              0xE000E460  // Interrupt 96-99 Priority
N#define NVIC_PRI25              0xE000E464  // Interrupt 100-103 Priority
N#define NVIC_PRI26              0xE000E468  // Interrupt 104-107 Priority
N#define NVIC_PRI27              0xE000E46C  // Interrupt 108-111 Priority
N#define NVIC_PRI28              0xE000E470  // Interrupt 112-115 Priority
N#define NVIC_PRI29              0xE000E474  // Interrupt 116-119 Priority
N#define NVIC_PRI30              0xE000E478  // Interrupt 120-123 Priority
N#define NVIC_PRI31              0xE000E47C  // Interrupt 124-127 Priority
N#define NVIC_PRI32              0xE000E480  // Interrupt 128-131 Priority
N#define NVIC_PRI33              0xE000E484  // Interrupt 132-135 Priority
N#define NVIC_PRI34              0xE000E488  // Interrupt 136-139 Priority
N#define NVIC_CPUID              0xE000ED00  // CPU ID Base
N#define NVIC_INT_CTRL           0xE000ED04  // Interrupt Control and State
N#define NVIC_VTABLE             0xE000ED08  // Vector Table Offset
N#define NVIC_APINT              0xE000ED0C  // Application Interrupt and Reset
N                                            // Control
N#define NVIC_SYS_CTRL           0xE000ED10  // System Control
N#define NVIC_CFG_CTRL           0xE000ED14  // Configuration and Control
N#define NVIC_SYS_PRI1           0xE000ED18  // System Handler Priority 1
N#define NVIC_SYS_PRI2           0xE000ED1C  // System Handler Priority 2
N#define NVIC_SYS_PRI3           0xE000ED20  // System Handler Priority 3
N#define NVIC_SYS_HND_CTRL       0xE000ED24  // System Handler Control and State
N#define NVIC_FAULT_STAT         0xE000ED28  // Configurable Fault Status
N#define NVIC_HFAULT_STAT        0xE000ED2C  // Hard Fault Status
N#define NVIC_DEBUG_STAT         0xE000ED30  // Debug Status Register
N#define NVIC_MM_ADDR            0xE000ED34  // Memory Management Fault Address
N#define NVIC_FAULT_ADDR         0xE000ED38  // Bus Fault Address
N#define NVIC_CPAC               0xE000ED88  // Coprocessor Access Control
N#define NVIC_MPU_TYPE           0xE000ED90  // MPU Type
N#define NVIC_MPU_CTRL           0xE000ED94  // MPU Control
N#define NVIC_MPU_NUMBER         0xE000ED98  // MPU Region Number
N#define NVIC_MPU_BASE           0xE000ED9C  // MPU Region Base Address
N#define NVIC_MPU_ATTR           0xE000EDA0  // MPU Region Attribute and Size
N#define NVIC_MPU_BASE1          0xE000EDA4  // MPU Region Base Address Alias 1
N#define NVIC_MPU_ATTR1          0xE000EDA8  // MPU Region Attribute and Size
N                                            // Alias 1
N#define NVIC_MPU_BASE2          0xE000EDAC  // MPU Region Base Address Alias 2
N#define NVIC_MPU_ATTR2          0xE000EDB0  // MPU Region Attribute and Size
N                                            // Alias 2
N#define NVIC_MPU_BASE3          0xE000EDB4  // MPU Region Base Address Alias 3
N#define NVIC_MPU_ATTR3          0xE000EDB8  // MPU Region Attribute and Size
N                                            // Alias 3
N#define NVIC_DBG_CTRL           0xE000EDF0  // Debug Control and Status Reg
N#define NVIC_DBG_XFER           0xE000EDF4  // Debug Core Reg. Transfer Select
N#define NVIC_DBG_DATA           0xE000EDF8  // Debug Core Register Data
N#define NVIC_DBG_INT            0xE000EDFC  // Debug Reset Interrupt Control
N#define NVIC_SW_TRIG            0xE000EF00  // Software Trigger Interrupt
N#define NVIC_FPCC               0xE000EF34  // Floating-Point Context Control
N#define NVIC_FPCA               0xE000EF38  // Floating-Point Context Address
N#define NVIC_FPDSC              0xE000EF3C  // Floating-Point Default Status
N                                            // Control
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTLR register.
N//
N//*****************************************************************************
N#define NVIC_ACTLR_DISOOFP      0x00000200  // Disable Out-Of-Order Floating
N                                            // Point
N#define NVIC_ACTLR_DISFPCA      0x00000100  // Disable CONTROL
N#define NVIC_ACTLR_DISFOLD      0x00000004  // Disable IT Folding
N#define NVIC_ACTLR_DISWBUF      0x00000002  // Disable Write Buffer
N#define NVIC_ACTLR_DISMCYC      0x00000001  // Disable Interrupts of Multiple
N                                            // Cycle Instructions
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ST_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_ST_CTRL_COUNT      0x00010000  // Count Flag
N#define NVIC_ST_CTRL_CLK_SRC    0x00000004  // Clock Source
N#define NVIC_ST_CTRL_INTEN      0x00000002  // Interrupt Enable
N#define NVIC_ST_CTRL_ENABLE     0x00000001  // Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ST_RELOAD register.
N//
N//*****************************************************************************
N#define NVIC_ST_RELOAD_M        0x00FFFFFF  // Reload Value
N#define NVIC_ST_RELOAD_S        0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ST_CURRENT
N// register.
N//
N//*****************************************************************************
N#define NVIC_ST_CURRENT_M       0x00FFFFFF  // Current Value
N#define NVIC_ST_CURRENT_S       0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_EN0 register.
N//
N//*****************************************************************************
N#define NVIC_EN0_INT_M          0xFFFFFFFF  // Interrupt Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_EN1 register.
N//
N//*****************************************************************************
N#define NVIC_EN1_INT_M          0xFFFFFFFF  // Interrupt Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_EN2 register.
N//
N//*****************************************************************************
N#define NVIC_EN2_INT_M          0xFFFFFFFF  // Interrupt Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_EN3 register.
N//
N//*****************************************************************************
N#define NVIC_EN3_INT_M          0xFFFFFFFF  // Interrupt Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_EN4 register.
N//
N//*****************************************************************************
N#define NVIC_EN4_INT_M          0x000007FF  // Interrupt Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DIS0 register.
N//
N//*****************************************************************************
N#define NVIC_DIS0_INT_M         0xFFFFFFFF  // Interrupt Disable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DIS1 register.
N//
N//*****************************************************************************
N#define NVIC_DIS1_INT_M         0xFFFFFFFF  // Interrupt Disable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DIS2 register.
N//
N//*****************************************************************************
N#define NVIC_DIS2_INT_M         0xFFFFFFFF  // Interrupt Disable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DIS3 register.
N//
N//*****************************************************************************
N#define NVIC_DIS3_INT_M         0xFFFFFFFF  // Interrupt Disable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DIS4 register.
N//
N//*****************************************************************************
N#define NVIC_DIS4_INT_M         0x000007FF  // Interrupt Disable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PEND0 register.
N//
N//*****************************************************************************
N#define NVIC_PEND0_INT_M        0xFFFFFFFF  // Interrupt Set Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PEND1 register.
N//
N//*****************************************************************************
N#define NVIC_PEND1_INT_M        0xFFFFFFFF  // Interrupt Set Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PEND2 register.
N//
N//*****************************************************************************
N#define NVIC_PEND2_INT_M        0xFFFFFFFF  // Interrupt Set Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PEND3 register.
N//
N//*****************************************************************************
N#define NVIC_PEND3_INT_M        0xFFFFFFFF  // Interrupt Set Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PEND4 register.
N//
N//*****************************************************************************
N#define NVIC_PEND4_INT_M        0x000007FF  // Interrupt Set Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_UNPEND0 register.
N//
N//*****************************************************************************
N#define NVIC_UNPEND0_INT_M      0xFFFFFFFF  // Interrupt Clear Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_UNPEND1 register.
N//
N//*****************************************************************************
N#define NVIC_UNPEND1_INT_M      0xFFFFFFFF  // Interrupt Clear Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_UNPEND2 register.
N//
N//*****************************************************************************
N#define NVIC_UNPEND2_INT_M      0xFFFFFFFF  // Interrupt Clear Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_UNPEND3 register.
N//
N//*****************************************************************************
N#define NVIC_UNPEND3_INT_M      0xFFFFFFFF  // Interrupt Clear Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_UNPEND4 register.
N//
N//*****************************************************************************
N#define NVIC_UNPEND4_INT_M      0x000007FF  // Interrupt Clear Pending
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTIVE0 register.
N//
N//*****************************************************************************
N#define NVIC_ACTIVE0_INT_M      0xFFFFFFFF  // Interrupt Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTIVE1 register.
N//
N//*****************************************************************************
N#define NVIC_ACTIVE1_INT_M      0xFFFFFFFF  // Interrupt Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTIVE2 register.
N//
N//*****************************************************************************
N#define NVIC_ACTIVE2_INT_M      0xFFFFFFFF  // Interrupt Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTIVE3 register.
N//
N//*****************************************************************************
N#define NVIC_ACTIVE3_INT_M      0xFFFFFFFF  // Interrupt Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_ACTIVE4 register.
N//
N//*****************************************************************************
N#define NVIC_ACTIVE4_INT_M      0x000007FF  // Interrupt Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI0 register.
N//
N//*****************************************************************************
N#define NVIC_PRI0_INT3_M        0xE0000000  // Interrupt 3 Priority Mask
N#define NVIC_PRI0_INT2_M        0x00E00000  // Interrupt 2 Priority Mask
N#define NVIC_PRI0_INT1_M        0x0000E000  // Interrupt 1 Priority Mask
N#define NVIC_PRI0_INT0_M        0x000000E0  // Interrupt 0 Priority Mask
N#define NVIC_PRI0_INT3_S        29
N#define NVIC_PRI0_INT2_S        21
N#define NVIC_PRI0_INT1_S        13
N#define NVIC_PRI0_INT0_S        5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI1 register.
N//
N//*****************************************************************************
N#define NVIC_PRI1_INT7_M        0xE0000000  // Interrupt 7 Priority Mask
N#define NVIC_PRI1_INT6_M        0x00E00000  // Interrupt 6 Priority Mask
N#define NVIC_PRI1_INT5_M        0x0000E000  // Interrupt 5 Priority Mask
N#define NVIC_PRI1_INT4_M        0x000000E0  // Interrupt 4 Priority Mask
N#define NVIC_PRI1_INT7_S        29
N#define NVIC_PRI1_INT6_S        21
N#define NVIC_PRI1_INT5_S        13
N#define NVIC_PRI1_INT4_S        5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI2 register.
N//
N//*****************************************************************************
N#define NVIC_PRI2_INT11_M       0xE0000000  // Interrupt 11 Priority Mask
N#define NVIC_PRI2_INT10_M       0x00E00000  // Interrupt 10 Priority Mask
N#define NVIC_PRI2_INT9_M        0x0000E000  // Interrupt 9 Priority Mask
N#define NVIC_PRI2_INT8_M        0x000000E0  // Interrupt 8 Priority Mask
N#define NVIC_PRI2_INT11_S       29
N#define NVIC_PRI2_INT10_S       21
N#define NVIC_PRI2_INT9_S        13
N#define NVIC_PRI2_INT8_S        5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI3 register.
N//
N//*****************************************************************************
N#define NVIC_PRI3_INT15_M       0xE0000000  // Interrupt 15 Priority Mask
N#define NVIC_PRI3_INT14_M       0x00E00000  // Interrupt 14 Priority Mask
N#define NVIC_PRI3_INT13_M       0x0000E000  // Interrupt 13 Priority Mask
N#define NVIC_PRI3_INT12_M       0x000000E0  // Interrupt 12 Priority Mask
N#define NVIC_PRI3_INT15_S       29
N#define NVIC_PRI3_INT14_S       21
N#define NVIC_PRI3_INT13_S       13
N#define NVIC_PRI3_INT12_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI4 register.
N//
N//*****************************************************************************
N#define NVIC_PRI4_INT19_M       0xE0000000  // Interrupt 19 Priority Mask
N#define NVIC_PRI4_INT18_M       0x00E00000  // Interrupt 18 Priority Mask
N#define NVIC_PRI4_INT17_M       0x0000E000  // Interrupt 17 Priority Mask
N#define NVIC_PRI4_INT16_M       0x000000E0  // Interrupt 16 Priority Mask
N#define NVIC_PRI4_INT19_S       29
N#define NVIC_PRI4_INT18_S       21
N#define NVIC_PRI4_INT17_S       13
N#define NVIC_PRI4_INT16_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI5 register.
N//
N//*****************************************************************************
N#define NVIC_PRI5_INT23_M       0xE0000000  // Interrupt 23 Priority Mask
N#define NVIC_PRI5_INT22_M       0x00E00000  // Interrupt 22 Priority Mask
N#define NVIC_PRI5_INT21_M       0x0000E000  // Interrupt 21 Priority Mask
N#define NVIC_PRI5_INT20_M       0x000000E0  // Interrupt 20 Priority Mask
N#define NVIC_PRI5_INT23_S       29
N#define NVIC_PRI5_INT22_S       21
N#define NVIC_PRI5_INT21_S       13
N#define NVIC_PRI5_INT20_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI6 register.
N//
N//*****************************************************************************
N#define NVIC_PRI6_INT27_M       0xE0000000  // Interrupt 27 Priority Mask
N#define NVIC_PRI6_INT26_M       0x00E00000  // Interrupt 26 Priority Mask
N#define NVIC_PRI6_INT25_M       0x0000E000  // Interrupt 25 Priority Mask
N#define NVIC_PRI6_INT24_M       0x000000E0  // Interrupt 24 Priority Mask
N#define NVIC_PRI6_INT27_S       29
N#define NVIC_PRI6_INT26_S       21
N#define NVIC_PRI6_INT25_S       13
N#define NVIC_PRI6_INT24_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI7 register.
N//
N//*****************************************************************************
N#define NVIC_PRI7_INT31_M       0xE0000000  // Interrupt 31 Priority Mask
N#define NVIC_PRI7_INT30_M       0x00E00000  // Interrupt 30 Priority Mask
N#define NVIC_PRI7_INT29_M       0x0000E000  // Interrupt 29 Priority Mask
N#define NVIC_PRI7_INT28_M       0x000000E0  // Interrupt 28 Priority Mask
N#define NVIC_PRI7_INT31_S       29
N#define NVIC_PRI7_INT30_S       21
N#define NVIC_PRI7_INT29_S       13
N#define NVIC_PRI7_INT28_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI8 register.
N//
N//*****************************************************************************
N#define NVIC_PRI8_INT35_M       0xE0000000  // Interrupt 35 Priority Mask
N#define NVIC_PRI8_INT34_M       0x00E00000  // Interrupt 34 Priority Mask
N#define NVIC_PRI8_INT33_M       0x0000E000  // Interrupt 33 Priority Mask
N#define NVIC_PRI8_INT32_M       0x000000E0  // Interrupt 32 Priority Mask
N#define NVIC_PRI8_INT35_S       29
N#define NVIC_PRI8_INT34_S       21
N#define NVIC_PRI8_INT33_S       13
N#define NVIC_PRI8_INT32_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI9 register.
N//
N//*****************************************************************************
N#define NVIC_PRI9_INT39_M       0xE0000000  // Interrupt 39 Priority Mask
N#define NVIC_PRI9_INT38_M       0x00E00000  // Interrupt 38 Priority Mask
N#define NVIC_PRI9_INT37_M       0x0000E000  // Interrupt 37 Priority Mask
N#define NVIC_PRI9_INT36_M       0x000000E0  // Interrupt 36 Priority Mask
N#define NVIC_PRI9_INT39_S       29
N#define NVIC_PRI9_INT38_S       21
N#define NVIC_PRI9_INT37_S       13
N#define NVIC_PRI9_INT36_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI10 register.
N//
N//*****************************************************************************
N#define NVIC_PRI10_INT43_M      0xE0000000  // Interrupt 43 Priority Mask
N#define NVIC_PRI10_INT42_M      0x00E00000  // Interrupt 42 Priority Mask
N#define NVIC_PRI10_INT41_M      0x0000E000  // Interrupt 41 Priority Mask
N#define NVIC_PRI10_INT40_M      0x000000E0  // Interrupt 40 Priority Mask
N#define NVIC_PRI10_INT43_S      29
N#define NVIC_PRI10_INT42_S      21
N#define NVIC_PRI10_INT41_S      13
N#define NVIC_PRI10_INT40_S      5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI11 register.
N//
N//*****************************************************************************
N#define NVIC_PRI11_INT47_M      0xE0000000  // Interrupt 47 Priority Mask
N#define NVIC_PRI11_INT46_M      0x00E00000  // Interrupt 46 Priority Mask
N#define NVIC_PRI11_INT45_M      0x0000E000  // Interrupt 45 Priority Mask
N#define NVIC_PRI11_INT44_M      0x000000E0  // Interrupt 44 Priority Mask
N#define NVIC_PRI11_INT47_S      29
N#define NVIC_PRI11_INT46_S      21
N#define NVIC_PRI11_INT45_S      13
N#define NVIC_PRI11_INT44_S      5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI12 register.
N//
N//*****************************************************************************
N#define NVIC_PRI12_INT51_M      0xE0000000  // Interrupt 51 Priority Mask
N#define NVIC_PRI12_INT50_M      0x00E00000  // Interrupt 50 Priority Mask
N#define NVIC_PRI12_INT49_M      0x0000E000  // Interrupt 49 Priority Mask
N#define NVIC_PRI12_INT48_M      0x000000E0  // Interrupt 48 Priority Mask
N#define NVIC_PRI12_INT51_S      29
N#define NVIC_PRI12_INT50_S      21
N#define NVIC_PRI12_INT49_S      13
N#define NVIC_PRI12_INT48_S      5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI13 register.
N//
N//*****************************************************************************
N#define NVIC_PRI13_INT55_M      0xE0000000  // Interrupt 55 Priority Mask
N#define NVIC_PRI13_INT54_M      0x00E00000  // Interrupt 54 Priority Mask
N#define NVIC_PRI13_INT53_M      0x0000E000  // Interrupt 53 Priority Mask
N#define NVIC_PRI13_INT52_M      0x000000E0  // Interrupt 52 Priority Mask
N#define NVIC_PRI13_INT55_S      29
N#define NVIC_PRI13_INT54_S      21
N#define NVIC_PRI13_INT53_S      13
N#define NVIC_PRI13_INT52_S      5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI14 register.
N//
N//*****************************************************************************
N#define NVIC_PRI14_INTD_M       0xE0000000  // Interrupt 59 Priority Mask
N#define NVIC_PRI14_INTC_M       0x00E00000  // Interrupt 58 Priority Mask
N#define NVIC_PRI14_INTB_M       0x0000E000  // Interrupt 57 Priority Mask
N#define NVIC_PRI14_INTA_M       0x000000E0  // Interrupt 56 Priority Mask
N#define NVIC_PRI14_INTD_S       29
N#define NVIC_PRI14_INTC_S       21
N#define NVIC_PRI14_INTB_S       13
N#define NVIC_PRI14_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI15 register.
N//
N//*****************************************************************************
N#define NVIC_PRI15_INTD_M       0xE0000000  // Interrupt 63 Priority Mask
N#define NVIC_PRI15_INTC_M       0x00E00000  // Interrupt 62 Priority Mask
N#define NVIC_PRI15_INTB_M       0x0000E000  // Interrupt 61 Priority Mask
N#define NVIC_PRI15_INTA_M       0x000000E0  // Interrupt 60 Priority Mask
N#define NVIC_PRI15_INTD_S       29
N#define NVIC_PRI15_INTC_S       21
N#define NVIC_PRI15_INTB_S       13
N#define NVIC_PRI15_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI16 register.
N//
N//*****************************************************************************
N#define NVIC_PRI16_INTD_M       0xE0000000  // Interrupt 67 Priority Mask
N#define NVIC_PRI16_INTC_M       0x00E00000  // Interrupt 66 Priority Mask
N#define NVIC_PRI16_INTB_M       0x0000E000  // Interrupt 65 Priority Mask
N#define NVIC_PRI16_INTA_M       0x000000E0  // Interrupt 64 Priority Mask
N#define NVIC_PRI16_INTD_S       29
N#define NVIC_PRI16_INTC_S       21
N#define NVIC_PRI16_INTB_S       13
N#define NVIC_PRI16_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI17 register.
N//
N//*****************************************************************************
N#define NVIC_PRI17_INTD_M       0xE0000000  // Interrupt 71 Priority Mask
N#define NVIC_PRI17_INTC_M       0x00E00000  // Interrupt 70 Priority Mask
N#define NVIC_PRI17_INTB_M       0x0000E000  // Interrupt 69 Priority Mask
N#define NVIC_PRI17_INTA_M       0x000000E0  // Interrupt 68 Priority Mask
N#define NVIC_PRI17_INTD_S       29
N#define NVIC_PRI17_INTC_S       21
N#define NVIC_PRI17_INTB_S       13
N#define NVIC_PRI17_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI18 register.
N//
N//*****************************************************************************
N#define NVIC_PRI18_INTD_M       0xE0000000  // Interrupt 75 Priority Mask
N#define NVIC_PRI18_INTC_M       0x00E00000  // Interrupt 74 Priority Mask
N#define NVIC_PRI18_INTB_M       0x0000E000  // Interrupt 73 Priority Mask
N#define NVIC_PRI18_INTA_M       0x000000E0  // Interrupt 72 Priority Mask
N#define NVIC_PRI18_INTD_S       29
N#define NVIC_PRI18_INTC_S       21
N#define NVIC_PRI18_INTB_S       13
N#define NVIC_PRI18_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI19 register.
N//
N//*****************************************************************************
N#define NVIC_PRI19_INTD_M       0xE0000000  // Interrupt 79 Priority Mask
N#define NVIC_PRI19_INTC_M       0x00E00000  // Interrupt 78 Priority Mask
N#define NVIC_PRI19_INTB_M       0x0000E000  // Interrupt 77 Priority Mask
N#define NVIC_PRI19_INTA_M       0x000000E0  // Interrupt 76 Priority Mask
N#define NVIC_PRI19_INTD_S       29
N#define NVIC_PRI19_INTC_S       21
N#define NVIC_PRI19_INTB_S       13
N#define NVIC_PRI19_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI20 register.
N//
N//*****************************************************************************
N#define NVIC_PRI20_INTD_M       0xE0000000  // Interrupt 83 Priority Mask
N#define NVIC_PRI20_INTC_M       0x00E00000  // Interrupt 82 Priority Mask
N#define NVIC_PRI20_INTB_M       0x0000E000  // Interrupt 81 Priority Mask
N#define NVIC_PRI20_INTA_M       0x000000E0  // Interrupt 80 Priority Mask
N#define NVIC_PRI20_INTD_S       29
N#define NVIC_PRI20_INTC_S       21
N#define NVIC_PRI20_INTB_S       13
N#define NVIC_PRI20_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI21 register.
N//
N//*****************************************************************************
N#define NVIC_PRI21_INTD_M       0xE0000000  // Interrupt 87 Priority Mask
N#define NVIC_PRI21_INTC_M       0x00E00000  // Interrupt 86 Priority Mask
N#define NVIC_PRI21_INTB_M       0x0000E000  // Interrupt 85 Priority Mask
N#define NVIC_PRI21_INTA_M       0x000000E0  // Interrupt 84 Priority Mask
N#define NVIC_PRI21_INTD_S       29
N#define NVIC_PRI21_INTC_S       21
N#define NVIC_PRI21_INTB_S       13
N#define NVIC_PRI21_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI22 register.
N//
N//*****************************************************************************
N#define NVIC_PRI22_INTD_M       0xE0000000  // Interrupt 91 Priority Mask
N#define NVIC_PRI22_INTC_M       0x00E00000  // Interrupt 90 Priority Mask
N#define NVIC_PRI22_INTB_M       0x0000E000  // Interrupt 89 Priority Mask
N#define NVIC_PRI22_INTA_M       0x000000E0  // Interrupt 88 Priority Mask
N#define NVIC_PRI22_INTD_S       29
N#define NVIC_PRI22_INTC_S       21
N#define NVIC_PRI22_INTB_S       13
N#define NVIC_PRI22_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI23 register.
N//
N//*****************************************************************************
N#define NVIC_PRI23_INTD_M       0xE0000000  // Interrupt 95 Priority Mask
N#define NVIC_PRI23_INTC_M       0x00E00000  // Interrupt 94 Priority Mask
N#define NVIC_PRI23_INTB_M       0x0000E000  // Interrupt 93 Priority Mask
N#define NVIC_PRI23_INTA_M       0x000000E0  // Interrupt 92 Priority Mask
N#define NVIC_PRI23_INTD_S       29
N#define NVIC_PRI23_INTC_S       21
N#define NVIC_PRI23_INTB_S       13
N#define NVIC_PRI23_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI24 register.
N//
N//*****************************************************************************
N#define NVIC_PRI24_INTD_M       0xE0000000  // Interrupt 99 Priority Mask
N#define NVIC_PRI24_INTC_M       0x00E00000  // Interrupt 98 Priority Mask
N#define NVIC_PRI24_INTB_M       0x0000E000  // Interrupt 97 Priority Mask
N#define NVIC_PRI24_INTA_M       0x000000E0  // Interrupt 96 Priority Mask
N#define NVIC_PRI24_INTD_S       29
N#define NVIC_PRI24_INTC_S       21
N#define NVIC_PRI24_INTB_S       13
N#define NVIC_PRI24_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI25 register.
N//
N//*****************************************************************************
N#define NVIC_PRI25_INTD_M       0xE0000000  // Interrupt 103 Priority Mask
N#define NVIC_PRI25_INTC_M       0x00E00000  // Interrupt 102 Priority Mask
N#define NVIC_PRI25_INTB_M       0x0000E000  // Interrupt 101 Priority Mask
N#define NVIC_PRI25_INTA_M       0x000000E0  // Interrupt 100 Priority Mask
N#define NVIC_PRI25_INTD_S       29
N#define NVIC_PRI25_INTC_S       21
N#define NVIC_PRI25_INTB_S       13
N#define NVIC_PRI25_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI26 register.
N//
N//*****************************************************************************
N#define NVIC_PRI26_INTD_M       0xE0000000  // Interrupt 107 Priority Mask
N#define NVIC_PRI26_INTC_M       0x00E00000  // Interrupt 106 Priority Mask
N#define NVIC_PRI26_INTB_M       0x0000E000  // Interrupt 105 Priority Mask
N#define NVIC_PRI26_INTA_M       0x000000E0  // Interrupt 104 Priority Mask
N#define NVIC_PRI26_INTD_S       29
N#define NVIC_PRI26_INTC_S       21
N#define NVIC_PRI26_INTB_S       13
N#define NVIC_PRI26_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI27 register.
N//
N//*****************************************************************************
N#define NVIC_PRI27_INTD_M       0xE0000000  // Interrupt 111 Priority Mask
N#define NVIC_PRI27_INTC_M       0x00E00000  // Interrupt 110 Priority Mask
N#define NVIC_PRI27_INTB_M       0x0000E000  // Interrupt 109 Priority Mask
N#define NVIC_PRI27_INTA_M       0x000000E0  // Interrupt 108 Priority Mask
N#define NVIC_PRI27_INTD_S       29
N#define NVIC_PRI27_INTC_S       21
N#define NVIC_PRI27_INTB_S       13
N#define NVIC_PRI27_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI28 register.
N//
N//*****************************************************************************
N#define NVIC_PRI28_INTD_M       0xE0000000  // Interrupt 115 Priority Mask
N#define NVIC_PRI28_INTC_M       0x00E00000  // Interrupt 114 Priority Mask
N#define NVIC_PRI28_INTB_M       0x0000E000  // Interrupt 113 Priority Mask
N#define NVIC_PRI28_INTA_M       0x000000E0  // Interrupt 112 Priority Mask
N#define NVIC_PRI28_INTD_S       29
N#define NVIC_PRI28_INTC_S       21
N#define NVIC_PRI28_INTB_S       13
N#define NVIC_PRI28_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI29 register.
N//
N//*****************************************************************************
N#define NVIC_PRI29_INTD_M       0xE0000000  // Interrupt 119 Priority Mask
N#define NVIC_PRI29_INTC_M       0x00E00000  // Interrupt 118 Priority Mask
N#define NVIC_PRI29_INTB_M       0x0000E000  // Interrupt 117 Priority Mask
N#define NVIC_PRI29_INTA_M       0x000000E0  // Interrupt 116 Priority Mask
N#define NVIC_PRI29_INTD_S       29
N#define NVIC_PRI29_INTC_S       21
N#define NVIC_PRI29_INTB_S       13
N#define NVIC_PRI29_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI30 register.
N//
N//*****************************************************************************
N#define NVIC_PRI30_INTD_M       0xE0000000  // Interrupt 123 Priority Mask
N#define NVIC_PRI30_INTC_M       0x00E00000  // Interrupt 122 Priority Mask
N#define NVIC_PRI30_INTB_M       0x0000E000  // Interrupt 121 Priority Mask
N#define NVIC_PRI30_INTA_M       0x000000E0  // Interrupt 120 Priority Mask
N#define NVIC_PRI30_INTD_S       29
N#define NVIC_PRI30_INTC_S       21
N#define NVIC_PRI30_INTB_S       13
N#define NVIC_PRI30_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI31 register.
N//
N//*****************************************************************************
N#define NVIC_PRI31_INTD_M       0xE0000000  // Interrupt 127 Priority Mask
N#define NVIC_PRI31_INTC_M       0x00E00000  // Interrupt 126 Priority Mask
N#define NVIC_PRI31_INTB_M       0x0000E000  // Interrupt 125 Priority Mask
N#define NVIC_PRI31_INTA_M       0x000000E0  // Interrupt 124 Priority Mask
N#define NVIC_PRI31_INTD_S       29
N#define NVIC_PRI31_INTC_S       21
N#define NVIC_PRI31_INTB_S       13
N#define NVIC_PRI31_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI32 register.
N//
N//*****************************************************************************
N#define NVIC_PRI32_INTD_M       0xE0000000  // Interrupt 131 Priority Mask
N#define NVIC_PRI32_INTC_M       0x00E00000  // Interrupt 130 Priority Mask
N#define NVIC_PRI32_INTB_M       0x0000E000  // Interrupt 129 Priority Mask
N#define NVIC_PRI32_INTA_M       0x000000E0  // Interrupt 128 Priority Mask
N#define NVIC_PRI32_INTD_S       29
N#define NVIC_PRI32_INTC_S       21
N#define NVIC_PRI32_INTB_S       13
N#define NVIC_PRI32_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI33 register.
N//
N//*****************************************************************************
N#define NVIC_PRI33_INTD_M       0xE0000000  // Interrupt Priority for Interrupt
N                                            // [4n+3]
N#define NVIC_PRI33_INTC_M       0x00E00000  // Interrupt Priority for Interrupt
N                                            // [4n+2]
N#define NVIC_PRI33_INTB_M       0x0000E000  // Interrupt Priority for Interrupt
N                                            // [4n+1]
N#define NVIC_PRI33_INTA_M       0x000000E0  // Interrupt Priority for Interrupt
N                                            // [4n]
N#define NVIC_PRI33_INTD_S       29
N#define NVIC_PRI33_INTC_S       21
N#define NVIC_PRI33_INTB_S       13
N#define NVIC_PRI33_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_PRI34 register.
N//
N//*****************************************************************************
N#define NVIC_PRI34_INTD_M       0xE0000000  // Interrupt Priority for Interrupt
N                                            // [4n+3]
N#define NVIC_PRI34_INTC_M       0x00E00000  // Interrupt Priority for Interrupt
N                                            // [4n+2]
N#define NVIC_PRI34_INTB_M       0x0000E000  // Interrupt Priority for Interrupt
N                                            // [4n+1]
N#define NVIC_PRI34_INTA_M       0x000000E0  // Interrupt Priority for Interrupt
N                                            // [4n]
N#define NVIC_PRI34_INTD_S       29
N#define NVIC_PRI34_INTC_S       21
N#define NVIC_PRI34_INTB_S       13
N#define NVIC_PRI34_INTA_S       5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_CPUID register.
N//
N//*****************************************************************************
N#define NVIC_CPUID_IMP_M        0xFF000000  // Implementer Code
N#define NVIC_CPUID_IMP_ARM      0x41000000  // ARM
N#define NVIC_CPUID_VAR_M        0x00F00000  // Variant Number
N#define NVIC_CPUID_CON_M        0x000F0000  // Constant
N#define NVIC_CPUID_PARTNO_M     0x0000FFF0  // Part Number
N#define NVIC_CPUID_PARTNO_CM4   0x0000C240  // Cortex-M4 processor
N#define NVIC_CPUID_REV_M        0x0000000F  // Revision Number
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_INT_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_INT_CTRL_NMI_SET   0x80000000  // NMI Set Pending
N#define NVIC_INT_CTRL_PEND_SV   0x10000000  // PendSV Set Pending
N#define NVIC_INT_CTRL_UNPEND_SV 0x08000000  // PendSV Clear Pending
N#define NVIC_INT_CTRL_PENDSTSET 0x04000000  // SysTick Set Pending
N#define NVIC_INT_CTRL_PENDSTCLR 0x02000000  // SysTick Clear Pending
N#define NVIC_INT_CTRL_ISR_PRE   0x00800000  // Debug Interrupt Handling
N#define NVIC_INT_CTRL_ISR_PEND  0x00400000  // Interrupt Pending
N#define NVIC_INT_CTRL_VEC_PEN_M 0x000FF000  // Interrupt Pending Vector Number
N#define NVIC_INT_CTRL_VEC_PEN_NMI                                             \
N                                0x00002000  // NMI
X#define NVIC_INT_CTRL_VEC_PEN_NMI                                                                             0x00002000  
N#define NVIC_INT_CTRL_VEC_PEN_HARD                                            \
N                                0x00003000  // Hard fault
X#define NVIC_INT_CTRL_VEC_PEN_HARD                                                                            0x00003000  
N#define NVIC_INT_CTRL_VEC_PEN_MEM                                             \
N                                0x00004000  // Memory management fault
X#define NVIC_INT_CTRL_VEC_PEN_MEM                                                                             0x00004000  
N#define NVIC_INT_CTRL_VEC_PEN_BUS                                             \
N                                0x00005000  // Bus fault
X#define NVIC_INT_CTRL_VEC_PEN_BUS                                                                             0x00005000  
N#define NVIC_INT_CTRL_VEC_PEN_USG                                             \
N                                0x00006000  // Usage fault
X#define NVIC_INT_CTRL_VEC_PEN_USG                                                                             0x00006000  
N#define NVIC_INT_CTRL_VEC_PEN_SVC                                             \
N                                0x0000B000  // SVCall
X#define NVIC_INT_CTRL_VEC_PEN_SVC                                                                             0x0000B000  
N#define NVIC_INT_CTRL_VEC_PEN_PNDSV                                           \
N                                0x0000E000  // PendSV
X#define NVIC_INT_CTRL_VEC_PEN_PNDSV                                                                           0x0000E000  
N#define NVIC_INT_CTRL_VEC_PEN_TICK                                            \
N                                0x0000F000  // SysTick
X#define NVIC_INT_CTRL_VEC_PEN_TICK                                                                            0x0000F000  
N#define NVIC_INT_CTRL_RET_BASE  0x00000800  // Return to Base
N#define NVIC_INT_CTRL_VEC_ACT_M 0x000000FF  // Interrupt Pending Vector Number
N#define NVIC_INT_CTRL_VEC_ACT_S 0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_VTABLE register.
N//
N//*****************************************************************************
N#define NVIC_VTABLE_OFFSET_M    0xFFFFFC00  // Vector Table Offset
N#define NVIC_VTABLE_OFFSET_S    10
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_APINT register.
N//
N//*****************************************************************************
N#define NVIC_APINT_VECTKEY_M    0xFFFF0000  // Register Key
N#define NVIC_APINT_VECTKEY      0x05FA0000  // Vector key
N#define NVIC_APINT_ENDIANESS    0x00008000  // Data Endianess
N#define NVIC_APINT_PRIGROUP_M   0x00000700  // Interrupt Priority Grouping
N#define NVIC_APINT_PRIGROUP_7_1 0x00000000  // Priority group 7.1 split
N#define NVIC_APINT_PRIGROUP_6_2 0x00000100  // Priority group 6.2 split
N#define NVIC_APINT_PRIGROUP_5_3 0x00000200  // Priority group 5.3 split
N#define NVIC_APINT_PRIGROUP_4_4 0x00000300  // Priority group 4.4 split
N#define NVIC_APINT_PRIGROUP_3_5 0x00000400  // Priority group 3.5 split
N#define NVIC_APINT_PRIGROUP_2_6 0x00000500  // Priority group 2.6 split
N#define NVIC_APINT_PRIGROUP_1_7 0x00000600  // Priority group 1.7 split
N#define NVIC_APINT_PRIGROUP_0_8 0x00000700  // Priority group 0.8 split
N#define NVIC_APINT_SYSRESETREQ  0x00000004  // System Reset Request
N#define NVIC_APINT_VECT_CLR_ACT 0x00000002  // Clear Active NMI / Fault
N#define NVIC_APINT_VECT_RESET   0x00000001  // System Reset
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SYS_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_SYS_CTRL_SEVONPEND 0x00000010  // Wake Up on Pending
N#define NVIC_SYS_CTRL_SLEEPDEEP 0x00000004  // Deep Sleep Enable
N#define NVIC_SYS_CTRL_SLEEPEXIT 0x00000002  // Sleep on ISR Exit
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_CFG_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_CFG_CTRL_STKALIGN  0x00000200  // Stack Alignment on Exception
N                                            // Entry
N#define NVIC_CFG_CTRL_BFHFNMIGN 0x00000100  // Ignore Bus Fault in NMI and
N                                            // Fault
N#define NVIC_CFG_CTRL_DIV0      0x00000010  // Trap on Divide by 0
N#define NVIC_CFG_CTRL_UNALIGNED 0x00000008  // Trap on Unaligned Access
N#define NVIC_CFG_CTRL_MAIN_PEND 0x00000002  // Allow Main Interrupt Trigger
N#define NVIC_CFG_CTRL_BASE_THR  0x00000001  // Thread State Control
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SYS_PRI1 register.
N//
N//*****************************************************************************
N#define NVIC_SYS_PRI1_USAGE_M   0x00E00000  // Usage Fault Priority
N#define NVIC_SYS_PRI1_BUS_M     0x0000E000  // Bus Fault Priority
N#define NVIC_SYS_PRI1_MEM_M     0x000000E0  // Memory Management Fault Priority
N#define NVIC_SYS_PRI1_USAGE_S   21
N#define NVIC_SYS_PRI1_BUS_S     13
N#define NVIC_SYS_PRI1_MEM_S     5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SYS_PRI2 register.
N//
N//*****************************************************************************
N#define NVIC_SYS_PRI2_SVC_M     0xE0000000  // SVCall Priority
N#define NVIC_SYS_PRI2_SVC_S     29
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SYS_PRI3 register.
N//
N//*****************************************************************************
N#define NVIC_SYS_PRI3_TICK_M    0xE0000000  // SysTick Exception Priority
N#define NVIC_SYS_PRI3_PENDSV_M  0x00E00000  // PendSV Priority
N#define NVIC_SYS_PRI3_DEBUG_M   0x000000E0  // Debug Priority
N#define NVIC_SYS_PRI3_TICK_S    29
N#define NVIC_SYS_PRI3_PENDSV_S  21
N#define NVIC_SYS_PRI3_DEBUG_S   5
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SYS_HND_CTRL
N// register.
N//
N//*****************************************************************************
N#define NVIC_SYS_HND_CTRL_USAGE 0x00040000  // Usage Fault Enable
N#define NVIC_SYS_HND_CTRL_BUS   0x00020000  // Bus Fault Enable
N#define NVIC_SYS_HND_CTRL_MEM   0x00010000  // Memory Management Fault Enable
N#define NVIC_SYS_HND_CTRL_SVC   0x00008000  // SVC Call Pending
N#define NVIC_SYS_HND_CTRL_BUSP  0x00004000  // Bus Fault Pending
N#define NVIC_SYS_HND_CTRL_MEMP  0x00002000  // Memory Management Fault Pending
N#define NVIC_SYS_HND_CTRL_USAGEP                                              \
N                                0x00001000  // Usage Fault Pending
X#define NVIC_SYS_HND_CTRL_USAGEP                                                                              0x00001000  
N#define NVIC_SYS_HND_CTRL_TICK  0x00000800  // SysTick Exception Active
N#define NVIC_SYS_HND_CTRL_PNDSV 0x00000400  // PendSV Exception Active
N#define NVIC_SYS_HND_CTRL_MON   0x00000100  // Debug Monitor Active
N#define NVIC_SYS_HND_CTRL_SVCA  0x00000080  // SVC Call Active
N#define NVIC_SYS_HND_CTRL_USGA  0x00000008  // Usage Fault Active
N#define NVIC_SYS_HND_CTRL_BUSA  0x00000002  // Bus Fault Active
N#define NVIC_SYS_HND_CTRL_MEMA  0x00000001  // Memory Management Fault Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_FAULT_STAT
N// register.
N//
N//*****************************************************************************
N#define NVIC_FAULT_STAT_DIV0    0x02000000  // Divide-by-Zero Usage Fault
N#define NVIC_FAULT_STAT_UNALIGN 0x01000000  // Unaligned Access Usage Fault
N#define NVIC_FAULT_STAT_NOCP    0x00080000  // No Coprocessor Usage Fault
N#define NVIC_FAULT_STAT_INVPC   0x00040000  // Invalid PC Load Usage Fault
N#define NVIC_FAULT_STAT_INVSTAT 0x00020000  // Invalid State Usage Fault
N#define NVIC_FAULT_STAT_UNDEF   0x00010000  // Undefined Instruction Usage
N                                            // Fault
N#define NVIC_FAULT_STAT_BFARV   0x00008000  // Bus Fault Address Register Valid
N#define NVIC_FAULT_STAT_BLSPERR 0x00002000  // Bus Fault on Floating-Point Lazy
N                                            // State Preservation
N#define NVIC_FAULT_STAT_BSTKE   0x00001000  // Stack Bus Fault
N#define NVIC_FAULT_STAT_BUSTKE  0x00000800  // Unstack Bus Fault
N#define NVIC_FAULT_STAT_IMPRE   0x00000400  // Imprecise Data Bus Error
N#define NVIC_FAULT_STAT_PRECISE 0x00000200  // Precise Data Bus Error
N#define NVIC_FAULT_STAT_IBUS    0x00000100  // Instruction Bus Error
N#define NVIC_FAULT_STAT_MMARV   0x00000080  // Memory Management Fault Address
N                                            // Register Valid
N#define NVIC_FAULT_STAT_MLSPERR 0x00000020  // Memory Management Fault on
N                                            // Floating-Point Lazy State
N                                            // Preservation
N#define NVIC_FAULT_STAT_MSTKE   0x00000010  // Stack Access Violation
N#define NVIC_FAULT_STAT_MUSTKE  0x00000008  // Unstack Access Violation
N#define NVIC_FAULT_STAT_DERR    0x00000002  // Data Access Violation
N#define NVIC_FAULT_STAT_IERR    0x00000001  // Instruction Access Violation
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_HFAULT_STAT
N// register.
N//
N//*****************************************************************************
N#define NVIC_HFAULT_STAT_DBG    0x80000000  // Debug Event
N#define NVIC_HFAULT_STAT_FORCED 0x40000000  // Forced Hard Fault
N#define NVIC_HFAULT_STAT_VECT   0x00000002  // Vector Table Read Fault
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DEBUG_STAT
N// register.
N//
N//*****************************************************************************
N#define NVIC_DEBUG_STAT_EXTRNL  0x00000010  // EDBGRQ asserted
N#define NVIC_DEBUG_STAT_VCATCH  0x00000008  // Vector catch
N#define NVIC_DEBUG_STAT_DWTTRAP 0x00000004  // DWT match
N#define NVIC_DEBUG_STAT_BKPT    0x00000002  // Breakpoint instruction
N#define NVIC_DEBUG_STAT_HALTED  0x00000001  // Halt request
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MM_ADDR register.
N//
N//*****************************************************************************
N#define NVIC_MM_ADDR_M          0xFFFFFFFF  // Fault Address
N#define NVIC_MM_ADDR_S          0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_FAULT_ADDR
N// register.
N//
N//*****************************************************************************
N#define NVIC_FAULT_ADDR_M       0xFFFFFFFF  // Fault Address
N#define NVIC_FAULT_ADDR_S       0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_CPAC register.
N//
N//*****************************************************************************
N#define NVIC_CPAC_CP11_M        0x00C00000  // CP11 Coprocessor Access
N                                            // Privilege
N#define NVIC_CPAC_CP11_DIS      0x00000000  // Access Denied
N#define NVIC_CPAC_CP11_PRIV     0x00400000  // Privileged Access Only
N#define NVIC_CPAC_CP11_FULL     0x00C00000  // Full Access
N#define NVIC_CPAC_CP10_M        0x00300000  // CP10 Coprocessor Access
N                                            // Privilege
N#define NVIC_CPAC_CP10_DIS      0x00000000  // Access Denied
N#define NVIC_CPAC_CP10_PRIV     0x00100000  // Privileged Access Only
N#define NVIC_CPAC_CP10_FULL     0x00300000  // Full Access
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_TYPE register.
N//
N//*****************************************************************************
N#define NVIC_MPU_TYPE_IREGION_M 0x00FF0000  // Number of I Regions
N#define NVIC_MPU_TYPE_DREGION_M 0x0000FF00  // Number of D Regions
N#define NVIC_MPU_TYPE_SEPARATE  0x00000001  // Separate or Unified MPU
N#define NVIC_MPU_TYPE_IREGION_S 16
N#define NVIC_MPU_TYPE_DREGION_S 8
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_MPU_CTRL_PRIVDEFEN 0x00000004  // MPU Default Region
N#define NVIC_MPU_CTRL_HFNMIENA  0x00000002  // MPU Enabled During Faults
N#define NVIC_MPU_CTRL_ENABLE    0x00000001  // MPU Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_NUMBER
N// register.
N//
N//*****************************************************************************
N#define NVIC_MPU_NUMBER_M       0x00000007  // MPU Region to Access
N#define NVIC_MPU_NUMBER_S       0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_BASE register.
N//
N//*****************************************************************************
N#define NVIC_MPU_BASE_ADDR_M    0xFFFFFFE0  // Base Address Mask
N#define NVIC_MPU_BASE_VALID     0x00000010  // Region Number Valid
N#define NVIC_MPU_BASE_REGION_M  0x00000007  // Region Number
N#define NVIC_MPU_BASE_ADDR_S    5
N#define NVIC_MPU_BASE_REGION_S  0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_ATTR register.
N//
N//*****************************************************************************
N#define NVIC_MPU_ATTR_XN        0x10000000  // Instruction Access Disable
N#define NVIC_MPU_ATTR_AP_M      0x07000000  // Access Privilege
N#define NVIC_MPU_ATTR_AP_NO_NO  0x00000000  // prv: no access, usr: no access
N#define NVIC_MPU_ATTR_AP_RW_NO  0x01000000  // prv: rw, usr: none
N#define NVIC_MPU_ATTR_AP_RW_RO  0x02000000  // prv: rw, usr: read-only
N#define NVIC_MPU_ATTR_AP_RW_RW  0x03000000  // prv: rw, usr: rw
N#define NVIC_MPU_ATTR_AP_RO_NO  0x05000000  // prv: ro, usr: none
N#define NVIC_MPU_ATTR_AP_RO_RO  0x06000000  // prv: ro, usr: ro
N#define NVIC_MPU_ATTR_TEX_M     0x00380000  // Type Extension Mask
N#define NVIC_MPU_ATTR_SHAREABLE 0x00040000  // Shareable
N#define NVIC_MPU_ATTR_CACHEABLE 0x00020000  // Cacheable
N#define NVIC_MPU_ATTR_BUFFRABLE 0x00010000  // Bufferable
N#define NVIC_MPU_ATTR_SRD_M     0x0000FF00  // Subregion Disable Bits
N#define NVIC_MPU_ATTR_SRD_0     0x00000100  // Sub-region 0 disable
N#define NVIC_MPU_ATTR_SRD_1     0x00000200  // Sub-region 1 disable
N#define NVIC_MPU_ATTR_SRD_2     0x00000400  // Sub-region 2 disable
N#define NVIC_MPU_ATTR_SRD_3     0x00000800  // Sub-region 3 disable
N#define NVIC_MPU_ATTR_SRD_4     0x00001000  // Sub-region 4 disable
N#define NVIC_MPU_ATTR_SRD_5     0x00002000  // Sub-region 5 disable
N#define NVIC_MPU_ATTR_SRD_6     0x00004000  // Sub-region 6 disable
N#define NVIC_MPU_ATTR_SRD_7     0x00008000  // Sub-region 7 disable
N#define NVIC_MPU_ATTR_SIZE_M    0x0000003E  // Region Size Mask
N#define NVIC_MPU_ATTR_SIZE_32B  0x00000008  // Region size 32 bytes
N#define NVIC_MPU_ATTR_SIZE_64B  0x0000000A  // Region size 64 bytes
N#define NVIC_MPU_ATTR_SIZE_128B 0x0000000C  // Region size 128 bytes
N#define NVIC_MPU_ATTR_SIZE_256B 0x0000000E  // Region size 256 bytes
N#define NVIC_MPU_ATTR_SIZE_512B 0x00000010  // Region size 512 bytes
N#define NVIC_MPU_ATTR_SIZE_1K   0x00000012  // Region size 1 Kbytes
N#define NVIC_MPU_ATTR_SIZE_2K   0x00000014  // Region size 2 Kbytes
N#define NVIC_MPU_ATTR_SIZE_4K   0x00000016  // Region size 4 Kbytes
N#define NVIC_MPU_ATTR_SIZE_8K   0x00000018  // Region size 8 Kbytes
N#define NVIC_MPU_ATTR_SIZE_16K  0x0000001A  // Region size 16 Kbytes
N#define NVIC_MPU_ATTR_SIZE_32K  0x0000001C  // Region size 32 Kbytes
N#define NVIC_MPU_ATTR_SIZE_64K  0x0000001E  // Region size 64 Kbytes
N#define NVIC_MPU_ATTR_SIZE_128K 0x00000020  // Region size 128 Kbytes
N#define NVIC_MPU_ATTR_SIZE_256K 0x00000022  // Region size 256 Kbytes
N#define NVIC_MPU_ATTR_SIZE_512K 0x00000024  // Region size 512 Kbytes
N#define NVIC_MPU_ATTR_SIZE_1M   0x00000026  // Region size 1 Mbytes
N#define NVIC_MPU_ATTR_SIZE_2M   0x00000028  // Region size 2 Mbytes
N#define NVIC_MPU_ATTR_SIZE_4M   0x0000002A  // Region size 4 Mbytes
N#define NVIC_MPU_ATTR_SIZE_8M   0x0000002C  // Region size 8 Mbytes
N#define NVIC_MPU_ATTR_SIZE_16M  0x0000002E  // Region size 16 Mbytes
N#define NVIC_MPU_ATTR_SIZE_32M  0x00000030  // Region size 32 Mbytes
N#define NVIC_MPU_ATTR_SIZE_64M  0x00000032  // Region size 64 Mbytes
N#define NVIC_MPU_ATTR_SIZE_128M 0x00000034  // Region size 128 Mbytes
N#define NVIC_MPU_ATTR_SIZE_256M 0x00000036  // Region size 256 Mbytes
N#define NVIC_MPU_ATTR_SIZE_512M 0x00000038  // Region size 512 Mbytes
N#define NVIC_MPU_ATTR_SIZE_1G   0x0000003A  // Region size 1 Gbytes
N#define NVIC_MPU_ATTR_SIZE_2G   0x0000003C  // Region size 2 Gbytes
N#define NVIC_MPU_ATTR_SIZE_4G   0x0000003E  // Region size 4 Gbytes
N#define NVIC_MPU_ATTR_ENABLE    0x00000001  // Region Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_BASE1 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_BASE1_ADDR_M   0xFFFFFFE0  // Base Address Mask
N#define NVIC_MPU_BASE1_VALID    0x00000010  // Region Number Valid
N#define NVIC_MPU_BASE1_REGION_M 0x00000007  // Region Number
N#define NVIC_MPU_BASE1_ADDR_S   5
N#define NVIC_MPU_BASE1_REGION_S 0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_ATTR1 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_ATTR1_XN       0x10000000  // Instruction Access Disable
N#define NVIC_MPU_ATTR1_AP_M     0x07000000  // Access Privilege
N#define NVIC_MPU_ATTR1_TEX_M    0x00380000  // Type Extension Mask
N#define NVIC_MPU_ATTR1_SHAREABLE                                              \
N                                0x00040000  // Shareable
X#define NVIC_MPU_ATTR1_SHAREABLE                                                                              0x00040000  
N#define NVIC_MPU_ATTR1_CACHEABLE                                              \
N                                0x00020000  // Cacheable
X#define NVIC_MPU_ATTR1_CACHEABLE                                                                              0x00020000  
N#define NVIC_MPU_ATTR1_BUFFRABLE                                              \
N                                0x00010000  // Bufferable
X#define NVIC_MPU_ATTR1_BUFFRABLE                                                                              0x00010000  
N#define NVIC_MPU_ATTR1_SRD_M    0x0000FF00  // Subregion Disable Bits
N#define NVIC_MPU_ATTR1_SIZE_M   0x0000003E  // Region Size Mask
N#define NVIC_MPU_ATTR1_ENABLE   0x00000001  // Region Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_BASE2 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_BASE2_ADDR_M   0xFFFFFFE0  // Base Address Mask
N#define NVIC_MPU_BASE2_VALID    0x00000010  // Region Number Valid
N#define NVIC_MPU_BASE2_REGION_M 0x00000007  // Region Number
N#define NVIC_MPU_BASE2_ADDR_S   5
N#define NVIC_MPU_BASE2_REGION_S 0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_ATTR2 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_ATTR2_XN       0x10000000  // Instruction Access Disable
N#define NVIC_MPU_ATTR2_AP_M     0x07000000  // Access Privilege
N#define NVIC_MPU_ATTR2_TEX_M    0x00380000  // Type Extension Mask
N#define NVIC_MPU_ATTR2_SHAREABLE                                              \
N                                0x00040000  // Shareable
X#define NVIC_MPU_ATTR2_SHAREABLE                                                                              0x00040000  
N#define NVIC_MPU_ATTR2_CACHEABLE                                              \
N                                0x00020000  // Cacheable
X#define NVIC_MPU_ATTR2_CACHEABLE                                                                              0x00020000  
N#define NVIC_MPU_ATTR2_BUFFRABLE                                              \
N                                0x00010000  // Bufferable
X#define NVIC_MPU_ATTR2_BUFFRABLE                                                                              0x00010000  
N#define NVIC_MPU_ATTR2_SRD_M    0x0000FF00  // Subregion Disable Bits
N#define NVIC_MPU_ATTR2_SIZE_M   0x0000003E  // Region Size Mask
N#define NVIC_MPU_ATTR2_ENABLE   0x00000001  // Region Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_BASE3 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_BASE3_ADDR_M   0xFFFFFFE0  // Base Address Mask
N#define NVIC_MPU_BASE3_VALID    0x00000010  // Region Number Valid
N#define NVIC_MPU_BASE3_REGION_M 0x00000007  // Region Number
N#define NVIC_MPU_BASE3_ADDR_S   5
N#define NVIC_MPU_BASE3_REGION_S 0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_MPU_ATTR3 register.
N//
N//*****************************************************************************
N#define NVIC_MPU_ATTR3_XN       0x10000000  // Instruction Access Disable
N#define NVIC_MPU_ATTR3_AP_M     0x07000000  // Access Privilege
N#define NVIC_MPU_ATTR3_TEX_M    0x00380000  // Type Extension Mask
N#define NVIC_MPU_ATTR3_SHAREABLE                                              \
N                                0x00040000  // Shareable
X#define NVIC_MPU_ATTR3_SHAREABLE                                                                              0x00040000  
N#define NVIC_MPU_ATTR3_CACHEABLE                                              \
N                                0x00020000  // Cacheable
X#define NVIC_MPU_ATTR3_CACHEABLE                                                                              0x00020000  
N#define NVIC_MPU_ATTR3_BUFFRABLE                                              \
N                                0x00010000  // Bufferable
X#define NVIC_MPU_ATTR3_BUFFRABLE                                                                              0x00010000  
N#define NVIC_MPU_ATTR3_SRD_M    0x0000FF00  // Subregion Disable Bits
N#define NVIC_MPU_ATTR3_SIZE_M   0x0000003E  // Region Size Mask
N#define NVIC_MPU_ATTR3_ENABLE   0x00000001  // Region Enable
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DBG_CTRL register.
N//
N//*****************************************************************************
N#define NVIC_DBG_CTRL_DBGKEY_M  0xFFFF0000  // Debug key mask
N#define NVIC_DBG_CTRL_DBGKEY    0xA05F0000  // Debug key
N#define NVIC_DBG_CTRL_S_RESET_ST                                              \
N                                0x02000000  // Core has reset since last read
X#define NVIC_DBG_CTRL_S_RESET_ST                                                                              0x02000000  
N#define NVIC_DBG_CTRL_S_RETIRE_ST                                             \
N                                0x01000000  // Core has executed insruction
X#define NVIC_DBG_CTRL_S_RETIRE_ST                                                                             0x01000000  
N                                            // since last read
N#define NVIC_DBG_CTRL_S_LOCKUP  0x00080000  // Core is locked up
N#define NVIC_DBG_CTRL_S_SLEEP   0x00040000  // Core is sleeping
N#define NVIC_DBG_CTRL_S_HALT    0x00020000  // Core status on halt
N#define NVIC_DBG_CTRL_S_REGRDY  0x00010000  // Register read/write available
N#define NVIC_DBG_CTRL_C_SNAPSTALL                                             \
N                                0x00000020  // Breaks a stalled load/store
X#define NVIC_DBG_CTRL_C_SNAPSTALL                                                                             0x00000020  
N#define NVIC_DBG_CTRL_C_MASKINT 0x00000008  // Mask interrupts when stepping
N#define NVIC_DBG_CTRL_C_STEP    0x00000004  // Step the core
N#define NVIC_DBG_CTRL_C_HALT    0x00000002  // Halt the core
N#define NVIC_DBG_CTRL_C_DEBUGEN 0x00000001  // Enable debug
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DBG_XFER register.
N//
N//*****************************************************************************
N#define NVIC_DBG_XFER_REG_WNR   0x00010000  // Write or not read
N#define NVIC_DBG_XFER_REG_SEL_M 0x0000001F  // Register
N#define NVIC_DBG_XFER_REG_R0    0x00000000  // Register R0
N#define NVIC_DBG_XFER_REG_R1    0x00000001  // Register R1
N#define NVIC_DBG_XFER_REG_R2    0x00000002  // Register R2
N#define NVIC_DBG_XFER_REG_R3    0x00000003  // Register R3
N#define NVIC_DBG_XFER_REG_R4    0x00000004  // Register R4
N#define NVIC_DBG_XFER_REG_R5    0x00000005  // Register R5
N#define NVIC_DBG_XFER_REG_R6    0x00000006  // Register R6
N#define NVIC_DBG_XFER_REG_R7    0x00000007  // Register R7
N#define NVIC_DBG_XFER_REG_R8    0x00000008  // Register R8
N#define NVIC_DBG_XFER_REG_R9    0x00000009  // Register R9
N#define NVIC_DBG_XFER_REG_R10   0x0000000A  // Register R10
N#define NVIC_DBG_XFER_REG_R11   0x0000000B  // Register R11
N#define NVIC_DBG_XFER_REG_R12   0x0000000C  // Register R12
N#define NVIC_DBG_XFER_REG_R13   0x0000000D  // Register R13
N#define NVIC_DBG_XFER_REG_R14   0x0000000E  // Register R14
N#define NVIC_DBG_XFER_REG_R15   0x0000000F  // Register R15
N#define NVIC_DBG_XFER_REG_FLAGS 0x00000010  // xPSR/Flags register
N#define NVIC_DBG_XFER_REG_MSP   0x00000011  // Main SP
N#define NVIC_DBG_XFER_REG_PSP   0x00000012  // Process SP
N#define NVIC_DBG_XFER_REG_DSP   0x00000013  // Deep SP
N#define NVIC_DBG_XFER_REG_CFBP  0x00000014  // Control/Fault/BasePri/PriMask
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DBG_DATA register.
N//
N//*****************************************************************************
N#define NVIC_DBG_DATA_M         0xFFFFFFFF  // Data temporary cache
N#define NVIC_DBG_DATA_S         0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_DBG_INT register.
N//
N//*****************************************************************************
N#define NVIC_DBG_INT_HARDERR    0x00000400  // Debug trap on hard fault
N#define NVIC_DBG_INT_INTERR     0x00000200  // Debug trap on interrupt errors
N#define NVIC_DBG_INT_BUSERR     0x00000100  // Debug trap on bus error
N#define NVIC_DBG_INT_STATERR    0x00000080  // Debug trap on usage fault state
N#define NVIC_DBG_INT_CHKERR     0x00000040  // Debug trap on usage fault check
N#define NVIC_DBG_INT_NOCPERR    0x00000020  // Debug trap on coprocessor error
N#define NVIC_DBG_INT_MMERR      0x00000010  // Debug trap on mem manage fault
N#define NVIC_DBG_INT_RESET      0x00000008  // Core reset status
N#define NVIC_DBG_INT_RSTPENDCLR 0x00000004  // Clear pending core reset
N#define NVIC_DBG_INT_RSTPENDING 0x00000002  // Core reset is pending
N#define NVIC_DBG_INT_RSTVCATCH  0x00000001  // Reset vector catch
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_SW_TRIG register.
N//
N//*****************************************************************************
N#define NVIC_SW_TRIG_INTID_M    0x000000FF  // Interrupt ID
N#define NVIC_SW_TRIG_INTID_S    0
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_FPCC register.
N//
N//*****************************************************************************
N#define NVIC_FPCC_ASPEN         0x80000000  // Automatic State Preservation
N                                            // Enable
N#define NVIC_FPCC_LSPEN         0x40000000  // Lazy State Preservation Enable
N#define NVIC_FPCC_MONRDY        0x00000100  // Monitor Ready
N#define NVIC_FPCC_BFRDY         0x00000040  // Bus Fault Ready
N#define NVIC_FPCC_MMRDY         0x00000020  // Memory Management Fault Ready
N#define NVIC_FPCC_HFRDY         0x00000010  // Hard Fault Ready
N#define NVIC_FPCC_THREAD        0x00000008  // Thread Mode
N#define NVIC_FPCC_USER          0x00000002  // User Privilege Level
N#define NVIC_FPCC_LSPACT        0x00000001  // Lazy State Preservation Active
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_FPCA register.
N//
N//*****************************************************************************
N#define NVIC_FPCA_ADDRESS_M     0xFFFFFFF8  // Address
N#define NVIC_FPCA_ADDRESS_S     3
N
N//*****************************************************************************
N//
N// The following are defines for the bit fields in the NVIC_FPDSC register.
N//
N//*****************************************************************************
N#define NVIC_FPDSC_AHP          0x04000000  // AHP Bit Default
N#define NVIC_FPDSC_DN           0x02000000  // DN Bit Default
N#define NVIC_FPDSC_FZ           0x01000000  // FZ Bit Default
N#define NVIC_FPDSC_RMODE_M      0x00C00000  // RMODE Bit Default
N#define NVIC_FPDSC_RMODE_RN     0x00000000  // Round to Nearest (RN) mode
N#define NVIC_FPDSC_RMODE_RP     0x00400000  // Round towards Plus Infinity (RP)
N                                            // mode
N#define NVIC_FPDSC_RMODE_RM     0x00800000  // Round towards Minus Infinity
N                                            // (RM) mode
N#define NVIC_FPDSC_RMODE_RZ     0x00C00000  // Round towards Zero (RZ) mode
N
N#endif // __HW_NVIC_H__
L 27 "../startup_ccs.c" 2
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
L 28 "../startup_ccs.c" 2
N
N//*****************************************************************************
N//
N// Forward declaration of the default fault handlers.
N//
N//*****************************************************************************
Nvoid ResetISR(void);
Nstatic void NmiSR(void);
Nstatic void FaultISR(void);
Nstatic void IntDefaultHandler(void);
N
N//*****************************************************************************
N//
N// External declaration for the reset handler that is to be called when the
N// processor is started
N//
N//*****************************************************************************
Nextern void _c_int00(void);
N
N//*****************************************************************************
N//
N// Linker variable that marks the top of the stack.
N//
N//*****************************************************************************
Nextern uint32_t __STACK_TOP;
N
N//*****************************************************************************
N//
N// The vector table.  Note that the proper constructs must be placed on this to
N// ensure that it ends up at physical address 0x0000.0000 or at the start of
N// the program if located at a start address other than 0.
N//
N//*****************************************************************************
N//#pragma DATA_SECTION(g_pfnVectors, ".intvecs")
N//void (* const g_pfnVectors[])(void) =
N//{
N//    (void (*)(void))((uint32_t)&__STACK_TOP),
N//                                            // The initial stack pointer
N//    ResetISR,                               // The reset handler
N//    NmiSR,                                  // The NMI handler
N//    FaultISR,                               // The hard fault handler
N//    IntDefaultHandler,                      // The MPU fault handler
N//    IntDefaultHandler,                      // The bus fault handler
N//    IntDefaultHandler,                      // The usage fault handler
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // SVCall handler
N//    IntDefaultHandler,                      // Debug monitor handler
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // The PendSV handler
N//    IntDefaultHandler,                      // The SysTick handler
N//    IntDefaultHandler,                      // GPIO Port A
N//    IntDefaultHandler,                      // GPIO Port B
N//    IntDefaultHandler,                      // GPIO Port C
N//    IntDefaultHandler,                      // GPIO Port D
N//    IntDefaultHandler,                      // GPIO Port E
N//    IntDefaultHandler,                      // UART0 Rx and Tx
N//    IntDefaultHandler,                      // UART1 Rx and Tx
N//    IntDefaultHandler,                      // SSI0 Rx and Tx
N//    IntDefaultHandler,                      // I2C0 Master and Slave
N//    IntDefaultHandler,                      // PWM Fault
N//    IntDefaultHandler,                      // PWM Generator 0
N//    IntDefaultHandler,                      // PWM Generator 1
N//    IntDefaultHandler,                      // PWM Generator 2
N//    IntDefaultHandler,                      // Quadrature Encoder 0
N//    IntDefaultHandler,                      // ADC Sequence 0
N//    IntDefaultHandler,                      // ADC Sequence 1
N//    IntDefaultHandler,                      // ADC Sequence 2
N//    IntDefaultHandler,                      // ADC Sequence 3
N//    IntDefaultHandler,                      // Watchdog timer
N//    IntDefaultHandler,                      // Timer 0 subtimer A
N//    IntDefaultHandler,                      // Timer 0 subtimer B
N//    IntDefaultHandler,                      // Timer 1 subtimer A
N//    IntDefaultHandler,                      // Timer 1 subtimer B
N//    IntDefaultHandler,                      // Timer 2 subtimer A
N//    IntDefaultHandler,                      // Timer 2 subtimer B
N//    IntDefaultHandler,                      // Analog Comparator 0
N//    IntDefaultHandler,                      // Analog Comparator 1
N//    IntDefaultHandler,                      // Analog Comparator 2
N//    IntDefaultHandler,                      // System Control (PLL, OSC, BO)
N//    IntDefaultHandler,                      // FLASH Control
N//    IntDefaultHandler,                      // GPIO Port F
N//    IntDefaultHandler,                      // GPIO Port G
N//    IntDefaultHandler,                      // GPIO Port H
N//    IntDefaultHandler,                      // UART2 Rx and Tx
N//    IntDefaultHandler,                      // SSI1 Rx and Tx
N//    IntDefaultHandler,                      // Timer 3 subtimer A
N//    IntDefaultHandler,                      // Timer 3 subtimer B
N//    IntDefaultHandler,                      // I2C1 Master and Slave
N//    IntDefaultHandler,                      // Quadrature Encoder 1
N//    IntDefaultHandler,                      // CAN0
N//    IntDefaultHandler,                      // CAN1
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // Hibernate
N//    IntDefaultHandler,                      // USB0
N//    IntDefaultHandler,                      // PWM Generator 3
N//    IntDefaultHandler,                      // uDMA Software Transfer
N//    IntDefaultHandler,                      // uDMA Error
N//    IntDefaultHandler,                      // ADC1 Sequence 0
N//    IntDefaultHandler,                      // ADC1 Sequence 1
N//    IntDefaultHandler,                      // ADC1 Sequence 2
N//    IntDefaultHandler,                      // ADC1 Sequence 3
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // GPIO Port J
N//    IntDefaultHandler,                      // GPIO Port K
N//    IntDefaultHandler,                      // GPIO Port L
N//    IntDefaultHandler,                      // SSI2 Rx and Tx
N//    IntDefaultHandler,                      // SSI3 Rx and Tx
N//    IntDefaultHandler,                      // UART3 Rx and Tx
N//    IntDefaultHandler,                      // UART4 Rx and Tx
N//    IntDefaultHandler,                      // UART5 Rx and Tx
N//    IntDefaultHandler,                      // UART6 Rx and Tx
N//    IntDefaultHandler,                      // UART7 Rx and Tx
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // I2C2 Master and Slave
N//    IntDefaultHandler,                      // I2C3 Master and Slave
N//    IntDefaultHandler,                      // Timer 4 subtimer A
N//    IntDefaultHandler,                      // Timer 4 subtimer B
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // Timer 5 subtimer A
N//    IntDefaultHandler,                      // Timer 5 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 0 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 0 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 1 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 1 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 2 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 2 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 3 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 3 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 4 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 4 subtimer B
N//    IntDefaultHandler,                      // Wide Timer 5 subtimer A
N//    IntDefaultHandler,                      // Wide Timer 5 subtimer B
N//    IntDefaultHandler,                      // FPU
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // I2C4 Master and Slave
N//    IntDefaultHandler,                      // I2C5 Master and Slave
N//    IntDefaultHandler,                      // GPIO Port M
N//    IntDefaultHandler,                      // GPIO Port N
N//    IntDefaultHandler,                      // Quadrature Encoder 2
N//    0,                                      // Reserved
N//    0,                                      // Reserved
N//    IntDefaultHandler,                      // GPIO Port P (Summary or P0)
N//    IntDefaultHandler,                      // GPIO Port P1
N//    IntDefaultHandler,                      // GPIO Port P2
N//    IntDefaultHandler,                      // GPIO Port P3
N//    IntDefaultHandler,                      // GPIO Port P4
N//    IntDefaultHandler,                      // GPIO Port P5
N//    IntDefaultHandler,                      // GPIO Port P6
N//    IntDefaultHandler,                      // GPIO Port P7
N//    IntDefaultHandler,                      // GPIO Port Q (Summary or Q0)
N//    IntDefaultHandler,                      // GPIO Port Q1
N//    IntDefaultHandler,                      // GPIO Port Q2
N//    IntDefaultHandler,                      // GPIO Port Q3
N//    IntDefaultHandler,                      // GPIO Port Q4
N//    IntDefaultHandler,                      // GPIO Port Q5
N//    IntDefaultHandler,                      // GPIO Port Q6
N//    IntDefaultHandler,                      // GPIO Port Q7
N//    IntDefaultHandler,                      // GPIO Port R
N//    IntDefaultHandler,                      // GPIO Port S
N//    IntDefaultHandler,                      // PWM 1 Generator 0
N//    IntDefaultHandler,                      // PWM 1 Generator 1
N//    IntDefaultHandler,                      // PWM 1 Generator 2
N//    IntDefaultHandler,                      // PWM 1 Generator 3
N//    IntDefaultHandler                       // PWM 1 Fault
N//};
N
N//*****************************************************************************
N//
N// This is the code that gets called when the processor first starts execution
N// following a reset event.  Only the absolutely necessary set is performed,
N// after which the application supplied entry() routine is called.  Any fancy
N// actions (such as making decisions based on the reset cause register, and
N// resetting the bits in that register) are left solely in the hands of the
N// application.
N//
N////*****************************************************************************
N//void
N//ResetISR(void)
N//{
N//    //
N//    // Jump to the CCS C initialization routine.  This will enable the
N//    // floating-point unit as well, so that does not need to be done here.
N//    //
N//    __asm("    .global _c_int00\n"
N//          "    b.w     _c_int00");
N//}
N
N//*****************************************************************************
N//
N// This is the code that gets called when the processor receives a NMI.  This
N// simply enters an infinite loop, preserving the system state for examination
N// by a debugger.
N//
N//*****************************************************************************
Nstatic void
NNmiSR(void)
N{
N    //
N    // Enter an infinite loop.
N    //
N    while(1)
N    {
N    }
N}
N
N//*****************************************************************************
N//
N// This is the code that gets called when the processor receives a fault
N// interrupt.  This simply enters an infinite loop, preserving the system state
N// for examination by a debugger.
N//
N//*****************************************************************************
Nstatic void
NFaultISR(void)
N{
N    //
N    // Enter an infinite loop.
N    //
N    while(1)
N    {
N    }
R "../startup_ccs.c" 274 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
N
N//*****************************************************************************
N//
N// This is the code that gets called when the processor receives an unexpected
N// interrupt.  This simply enters an infinite loop, preserving the system state
N// for examination by a debugger.
N//
N//*****************************************************************************
Nstatic void
NIntDefaultHandler(void)
N{
N    //
N    // Go into an infinite loop.
N    //
N    while(1)
N    {
N    }
R "../startup_ccs.c" 292 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
W "../startup_ccs.c" 251 1 function "NmiSR" was declared but never referenced
W "../startup_ccs.c" 269 1 function "FaultISR" was declared but never referenced
W "../startup_ccs.c" 287 1 function "IntDefaultHandler" was declared but never referenced
