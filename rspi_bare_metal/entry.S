
.global vectors_start
.global vectors_end

vectors_start:
    LDR PC, reset_handler_addr
    LDR PC, undef_handler_addr
    LDR PC, swi_handler_addr
    LDR PC, prefetch_abort_handler_addr
    LDR PC, data_abort_handler_addr
    b .
    LDR PC, irq_handler_addr
    LDR PC, fiq_handler_addr
     
    reset_handler_addr: .word reset_handler
    undef_handler_addr: .word undef_handler
    swi_handler_addr: .word swi_handler
    prefetch_abort_handler_addr: .word prefetch_abort_handler
    data_abort_handler_addr: .word data_abort_handler
    irq_handler_addr: .word irq_handler
    fiq_handler_addr: .word fiq_handler
vectors_end:

.space 0x200000-0x8004, 0

reset_handler:
    bl bootmain
    b .

undef_handler:

swi_handler:
    push {lr}
    ldr r0,[lr,#-4]
    bl swi_code
    pop {lr}
    movs pc, lr

prefetch_abort_handler:

data_abort_handler:

irq_handler:

fiq_handler:

halt: b halt

.globl PUT32
PUT32:
    str r1, [r0]
    bx lr

.globl PUT16
PUT16:
    strh r1, [r0]
    bx lr

.globl PUT8
PUT8:
    strb r1, [r0]
    bx lr

.globl GET32
GET32:
    ldr r0, [r0]
    bx lr

.globl GETPC
GETPC:
    mov r0, lr
    bx lr

.globl BRANCHTO
BRANCHTO:
    bx r0

.globl dummy
dummy:
    bx lr
