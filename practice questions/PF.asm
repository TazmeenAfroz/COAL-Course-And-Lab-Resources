[org 0x0100]

mov al, [num1]     ; move the value at memory location 'num1' (which is 2) to al
mov bl, [num2]     ; move the value at memory location 'num2' (which is 3) to bl
add al, bl         ; add bl (3) to al (2), result is 5
                   ; 5 in binary is 101, which has an even number of set bits, 
                   ; so the parity flag (PF) is set to 1

mov [result], al   ; store the result (5) in memory location 'result'

mov ax, 0x4c00
int 0x21

num1 db 2          ; define num1 as 2
num2 db 3          ; define num2 as 3
result db 0        ; initialize result as 0

