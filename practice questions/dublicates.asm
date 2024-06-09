[org 0x0100]

jmp start

MyArray: db 1, 2, 1, 3, 4, 7, 9, 3, 2, 5, -1  ; Example array with size 10

; Subroutine to remove duplicates
RemoveDuplicates:
    ; Parameters:
    ;   DS:SI - Pointer to the start of the array
    ;   CX - Size of the array
    push bp
    mov bp, sp
    push si
    push cx

    mov di, si          ; DI points to the location to write unique elements
    xor bx, bx          ; BX will be used to scan the array

RemoveLoop:
    mov al, [si+bx]
    mov dx, si
    add dx, bx
    inc dx

    ; Check if AL is already in the unique portion
    mov cx, di
    sub cx, si
    jz WriteUnique       ; If DI == SI, no need to check, just write

    ; Backup the current size of unique elements for the outer loop
    push cx

CheckUniqueLoop:
    cmp al, [si + cx]
    je NextElement
    dec cx
    jnz CheckUniqueLoop

WriteUnique:
    mov [di], al
    inc di

    ; Restore the backed-up size for the outer loop
    pop cx

NextElement:
    inc bx
    dec cx
    jnz RemoveLoop

    ; Mark the end of the array with -1
    mov byte [di], -1

    ; Calculate the new size of the array
    sub di, si

    ; Return the new size in AX
    mov ax, di

    ; Restore registers and return
    pop cx
    pop si
    pop bp
    ret

start:
    mov si, MyArray
    mov cx, 10             ; Original size of the array
    call RemoveDuplicates

    ; New size is now in AX

    ; Exit program
    mov ax, 0x4c00
    int 21h

