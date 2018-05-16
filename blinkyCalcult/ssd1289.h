#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
//#include <avr/io.h>
//#include <pgmspace.h>


/*
db8-18 -> pb0-7
db0-4  -> pe0-3
db5-7  -> bc4-7



cs     -> pf1
rd     -> pe5
wr     -> pf3
rs     -> pf2
rst    -> pe4


*/

#define P_WR  GPIO_PORTD_BASE
#define P_RD  GPIO_PORTE_BASE
#define P_CS  GPIO_PORTF_BASE
#define P_RS  GPIO_PORTD_BASE
#define P_RST GPIO_PORTE_BASE

#define B_CS  GPIO_PIN_0
#define B_RD  GPIO_PIN_5
#define B_WR  GPIO_PIN_6
#define B_RS  GPIO_PIN_7
#define B_RST GPIO_PIN_4


#define LCD_WIDTH 320
#define LCD_HEIGHT 240

uint8_t fcolorr,fcolorg,fcolorb;
uint8_t bcolorr,bcolorg,bcolorb;

typedef uint16_t yaxis_t; /* y axis */
typedef uint16_t xaxis_t; /* x axis */
typedef uint16_t radius_t; /* radius */
typedef uint16_t color_t;

void LCD_init();
void LCD_setXY(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);
void LCD_setPixel(uint8_t r,uint8_t g,uint8_t b);
void LCD_clrXY();
void LCD_drawPixel(int x, int y,uint8_t r,uint8_t g,uint8_t b);
uint16_t LCD_Read_Bus();
uint16_t LCD_read_reg(uint8_t reg_addr);
void LCD_fillScr(uint8_t r, uint8_t g, uint8_t b);
void LCD_Rect(uint16_t x,uint16_t y,uint16_t d,uint8_t r, uint8_t g, uint8_t b);
void LCD_print(uint16_t x,uint16_t y,uint8_t r, uint8_t g, uint8_t b,char* str);
void LCD_printchar(uint16_t x,uint16_t y,uint8_t r, uint8_t g, uint8_t b,char c);

void LCD_Writ_Bus(uint8_t vh,uint8_t vl );
void LCD_Write_COM(uint8_t VL);
void LCD_Write_DATA(uint8_t VH,uint8_t VL);
void LCD_Write_COM_DATA(uint8_t com1,uint16_t dat1);

void setColor(uint8_t r, uint8_t g, uint8_t b);
void drawPixel(int x, int y);
void drawLine(int x1, int y1, int x2, int y2);

void LCD_scroll(uint16_t x,uint16_t y,uint8_t r, uint8_t g, uint8_t b,char* str,int pos,int cnt);
void LCD_printint(uint16_t x,uint16_t y,uint8_t r, uint8_t g, uint8_t b,int data);

void ssd1289_char(color_t color, char ch, yaxis_t y, xaxis_t x);
void ssd1289_string(color_t color, char *string, yaxis_t y, xaxis_t x);
