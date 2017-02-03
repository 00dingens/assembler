.model tiny
.code

;Leeren		10 Byte
XOR AL,AL		;= DB 30,C0 und 32 ist adresse für enter
MOV CH,1		;cl ist egal, weil jetzt 256<CX<511
MOV DI,OFFSET ArbSp
PUSH DI
REP
STOSB
;Init		4 Byte
POP DI			;mov DI,offset ArbSp
MOV SI,0801h
Schritt:	;13 Byte
MOV AH,1
inc SI			;nächster Befehl
mov AL,[SI]		;in AL holen
mov BX,00f3h		;somit ist 0D auf 0100
xlat
CALL AX			;weil RET 1 Byte, JMP Schritt 2 Byte
JMP Schritt		;hier kommt RET an

Plus:		;3 Byte
INC BYTE [DI]
RET

;db "+,-."	;fälle durch ziele ersetzen
DB 1Bh, 39h, 36h, 23h

;NOP		;1 Byte

Punkt:		; .	;7 Byte
MOV DL,[DI]
MOV AH,02
INT 21h
RET

Schleife2:	; ]	;5 Byte
POP AX			;kein RET
POP SI
DEC SI
JMP Schritt

;db "< >"	;space nutzen
DB 34h

Ende:		;4 Byte   POS 30
;mov ax,4c00h		;Dos Errorlevel=0
MOV AH,4Ch		;ohne errorlevel
int 21h

Links:		; <	;2 Byte
DEC DI
RET

Minus:		; -	;3 Byte
DEC BYTE [DI]
RET

Komma:		; ,	;7 Byte
MOV AH,07h
INT 21h
MOV [DI],AL
RET

Schleife1:	;32 Byte [
pop ax			;weil kein RET
push SI
mov AL,[DI]
cmp AL,0
jne Schritt
mov AL,1	;offeneKlammernZähler
jmp SHORT Weiter

Rechts:		;2 Byte > POS 4C
INC DI
RET

;db "[ ]"
DB 40h, 0, 2Ah
Weiter:

pop SI		;nicht mehr sprungziel
Such:		;Suche entsprechende ]
inc SI
mov AH,[SI]
cmp AH,'['
jne KeiKl1
inc AL
KeiKl1:
cmp AH,']'
jne Such
dec AL
;cmp AL,0
jz Schritt
jmp Such


.data
ArbSp	db 0
end