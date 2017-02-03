A 100
;=========================================
; File: SCREEN.ASM (c) G. Born
; Aufgabe: Ausgabe des Buchstabens A auf
; dem Bildschirm. Es wird direkt in den
; Speicher ab der Segmentadresse geschrie-
; ben. Die Adresse liegt bei B000H (mono)
; oder B800 (color).
;=========================================
MOV AX,B800         ; Seg. Adr.
MOV DS,AX           ; Screen setzen
MOV BYTE [0500],41  ; 'A'
MOV BYTE [0501],7F  ; Attibut invers
MOV AX,4C00         ; DOS-Exit
INT 21              ; hier muss eine Leerzeile folgen

R CX
200
N SCREEN.COM
W
Q
