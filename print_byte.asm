; argument is in al
print_byte:
  pusha
  mov bx, ax
  shr bx, 4
  call print_4bit_digit
  mov bx, ax
  call print_4bit_digit
  popa
  ret

%include "print_4bit_digit.asm"
