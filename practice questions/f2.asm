Q:write an assembly code which will take 3 numbers in data1, 3 in data2, 3 in data3, add them separately(add the numbers of data1 with each other, add the numbers of data2 with each other, add the numbers of data3 with each other) and then store them in result1, result2, result3 respectively

Solution:


[org 0x0100]

data1: dw 9, 8, 7
data2: dw 1, 2, 3
data3: dw 6, 5, 4
result1: dw 0
result2: dw 0
result3: dw 0

addition: ; subroutine
    push bp
    mov bp, sp
    push si
    push cx
    push ax

    mov cx, [bp+4]     ; Load the count of elements
    mov si, [bp+6]     ; Load the address of the array
    xor ax, ax         ; Clear AX for summation

loop1:
    add ax, [si]       ; Add the current element to AX
    add si, 2          ; Move to the next element (each element is 2 bytes)
    loop loop1         ; Loop CX times

    mov si, [bp+8]     ; Load the address of the result variable
    mov [si], ax       ; Store the result in the result variable

    pop ax
    pop cx
    pop si
    pop bp
    ret

start:
    mov ax, 3          ; Number of elements to add
    push ax
    mov ax, data1      ; Address of the first array
    push ax
    mov ax, result1    ; Address of the result variable
    push ax
    call addition

    mov ax, 3          ; Number of elements to add
    push ax
    mov ax, data2      ; Address of the second array
    push ax
    mov ax, result2    ; Address of the result variable
    push ax
    call addition

    mov ax, 3          ; Number of elements to add
    push ax
    mov ax, data3      ; Address of the third array
    push ax
    mov ax, result3    ; Address of the result variable
    push ax
    call addition

    mov ax, 0x4c00     ; Terminate program
    int 0x21
