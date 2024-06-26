.INCLUDE"M328pDEF.INC"
.ORG 0

	LDI R21, HIGH (RAMEND)
	OUT SPH, R21
	LDI R21, LOW (RAMEND)
	OUT SPL, R21

	LDI R31, 0xFF;
	OUT DDRD, R31;
	OUT DDRB, R31; 
	CBI PORTB, 2;
	CALL DELAY_2ms
	LDI R30, 0x38 ; Initialize
	CALL CMNDWRT
	CALL DELAY_2ms
	LDI R30, 0x0E ; Initialize
	CALL CMNDWRT
	CALL DELAY_2ms
	LDI R30, 0x01 ; Initialize
	CALL CMNDWRT
	CALL DELAY_2ms
	LDI R30, 0x06 ; Initialize
	CALL CMNDWRT
	CALL DELAY_2ms
	LDI R30, 'C'
	CALL DATAWRT
	LDI R30, 'O'
	CALL DATAWRT
	LDI R30, 'A'
	CALL DATAWRT
	LDI R30, 'L'
	CALL DATAWRT

HERE: JMP HERE

CMNDWRT: 
	OUT PORTD, R30
	CBI PORTB, 0
	CBI PORTB, 1
	SBI PORTB, 2
	CALL DELAY_100us
	CBI PORTB, 2
	CALL DELAY_100us
	RET

DATAWRT: 
	OUT PORTD, R30
	SBI PORTB, 0
	CBI PORTB, 1
	SBI PORTB, 2
	CALL DELAY_100us
	CBI PORTB, 2
	CALL DELAY_100us
	RET

// Delays ---------------------------------

SDELAY:
		NOP
		NOP
		RET
DELAY_100us:		
		PUSH R29
		LDI R17, 60
DRO:	CALL SDELAY
		DEC R29
		BRNE DRO
		POP R29
		RET
DELAY_2ms:
		PUSH R29
		LDI R29, 20
LDRO:	CALL DELAY_100us
		DEC R29
		BRNE LDRO
		POP R29
		RET


