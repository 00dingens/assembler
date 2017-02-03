;aufgabe: die zahl 1 100000x verdoppeln

.model tiny
.code
mov cx,32000			;l�nge der zahl
erase:				;alles auf null:
mov bx,cx			; adresse von aktueller zahl
mov byte [offset Zahl+bx],0	; 0 schreiben
loop erase			; loop
mov byte [offset Zahl+32000],1	;ganz unten 1 schreiben
verd:				;verdoppeln:
mov ax,0900h			; funktion Bildschirmausgabe
mov dx,offset Coun		;  adresse Coun (anzahl der verdoppelungen)
int 21h				;  ausf�hren
mov cx,32000			; tiefste stelle (z�hler)
xor ax,ax			; ax l�schen
asd:				; eine stelle verdoppeln:
mov bx,cx			;  tiefste stelle (zeiger)
mov al,[offset Zahl+bx]		;  stelle in al laden
shl al,1			;  stelle verdoppeln
add al,ah			;  �berfluss addieren
xor ah,ah			;  �berfluss l�schen
mov [offset Zahl+bx],al		;  stelle zur�ckschreiben
cmp al,9			;  testen, ob stelle > 9
jg greater			;  ja, dann springe zu greater
loop asd			;  nein, dann n�chste stelle (zu asd)
jmp fert			;  fertig mit verdoppeln
greater:			; wenn stelle > 9 dann:
mov ah,1			;  �berfluss schreiben
sub al,10			;  10 abziehen von der stelle
mov [offset Zahl+bx],al		;  stelle zur�ckschreiben
loop asd			;  n�chste stelle

fert:				; fertig mit verdoppeln
mov cx,6			; z�hler auf tiefste stelle (coun)
xor ah,ah			; �berfluss l�schen
inc b[offset Coun+6]
cmp b[offset los],0
je zaehl
mov ah,1
mov b[offset los],0
zaehl:				; coun erh�hen:
mov bx,cx			;  zeiger setzen
mov al,[offset Coun+bx]		;  stelle laden
add al,ah			;  �berfluss addieren
xor ah,ah			;  �berfluss l�schen
mov [offset Coun+bx],al		;  stelle zur�ckschreiben
cmp al,57			;  testen, ob stelle > "9"
jg gre				;  ja, dann gehe zu gre
loop zaehl			;  nein, dann n�chste stelle (zu zaehl)
jmp fer				;  fertig mit erh�hen
gre:				; wenn stelle > "9" dann:
sub al,10			;  stelle - 10
mov ah,1			;  �berfluss schreiben
mov [offset Coun+bx],al		;  stelle zur�ckschreiben
loop zaehl			;  n�chste stelle
fer:				; fertig mit erh�hen
cmp b[offset Coun+1],"1"		; testen, ob h�chste stelle = "1"
je fertig			;  ja, dann gehe zu fertig
jmp verd			;  nein, dann weiterverdoppeln

fertig:				; ganz fertig mit verdoppeln
mov cx,32000			;l�nge der zahl
norm:				;
mov bx,cx			; adresse von aktueller zahl
add b[offset Zahl+bx],48
loop norm			; loop

mov ax,3c00h			;funktion datei erstellen
mov dx,offset Dat		; dateiname Dat
xor cx,cx			; attribut: normal
int 21h				; funktion ausf�hren
mov bx,ax			;handle �bergeben
mov ax,04000			;funktion in datei schreiben
mov cx,32001			; anzahl der zu schreibenden bytes
mov dx,offset Zahl		; adresse der zahl
int 21h				; funktion ausf�hren
mov ax,3e00h			;funktion datei schliessen
int 21h				; funktion ausf�hren
mov ax,4c00h			;funktion programm beenden
int 21h				; funktion ausf�hren

.data
los	db 1
Coun	db " 000000",13,"$"				;z�hler, wie oft verdoppelt wurde
Dat	db "C:\WINDOWS\DESKTOP\zweihoch.txt",0	;dateiname
Zahl	db 0,0					;adresse der zahl
end