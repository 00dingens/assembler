.model tiny
.code
mov dx,offset Meld
mov ax,0900h
int 21h
mov ax,4c00h
int 21h

.data
Meld	db "Hallo Welt!$"
end