.model tiny
.code

;meld ausgeben
mov bx,0082
Noch:
MOV DL,[bx]
MOV AH,02
INT 21h
inc bx
cmp dl,0dh
jne Noch

;ende
mov ax,4c00h
int 21h

.data
db 0

end
