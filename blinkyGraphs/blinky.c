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

/* XDCtools Header files */
//#include <xdc/std.h>
//#include <xdc/runtime/System.h>

//#include <ti/sysbios/knl/Task.h>

/* BIOS Header files */
//#include <ti/sysbios/BIOS.h>

/* TI-RTOS Header files */
//#include <ti/drivers/GPIO.h>
//#include <ti/drivers/I2C.h>


#define RED_LED    GPIO_PIN_1
#define BLUE_LED   GPIO_PIN_2
#define GREEN_LED  GPIO_PIN_3
#define ALL_LEDS RED_LED|BLUE_LED|GREEN_LED


#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};
#define delay(A) SysCtlDelay(9000*A)

//#include "Board.h"
#include "ssd1289.h"
#include "bme280_old.h"
//#include "bme280.h"

#include "bmp280.h"

int8_t rslt = BME280_OK;
//tI2CMInstance g_sI2CInst;

void user_delay_ms(uint32_t period)
{

    delay(period);
    /*
     * Return control or wait,
     * for a period amount of milliseconds
     */
}

int8_t user_i2c_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
//    if(len == 1){
//        data[0] = bmp_i2cRead(dev_id,reg_addr);
//    } else {
        bmp_i2cReadData(dev_id, reg_addr, data, len);
//    }



    return rslt;
}

int8_t user_i2c_write(uint8_t addr, uint8_t regAddr, uint8_t *data, uint16_t length)
{
    int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */

    bmp_i2cWriteData(addr, regAddr, data, length);

    return rslt;
}

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

/*
 * width of chart is 40px
 * but width of text depends on text
 *
 */
void drawChart(int data, int max, int min, int x_shift){
    int from = 235, to = 60, lines_count = 5;
    char str[10];

    int step = (max - min) / lines_count;

    int i = from;

    volatile float to_dots = ((float)(((float)(from - to )) / (max - min))) * (data - min); //((data - min ) * (from - to)) / (max);

    setColor(0xff, 0x00, 0x00);
    for(i = from; i >= (from - to_dots); i--){
        drawLine(310 - x_shift,i,275- x_shift,i);
    }
    setColor(0xff, 0xff, 0xff);

    drawLine(300 - x_shift,to,300 - x_shift,from);

    volatile int temp_data = min;
    for(i = from;i >= to; i-= ((from-to)/lines_count), temp_data+= step){
        drawLine(300 - x_shift,i,270 - x_shift,i);
        itoa(temp_data,str);

        setColor(0x00, 0xff, 0x00);
        ssd1289_string(2,str,x_shift + 2,i-15);
        setColor(0xff, 0xff, 0xff);
    }

}

void print_sensor_data(struct bme280_data *comp_data){
    char temp[100];
    char str[30];
    LCD_fillScr(0x00,0x00,0x00);

    ssd1289_string(1,concat(temp," pressure   [Pa] ",itoa(comp_data->pressure,str)),0,0);

    ssd1289_string(1,concat(temp," temperature [C] ",itoa(comp_data->temperature,str)),0,20);

    ssd1289_string(1,concat(temp,"   humidity[%RH] ",itoa(comp_data->humidity,str)),150,20);


    drawChart(comp_data->pressure, 103000,40000, 20);
    drawChart(comp_data->temperature, 40, -20, 20 + 40*2);
    drawChart(comp_data->humidity, 100,0, 20 + 40*4);
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


     volatile bool result = bmp_initI2C();

     calibration();

     struct bme280_data comp_data;

     comp_data.humidity = 0;
     comp_data.pressure = 0;
     comp_data.temperature = 0;

     while(1){
         comp_data.temperature = bmp_readTemperature();
         comp_data.humidity = readHumidity();
         comp_data.pressure = readPressure();

         print_sensor_data(&comp_data);

         SysCtlDelay(9000*2000);

     }

}



