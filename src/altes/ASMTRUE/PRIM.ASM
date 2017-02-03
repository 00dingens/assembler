A 0100
mov byte ptr bl,[0080]
xor bh,bh
mov [bx+81],24
mov ax,0900
mov dx,011B
int 21
mov dx,0082
int 21
mov dx,0139
int 21
mov ax,4C00
int 21
db "Es werden die Primzahlen bis $ errechnet.$"

R CX
100
N PRIM.COM
W
Q
