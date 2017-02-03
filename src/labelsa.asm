.model tiny
.code

;meld ausgeben
mov dx,offset Meld
mov ax,0900h
int 21h

;ende
mov ax,4c00h
int 21h

.data
Meld	db "Hallo Welt!$"

end