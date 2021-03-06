#include "ssd1289.h"
#include <string.h>

#define SYSENABLE(A)      SysCtlPeripheralEnable(A);while(!SysCtlPeripheralReady(A)){};

#define delay(A) SysCtlDelay(9000*A)
#define smalldelay //SysCtlDelay(1)



void itoa(int n, char s[]);
const unsigned char font_ascii[95][16];



#define cbi(reg, bitmask) GPIOPinWrite(reg,bitmask,0)
#define sbi(reg, bitmask) GPIOPinWrite(reg,bitmask,bitmask)
#define pulse_high(reg, bitmask) sbi(reg, bitmask);smalldelay;cbi(reg, bitmask);
#define pulse_low(reg, bitmask) cbi(reg, bitmask);smalldelay;sbi(reg, bitmask);





void LCD_Writ_Bus(uint8_t vh,uint8_t vl )
{

    GPIOPinWrite(GPIO_PORTB_BASE, 0xFF,vh);
    GPIOPinWrite(GPIO_PORTC_BASE, 0xF0,vl);
    GPIOPinWrite(GPIO_PORTE_BASE, 0x0F,vl);
    pulse_low(P_WR, B_WR);
}


void LCD_Write_COM(uint8_t VL)
{
    cbi(P_RS, B_RS);
    sbi(P_RD, B_RD);
    cbi(P_CS, B_CS);
    LCD_Writ_Bus(0x00,VL);
}

void LCD_Write_DATA(uint8_t VH,uint8_t VL)
{
    sbi(P_RS, B_RS);
    LCD_Writ_Bus(VH,VL);
}



void LCD_Write_COM_DATA(uint8_t com1,uint16_t dat1)
{
     LCD_Write_COM(com1);
     LCD_Write_DATA(dat1>>8,dat1);
}







