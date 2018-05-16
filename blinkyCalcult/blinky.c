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

#define SUMM    1
#define MINUS   2
#define MULTIPLY  3
#define DIVIDE 4

#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};


#include "ssd1289.h"
#include "XPT2046.h"


typedef void (*function_call)(int number);

struct Cell {
  int center_x;
  int center_y;
  int number_value;
  char symbol;
  function_call callback;
};

struct Cell Cells[17];
int cells_length = 17;

uint64_t prev_number, actual_number;
int selected_operation;

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

void numberPress(int number){
    actual_number= actual_number * 10 + number;
}

void resetNumbers(int number){
    actual_number = 0;
    prev_number = 0;
    selected_operation = 0;
}

void eraseLast(int number){
    actual_number/=10;
}

void summ(int number){
    prev_number += actual_number;
    actual_number = 0;
    selected_operation = SUMM;
}

void minus(int number){
    prev_number = prev_number > 0 ? prev_number - actual_number : actual_number;
    actual_number = 0;
    selected_operation = MINUS;
}

void multiply(int number){
    if( actual_number > 0)
        prev_number = prev_number > 0 ? prev_number * actual_number : actual_number;
    actual_number = 0;
    selected_operation = MULTIPLY;
}

void divide(int number){
    if( actual_number > 0)
        prev_number = prev_number > 0 ? prev_number / actual_number : actual_number;
    actual_number = 0;
    selected_operation = DIVIDE;
}

void countTotal(int number){
    switch(selected_operation){
    case SUMM:
        summ(0);
        break;
    case MINUS:
        minus(0);
        break;
    case MULTIPLY:
        multiply(0);
        break;
    case DIVIDE:
        divide(0);
        break;
    default:
        break;
    }
}

void init_cells(){
    Cells[0].center_x = 25;
    Cells[0].center_y = 110;
    Cells[0].symbol = '1';
    Cells[0].number_value = 1;
    Cells[0].callback = numberPress;

    Cells[1].center_x = 75;
    Cells[1].center_y = 110;
    Cells[1].symbol = '2';
    Cells[1].number_value = 2;
    Cells[1].callback = numberPress;

    Cells[2].center_x = 125;
    Cells[2].center_y = 110;
    Cells[2].symbol = '3';
    Cells[2].number_value = 3;
    Cells[2].callback = numberPress;

    Cells[3].center_x = 25;
    Cells[3].center_y = 160;
    Cells[3].symbol = '4';
    Cells[3].number_value = 4;
    Cells[3].callback = numberPress;

    Cells[4].center_x = 75;
    Cells[4].center_y = 160;
    Cells[4].symbol = '5';
    Cells[4].number_value = 5;
    Cells[4].callback = numberPress;

    Cells[5].center_x = 125;
    Cells[5].center_y = 160;
    Cells[5].symbol = '6';
    Cells[5].number_value = 6;
    Cells[5].callback = numberPress;

    Cells[6].center_x = 25;
    Cells[6].center_y = 210;
    Cells[6].symbol = '7';
    Cells[6].number_value = 7;
    Cells[6].callback = numberPress;

    Cells[7].center_x = 75;
    Cells[7].center_y = 210;
    Cells[7].symbol = '8';
    Cells[7].number_value = 8;
    Cells[7].callback = numberPress;

    Cells[8].center_x = 125;
    Cells[8].center_y = 210;
    Cells[8].symbol = '9';
    Cells[8].number_value = 9;
    Cells[8].callback = numberPress;

    Cells[9].center_x = 175;
    Cells[9].center_y = 110;
    Cells[9].symbol = '0';
    Cells[9].number_value = 0;
    Cells[9].callback = numberPress;

    Cells[10].center_x = 175;
    Cells[10].center_y = 160;
    Cells[10].symbol = 'C';
    Cells[10].callback = resetNumbers;

    Cells[11].center_x = 175;
    Cells[11].center_y = 210;
    Cells[11].symbol = '<';
    Cells[11].callback = eraseLast;

    Cells[12].center_x = 230;
    Cells[12].center_y = 115;
    Cells[12].symbol = '+';
    Cells[12].callback = summ;

    Cells[13].center_x = 230;
    Cells[13].center_y = 165;
    Cells[13].symbol = '-';
    Cells[13].callback = minus;

    Cells[14].center_x = 290;
    Cells[14].center_y = 110;
    Cells[14].symbol = '*';
    Cells[14].callback = multiply;

    Cells[15].center_x = 290;
    Cells[15].center_y = 160;
    Cells[15].symbol = '/';
    Cells[15].callback = divide;

    Cells[16].center_x = 290;
    Cells[16].center_y = 210;
    Cells[16].symbol = '=';
    Cells[16].callback = countTotal;

}

