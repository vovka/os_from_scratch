; prints the value of DX as hex.
print_hex0:
  pusha
  mov bx, dx                        ; store dx value in bx

  mov cx, 0                         ; set cx counter to 0
  mov bp, 0x8000                    ; init stack at 0x8000 mem address
  mov sp, bp                        ; init stack top the same
  print_hex_stack_push_loop:
    push bx                         ; push significant 4 very right bits of 
                                    ; digit to stack (lower positions first, 
                                    ; so higher positions are on top of stack)
    shr bx, 4                       ; shift digit 4 bits right to get next 4 
                                    ; digits at the very right position
    add cx, 1                       ; increase counter
    cmp cx, 4                       ; compare counter
    jl print_hex_stack_push_loop    ; if counter less then 4 then loop (else 
                                    ; go on next)

  mov ah, 0x0e                      ; int 10/ ah = 0 eh -> scrolling teletype 
                                    ; BIOS routine
  mov al, '0'                       ; set '0' to al
  int 0x10                          ; print al (== '0')
  mov al, 'x'                       ; set 'x' to al
  int 0x10                          ; print al (== 'x')
  mov cx, 0                         ; set cx counter to 0
  print_hex_print_digits_loop:
    pop bx                          ; fetch top value from stack (higher 
                                    ; positions are on top and are poped first)
    and bx, 0x000f                  ; cut only 4 very right significant bits
    add bx, HEX_NUMBERS             ; get symbol that is indexed in HEX_NUMBERS 
                                    ; string by the value of digit to display, 
                                    ; i.e. if we want to display 'B' digit then 
                                    ; the 11-th symbol will be fetched which is 
                                    ; also 'B'
    mov al, [bx]                    ; set 4bit digit to display to al
    int 0x10                        ; print al (== 4bit digit to display)
    add cx, 1                       ; increase counter by 1
    cmp cx, 4                       ; compare counter with 4
    jl print_hex_print_digits_loop  ; if less then 4 then loop
  popa
  ret