void LCD_init()
{


    cbi(P_CS, B_CS);
    cbi(P_WR, B_WR);
    sbi(P_RD, B_RD);
    cbi(P_RS, B_RS);


    sbi(P_RST, B_RST);
    delay(5);
    cbi(P_RST, B_RST);
    delay(15);
    sbi(P_RST, B_RST);
    delay(15);





    cbi(P_CS, B_CS);



    LCD_Write_COM_DATA(0x0000,0x0001); //Start Oscillation OSCEN=1
    delay(15);
    LCD_Write_COM_DATA(0x0003,0xAAAC); //Power Control (1)
    LCD_Write_COM_DATA(0x000C,0x0002); //Power Control (2)
    LCD_Write_COM_DATA(0x000D,0x000A); //Power Control (3)
    LCD_Write_COM_DATA(0x000E,0x2C00); //Power Control (4)
    LCD_Write_COM_DATA(0x001E,0x00B8); //Power Control (5)

    delay(15);
    LCD_Write_COM_DATA(0x0001,0x2B3F); //Driver Output Control RL=0, REV=1, BGR=1, TB=1
    LCD_Write_COM_DATA(0x0002,0x0600); //Restore VSYNC mode from low power state
    LCD_Write_COM_DATA(0x0010,0x0000); //Sleep mode cancel
    LCD_Write_COM_DATA(0x0011,0x6030); //Entry Mode
                                        // DFM   0x4000 = 262L color
                                        // DFM   0x6000 = 65K color
                                        // AM    0x0000 = horizontal display
                                        // AM    0x0008 = Vertical display
                                        // ID[0] 0x0000 = horizontal decrement
                                        // ID[0] 0x0010 = horizontal increment
                                        // ID[1] 0x0000 = Vertical decrement
                                        // ID[1] 0x0020 = Vertical increment

    delay(30);
    LCD_Write_COM_DATA(0x0005,0x0000); // Compare register
    LCD_Write_COM_DATA(0x0006,0x0000); // Compare register
    // Horizontal and Vertical porch are for DOTCLK mode operation
    LCD_Write_COM_DATA(0x0016,0xEF1C); // Horizontal Porch
    LCD_Write_COM_DATA(0x0017,0x0003); // Vertical Porch
    // Display Control
    LCD_Write_COM_DATA(0x0007,0x0233); // Display Control
                                         // D1 0x0000 = display off
                                         // D1 0x0002 = display on
                                         // D0 0x0000 = internal display halt
                                         // D0 0x0001 = internal display operate

    LCD_Write_COM_DATA(0x000B,0x5312); // Frame cycle control
    LCD_Write_COM_DATA(0x000F,0x0000); // Gate Scan Position
    delay(20);
    // Vertical Scroll Control
    LCD_Write_COM_DATA(0x0041,0x0000); // Vertical Scroll Control
    LCD_Write_COM_DATA(0x0042,0x0000); // Vertical Scroll Control

    // 1st Screen driving position
    LCD_Write_COM_DATA(0x0048,0x0000); // Start position. 0
    LCD_Write_COM_DATA(0x0049,0x013F); // End position.   319

    // Source RAM address
    LCD_Write_COM_DATA(0x0044,0xEF00); //Horizontal RAM address position start/end setup
                                         //dec 239
                                         //dec 0, i.e. horizontal ranges from 0 -> 239
                                         //POR value is 0xEF00 anyway. This address must be set before RAM write

    LCD_Write_COM_DATA(0x0045,0x0000); //Vertical RAM address start position setting
                                         //0x0000 = dec 0
    LCD_Write_COM_DATA(0x0046,0x013F); //Vertical RAM address end position setting (0x013F = dec 319)

        // 2nd Screen driving position
//      LCD_WrCmd(0x004A);LCD_WrDat(0x0000); // Start position. 0
//      LCD_WrCmd(0x004B);LCD_WrDat(0x0000); // End position.   0
    delay(20);
    //gamma control
    LCD_Write_COM_DATA(0x0030,0x0707);
    LCD_Write_COM_DATA(0x0031,0x0704);
    LCD_Write_COM_DATA(0x0032,0x0204);
    LCD_Write_COM_DATA(0x0033,0x0201);
    LCD_Write_COM_DATA(0x0034,0x0203);
    LCD_Write_COM_DATA(0x0035,0x0204);
    LCD_Write_COM_DATA(0x0036,0x0204);
    LCD_Write_COM_DATA(0x0037,0x0502);
    LCD_Write_COM_DATA(0x003A,0x0302);
    LCD_Write_COM_DATA(0x003B,0x0500);

    delay(20);
    LCD_Write_COM(0x22);


    sbi(P_CS, B_CS);
}






void LCD_fillScr(uint8_t r, uint8_t g, uint8_t b)
{
    uint32_t i;
    char ch, cl;
    uint32_t n = ((uint32_t)LCD_WIDTH)*LCD_HEIGHT;

    ch=((r&248)|g>>5);
    cl=((g&28)<<3|b>>3);

    cbi(P_CS, B_CS);
    LCD_clrXY();

    sbi(P_RS, B_RS);
    for (i=0; i<n; i++)
    {
        LCD_Writ_Bus(ch,cl);

    }
    sbi(P_CS, B_CS);
}




void LCD_setXY(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
    LCD_Write_COM_DATA(0x44,(y2 << 8) + y1 );
    LCD_Write_COM_DATA(0x45,x1);
    LCD_Write_COM_DATA(0x46,x2);
    LCD_Write_COM_DATA(0x4e,y1);
    LCD_Write_COM_DATA(0x4f,x1);
    LCD_Write_COM(0x22);


}




void LCD_clrXY()
{

    LCD_setXY(0,0,LCD_WIDTH-1,LCD_HEIGHT-1);

}

void setColor(uint8_t r, uint8_t g, uint8_t b)
{
    fcolorr=r;
    fcolorg=g;
    fcolorb=b;
}

void setBackColor(uint8_t r, uint8_t g, uint8_t b)
{
    bcolorr=r;
    bcolorg=g;
    bcolorb=b;
}

void setPixel(uint8_t r,uint8_t g,uint8_t b)
{
    LCD_Write_DATA(((r&248)|g>>5),((g&28)<<3|b>>3));    // rrrrrggggggbbbbb
}

