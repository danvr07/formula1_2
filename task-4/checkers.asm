
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    imul eax, 8
    add eax, ebx
    ; se afla pozitia piesei pe tabla

    ; se verifica mai intai cazurile cand piesa este in colt
    cmp eax, 0
      je sus_dreapta
    cmp eax, 7
      je sus_stanga
    cmp eax, 56
      je jos_stanga
    cmp eax, 63
      je jos_dreapta

    ; se verifica daca ne aflam pe coloana din stanga
    cmp eax, 8
      je sus_dreapta
    cmp eax, 16
      je sus_dreapta
    cmp eax, 24
      je sus_dreapta
    cmp eax, 32
      je sus_dreapta
    cmp eax, 40
      je sus_dreapta 
    cmp eax, 48
      je sus_dreapta 

    ; se verifica daca ne aflam pe coloana din dreapta
      je sus_stanga
    cmp eax, 23
      je sus_stanga
    cmp eax, 31
      je sus_stanga
    cmp eax, 39
      je sus_stanga
    cmp eax, 47
      je sus_stanga 
    cmp eax, 55
      je sus_stanga

    ; se verifica daca ne aflam pe linia de sus
    cmp eax, 1
      je sus_stanga
    cmp eax, 2
      je sus_stanga
    cmp eax, 3
      je sus_stanga
    cmp eax, 4
      je sus_stanga
    cmp eax, 5
      je sus_stanga 
    cmp eax, 6
      je sus_stanga 

    ; se verifica daca ne aflam pe linia de sus
    cmp eax, 57
      je jos_stanga
    cmp eax, 58
      je jos_stanga
    cmp eax, 59
      je jos_stanga
    cmp eax, 60
      je jos_stanga
    cmp eax, 61
      je jos_stanga
    cmp eax, 62
      je jos_stanga


    ; insereaza 1 in stanga sus
    sus_stanga:
      add eax, 7
      mov byte [ecx+eax], 1
      sub eax, 7

      cmp eax, 7
        je end

      cmp eax, 15
        je jos_dreapta
      cmp eax, 23
        je jos_dreapta
      cmp eax, 31
        je jos_dreapta
      cmp eax, 39
        je jos_dreapta
      cmp eax, 47
        je jos_dreapta 
      cmp eax, 55
        je jos_dreapta

     ; insereaza 1 in dreapta sus
    sus_dreapta:
      add eax, 9
      mov byte [ecx+eax], 1
      sub eax, 9

      cmp eax, 0
        je end

      cmp eax, 8
        je jos_stanga
      cmp eax, 16
        je jos_stanga
      cmp eax, 24
        je jos_stanga
      cmp eax, 32
        je jos_stanga
      cmp eax, 40
        je jos_stanga
      cmp eax, 48
        je jos_stanga

      cmp eax, 1
        je end
      cmp eax, 2
        je end
      cmp eax, 3
        je end
      cmp eax, 4
        je end
      cmp eax, 5
        je end
      cmp eax, 6
        je end

    ; insereaza 1 in stanga jos
    jos_stanga:
      sub eax, 7
      mov byte [ecx+eax], 1
      add eax, 7

      cmp eax, 56
        je end

      cmp eax, 8
        je end
      cmp eax, 16
        je end
      cmp eax, 24
        je end
      cmp eax, 32
        je end
      cmp eax, 40
        je end
      cmp eax, 48
        je end
    ; insereaza 1 in dreapta jos
    jos_dreapta:
      sub eax, 9
      mov byte [ecx+eax], 1
      add eax, 9

    end:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY