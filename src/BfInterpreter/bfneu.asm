section .text
global _start
_start:

;Arbeitsspeicher des Interpreter Leeren
;;; 10 Byte
XOR AL,AL		;= DB 30,C0 und 32 ist adresse für enter
xor ecx,ecx
MOV CH,1		;cl ist egal, weil jetzt 256<CX<511
			;ggf anz der parameter verwenden (sollte 3 sein)
mov edi,ArbSp
push edi
REP
STOSB

;Init		4 Byte
pop edi			;mov DI,offset ArbSp
pop esi	 ;anz parameter verwerfen
pop esi	 ;adresse des programmnamen verwerfen
pop esi  ;adresse bf code

Schritt:	;13 Byte
MOV AH,1
inc esi			;nächster Befehl
mov al,[esi]		;in AL holen
mov ebx,00f3h		;nullpunkt für xlat somit ist 0D auf 0100
xlat
call eax		;weil RET 1 Byte, JMP Schritt 4? Byte
JMP Schritt		;hier kommt RET an

Plus:		;3 Byte
INC BYTE [edi]
RET

;db "+,-."	;fälle durch ziele ersetzen
DB 1Bh, 39h, 36h, 23h

;NOP		;1 Byte

Punkt:		; .	;7 Byte
;MOV DL,[edi]
mov edx,1h
mov ecx,[edi]
mov ebx,0h
MOV eax,3h
INT 80h
RET

Schleife2:	; ]	;5 Byte
POP eAX			;kein RET
POP eSI
DEC eSI
JMP Schritt

;db "< >"	;space nutzen
DB 34h

Ende:		;4 Byte   POS 30
MOV eax,1h		;ohne errorlevel
int 80h

Links:		; <	;2 Byte
DEC edi
RET

Minus:		; -	;3 Byte
DEC BYTE [edi]
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

section .data
ArbSp	db 0

