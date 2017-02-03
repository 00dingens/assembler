section .text 		; section Deklaration
global _start 		; Eintrittspunkt für den ELF-Linker-/Loader
_start: 		; Programmstart
	mov 	edx,len ; drittes Argument, Textlänge
	mov 	ecx,msg ; zweites Argument, Adresse unseres Textes im Speicher
	mov 	ebx,1 	; erstes Argument, file handle stdout
	mov 	eax,4 	; Systemaufruf Nr.4 = sys_write
	int 	0x80 	; Kernel aufrufen mit obigen System-Aufrufparametern

	mov 	ebx,0 	; erstes Argument für sys_exit (Programm beenden)
	mov 	eax,1 	; Systemaufruf Nr. 1 (sys_exit) Programmende
	int 	0x80 	; Kernel aufrufen mit obigen System-Aufrufparametern

section .data 				; section Deklaration
msg 	db 	'Hello my world',0x0A 	; unser Text incl. Zeilenumbruch LF (0x0A)
len 	equ 	$ - msg 		; Länge des Textes berechnen (12 Bytes)


