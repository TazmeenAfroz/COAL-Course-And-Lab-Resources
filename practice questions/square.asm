[org 0x0100]

mov cx, 20      ; Set CX to the number we want to square (e.g., 20)
mov ax, 0       ; Initialize AX to 0 (this will hold the result)

l1:             ; Start of loop
    add ax, cx  ; Add CX to AX (this will be repeated CX times)
    loop l1     ; Decrement CX and jump to l1 if CX is not zero

mov ax, 0x4c00  ; Prepare to exit
int 0x21        ; Interrupt to exit the program


[org 0x0100]

mov ax, 5       ; Set AX to the number we want to square (e.g., 5)

mul ax          ; Multiply AX by itself (i.e., square it)
                ; After this instruction, AX will contain the square of the number

mov bx, ax      ; Move the result (square of the number) to BX for storage or further use

mov ax, 0x4c00  ; Prepare to exit
int 0x21        ; Interrupt to exit the program

