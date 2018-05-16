
#include "BMP280.h"

#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/i2c.h"
#include "driverlib/sysctl.h"


#define  I2CADDR            0x76



#define      BME280_REGISTER_DIG_T1            0x88
#define      BME280_REGISTER_DIG_T2            0x8A
#define      BME280_REGISTER_DIG_T3            0x8C

#define      BME280_REGISTER_DIG_P1            0x8E
#define      BME280_REGISTER_DIG_P2            0x90
#define      BME280_REGISTER_DIG_P3            0x92
#define      BME280_REGISTER_DIG_P4            0x94
#define      BME280_REGISTER_DIG_P5            0x96
#define      BME280_REGISTER_DIG_P6            0x98
#define      BME280_REGISTER_DIG_P7            0x9A
#define      BME280_REGISTER_DIG_P8            0x9C
#define      BME280_REGISTER_DIG_P9            0x9E

#define      BME280_REGISTER_DIG_H1            0xA1
#define      BME280_REGISTER_DIG_H2            0xE1
#define      BME280_REGISTER_DIG_H3            0xE3
#define      BME280_REGISTER_DIG_H4            0xE4
#define      BME280_REGISTER_DIG_H5            0xE5
#define      BME280_REGISTER_DIG_H6            0xE7

#define      BME280_REGISTER_CHIPID            0xD0
#define      BME280_REGISTER_VERSION           0xD1
#define      BME280_REGISTER_SOFTRESET         0xE0

#define      BME280_REGISTER_CAL26             0xE1  // R calibration stored in 0xE1-0xF0

#define      BME280_REGISTER_CONTROLHUMID      0xF2
#define      BME280_REGISTER_CONTROL           0xF4
#define      BME280_REGISTER_CONFIG            0xF5
#define      BME280_REGISTER_PRESSUREDATA      0xF7
#define      BME280_REGISTER_TEMPDATA          0xFA
#define      BME280_REGISTER_HUMIDDATA         0xFD
#define OVERSAMPLING_T1		  0x20
#define OVERSAMPLING_T2		  0x40
#define OVERSAMPLING_T4		  0x60
#define OVERSAMPLING_T8		  0x80
#define OVERSAMPLING_T16	  0xA0
#define OVERSAMPLING_P1		  0x04
#define OVERSAMPLING_P2		  0x08
#define OVERSAMPLING_P4		  0x0C
#define OVERSAMPLING_P8		  0x10
#define OVERSAMPLING_P16	  0x14
#define MODE_SLEEP			  0x00
#define MODE_FORCED			  0x01
#define MODE_NORMAL			  0x03
#define TSB_0_5				  0x00
#define TSB_62_5			  0x20
#define TSB_125				  0x40
#define TSB_250				  0x60
#define TSB_500				  0x80
#define TSB_1000			  0xA0
#define TSB_2000			  0xC0
#define TSB_4000			  0xE0
#define FILTER_OFF			  0x00
#define FILTER_COEFFICIENT2	  0x04
#define FILTER_COEFFICIENT4	  0x08
#define FILTER_COEFFICIENT8	  0x0C
#define FILTER_COEFFICIENT16  0x10
#define SPI_OFF	              0x00
#define SPI_ON	              0x01

    typedef struct
    {
      uint16_t dig_T1;
      int16_t  dig_T2;
      int16_t  dig_T3;

      uint16_t dig_P1;
      int16_t  dig_P2;
      int16_t  dig_P3;
      int16_t  dig_P4;
      int16_t  dig_P5;
      int16_t  dig_P6;
      int16_t  dig_P7;
      int16_t  dig_P8;
      int16_t  dig_P9;

      uint8_t  dig_H1;
      int16_t  dig_H2;
      uint8_t  dig_H3;
      int16_t  dig_H4;
      int16_t  dig_H5;
      int8_t   dig_H6;
    } bme280_calib_data;


bme280_calib_data cal_data;
int32_t t_fine;

void write8(uint8_t regAddr, uint8_t data);
uint8_t read8( uint8_t regAddr);
uint16_t readS16_LE( uint8_t regAddr);
uint16_t read16_LE( uint8_t regAddr);
int32_t read24(uint8_t regAddr);

