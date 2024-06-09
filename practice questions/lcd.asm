DATARD:
    CBI PORTB, 0 ; Set RS to command mode
    SBI PORTB, 1 ; Set RW to read mode
    SBI PORTB, 2 ; Set E to high
    CALL DELAY_100us ; Wait for the data to become available
    IN R30, PORTD ; Read the data from the data pins
    CBI PORTB, 2 ; Set E to low
    RET
    
    
.INCLUDE " M328pDEF.INC "
.ORG 0

; Stack Pointer Setup
LDI R21 , HIGH ( RAMEND )

OUT SPH , R21

LDI R21 , LOW ( RAMEND )

OUT SPL , R21

; Initialize Ports
LDI R31 , 0 x00

OUT DDRD , R31

LDI R31 , 0 xFF

OUT DDRB , R31

CBI PORTB , 2

; Set PORTD pins as input
; Write to DDRD to set pins as input
; Set PORTB pins as output

; Initialize LCD
CALL DELAY_2ms

LDI R30 , 0 x38

CALL CMNDWRT

CALL DELAY_2ms

LDI R30 , 0 x0E

CALL CMNDWRT

CALL DELAY_2ms

LDI R30 , 0 x01

CALL CMNDWRT

CALL DELAY_2ms

LDI R30 , 0 x06

CALL CMNDWRT

CALL DELAY_2ms

; Function set : 8 - bit , 2 lines , 5 x8 dots
; Display on , cursor on , blink off
; Clear display
; Entry mode set : increment cursor , no shift

; Main loop
HERE :

IN R30 , PIND

ANDI R30 , 0 x03

CALL DATAWRT

CALL DELAY_2ms

JMP HERE


Read input from PORTD
Apply bitmask to isolate PD0 and PD1
Write input to LCD
Wait for 2 ms

CMNDWRT :
OUT PORTD , R30
CBI PORTB , 0
CBI PORTB , 1
SBI PORTB , 2
CALL DELAY_100us
CBI PORTB , 2
CALL DELAY_100us
RET

DATAWRT :
OUT PORTD , R30
SBI PORTB , 0
CBI PORTB , 1
SBI PORTB , 2
CALL DELAY_100us
CBI PORTB , 2
CALL DELAY_100us
RET
59

; Delays - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

SDELAY :
NOP
NOP
RET

DELAY_100us :
PUSH R29

LDI R29 , 60
 DRO :

CALL SDELAY

DEC R29

BRNE DRO

POP R29

RET

DELAY_2ms :
PUSH R29

LDI R29 , 20
 LDRO :

CALL DELAY_100us

DEC R29

BRNE LDRO

POP R29

RET
