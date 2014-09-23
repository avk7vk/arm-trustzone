
kernel.elf:     file format elf32-littlearm


Disassembly of section .entry:

00010000 <vectors_start>:
   10000:	e59ff018 	ldr	pc, [pc, #24]	; 10020 <reset_handler_addr>
   10004:	e59ff018 	ldr	pc, [pc, #24]	; 10024 <undef_handler_addr>
   10008:	e59ff018 	ldr	pc, [pc, #24]	; 10028 <swi_handler_addr>
   1000c:	e59ff018 	ldr	pc, [pc, #24]	; 1002c <prefetch_abort_handler_addr>
   10010:	e59ff018 	ldr	pc, [pc, #24]	; 10030 <data_abort_handler_addr>
   10014:	eafffffe 	b	10014 <vectors_start+0x14>
   10018:	e59ff014 	ldr	pc, [pc, #20]	; 10034 <irq_handler_addr>
   1001c:	e59ff014 	ldr	pc, [pc, #20]	; 10038 <fiq_handler_addr>

00010020 <reset_handler_addr>:
   10020:	0001003c 	.word	0x0001003c

00010024 <undef_handler_addr>:
   10024:	00010054 	.word	0x00010054

00010028 <swi_handler_addr>:
   10028:	00010054 	.word	0x00010054

0001002c <prefetch_abort_handler_addr>:
   1002c:	00010068 	.word	0x00010068

00010030 <data_abort_handler_addr>:
   10030:	00010068 	.word	0x00010068

00010034 <irq_handler_addr>:
   10034:	00010068 	.word	0x00010068

00010038 <fiq_handler_addr>:
   10038:	00010068 	.word	0x00010068

0001003c <vectors_end>:
   1003c:	e59fd04c 	ldr	sp, [pc, #76]	; 10090 <loop+0x14>
   10040:	e59f004c 	ldr	r0, [pc, #76]	; 10094 <loop+0x18>
   10044:	eb000007 	bl	10068 <as_print>
   10048:	eb000013 	bl	1009c <copy_vectors>
   1004c:	eb000118 	bl	104b4 <bootmain>
   10050:	eafffffe 	b	10050 <vectors_end+0x14>

00010054 <swi_handler>:
   10054:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   10058:	e51e0004 	ldr	r0, [lr, #-4]
   1005c:	eb000106 	bl	1047c <swi_code>
   10060:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   10064:	e1b0f00e 	movs	pc, lr

00010068 <as_print>:
   10068:	e5d03000 	ldrb	r3, [r0]
   1006c:	e3530000 	cmp	r3, #0
   10070:	012fff1e 	bxeq	lr
   10074:	e59f201c 	ldr	r2, [pc, #28]	; 10098 <loop+0x1c>
   10078:	e5922000 	ldr	r2, [r2]

0001007c <loop>:
   1007c:	e5823000 	str	r3, [r2]
   10080:	e5f03001 	ldrb	r3, [r0, #1]!
   10084:	e3530000 	cmp	r3, #0
   10088:	1afffffb 	bne	1007c <loop>
   1008c:	e12fff1e 	bx	lr
   10090:	000116a0 	.word	0x000116a0
   10094:	0001060c 	.word	0x0001060c
   10098:	00010608 	.word	0x00010608

Disassembly of section .text:

0001009c <copy_vectors>:
   1009c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   100a0:	e28db000 	add	fp, sp, #0
   100a4:	e24dd00c 	sub	sp, sp, #12
   100a8:	e59f3048 	ldr	r3, [pc, #72]	; 100f8 <copy_vectors+0x5c>
   100ac:	e50b3008 	str	r3, [fp, #-8]
   100b0:	e3a03000 	mov	r3, #0
   100b4:	e50b300c 	str	r3, [fp, #-12]
   100b8:	ea000007 	b	100dc <copy_vectors+0x40>
   100bc:	e51b300c 	ldr	r3, [fp, #-12]
   100c0:	e2832004 	add	r2, r3, #4
   100c4:	e50b200c 	str	r2, [fp, #-12]
   100c8:	e51b2008 	ldr	r2, [fp, #-8]
   100cc:	e2821004 	add	r1, r2, #4
   100d0:	e50b1008 	str	r1, [fp, #-8]
   100d4:	e5922000 	ldr	r2, [r2]
   100d8:	e5832000 	str	r2, [r3]
   100dc:	e51b2008 	ldr	r2, [fp, #-8]
   100e0:	e59f3014 	ldr	r3, [pc, #20]	; 100fc <copy_vectors+0x60>
   100e4:	e1520003 	cmp	r2, r3
   100e8:	3afffff3 	bcc	100bc <copy_vectors+0x20>
   100ec:	e24bd000 	sub	sp, fp, #0
   100f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   100f4:	e12fff1e 	bx	lr
   100f8:	00010000 	.word	0x00010000
   100fc:	0001003c 	.word	0x0001003c

00010100 <print_string>:
   10100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10104:	e28db000 	add	fp, sp, #0
   10108:	e24dd00c 	sub	sp, sp, #12
   1010c:	e50b0008 	str	r0, [fp, #-8]
   10110:	ea000006 	b	10130 <print_string+0x30>
   10114:	e59f3030 	ldr	r3, [pc, #48]	; 1014c <print_string+0x4c>
   10118:	e51b2008 	ldr	r2, [fp, #-8]
   1011c:	e5d22000 	ldrb	r2, [r2]
   10120:	e5c32000 	strb	r2, [r3]
   10124:	e51b3008 	ldr	r3, [fp, #-8]
   10128:	e2833001 	add	r3, r3, #1
   1012c:	e50b3008 	str	r3, [fp, #-8]
   10130:	e51b3008 	ldr	r3, [fp, #-8]
   10134:	e5d33000 	ldrb	r3, [r3]
   10138:	e3530000 	cmp	r3, #0
   1013c:	1afffff4 	bne	10114 <print_string+0x14>
   10140:	e24bd000 	sub	sp, fp, #0
   10144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10148:	e12fff1e 	bx	lr
   1014c:	101f1000 	.word	0x101f1000

00010150 <uart_send>:
   10150:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10154:	e28db000 	add	fp, sp, #0
   10158:	e24dd00c 	sub	sp, sp, #12
   1015c:	e50b0008 	str	r0, [fp, #-8]
   10160:	e59f3014 	ldr	r3, [pc, #20]	; 1017c <uart_send+0x2c>
   10164:	e51b2008 	ldr	r2, [fp, #-8]
   10168:	e20220ff 	and	r2, r2, #255	; 0xff
   1016c:	e5c32000 	strb	r2, [r3]
   10170:	e24bd000 	sub	sp, fp, #0
   10174:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10178:	e12fff1e 	bx	lr
   1017c:	101f1000 	.word	0x101f1000

00010180 <printint>:
   10180:	e92d4810 	push	{r4, fp, lr}
   10184:	e28db008 	add	fp, sp, #8
   10188:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   1018c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10190:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
   10194:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
   10198:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
   1019c:	e3530000 	cmp	r3, #0
   101a0:	0a00000a 	beq	101d0 <printint+0x50>
   101a4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   101a8:	e1a03fa3 	lsr	r3, r3, #31
   101ac:	e20330ff 	and	r3, r3, #255	; 0xff
   101b0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
   101b4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
   101b8:	e3530000 	cmp	r3, #0
   101bc:	0a000003 	beq	101d0 <printint+0x50>
   101c0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   101c4:	e2633000 	rsb	r3, r3, #0
   101c8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
   101cc:	ea000001 	b	101d8 <printint+0x58>
   101d0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   101d4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
   101d8:	e3a03000 	mov	r3, #0
   101dc:	e50b3010 	str	r3, [fp, #-16]
   101e0:	e51b4010 	ldr	r4, [fp, #-16]
   101e4:	e2843001 	add	r3, r4, #1
   101e8:	e50b3010 	str	r3, [fp, #-16]
   101ec:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   101f0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   101f4:	e1a00002 	mov	r0, r2
   101f8:	e1a01003 	mov	r1, r3
   101fc:	eb0000f8 	bl	105e4 <__aeabi_uidivmod>
   10200:	e1a03001 	mov	r3, r1
   10204:	e59f20b4 	ldr	r2, [pc, #180]	; 102c0 <printint+0x140>
   10208:	e7d22003 	ldrb	r2, [r2, r3]
   1020c:	e3e03017 	mvn	r3, #23
   10210:	e24b000c 	sub	r0, fp, #12
   10214:	e0801004 	add	r1, r0, r4
   10218:	e0813003 	add	r3, r1, r3
   1021c:	e5c32000 	strb	r2, [r3]
   10220:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10224:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
   10228:	e1a01003 	mov	r1, r3
   1022c:	eb0000af 	bl	104f0 <__aeabi_uidiv>
   10230:	e1a03000 	mov	r3, r0
   10234:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
   10238:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   1023c:	e3530000 	cmp	r3, #0
   10240:	1affffe6 	bne	101e0 <printint+0x60>
   10244:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
   10248:	e3530000 	cmp	r3, #0
   1024c:	0a000009 	beq	10278 <printint+0xf8>
   10250:	e51b3010 	ldr	r3, [fp, #-16]
   10254:	e2832001 	add	r2, r3, #1
   10258:	e50b2010 	str	r2, [fp, #-16]
   1025c:	e3e02017 	mvn	r2, #23
   10260:	e24b100c 	sub	r1, fp, #12
   10264:	e0813003 	add	r3, r1, r3
   10268:	e0833002 	add	r3, r3, r2
   1026c:	e3a0202d 	mov	r2, #45	; 0x2d
   10270:	e5c32000 	strb	r2, [r3]
   10274:	ea000008 	b	1029c <printint+0x11c>
   10278:	ea000007 	b	1029c <printint+0x11c>
   1027c:	e3e03017 	mvn	r3, #23
   10280:	e51b2010 	ldr	r2, [fp, #-16]
   10284:	e24b000c 	sub	r0, fp, #12
   10288:	e0802002 	add	r2, r0, r2
   1028c:	e0823003 	add	r3, r2, r3
   10290:	e5d33000 	ldrb	r3, [r3]
   10294:	e1a00003 	mov	r0, r3
   10298:	ebffffac 	bl	10150 <uart_send>
   1029c:	e51b3010 	ldr	r3, [fp, #-16]
   102a0:	e2433001 	sub	r3, r3, #1
   102a4:	e50b3010 	str	r3, [fp, #-16]
   102a8:	e51b3010 	ldr	r3, [fp, #-16]
   102ac:	e3530000 	cmp	r3, #0
   102b0:	aafffff1 	bge	1027c <printint+0xfc>
   102b4:	e24bd008 	sub	sp, fp, #8
   102b8:	e8bd4810 	pop	{r4, fp, lr}
   102bc:	e12fff1e 	bx	lr
   102c0:	00010688 	.word	0x00010688

000102c4 <cprintf>:
   102c4:	e92d000f 	push	{r0, r1, r2, r3}
   102c8:	e92d4800 	push	{fp, lr}
   102cc:	e28db004 	add	fp, sp, #4
   102d0:	e24dd010 	sub	sp, sp, #16
   102d4:	e28b3008 	add	r3, fp, #8
   102d8:	e50b300c 	str	r3, [fp, #-12]
   102dc:	e3a03000 	mov	r3, #0
   102e0:	e50b3008 	str	r3, [fp, #-8]
   102e4:	ea000057 	b	10448 <cprintf+0x184>
   102e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   102ec:	e3530025 	cmp	r3, #37	; 0x25
   102f0:	0a000003 	beq	10304 <cprintf+0x40>
   102f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   102f8:	e1a00003 	mov	r0, r3
   102fc:	ebffff93 	bl	10150 <uart_send>
   10300:	ea00004d 	b	1043c <cprintf+0x178>
   10304:	e59b2004 	ldr	r2, [fp, #4]
   10308:	e51b3008 	ldr	r3, [fp, #-8]
   1030c:	e2833001 	add	r3, r3, #1
   10310:	e50b3008 	str	r3, [fp, #-8]
   10314:	e51b3008 	ldr	r3, [fp, #-8]
   10318:	e0823003 	add	r3, r2, r3
   1031c:	e5d33000 	ldrb	r3, [r3]
   10320:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
   10324:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10328:	e3530000 	cmp	r3, #0
   1032c:	1a000000 	bne	10334 <cprintf+0x70>
   10330:	ea00004c 	b	10468 <cprintf+0x1a4>
   10334:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10338:	e3530070 	cmp	r3, #112	; 0x70
   1033c:	0a000014 	beq	10394 <cprintf+0xd0>
   10340:	e3530070 	cmp	r3, #112	; 0x70
   10344:	ca000004 	bgt	1035c <cprintf+0x98>
   10348:	e3530025 	cmp	r3, #37	; 0x25
   1034c:	0a000031 	beq	10418 <cprintf+0x154>
   10350:	e3530064 	cmp	r3, #100	; 0x64
   10354:	0a000005 	beq	10370 <cprintf+0xac>
   10358:	ea000031 	b	10424 <cprintf+0x160>
   1035c:	e3530073 	cmp	r3, #115	; 0x73
   10360:	0a000014 	beq	103b8 <cprintf+0xf4>
   10364:	e3530078 	cmp	r3, #120	; 0x78
   10368:	0a000009 	beq	10394 <cprintf+0xd0>
   1036c:	ea00002c 	b	10424 <cprintf+0x160>
   10370:	e51b300c 	ldr	r3, [fp, #-12]
   10374:	e2832004 	add	r2, r3, #4
   10378:	e50b200c 	str	r2, [fp, #-12]
   1037c:	e5933000 	ldr	r3, [r3]
   10380:	e1a00003 	mov	r0, r3
   10384:	e3a0100a 	mov	r1, #10
   10388:	e3a02001 	mov	r2, #1
   1038c:	ebffff7b 	bl	10180 <printint>
   10390:	ea000029 	b	1043c <cprintf+0x178>
   10394:	e51b300c 	ldr	r3, [fp, #-12]
   10398:	e2832004 	add	r2, r3, #4
   1039c:	e50b200c 	str	r2, [fp, #-12]
   103a0:	e5933000 	ldr	r3, [r3]
   103a4:	e1a00003 	mov	r0, r3
   103a8:	e3a01010 	mov	r1, #16
   103ac:	e3a02000 	mov	r2, #0
   103b0:	ebffff72 	bl	10180 <printint>
   103b4:	ea000020 	b	1043c <cprintf+0x178>
   103b8:	e51b300c 	ldr	r3, [fp, #-12]
   103bc:	e2832004 	add	r2, r3, #4
   103c0:	e50b200c 	str	r2, [fp, #-12]
   103c4:	e5933000 	ldr	r3, [r3]
   103c8:	e50b3010 	str	r3, [fp, #-16]
   103cc:	e51b3010 	ldr	r3, [fp, #-16]
   103d0:	e3530000 	cmp	r3, #0
   103d4:	1a000002 	bne	103e4 <cprintf+0x120>
   103d8:	e59f3098 	ldr	r3, [pc, #152]	; 10478 <cprintf+0x1b4>
   103dc:	e50b3010 	str	r3, [fp, #-16]
   103e0:	ea000007 	b	10404 <cprintf+0x140>
   103e4:	ea000006 	b	10404 <cprintf+0x140>
   103e8:	e51b3010 	ldr	r3, [fp, #-16]
   103ec:	e5d33000 	ldrb	r3, [r3]
   103f0:	e1a00003 	mov	r0, r3
   103f4:	ebffff55 	bl	10150 <uart_send>
   103f8:	e51b3010 	ldr	r3, [fp, #-16]
   103fc:	e2833001 	add	r3, r3, #1
   10400:	e50b3010 	str	r3, [fp, #-16]
   10404:	e51b3010 	ldr	r3, [fp, #-16]
   10408:	e5d33000 	ldrb	r3, [r3]
   1040c:	e3530000 	cmp	r3, #0
   10410:	1afffff4 	bne	103e8 <cprintf+0x124>
   10414:	ea000008 	b	1043c <cprintf+0x178>
   10418:	e3a00025 	mov	r0, #37	; 0x25
   1041c:	ebffff4b 	bl	10150 <uart_send>
   10420:	ea000005 	b	1043c <cprintf+0x178>
   10424:	e3a00025 	mov	r0, #37	; 0x25
   10428:	ebffff48 	bl	10150 <uart_send>
   1042c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10430:	e1a00003 	mov	r0, r3
   10434:	ebffff45 	bl	10150 <uart_send>
   10438:	e1a00000 	nop			; (mov r0, r0)
   1043c:	e51b3008 	ldr	r3, [fp, #-8]
   10440:	e2833001 	add	r3, r3, #1
   10444:	e50b3008 	str	r3, [fp, #-8]
   10448:	e59b2004 	ldr	r2, [fp, #4]
   1044c:	e51b3008 	ldr	r3, [fp, #-8]
   10450:	e0823003 	add	r3, r2, r3
   10454:	e5d33000 	ldrb	r3, [r3]
   10458:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
   1045c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10460:	e3530000 	cmp	r3, #0
   10464:	1affff9f 	bne	102e8 <cprintf+0x24>
   10468:	e24bd004 	sub	sp, fp, #4
   1046c:	e8bd4800 	pop	{fp, lr}
   10470:	e28dd010 	add	sp, sp, #16
   10474:	e12fff1e 	bx	lr
   10478:	00010638 	.word	0x00010638

0001047c <swi_code>:
   1047c:	e92d4800 	push	{fp, lr}
   10480:	e28db004 	add	fp, sp, #4
   10484:	e24dd008 	sub	sp, sp, #8
   10488:	e50b0008 	str	r0, [fp, #-8]
   1048c:	e59f0018 	ldr	r0, [pc, #24]	; 104ac <swi_code+0x30>
   10490:	ebffff1a 	bl	10100 <print_string>
   10494:	e59f0014 	ldr	r0, [pc, #20]	; 104b0 <swi_code+0x34>
   10498:	e51b1008 	ldr	r1, [fp, #-8]
   1049c:	ebffff88 	bl	102c4 <cprintf>
   104a0:	e24bd004 	sub	sp, fp, #4
   104a4:	e8bd4800 	pop	{fp, lr}
   104a8:	e12fff1e 	bx	lr
   104ac:	00010640 	.word	0x00010640
   104b0:	00010650 	.word	0x00010650

000104b4 <bootmain>:
   104b4:	e92d4800 	push	{fp, lr}
   104b8:	e28db004 	add	fp, sp, #4
   104bc:	e59f0020 	ldr	r0, [pc, #32]	; 104e4 <bootmain+0x30>
   104c0:	ebffff0e 	bl	10100 <print_string>
   104c4:	e59f001c 	ldr	r0, [pc, #28]	; 104e8 <bootmain+0x34>
   104c8:	ebffff7d 	bl	102c4 <cprintf>
   104cc:	ef000008 	svc	0x00000008
   104d0:	e59f0014 	ldr	r0, [pc, #20]	; 104ec <bootmain+0x38>
   104d4:	ebffff7a 	bl	102c4 <cprintf>
   104d8:	e24bd004 	sub	sp, fp, #4
   104dc:	e8bd4800 	pop	{fp, lr}
   104e0:	e12fff1e 	bx	lr
   104e4:	00010664 	.word	0x00010664
   104e8:	00010670 	.word	0x00010670
   104ec:	0001067c 	.word	0x0001067c

000104f0 <__aeabi_uidiv>:
   104f0:	e2512001 	subs	r2, r1, #1
   104f4:	012fff1e 	bxeq	lr
   104f8:	3a000036 	bcc	105d8 <__aeabi_uidiv+0xe8>
   104fc:	e1500001 	cmp	r0, r1
   10500:	9a000022 	bls	10590 <__aeabi_uidiv+0xa0>
   10504:	e1110002 	tst	r1, r2
   10508:	0a000023 	beq	1059c <__aeabi_uidiv+0xac>
   1050c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
   10510:	01a01181 	lsleq	r1, r1, #3
   10514:	03a03008 	moveq	r3, #8
   10518:	13a03001 	movne	r3, #1
   1051c:	e3510201 	cmp	r1, #268435456	; 0x10000000
   10520:	31510000 	cmpcc	r1, r0
   10524:	31a01201 	lslcc	r1, r1, #4
   10528:	31a03203 	lslcc	r3, r3, #4
   1052c:	3afffffa 	bcc	1051c <__aeabi_uidiv+0x2c>
   10530:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
   10534:	31510000 	cmpcc	r1, r0
   10538:	31a01081 	lslcc	r1, r1, #1
   1053c:	31a03083 	lslcc	r3, r3, #1
   10540:	3afffffa 	bcc	10530 <__aeabi_uidiv+0x40>
   10544:	e3a02000 	mov	r2, #0
   10548:	e1500001 	cmp	r0, r1
   1054c:	20400001 	subcs	r0, r0, r1
   10550:	21822003 	orrcs	r2, r2, r3
   10554:	e15000a1 	cmp	r0, r1, lsr #1
   10558:	204000a1 	subcs	r0, r0, r1, lsr #1
   1055c:	218220a3 	orrcs	r2, r2, r3, lsr #1
   10560:	e1500121 	cmp	r0, r1, lsr #2
   10564:	20400121 	subcs	r0, r0, r1, lsr #2
   10568:	21822123 	orrcs	r2, r2, r3, lsr #2
   1056c:	e15001a1 	cmp	r0, r1, lsr #3
   10570:	204001a1 	subcs	r0, r0, r1, lsr #3
   10574:	218221a3 	orrcs	r2, r2, r3, lsr #3
   10578:	e3500000 	cmp	r0, #0
   1057c:	11b03223 	lsrsne	r3, r3, #4
   10580:	11a01221 	lsrne	r1, r1, #4
   10584:	1affffef 	bne	10548 <__aeabi_uidiv+0x58>
   10588:	e1a00002 	mov	r0, r2
   1058c:	e12fff1e 	bx	lr
   10590:	03a00001 	moveq	r0, #1
   10594:	13a00000 	movne	r0, #0
   10598:	e12fff1e 	bx	lr
   1059c:	e3510801 	cmp	r1, #65536	; 0x10000
   105a0:	21a01821 	lsrcs	r1, r1, #16
   105a4:	23a02010 	movcs	r2, #16
   105a8:	33a02000 	movcc	r2, #0
   105ac:	e3510c01 	cmp	r1, #256	; 0x100
   105b0:	21a01421 	lsrcs	r1, r1, #8
   105b4:	22822008 	addcs	r2, r2, #8
   105b8:	e3510010 	cmp	r1, #16
   105bc:	21a01221 	lsrcs	r1, r1, #4
   105c0:	22822004 	addcs	r2, r2, #4
   105c4:	e3510004 	cmp	r1, #4
   105c8:	82822003 	addhi	r2, r2, #3
   105cc:	908220a1 	addls	r2, r2, r1, lsr #1
   105d0:	e1a00230 	lsr	r0, r0, r2
   105d4:	e12fff1e 	bx	lr
   105d8:	e3500000 	cmp	r0, #0
   105dc:	13e00000 	mvnne	r0, #0
   105e0:	ea000007 	b	10604 <__aeabi_idiv0>

000105e4 <__aeabi_uidivmod>:
   105e4:	e3510000 	cmp	r1, #0
   105e8:	0afffffa 	beq	105d8 <__aeabi_uidiv+0xe8>
   105ec:	e92d4003 	push	{r0, r1, lr}
   105f0:	ebffffbe 	bl	104f0 <__aeabi_uidiv>
   105f4:	e8bd4006 	pop	{r1, r2, lr}
   105f8:	e0030092 	mul	r3, r2, r0
   105fc:	e0411003 	sub	r1, r1, r3
   10600:	e12fff1e 	bx	lr

00010604 <__aeabi_idiv0>:
   10604:	e12fff1e 	bx	lr