bool bmp_initI2C(void)
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C1); // Enable I2C1 peripheral
    SysCtlDelay(2); // Insert a few cycles after enabling the peripheral to allow the clock to be fully activated
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA); // Enable GPIOA peripheral
    SysCtlDelay(2); // Insert a few cycles after enabling the peripheral to allow the clock to be fully activated

    // Use alternate function
    GPIOPinConfigure(GPIO_PA6_I2C1SCL);
    GPIOPinConfigure(GPIO_PA7_I2C1SDA);

    GPIOPinTypeI2CSCL(GPIO_PORTA_BASE, GPIO_PIN_6); // Use pin with I2C SCL peripheral
    GPIOPinTypeI2C(GPIO_PORTA_BASE, GPIO_PIN_7); // Use pin with I2C peripheral

    I2CMasterInitExpClk(I2C1_BASE, SysCtlClockGet(), true); // Enable and set frequency to 400 kHz

    SysCtlDelay(2); // Insert a few cycles after enabling the I2C to allow the clock to be fully activated



    volatile int id = read8(BME280_REGISTER_CHIPID) ;
//
//
//    volatile int a = (id == 0x60);
//
//    volatile id_const = 0x60;
//
//    volatile int a1 = (id == id_const);
//
//    volatile bool a2 = (id == id_const);

      if (id != 0x60) return false;



      return 0;//a2;




}


void calibration(){
        cal_data.dig_T1 = read16_LE(BME280_REGISTER_DIG_T1);

        cal_data.dig_T2 = readS16_LE(BME280_REGISTER_DIG_T2);

        cal_data.dig_T3 = readS16_LE(BME280_REGISTER_DIG_T3);

        cal_data.dig_P1 = read16_LE(BME280_REGISTER_DIG_P1);

        cal_data.dig_P2 = readS16_LE(BME280_REGISTER_DIG_P2);

        cal_data.dig_P3 = readS16_LE(BME280_REGISTER_DIG_P3);

        cal_data.dig_P4 = readS16_LE(BME280_REGISTER_DIG_P4);

        cal_data.dig_P5 = readS16_LE(BME280_REGISTER_DIG_P5);

        cal_data.dig_P6 = readS16_LE(BME280_REGISTER_DIG_P6);

        cal_data.dig_P7 = readS16_LE(BME280_REGISTER_DIG_P7);

        cal_data.dig_P8 = readS16_LE(BME280_REGISTER_DIG_P8);

        cal_data.dig_P9 = readS16_LE(BME280_REGISTER_DIG_P9);

        cal_data.dig_H1 = read8(BME280_REGISTER_DIG_H1);

        cal_data.dig_H2 = readS16_LE(BME280_REGISTER_DIG_H2);

        cal_data.dig_H3 = read8(BME280_REGISTER_DIG_H3);

        cal_data.dig_H4 = (read8(BME280_REGISTER_DIG_H4) << 4) | (read8(BME280_REGISTER_DIG_H4+1) & 0xF);

        cal_data.dig_H5 = (read8(BME280_REGISTER_DIG_H5+1) << 4) | (read8(BME280_REGISTER_DIG_H5) >> 4);

        cal_data.dig_H6 = (int8_t)read8(BME280_REGISTER_DIG_H6);

}


float bmp_readTemperature(void)
{
    int32_t var1, var2;

    int32_t adc_T = read24(BME280_REGISTER_TEMPDATA);

    adc_T >>= 4;

    var1  = ((((adc_T>>3) - ((int32_t)cal_data.dig_T1 <<1))) *

             ((int32_t)cal_data.dig_T2)) >> 11;

    var2  = (((((adc_T>>4) - ((int32_t)cal_data.dig_T1)) *

               ((adc_T>>4) - ((int32_t)cal_data.dig_T1))) >> 12) *

             ((int32_t)cal_data.dig_T3)) >> 14;

    t_fine = var1 + var2;

    volatile float temperature;
    temperature  = (t_fine * 5 + 128) >> 8;

    temperature = temperature / 100;
    return temperature;
}

float readPressure(void) {

    int64_t var1, var2, p;
    volatile float pressure;

    int32_t adc_P = read24(BME280_REGISTER_PRESSUREDATA);
    adc_P >>= 4;

    var1 = ((int64_t)t_fine) - 128000;

    var2 = var1 * var1 * (int64_t)cal_data.dig_P6;

    var2 = var2 + ((var1*(int64_t)cal_data.dig_P5)<<17);

    var2 = var2 + (((int64_t)cal_data.dig_P4)<<35);

    var1 = ((var1 * var1 * (int64_t)cal_data.dig_P3)>>8) +

    ((var1 * (int64_t)cal_data.dig_P2)<<12);

    var1 = (((((int64_t)1)<<47)+var1))*((int64_t)cal_data.dig_P1)>>33;


    if (var1 == 0) {

        // return 0;  // avoid exception caused by division by zero
        pressure = 0.0;
    }

    p = 1048576 - adc_P;

    p = (((p<<31) - var2)*3125) / var1;

    var1 = (((int64_t)cal_data.dig_P9) * (p>>13) * (p>>13)) >> 25;

    var2 = (((int64_t)cal_data.dig_P8) * p) >> 19;


    p = ((p + var1 + var2) >> 8) + (((int64_t)cal_data.dig_P7)<<4);

    // return (float)p/256;

    pressure = (float)p/256;

    return pressure;
}


