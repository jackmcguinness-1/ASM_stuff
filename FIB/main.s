
GLOBAL _main

EXTERN _printf

SECTION .text

_main:

    ; setup the stack frame
    push ebp
    mov ebp, esp

    mov eax, [a]
    add eax, 2
    push eax
    push fmt
    call _printf

    add esp, 8

    ; call sum(5)
    push ecx
    mov ecx, 6
    call _sum
    pop ecx

    push eax
    push fmt
    call _printf

    add esp, 8
    ; finished calling sum(5)

    ; call fib(5)
    push ecx
    mov ecx, 4
    call _fib
    pop ecx

    push eax
    push fmt
    call _printf

    add esp, 8
    ; finished calling fib(5)

    ; restore the stack frame
    mov esp, ebp
    pop ebp

    ; gracefully quit 
    mov eax, 0
    ret


_sum:
    mov eax, 0
    push ecx
    cmp ecx, 0
    loophead_sum:
        add eax, ecx
        dec ecx
        cmp ecx, 0
        jne loophead_sum

    pop ecx
    ret

_fib:
    mov eax, 1
    push ecx
    push esi
    push edi

    mov esi, 1
    mov edi, 1

    cmp ecx, 2

    jle fib_end

    sub ecx, 2
    
    loophead_fib:
        mov eax, 0
        add eax, esi
        add eax, edi

        mov edi, esi
        mov esi, eax

        dec ecx

        cmp ecx, 0

        jne loophead_fib

    fib_end:
        pop edi
        pop esi
        pop ecx

        ret


section .data
    a: dd 10

section .rodata
    msg: db "Hello, world!", 0xa, 0;
    fmt: db "a = %d", 0xa, 0;