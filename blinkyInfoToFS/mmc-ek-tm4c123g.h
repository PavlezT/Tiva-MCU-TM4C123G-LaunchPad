/*
 * mmc-ek-tm4c123g.h
 *
 *  Created on: 9 трав. 2018 р.
 *      Author: Admin
 */

#ifndef MMC_EK_TM4C123G_H_
#define MMC_EK_TM4C123G_H_

/*-----------------------------------------------------------------------*/
/* MMC/SDC (in SPI mode) control module  (C)ChaN, 2007                   */
/*-----------------------------------------------------------------------*/
/* Only rcvr_spi(), xmit_spi(), disk_timerproc() and some macros         */
/* are platform dependent.                                               */
/*-----------------------------------------------------------------------*/

#include "diskio.h"
#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/ssi.h"
#include "driverlib/sysctl.h"

/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/
//
//static volatile DSTATUS Stat = STA_NOINIT;    /* Disk status */
//
//static volatile
//BYTE Timer1, Timer2;    /* 100Hz decrement timer */
//
//static
//BYTE CardType;            /* b0:MMC, b1:SDC, b2:Block addressing */
//
//static
//BYTE PowerFlag = 0;     /* indicates if "power" is on */


/*-----------------------------------------------------------------------*/
/* Transmit a byte to MMC via SPI  (Platform dependent)                  */
/*-----------------------------------------------------------------------*/

//#define xmit_spi(dat)     SPDR=(dat); loop_until_bit_is_set(SPSR,SPIF)
//static
//void xmit_spi(BYTE dat)
//{
//    uint32_t ui32RcvDat;
//
//    ROM_SSIDataPut(SDC_SSI_BASE, dat); /* Write the data to the tx fifo */
//
//    ROM_SSIDataGet(SDC_SSI_BASE, &ui32RcvDat); /* flush data read during the write */
//}


/*-----------------------------------------------------------------------*/
/* Receive a byte from MMC via SPI  (Platform dependent)                 */
/*-----------------------------------------------------------------------*/

static
BYTE rcvr_spi (void);

/* Alternative macro to receive data fast */
//#define rcvr_spi_m(dst)    SPDR=0xFF; loop_until_bit_is_set(SPSR,SPIF); *(dst)=SPDR

//
//static
//void rcvr_spi_m (BYTE *dst)
//{
//    *dst = rcvr_spi();
//}

/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
BYTE wait_ready (void);
/*-----------------------------------------------------------------------*/
/* Send 80 or so clock transitions with CS and DI held high. This is     */
/* required after card power up to get it into SPI mode                  */
/*-----------------------------------------------------------------------*/
//static
//void send_initial_clock_train(void)
//{
//    unsigned int i;
//    uint32_t ui32Dat;
//
//    /* Ensure CS is held high. */
//    DESELECT();
//
//    /* Switch the SSI TX line to a GPIO and drive it high too. */
//    ROM_GPIOPinTypeGPIOOutput(SDC_GPIO_PORT_BASE, SDC_SSI_TX);
//    ROM_GPIOPinWrite(SDC_GPIO_PORT_BASE, SDC_SSI_TX, SDC_SSI_TX);
//
//    /* Send 10 bytes over the SSI. This causes the clock to wiggle the */
//    /* required number of times. */
//    for(i = 0 ; i < 10 ; i++)
//    {
//        /* Write DUMMY data. SSIDataPut() waits until there is room in the */
//        /* FIFO. */
//        ROM_SSIDataPut(SDC_SSI_BASE, 0xFF);
//
//        /* Flush data read during data write. */
//        ROM_SSIDataGet(SDC_SSI_BASE, &ui32Dat);
//    }
//
//    /* Revert to hardware control of the SSI TX line. */
//    ROM_GPIOPinTypeSSI(SDC_GPIO_PORT_BASE, SDC_SSI_TX);
//}
//
//
//
///*-----------------------------------------------------------------------*/
///* Power Control  (Platform dependent)                                   */
///*-----------------------------------------------------------------------*/
///* When the target system does not support socket power control, there   */
///* is nothing to do in these functions and chk_power always returns 1.   */
//
//static
//void power_on (void)
//{
//    /*
//     * This doesn't really turn the power on, but initializes the
//     * SSI port and pins needed to talk to the card.
//     */
//
//    /* Enable the peripherals used to drive the SDC on SSI */
//    ROM_SysCtlPeripheralEnable(SDC_SSI_SYSCTL_PERIPH);
//    ROM_SysCtlPeripheralEnable(SDC_GPIO_SYSCTL_PERIPH);
//
//    /*
//     * Configure the appropriate pins to be SSI instead of GPIO. The FSS (CS)
//     * signal is directly driven to ensure that we can hold it low through a
//     * complete transaction with the SD card.
//     */
//    GPIOPinConfigure(GPIO_PD2_SSI1RX);
//    GPIOPinConfigure(GPIO_PD3_SSI1TX);
//    GPIOPinConfigure(GPIO_PD0_SSI1CLK);
//    GPIOPinConfigure(GPIO_PD1_SSI1FSS);
//    ROM_GPIOPinTypeSSI(SDC_GPIO_PORT_BASE, SDC_SSI_TX | SDC_SSI_RX | SDC_SSI_CLK);
//    ROM_GPIOPinTypeGPIOOutput(SDC_GPIO_PORT_BASE, SDC_SSI_FSS);
//
//    /*
//     * Set the SSI output pins to 4MA drive strength and engage the
//     * pull-up on the receive line.
//     */
//    MAP_GPIOPadConfigSet(SDC_GPIO_PORT_BASE, SDC_SSI_RX, GPIO_STRENGTH_4MA,
//                         GPIO_PIN_TYPE_STD_WPU);
//    MAP_GPIOPadConfigSet(SDC_GPIO_PORT_BASE, SDC_SSI_CLK | SDC_SSI_TX | SDC_SSI_FSS,
//                         GPIO_STRENGTH_4MA, GPIO_PIN_TYPE_STD);
//
//    /* Configure the SSI0 port */
//    ROM_SSIConfigSetExpClk(SDC_SSI_BASE, ROM_SysCtlClockGet(),
//                           SSI_FRF_MOTO_MODE_0, SSI_MODE_MASTER, 400000, 8);
//    ROM_SSIEnable(SDC_SSI_BASE);
//
//    /* Set DI and CS high and apply more than 74 pulses to SCLK for the card */
//    /* to be able to accept a native command. */
//    send_initial_clock_train();
//
//    PowerFlag = 1;
//}
//
//// set the SSI speed to the max setting
//static
//void set_max_speed(void)
//{
//    unsigned long i;
//
//    /* Disable the SSI */
//    ROM_SSIDisable(SDC_SSI_BASE);
//
//    /* Set the maximum speed as half the system clock, with a max of 12.5 MHz. */
//    i = ROM_SysCtlClockGet() / 2;
//    if(i > 12500000)
//    {
//        i = 12500000;
//    }
//
//    /* Configure the SSI0 port to run at 12.5MHz */
//    ROM_SSIConfigSetExpClk(SDC_SSI_BASE, ROM_SysCtlClockGet(),
//                           SSI_FRF_MOTO_MODE_0, SSI_MODE_MASTER, i, 8);
//
//    /* Enable the SSI */
//    ROM_SSIEnable(SDC_SSI_BASE);
//}
//
//static
//void power_off (void)
//{
//    PowerFlag = 0;
//}
//
//static
//int chk_power(void)        /* Socket power state: 0=off, 1=on */
//{
//    return PowerFlag;
//}



