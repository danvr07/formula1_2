section .data

section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    ;push ecx

    imul eax, 8
    add eax, ebx
    ; se afla pozitia
    ; verific pe care numar ma aflu
    cmp eax, 32
      jge skip
      ; daca pozitia este mai mare decat 32 atunci ma aflu pe primul nr

    add ecx, 4

    skip:

    push ecx
    mov ecx, eax
    mov edx, 1
    shl edx, cl
    ; il shiftez pe 1 la pozitia piesei

    ; verific daca ma aflu pe marginea din stanga in toate cazurile
    cmp ecx, 0
      je stanga_s
    cmp ecx, 8
      je stanga_sj
    cmp ecx, 16
      je stanga_sj
    cmp ecx, 24
      je stanga_j
    cmp ecx, 32
      je stanga_s
    cmp ecx, 40
      je stanga_sj
    cmp ecx, 48
      je stanga_sj
    cmp ecx, 56
      je stanga_j

    ; verific daca ma aflu pe marginea din dreapta in toate cazurile
    cmp ecx, 7
      je dreapta_s
    cmp ecx, 15
      je dreapta_sj
    cmp ecx, 23
      je dreapta_sj
    cmp ecx, 31
      je dreapta_j
    cmp ecx, 39
      je dreapta_s
    cmp ecx, 47
      je dreapta_sj
    cmp ecx, 55
      je dreapta_sj
    cmp ecx, 63
      je dreapta_j


    ; verific daca ma aflu pe marginea de sus
    cmp ecx, 57
      je sus
    cmp ecx, 58
      je sus
    cmp ecx, 59
      je sus
    cmp ecx, 60
      je sus
    cmp ecx, 61
      je sus
    cmp ecx, 62
      je sus

    cmp ecx, 25
      je sus
    cmp ecx, 26
      je sus
    cmp ecx, 27
      je sus
    cmp ecx, 28
      je sus
    cmp ecx, 29
      je sus
    cmp ecx, 30
      je sus


    ; daca este in mijloc si nu iese de pe tabla
    general:
      xor eax, eax

      shl edx, 7
      or eax, edx
      shl edx, 2
      or eax, edx
      shr edx, 9

    jmp insert

    stanga_s:
    ; se adauga doar in partea din dreapta sus
      mov eax, edx
      shl eax, 9

    jmp insert

    stanga_sj:
    ; se foloseste si logic pentru a uni bitii
    ; se adauga in partea dreapta sus si jos
      xor eax, eax

      shl edx, 9
      or eax, edx
      shr edx, 9
      shr edx, 7
      or eax, edx
      shl edx, 7

    jmp insert

    stanga_j:
    ; se adauga doar in partea din stanga sus
      mov eax, edx
      shr eax, 7

    jmp insert

    dreapta_s:
      mov eax, edx
      shl eax, 7

    jmp insert

    dreapta_sj:
      xor eax, eax

      shl edx, 7
      or eax, edx
      shr edx, 7
      shr edx, 9
      or eax, edx
      shl edx, 9

    jmp insert

    dreapta_j:
      mov eax, edx
      shr eax, 9

    jmp insert

    sus:
      xor eax, eax

      shr edx, 7
      or eax, edx
      shr edx, 2
      or eax, edx
      shl edx, 9

    cmp ecx, 25
      je jos
    cmp ecx, 26
      je jos
    cmp ecx, 27
      je jos
    cmp ecx, 28
      je jos
    cmp ecx, 29
      je jos
    cmp ecx, 30
      je jos

    jmp insert

    insert:
    ; se insereaza numarul
      pop ecx
      mov [ecx], eax

      end:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY