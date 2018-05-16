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


const int Y_MAX = 235, X_MAX = 320;
int actual_y = Y_MAX/2, ball_x = X_MAX /2, ball_y = Y_MAX /2;
int line_height = 40, line_width = 5, ball_speed = 4, ball_width = 10;
int gameEnd = 0;

int vector_x = -1, vector_y = 1; // 1 from left -> right; -1 for right <- left

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

void endGame(){
    gameEnd = 1;

    int i = 20, j = 0;
    for(; i < X_MAX - 90; i+=35)
        for(j = 20; j < Y_MAX - 20; j+= 12){
            setColor(rand() % (255 + 1 - 0) + 0, rand() % (255 + 1 - 0) + 0, rand() % (255 + 1 - 0) + 0);
            ssd1289_string(1,"Game     End",i,j);
        }
}

void stepForBall() {
    int y_bottom = actual_y - (line_height /2);
    int y_top = actual_y + (line_height /2);

    // detect if ball near lines and is it reflected
    if( ( ball_x > (line_width - ball_speed) && ball_x < (line_width  + ball_speed) )|| ( (ball_x + ball_width ) > (X_MAX - line_width - ball_speed) && (ball_x + ball_width) < ( X_MAX - line_width  + ball_speed) ))
        if(ball_y >= (y_bottom - ball_width) && ball_y <= (y_top + ball_width) )
            vector_x *= -1;

    // detect if ball near horizontal end of screen
    if( ball_y < 0 || ball_y + ball_width > Y_MAX)
        vector_y *= -1;

    // detect if ball get out of vertical ends of screen
    if( ball_x < 0 || ball_x > X_MAX ){
        endGame();
        return;
    }


    ball_x = ball_x + ( vector_x * ball_speed);
    ball_y = ball_y + ( vector_y * ball_speed);
}

void drawBall(int show) { // show - 1 , hide - 0
    if( show )
        setColor(0xff,0xff,0xff);
    else
        setColor(0x00,0x00,0x00);

//    int i = ball_x - ball_width, j = ball_y - ball_width;
//    for(;i < ball_x + ball_width; i++ )
//        for(j = ball_y - ball_width; j < ball_y + ball_width; j++)
//            drawPixel(i, j);
    ssd1289_string(1,"0",ball_x, ball_y);

    setColor(0xff,0xff,0xff);
}

void drawLines(int y_step){
    int y_bottom = 0, y_top = 0;

    if ( actual_y != y_step){
        setColor(0x00,0x00,0x00);
        drawLines(actual_y); // hide previous line;
        setColor(0xff,0xff,0xff);
    }
    actual_y = y_step;

    y_bottom = actual_y - (line_height /2);
    y_top = actual_y + (line_height /2);

    if( y_bottom < 0 ){
        drawLine(line_width,y_bottom +  (line_height /2), line_width, y_top +  (line_height /2));
        drawLine(X_MAX - line_width,y_bottom +  (line_height /2), X_MAX - line_width, y_top +  (line_height /2));
    } else if (y_top > Y_MAX) {
        drawLine(line_width,y_bottom -  (line_height /2), line_width, y_top -  (line_height /2));
        drawLine(X_MAX - line_width,y_bottom -  (line_height /2), X_MAX - line_width, y_top -  (line_height /2));
    } else {
        drawLine(line_width,y_bottom, line_width, y_top);
        drawLine(X_MAX - line_width,y_bottom, X_MAX - line_width, y_top);
    }
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

     int y = 0, x = 0, prev_y = 0;

//     float xtox = 0.1787709;//320/1790;
     float ytoy = 0.1325966;//0.123711;//240/1790;

         while(1)
        {
             Touch_getxy( &y, &x);
             SysCtlDelay(9000 * 50);
//             char str[100];


//              ssd1289_string(1,itoa(x,str),0,40);
//              ssd1289_string(1,itoa(y,str),0,60);
////
//              LCD_fillScr(0x00,0x00,0x00);

              int temp_y = (float)y * ytoy;

              temp_y = temp_y > 15 ? temp_y - 15 : temp_y;

              if(prev_y != 0 && !gameEnd ){
                  drawLines(temp_y > 15 ? temp_y : prev_y);
                  drawBall(0);
                  stepForBall();
              }

              drawBall(1);

              prev_y = temp_y > 15 ? temp_y : prev_y;

        }

}




