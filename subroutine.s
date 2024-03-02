global _start

section .data
    dividend db 7
    divider db 5

    result dq 0
    faction dq 0

section .bss
    result_and_faction resq 2
    length_of_result_and_faction resq 2
    last_faction resq 1

section .text
    extern last_divide
    extern print_output
    
_start:

    movzx rax, byte [dividend]
    movzx rbx, byte [divider]

    div rbx
    mov [result], rax

    mov rdi, result_and_faction
    mov [rdi], rdx
    mov [rdi + 8], rbx

    mov rsi, length_of_result_and_faction
    mov rcx, last_faction

    call last_divide

    xor rsi, rsi
    mov rsi, last_faction
    mov rax, [rsi]
    xor rsi, rsi
    mov rsi, rax
    mov [faction], rax

    call print_output

; exit_program:
; 	mov rax, 60	;exit
; 	mov rdi, 0
; 	syscall