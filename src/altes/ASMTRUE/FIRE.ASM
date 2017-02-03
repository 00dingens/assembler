A 0100
mov ax,0013
int 10
;---pal
mov cx,0100
dec cx       ;w
mov al,cl
mov dx,03c8
out dx,al
inc dx
mov al,3f
out dx,al
out dx,al
out dx,al
cmp cx,3f
jg 0108      ;->w
;---
mov ah,3f
dec cx       ;b
sub ah,03
mov al,cl
mov dx,03c8
out dx,al
inc dx
mov al,3f
out dx,al
out dx,al
mov al,ah
out dx,al
cmp cx,2a
jg 011c      ;->b
;---
mov ah,3f
dec cx       ;g
sub ah,03
mov al,cl
mov dx,03c8
out dx,al
inc dx
mov al,3f
out dx,al
mov al,ah
out dx,al
mov al,00
out dx,al
cmp cx,15
jg 0135      ;->g
;---
mov ah,3f
dec cx       ;r
sub ah,03
mov al,cl
mov dx,03c8
out dx,al
inc dx
mov al,ah
out dx,al
mov al,00
out dx,al
out dx,al
cmp cx,00
jg 0150      ;->r
;---
mov ax,a000
mov es,ax
;scroll
;hotspots
mov cx,00ff
mov di,cx
dec di      ;pal
es:
mov [di+280],cl
loop 0171   ;->pal
mov ax,0700
int 21
mov ax,0003
int 10
mov ax,4C00
int 21

r cx
100
n fire.com
w
q
