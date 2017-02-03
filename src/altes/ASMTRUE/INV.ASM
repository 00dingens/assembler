A 100
MOV AX,B800            ; Seg. Adr.
MOV DS,AX              ; Screen setzen
mov bx,0001
mov cx,0780
MOV ax,[bx]
xor ax,7F
mov [bx],ax
inc bx
inc bx
loop 010B
MOV AX,4C00            ; DOS-Exit
INT 21                 ; hier muss eine Leerzeile folgen

R CX
200
N inv.COM
W
Q
