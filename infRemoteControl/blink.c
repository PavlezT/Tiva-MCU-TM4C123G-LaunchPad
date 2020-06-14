


#include <msp430.h>
#define PIN_MASK PIN2+PIN3+PIN4+PIN5 //it's make rewiew and debug easily
#include <stdint.h>
//int a = int32_t A

volatile int flag = 0;
volatile int flagstart = 0;
volatile int i =0;
volatile int array[50];



uint8_t arrayFor1 [] = {1,1, 48,48,48,48,48,49,48,48,98,99,99,98,99,98,99,99,48,48,99,48,48,48,48,48,99,99,48,98,99,98,99,99 }; // ин
uint8_t arrayFor2 [] = {1,1, 48,49,48,48,48,48,48,48,99,99,98,99,99,98,99,98,99,48,99,48,48,48,48,48,49,98,48,99,99,98,99,98 }; // ин
uint8_t arrayFor3 [] = {1,1, 48,49,48,48,48,48,48,49,98,99,98,99,99,98,99,99,48,98,99,48,48,48,49,48,98,48,49,98,99,99,98,99 }; // ин
uint8_t arrayFor4 [] = {1,1, 48,48,48,49,48,48,48,48,99,98,99,99,98,99,98,99,48,48,48,99,48,48,48,49,98,99,98,49,98,99,98,99 }; // ин
uint8_t arrayFor5 [] = {1,1, 48,48,48,49,48,48,48,48,99,98,99,99,98,99,98,99,99,48,48,98,49,48,48,48,48,99,98,48,99,99,98,99 }; // ин
uint8_t arrayFor6 [] = {1,1, 49,48,48,48,48,48,49,48,98,99,99,98,99,99,98,99,48,99,48,99,48,48,48,48,99,48,99,48,99,98,99,98 }; // ин
uint8_t arrayFor7 [] = {1,1, 48,48,48,49,48,48,48,48,99,98,99,99,98,99,99,98,48,49,98,99,48,48,48,49,98,99,48,48,99,98,99,98 }; // ин
uint8_t arrayFor8 [] = {1,1, 48,49,48,48,48,48,48,49,98,99,99,98,99,99,98,99,99,48,99,98,48,49,48,48,48,99,48,48,99,99,98,99 }; // ин
uint8_t arrayFor9 [] = {1,1, 48,48,49,48,48,48,48,49,98,99,99,98,99,99,98,99,48,99,98,99,48,48,48,49,98,48,49,48,98,99,99,98 }; // ин
uint8_t arrayFor0 [] = {1,1, 48,48,49,48,48,48,48,48,99,99,98,99,99,98,99,99,98,48,49,48,98,49,48,48,48,99,99,98,48,99,99,98 }; // ин

unsigned int  j =0;
int err = 0;
unsigned  int wait =0;
int n =0;
int c = 0;
int count = 0;
int delta = 0;
int compare(){
    for(c = 2; c < 32;c++)
    {
        delta = array[c] - arrayFor1[c];
        if(delta > 10 || delta < -10){
            err =1;
            break;
        }
    }
    if(err == 0)
    {
        err =0;
        return 1;
    }
    err = 0;
    for(c = 2; c < 32;c++)
    {
        delta = array[c] - arrayFor2[c];
        if(delta > 10 || delta < -10){
            err =1;
            break;
        }
    }
    if(err == 0)
    {
        err =0;
        return 2;
    }
    err = 0;
    for(c = 2; c < 32;c++)
    {
        delta = array[c] - arrayFor3[c];
        if(delta > 10 || delta < -10){
            err =1;
            break;
        }
    }
    if(err == 0)
    {
        err =0;
        return 3;
    }
    err = 0;
    for(c = 2; c < 32;c++)
    {
        delta = array[c] - arrayFor4[c];
        if(delta > 10 || delta < -10)
        {
            err =1;
            break;
        }
    }
    if(err == 0)
    {
        err =0;
        return 4;
    }
    err = 0;
    for(c = 2; c < 32;c++)
    {
        delta = array[c] - arrayFor5[c];
        if(delta > 10 || delta < -10){
            err =1;
            break;
        }
     }
     if(err == 0)
     {
         err =0;
         return 5;
     }
     err = 0;
     for(c = 2; c < 32;c++)
     {
          delta = array[c] - arrayFor6[c];
          if(delta > 10 || delta < -10){
              err =1;
              break;
          }
     }
     if(err == 0)
     {
         err =0;
         return 6;
     }
     err = 0;
     for(c = 2; c < 32;c++)
          {
               delta = array[c] - arrayFor7[c];
               if(delta > 10 || delta < -10){
                   err =1;
                   break;
               }
          }
          if(err == 0)
          {
              err =0;
              return 7;
          }
          err = 0;
          for(c = 2; c < 32;c++)
               {
                    delta = array[c] - arrayFor8[c];
                    if(delta > 10 || delta < -10){
                        err =1;
                        break;
                    }
               }
               if(err == 0)
               {
                   err =0;
                   return 8;
               }
               err = 0;
               for(c = 2; c < 32;c++)
                    {
                         delta = array[c] - arrayFor9[c];
                         if(delta > 10 || delta < -10){
                             err =1;
                             break;
                         }
                    }
                    if(err == 0)
                    {
                        err =0;
                        return 9;
                    }
                    err = 0;

    return -1;

}
void main()
{
    WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
    P1DIR |= 0x01;
    P1SEL2 &= (~BIT2); // Set P2.1 SEL as GPIO
    P1DIR &= (~BIT2); // Set P2.1 SEL as Input
    P1IES |= (BIT2); // Falling Edge 1 -> 0
    P1IFG &= (~BIT2); // Clear interrupt flag for P2.1
    P1IE |= (BIT2); // Enable interrupt for P2.1
    __enable_interrupt(); // Enable Global Interrupts
    P1OUT ^= 0x01;
    while(1)
    {
        if(flag == 1)
        {
            array[j]=i;
            j++;
            flag = 0;
            i=0;
        }
        if(flagstart == 1){
            i++;
        }
        if(i > 10000){
            flagstart = 0;
            i = 0;
            j=0;
            count = compare();
            for(n = 0; n < count*2; n++){
                for(wait = 0; wait < 20000; wait ++){}
                P1OUT ^= 0x01;
            }
            for(n = 0; n < 100; n++){
                array[n]=0;
            }
            if(count > 0){
                P1OUT ^= 0x01;
            }
        }
    }
}

// Port 1 interrupt service routine
#pragma vector=PORT1_VECTOR
__interrupt void Port_1(void)
{
    if(flagstart==0){
        P1OUT ^= 0x01;
    }
    flagstart = 1;
    flag = 1;
    P1IFG &= (~BIT2);
    return;
}
