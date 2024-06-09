[org 0x0100]

jmp start

; Define an array of 10 words
original_array: dw 7, 14, 21, 28, 35, 42, 49, 6, 13, 20
even_numbers: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ; Array to store even numbers
odd_numbers: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; Array to store odd numbers

start:
    mov cx, 10             ; Number of elements in the array
    mov si, original_array ; Source index for the original array
    mov di, even_numbers   ; Destination index for the even numbers array
    mov bx, odd_numbers    ; Destination index for the odd numbers array

detect_even_odd_loop:
    mov ax, [si] ; Load the current element from the original array
    and ax, 1    ; Mask all but the LSB
    cmp ax, 0    ; Compare LSB with 0
    je is_even   ; Jump to is_even if the LSB is 0 (even number)

is_odd:
    ; Odd number - store in the odd numbers array
    mov ax, [si] ; Reload the original value
    mov [bx], ax
    add bx, 2    ; Move to the next position in the odd numbers array
    jmp next_iteration

is_even:
    ; Even number - store in the even numbers array
    mov ax, [si] ; Reload the original value
    mov [di], ax
    add di, 2    ; Move to the next position in the even numbers array

next_iteration:
    add si, 2     ; Move to the next element in the original array
    dec cx        ; Decrement the counter
    jnz detect_even_odd_loop ; Loop until all elements are processed

    ; Exit the program  
    mov ax, 0x4c00
    int 0x21

