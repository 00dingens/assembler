A 0100
jmp near 01ED
db "0123456789ABCDEF"
db "AX =     ; BX =     ; CX =     ; DX =     ",0A,0D
db "CS =     ; DS =     ; ES =     ; SS =     ",0A,0D
db "SI =     ; DI =     ; BP =     ; SP =     ",0A,0D
db "IP =     ;      CF PF AF ZF SF TF IF DF OF",0A,0D
db "                0  0  0  0  0  0  0  0  0$"
;werte in speicher
;ax
mov [0118],ah
mov [0119],ah
mov [011A],al
mov [011B],al
;bx
mov [0123],bh
mov [0124],bh
mov [0125],bl
mov [0126],bl
;cx
mov [012E],ch
mov [012F],ch
mov [0130],cl
mov [0131],cl
;dx
mov [0139],dh
mov [013A],dh
mov [013B],dl
mov [013C],dl
;werte selektieren
;ax
and byte ptr [0118],F0
and byte ptr [0119],0F
and byte ptr [011A],F0
and byte ptr [011B],0F
;bx
and byte ptr [0123],F0
and byte ptr [0124],0F
and byte ptr [0125],F0
and byte ptr [0126],0F
;cx
and byte ptr [012E],F0
and byte ptr [012F],0F
and byte ptr [0130],F0
and byte ptr [0131],0F
;dx
and byte ptr [0139],F0
and byte ptr [013A],0F
and byte ptr [013B],F0
and byte ptr [013C],0F
;werte in zeichen umwandeln
mov bx,0103
xor ah,ah
mov cl,04
;ax
mov al,[0118]
shr al,cl
xlat
mov [0118],al
mov al,[0119]
xlat
mov [0119],al
mov al,[011A]
shr al,cl
xlat
mov [011A],al
mov al,[011B]
xlat
mov [011B],al
;bx
mov al,[0123]
shr al,cl
xlat
mov [0123],al
mov al,[0124]
xlat
mov [0124],al
mov al,[0125]
shr al,cl
xlat
mov [0125],al
mov al,[0126]
xlat
mov [0126],al
;cx
mov al,[012E]
shr al,cl
xlat
mov [012E],al
mov al,[012F]
xlat
mov [012F],al
mov al,[0130]
shr al,cl
xlat
mov [0130],al
mov al,[0131]
xlat
mov [0131],al
;dx
mov al,[0139]
shr al,cl
xlat
mov [0139],al
mov al,[013A]
xlat
mov [013A],al
mov al,[013B]
shr al,cl
xlat
mov [013B],al
mov al,[013C]
xlat
mov [013C],al
;
;
mov dx,0113
mov ax,0900
int 21
mov ax,4C00
int 21

r cx
800
n regout.com
w
q
