.model tiny
.code

mov ax,offset Dat
mov di,ax
los:
mov dx,di
mov ax,00020
mov cx,000ff
repnz
scasb
dec di
mov b [di],0
inc di

mov ax,03c00
xor cx,cx
int 021
mov bx,ax
mov ax,03e00
int 021
cmp b [di],"."
jne los

mov ax,04c00
int 21h

.data
Erkl	db "Dieses Programm von Rafael öffnet alle in der Liste enthaltenen Dateien "
	db "und löscht deren Inhalt. Nicht vorhandene Dateien werden erstellt. "
	db "Hier folgen die Name der Dateien, die ge'nullt' werden sollen, "
	db "jeweils getrennt durch Leerzeichen. Die Liste wird beendet mit "
	db "einem Leerzeichen und einem Punkt direkt nach dem letzten Dateinamen. ->"
Dat	db "c:\windows\desktop\rafael.txt c:\windows\desktop\rafi.txt c:\windows\desktop\raf.txt ."


end