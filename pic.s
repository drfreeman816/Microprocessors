PROCESSOR PIC16F877A        ; especifica a arquitetura
INCLUDE <PIC16F877A.INC>    ; pega as constantes
__CONFIG _RC_OSC, _WD_OFF   ; configura o hardware (clock )

DORITOS EQO 0x30            ; constantes do usuario

ORG 0x00                    ; começa escrevendo o código em [0x00]

...

END
