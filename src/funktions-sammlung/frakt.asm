; dieses Programm soll die Mandelbromenge berechnen und darstellen.
; später mit animiertem zoom und drehung

;berechnung:
;z(0)=0+0i
;c ist die komplexe zahl an der stelle des aktuellen pixels (x+yi)
;formel: z(n+1)=z(n)^2 + c
;also:
;a=a^2 - b^2 + x
;b=2ab + y


; Zahlenformat: z.B. 1 Byte Vorzeichen und 255 ByteStellen

.model tiny
.code
;evtl. bildschirm modus 13h setzen
;evtl. palette laden
;schleife y  (pixel)
;schleife x  (pixel)
;xx=xm-br+x*br/160                 (echten punkt aus pixelposition berechnen)
;yy=ym-(br*5/8)+y*br/160

;a=0 und b=0  -real- und imaginär-teil resetten
;iterationsschleife z

;ab2=rt*it*2
;rt=a2+xx+b2
;it=ab2+yy

;a2=rt*rt   eigentlich weiter vorne, aber zum testen gebraucht
;b2=it*it
;ab2=a2+b2  ab2 missbraucht, aber egal
;testen, ob ab2>2 dann punkt mit farbe z und aus schleife raus. sonst weiter

;ende iterationsschleife z

;ende schleife x
;ende schleife y

.data
schlx:	dw 320         ;x-schleifenzähler
schly:	dw 200         ;y-schleifenzähler
schlz:	dw 100         ;z-iterationszähler
xx:	db 256 DUP(0)  ;256 Bytes Realteil der Bildstelle
yy:	db 256 DUP(0)  ;256 Bytes Imaginärteil der Bildstelle

rt:	db 256 DUP(0)  ;256 Bytes Realteil der zahl, die iterativ berechnet wird
it:	db 256 DUP(0)  ;256 Bytes Imaginärteil der zahl, die iterativ berechnet wird
a2:	db 256 DUP(0)  ;256 Bytes zahl a^2 aus der formel
b2:	db 256 DUP(0)  ;256 Bytes zahl b^2 aus der formel
ab2:	db 256 DUP(0)  ;256 Bytes zahl 2ab aus der formel

xm:	db 256 DUP(0)  ;256 Bytes Bildmitte x
ym:	db 256 DUP(0)  ;256 Bytes Bildmitte y
br:	db 256 DUP(0)  ;256 Bytes halbe Bildbreite x

end