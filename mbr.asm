[bits 16] ; a lot of bitties, barbara with big titties
org 0x7C00 ; this is an address where everything is i guess

mov si, 0 ; move si to 0

text:
   mov ah, 0x0e ;mov the high 8 bits to 0x0e
   mov al, [loadtxt + si] ; move the low 8 bits to loading text + si
   int 0x10 ; write on screen
   add si, 1 ; add 1 to si (another letter)
   cmp [loadtxt + si], 0 ; check if text spelling finished
   jne loadtxt ; if text didnt finish then loop

loadtxt:
    db "Loading NoBoot...", 0 ; loading text ofc
 
morebits:
    cli ;getout
    lgdt [gdtr] ;load gdt register
    mov eax, cr0 ;point memory to protected mode enable
    in al, 0x92 ; set protection enable bit in controler register 0
    or al, 2 
    out 0x92, al
    mov cr0, eax ; point protected bit enable to 32bit register?
    
    jmp 08h:PModeMain ; some kind of far jump to 08h whatever that is honestly

    PModeMain: ; load some weird shit like DS, ES, FS, GS, SS, ESP idk

times 510 - ($ - $$) db 0 ; fill empty with zero
dw 0x55AA ; BIOS something that make it boot
