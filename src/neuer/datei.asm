.model tiny
.code

mov ax,ds
mov es,ax
mov bx,offset lng
mov ax,0201
mov dx,080
mov cx,0
int 013
jnb schluss
mov [offset meld],ah
mov ax,0900
mov dx,offset meld
int 021
schluss:
mov ax,04c00
int 021


;zu schreibenden bereich erstellen
mov bx,08000
leeren:
mov w [offset lng+bx],0
dec bx
dec bx
jnz leeren

;öffnen
mov ax,03c00
mov dx,offset dat
xor cx,cx
int 021
mov bx,ax

mb:
;schreiben
mov ax,020
schr:
mov es,ax
mov ax,04000
mov dx,offset lng
mov cx,08000
int 021
dec al
mov ax,es
dec ax
jnz schr

push bx
mov bx,4
zal:
mov al,[offset siz+bx]
inc al
mov [offset siz+bx],al
cmp al,"9"
jg nxt
jmp nnxt
nxt:
mov b [offset siz+bx],"0"
dec bx
jnc zal
nnxt:
pop bx

mov ax,0900
mov dx,offset meld
int 021

mov ah,01
int 16h
jnz ende
jmp mb

ende:
;schliessen
mov ax,03e00
int 021

mov ax,04c00
int 21h

.data
meld:	db "Die Datei "
dat:	db "C:\WINDOWS\DESKTOP\BOOT.TXT",0,"ist "
siz:	db "00000 MB gross.",0d,"$"
lng:	db 0
end