.section .init, "ax"

#define start symbol

.global _start
_start:
    .cfi_startproc
    .cfi_undefined ra
    .option push
    .option norelax

#Load global pointer and stack pointer register

    la gp, __global_pointer$
    .option pop
    la sp, __stack_top
    add s0, sp, zero

#Call main 

    jal ra, main

#END
el:
    j el

#NOP
    nop
    nop	
    .cfi_endproc
    .end
