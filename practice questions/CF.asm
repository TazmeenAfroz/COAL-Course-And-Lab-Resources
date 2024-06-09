[org 0x0100]

mov al, [num1]           ; move the value at memory location 'num1' (which is 2) to al
mov bl, [num1 + 1]       ; move the value at memory location 'num1 + 1' (which is 8) to bl
sub al, bl               ; subtract bl (8) from al (2), result is -6 in 2's complement (1111 1010) 
                         ; carry flag is set because 2 < 8, indicating a borrow

mov ax, 0x4c00
int 0x21

num1 : db 2,8            ; define num1 as 2 and the next byte as 8

