
#include "XPT2046.h"


uint16_t* _x=0;
uint16_t* _y=0;
uint16_t* _n=0;

//uint16_t _aaa=0;




//void  IntGPIOe(void)// using GPIO_PIN_0 interrupt cause FaultISR


void  IntGPIOf(void)
{

	uint32_t status = GPIOIntStatus(GPIO_PORTF_BASE,true);
	GPIOIntClear(GPIO_PORTF_BASE,status);

	*_n += 1;
	//_aaa++;
	//Touch_getxy(_x,_y);






}



void Touch_init(uint16_t* x,uint16_t* y,uint16_t* intcounter)
{

		_x = x;
		_y = y;
		_n = intcounter;

	    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
	    SysCtlDelay(100);
	    SysCtlPeripheralEnable(SYSCTL_PERIPH_SSI0);
	    SysCtlDelay(100);
	    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_3);
	    SSIDisable(SSI0_BASE);


	    GPIOPinConfigure(GPIO_PA2_SSI0CLK);
	    // GPIOPinConfigure(GPIO_PA3_SSI0FSS);
	    GPIOPinConfigure(GPIO_PA4_SSI0RX);
	    GPIOPinConfigure(GPIO_PA5_SSI0TX);

	    GPIOPinTypeSSI(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_4|GPIO_PIN_5);
	    SSIClockSourceSet(SSI0_BASE, SSI_CLOCK_SYSTEM);
	    SSIConfigSetExpClk(SSI0_BASE, SysCtlClockGet(), SSI_FRF_MOTO_MODE_0,SSI_MODE_MASTER, 100000, 8);// defines base, System clk, Mode 0 = SPH = SPO = 0,Master, 400 KHz, no. of bits = 8 = 1 byte transfer
	    SSIEnable(SSI0_BASE);

	    SysCtlDelay(100);








	    ROM_IntMasterDisable();
	    ROM_IntEnable(INT_GPIOF);
	    ROM_IntPrioritySet(INT_GPIOF,0x00);
	    ROM_GPIOIntTypeSet(GPIO_PORTF_BASE, GPIO_PIN_4, GPIO_FALLING_EDGE );
	    GPIOIntRegister(GPIO_PORTF_BASE,  IntGPIOf);
	    GPIOIntEnable(GPIO_PORTF_BASE,  GPIO_PIN_4 );
	    ROM_GPIOPinTypeGPIOInput(GPIO_PORTF_BASE,  GPIO_PIN_4);
	    ROM_GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_4, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
	    ROM_IntMasterEnable();




	   SysCtlDelay(100);

}


void Touch_scs()
{
	GPIOPinWrite(GPIO_PORTA_BASE,GPIO_PIN_3,0);
}

void Touch_ccs()
{
	GPIOPinWrite(GPIO_PORTA_BASE,GPIO_PIN_3,GPIO_PIN_3);
}

uint8_t Touch_spi( uint8_t data)
{
	uint32_t reply=0;

	SysCtlDelay(100);

    while(SSIDataGetNonBlocking(SSI0_BASE, &reply));
    SSIDataPut(SSI0_BASE,data);
    while(SSIBusy(SSI0_BASE));
    while(SSIDataGetNonBlocking(SSI0_BASE, &reply));



    return (uint8_t)reply;
}


#define	chy 	0x90
#define	chx 	0xD0

void Touch_getxy( uint16_t *x,uint16_t *y)
{
		uint16_t touch_x = 0;
		uint16_t touch_y = 0;

		Touch_scs();

		Touch_spi(chx);

		touch_x = Touch_spi(0X00);
		touch_x <<= 8;

		touch_x |= Touch_spi(0X00);
		touch_x >>= 4;


		Touch_spi(chy);

		touch_y = Touch_spi(0X00);
		touch_y <<= 8;

		touch_y |= Touch_spi(0X00);
		touch_y >>= 4;

		Touch_ccs()	;

		*x = touch_x;
		*y = touch_y;
}


void Touch_prepare()
{
	Touch_scs();

	Touch_spi(0x80);
	Touch_spi(0x00);
	Touch_spi(0x00);

	Touch_ccs();
}

