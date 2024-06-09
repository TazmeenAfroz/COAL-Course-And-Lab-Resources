[org 0x0100]
mov ax, [num1] ; move 26 to al
mov bx, [num2];move 26 to bl
add ax, bx
mov [result],ax
mov ax, 0x4c00
int 0x21
num1 dw 15
num2 dw 5
result dw 0

