[org 0x0100]

jmp start

factorial:
  push bp
  mov bp, sp
  sub sp, 2       

  mov ax, [bp+4]
  cmp ax, 1
  jbe base_case

  push ax
  dec ax
  push ax
  call factorial
  add sp, 2
  mov [bp-2], ax  
   
  mov ax, [bp+4]
  mul word [bp-2] 

  jmp fac_end

base_case:
  mov ax, 1

fac_end:
  mov sp, bp
  pop bp
  ret

start:
  mov ax, 5
  push ax
  call factorial
  add sp, 2
  mov bx, ax

  mov ax, 0x4c00
  int 0x21

