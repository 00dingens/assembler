section .text
global _start
_start:
	pop eax		; anz parameter
	cmp eax,3	; sinds zwei argumente?
	je dreiparam	; alles ok, keine fehlerausgabe
	mov edx,len 	; len = Laenge msg
	mov ecx,msg	; Adresse msg
	mov ebx,1 	; file handle stdout
	mov eax,4 	; sys_write
	int 0x80 	; sys_write (stdout, msg, len)

	mov 	ebx,0	; err_code
	mov 	eax,1 	; sys_exit
	int 	0x80	; sys_exit(0)
	

dreiparam:
	mov edx,5
	pop ecx
	pop ecx
	mov ebx,1 ; file handle stdout
	mov eax,4 ; sys_write
	int 0x80  ; sys_write(stdout, param, 8)
	
	mov ebx,ecx
	sub ebx,4
	mov ecx,7
zeichen:
	mov al,[ebx+ecx]
	and al,0x0F	
	add al,0x30
	mov edx,ecx
	rol edx,1
	add edx,ms2
	mov [edx+1],al
	mov al,[ebx+ecx]
	and al,0xF0
	shr al,4	
	add al,0x30
	mov [edx],al
	loop zeichen

	mov edx,le2	
	mov ecx,ms2
	mov ebx,1 ; file handle stdout
	mov eax,4 ; sys_write
	int 0x80  ; sys_write(stdout, param, 8)

	mov 	ebx,0	; err_code
	mov 	eax,1 	; sys_exit
	int 	0x80	; sys_exit(0)


section .data 				; section Deklaration
msg db 'Aufruf parameter abc def ghi',0x0A 	; unser Text incl. Zeilenumbruch LF (0x0A)
len equ $ - msg				; Länge des Textes berechnen (39 Bytes)
ms2 db '....................',0x0A
le2 equ $-ms2


