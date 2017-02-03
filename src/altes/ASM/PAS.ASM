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
je Zocker
cmp al,146 ;m
je Meister
cmp al,140 ;s
je xx
jmp Neu

Zocker:
int 21h
xor al,255
cmp al,144 ;o
jne Neu
int 21h
xor al,255
cmp al,156 ;c
jne Neu
int 21h
xor al,255
cmp al,148 ;k
jne Neu
int 21h
xor al,255
cmp al,154 ;e
jne Neu
int 21h
xor al,255
cmp al,141 ;r
jne Neu
mov ax,0900h
mov dx,offset Zocka
int 21h
mov ax,4c00h ;errorlevel=1
int 21h
Meister:
int 21h
xor al,255
cmp al,154 ;e
jne Neu
int 21h
xor al,255
cmp al,150 ;i
jne Neu
int 21h
xor al,255
cmp al,140 ;s
jne Neu
int 21h
xor al,255
cmp al,139 ;t
jne Neu
int 21h
xor al,255
cmp al,154 ;e
jne Neu
int 21h
xor al,255
cmp al,141 ;r
jne Neu
mov ax,0900h
mov dx,offset Meista
int 21h
mov ax,4c00h
int 21h
Neu2:
jmp Neu
xx:
int 21h
xor al,255
cmp al,154 ;e
jne Neu2
int 21h
xor al,255
cmp al,135 ;x
jne Neu2
mov ax,0900h
mov dx,offset xxx
int 21h
mov ax,4c00h
int 21h

.data
Hallo	db "Hi, gib das Passwort ein!",10,13,10,13,"$"
Zocka	db "Willkommen, du Suchtie!",10,13,"$"
Meista	db "Aha, der Rafael geht dran. Willkommen, Meister!",10,13,"$"
xxx	db "Hast es wohl eilig, was?",10,13,"$"
end