.model tiny
.code
mov ax,0b800h
mov ds,ax
Ein:
mov bx,0000h
mov ax,0700h
int 21h
mov ah,0fh
mov cx,07d0h
Ueber:
mov [bx],ax
inc bx
inc bx
loop Ueber
cmp al,01bh
jne Ein
mov ax,4c00h
int 21h
end