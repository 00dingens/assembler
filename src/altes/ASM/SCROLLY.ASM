.model tiny
.code
xor bx,bx
mov ax,0b800h
mov es,ax
mov ax,0100h
Los:
mov bx,ax
;anfang retrace
mov dx,03dah
W1:
in al,dx
test al,08h
jnz W1
W2:
in al,dx
test al,08h
jz W2
;ende retrace
mov ax,bx
inc ax
mov cx,2000
xor di,di
aus:
stosw
loop aus

cmp ax,0ffffh
je ende
loop Los
ende:
mov ax,4c00h
int 21h

.data
Allg	db "Hallo, das hier ist der erste Versuch eines Scrollys! Ich hoffe, das er nicht zu schnell durch den Bildschirm l�uft, denn dann kann man den Text nicht erkennen. So, jetzt f�ngt der ganze Text wieder von Vorne an!!!!!!$"
end