A 0100
jmp near 0126
db "Dez:           ; Hex:          - H$"
mov ax,0700
int 21
mov [0103],al
mov ax,0900
mov dx,0103
int 21
loop 0108
mov ax,4C00
int 21

r cx
100
n auto.com
w
q
