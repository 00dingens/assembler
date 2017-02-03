.model tiny
.code
mov ax,0b800
mov es,ax
weiter:
mov cx,4000
schl:
add dx,cx
mov bx,cx
es: mov w [bx],dx
loop schl


mov ax,0100
int 16h
jnz ende
jmp weiter

ende:
mov ax,04c00h
int 21h

.data
end