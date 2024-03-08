%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    loop:
        cmp ecx, 0 
            je loop_end
        ; punem byte ul de la adresa lui esi in eax
        movzx eax, byte [esi]
        ; se shifteaza la dreapta(adunare ascii)
        add eax, edx 
        ; daca se trece peste limita atunci se incepe din nou
        cmp eax, 90
            jle skip
        sub eax, 91
        add eax, 65
        skip:
        mov [edi],byte eax
        ; mergem catre urmatorul caracter
        inc esi
        ; margem catre alt caracter
        inc edi 
        ; se decrementeaza contorul
        dec ecx 

        jmp loop

    loop_end:

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
