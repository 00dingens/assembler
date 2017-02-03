.model tiny
.code
mov ax,0
mov ds,ax
mov [0004],cx
mov w [0006],offset br
pushf
pop ax
or ax,010
push ax
popf
mov ax,4c00
int 21

br:
pushf
pop ax
and ax,0ef
push ax
popf

push cx
push ax
push dx

mov ax,0900
mov dx,offset bip
int 21

mov cx,0010
schleife:
loop schleife
pop cx
pop ax
pop dx
pushf
pop ax
or ax,010
push ax
popf
iret
bip:
db 7,"$"


end