void drawPixel(int x, int y)
{
    LCD_setXY(x, y, x, y);
    setPixel(fcolorr, fcolorg, fcolorb);
    LCD_clrXY();
}

int sign(int x) {
    if (x > 0) return 1;
    if (x < 0) return -1;
    return 0;
}

void drawLine(int x1, int y1, int x2, int y2){
    if(x1 > x2){
        int temp = x2;
        x2 = x1;
        x1 = temp;

        temp = y2;
        y2 = y1;
        y1 = temp;
    }

    if(x2 == x1)
        x1--;

    int deltax = x2 - x1;
    int deltay = y2 - y1;

    float deltaerr = fabsf((float)deltay / (float)deltax);    // Assume deltax != 0 (line is not vertical),

    float error = 0.0; // No error at start

    int y = y1;
    int x = x1;

    for (;x < x2; x++){
        drawPixel(x,y);
        error = error + deltaerr;
        while (error >= 1){
            y = y + sign(deltay) * 1;
            error = error - 1;
            drawPixel(x,y);
        }
    }
}
void
ssd1289_char(color_t color, char ch, yaxis_t y, xaxis_t x)
{
    if((x + 8) > LCD_WIDTH ||(y + 16) > LCD_HEIGHT)
    {
        return;
    }

    ch -= 32;

    if(!(ch < 95))
    {
        /* overflow */
        return;
    }

    char *font = (char *)font_ascii[ch];

    uint8_t i, j;
    uint8_t fch;

    for(i = 0; (i < 16); i++)
    {
        fch = font[i];

        j = 0;
        while(true)
        {
            j++;
            if(fch & 0x01)
            {
                //ssd1289_pixel(color, y + i, x + j);
                drawPixel(x+j, y+i);
            }

            fch >>= 1;

            if(j >= 8)
                break;
        }
    }
}

void
ssd1289_string(color_t color, char *string, xaxis_t x, yaxis_t y)
{
    yaxis_t tx;
    x = LCD_WIDTH - x - 8;

    for(tx = x; *string; tx -= 8, string++)
    {
        ssd1289_char(color, *string, y, tx);
    }
}


