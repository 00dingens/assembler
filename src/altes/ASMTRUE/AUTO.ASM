A 0100
mov cx,00ff
mov bx,0154
mov [0152],cx
xor ah,ah
mov cl,04
mov al,[0152]
and al,0f
xlat
mov [017e],al
mov al,[0152]
and al,f0
shr al,cl
xlat
mov [017d],al
mov al,[0153]
and al,0f
xlat
mov [017c],al
mov al,[0153]
and al,f0
shr al,cl
xlat
mov [017b],al
mov ax,3c00
xor cx,cx
mov dx,0164
int 21
mov bx,ax
mov ax,3e00
int 21
mov cx,[0152]
loop 0103
mov ax,4C00
int 21
db 00,00
db "0123456789ABCDEF"
db "c:\windows\desktop\rafa0000.txt",00


r cx
84
n rafa00FF.com
w
q
