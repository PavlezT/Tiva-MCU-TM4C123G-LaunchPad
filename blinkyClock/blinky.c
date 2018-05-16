#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <time.h>

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

#define SUMM    1
#define MINUS   2
#define MULTIPLY  3
#define DIVIDE 4

#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};


#include "ssd1289.h"
#include "XPT2046.h"


typedef void (*function_call)(void);

typedef enum {
    Hours = 0,     /* 0: Successful */
    Minutes,      /* 1: R/W Error */
    Seconds,      /* 2: Write Protected */
} EditChoise;

struct Cell {
  int center_x;
  int center_y;
  int bounce_time;
  char *text;
  function_call callback;
};

struct Cell Cells[6];
int cells_length = 6, bounce_time = 150;

time_t actual_time;// = 0;
time_t current_time;

int editing = 0, stoped = 1;
int line_x, line_y, width;

EditChoise Switch = Hours;

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

void closeEditingMode() {
    editing = 0;

    setColor(0x00,0x00,0x00);
    drawLine(line_x,line_y,line_x + width, line_y);
    setColor(0xff,0xff,0xff);
}

void openEditMode() {
    editing = 1;

    line_x = line_x > 0 ? line_x : 157;
    line_y = 70;
    width = 15;

    setColor(0x00,0x00,0x00);
    drawLine(100,line_y,157+ width, line_y);
    setColor(0xff,0xff,0xff);
    drawLine(line_x,line_y,line_x + width, line_y);

}

void numberPlusPress(void){
    if( editing == 0)
        return;

    switch(Switch) {
       case Hours:
           actual_time+= 60*60;
            break;
       case Minutes:
           actual_time+=60;
           break;
       case Seconds:
           actual_time+=10;
           break;
       }
}


void numberMinusPress(void){
    if( editing == 0)
        return;

    switch(Switch) {
       case Hours:
           actual_time -= actual_time >= 60*60 ? 60*60  : 0;
            break;
       case Minutes:
           actual_time -= actual_time >= 60 ? 60 : 0;
           break;
       case Seconds:
           actual_time -= actual_time > 10 ? 10 : 0;
           break;
       }
}


void MoveLeft(void){
    if( editing == 0)
        return;

    switch(Switch) {
        case Minutes:
            Switch = Hours;
            line_x = 157;
            break;
        case Seconds:
            Switch = Minutes;
            line_x = 131;
            break;
        }
    openEditMode();
}


void MoveRight(void){
    if( editing == 0)
        return;

    switch(Switch) {
        case Hours:
            Switch = Minutes;
            line_x = 131;
            break;
        case Minutes:
            Switch = Seconds;
            line_x = 107;
            break;
        }
    openEditMode();
}


void SetPress(void){
    if( stoped == 0){
        stoped = 1; // stop working
        setColor(0x00,0x00,0x00);
        ssd1289_string(1," On",250,55);
        setColor(0xff, 0xff, 0xff);
    } else {
        stoped = 0; // start working
        setColor(0x00,0xff,0x00);
        ssd1289_string(1," On",250,55);
        setColor(0xff, 0xff, 0xff);
        closeEditingMode();
    }

}


void ClearPress(void){
    actual_time = 0;
    editing = 0;
    stoped = 1;
    setColor(0x00,0x00,0x00);
    ssd1289_string(1," On",250,55);
    setColor(0xff, 0xff, 0xff);
    closeEditingMode();
}


void fireAlarm(){
    if( stoped == 1){
        return;
    }

    LCD_fillScr(0xff,0x00,0x00);
    SysCtlDelay(100 * 1);
    LCD_fillScr(0x00,0x00,0x00);
    init_calc();
}

void init_cells(){
    Cells[0].center_x = 30;
    Cells[0].center_y = 110;
    Cells[0].text = "^";
    Cells[0].bounce_time = bounce_time;
    Cells[0].callback = numberPlusPress;

    Cells[1].center_x = 30;
    Cells[1].center_y = 170;
    Cells[1].text = "v";
    Cells[1].bounce_time = bounce_time;
    Cells[1].callback = numberMinusPress;

    Cells[2].center_x = 135;
    Cells[2].center_y = 110;
    Cells[2].text = "<";
    Cells[2].bounce_time = bounce_time;
    Cells[2].callback = MoveLeft;

    Cells[3].center_x = 135;
    Cells[3].center_y = 170;
    Cells[3].text = ">";
    Cells[3].bounce_time = bounce_time;
    Cells[3].callback = MoveRight;

    Cells[4].center_x = 250;
    Cells[4].center_y = 110;
    Cells[4].text = "set";
    Cells[4].bounce_time = bounce_time;
    Cells[4].callback = SetPress;

    Cells[5].center_x = 250;
    Cells[5].center_y = 170;
    Cells[5].text = "clear";
    Cells[5].bounce_time = -1;
    Cells[5].callback = ClearPress;
}