void init_calc(){
    int ytop = 40,x=0, y_step = 50;
    //horizontal lines
    drawLine(x,ytop,320,ytop);
    drawLine(x,ytop+y_step,320,ytop+y_step);
    drawLine(x,ytop+y_step*2,320,ytop+y_step*2);
    drawLine(x,ytop+y_step*3,320,ytop+y_step*3);

    // vertival lines
    int x_step = 53;
    drawLine(x_step,  90  ,x_step,  235);
    drawLine(x_step*2,90,x_step*2,235);
    drawLine(x_step*3,90,x_step*3,235);
    drawLine(x_step*4,90,x_step*4,235);
    drawLine(x_step*5,40 ,x_step*5,235);

    //draw chars
    init_cells();

    int i = 0;
    for(; i < cells_length; i++){
//        int temp_x = LCD_WIDTH - Cells[i].center_x - 8;
        ssd1289_char(1,Cells[i].symbol,Cells[i].center_y,Cells[i].center_x);
    }
}

void renderActualNumber(){
    int from_x = 170, to_x = 265, from_y = 67,to_y = 77;

    setColor(0x00, 0x00, 0x00);
    for(;from_x < to_x; from_x++){
        drawLine(from_x,from_y,from_x,to_y);
    }
    setColor(0xff, 0xff, 0xff);

    char str[100];
    ssd1289_string(1,itoa(actual_number,str),60,65);
}

void renderPreviousNumber(){
    int from_x = 230, to_x = 320, from_y = 5,to_y = 17;

    setColor(0x00, 0x00, 0x00);
    for(;from_x < to_x; from_x++){
        drawLine(from_x,from_y,from_x,to_y);
    }
    setColor(0xff, 0xff, 0xff);

    char str[100];
    ssd1289_string(1,itoa(prev_number,str),5,5);
}

void renderSelectedOperation(){
    int from_x = 297, to_x = 310, from_y = 55,to_y = 70;

    setColor(0x00, 0x00, 0x00);
    for(;from_x < to_x; from_x++){
        drawLine(from_x,from_y,from_x,to_y);
    }
    setColor(0xff, 0xff, 0xff);

    char symbol;
    switch (selected_operation){
        case SUMM:
            symbol = '+';
            break;
        case MINUS:
            symbol = '-';
            break;
        case DIVIDE:
            symbol = '/';
            break;
        case MULTIPLY:
            symbol = '*';
            break;
        default:
            symbol = ' ';
    }

    ssd1289_string(1,&symbol,15,55);
}

void refreshData(){
    renderActualNumber();
    renderPreviousNumber();
    renderSelectedOperation();
}

bool isClicked(struct Cell cell, int x, int y ){
    int diff = 20;
    return (cell.center_x - diff) <= x && (cell.center_x + diff) >= x && (cell.center_y - diff) <= y & (cell.center_y + diff) >= y;
}

void findClickedButton( int x, int y){
    int i = 0;
    for(; i < cells_length; i++){
        if( isClicked(Cells[i],x,y) ) {
            Cells[i].callback(Cells[i].number_value);
            refreshData();
            break;
        }
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

     int x = 0;
     int y = 0;
     prev_number = 0;
     actual_number = 0;
     selected_operation = 0;

     float xtox = 0.1787709;//320/1790;
     float ytoy = 0.1325966;//0.123711;//240/1790;

     init_calc();

     while(1)
    {
          Touch_getxy( &y, &x);

          int temp_x = (float)x * xtox;
          int temp_y = (float)y * ytoy;

          temp_x = 345 - temp_x;
          temp_y = temp_y > 15 ? temp_y - 15 : temp_y;

          findClickedButton(temp_x, temp_y);

    }

}
