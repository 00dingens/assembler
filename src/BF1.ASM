.model tiny
.code

;Intuitive version 4-5h 176 byte

;init
mov DX,offset Zeichen
mov DI,offset Speich
mov SI,offset Prog
mov AX,0900h
dec SI
Schritt:
inc SI
mov BL,[SI]
; folgendes optimieren durch annahme, dass es keine kommentare gibt.
cmp BL,'>'
je Rechts
cmp BL,'<'
je Links
cmp BL,'+'
je Plus
cmp BL,'-'
je Minus
cmp BL,'['
je Schleife1
cmp BL,']'
je Schleife2
cmp BL,'.'
je Punkt
cmp BL,','
je Komma
cmp BL,0
je Ende
jmp Schritt

Rechts:
inc DI
jmp Schritt
Links:
dec DI
jmp Schritt
Plus:
inc byte [DI]
jmp Schritt
Minus:
dec byte [DI]
jmp Schritt
Schleife1:
push SI
mov AL,[DI]
cmp AL,0
jne Schritt
pop SI
;todo rechte klammer suchen
mov cx,1
Such:
inc SI
mov CH,[SI]
cmp CH,'['
jne KeiKl1
inc CL
KeiKl1:
cmp CH,']'
jne Such
dec CL
cmp CL,0
je Schritt
jmp Such
Schleife2:
pop SI
dec SI
jmp Schritt
Punkt:
mov BL,[DI]
mov Zeichen,BL
mov ax,0900h
int 21h
jmp Schritt
Komma:
mov bx,[offset InPos]
cmp bx,[0080h]
jge Ende1
mov cl,[bx+0082h]
mov [DI],cl
inc bx
mov [offset InPos],bx
jmp Schritt




;meld ausgeben
mov dx,0082h
mov ax,0900h
int 21h

;zeichen lesen
mov ax,0700h
int 21h
cmp al,96

Ende1:
;kein input mehr

Ende:
mov ax,4c00h
int 21h


.data
InPos	dw 0
Zeichen	db " $"
Prog	db ">+++[>+++[>++[>+++++[>+>+>+<<<-]<-]>>->+>+<<<<<-]<-]>>>>+.>--.>+++.<.>-.+++++++."
ProEnde	db 0
Speich	db 255 dup (0)
end