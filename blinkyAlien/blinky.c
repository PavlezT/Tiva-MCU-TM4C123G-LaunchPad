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

         SysCtlDelay(9000*1000);

     }

//     struct bme280_data comp_data;
//     struct bme280_dev dev;
//
//
//     dev.dev_id = BME280_I2C_ADDR_PRIM;
//     dev.intf = 1;//BME280_I2C_INTF;
//     dev.read = user_i2c_read;
//     dev.write = user_i2c_write;
//     dev.delay_ms = user_delay_ms;
//
//     comp_data.humidity = 0;
//     comp_data.pressure = 0;
//     comp_data.temperature = 0;
////
//     rslt = bme280_init(&dev);
//
//         while (1) {
//             /* Delay while the sensor completes a measurement */
//             dev.delay_ms(70);
//             rslt = bme280_get_sensor_data(BME280_ALL, &comp_data, &dev);
//             print_sensor_data(&comp_data);
//         }

}



