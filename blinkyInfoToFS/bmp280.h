#pragma once

#include <stdint.h>
#include <stdbool.h>









bool bmp_initI2C(void) ;
void bmp_i2cWrite(uint8_t addr, uint8_t regAddr, uint8_t data);
void bmp_i2cWriteData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length);
uint8_t bmp_i2cRead(uint8_t addr, uint8_t regAddr);
void bmp_i2cReadData(uint8_t addr, uint8_t regAddr, uint8_t *data, uint8_t length);
float bmp_readTemperature(void);
float readHumidity(void);
float readPressure(void);
void calibration();
