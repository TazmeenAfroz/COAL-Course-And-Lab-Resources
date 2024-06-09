[org 0x0100]
jmp start

result:       dd 0          ; 32-bit result initialized to 0

start:
    mov ax, 1300h           ; lower word of 32-bit multiplicand (0x1300)
    push ax
    mov ax, 0               ; upper word of 32-bit multiplicand (0x0000)
    push ax

    mov ax, 500h            ; 16-bit multiplier (0x0500)
    push ax

    call multiply
    add sp, 6               ; clean up the stack (3 words = 6 bytes)

    mov ax, 0x4c00          ; exit program
    int 0x21

multiply:
    push bp
    mov bp, sp

    mov dx, [bp+4]          ; load multiplier from stack
    mov cx, 16              ; initialize bit count to 16

checkbit:
    shr dx, 1               ; move rightmost bit into carry
    jnc skip                ; skip addition if bit is zero

    mov ax, [bp+6]          ; load lower 16 bits of multiplicand from stack
    add [result], ax        ; add to lower 16 bits of result
    mov ax, [bp+8]          ; load upper 16 bits of multiplicand from stack
    adc [result+2], ax      ; add to upper 16 bits of result with carry

skip:
    shl word [bp+6], 1      ; shift lower 16 bits of multiplicand left
    rcl word [bp+8], 1      ; shift upper 16 bits of multiplicand left with carry

    dec cx                  ; decrement bit count
    jnz checkbit            ; repeat if bits left

    mov sp, bp
    pop bp 
    ret

times 510-($-$$) db 0       ; padding to make the file size 512 bytes
dw 0xaa55                   ; boot sector signature















BITS 16
ORG 0x100

start:
    ; Setup stack and data segment
    call setup_stack_and_segments

    ; Print message
    call print_message

    ; Infinite loop
    jmp $

; Subroutine to setup stack and segments
setup_stack_and_segments:
    mov ax, 0x9000
    mov ss, ax
    mov sp, 0xFFFF
    mov ds, ax
    ret

; Subroutine to print a string
print_message:
    mov si, msg        ; Load address of the message into SI
    call print_string
    ret

; Subroutine to print a string using BIOS interrupt 0x10
print_string:
    mov ah, 0x0E       ; BIOS teletype function
.next_char:
    lodsb              ; Load next character from DS:SI into AL
    cmp al, 0          ; Check for null terminator
    je .done
    int 0x10           ; Call BIOS interrupt to print character
    jmp .next_char
.done:
    ret

; Simple delay subroutine (not precise)
delay:
    pusha
    mov cx, 0xFFFF
.delay_loop:
    loop .delay_loop
    popa
    ret

msg db 'COAL$', 0

times 510 - ($-$$) db 0
dw 0xAA55

