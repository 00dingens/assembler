.model tiny
.code
mov ax,0900h
mov dx,offset Hallo
int 21h
mov ax,0700h
Neu:
int 21h
xor al,255
cmp al,133 ;z
je Zt
cmp al,140 ;s
je stre
jmp Neu

Zt:
int 21h
xor al,255
cmp al,139 ;t
jne Neu
mov ax,0900h
mov dx,offset Zet
int 21h
mov ax,4c00h
int 21h
stre:
int 21h
xor al,255
cmp al,139 ;t
jne Neu
int 21h
xor al,255
cmp al,141 ;r
jne Neu
int 21h
xor al,255
cmp al,154 ;e
jne Neu
mov ax,0900h
mov dx,offset stere
int 21h
mov ax,4c00h
int 21h

.data
Hallo	db "Hi Philipp, gib das Passwort ein!",10,13,10,13,"$"
Zet	db "Ach, heute mal die schnelle Version!",10,13,"$"
stere	db "Aha, der Philipp geht dran. Willkommen!",10,13,"$"
end