.model tiny
.code

mov ax,0301	;01=sektorenanzahl
xor cx,cx
mov dx,080
mov bx,offset dat
int 013

mov ax,4c00h
int 21h

.data
dat	mov ax,0b000
	mov es,ax
	mov

end