Instruction set:
NOP
MOVLW L		; W = L
ADDW L		; W = W + L	
SUBW L		; W = W - L
ANDW L		; W = W && L
ORW L		; W = W || L
XORW L		; W = W xor L
GOTO L		; PC = L
BTFSS		; bit test flag skip if set
CLRS		; Clear status

Test parity:
NOP
MOVLW L		; W = L
ANDW 0x01	; Selects LSB
BTFSS 0x01	; if zero jump
GOTO (IMPAR)
PAR:
GOTO (FIM)
IMPAR:
FIM

Test sign (fixed point):
NOP
MOVLW L		; W = L
ANDW 0x80	; Selects MSB
BTFSS 0x01	; if zero jump
GOTO (NEGATIVO)
POSITIVO:
GOTO (FIM)
NEGATIVO:
FIM

With memory:
MOVWF MEM	; [MEM] = W
MOVF MEM	; W = [MEM]
ADDF MEM	; W = W + [MEM]
SUBW MEM	; W = W - [MEM]
ANDW MEM	; W = W && [MEM]
ORW MEM		; W = W || [MEM]
XORW MEM	; W = W xor [MEM]

Fibonacci:
NOP
MOVLW 0x00	; W = 0
MOVWF 0x20	; [0x20] = 0
MOVLW 0x01	; W = 1
ADDF 0x20	; W = W + [0x20]
MOVWF 0x20	; [0x20] = W
GOTO 0x04
