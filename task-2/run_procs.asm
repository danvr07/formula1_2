%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;

struc avg
    .quo: resw 1
    .remain: resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

     ;PRINTF32 `%d\n\x0`, ebx

    start:
        mov edi, 1
        imul ebx, 5
        mov edx, 0

        for1:
            cmp edx, ebx
            je leave
            push ebx
            mov ebx, 0
            movzx esi, byte [ecx + edx + proc.prio]
            cmp esi, 1
            jg continue

            push esi

            movzx esi, byte [ecx + edx + proc.time]
            movzx edi, byte [ecx + edx + 5 + proc.time]
            pop esi

        
            continue:
            pop ebx
            inc edi
            add edx, 5
            jmp for1



        leave:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY