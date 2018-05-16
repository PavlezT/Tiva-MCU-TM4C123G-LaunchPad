L 1 "../tm4c123gh6pm_startup_ccs.c"
N//*****************************************************************************
N//
N// Startup code for use with TI's Code Composer Studio.
N//
N// Copyright (c) 2011-2014 Texas Instruments Incorporated.  All rights reserved.
N// Software License Agreement
N// 
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
L 26 "../tm4c123gh6pm_startup_ccs.c" 2
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
N// External declarations for the interrupt handlers used by the application.
N//
N//*****************************************************************************
N// To be added by user
N
N//*****************************************************************************
N//
N// The vector table.  Note that the proper constructs must be placed on this to
N// ensure that it ends up at physical address 0x0000.0000 or at the start of
N// the program if located at a start address other than 0.
N//
N//*****************************************************************************
N#pragma DATA_SECTION(g_pfnVectors, ".intvecs")
Nvoid (* const g_pfnVectors[])(void) =
N{
N    (void (*)(void))((uint32_t)&__STACK_TOP),
N                                            // The initial stack pointer
N    ResetISR,                               // The reset handler
N    NmiSR,                                  // The NMI handler
N    FaultISR,                               // The hard fault handler
N    IntDefaultHandler,                      // The MPU fault handler
N    IntDefaultHandler,                      // The bus fault handler
N    IntDefaultHandler,                      // The usage fault handler
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // SVCall handler
N    IntDefaultHandler,                      // Debug monitor handler
N    0,                                      // Reserved
N    IntDefaultHandler,                      // The PendSV handler
N    IntDefaultHandler,                      // The SysTick handler
N    IntDefaultHandler,                      // GPIO Port A
N    IntDefaultHandler,                      // GPIO Port B
N    IntDefaultHandler,                      // GPIO Port C
N    IntDefaultHandler,                      // GPIO Port D
N    IntDefaultHandler,                      // GPIO Port E
N    IntDefaultHandler,                      // UART0 Rx and Tx
N    IntDefaultHandler,                      // UART1 Rx and Tx
N    IntDefaultHandler,                      // SSI0 Rx and Tx
N    IntDefaultHandler,                      // I2C0 Master and Slave
N    IntDefaultHandler,                      // PWM Fault
N    IntDefaultHandler,                      // PWM Generator 0
N    IntDefaultHandler,                      // PWM Generator 1
N    IntDefaultHandler,                      // PWM Generator 2
N    IntDefaultHandler,                      // Quadrature Encoder 0
N    IntDefaultHandler,                      // ADC Sequence 0
N    IntDefaultHandler,                      // ADC Sequence 1
N    IntDefaultHandler,                      // ADC Sequence 2
N    IntDefaultHandler,                      // ADC Sequence 3
N    IntDefaultHandler,                      // Watchdog timer
N    IntDefaultHandler,                      // Timer 0 subtimer A
N    IntDefaultHandler,                      // Timer 0 subtimer B
N    IntDefaultHandler,                      // Timer 1 subtimer A
N    IntDefaultHandler,                      // Timer 1 subtimer B
N    IntDefaultHandler,                      // Timer 2 subtimer A
N    IntDefaultHandler,                      // Timer 2 subtimer B
N    IntDefaultHandler,                      // Analog Comparator 0
N    IntDefaultHandler,                      // Analog Comparator 1
N    IntDefaultHandler,                      // Analog Comparator 2
N    IntDefaultHandler,                      // System Control (PLL, OSC, BO)
N    IntDefaultHandler,                      // FLASH Control
N    IntDefaultHandler,                      // GPIO Port F
N    IntDefaultHandler,                      // GPIO Port G
N    IntDefaultHandler,                      // GPIO Port H
N    IntDefaultHandler,                      // UART2 Rx and Tx
N    IntDefaultHandler,                      // SSI1 Rx and Tx
N    IntDefaultHandler,                      // Timer 3 subtimer A
N    IntDefaultHandler,                      // Timer 3 subtimer B
N    IntDefaultHandler,                      // I2C1 Master and Slave
N    IntDefaultHandler,                      // Quadrature Encoder 1
N    IntDefaultHandler,                      // CAN0
N    IntDefaultHandler,                      // CAN1
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // Hibernate
N    IntDefaultHandler,                      // USB0
N    IntDefaultHandler,                      // PWM Generator 3
N    IntDefaultHandler,                      // uDMA Software Transfer
N    IntDefaultHandler,                      // uDMA Error
N    IntDefaultHandler,                      // ADC1 Sequence 0
N    IntDefaultHandler,                      // ADC1 Sequence 1
N    IntDefaultHandler,                      // ADC1 Sequence 2
N    IntDefaultHandler,                      // ADC1 Sequence 3
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // GPIO Port J
N    IntDefaultHandler,                      // GPIO Port K
N    IntDefaultHandler,                      // GPIO Port L
N    IntDefaultHandler,                      // SSI2 Rx and Tx
N    IntDefaultHandler,                      // SSI3 Rx and Tx
N    IntDefaultHandler,                      // UART3 Rx and Tx
N    IntDefaultHandler,                      // UART4 Rx and Tx
N    IntDefaultHandler,                      // UART5 Rx and Tx
N    IntDefaultHandler,                      // UART6 Rx and Tx
N    IntDefaultHandler,                      // UART7 Rx and Tx
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // I2C2 Master and Slave
N    IntDefaultHandler,                      // I2C3 Master and Slave
N    IntDefaultHandler,                      // Timer 4 subtimer A
N    IntDefaultHandler,                      // Timer 4 subtimer B
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // Timer 5 subtimer A
N    IntDefaultHandler,                      // Timer 5 subtimer B
N    IntDefaultHandler,                      // Wide Timer 0 subtimer A
N    IntDefaultHandler,                      // Wide Timer 0 subtimer B
N    IntDefaultHandler,                      // Wide Timer 1 subtimer A
N    IntDefaultHandler,                      // Wide Timer 1 subtimer B
N    IntDefaultHandler,                      // Wide Timer 2 subtimer A
N    IntDefaultHandler,                      // Wide Timer 2 subtimer B
N    IntDefaultHandler,                      // Wide Timer 3 subtimer A
N    IntDefaultHandler,                      // Wide Timer 3 subtimer B
N    IntDefaultHandler,                      // Wide Timer 4 subtimer A
N    IntDefaultHandler,                      // Wide Timer 4 subtimer B
N    IntDefaultHandler,                      // Wide Timer 5 subtimer A
N    IntDefaultHandler,                      // Wide Timer 5 subtimer B
N    IntDefaultHandler,                      // FPU
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // I2C4 Master and Slave
N    IntDefaultHandler,                      // I2C5 Master and Slave
N    IntDefaultHandler,                      // GPIO Port M
N    IntDefaultHandler,                      // GPIO Port N
N    IntDefaultHandler,                      // Quadrature Encoder 2
N    0,                                      // Reserved
N    0,                                      // Reserved
N    IntDefaultHandler,                      // GPIO Port P (Summary or P0)
N    IntDefaultHandler,                      // GPIO Port P1
N    IntDefaultHandler,                      // GPIO Port P2
N    IntDefaultHandler,                      // GPIO Port P3
N    IntDefaultHandler,                      // GPIO Port P4
N    IntDefaultHandler,                      // GPIO Port P5
N    IntDefaultHandler,                      // GPIO Port P6
N    IntDefaultHandler,                      // GPIO Port P7
N    IntDefaultHandler,                      // GPIO Port Q (Summary or Q0)
N    IntDefaultHandler,                      // GPIO Port Q1
N    IntDefaultHandler,                      // GPIO Port Q2
N    IntDefaultHandler,                      // GPIO Port Q3
N    IntDefaultHandler,                      // GPIO Port Q4
N    IntDefaultHandler,                      // GPIO Port Q5
N    IntDefaultHandler,                      // GPIO Port Q6
N    IntDefaultHandler,                      // GPIO Port Q7
N    IntDefaultHandler,                      // GPIO Port R
N    IntDefaultHandler,                      // GPIO Port S
N    IntDefaultHandler,                      // PWM 1 Generator 0
N    IntDefaultHandler,                      // PWM 1 Generator 1
N    IntDefaultHandler,                      // PWM 1 Generator 2
N    IntDefaultHandler,                      // PWM 1 Generator 3
N    IntDefaultHandler                       // PWM 1 Fault
N};
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
N//*****************************************************************************
Nvoid
NResetISR(void)
N{
N    //
N    // Jump to the CCS C initialization routine.  This will enable the
N    // floating-point unit as well, so that does not need to be done here.
N    //
N    __asm("    .global _c_int00\n"
N          "    b.w     _c_int00");
N}
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
R "../tm4c123gh6pm_startup_ccs.c" 261 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
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
R "../tm4c123gh6pm_startup_ccs.c" 279 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
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
R "../tm4c123gh6pm_startup_ccs.c" 297 5 (ULP 2.1) Detected SW delay loop using empty loop. Recommend using a timer module instead
N}
