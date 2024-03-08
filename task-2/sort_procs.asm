%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY
    ;mov edx, 0

    ;; Your code starts here

  start:

    mov ebx, 0
    sub eax, 1  ; am scazut 1 din lungimea vectorului
                ; doarece la bubble sort se foloseste < lungime-1
    mov edi, eax
    imul edi, 5
    
    for1:
      cmp ebx, eax
        jge end_for1

      mov ecx, 0

      ;Am folosit 2 for uri pentru bubble sort

      for2:
        cmp ecx, edi ; daca contorul este egal cu lungime se duce la primul for
          jge end_for2

        push edi
        
        ; se intrudce in esi prima prioritate din vector
        movzx esi, byte [edx + ecx + proc.prio]
        ; se intrudce in esi prima prioritate din vector
        movzx edi, byte [edx + ecx + 5 + proc.prio]

        push ebx
        cmp esi, edi 
          jl end ; daca sunt sortate mergem mai departe
        cmp esi, edi
          je time ; se sorteaza dupa timp
        cmp esi, edi
          jg swap     ; daca prima valoare este mai mare decat a doua
                    ; se interschimba intre ele

        time:
          movzx esi, word [edx + ecx + proc.time]
          movzx edi, word [edx + ecx + 5 + proc.time]

          cmp esi, edi
            jg swap     ; daca prima valoare este mai mare decat a doua 
                    ; se interschimba intre ele
            jl end      ; daca sunt sortate mergem mai departe
            je id       ; se sorteaza dupa pid

        id:
          movzx esi, word [edx + ecx + proc.pid]
          movzx edi, word [edx + ecx + 5 + proc.pid]
  
          cmp esi, edi
            jl end    ; daca sunt sortate mergem mai departe
            jg swap   ; daca prima valoare este mai mare decat a doua 
                    ; se interschimba intre ele

        swap: ;  interschimbarea valorilor intre ele
          mov esi, [edx + ecx + proc]
          mov ebx, [edx + ecx + 5 + proc]

          mov edi, esi
          mov [edx + ecx + proc], ebx
          mov [edx + ecx + 5 + proc], esi

        end:
          pop ebx
          pop edi

          add ecx, 5

          jmp for2

      end_for2:
      inc ebx
      jmp for1
 
    end_for1:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY