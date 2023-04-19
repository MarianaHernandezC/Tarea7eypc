
SECTION .DATA
prompt db 'Ingrese una frase: ', 0
output db 'La frase invertida es: ', 0

section .bss
input resb 256

SECTION .TEXT
global _start

    _start:
        BITS 32
        mov eax, 4
        mov ebx, 1
        mov ecx, prompt
        mov edx, 18
        int 0x80
    
        ; Leer entrada
        mov eax, 3
        mov ebx, 0
        mov ecx, input
        mov edx, 255
        int 0x80
    
        ; Cadena de entrada alrevez
        mov esi, input
        mov edi, esi
        add edi, edx
        dec edi
        mov ebx, edx
        shr ebx, 1
    
    reverse_loop:
        mov al, byte [esi]
        mov dl, byte [edi]
        mov byte [esi], dl
        mov byte [edi], al
        inc esi
        dec edi
        dec ebx
        jnz reverse_loop
    

        mov eax, 4
        mov ebx, 1
        mov ecx, output
        mov edx, 20
        int 0x80
    
        mov eax, 4
        mov ebx, 1
        mov ecx, input
        mov edx, 256
        int 0x80
    
        ; Salir del programa
        mov eax, 1
        xor ebx, ebx
        int 0x80
    
