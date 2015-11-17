; argument is in dx
print_hex:
  pusha
  prefix: db '0x', 0
  mov bx, prefix
  call print_string
  mov ax, dx
  shr ax, 8
  call print_byte
  mov ax, dx
  call print_byte
  popa
  ret

%include "print_byte.asm"
%include "print_string.asm"
