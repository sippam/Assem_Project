; section .data
;     msg db 'Hello, from print_function!', 0  ; Our null-terminated string
;     msgLen equ $ - msg    

; section .text
;     global print_output
;     SYSOUT equ 1
;     SYSWRITE equ 1

;     OUTPUT_LEN dq 1

; print_output:
;     mov rax, 1
;     mov rdi, 1
;     ; mov rdx, OUTPUT_LEN
;             ; String to print
;     mov rsi, msg        ; pointer to the message
;     mov rdx, msgLen     ; message length

;     syscall

;     mov rax, 60 ; Exit Program
;     xor rdi, rdi
;     syscall
section .data
    testto dq 'KUY', 0
section .text
    global print_output
    SYSWRITE equ 1

print_output:
    mov rcx, rsi
    xor rax, rax
    add rcx, '0'
    mov rsi, rcx
    mov qword [testto], rsi
    mov rax, SYSWRITE  ; syscall number 1 for sys_write
    mov rdi, 1   
    ; mov qword [msg], rsi       ; file descriptor 1 (stdout)
    ; mov rsi, msg        ; pointer to the message
    mov rsi, testto
    mov rdx, 8     ; message length
    syscall             ; Call the kernel to perform the write

    mov rax, 60         ; syscall number 60 for sys_exit
    xor edi, edi        ; return code 0
    syscall             ; Call the kernel to exit