/*-----------------------------------------------------------------------*/
/* Receive a data packet from MMC                                        */
/*-----------------------------------------------------------------------*/

static bool rcvr_datablock (
    BYTE *buff,            /* Data buffer to store received data */
    UINT btr            /* Byte count (must be even number) */
);



/*-----------------------------------------------------------------------*/
/* Send a data packet to MMC                                             */
/*-----------------------------------------------------------------------*/


static bool xmit_datablock (
    const BYTE *buff,    /* 512 byte data block to be transmitted */
    BYTE token            /* Data/Stop token */
);



/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static
BYTE send_cmd (
    BYTE cmd,        /* Command byte */
    DWORD arg        /* Argument */
);


/*-----------------------------------------------------------------------*
 * Send the special command used to terminate a multi-sector read.
 *
 * This is the only command which can be sent while the SDCard is sending
 * data. The SDCard spec indicates that the data transfer will stop 2 bytes
 * after the 6 byte CMD12 command is sent and that the card will then send
 * 0xFF for between 2 and 6 more bytes before the R1 response byte.  This
 * response will be followed by another 0xFF byte.  In testing, however, it
 * seems that some cards don't send the 2 to 6 0xFF bytes between the end of
 * data transmission and the response code.  This function, therefore, merely
 * reads 10 bytes and, if the last one read is 0xFF, returns the value of the
 * latest non-0xFF byte as the response code.
 *
 *-----------------------------------------------------------------------*/

static
BYTE send_cmd12 (void);


/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
    BYTE drv        /* Physical drive nmuber (0) */
);



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
    BYTE drv        /* Physical drive nmuber (0) */
);



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/
//
//DRESULT disk_read (
//    BYTE drv,            /* Physical drive nmuber (0) */
//    BYTE *buff,            /* Pointer to the data buffer to store read data */
//    DWORD sector,        /* Start sector number (LBA) */
//    BYTE count            /* Sector count (1..255) */
//);



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

//DRESULT disk_write (
//    BYTE drv,            /* Physical drive nmuber (0) */
//    const BYTE *buff,    /* Pointer to the data to be written */
//    DWORD sector,        /* Start sector number (LBA) */
//    BYTE count            /* Sector count (1..255) */
//);



/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/
//
//DRESULT disk_ioctl (
//    BYTE drv,        /* Physical drive nmuber (0) */
//    BYTE ctrl,        /* Control code */
//    void *buff        /* Buffer to send/receive control data */
//);
//
//

/*-----------------------------------------------------------------------*/
/* Device Timer Interrupt Procedure  (Platform dependent)                */
/*-----------------------------------------------------------------------*/
/* This function must be called in period of 10ms                        */

void disk_timerproc (void);


/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/
/* This is a real time clock service to be called from     */
/* FatFs module. Any valid time must be returned even if   */
/* the system does not support a real time clock.          */

DWORD get_fattime (void);


#endif /* MMC_EK_TM4C123G_H_ */
