.model tiny
.code

;;;;;db 066 für 32 bit

;bildschirm setzen
mov ax,013
int 010

;für bildschirmspeicherstelle
mov ax,0a000
mov es,ax


;start yy-schleife
mov w yy,0
ywert:

;start xx-schleife
mov w xx,0
xwert:

;alle flaechen durchgehen
mov cx,bild
fleche:

mov w zz,0ffff
;rechnung
mov ax,xx		;a
sub ax,dat		;a-x1
mov dx,[offset dat+14]	;y3
imul dx			;y3*(a-x1)
db 066
shld dx,ax,16		;nach edx
db 066
mov di,dx		;nach edi

mov ax,[offset dat+2]	;y1
sub ax,yy		;y1-b
mov dx,[offset dat+12]	;x3
imul dx			;x3*(y1-b)
db 066
shld dx,ax,16		;nach edx

db 066
add bx,dx		;y3*(a-x1)+x3*(y1-b)

mov ax,[offset dat+6]	;x2
mov dx,[offset dat+14]	;y3
imul dx			;x2*y3
db 066
shld dx,ax,16		;nach edx
db 066
mov bp,dx		;nach ebx

mov ax,[offset dat+12]	;x3
mov dx,[offset dat+8]	;y2
imul dx			;x3*y2
db 066
shld dx,ax,16		;nach edx
db 066
mov ax,bp
db 066
sub ax,dx		;x2*y3-x3*y2
db 066
mov dx,ax
db 066
mov ax,bp

db 066
idiv dx			;(y3*(a-x1)+x3*(y1-b))/(x2*y3-x3*y2) in ax rest in dx
mov dx,ax


loop fleche



;punkt setzen
mov ax,yy
mov cx,320
mul cx
add ax,xx
mov bx,ax
es:
mov b [bx],dl	;farbe dl


;ende xx-schleife
mov ax,xx
inc ax
mov xx,ax
cmp ax,320
jl xwert

;ende yy-schleife
mov ax,yy
inc ax
mov yy,ax
cmp ax,200
jl ywert



;auf taste warten
mov ax,0700
int 021

;norm. bildschirm setzen
mov ax,3
int 010

;ende
mov ax,04c00
int 021

.data

xx	dw 0
yy	dw 0
zz	dw 0

bild	dw 1
dat	dw -10,-10,10,10,-10,10,10,10,10,-10,10,10
	db 0,63,31,0, 2
	


end