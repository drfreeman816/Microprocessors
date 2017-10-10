    indf    equ	    0x00
    status  equ	    0x03
    fsr	    equ	    0x04
    porta   equ	    0x05
    trisa   equ	    0x85
   
    rp0	    equ	    0x06
    rp1	    equ	    0x05
   
    ; Addresses
    count   equ	    0x20
    
    org 0x00
    
    ; Select bank #1
    bcf status, rp1
    bsf status, rp0	; rp = 01
    
    ; LEDS in PORTA    
    clrf trisa		; trisa = 0x00 (w)
    bsf trisa, 0	; trisa = 0x01 (r)
    
    ; Select bank #0
    bcf status, rp0	; rp = 00
    
    ; Initial state
    bsf porta, 1
    
    ; Polling
loop:
    
    btfsc porta, 0
    comf porta
    
    goto loop
   
    end