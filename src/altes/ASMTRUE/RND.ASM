A 0100
mov ax,0013
int 10
mov ax,a000
mov es,ax
mov ax,1234
mov cx,7fff
mov bx,cx
es:
mov [bx],ax
mul ax
add ax,0001
xor ax,dx
dec cx
loop 0110
;
mov ax,0700
int 21
mov ax,0003
int 10
mov ax,4C00
int 21

r cx
100
n rnd.com
w
q
