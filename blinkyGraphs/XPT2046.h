/*
 * XPT2046.h
 *
 *  Created on: 15 џэт. 2017 у.
 *      Author: Dima
 */

#ifndef XPT2046_H_
#define XPT2046_H_


#include <stdint.h>
#include <stdbool.h>


#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_nvic.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/systick.h"


#include "inc/hw_ssi.h"
#include "inc/hw_types.h"
#include "driverlib/ssi.h"



void Touch_init(uint16_t* x,uint16_t* y,uint16_t* intcounter);
void Touch_getxy( uint16_t *x,uint16_t *y);
void Touch_prepare();

#endif /* XPT2046_H_ */
