p = 3.14159265# / 128
OPEN "c:\asm\kreis.asm" FOR APPEND AS #1
PRINT #1, "Tabelle db " + CHR$(34);
CLS
FOR x = 0 TO 255
 q = INT(COS(x * p) * 127 + 127)
 PRINT HEX$(q);
 PRINT #1, RTRIM$(LTRIM$(STR$(q))) + ",";
NEXT x
PRINT #1, CHR$(34)
CLOSE

