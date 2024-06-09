[org 0x0100]

mov al, [num1]        ; move the value at memory location 'num1' (which is 255) to al
mov bl, [num1+1]      ; move the value at memory location 'num1+1' (which is 1) to bl
add al, bl            ; add bl (1) to al (255), result is 256 in 9-bit (1 0000 0000), 
                      ; lower 8 bits are 0 (0000 0000), setting al to 0, 
                      ; zero flag (ZF) is set because the result is 0

mov ax, 0x4c00
int 0x21

num1 db 255,1         ; define num1 as 255 and the next byte as 1


