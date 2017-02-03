A 100
;================================================
; Aufgabe: Flimmern der NumLock-Lampe
;================================================
mov bx,0007
mov ax,0000
mov es,ax
es: xor byte ptr [0417],20
mov dx,00FF
mov cx,FFFF
loop 0114
mov cx,dx
dec dx
loop 0111
mov cx,bx
dec bx
loop 0108
mov ax,4C00
int 21

N NUMOFF2.COM
R CX
30
W
Q