void init_calc(){
    int ytop = 40,x=53, y_step = 50;
    int x_step = 53;
    //horizontal lines
    drawLine(0,ytop,320,ytop);
    drawLine(x,ytop+y_step,310,ytop+y_step);
    drawLine(x,130,310,130);
    drawLine(x,150,310,150);
    drawLine(x,190,310,190);

    // vertival lines

    drawLine(x_step,  90  ,x_step,  240 - y_step);
    drawLine(x_step*2,90,x_step*2,240 - y_step);
    drawLine(165,90,165,240 - y_step);
    drawLine(205,90,205,240 - y_step);
    drawLine(310,90,310,240 - y_step);
    drawLine(310 - x_step,90, 310 - x_step,240 - y_step);

    //draw chars
    init_cells();

    int i = 0;
    for(; i < cells_length  - 2 ; i++){
        ssd1289_string(1,Cells[i].text,Cells[i].center_x,Cells[i].center_y);
    }
    for(; i < cells_length; i++){
        ssd1289_string(1,Cells[i].text,Cells[i].center_x - 25,Cells[i].center_y);
    }
}

void renderActualTime(){
    int from_x = 70, to_x = 262, from_y = 58,to_y = 66;

    setColor(0x00, 0x00, 0x00);
    for(;from_x < to_x; from_x++){
        drawLine(from_x,from_y,from_x,to_y);
    }
    setColor(0xff, 0xff, 0xff);

    ssd1289_string(1,asctime (localtime ( &actual_time )),60,55);
}

void renderClockTime(){
    int from_x = 120, to_x = 310, from_y = 18,to_y = 26;

    setColor(0x00, 0x00, 0x00);
    for(;from_x < to_x; from_x++){
        drawLine(from_x,from_y,from_x,to_y);
    }
    setColor(0xff, 0xff, 0xff);

    ssd1289_string(1,asctime (localtime ( &current_time )),10,15);
}

void refreshData(){
    renderActualTime();
    renderClockTime();
}

bool isClicked(struct Cell cell, int x, int y ){
    int diff = 20;
    return (cell.center_x - diff) < x && (cell.center_x + diff) > x && (cell.center_y - diff) < y & (cell.center_y + diff) > y;
}

void findClickedButton( int x, int y){
    int i = 0;
    for(; i < cells_length; i++){
        if( isClicked(Cells[i],x,y) ) {
            if( Cells[i].bounce_time <= 0){
                Cells[i].bounce_time = Cells[i].bounce_time == -1 ? -1 : bounce_time;
                Cells[i].callback();
            } else {
                Cells[i].bounce_time -= 1;
            }
            break;
        }
    }
}

int
main(void)
{
    SysCtlClockSet(SYSCTL_SYSDIV_4|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
//    ROM_SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);
//    SysCtlDelay (10);

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

     int x = 0;
     int y = 0;

     float xtox = 0.1787709;//320/1790;
     float ytoy = 0.1325966;//0.123711;//240/1790;

     init_calc();

     actual_time = 0;//24*60*60;
     current_time = 0;

     volatile int one_second = 0;

     while(1)
    {
          Touch_getxy( &y, &x);

          int temp_x = (float)x * xtox;
          int temp_y = (float)y * ytoy;
//          temp_x = 345 - temp_x;
          temp_x = temp_x - 25;
          temp_y = temp_y > 15 ? temp_y - 15 : temp_y;

          one_second++;
          if ( one_second >= 1000){
              current_time++;

              one_second = 0;
              refreshData();
          }

          if( stoped == 1 && editing == 0){
              openEditMode();
          }

          findClickedButton(temp_x, temp_y);

          if( actual_time == current_time && stoped == 0){
              fireAlarm();
          }

          SysCtlDelay(100 * 1);
    }

}
