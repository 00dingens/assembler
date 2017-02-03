.model tiny
.code
mov ax,0013h		;mode 13 ein
int 10h
mov di,offset Fls	;adresse der fl‰chen nach di
mov cx,[di]		;fl‰chenanzahl nach cx
Relativieren:		;wandelt die absoluten koordinaten in relative um
mov ax,10		;pro fl‰che 10 werte, daher zeiger(bx) auf fl‰chennr * 10
mul cl
mov bx,ax
mov ax,[di+bx+1]	;x1 nach ax
sub [di+bx+4],ax	;von x2 abziehen
sub [di+bx+7],ax	;von x3 abziehen
mov ax,[di+bx+2]	;y werte
sub [di+bx+5],ax
sub [di+bx+8],ax
mov ax,[di+bx+3]	;z werte
sub [di+bx+6],ax
sub [di+bx+9],ax
loop Relativieren
;jetzt sind die Koordinaten des 2. u 3. Punktes relativ.

mov cx,0ffffh
Punkt:
mov ax,[di]
mov xxx,al	;ZÑhler der FlÑchen
Fleche:
mov ax,10
mul byte xxx
mov bx,ax
add bx,di	;FlÑchenzeiger

;unterm Bruch n
mov al,[bx+4]		;al=x1
imul byte [bx+8]	;ax=x1*y2
mov dx,ax		;dx=x1*y2
mov al,[bx+7]		;al=x2
imul byte [bx+5]	;ax=x2*y1
sub dx,ax		;dx=x1*y2-x2*y1
mov si,dx
;Åberm Bruch n
mov al,cl		;al=a
sub al,[bx+1]		;al=a-x0
imul byte [bx+8]	;ax=y2*(a-x0)
mov dx,ax		;dx=y2*(a-x0)
mov al,[bx+2]		;al=y0
sub al,ch		;al=y0-b
imul byte [bx+7]	;ax=x2*(y0-b)
add ax,dx		;ax=x2*(y0-b)+y2*(a-x0)
;ganzer Bruch n
idiv si			;Teilen
mov bp,ax		;bp=n

;unterm Bruch m
mov al,[bx+7]		;al=x2
imul byte [bx+5]	;ax=x2*y1
mov dx,ax		;dx=x2*y1
mov al,[bx+4]		;al=x1
imul byte [bx+8]	;ax=x1*y2
sub dx,ax		;dx=x2*y1-x1*y2
mov si,dx
;Åberm Bruch m
mov al,cl		;al=a
sub al,[bx+1]		;al=a-x0
imul byte [bx+5]	;ax=y1*(a-x0)
mov dx,ax		;dx=y1*(a-x0)
mov al,[bx+2]		;al=y0
sub al,ch		;al=y0-b
imul byte [bx+4]	;ax=x1*(y0-b)
add ax,dx		;ax=x1*(y0-b)+y1*(a-x0)
;ganzer Bruch m
idiv si			;Teilen  ax=m


dec byte xxx
jnz Fleche

loop Punkt
mov ax,0700h
int 21
mov ax,0003h
int 10h
mov ax,4c00h
int 21h

.data
xxx	db 0,0
nm	db 0,0
Fls	db 1
	db 10,10,10,20,10,30,10,20,20,1
end