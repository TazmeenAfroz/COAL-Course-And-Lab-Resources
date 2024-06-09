[org 0x0100]

QDELAY:
    mov ax, 2
D1: 
    mov bx, 3
D2:
    mov cx, 4
D3:  
    NOP
    NOP
    DEC cx
    jne D3  
    DEC bx
    jne D2  
    DEC ax
    jne D1 
    RET

