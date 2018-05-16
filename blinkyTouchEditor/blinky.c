#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
//#include <URTouch.h>
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

#include "inc/hw_gpio.h"
#include "inc/hw_ssi.h"
#include "inc/hw_types.h"
#include "driverlib/ssi.h"




#define RED_LED    GPIO_PIN_1
#define BLUE_LED   GPIO_PIN_2
#define GREEN_LED  GPIO_PIN_3
#define ALL_LEDS RED_LED|BLUE_LED|GREEN_LED


#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};


#include "ssd1289.h"
#include "XPT2046.h"


char* itoa(int i, char b[]){
    char const digit[] = "0123456789";
    char* p = b;
    if(i<0){
        *p++ = '-';
        i *= -1;
    }
    int shifter = i;
    do{ //Move to where representation ends
        ++p;
        shifter = shifter/10;
    }while(shifter);
    *p = '\0';
    do{ //Move back, inserting digits as u go
        *--p = digit[i%10];
        i = i/10;
    }while(i);
    return b;
}

int
main(void)
{
    SysCtlClockSet(SYSCTL_SYSDIV_4|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
     //ROM_SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);SysCtlDelay (10);

     SYSENABLE(SYSCTL_PERIPH_GPIOF);
     SYSENABLE(SYSCTL_PERIPH_GPIOB);
     SYSENABLE(SYSCTL_PERIPH_GPIOC);
     SYSENABLE(SYSCTL_PERIPH_GPIOE);
     SYSENABLE(SYSCTL_PERIPH_GPIOD);

     ROM_FPULazyStackingEnable();
     ROM_FPUEnable();


     // black magic: unlock PD7
     HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
     HWREG(GPIO_PORTD_BASE + GPIO_O_CR) |= 0x80;
     HWREG(GPIO_PORTD_BASE + GPIO_O_AFSEL) &= ~0x80;
     HWREG(GPIO_PORTD_BASE + GPIO_O_DEN) |= 0x80;
     HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = 0;


     // black magic: unlock PF0
     HWREG(GPIO_PORTF_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
     HWREG(GPIO_PORTF_BASE + GPIO_O_CR) |= 0x01;
     HWREG(GPIO_PORTF_BASE + GPIO_O_AFSEL) |= 0x400;
     HWREG(GPIO_PORTF_BASE + GPIO_O_DEN) |= 0x01;
     HWREG(GPIO_PORTF_BASE + GPIO_O_LOCK) = 0;


     GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, 0xFF);
     GPIOPinTypeGPIOOutput(GPIO_PORTC_BASE, 0xF0);
     GPIOPinTypeGPIOOutput(GPIO_PORTE_BASE,  0x3F);
     GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,  ALL_LEDS |GPIO_PIN_0);
     GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE,  GPIO_PIN_6 | GPIO_PIN_7 | GPIO_PIN_1);


     LCD_init();

     LCD_fillScr(0x00,0x00,0x00);

     setColor(0xff, 0xff, 0xff);

     Touch_init(0,0,0);
     Touch_prepare();

     int x = 0, prev_x = 0;
     int y = 0, prev_y = 0;

     float xtox = 0.1787709;//320/1790;
     float ytoy = 0.1325966;//0.123711;//240/1790;

         while(1)
        {
             Touch_getxy( &y, &x);
//             SysCtlDelay(SysCtlClockGet() / 10 / 3);
             char str[100];


//                  ssd1289_string(1,itoa(x,str),0,40);
//                  ssd1289_string(1,itoa(y,str),0,60);

//                  LCD_fillScr(0x00,0x00,0x00);

                  int temp_x = (float)x * xtox;
                  int temp_y = (float)y * ytoy;

                  temp_x = 345 - temp_x;
                  temp_y = temp_y > 15 ? temp_y - 15 : temp_y;

                  if( abs(temp_x - prev_x) < 1 && abs(temp_y - prev_y) < 1 ) {
                      drawPixel(temp_x, temp_y);
                  }

                  prev_x = temp_x;
                  prev_y = temp_y;

        }

}




