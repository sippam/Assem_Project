global _start

section .data
    dividend db 7
    divider db 5

    result dq 0
    faction dq 0

section .text
_start:

    movzx rax, byte [dividend]
    movzx rbx, byte [divider]

    div rbx

    mov qword [result], rax
    mov qword [faction], rdx

	mov rax, 60	;exit
	mov rdi, 0
	syscall