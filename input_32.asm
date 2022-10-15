; Author: Cake

section .data
    inpmsg db "Input a string: "                    ;/ Input Message
    inpmsg_len equ $ - inpmsg                       ;| Input Message length
    otpmsg db "Your string: "                       ;| Output Message
    otpmsg_len equ $ - otpmsg                       ;| Output Message length

section .bss
    uinput_len equ 24                               ;/ User Input Length
    uinput resb uinput_len                          ;| User Input Buffer

section .text
    global _start

_start:
    mov eax, 4                                      ;| sys_write
    mov ebx, 1                                      ;| stdout
    mov ecx, inpmsg                                 ;| inpmsg
    mov edx, inpmsg_len                             ;| inpmsg_len

    int 0x80                                        ;| syscall

    mov eax, 3                                      ;| sys_read
    mov ebx, 0                                      ;| stdin
    mov ecx, uinput                                 ;| uinput
    mov edx, uinput_len                             ;| uinput_len

    int 0x80                                        ;| syscall

    mov eax, 4                                      ;| sys_write
    mov ebx, 1                                      ;| stdout
    mov ecx, otpmsg                                 ;| inpmsg
    mov edx, otpmsg_len                             ;| inpmsg_len

    int 0x80                                        ;| syscall

    mov eax, 4                                      ;| sys_write
    mov ebx, 1                                      ;| stdout
    mov ecx, uinput                                 ;| uinput
    mov edx, uinput_len                             ;| uinput_len

    int 0x80                                        ;| syscall

    mov eax, 1                                      ;| sys_exit
    mov ebx, 0                                      ;| exit code

    int 0x80                                        ;\ syscall