const unsigned char font_ascii[95][16] =
{
    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*" ",0*/

    {0x00,0x00,0x00,0x18,0x3C,0x3C,0x3C,0x18,0x18,0x00,0x18,0x18,0x00,0x00,0x00,0x00},/*"!",1*/

    {0x00,0x00,0x00,0x66,0x66,0x66,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*""",2*/

    {0x00,0x00,0x00,0x36,0x36,0x7F,0x36,0x36,0x36,0x7F,0x36,0x36,0x00,0x00,0x00,0x00},/*"#",3*/

    {0x00,0x18,0x18,0x3C,0x66,0x60,0x30,0x18,0x0C,0x06,0x66,0x3C,0x18,0x18,0x00,0x00},/*"$",4*/

    {0x00,0x00,0x70,0xD8,0xDA,0x76,0x0C,0x18,0x30,0x6E,0x5B,0x1B,0x0E,0x00,0x00,0x00},/*"%",5*/

    {0x00,0x00,0x00,0x38,0x6C,0x6C,0x38,0x60,0x6F,0x66,0x66,0x3B,0x00,0x00,0x00,0x00},/*"&",6*/

    {0x00,0x00,0x00,0x18,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"'",7*/

    {0x00,0x00,0x00,0x0C,0x18,0x18,0x30,0x30,0x30,0x30,0x30,0x18,0x18,0x0C,0x00,0x00},/*"(",8*/

    {0x00,0x00,0x30,0x18,0x18,0x0C,0x0C,0x0C,0x0C,0x0C,0x18,0x18,0x30,0x00,0x00,0x00},/*")",9*/

    {0x00,0x00,0x00,0x00,0x00,0x36,0x1C,0x7F,0x1C,0x36,0x00,0x00,0x00,0x00,0x00,0x00},/*"*",10*/

    {0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x7E,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00},/*"+",11*/

    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1C,0x1C,0x0C,0x18,0x00,0x00},/*",",12*/

    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"-",13*/

    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1C,0x1C,0x00,0x00,0x00,0x00},/*".",14*/

    {0x00,0x00,0x00,0x06,0x06,0x0C,0x0C,0x18,0x18,0x30,0x30,0x60,0x60,0x00,0x00,0x00},/*"/",15*/

    {0x00,0x00,0x00,0x1E,0x33,0x37,0x37,0x33,0x3B,0x3B,0x33,0x1E,0x00,0x00,0x00,0x00},/*"0",16*/

    {0x00,0x00,0x00,0x0C,0x1C,0x7C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x00,0x00,0x00,0x00},/*"1",17*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x06,0x0C,0x18,0x30,0x60,0x7E,0x00,0x00,0x00,0x00},/*"2",18*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x06,0x1C,0x06,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"3",19*/

    {0x00,0x00,0x00,0x30,0x30,0x36,0x36,0x36,0x66,0x7F,0x06,0x06,0x00,0x00,0x00,0x00},/*"4",20*/

    {0x00,0x00,0x00,0x7E,0x60,0x60,0x60,0x7C,0x06,0x06,0x0C,0x78,0x00,0x00,0x00,0x00},/*"5",21*/

    {0x00,0x00,0x00,0x1C,0x18,0x30,0x7C,0x66,0x66,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"6",22*/

    {0x00,0x00,0x00,0x7E,0x06,0x0C,0x0C,0x18,0x18,0x30,0x30,0x30,0x00,0x00,0x00,0x00},/*"7",23*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x76,0x3C,0x6E,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"8",24*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x66,0x66,0x3E,0x0C,0x18,0x38,0x00,0x00,0x00,0x00},/*"9",25*/

    {0x00,0x00,0x00,0x00,0x00,0x1C,0x1C,0x00,0x00,0x00,0x1C,0x1C,0x00,0x00,0x00,0x00},/*":",26*/

    {0x00,0x00,0x00,0x00,0x00,0x1C,0x1C,0x00,0x00,0x00,0x1C,0x1C,0x0C,0x18,0x00,0x00},/*";",27*/

    {0x00,0x00,0x00,0x06,0x0C,0x18,0x30,0x60,0x30,0x18,0x0C,0x06,0x00,0x00,0x00,0x00},/*"<",28*/

    {0x00,0x00,0x00,0x00,0x00,0x00,0x7E,0x00,0x7E,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"=",29*/

    {0x00,0x00,0x00,0x60,0x30,0x18,0x0C,0x06,0x0C,0x18,0x30,0x60,0x00,0x00,0x00,0x00},/*">",30*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x0C,0x18,0x18,0x00,0x18,0x18,0x00,0x00,0x00,0x00},/*"?",31*/

    {0x00,0x00,0x00,0x7E,0xC3,0xC3,0xCF,0xDB,0xDB,0xCF,0xC0,0x7F,0x00,0x00,0x00,0x00},/*"@",32*/

    {0x00,0x00,0x00,0x18,0x3C,0x66,0x66,0x66,0x7E,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"A",33*/

    {0x00,0x00,0x00,0x7C,0x66,0x66,0x66,0x7C,0x66,0x66,0x66,0x7C,0x00,0x00,0x00,0x00},/*"B",34*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x60,0x60,0x60,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"C",35*/

    {0x00,0x00,0x00,0x78,0x6C,0x66,0x66,0x66,0x66,0x66,0x6C,0x78,0x00,0x00,0x00,0x00},/*"D",36*/

    {0x00,0x00,0x00,0x7E,0x60,0x60,0x60,0x7C,0x60,0x60,0x60,0x7E,0x00,0x00,0x00,0x00},/*"E",37*/

    {0x00,0x00,0x00,0x7E,0x60,0x60,0x60,0x7C,0x60,0x60,0x60,0x60,0x00,0x00,0x00,0x00},/*"F",38*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x60,0x60,0x6E,0x66,0x66,0x3E,0x00,0x00,0x00,0x00},/*"G",39*/

    {0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x7E,0x66,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"H",40*/

    {0x00,0x00,0x00,0x3C,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x3C,0x00,0x00,0x00,0x00},/*"I",41*/

    {0x00,0x00,0x00,0x06,0x06,0x06,0x06,0x06,0x06,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"J",42*/

    {0x00,0x00,0x00,0x66,0x66,0x6C,0x6C,0x78,0x6C,0x6C,0x66,0x66,0x00,0x00,0x00,0x00},/*"K",43*/

    {0x00,0x00,0x00,0x60,0x60,0x60,0x60,0x60,0x60,0x60,0x60,0x7E,0x00,0x00,0x00,0x00},/*"L",44*/

    {0x00,0x00,0x00,0x63,0x63,0x77,0x6B,0x6B,0x6B,0x63,0x63,0x63,0x00,0x00,0x00,0x00},/*"M",45*/

    {0x00,0x00,0x00,0x63,0x63,0x73,0x7B,0x6F,0x67,0x63,0x63,0x63,0x00,0x00,0x00,0x00},/*"N",46*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"O",47*/

    {0x00,0x00,0x00,0x7C,0x66,0x66,0x66,0x7C,0x60,0x60,0x60,0x60,0x00,0x00,0x00,0x00},/*"P",48*/

    {0x00,0x00,0x00,0x3C,0x66,0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x0C,0x06,0x00,0x00},/*"Q",49*/

    {0x00,0x00,0x00,0x7C,0x66,0x66,0x66,0x7C,0x6C,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"R",50*/

    {0x00,0x00,0x00,0x3C,0x66,0x60,0x30,0x18,0x0C,0x06,0x66,0x3C,0x00,0x00,0x00,0x00},/*"S",51*/

    {0x00,0x00,0x00,0x7E,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x00,0x00,0x00,0x00},/*"T",52*/

    {0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"U",53*/

    {0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x18,0x00,0x00,0x00,0x00},/*"V",54*/

    {0x00,0x00,0x00,0x63,0x63,0x63,0x6B,0x6B,0x6B,0x36,0x36,0x36,0x00,0x00,0x00,0x00},/*"W",55*/

    {0x00,0x00,0x00,0x66,0x66,0x34,0x18,0x18,0x2C,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"X",56*/

    {0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x3C,0x18,0x18,0x18,0x18,0x00,0x00,0x00,0x00},/*"Y",57*/

    {0x00,0x00,0x00,0x7E,0x06,0x06,0x0C,0x18,0x30,0x60,0x60,0x7E,0x00,0x00,0x00,0x00},/*"Z",58*/

    {0x00,0x00,0x00,0x3C,0x30,0x30,0x30,0x30,0x30,0x30,0x30,0x30,0x30,0x30,0x3C,0x00},/*"[",59*/

    {0x00,0x00,0x00,0x60,0x60,0x30,0x30,0x18,0x18,0x0C,0x0C,0x06,0x06,0x00,0x00,0x00},/*"\",60*/

    {0x00,0x00,0x00,0x3C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x3C,0x00},/*"]",61*/

    {0x00,0x18,0x3C,0x66,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"^",62*/

    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00},/*"_",63*/

    {0x00,0x00,0x00,0x18,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"'",64*/

    {0x00,0x00,0x00,0x00,0x00,0x3C,0x06,0x06,0x3E,0x66,0x66,0x3E,0x00,0x00,0x00,0x00},/*"a",65*/

    {0x00,0x00,0x00,0x60,0x60,0x7C,0x66,0x66,0x66,0x66,0x66,0x7C,0x00,0x00,0x00,0x00},/*"b",66*/

    {0x00,0x00,0x00,0x00,0x00,0x3C,0x66,0x60,0x60,0x60,0x66,0x3C,0x00,0x00,0x00,0x00},/*"c",67*/

    {0x00,0x00,0x00,0x06,0x06,0x3E,0x66,0x66,0x66,0x66,0x66,0x3E,0x00,0x00,0x00,0x00},/*"d",68*/

    {0x00,0x00,0x00,0x00,0x00,0x3C,0x66,0x66,0x7E,0x60,0x60,0x3C,0x00,0x00,0x00,0x00},/*"e",69*/

    {0x00,0x00,0x00,0x1E,0x30,0x30,0x30,0x7E,0x30,0x30,0x30,0x30,0x00,0x00,0x00,0x00},/*"f",70*/

    {0x00,0x00,0x00,0x00,0x00,0x3E,0x66,0x66,0x66,0x66,0x66,0x3E,0x06,0x06,0x7C,0x00},/*"g",71*/

    {0x00,0x00,0x00,0x60,0x60,0x7C,0x66,0x66,0x66,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"h",72*/

    {0x00,0x00,0x18,0x18,0x00,0x78,0x18,0x18,0x18,0x18,0x18,0x7E,0x00,0x00,0x00,0x00},/*"i",73*/

    {0x00,0x00,0x0C,0x0C,0x00,0x3C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x78,0x00},/*"j",74*/

    {0x00,0x00,0x00,0x60,0x60,0x66,0x66,0x6C,0x78,0x6C,0x66,0x66,0x00,0x00,0x00,0x00},/*"k",75*/

    {0x00,0x00,0x00,0x78,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x7E,0x00,0x00,0x00,0x00},/*"l",76*/

    {0x00,0x00,0x00,0x00,0x00,0x7E,0x6B,0x6B,0x6B,0x6B,0x6B,0x63,0x00,0x00,0x00,0x00},/*"m",77*/

    {0x00,0x00,0x00,0x00,0x00,0x7C,0x66,0x66,0x66,0x66,0x66,0x66,0x00,0x00,0x00,0x00},/*"n",78*/

    {0x00,0x00,0x00,0x00,0x00,0x3C,0x66,0x66,0x66,0x66,0x66,0x3C,0x00,0x00,0x00,0x00},/*"o",79*/

    {0x00,0x00,0x00,0x00,0x00,0x7C,0x66,0x66,0x66,0x66,0x66,0x7C,0x60,0x60,0x60,0x00},/*"p",80*/

    {0x00,0x00,0x00,0x00,0x00,0x3E,0x66,0x66,0x66,0x66,0x66,0x3E,0x06,0x06,0x06,0x00},/*"q",81*/

    {0x00,0x00,0x00,0x00,0x00,0x66,0x6E,0x70,0x60,0x60,0x60,0x60,0x00,0x00,0x00,0x00},/*"r",82*/

    {0x00,0x00,0x00,0x00,0x00,0x3E,0x60,0x60,0x3C,0x06,0x06,0x7C,0x00,0x00,0x00,0x00},/*"s",83*/

    {0x00,0x00,0x00,0x30,0x30,0x7E,0x30,0x30,0x30,0x30,0x30,0x1E,0x00,0x00,0x00,0x00},/*"t",84*/

    {0x00,0x00,0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x66,0x66,0x3E,0x00,0x00,0x00,0x00},/*"u",85*/

    {0x00,0x00,0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x66,0x3C,0x18,0x00,0x00,0x00,0x00},/*"v",86*/

    {0x00,0x00,0x00,0x00,0x00,0x63,0x6B,0x6B,0x6B,0x6B,0x36,0x36,0x00,0x00,0x00,0x00},/*"w",87*/

    {0x00,0x00,0x00,0x00,0x00,0x66,0x66,0x3C,0x18,0x3C,0x66,0x66,0x00,0x00,0x00,0x00},/*"x",88*/

    {0x00,0x00,0x00,0x00,0x00,0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x0C,0x18,0xF0,0x00},/*"y",89*/

    {0x00,0x00,0x00,0x00,0x00,0x7E,0x06,0x0C,0x18,0x30,0x60,0x7E,0x00,0x00,0x00,0x00},/*"z",90*/

    {0x00,0x00,0x00,0x0C,0x18,0x18,0x18,0x30,0x60,0x30,0x18,0x18,0x18,0x0C,0x00,0x00},/*"{",91*/

    {0x00,0x00,0x00,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x00},/*"|",92*/

    {0x00,0x00,0x00,0x30,0x18,0x18,0x18,0x0C,0x06,0x0C,0x18,0x18,0x18,0x30,0x00,0x00},/*"}",93*/

    {0x00,0x00,0x00,0x71,0xDB,0x8E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},/*"~",94*/
};



