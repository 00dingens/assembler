.model tiny
.code
mov ax,0900h
mov dx,offset Hallo
int 21h
mov ax,0700h
Neu:
int 21h
cmp al,90 ;Z
je Zocker
cmp al,77 ;M
je Meister
cmp al,115 ;s
je xx
jmp Neu
Zocker:
int 21h
cmp al,111 ;o
jne Neu
int 21h
cmp al,99 ;c
jne Neu
int 21h
cmp al,107 ;k
jne Neu
int 21h
cmp al,101 ;e
jne Neu
int 21h
cmp al,114 ;r
jne Neu
mov ax,0900h
mov dx,offset Zocka
int 21h
mov ax,4c01h ;errorlevel=1
int 21h
Meister:
int 21h
cmp al,101 ;e
jne Neu
int 21h
cmp al,105 ;i
jne Neu
int 21h
cmp al,115 ;s
jne Neu
int 21h
cmp al,116 ;t
jne Neu
int 21h
cmp al,101 ;e
jne Neu
int 21h
cmp al,114 ;r
jne Neu
mov ax,0900h
mov dx,offset Meista
int 21h
mov ax,4c02h
int 21h
xx:
int 21h
cmp al,101 ;e
jne Neu
int 21h
cmp al,120 ;x
jne Neu
mov ax,0900h
mov dx,offset xxx
int 21h
mov ax,4c03h
int 21h

.data
Hallo	db "Hi, gib dein Passwort ein!",10,13,10,13,"$"
Zocka	db "Willkommen als Gast!",10,13,"$"
Meista	db "Aha, der Rafael geht dran. Willkommen, Meister!",10,13,"$"
xxx	db "Hast es wohl eilig, was?",10,13,"$"
end