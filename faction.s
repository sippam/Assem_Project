section .data
    four_postion equ 10000
    divide_by_ten equ 10

section .text
    global last_divide

last_divide:

    mov rax, qword [rdi]
    mov rbx, four_postion
    mul rbx     ; Make remainder * 10000 to get the last 4 digits
    mov rbx, qword [rdi + 8]    ; Get divider
    div rbx

convert_to_string:
    mov r12, 5  ; For loop count and store data into array

loop_start:

    cmp r12, 1  ; Check if loop is done
    je return_value

    xor rbx, rbx    ; Clear rbx
    xor rdx, rdx    ; Clear rdx
    mov rbx, divide_by_ten  
    div rbx     ; Divide by 10 for get eacg digit
    add rdx, '0'    ; Convert to ASCII
    mov qword [rcx+(8*r12)], rdx    ; Store the result in array
    dec r12

    jmp loop_start

return_value:
    ret