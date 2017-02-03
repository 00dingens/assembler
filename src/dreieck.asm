.tiny mode
.code
jmp short programm

;  x1 y1 x2 y2 x3 y3 füll und rand-farbe (von QB übergeben)
dw 10,10,20,50,50,20,4,12

;  yyx1x2 programmvariablen
dw 0,0,0

programm:
;Bildschirm 13h setzen
mov  ax,0013h
int  10h

;richtige reihenfolge der punkte
;1 und 2 vergleichen
mov ax,[0104]
mov bx,[0108]
cmp ax,bx
jle marke1
mov [0104],bx
mov [0108],ax
mov ax,[0102]
mov bx,[0106]
mov [0102],bx
mov [0106],ax
marke1:

;1 und 3 vergleichen
mov ax,[0104]
mov bx,[010C]
cmp ax,bx
jle marke2
mov [0104],bx
mov [010C],ax
mov ax,[0102]
mov bx,[010A]
mov [0102],bx
mov [010A],ax
marke2:

;2 und 3 vergleichen
mov ax,[0108]
mov bx,[010C]
cmp ax,bx
jle marke3
mov [0108],bx
mov [010C],ax
mov ax,[0106]
mov bx,[010A]
mov [0106],bx
mov [010A],ax
marke3:
;jetzt ist p1 oben und p3 unten

;punkte setzen
mov ah,0Ch
mov al,[0110]
mov cx,[0102]
mov dx,[0104]
int 10h
mov cx,[0106]
mov dx,[0108]
int 10h
mov cx,[010A]
mov dx,[010C]
int 10h

mov bx,[0104]
mov [0112],bx
;jede reihe durchgehen
reihe:
mov ax,[0106]
sub ax,[0102]
mov bx,[0112]
sub bx,[0104]
mul bx
mov bx,[0108]
sub bx,[0104]


mov bx,[0112]
cmp bx,[010C]


;auf taste warten
warte:
mov  ah,01h
int  16h
jz  warte

;ende
mov ax,4C00h
int 21h

end

;Punkt setzen
;mov  cx,Spalte
;mov  dx,Zeile
;mov  al,Farbe
;int  10h
