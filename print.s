section .data
    my_string dq "", 0  ; Null-terminated string

section .text
    global print_output
    SYSWRITE equ 1

print_output:
    xor rbx, rbx    ; Clear rbx
    mov rbx, rsi    ; rbx = number of elements in the array
    mov r12, rdi    ; r12 = value of the input array

loop_print:
    xor r11, r11    ; Clear r11
    mov r11, 6
    sub r11, rbx    ; r11 = 6 - rbx

    cmp rbx, 0      ; Check if rbx is 0
    je end_print

    xor r10, r10    ; Clear r10
    mov r10, qword [r12+8*r11]  ; r10 = value of the array at each index
    mov qword [my_string], r10

    jmp print      

print:
    mov rax, SYSWRITE
    mov rdi, 1   
    mov rsi, my_string
    mov rdx, 1     
    dec rbx
    syscall

    jmp loop_print

; Exit program
end_print:
    mov rax, 60         ; syscall number 60 for sys_exit
    xor edi, edi        ; return code 0
    syscall             ; Call the kernel to exit