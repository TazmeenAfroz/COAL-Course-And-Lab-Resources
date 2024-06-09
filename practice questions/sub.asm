[org 0x0100]
jmp start

operand1: dw 5
operand2: dw 2
sum_result: dw 0
subtraction_result: dw 0
multiplication_result: dw 0
division_result: dw 0

add_numbers:
  push bp
  mov bp, sp
  push ax
  push bx
  mov ax, [bp+8]       ; Load the first operand
  add ax, [bp+6]       ; Add the second operand
  mov bx, [bp+4]       ; Get the address of the result variable
  mov [bx], ax         ; Store the result
  pop bx
  pop ax
  pop bp
  ret 6                ; Clean up the stack and return

subtract_numbers:
  push bp
  mov bp, sp
  push ax
  push bx
  mov ax, [bp+8]       ; Load the first operand
  sub ax, [bp+6]       ; Subtract the second operand
  mov bx, [bp+4]       ; Get the address of the result variable
  mov [bx], ax         ; Store the result
  pop bx
  pop ax
  pop bp
  ret 6                ; Clean up the stack and return

multiply_numbers:
  push bp
  mov bp, sp
  push ax
  push bx
  mov ax, [bp+8]       ; Load the first operand
  mul word [bp+6]      ; Multiply by the second operand
  mov bx, [bp+4]       ; Get the address of the result variable
  mov [bx], ax         ; Store the result
  pop bx
  pop ax
  pop bp
  ret 6                ; Clean up the stack and return

divide_numbers:
  push bp
  mov bp, sp
  push dx
  push ax
  push bx
  xor dx, dx           ; Clear dx for division
  mov ax, [bp+8]       ; Load the first operand
  div word [bp+6]      ; Divide by the second operand
  mov bx, [bp+4]       ; Get the address of the result variable
  mov [bx], ax         ; Store the result
  pop bx
  pop ax
  pop dx
  pop bp
  ret 6                ; Clean up the stack and return

start:
  ; Addition
  mov ax, [operand1]
  push ax
  mov ax, [operand2]
  push ax
  mov ax, sum_result
  push ax
  call add_numbers

  ; Subtraction
  mov ax, [operand1]
  push ax
  mov ax, [operand2]
  push ax
  mov ax, subtraction_result
  push ax
  call subtract_numbers

  ; Multiplication
  mov ax, [operand1]
  push ax
  mov ax, [operand2]
  push ax
  mov ax, multiplication_result
  push ax
  call multiply_numbers

  ; Division
  mov ax, [operand1]
  push ax
  mov ax, [operand2]
  push ax
  mov ax, division_result
  push ax
  call divide_numbers

  ; Terminate program
  mov ax, 0x4c00      
  int 0x21            
