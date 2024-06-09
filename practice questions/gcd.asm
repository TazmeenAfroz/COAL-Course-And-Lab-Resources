[org 0x0100]

jmp start

d1: dw  48    
d2: dw  18     
result: dw 0  

start:
    mov ax, [d1]  
    mov bx, [d2]  
    call GCD      
    mov [result], ax 
    mov ax, 0x4c00   
    int 0x21        

GCD:
    cmp bx, 0       
    jz complete   
    xor dx, dx      
    idiv bx         
    mov ax, bx      
    mov bx, dx      
    call GCD       
complete:
    ret           
