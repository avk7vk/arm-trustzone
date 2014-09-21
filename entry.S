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

reset_handler:
	ldr sp, =stack_top
	ldr	r0, =MESSAGE
	bl as_print
	bl copy_vectors
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

# assembly (AS) version of print
.global	as_print
as_print:
	# r0 is the param, the addr of char *
	ldrb r3, [r0, #0]
	cmp r3, #0
	bxeq lr
	ldr r2, =AS_UART0_BASE
	ldr r2, [r2, #0]
loop:
	str	r3, [r2, #0]
	ldrb r3, [r0, #1]!
	cmp	r3, #0
	bne	loop
	bx	lr

.section .rodata
.global	AS_UART0_BASE
AS_UART0_BASE:
	.word 0x101F1000
MESSAGE:
	.ascii "Print in Assembly!\012\000"
MESSAGE1:
	.ascii "In SWI_HANDLER!!\012\000"
