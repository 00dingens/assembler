.model tiny
.code
;bildschirm setzen
mov ax,0013h
int 010h

farbe:

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

mov dx,03c8
xor ax,ax
out dx,al
inc dx
call zuf
ror ax,5
out dx,al
ror ax,5
out dx,al
ror ax,5
out dx,al

;taste gedrückt?
mov ah,1
int 16h
jz farbe

;norm. bildschirm
mov ax,3
int 10h

;ende
mov ax,4c00h
int 21h

zuf:
mov ax,cx
add ax,11111

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

mov cx,ax
ret

.data
end