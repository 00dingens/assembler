.model tiny
.code
mov ax,0900h
mov dx,offset text
int 21h
los:
jmp los

.data
text	db "Schalte den Computer aus!$"
end