float readHumidity(void) {

    int32_t adc_H = read16_LE(BME280_REGISTER_HUMIDDATA);

    int32_t v_x1_u32r;

    v_x1_u32r = (t_fine - ((int32_t)76800));

    v_x1_u32r = (((((adc_H << 14) - (((int32_t)cal_data.dig_H4) << 20) -

                    (((int32_t)cal_data.dig_H5) * v_x1_u32r)) + ((int32_t)16384)) >> 15) *

                 (((((((v_x1_u32r * ((int32_t)cal_data.dig_H6)) >> 10) *

                      (((v_x1_u32r * ((int32_t)cal_data.dig_H3)) >> 11) + ((int32_t)32768))) >> 10) +

                    ((int32_t)2097152)) * ((int32_t)cal_data.dig_H2) + 8192) >> 14));


    v_x1_u32r = (v_x1_u32r - (((((v_x1_u32r >> 15) * (v_x1_u32r >> 15)) >> 7) *

                               ((int32_t)cal_data.dig_H1)) >> 4));


    v_x1_u32r = (v_x1_u32r < 0) ? 0 : v_x1_u32r;

    v_x1_u32r = (v_x1_u32r > 419430400) ? 419430400 : v_x1_u32r;

    float h = (v_x1_u32r>>12);

    // return  h / 1024.0;
    volatile float humidity = (h <= 0 ? 50000 : h) / 1024.0;
    return humidity;
}




int32_t read24(uint8_t regAddr)
{

	uint8_t d[3];
	bmp_i2cReadData(I2CADDR, regAddr, d,3);
	return ((uint32_t)d[2]) | (((uint32_t)d[1])<<8) | (((uint32_t)d[0])<<16);
}




void write8(uint8_t regAddr, uint8_t data)
{

	bmp_i2cWriteData(I2CADDR, regAddr, &data, 1);
}


uint8_t read8( uint8_t regAddr)
{
	return bmp_i2cRead(I2CADDR,  regAddr);
}

uint16_t read16_LE( uint8_t regAddr)
{
	uint8_t d[2];
	bmp_i2cReadData(I2CADDR, regAddr, d,2);
	return ((uint16_t)d[0]) | (((uint16_t)d[1]) << 8);
}


uint16_t readS16_LE( uint8_t regAddr)
{
	return (int16_t)read16_LE(regAddr);
}




void bmp_i2cWrite(uint8_t addr, uint8_t regAddr, uint8_t data)
{
    bmp_i2cWriteData(addr, regAddr, &data, 1);
}

void bmp_i2cWriteData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length)
{
	uint8_t i;

    I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode

    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_START); // Send start condition
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done

    for (i = 0; i < length - 1; i++)
    {
        I2CMasterDataPut(I2C1_BASE, data[i]); // Place data into data register
        I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_CONT); // Send continues condition
        while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
    }

    I2CMasterDataPut(I2C1_BASE, data[length - 1]); // Place data into data register
    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH); // Send finish condition
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
}

uint8_t bmp_i2cRead(uint8_t addr, uint8_t regAddr) {
    I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode

    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_SEND); // Send data


    uint32_t fuse=0;
    while (I2CMasterBusy(I2C1_BASE))
    {
    	fuse++;
    	if (fuse>100000) return 0;
    };

    I2CMasterSlaveAddrSet(I2C1_BASE, addr, true); // Set to read mode

    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE); // Tell master to read data
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
    return I2CMasterDataGet(I2C1_BASE); // Read data
}

void bmp_i2cReadData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length)
{

	uint8_t i;

	I2CMasterSlaveAddrSet(I2C1_BASE, addr, false); // Set to write mode

    I2CMasterDataPut(I2C1_BASE, regAddr); // Place address into data register
    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_SINGLE_SEND); // Send data
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done

    I2CMasterSlaveAddrSet(I2C1_BASE, addr, true); // Set to read mode

    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_START); // Send start condition
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
    data[0] = I2CMasterDataGet(I2C1_BASE); // Place data into data register

    for (i = 1; i < length - 1; i++)
    {
        I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_CONT); // Send continues condition
        while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
        data[i] = I2CMasterDataGet(I2C1_BASE); // Place data into data register
    }

    I2CMasterControl(I2C1_BASE, I2C_MASTER_CMD_BURST_RECEIVE_FINISH); // Send finish condition
    while (I2CMasterBusy(I2C1_BASE)); // Wait until transfer is done
    data[length - 1] = I2CMasterDataGet(I2C1_BASE); // Place data into data register
}
