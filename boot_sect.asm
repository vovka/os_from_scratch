mov bx, 50

cmp bl, 4
  jle if_block

  cmp bl, 40
    jl else_if_block

    mov al, 'C'
jmp end_if

if_block:
  mov al, 'A'
  jmp end_if

else_if_block:
  mov al, 'B'

end_if:

mov ah, 0x0e ; int =10/ ah =0x0e -> BIOS tele - type output
int 0x10 ; print the character in al

jmp $                   ; Jump forever.

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xaa55
