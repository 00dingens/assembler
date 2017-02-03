A 100
mov ax,0900
mov dx,0192
int 21
mov ax,0700
int 21
cmp al,1D
jne 0114
jmp near 0173
inc word ptr [0180]
mov cx,[0180]
mov [0239],ch
mov [023A],ch
mov [023B],cl
mov [023C],cl
and byte ptr [0239],F0
and byte ptr [023A],0F
and byte ptr [023B],F0
and byte ptr [023C],0F
mov bx,0182
xor ah,ah
mov cx,0004
mov al,[0239]
shr al,cl
xlat
mov [0239],al
mov al,[023A]
xlat
mov [023A],al
mov al,[023B]
shr al,cl
xlat
mov [023B],al
mov al,[023C]
xlat
mov [023C],al
mov ax,0900
mov dx,0230
int 21
jmp near 0108
mov ax,0900
mov dx,024E
int 21
mov ax,4C00
int 21
db 00,00
db "0123456789ABCDEF"
db "Hi, ich bin ein fieses Programm.",0A,0D
db "Nur mit der richtigen Tastenkombination lasse ich mich beenden.",0A,0D
db "P.S. Du hast nicht unendlich Versuche (aber fast)!",0A,0D,0A,0D
db "C:\>$"
db "Versuch #0000: falsch!",07,0A,0D,"C:\>$"
db "richtig!",07,07,0A,0D
db "Bis zum n„chsten mal, dann mit anderer Tastenkombination!",0A,0D,"$"

R CX
196
N virus.com
W
Q
