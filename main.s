; PIC Assembler Example
; Tested with PIC18F57Q43 Curiosity Nano Board

; custom linker options required
; -preset_vec=0h;-pint_vec_hi=8h
   
#include <xc.inc>

extrn init
    
psect reset_vec, class=CODE, reloc=2
reset_vec:
    PAGESEL start
    goto    start
 
psect code 
start:
    PAGESEL init
    call    init
    
 
main: 
; idle loop
    bra	    main        
    
END reset_vec

  
    