[org 0x0100]

jmp start

; fib(n) logic fib(0) = 0 , fib(1) = 1 (basecase) else fib(n-1) + fib(n-2)
 fibonacci:
  push bp
  mov bp,sp
  sub sp,2              ; store the space for local variable
  
  mov ax,[bp+4]         ; mov var in this case 5 into the ax
  cmp ax,1              ; compare the value of ax with 1
  jbe base_case         ; if value is less than or equal to 1 then go to base_case subroutine
  sub ax,1              ; fib(n-1)
  push ax               ; store that value
  call fibonacci        ; recursive call
  add sp,2
  mov [bp-2],ax
  
  mov ax,[bp+4]
  sub ax,2             ;fib(n-2)
  push ax 
  call fibonacci       ; recursive call
  add sp,2
  add ax,[bp-2]        ;fib(n-2)+fib(n-1)

  jmp fib_end


 base_case:
  mov ax,[bp+4]      
  cmp ax,1             ;compare if the value in the ax reg is 1 then jmp to subroutine fib_one 
  je fib_one
  mov ax , 0           ;else mov 0 into the ax
  jmp fib_end
  
 fib_one:
  mov ax,1
 
 fib_end:
 mov sp,bp
 pop bp 
 ret
 
 start: 
 mov ax,5
 push ax
 call fibonacci
 add sp,2
 mov bx,ax    ;value returned from the function is stored in the ax  ,now just for displaying mov the value from ax to bx 
 
 mov ax,0x4c00
 int 0x21

