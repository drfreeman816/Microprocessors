PROCESSOR PIC16F877A        ; especifica a arquitetura
INCLUDE <PIC16F877A.INC>    ; pega as constantes
__CONFIG _RC_OSC, _WD_OFF   ; configura o hardware (clock )

N1 EQU 0x21                 ; constantes do usuario
N2 EQU 0x20
T EQU 0x22

ORG 0x00                    ; começa escrevendo o código em [0x00]

CLRF N2                     ; [N2] = 0
MOVLW 0x01                  ; W = 1
MOVWF N1                    ; [N1] = W = 1

LOOP:
MOVF N1                     ; W = [N1]
ADDWF N2, 0                 ; W = W + [N2] = [N1] + [N2]
MOVWF T                     ; [T] = W = [N1] + [N2]
MOVF N1                     ; W = [N1]
MOVWF N2                    ; [N2] = W = [N1]
MOVF T                      ; W = [T]
MOVWF N1                    ; [N1] = W = [T]
GOTO LOOP

END
