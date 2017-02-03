.model tiny
.code
;Maske
mov ax,0b800
mov es,ax
es: mov b [0000],04b
es: mov b [0002],061
es: mov b [0004],072
es: mov b [0006],074
es: mov b [0008],065
es: mov b [000a],06e
es: mov b [000c],03a

;1Schleife anfang
mov b Nr1,0
Karte1:

;1Werte eintragen
xor ah,ah
mov al,Nr1
mov bx,4
div bl
mov Wert1,al	;Wert
mov Far1,ah	;Farbe
add ah,3
es: mov b [0010],ah
shl al,1
xor bh,bh
mov bl,al
mov dx,Stapel+bx
es: mov b [0012],dl
es: mov b [0014],dh

;2Schleife anfang
mov b Nr2,[offset Nr1]
inc b Nr2
Karte2:

;2Werte eintragen
xor ah,ah
mov al,Nr2
mov bx,4
div bl
mov Wert2,al	;Wert
mov Far2,ah	;Farbe
add ah,3
es: mov b [0018],ah
shl al,1
xor bh,bh
mov bl,al
mov dx,Stapel+bx
es: mov b [001a],dl
es: mov b [001c],dh

;3Schleife anfang
mov b Nr3,[offset Nr2]
inc b Nr3
Karte3:

;3Werte eintragen
xor ah,ah
mov al,Nr3
mov bx,4
div bl
mov Wert3,al	;Wert
mov Far3,ah	;Farbe
add ah,3
es: mov b [0020],ah
shl al,1
xor bh,bh
mov bl,al
mov dx,Stapel+bx
es: mov b [0022],dl
es: mov b [0024],dh

;4Schleife anfang
mov b Nr4,[offset Nr3]
inc b Nr4
Karte4:

;4Werte eintragen
xor ah,ah
mov al,Nr4
mov bx,4
div bl
mov Wert4,al	;Wert
mov Far4,ah	;Farbe
add ah,3
es: mov b [0028],ah
shl al,1
xor bh,bh
mov bl,al
mov dx,Stapel+bx
es: mov b [002a],dl
es: mov b [002c],dh

;5Schleife anfang
mov b Nr5,[offset Nr4]
inc b Nr5
Karte5:

;5Werte eintragen
xor ah,ah
mov al,Nr5
mov bx,4
div bl
mov Wert5,al	;Wert
mov Far5,ah	;Farbe
add ah,3
es: mov b [0030],ah
shl al,1
xor bh,bh
mov bl,al
mov dx,Stapel+bx
es: mov b [0032],dl
es: mov b [0034],dh

;Paar?
Paar:
xor ah,ah
mov al,Wert1
cmp al,Wert2
je Paarw
cmp al,Wert3
je Paarw
cmp al,Wert4
je Paarw
cmp al,Wert5
je Paarw
mov al,Wert2
cmp al,Wert3
je Paarw
cmp al,Wert4
je Paarw
cmp al,Wert5
je Paarw
mov al,Wert3
cmp al,Wert4
je Paarw
cmp al,Wert5
je Paarw
mov al,Wert4
cmp al,Wert5
je Paarw
jmp Paarf
Paarw:
;Paarc-Zähler erhöhen
mov al,"9"
mov cx,8
Paarcs:
mov bx,cx
inc b Paarc+bx
cmp al,Paarc+bx
jge Paarf
mov b Paarc+bx,"0"
loop Paarcs
Paarf:

found:   ;die beste möglichkeit wurde ermittelt
;Zähler erhöhen
mov al,"9"
mov cx,8
Couns:
mov bx,cx
inc b Count+bx
cmp al,Count+bx
jge Counf
mov b Count+bx,"0"
loop Couns
Counf:

;5Schleife Ende
inc b Nr5
cmp b Nr5,51
jg K5fert
jmp Karte5
K5fert:

;4Schleife Ende
inc b Nr4
cmp b Nr4,50
jg K4fert
jmp Karte4
K4fert:

;3Schleife Ende
inc b Nr3
cmp b Nr3,49
jg K3fert
jmp Karte3
K3fert:

;2Schleife Ende
inc b Nr2
cmp b Nr2,48
jg K2fert
jmp Karte2
K2fert:

;1Schleife Ende
inc b Nr1
cmp b Nr1,47
jg K1fert
jmp Karte1
K1fert:

mov ax,0900
mov dx,offset Schluss
int 021

;Ende
mov ax,4c00h
int 21h


;***Schleife:***
; mov b Nr1,1
; Karte1:
;***Inhalt***
; inc b Nr1
; cmp b Nr1,48
; jg K1fert
; jmp Karte1
; K1fert:
;***Ende***


.data
Nr1	db 0		;Kartennr.
Far1	db 0		;Farbe
Wert1	db 0		;Wert
Nr2	db 0		;Kartennr.
Far2	db 0		;Farbe
Wert2	db 0		;Wert
Nr3	db 0		;Kartennr.
Far3	db 0		;Farbe
Wert3	db 0		;Wert
Nr4	db 0		;Kartennr.
Far4	db 0		;Farbe
Wert4	db 0		;Wert
Nr5	db 0		;Kartennr.
Far5	db 0		;Farbe
Wert5	db 0		;Wert
Stapel	db "2 3 4 5 6 7 8 9 10B D K A "
Schluss	db "      Kartenkombinationen:",0d,0a
Count	db "000000000 Mögliche Kombinationen überhaupt",0d,0a
Paarc	db "000000000 Paare$",0d,0a
end
