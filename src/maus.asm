.model tiny
.code

mov ax,0012h
int 10h

xor ax,ax
int 33h

cmp ax,0
je ende

mov ax,1
int 33h

neu:;;;;;;;

mov ax,0003h
int 33h


;punkt setzen
dec dx
mov ah,0Ch
mov al,08h
cmp bx,0
je net
mov al,0fh
net:
int 10h


;ob ende
mov ah,01h
int 16h
jz neu;;;;;;;;;


ende:
mov ax,0003h
int 10h
mov ax,4c00h
int 21h

.data
end