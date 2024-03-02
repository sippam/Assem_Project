section .text
    global last_divide

last_divide:

    mov rax, qword [rdi]
    mov rbx, qword [rdi + 8]
    div rbx

    mov qword [rcx], rdx
    ret