.model small
.stack 100h
.data
Meld	db "Hallo Welt!$"

.code
mov ax,@data
mov ds,ax
mov dx,offset Meld
mov ax,0900h
int 21h
mov ax,4c00h
int 21h
end