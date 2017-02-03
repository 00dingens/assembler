;aufgabe: die zahl 1 100000x verdoppeln

.model tiny
.code
mov cx,32000			;länge der zahl
erase:				;alles auf null:
mov bx,cx			; adresse von aktueller zahl
mov byte [offset Zahl+bx],0	; 0 schreiben
loop erase			; loop
mov byte [offset Zahl+32000],1	;ganz unten 1 schreiben
verd:				;verdoppeln:
mov ax,0900h			; funktion Bildschirmausgabe
mov dx,offset Coun		;  adresse Coun (anzahl der verdoppelungen)
int 21h				;  ausführen
mov cx,32000			; tiefste stelle (zähler)
xor ax,ax			; ax löschen
asd:				; eine stelle verdoppeln:
mov bx,cx			;  tiefste stelle (zeiger)
mov al,[offset Zahl+bx]		;  stelle in al laden
shl al,1			;  stelle verdoppeln
add al,ah			;  überfluss addieren
xor ah,ah			;  überfluss löschen
mov [offset Zahl+bx],al		;  stelle zurückschreiben
cmp al,9			;  testen, ob stelle > 9
jg greater			;  ja, dann springe zu greater
loop asd			;  nein, dann nächste stelle (zu asd)
jmp fert			;  fertig mit verdoppeln
greater:			; wenn stelle > 9 dann:
mov ah,1			;  überfluss schreiben
sub al,10			;  10 abziehen von der stelle
mov [offset Zahl+bx],al		;  stelle zurückschreiben
loop asd			;  nächste stelle

fert:				; fertig mit verdoppeln
mov cx,6			; zähler auf tiefste stelle (coun)
xor ah,ah			; überfluss löschen
inc b[offset Coun+6]
cmp b[offset los],0
je zaehl
mov ah,1
mov b[offset los],0
zaehl:				; coun erhöhen:
mov bx,cx			;  zeiger setzen
mov al,[offset Coun+bx]		;  stelle laden
add al,ah			;  überfluss addieren
xor ah,ah			;  überfluss löschen
mov [offset Coun+bx],al		;  stelle zurückschreiben
cmp al,57			;  testen, ob stelle > "9"
jg gre				;  ja, dann gehe zu gre
loop zaehl			;  nein, dann nächste stelle (zu zaehl)
jmp fer				;  fertig mit erhöhen
gre:				; wenn stelle > "9" dann:
sub al,10			;  stelle - 10
mov ah,1			;  überfluss schreiben
mov [offset Coun+bx],al		;  stelle zurückschreiben
loop zaehl			;  nächste stelle
fer:				; fertig mit erhöhen
cmp b[offset Coun+1],"1"		; testen, ob höchste stelle = "1"
je fertig			;  ja, dann gehe zu fertig
jmp verd			;  nein, dann weiterverdoppeln

fertig:				; ganz fertig mit verdoppeln
mov cx,32000			;länge der zahl
norm:				;
mov bx,cx			; adresse von aktueller zahl
add b[offset Zahl+bx],48
loop norm			; loop

mov ax,3c00h			;funktion datei erstellen
mov dx,offset Dat		; dateiname Dat
xor cx,cx			; attribut: normal
int 21h				; funktion ausführen
mov bx,ax			;handle übergeben
mov ax,04000			;funktion in datei schreiben
mov cx,32001			; anzahl der zu schreibenden bytes
mov dx,offset Zahl		; adresse der zahl
int 21h				; funktion ausführen
mov ax,3e00h			;funktion datei schliessen
int 21h				; funktion ausführen
mov ax,4c00h			;funktion programm beenden
int 21h				; funktion ausführen

.data
los	db 1
Coun	db " 000000",13,"$"				;zähler, wie oft verdoppelt wurde
Dat	db "C:\WINDOWS\DESKTOP\zweihoch.txt",0	;dateiname
Zahl	db 0,0					;adresse der zahl
end