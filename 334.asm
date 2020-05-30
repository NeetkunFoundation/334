bits 16
org  0x7C00

DisplayMessage:
	PUSH	AX
	PUSH	BX
DispMsg:
	LODSB
	OR	AL, AL
	JZ	.DONE
	MOV	AH, 0x0E
	MOV	BH, 0x00
	MOV	BL, 0x07
	INT	0x10
	JMP	DispMsg
.DONE:
	POP	BX
	POP	AX
	RET

BOOT:
    CLI
    MOV SI, HMAGE
    CALL DisplayMessage
    HLT

HMAGE DB "hmagegox334", 0x00

TIMES 510 - ($ - $$) DB 0
DW 0xAA55