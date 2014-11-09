	.equ Mode_USR, 0x10
	.equ Mode_FIQ, 0x11
	.equ Mode_IRQ, 0x12
	.equ Mode_SVC, 0x13
	.equ Mode_ABT, 0x17
	.equ Mode_UND, 0x1B
	.equ Mode_SYS, 0x1F
	.equ Mode_MON, 0x16
	.equ I_Bit,    0x80 
	.equ F_Bit,    0x40
	
	.equ Len_FIQ_Stack,  64
	.equ Len_IRQ_Stack,  64
	.equ Len_ABT_Stack,  64
	.equ Len_UND_Stack,  64
	.equ Len_SVC_Stack,  512
	.equ Len_USR_Stack,  512

	.equ Offset_FIQ_Stack, 0
	.equ Offset_IRQ_Stack, Offset_FIQ_Stack + Len_FIQ_Stack
	.equ Offset_ABT_Stack, Offset_IRQ_Stack + Len_IRQ_Stack
	.equ Offset_UND_Stack, Offset_ABT_Stack + Len_ABT_Stack
	.equ Offset_SVC_Stack, Offset_UND_Stack + Len_UND_Stack
	.equ Offset_USR_Stack, Offset_SVC_Stack + Len_SVC_Stack

	.text
	.global _start
	.global _ns_start
	.global _ns_end

_start:
	b reset
	ldr pc, UndefAddr    
	ldr pc, SWIAddr      
	ldr pc, PAbortAddr
	ldr pc, DAbortAddr  
	ldr pc, ReservedAddr 
	ldr pc, IRQAddr 
	ldr pc, FIQAddr 

UndefAddr:      .word UndefHandler
SWIAddr:        .word SWIHandler
PAbortAddr:     .word PAbortHandler
DAbortAddr:     .word DAbortHandler
ReservedAddr:   .word 0
IRQAddr:        .word IRQHandler
FIQAddr:        .word FIQHandler
@ ----------------------------------------------------------
@ Normal World Exception Vectors
@ ----------------------------------------------------------
_ns_start:
	ldr pc, ns_Reset
	ldr pc, ns_UndefAddr    
	ldr pc, ns_SWIAddr      
	ldr pc, ns_PAbortAddr
	ldr pc, ns_DAbortAddr  
	ldr pc, ns_ReservedAddr 
	ldr pc, ns_IRQAddr 
	ldr pc, ns_FIQAddr

ns_Reset:		   .word ns_ResetHandler
ns_UndefAddr:      .word ns_UndefHandler
ns_SWIAddr:        .word ns_SWIHandler
ns_PAbortAddr:     .word ns_PAbortHandler
ns_DAbortAddr:     .word ns_DAbortHandler
ns_ReservedAddr:   .word 0
ns_IRQAddr:        .word ns_IRQHandler
ns_FIQAddr:        .word ns_FIQHandler
_ns_end:
reset:
#	bl CPU_SVC32_MODE
#	bl Disable_MMU_L1cache
#	bl Init_aips
#	bl Init_clock
	
/* --- Initialize stack pointer registers
	   Enter each mode in turn and set up the stack pointer */

	ldr     r0, =STACK_ADR

	CPS     #Mode_MON
	LDR     sp, =STACK_ADR

	MSR     CPSR_c, #Mode_FIQ | I_Bit | F_Bit /* No interrupts*/
	SUB     sp, r0, #Offset_FIQ_Stack
 
	MSR     CPSR_c, #Mode_IRQ | I_Bit | F_Bit /* No interrupts */
	SUB     sp, r0, #Offset_IRQ_Stack
	 
	MSR     CPSR_c, #Mode_ABT | I_Bit | F_Bit /* No interrupts */
	SUB     sp, r0, #Offset_ABT_Stack
	
	MSR     CPSR_c, #Mode_UND | I_Bit | F_Bit  
	SUB     sp, r0, #Offset_UND_Stack   
	
	MSR     CPSR_c, #Mode_SVC | I_Bit | F_Bit /* No interrupts */
	SUB     sp, r0, #Offset_SVC_Stack

/* Init .bss */
/* Clear the .bss section (zero init) */
/*
	LDR     r1,=__bss_start
	LDR     r2,=__bss_end
	MOV     r3,#0
1:
	CMP     r1,r2
	STMLTIA r1!,{r3}
	BLT     1b
*/

#ldr sp, =STACK_ADR
	bl bootmain

CPU_SVC32_MODE:
	mrs r0, cpsr        /*read cpsr register status*/
	bic r0, r0, #0x1f   /*cpsr mode bit clear. 1f means the last five bits*/
	orr r0, r0, #0xd3   /*FIQ&IRQ Disable and set cpu svc mode*/
	msr cpsr, r0
	bx lr

