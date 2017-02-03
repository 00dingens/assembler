A 100
mov dx,00FF
MOV AX,B800            ; Seg. Adr.
MOV DS,AX              ; Screen setzen
mov bx,0001
mov cx,0780
MOV ax,[bx]
xor ax,7F
mov [bx],ax
inc bx
inc bx
loop 010E
dec dx
mov cx,dx
loop 0103
MOV AX,4C00            ; DOS-Exit
INT 21                 ; hier muss eine Leerzeile folgen

R CX
200
N i2.COM
W
Q
