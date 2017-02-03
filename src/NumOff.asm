A 100
;================================================
; File: NUMOFF.ASM (c) Born G. V 1.0
; Aufgabe: Abschalten der NumLock-Taste
;================================================
MOV AX,0000 ; ES := 0
MOV ES,AX
;
; lösche Bit 5 im Tastatur Flag
;
ES: AND BYTE PTR [0417],DF
;
; DOS-EXIT
;
MOV AX,4C00 ; Exit-Code
INT 21
; Leerzeile muß folgen
N NUMOFF.COM
R CX
30
W
Q