Disable_MMU_L1cache:
	mrc     p15, 0, r0, c1, c0, 0    /* read CP15 register 1 into r0 */
	bic     r0, r0, #(0x1  <<13)     /* clear bit 13 */
	bic     r0, r0, #(0x1  <<12)     /* disable I Cache */
	bic     r0, r0, #(0x1  <<2)      /* disable D Cache */
	bic     r0, r0, #(0x1  <<0)      /* disable MMU */
	mcr     p15, 0, r0, c1, c0, 0    /* write CP15 register 1 */
	bx lr

Init_aips:
	ldr r0, =0x0207C000
	ldr r1, =0x77777777
	str r1, [r0, #0x0]
	str r1, [r0, #0x4]
	ldr r1, =0x0
	str r1, [r0, #0x40]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4C]
	str r1, [r0, #0x50]

	ldr r0, =0x0217C000
	ldr r1, =0x77777777
	str r1, [r0, #0x0]
	str r1, [r0, #0x4]
	ldr r1, =0x0
	str r1, [r0, #0x40]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4C]
	str r1, [r0, #0x50]
	bx lr

Init_clock:
	/* Restore the default values in the Gate registers */
	ldr r0, =0x020c4000
	ldr r1, =0xC0003F
	str r1, [r0, #0x68]
	ldr r1, =0x30FC00
	str r1, [r0, #0x6c]
	ldr r1, =0xFFFC000
	str r1, [r0, #0x70]
	ldr r1, =0x3FF00000
	str r1, [r0, #0x74]
	ldr r1, =0xFFF300
	str r1, [r0, #0x78]
	ldr r1, =0xF0000C3
	str r1, [r0, #0x7c]
	ldr r1, =0x3FC
	str r1, [r0, #0x80]
	bx lr

	.ltorg
	.section .init, "ax"
	.code 32
	
	Mode_MON            =   0x16
	Mode_SVP            =   0x13
	NS_BIT              =   0x1

.global monitor
.align 5
monitor:
	@ Monitor
	NOP     @ Reset      - not used by Monitor
	NOP     @ Undef      - not used by Monitor
	B       SMC_Handler
	NOP     @ Prefetch   - can by used by Monitor
	NOP     @ Data abort - can by used by Monitor
	NOP     @ RESERVED
	NOP     @ IRQ        - can by used by Monitor
	NOP     @ FIQ        - can by used by Monitor

@ ------------------------------------------------------------
@ SMC Handler
@
@ - Detect which world executed SMC
@ - Saves state to appropriate stack
@ - Restores other worlds state
@ - Switches world
@ - Performs exception return
@ ------------------------------------------------------------

.global SMC_Handler
SMC_Handler:
	PUSH   {r0-r3}                       @ R0-r3 contain args to be passed between worlds
										 @ Temporarily stack, so can be used as scratch regs
										 
	@ Which world have we come from
	@ ------------------------------
	MRC     p15, 0, r0, c1, c1, 0        @ Read Secure Configuration Register data
	TST     r0, #NS_BIT                  @ Is the NS bit set?
	EOR     r0, r0, #NS_BIT              @ Toggle NS bit
	MCR     p15, 0, r0, c1, c1, 0        @ Write Secure Configuration Register data

	@ Load save to pointer
	@ ---------------------
	LDREQ   r0, =S_STACK_SP             @ If NS bit set, was in Normal world.  So restore Secure state
	LDRNE   r0, =NS_STACK_SP
	LDR     r2, [r0]

	@ Load restore from pointer
	@ --------------------------
	LDREQ   r1, =NS_STACK_SP
	LDRNE   r1, =S_STACK_SP
	LDR     r3, [r1]

	@ r2  <-- save to
	@ r3  <-- restore from
 
	@ Save general purpose registers, SPSR and LR
	@ --------------------------------------------
	STMFD   r2!, {r4-r12}               @ Save r4 to r12
	@ ADD SUPPORT FOR SPs
	MRS     r4, spsr                    @ Also get a copy of the SPSR
	STMFD   r2!, {r4, lr}               @ Save original SPSR and LR
	
	STR     r2, [r0]                    @ Save updated pointer back, r0 and r2 now free
	
	@ Restore other world registers, SPSR and LR
	@ ---------------------------------------------
	LDMFD   r3!, {r0, lr}               @ Get SPSR and LR from
	@ ADD SUPPORT FOR SPs
	MSR     spsr_cxsf, r0               @ Restore SPSR
	LDMFD   r3!, {r4-r12}               @ Restore registers r4 to r12

	STR     r3, [r1]                    @ Save updated pointer back, r1 and r3 now free
	
	@ Clear local monitor
	@ --------------------
	CLREX                               @ Not strictly required in this example, as not using LDR EX/STREX
										@ However, architecturally should execute CLREX on a context switch

	@ Now restore args (r0-r3)
	@ -------------------------
	POP     {r0-r3}
	
	
	@ Perform exception return
	@ -------------------------
	MOVS    pc, lr

@ ------------------------------------------------------------
@ Monitor Initialization
@
@ This is called the first time the Secure world wishes to
@ move to the Normal world.
@ ------------------------------------------------------------

.global monitorInit
monitorInit:
	@ Install Secure Monitor
	@ -----------------------
	LDR r1, =ns_image                    /* R1 is used !!!!*/
	STR r0, [r1]
	LDR r0, =monitor                 @ Get address of Monitors vector table
	MCR p15, 0, r0, c12, c0, 1       @ Write Monitor Vector Base Address Register

	@ Write Secure World Vector Base Address
	@ ---------------------------------------
	LDR r0, =_start
	MCR p15, 0, r0, c12, c0, 0

	@ Save Secure state
	@ ------------------
	LDR     r0, =S_STACK_LIMIT          @ Get address of Secure state stack
	STMFD   r0!, {r4-r12}               @ Save general purpose registers
	@ ADD support for SPs
	MRS     r1, cpsr                    @ Also get a copy of the CPSR
	STMFD   r0!, {r1, lr}               @ Save CPSR and LR

	@ Switch to Monitor mode
	@ -----------------------
	CPS     #Mode_MON                   @ Move to Monitor mode after saving Secure state

	@ Save Secure state stack pointer
	@ --------------------------------
	LDR     r1, =S_STACK_SP              @ Get address of global
	STR     r0, [r1]                     @ Save pointer


	@ Set up initial NS state stack pointer
	@ --------------------------------------
	LDR     r0, =NS_STACK_SP             @ Get address of global
	LDR     r1, =NS_STACK_LIMIT          @ Get top of Normal state stack (assuming FD model)
	STR     r1, [r0]                     @ Save pointer


	@ Set up exception return information
	@ ------------------------------------
	@IMPORT  ns_image
	 
	LDR     lr, ns_image              @ ns_image
	MSR     spsr_cxsf, #Mode_SVP         @ Set SPSR to be SVC mode

	@ Switch to Normal world
	@ -----------------------
	MRC     p15, 0, r4, c1, c1, 0        @ Read Secure Configuration Register data
	ORR     r4, #NS_BIT                  @ Set NS bit
	MCR     p15, 0, r4, c1, c1, 0        @ Write Secure Configuration Register data
	
	@ Write Normal World Vector Base Address
	@ ---------------------------------------
	@bl copy_vectors	
	LDR r0, =_ns_start
	MCR p15, 0, r0, c12, c0, 0

	@ Clear general purpose registers
	@ --------------------------------
	MOV     r0,  #0
	MOV     r1,  #0
	MOV     r2,  #0
	MOV     r3,  #0
	MOV     r4,  #0
	MOV     r5,  #0
	MOV     r6,  #0
	MOV     r7,  #0
	MOV     r8,  #0
	MOV     r9,  #0
	MOV     r10, #0
	MOV     r11, #0
	MOV     r12, #0

	MOVS    pc, lr


.global PUT32
PUT32:
	str r1, [r0]
	bx lr

.global PUT16
PUT16:
	strh r1, [r0]
	bx lr

.global PUT8
PUT8:
	strb r1, [r0]
	bx lr

.global GET32
GET32:
	ldr r0, [r0]
	bx lr

.global GETPC
GETPC:
	mov r0, lr
	bx lr

.global BRANCHTO
BRANCHTO:
	bx r0

.global dummy
dummy:
	bx lr

@ ------------------------------------------------------------
@ Space reserved for stacks
@ ------------------------------------------------------------
NS_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
NS_STACK_LIMIT:

S_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
S_STACK_LIMIT:

NS_STACK_SP:
	.word     0
	
S_STACK_SP:
	.word     0

ns_image :
	.word     0

@.end
@ ------------------------------------------------------------
@ End
@ ------------------------------------------------------------

@------------------------------------------------------------
@ Secure world Handlers
@ -----------------------------------------------------------
UndefHandler:
	b UndefHandler 
	
SWIHandler:
	push {lr}
	bl secure_swi
 	pop {lr}
 	mov pc, lr

PAbortHandler:
	b PAbortHandler

DAbortHandler:
	b DAbortHandler

IRQHandler:
	b IRQHandler

FIQHandler:
	b FIQHandler

@------------------------------------------------------------
@ Normal world Handlers
@ -----------------------------------------------------------
ns_ResetHandler:
	push {lr}
	bl ns_reset
	pop {lr}
	mov pc, lr

ns_UndefHandler:
	push {lr}
	bl ns_undef
	pop {lr}
	mov pc, lr
	
ns_SWIHandler:
	push {lr}
	bl ns_swi
	pop {lr}
	mov pc, lr
 
ns_PAbortHandler:
	push {lr}
	bl ns_pa
	pop {lr}
	mov pc, lr

ns_DAbortHandler:
	push {lr}
	bl ns_da
	pop {lr}
	mov pc, lr

ns_IRQHandler:
	push {lr}
	bl ns_irq
	pop {lr}
	mov pc, lr

ns_FIQHandler:
	push {lr}
	bl ns_fiq
	pop {lr}
	mov pc, lr
