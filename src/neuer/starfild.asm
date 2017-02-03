~^
#ERROR messages will be removed if you leave these first two lines in     @@@@#
.model tiny
.code
;bildschirm setzen
mov ax,0013h
int 010h

;palette setzen
mov dx,03c8
mov cx,255
farbe:
mov ax,cx
mov ah,al
xor ah,255
out dx,al
inc dx
mov al,ah
out dx,al
out dx,al
out dx,al
loop farbe

;punkte erzeugen
mov cx,Anz
stern:
call zuf
mov bx,cx
shl bx,2
mov [pos+bx],ax
call zuf
mov [pos+bx+2],ax
mov b [pos+bx+3],127
loop stern


;der hauptteil
bild:
;auf retrace warten
mov dx,3dah                   ;Input Status Register 1
wait1:
in al,dx                      ;Bit 3 wird 0 wenn Strahl beim Bildaufbau
test al,08h
jnz wait1
wait2:
in al,dx                      ;Bit 3 wird 1 wenn Retrace
test al,08h
jz wait2

;bildaufbau
mov cx,anz
star:
mov bx,cx
shl bx,2

;z erhöhen
mov al,[pos+bx+3]
dec al
jnz zok
call neu
mov al,127
zok:
mov [pos+bx+3],al

mov ax,[pos+bx]		;x-wert
xor dh,dh
mov dl,[pos+bx+3]	;y und z-wert
imul ax,dx
~         ^
#ERROR 09: Constant Required                                              @@@@#
idiv ax,128
~       ^
#ERROR 08: Too Many Operands                                              @@@@#
add ax,160
cmp ax,319
jng
~  ^
#ERROR 02: Jump > 128                                                     @@@@#


loop star

;taste gedrückt?
mov ah,1
int 16h
jz bild


;norm. bildschirm
mov ax,3
int 10h

;ende
mov ax,4c00h
int 21h


neu:
call zuf
mov [pos+bx],ax
call zuf
mov [pos+bx+2],ax
mov b [pos+bx+3],127
ret


zuf:
;--zufall startwert in ax, nachher zahl in ax und rn
push bx
mov ax,rn
add ax,1111

;1.tausch
mov bl,ah
mov bh,ah
and bl,4
shl bl,1
and bh,8
shr bh,1
and ah,0f3h
or ah,bl
or ah,bh

;2.tausch
mov bl,ah
mov bh,ah
and bl,2
shl bl,1
and bh,4
shr bh,1
and ah,0f9h
or ah,bl
or ah,bh

;3.tausch
mov bl,al
mov bh,ah
and bl,64
shr bl,6
and bh,1
shl bh,6
and ah,0feh
or ah,bl
and al,0fbh
or al,bh

mov [offset rn],ax
pop bx
ret


.data
Anz:	dw 100		;anzahl der sterne max 10000
rn:	dw ?		;zufallsstartwert
pos:	db 0,0,255	;ab hier stehen die sternkoordinaten
end

