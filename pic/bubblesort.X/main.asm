    ; Addresses
    indf    equ	    0x00
    status  equ	    0x03
    fsr	    equ	    0x04
    
    count   equ	    0x20
    temp    equ	    0x21
    a1	    equ	    0x22

    ; Tab size
    n	    equ	    0x07

    org 0x00

run:

    ; count = n
    movlw n         ; w = n
    movwf count     ; count = w = n
    ;decf count, 1	; count--

    ; fsr+1 = a1 + n
    movlw a1        ; w = a1
    addlw n         ; w = w + n = a1 + n
    movwf fsr       ; fsr+1 = w = a1 + n

    ; Clear flag
    bcf temp, 0     ; temp[0] = 0

loop:

    ; Test *(fsr+1) and *fsr
    movf indf, 0    ; w = *(fsr+1)
    decf fsr        ; fsr--
    subwf indf, 0   ; w = w - *fsr = *(fsr+1) - *fsr

    ; Swap *fsr <-> *(fsr+1) if *(fsr+1) < *fsr
    btfsc status, 0 ; skip if not underflow (*(fsr+1) > *fsr)
    call swap       ; swap *fsr <-> *(fsr+1) if *(fsr+1) < *fsr

    decfsz count, 1 ; count-- ; skip if zero
    goto loop

    ; Test flag
    btfsc temp, 0 ; skip if temp[0] == 0
    goto run

    goto fim

swap:		    ; swap *fsr <-> *(fsr+1)

    ; temp = *fsr
    movf indf, 0    ; w = *fsr
    movwf temp      ; temp = w = *fsr

    ; *fsr = *(fsr+1)
    incf fsr        ; fsr++
    movf indf, 0    ; w = *(fsr+1)
    decf fsr        ; fsr--
    movwf indf      ; *fsr = w = *(fsr+1)

    ; *(fsr+1) = temp
    movf temp, 0    ; w = temp
    incf fsr        ; fsr++
    movwf indf      ; *(fsr+1) = w = temp
    decf fsr        ; fsr--

    ; Set flag
    bsf temp, 0     ; temp[0] = 1

    return

fim:

    end