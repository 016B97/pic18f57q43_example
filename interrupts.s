; PIC Assembler Example
; Tested with PIC18F57Q43 Curiosity Nano Board

    
#include <xc.inc>

extrn timer_handler, uart1_handler
    
psect   int_vec_hi,class=CODE, reloc=2
    PAGESEL high_isr
    goto    high_isr
    
    
psect code   
 
high_isr:
    btfsc   TMR0IF
    call    isr_timer0

    btfsc   U1RXIF
    call    isr_uart1
        
    retfie  1 ;restore registers from shadow         

isr_timer0:
    bcf	    TMR0IF
    PAGESEL timer_handler
    call    timer_handler
    return

isr_uart1:
    banksel U1RXB
    movf    U1RXB,W,b  
    PAGESEL uart1_handler
    call    uart1_handler
    return
    