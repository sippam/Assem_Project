global _start

section .data
    dividend db 66   ; Value of dividend
    divider db 7    ; Value of divider
    dot db 46       ; Dot character

    result_of_array dq 0,0,0,0,0,0  ; Array to store result
    ; index 0 store result of division
    ; index 1 store dot character
    ; index 2-5 store result of faction

section .bss
    result_and_faction resq 2
    length_of_result_and_faction resq 2
    last_faction resq 1

section .text
    extern last_divide  ; Function in file faction.s
    extern print_output ; Function in file print.s
    
_start:

    movzx rax, byte [dividend]
    movzx rbx, byte [divider]

    div rbx
    add rax, '0'    ; Convert to ASCII
    mov rsi, result_of_array
    mov [rsi], rax  ; Store result of division into array
    movzx rax, byte [dot]
    mov [rsi+8], rax    ; Store dot character into array
    xor rax, rax    ; Clear rax

    mov rdi, result_and_faction ; Move address of result_and_faction into rdi
    mov qword [rdi], rdx    ; Index 0 store faction into array
    mov qword [rdi + 8], rbx    ; Index 1 store divider

    mov rsi, length_of_result_and_faction   ; Length of result_and_faction array
    mov rcx, result_of_array    ; Return array of result

    call last_divide

    mov rdi, result_of_array    ; Move address of result_of_array into rdi
    mov rsi, 6  ; Length of result_of_array
    call print_output