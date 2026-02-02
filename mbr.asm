bits 16
org 0x7C00

mov si, 0

text:
   mov ah, 0x0e
   mov al, [loadtxt + si]
   int 0x10
   add si, 1
   cmp [loadtxt + si], 0
   jne loadtxt

loadtxt:
    db "Loading NoBoot...", 0 
 
morebits:
    cli ;getout
    lgdt [gdtr] ;load gdt register
    mov eax, cr0 ;point memory to protected mode enable
    in al, 0x92 ; set protection enable bit in controler register 0
    or al, 2 
    out 0x92, al
    mov cr0, eax ; point protected bit enable to 32bit register?

times 510 - ($ - $$) db 0 ; fill empty with zero
dw 0x55AA ; BIOS something that make it boot