    indf    equ 0x00
    status  equ 0x03
    fsr	    equ 0x04
    
; Addresses
    temp    equ 0x20
    top	    equ 0x21
    a0	    equ 0x22
	    
org 0x00
	    
    movlw 0x11
    call push
    
    movlw 0x22
    call push
    
    call pop
    
    call pop
    
push:
    
    ; Save value
    movwf temp
    
    ; Point to end of array
    incf top, 1
    movf top, 0
    movwf fsr
    
    ; Insert element
    movf temp, 0
    movwf indf
    
    return

pop:
    
    ; Point to end of array
    movf top, 0
    movwf fsr
    
    ; fsr--
    decf fsr, 1
    
; Shift array
mov:
    
    ; temp = *(fsr-1)
    movf indf, 0
    movwf temp
    
    ; *(fsr-1) = *fsr
    incf fsr, 1
    movf indf, 0
    decf fsr, 1
    movwf indf
    
    ; *fsr = temp;
    movf temp, 0
    incf fsr, 1
    movwf indf
    
    goto mov
    
    ; Store value
    movf indf, 0
    
    return
    
end
