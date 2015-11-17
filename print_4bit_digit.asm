HEX_NUMBERS:
  db '0123456789ABCDEF', 0

; argument is in bl
print_4bit_digit:
  pusha
  and bx, 0x000f
  add bx, HEX_NUMBERS
  mov al, [bx]
  mov ah, 0x0e                      ; int 10/ ah = 0 eh -> scrolling teletype 
  int 0x10
  popa
  ret
