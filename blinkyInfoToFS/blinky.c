#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
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

//#include <ti/mw/fatfs/ff.h>
//#include <xdc/runtime/System.h>


#define RED_LED    GPIO_PIN_1
#define BLUE_LED   GPIO_PIN_2
#define GREEN_LED  GPIO_PIN_3
#define ALL_LEDS RED_LED|BLUE_LED|GREEN_LED


#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};
#define delay(A) SysCtlDelay(9000*A)

//#include "Board.h"
#include "ssd1289.h"
#include "bme280_old.h"

#include "bmp280.h"

#include "ff.h"
#include "diskio.h"
//#include "mmc-ek-tm4c123g.h"

FATFS fatfs;
FIL fil, fout;
TCHAR text[200];
FRESULT rc;

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
char *concat(char *dest,char *str1,char *str2){
    int i = 0;
    for(i = 0; i < 17; i++){
        dest[i] = str1[i];
    }
    int j =0;
    for(;i<100;j++, i++){
        dest[i] = str2[j];
    }
    return dest;
}

void print_sensor_data(struct bme280_data *comp_data){
    char temp[200];
    char str[100];
    LCD_fillScr(0x00,0x00,0x00);

    ssd1289_string(1,concat(temp," pressure   [Pa] ",itoa(comp_data->pressure,str)),0,0);

    ssd1289_string(1,concat(temp," temperature [C] ",itoa(comp_data->temperature,str)),0,20);

    ssd1289_string(1,concat(temp," humidity  [%RH] ",itoa(comp_data->humidity,str)),0,40);

    drawLine(320,0,100,0);
    drawLine(320,70,100,70);
    drawLine(320,0,320,70);
    drawLine(100,0,100,70);

    drawLine(190,0,190,70);

    drawLine(320,20,100,20);
    drawLine(320,40,100,40);
}

void write_sensor_data(struct bme280_data *comp_data){
    char temp[200];
    char str[100];

    concat(temp," pressure   [Pa] ",itoa(comp_data->pressure,str));

    concat(temp," temperature [C] ",itoa(comp_data->temperature,str));

    concat(temp," humidity  [%RH] ",itoa(comp_data->humidity,str));
}

void
SysTickHandler(void)
{
    ROM_SysTickIntDisable();
    disk_timerproc();
    ROM_SysTickIntEnable();
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

//  // FOR GETTING SENSOR DATA
//     volatile bool result = bmp_initI2C();
//
//     calibration();
//
//     struct bme280_data comp_data;
//
//     comp_data.humidity = 0;
//     comp_data.pressure = 0;
//     comp_data.temperature = 0;
//
//     while(1){
//         comp_data.temperature = bmp_readTemperature();
//         comp_data.humidity = readHumidity();
//         comp_data.pressure = readPressure();
//
//         print_sensor_data(&comp_data);
//
//         write_sensor_data(&comp_data);
//
//         SysCtlDelay(9000*1000);
//
//     }

     volatile DSTATUS result = STA_PROTECT;

     result = disk_initialize(0);

     if(result == 1) {
         ssd1289_string(1,"Card not inserted",0,30);
     }

     if( result == 0)
         ssd1289_string(1,"Card in",0,30);


     rc = f_mount(0, &fatfs);
   if(rc != FR_OK)
   {
       setColor(0xff,0x00,0x00);
       ssd1289_string(1,"Mount error",0,40);
   }
   else
   {
       setColor(0x00,0xff,0xff);
       ssd1289_string(1,"Mount ok",0,60);
   }

   rc = f_open(&fil, "input.txt", FA_READ);

   if( rc != FR_OK)
   {
           setColor(0xff,0x00,0x00);
          ssd1289_string(1,"OPEN input.txt error",0,80);
      }
      else
      {
          setColor(0x00,0xff,0xff);
          ssd1289_string(1,"OPEN input.txt ok",0,80);
      }

     f_gets((char*)&text,200,&fil);

     setColor(0x00,0xff,0x00);
     ssd1289_string(1,(char*)&text,0,120);

//      WRITE TO FILE DON`T WORK
//    rc = f_open(&fout, "output.txt", FA_WRITE);//FA_CREATE_NEW );
//    if( rc == FR_OK || rc == FR_EXIST){
//        volatile int res = f_puts("123", &fout);
//        if ( res >= 0 )
//            ssd1289_string(1,"open unexisiting file",0,140);
//        else
//            ssd1289_string(1,"error writting",0,140);
//    }


    rc = f_mount(0, &fatfs);
   if(rc != FR_OK)
   {
       setColor(0xff,0x00,0x00);
       ssd1289_string(1,"unMount error",0,160);
   }
   else
   {
       setColor(0x00,0xff,0xff);
       ssd1289_string(1,"unMount ok",0,160);
   }

}



