
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <vectors_start>:
    8000:	e59ff018 	ldr	pc, [pc, #24]	; 8020 <reset_handler_addr>
    8004:	e59ff018 	ldr	pc, [pc, #24]	; 8024 <undef_handler_addr>
    8008:	e59ff018 	ldr	pc, [pc, #24]	; 8028 <swi_handler_addr>
    800c:	e59ff018 	ldr	pc, [pc, #24]	; 802c <prefetch_abort_handler_addr>
    8010:	e59ff018 	ldr	pc, [pc, #24]	; 8030 <data_abort_handler_addr>
    8014:	eafffffe 	b	8014 <vectors_start+0x14>
    8018:	e59ff014 	ldr	pc, [pc, #20]	; 8034 <irq_handler_addr>
    801c:	e59ff014 	ldr	pc, [pc, #20]	; 8038 <fiq_handler_addr>

00008020 <reset_handler_addr>:
    8020:	0000803c 	andeq	r8, r0, ip, lsr r0

00008024 <undef_handler_addr>:
    8024:	0000804c 	andeq	r8, r0, ip, asr #32

00008028 <swi_handler_addr>:
    8028:	0000804c 	andeq	r8, r0, ip, asr #32

0000802c <prefetch_abort_handler_addr>:
    802c:	00008060 	andeq	r8, r0, r0, rrx

00008030 <data_abort_handler_addr>:
    8030:	00008060 	andeq	r8, r0, r0, rrx

00008034 <irq_handler_addr>:
    8034:	00008060 	andeq	r8, r0, r0, rrx

00008038 <fiq_handler_addr>:
    8038:	00008060 	andeq	r8, r0, r0, rrx

0000803c <vectors_end>:
    803c:	e59fd050 	ldr	sp, [pc, #80]	; 8094 <dummy+0x4>
    8040:	eb0000b1 	bl	830c <copy_vectors>
    8044:	eb0001b5 	bl	8720 <bootmain>
    8048:	eafffffe 	b	8048 <vectors_end+0xc>

0000804c <swi_handler>:
    804c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8050:	e51e0004 	ldr	r0, [lr, #-4]
    8054:	eb0001a6 	bl	86f4 <swi_code>
    8058:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    805c:	e1b0f00e 	movs	pc, lr

00008060 <data_abort_handler>:
    8060:	eafffffe 	b	8060 <data_abort_handler>

00008064 <PUT32>:
    8064:	e5801000 	str	r1, [r0]
    8068:	e12fff1e 	bx	lr

0000806c <PUT16>:
    806c:	e1c010b0 	strh	r1, [r0]
    8070:	e12fff1e 	bx	lr

00008074 <PUT8>:
    8074:	e5c01000 	strb	r1, [r0]
    8078:	e12fff1e 	bx	lr

0000807c <GET32>:
    807c:	e5900000 	ldr	r0, [r0]
    8080:	e12fff1e 	bx	lr

00008084 <GETPC>:
    8084:	e1a0000e 	mov	r0, lr
    8088:	e12fff1e 	bx	lr

0000808c <BRANCHTO>:
    808c:	e12fff10 	bx	r0

00008090 <dummy>:
    8090:	e12fff1e 	bx	lr
    8094:	00080000 	andeq	r0, r8, r0

00008098 <uart_lcr>:
    8098:	e92d4800 	push	{fp, lr}
    809c:	e28db004 	add	fp, sp, #4
    80a0:	e59f0014 	ldr	r0, [pc, #20]	; 80bc <uart_lcr+0x24>
    80a4:	ebfffff4 	bl	807c <GET32>
    80a8:	e1a03000 	mov	r3, r0
    80ac:	e1a00003 	mov	r0, r3
    80b0:	e24bd004 	sub	sp, fp, #4
    80b4:	e8bd4800 	pop	{fp, lr}
    80b8:	e12fff1e 	bx	lr
    80bc:	20215054 	eorcs	r5, r1, r4, asr r0

000080c0 <uart_recv>:
    80c0:	e92d4800 	push	{fp, lr}
    80c4:	e28db004 	add	fp, sp, #4
    80c8:	e59f0038 	ldr	r0, [pc, #56]	; 8108 <uart_recv+0x48>
    80cc:	ebffffea 	bl	807c <GET32>
    80d0:	e1a03000 	mov	r3, r0
    80d4:	e2033001 	and	r3, r3, #1
    80d8:	e3530000 	cmp	r3, #0
    80dc:	0a000000 	beq	80e4 <uart_recv+0x24>
    80e0:	ea000000 	b	80e8 <uart_recv+0x28>
    80e4:	eafffff7 	b	80c8 <uart_recv+0x8>
    80e8:	e59f001c 	ldr	r0, [pc, #28]	; 810c <uart_recv+0x4c>
    80ec:	ebffffe2 	bl	807c <GET32>
    80f0:	e1a03000 	mov	r3, r0
    80f4:	e20330ff 	and	r3, r3, #255	; 0xff
    80f8:	e1a00003 	mov	r0, r3
    80fc:	e24bd004 	sub	sp, fp, #4
    8100:	e8bd4800 	pop	{fp, lr}
    8104:	e12fff1e 	bx	lr
    8108:	20215054 	eorcs	r5, r1, r4, asr r0
    810c:	20215040 	eorcs	r5, r1, r0, asr #32

00008110 <uart_send>:
    8110:	e92d4800 	push	{fp, lr}
    8114:	e28db004 	add	fp, sp, #4
    8118:	e24dd008 	sub	sp, sp, #8
    811c:	e50b0008 	str	r0, [fp, #-8]
    8120:	e59f0030 	ldr	r0, [pc, #48]	; 8158 <uart_send+0x48>
    8124:	ebffffd4 	bl	807c <GET32>
    8128:	e1a03000 	mov	r3, r0
    812c:	e2033020 	and	r3, r3, #32
    8130:	e3530000 	cmp	r3, #0
    8134:	0a000000 	beq	813c <uart_send+0x2c>
    8138:	ea000000 	b	8140 <uart_send+0x30>
    813c:	eafffff7 	b	8120 <uart_send+0x10>
    8140:	e59f0014 	ldr	r0, [pc, #20]	; 815c <uart_send+0x4c>
    8144:	e51b1008 	ldr	r1, [fp, #-8]
    8148:	ebffffc5 	bl	8064 <PUT32>
    814c:	e24bd004 	sub	sp, fp, #4
    8150:	e8bd4800 	pop	{fp, lr}
    8154:	e12fff1e 	bx	lr
    8158:	20215054 	eorcs	r5, r1, r4, asr r0
    815c:	20215040 	eorcs	r5, r1, r0, asr #32

00008160 <uart_flush>:
    8160:	e92d4800 	push	{fp, lr}
    8164:	e28db004 	add	fp, sp, #4
    8168:	e59f0024 	ldr	r0, [pc, #36]	; 8194 <uart_flush+0x34>
    816c:	ebffffc2 	bl	807c <GET32>
    8170:	e1a03000 	mov	r3, r0
    8174:	e2033c01 	and	r3, r3, #256	; 0x100
    8178:	e3530000 	cmp	r3, #0
    817c:	1a000000 	bne	8184 <uart_flush+0x24>
    8180:	ea000000 	b	8188 <uart_flush+0x28>
    8184:	eafffff7 	b	8168 <uart_flush+0x8>
    8188:	e24bd004 	sub	sp, fp, #4
    818c:	e8bd4800 	pop	{fp, lr}
    8190:	e12fff1e 	bx	lr
    8194:	20215054 	eorcs	r5, r1, r4, asr r0

00008198 <uart_init>:
    8198:	e92d4800 	push	{fp, lr}
    819c:	e28db004 	add	fp, sp, #4
    81a0:	e24dd008 	sub	sp, sp, #8
    81a4:	e59f0134 	ldr	r0, [pc, #308]	; 82e0 <uart_init+0x148>
    81a8:	e3a01001 	mov	r1, #1
    81ac:	ebffffac 	bl	8064 <PUT32>
    81b0:	e59f012c 	ldr	r0, [pc, #300]	; 82e4 <uart_init+0x14c>
    81b4:	e3a01000 	mov	r1, #0
    81b8:	ebffffa9 	bl	8064 <PUT32>
    81bc:	e59f0124 	ldr	r0, [pc, #292]	; 82e8 <uart_init+0x150>
    81c0:	e3a01000 	mov	r1, #0
    81c4:	ebffffa6 	bl	8064 <PUT32>
    81c8:	e59f011c 	ldr	r0, [pc, #284]	; 82ec <uart_init+0x154>
    81cc:	e3a01003 	mov	r1, #3
    81d0:	ebffffa3 	bl	8064 <PUT32>
    81d4:	e59f0114 	ldr	r0, [pc, #276]	; 82f0 <uart_init+0x158>
    81d8:	e3a01000 	mov	r1, #0
    81dc:	ebffffa0 	bl	8064 <PUT32>
    81e0:	e59f00fc 	ldr	r0, [pc, #252]	; 82e4 <uart_init+0x14c>
    81e4:	e3a01000 	mov	r1, #0
    81e8:	ebffff9d 	bl	8064 <PUT32>
    81ec:	e59f0100 	ldr	r0, [pc, #256]	; 82f4 <uart_init+0x15c>
    81f0:	e3a010c6 	mov	r1, #198	; 0xc6
    81f4:	ebffff9a 	bl	8064 <PUT32>
    81f8:	e59f00f8 	ldr	r0, [pc, #248]	; 82f8 <uart_init+0x160>
    81fc:	e59f10f8 	ldr	r1, [pc, #248]	; 82fc <uart_init+0x164>
    8200:	ebffff97 	bl	8064 <PUT32>
    8204:	e59f00f4 	ldr	r0, [pc, #244]	; 8300 <uart_init+0x168>
    8208:	ebffff9b 	bl	807c <GET32>
    820c:	e50b0008 	str	r0, [fp, #-8]
    8210:	e51b3008 	ldr	r3, [fp, #-8]
    8214:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    8218:	e50b3008 	str	r3, [fp, #-8]
    821c:	e51b3008 	ldr	r3, [fp, #-8]
    8220:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    8224:	e50b3008 	str	r3, [fp, #-8]
    8228:	e51b3008 	ldr	r3, [fp, #-8]
    822c:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    8230:	e50b3008 	str	r3, [fp, #-8]
    8234:	e51b3008 	ldr	r3, [fp, #-8]
    8238:	e3833801 	orr	r3, r3, #65536	; 0x10000
    823c:	e50b3008 	str	r3, [fp, #-8]
    8240:	e59f00b8 	ldr	r0, [pc, #184]	; 8300 <uart_init+0x168>
    8244:	e51b1008 	ldr	r1, [fp, #-8]
    8248:	ebffff85 	bl	8064 <PUT32>
    824c:	e59f00b0 	ldr	r0, [pc, #176]	; 8304 <uart_init+0x16c>
    8250:	e3a01000 	mov	r1, #0
    8254:	ebffff82 	bl	8064 <PUT32>
    8258:	e3a03000 	mov	r3, #0
    825c:	e50b3008 	str	r3, [fp, #-8]
    8260:	ea000004 	b	8278 <uart_init+0xe0>
    8264:	e51b0008 	ldr	r0, [fp, #-8]
    8268:	ebffff88 	bl	8090 <dummy>
    826c:	e51b3008 	ldr	r3, [fp, #-8]
    8270:	e2833001 	add	r3, r3, #1
    8274:	e50b3008 	str	r3, [fp, #-8]
    8278:	e51b3008 	ldr	r3, [fp, #-8]
    827c:	e3530095 	cmp	r3, #149	; 0x95
    8280:	9afffff7 	bls	8264 <uart_init+0xcc>
    8284:	e59f007c 	ldr	r0, [pc, #124]	; 8308 <uart_init+0x170>
    8288:	e3a01903 	mov	r1, #49152	; 0xc000
    828c:	ebffff74 	bl	8064 <PUT32>
    8290:	e3a03000 	mov	r3, #0
    8294:	e50b3008 	str	r3, [fp, #-8]
    8298:	ea000004 	b	82b0 <uart_init+0x118>
    829c:	e51b0008 	ldr	r0, [fp, #-8]
    82a0:	ebffff7a 	bl	8090 <dummy>
    82a4:	e51b3008 	ldr	r3, [fp, #-8]
    82a8:	e2833001 	add	r3, r3, #1
    82ac:	e50b3008 	str	r3, [fp, #-8]
    82b0:	e51b3008 	ldr	r3, [fp, #-8]
    82b4:	e3530095 	cmp	r3, #149	; 0x95
    82b8:	9afffff7 	bls	829c <uart_init+0x104>
    82bc:	e59f0044 	ldr	r0, [pc, #68]	; 8308 <uart_init+0x170>
    82c0:	e3a01000 	mov	r1, #0
    82c4:	ebffff66 	bl	8064 <PUT32>
    82c8:	e59f0018 	ldr	r0, [pc, #24]	; 82e8 <uart_init+0x150>
    82cc:	e3a01003 	mov	r1, #3
    82d0:	ebffff63 	bl	8064 <PUT32>
    82d4:	e24bd004 	sub	sp, fp, #4
    82d8:	e8bd4800 	pop	{fp, lr}
    82dc:	e12fff1e 	bx	lr
    82e0:	20215004 	eorcs	r5, r1, r4
    82e4:	20215044 	eorcs	r5, r1, r4, asr #32
    82e8:	20215060 	eorcs	r5, r1, r0, rrx
    82ec:	2021504c 	eorcs	r5, r1, ip, asr #32
    82f0:	20215050 	eorcs	r5, r1, r0, asr r0
    82f4:	20215048 	eorcs	r5, r1, r8, asr #32
    82f8:	20215068 	eorcs	r5, r1, r8, rrx
    82fc:	0000010e 	andeq	r0, r0, lr, lsl #2
    8300:	20200004 	eorcs	r0, r0, r4
    8304:	20200094 	mlacs	r0, r4, r0, r0
    8308:	20200098 	mlacs	r0, r8, r0, r0

0000830c <copy_vectors>:
    830c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8310:	e28db000 	add	fp, sp, #0
    8314:	e24dd00c 	sub	sp, sp, #12
    8318:	e59f3048 	ldr	r3, [pc, #72]	; 8368 <copy_vectors+0x5c>
    831c:	e50b3008 	str	r3, [fp, #-8]
    8320:	e3a03000 	mov	r3, #0
    8324:	e50b300c 	str	r3, [fp, #-12]
    8328:	ea000007 	b	834c <copy_vectors+0x40>
    832c:	e51b300c 	ldr	r3, [fp, #-12]
    8330:	e2832004 	add	r2, r3, #4
    8334:	e50b200c 	str	r2, [fp, #-12]
    8338:	e51b2008 	ldr	r2, [fp, #-8]
    833c:	e2821004 	add	r1, r2, #4
    8340:	e50b1008 	str	r1, [fp, #-8]
    8344:	e5922000 	ldr	r2, [r2]
    8348:	e5832000 	str	r2, [r3]
    834c:	e51b2008 	ldr	r2, [fp, #-8]
    8350:	e59f3014 	ldr	r3, [pc, #20]	; 836c <copy_vectors+0x60>
    8354:	e1520003 	cmp	r2, r3
    8358:	3afffff3 	bcc	832c <copy_vectors+0x20>
    835c:	e24bd000 	sub	sp, fp, #0
    8360:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8364:	e12fff1e 	bx	lr
    8368:	00008000 	andeq	r8, r0, r0
    836c:	0000803c 	andeq	r8, r0, ip, lsr r0

00008370 <uprint>:
    8370:	e92d4800 	push	{fp, lr}
    8374:	e28db004 	add	fp, sp, #4
    8378:	e24dd010 	sub	sp, sp, #16
    837c:	e50b0010 	str	r0, [fp, #-16]
    8380:	e3a03000 	mov	r3, #0
    8384:	e50b3008 	str	r3, [fp, #-8]
    8388:	ea000008 	b	83b0 <uprint+0x40>
    838c:	e51b3008 	ldr	r3, [fp, #-8]
    8390:	e51b2010 	ldr	r2, [fp, #-16]
    8394:	e0823003 	add	r3, r2, r3
    8398:	e5d33000 	ldrb	r3, [r3]
    839c:	e1a00003 	mov	r0, r3
    83a0:	ebffff5a 	bl	8110 <uart_send>
    83a4:	e51b3008 	ldr	r3, [fp, #-8]
    83a8:	e2833001 	add	r3, r3, #1
    83ac:	e50b3008 	str	r3, [fp, #-8]
    83b0:	e51b3008 	ldr	r3, [fp, #-8]
    83b4:	e51b2010 	ldr	r2, [fp, #-16]
    83b8:	e0823003 	add	r3, r2, r3
    83bc:	e5d33000 	ldrb	r3, [r3]
    83c0:	e3530000 	cmp	r3, #0
    83c4:	1afffff0 	bne	838c <uprint+0x1c>
    83c8:	e3a0000d 	mov	r0, #13
    83cc:	ebffff4f 	bl	8110 <uart_send>
    83d0:	e3a0000a 	mov	r0, #10
    83d4:	ebffff4d 	bl	8110 <uart_send>
    83d8:	e24bd004 	sub	sp, fp, #4
    83dc:	e8bd4800 	pop	{fp, lr}
    83e0:	e12fff1e 	bx	lr

000083e4 <printint>:
    83e4:	e92d4810 	push	{r4, fp, lr}
    83e8:	e28db008 	add	fp, sp, #8
    83ec:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    83f0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    83f4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    83f8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    83fc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8400:	e3530000 	cmp	r3, #0
    8404:	0a00000a 	beq	8434 <printint+0x50>
    8408:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    840c:	e1a03fa3 	lsr	r3, r3, #31
    8410:	e20330ff 	and	r3, r3, #255	; 0xff
    8414:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8418:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    841c:	e3530000 	cmp	r3, #0
    8420:	0a000003 	beq	8434 <printint+0x50>
    8424:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8428:	e2633000 	rsb	r3, r3, #0
    842c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8430:	ea000001 	b	843c <printint+0x58>
    8434:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8438:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    843c:	e3a03000 	mov	r3, #0
    8440:	e50b3010 	str	r3, [fp, #-16]
    8444:	e51b4010 	ldr	r4, [fp, #-16]
    8448:	e2843001 	add	r3, r4, #1
    844c:	e50b3010 	str	r3, [fp, #-16]
    8450:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8454:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8458:	e1a00002 	mov	r0, r2
    845c:	e1a01003 	mov	r1, r3
    8460:	eb000107 	bl	8884 <__aeabi_uidivmod>
    8464:	e1a03001 	mov	r3, r1
    8468:	e59f20b4 	ldr	r2, [pc, #180]	; 8524 <printint+0x140>
    846c:	e7d22003 	ldrb	r2, [r2, r3]
    8470:	e3e03017 	mvn	r3, #23
    8474:	e24b000c 	sub	r0, fp, #12
    8478:	e0801004 	add	r1, r0, r4
    847c:	e0813003 	add	r3, r1, r3
    8480:	e5c32000 	strb	r2, [r3]
    8484:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8488:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    848c:	e1a01003 	mov	r1, r3
    8490:	eb0000be 	bl	8790 <__aeabi_uidiv>
    8494:	e1a03000 	mov	r3, r0
    8498:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    849c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    84a0:	e3530000 	cmp	r3, #0
    84a4:	1affffe6 	bne	8444 <printint+0x60>
    84a8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    84ac:	e3530000 	cmp	r3, #0
    84b0:	0a000009 	beq	84dc <printint+0xf8>
    84b4:	e51b3010 	ldr	r3, [fp, #-16]
    84b8:	e2832001 	add	r2, r3, #1
    84bc:	e50b2010 	str	r2, [fp, #-16]
    84c0:	e3e02017 	mvn	r2, #23
    84c4:	e24b100c 	sub	r1, fp, #12
    84c8:	e0813003 	add	r3, r1, r3
    84cc:	e0833002 	add	r3, r3, r2
    84d0:	e3a0202d 	mov	r2, #45	; 0x2d
    84d4:	e5c32000 	strb	r2, [r3]
    84d8:	ea000008 	b	8500 <printint+0x11c>
    84dc:	ea000007 	b	8500 <printint+0x11c>
    84e0:	e3e03017 	mvn	r3, #23
    84e4:	e51b2010 	ldr	r2, [fp, #-16]
    84e8:	e24b000c 	sub	r0, fp, #12
    84ec:	e0802002 	add	r2, r0, r2
    84f0:	e0823003 	add	r3, r2, r3
    84f4:	e5d33000 	ldrb	r3, [r3]
    84f8:	e1a00003 	mov	r0, r3
    84fc:	ebffff03 	bl	8110 <uart_send>
    8500:	e51b3010 	ldr	r3, [fp, #-16]
    8504:	e2433001 	sub	r3, r3, #1
    8508:	e50b3010 	str	r3, [fp, #-16]
    850c:	e51b3010 	ldr	r3, [fp, #-16]
    8510:	e3530000 	cmp	r3, #0
    8514:	aafffff1 	bge	84e0 <printint+0xfc>
    8518:	e24bd008 	sub	sp, fp, #8
    851c:	e8bd4810 	pop	{r4, fp, lr}
    8520:	e12fff1e 	bx	lr
    8524:	00008924 	andeq	r8, r0, r4, lsr #18

00008528 <cprintf>:
    8528:	e92d000f 	push	{r0, r1, r2, r3}
    852c:	e92d4800 	push	{fp, lr}
    8530:	e28db004 	add	fp, sp, #4
    8534:	e24dd010 	sub	sp, sp, #16
    8538:	e28b3008 	add	r3, fp, #8
    853c:	e50b300c 	str	r3, [fp, #-12]
    8540:	e3a03000 	mov	r3, #0
    8544:	e50b3008 	str	r3, [fp, #-8]
    8548:	ea00005c 	b	86c0 <cprintf+0x198>
    854c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8550:	e3530025 	cmp	r3, #37	; 0x25
    8554:	0a000008 	beq	857c <cprintf+0x54>
    8558:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    855c:	e353000a 	cmp	r3, #10
    8560:	1a000001 	bne	856c <cprintf+0x44>
    8564:	e3a0000d 	mov	r0, #13
    8568:	ebfffee8 	bl	8110 <uart_send>
    856c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8570:	e1a00003 	mov	r0, r3
    8574:	ebfffee5 	bl	8110 <uart_send>
    8578:	ea00004d 	b	86b4 <cprintf+0x18c>
    857c:	e59b2004 	ldr	r2, [fp, #4]
    8580:	e51b3008 	ldr	r3, [fp, #-8]
    8584:	e2833001 	add	r3, r3, #1
    8588:	e50b3008 	str	r3, [fp, #-8]
    858c:	e51b3008 	ldr	r3, [fp, #-8]
    8590:	e0823003 	add	r3, r2, r3
    8594:	e5d33000 	ldrb	r3, [r3]
    8598:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    859c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    85a0:	e3530000 	cmp	r3, #0
    85a4:	1a000000 	bne	85ac <cprintf+0x84>
    85a8:	ea00004c 	b	86e0 <cprintf+0x1b8>
    85ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    85b0:	e3530070 	cmp	r3, #112	; 0x70
    85b4:	0a000014 	beq	860c <cprintf+0xe4>
    85b8:	e3530070 	cmp	r3, #112	; 0x70
    85bc:	ca000004 	bgt	85d4 <cprintf+0xac>
    85c0:	e3530025 	cmp	r3, #37	; 0x25
    85c4:	0a000031 	beq	8690 <cprintf+0x168>
    85c8:	e3530064 	cmp	r3, #100	; 0x64
    85cc:	0a000005 	beq	85e8 <cprintf+0xc0>
    85d0:	ea000031 	b	869c <cprintf+0x174>
    85d4:	e3530073 	cmp	r3, #115	; 0x73
    85d8:	0a000014 	beq	8630 <cprintf+0x108>
    85dc:	e3530078 	cmp	r3, #120	; 0x78
    85e0:	0a000009 	beq	860c <cprintf+0xe4>
    85e4:	ea00002c 	b	869c <cprintf+0x174>
    85e8:	e51b300c 	ldr	r3, [fp, #-12]
    85ec:	e2832004 	add	r2, r3, #4
    85f0:	e50b200c 	str	r2, [fp, #-12]
    85f4:	e5933000 	ldr	r3, [r3]
    85f8:	e1a00003 	mov	r0, r3
    85fc:	e3a0100a 	mov	r1, #10
    8600:	e3a02001 	mov	r2, #1
    8604:	ebffff76 	bl	83e4 <printint>
    8608:	ea000029 	b	86b4 <cprintf+0x18c>
    860c:	e51b300c 	ldr	r3, [fp, #-12]
    8610:	e2832004 	add	r2, r3, #4
    8614:	e50b200c 	str	r2, [fp, #-12]
    8618:	e5933000 	ldr	r3, [r3]
    861c:	e1a00003 	mov	r0, r3
    8620:	e3a01010 	mov	r1, #16
    8624:	e3a02000 	mov	r2, #0
    8628:	ebffff6d 	bl	83e4 <printint>
    862c:	ea000020 	b	86b4 <cprintf+0x18c>
    8630:	e51b300c 	ldr	r3, [fp, #-12]
    8634:	e2832004 	add	r2, r3, #4
    8638:	e50b200c 	str	r2, [fp, #-12]
    863c:	e5933000 	ldr	r3, [r3]
    8640:	e50b3010 	str	r3, [fp, #-16]
    8644:	e51b3010 	ldr	r3, [fp, #-16]
    8648:	e3530000 	cmp	r3, #0
    864c:	1a000002 	bne	865c <cprintf+0x134>
    8650:	e59f3098 	ldr	r3, [pc, #152]	; 86f0 <cprintf+0x1c8>
    8654:	e50b3010 	str	r3, [fp, #-16]
    8658:	ea000007 	b	867c <cprintf+0x154>
    865c:	ea000006 	b	867c <cprintf+0x154>
    8660:	e51b3010 	ldr	r3, [fp, #-16]
    8664:	e5d33000 	ldrb	r3, [r3]
    8668:	e1a00003 	mov	r0, r3
    866c:	ebfffea7 	bl	8110 <uart_send>
    8670:	e51b3010 	ldr	r3, [fp, #-16]
    8674:	e2833001 	add	r3, r3, #1
    8678:	e50b3010 	str	r3, [fp, #-16]
    867c:	e51b3010 	ldr	r3, [fp, #-16]
    8680:	e5d33000 	ldrb	r3, [r3]
    8684:	e3530000 	cmp	r3, #0
    8688:	1afffff4 	bne	8660 <cprintf+0x138>
    868c:	ea000008 	b	86b4 <cprintf+0x18c>
    8690:	e3a00025 	mov	r0, #37	; 0x25
    8694:	ebfffe9d 	bl	8110 <uart_send>
    8698:	ea000005 	b	86b4 <cprintf+0x18c>
    869c:	e3a00025 	mov	r0, #37	; 0x25
    86a0:	ebfffe9a 	bl	8110 <uart_send>
    86a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86a8:	e1a00003 	mov	r0, r3
    86ac:	ebfffe97 	bl	8110 <uart_send>
    86b0:	e1a00000 	nop			; (mov r0, r0)
    86b4:	e51b3008 	ldr	r3, [fp, #-8]
    86b8:	e2833001 	add	r3, r3, #1
    86bc:	e50b3008 	str	r3, [fp, #-8]
    86c0:	e59b2004 	ldr	r2, [fp, #4]
    86c4:	e51b3008 	ldr	r3, [fp, #-8]
    86c8:	e0823003 	add	r3, r2, r3
    86cc:	e5d33000 	ldrb	r3, [r3]
    86d0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    86d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86d8:	e3530000 	cmp	r3, #0
    86dc:	1affff9a 	bne	854c <cprintf+0x24>
    86e0:	e24bd004 	sub	sp, fp, #4
    86e4:	e8bd4800 	pop	{fp, lr}
    86e8:	e28dd010 	add	sp, sp, #16
    86ec:	e12fff1e 	bx	lr
    86f0:	000088a8 	andeq	r8, r0, r8, lsr #17

000086f4 <swi_code>:
    86f4:	e92d4800 	push	{fp, lr}
    86f8:	e28db004 	add	fp, sp, #4
    86fc:	e24dd008 	sub	sp, sp, #8
    8700:	e50b0008 	str	r0, [fp, #-8]
    8704:	e59f0010 	ldr	r0, [pc, #16]	; 871c <swi_code+0x28>
    8708:	e51b1008 	ldr	r1, [fp, #-8]
    870c:	ebffff85 	bl	8528 <cprintf>
    8710:	e24bd004 	sub	sp, fp, #4
    8714:	e8bd4800 	pop	{fp, lr}
    8718:	e12fff1e 	bx	lr
    871c:	000088b0 			; <UNDEFINED> instruction: 0x000088b0

00008720 <bootmain>:
    8720:	e92d4800 	push	{fp, lr}
    8724:	e28db004 	add	fp, sp, #4
    8728:	ebfffe9a 	bl	8198 <uart_init>
    872c:	e59f0040 	ldr	r0, [pc, #64]	; 8774 <bootmain+0x54>
    8730:	e3a0100a 	mov	r1, #10
    8734:	e3a02001 	mov	r2, #1
    8738:	ebffff29 	bl	83e4 <printint>
    873c:	e59f0034 	ldr	r0, [pc, #52]	; 8778 <bootmain+0x58>
    8740:	e59f1034 	ldr	r1, [pc, #52]	; 877c <bootmain+0x5c>
    8744:	e59f2034 	ldr	r2, [pc, #52]	; 8780 <bootmain+0x60>
    8748:	ebffff76 	bl	8528 <cprintf>
    874c:	e59f0030 	ldr	r0, [pc, #48]	; 8784 <bootmain+0x64>
    8750:	ebffff06 	bl	8370 <uprint>
    8754:	e3a00024 	mov	r0, #36	; 0x24
    8758:	ebfffe6c 	bl	8110 <uart_send>
    875c:	e59f0024 	ldr	r0, [pc, #36]	; 8788 <bootmain+0x68>
    8760:	ebffff70 	bl	8528 <cprintf>
    8764:	ef000008 	svc	0x00000008
    8768:	e59f001c 	ldr	r0, [pc, #28]	; 878c <bootmain+0x6c>
    876c:	ebffff6d 	bl	8528 <cprintf>
    8770:	eafffffe 	b	8770 <bootmain+0x50>
    8774:	000004d2 	ldrdeq	r0, [r0], -r2
    8778:	000088c8 	andeq	r8, r0, r8, asr #17
    877c:	000004c6 	andeq	r0, r0, r6, asr #9
    8780:	00000d05 	andeq	r0, r0, r5, lsl #26
    8784:	000088e0 	andeq	r8, r0, r0, ror #17
    8788:	000088fc 	strdeq	r8, [r0], -ip
    878c:	00008910 	andeq	r8, r0, r0, lsl r9

00008790 <__aeabi_uidiv>:
    8790:	e2512001 	subs	r2, r1, #1
    8794:	012fff1e 	bxeq	lr
    8798:	3a000036 	bcc	8878 <__aeabi_uidiv+0xe8>
    879c:	e1500001 	cmp	r0, r1
    87a0:	9a000022 	bls	8830 <__aeabi_uidiv+0xa0>
    87a4:	e1110002 	tst	r1, r2
    87a8:	0a000023 	beq	883c <__aeabi_uidiv+0xac>
    87ac:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    87b0:	01a01181 	lsleq	r1, r1, #3
    87b4:	03a03008 	moveq	r3, #8
    87b8:	13a03001 	movne	r3, #1
    87bc:	e3510201 	cmp	r1, #268435456	; 0x10000000
    87c0:	31510000 	cmpcc	r1, r0
    87c4:	31a01201 	lslcc	r1, r1, #4
    87c8:	31a03203 	lslcc	r3, r3, #4
    87cc:	3afffffa 	bcc	87bc <__aeabi_uidiv+0x2c>
    87d0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    87d4:	31510000 	cmpcc	r1, r0
    87d8:	31a01081 	lslcc	r1, r1, #1
    87dc:	31a03083 	lslcc	r3, r3, #1
    87e0:	3afffffa 	bcc	87d0 <__aeabi_uidiv+0x40>
    87e4:	e3a02000 	mov	r2, #0
    87e8:	e1500001 	cmp	r0, r1
    87ec:	20400001 	subcs	r0, r0, r1
    87f0:	21822003 	orrcs	r2, r2, r3
    87f4:	e15000a1 	cmp	r0, r1, lsr #1
    87f8:	204000a1 	subcs	r0, r0, r1, lsr #1
    87fc:	218220a3 	orrcs	r2, r2, r3, lsr #1
    8800:	e1500121 	cmp	r0, r1, lsr #2
    8804:	20400121 	subcs	r0, r0, r1, lsr #2
    8808:	21822123 	orrcs	r2, r2, r3, lsr #2
    880c:	e15001a1 	cmp	r0, r1, lsr #3
    8810:	204001a1 	subcs	r0, r0, r1, lsr #3
    8814:	218221a3 	orrcs	r2, r2, r3, lsr #3
    8818:	e3500000 	cmp	r0, #0
    881c:	11b03223 	lsrsne	r3, r3, #4
    8820:	11a01221 	lsrne	r1, r1, #4
    8824:	1affffef 	bne	87e8 <__aeabi_uidiv+0x58>
    8828:	e1a00002 	mov	r0, r2
    882c:	e12fff1e 	bx	lr
    8830:	03a00001 	moveq	r0, #1
    8834:	13a00000 	movne	r0, #0
    8838:	e12fff1e 	bx	lr
    883c:	e3510801 	cmp	r1, #65536	; 0x10000
    8840:	21a01821 	lsrcs	r1, r1, #16
    8844:	23a02010 	movcs	r2, #16
    8848:	33a02000 	movcc	r2, #0
    884c:	e3510c01 	cmp	r1, #256	; 0x100
    8850:	21a01421 	lsrcs	r1, r1, #8
    8854:	22822008 	addcs	r2, r2, #8
    8858:	e3510010 	cmp	r1, #16
    885c:	21a01221 	lsrcs	r1, r1, #4
    8860:	22822004 	addcs	r2, r2, #4
    8864:	e3510004 	cmp	r1, #4
    8868:	82822003 	addhi	r2, r2, #3
    886c:	908220a1 	addls	r2, r2, r1, lsr #1
    8870:	e1a00230 	lsr	r0, r0, r2
    8874:	e12fff1e 	bx	lr
    8878:	e3500000 	cmp	r0, #0
    887c:	13e00000 	mvnne	r0, #0
    8880:	ea000007 	b	88a4 <__aeabi_idiv0>

00008884 <__aeabi_uidivmod>:
    8884:	e3510000 	cmp	r1, #0
    8888:	0afffffa 	beq	8878 <__aeabi_uidiv+0xe8>
    888c:	e92d4003 	push	{r0, r1, lr}
    8890:	ebffffbe 	bl	8790 <__aeabi_uidiv>
    8894:	e8bd4006 	pop	{r1, r2, lr}
    8898:	e0030092 	mul	r3, r2, r0
    889c:	e0411003 	sub	r1, r1, r3
    88a0:	e12fff1e 	bx	lr

000088a4 <__aeabi_idiv0>:
    88a4:	e12fff1e 	bx	lr

Disassembly of section .rodata:

000088a8 <.rodata>:
    88a8:	6c756e28 	ldclvs	14, cr6, [r5], #-160	; 0xffffff60
    88ac:	0000296c 	andeq	r2, r0, ip, ror #18
    88b0:	53206e49 	teqpl	r0, #1168	; 0x490
    88b4:	53204957 	teqpl	r0, #1425408	; 0x15c000
    88b8:	41435359 	cmpmi	r3, r9, asr r3
    88bc:	3a204c4c 	bcc	81b9f4 <STACK_ADR+0x79b9f4>
    88c0:	0a782520 	beq	1e11d48 <STACK_ADR+0x1d91d48>
    88c4:	00000000 	andeq	r0, r0, r0
    88c8:	6548200a 	strbvs	r2, [r8, #-10]
    88cc:	206f6c6c 	rsbcs	r6, pc, ip, ror #24
    88d0:	6c726f57 	ldclvs	15, cr6, [r2], #-348	; 0xfffffea4
    88d4:	64252064 	strtvs	r2, [r5], #-100	; 0xffffff9c
    88d8:	0a642520 	beq	1911d60 <STACK_ADR+0x1891d60>
    88dc:	00000000 	andeq	r0, r0, r0
    88e0:	73696854 	cmnvc	r9, #84, 16	; 0x540000
    88e4:	20736920 	rsbscs	r6, r3, r0, lsr #18
    88e8:	20656874 	rsbcs	r6, r5, r4, ror r8
    88ec:	6f686365 	svcvs	0x00686365
    88f0:	72657320 	rsbvc	r7, r5, #32, 6	; 0x80000000
    88f4:	65636976 	strbvs	r6, [r3, #-2422]!	; 0xfffff68a
    88f8:	0000003a 	andeq	r0, r0, sl, lsr r0
    88fc:	6f666542 	svcvs	0x00666542
    8900:	53206572 	teqpl	r0, #478150656	; 0x1c800000
    8904:	43204957 	teqmi	r0, #1425408	; 0x15c000
    8908:	2165646f 	cmncs	r5, pc, ror #8
    890c:	0000000a 	andeq	r0, r0, sl
    8910:	65746641 	ldrbvs	r6, [r4, #-1601]!	; 0xfffff9bf
    8914:	57532072 			; <UNDEFINED> instruction: 0x57532072
    8918:	6f432049 	svcvs	0x00432049
    891c:	0a216564 	beq	861eb4 <STACK_ADR+0x7e1eb4>
    8920:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00008924 <digits.3689>:
    8924:	33323130 	teqcc	r2, #48, 2
    8928:	37363534 			; <UNDEFINED> instruction: 0x37363534
    892c:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    8930:	66656463 	strbtvs	r6, [r5], -r3, ror #8
    8934:	00000000 	andeq	r0, r0, r0

Disassembly of section .bss:

00008938 <__bss_start>:
	...

Disassembly of section .ARM.attributes:

00000000 <STACK_ADR-0x80000>:
   0:	00002a41 	andeq	r2, r0, r1, asr #20
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000020 	andeq	r0, r0, r0, lsr #32
  10:	4d524105 	ldfmie	f4, [r2, #-20]	; 0xffffffec
  14:	54347620 	ldrtpl	r7, [r4], #-1568	; 0xfffff9e0
  18:	08020600 	stmdaeq	r2, {r9, sl}
  1c:	12010901 	andne	r0, r1, #16384	; 0x4000
  20:	15011404 	strne	r1, [r1, #-1028]	; 0xfffffbfc
  24:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  28:	Address 0x00000028 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <STACK_ADR+0x1050d24>
   4:	6f532820 	svcvs	0x00532820
   8:	65637275 	strbvs	r7, [r3, #-629]!	; 0xfffffd8b
   c:	43207972 	teqmi	r0, #1867776	; 0x1c8000
  10:	4265646f 	rsbmi	r6, r5, #1862270976	; 0x6f000000
  14:	68636e65 	stmdavs	r3!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
  18:	74694c20 	strbtvc	r4, [r9], #-3104	; 0xfffff3e0
  1c:	30322065 	eorscc	r2, r2, r5, rrx
  20:	312e3331 	teqcc	lr, r1, lsr r3
  24:	34322d31 	ldrtcc	r2, [r2], #-3377	; 0xfffff2cf
  28:	2e342029 	cdpcs	0, 3, cr2, cr4, cr9, {1}
  2c:	00312e38 	eorseq	r2, r1, r8, lsr lr

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c010001 	stcvc	0, cr0, [r1], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008790 	muleq	r0, r0, r7
  1c:	000000f4 	strdeq	r0, [r0], -r4

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000000dd 	ldrdeq	r0, [r0], -sp
   4:	009e0002 	addseq	r0, lr, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	2f010000 	svccs	0x00010000
  1c:	2f74706f 	svccs	0x0074706f
  20:	61636f6c 	cmnvs	r3, ip, ror #30
  24:	61762f6c 	cmnvs	r6, ip, ror #30
  28:	616d2f72 	smcvs	54002	; 0xd2f2
  2c:	726f7063 	rsbvc	r7, pc, #99	; 0x63
  30:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
  34:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
  38:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
  3c:	706d5f74 	rsbvc	r5, sp, r4, ror pc
  40:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  44:	6f70645f 	svcvs	0x0070645f
  48:	5f737472 	svcpl	0x00737472
  4c:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
  50:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
  54:	6f6e2d6d 	svcvs	0x006e2d6d
  58:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
  5c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
  60:	2f636367 	svccs	0x00636367
  64:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
  68:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
  6c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
  70:	63672d69 	cmnvs	r7, #6720	; 0x1a40
  74:	6f772f63 	svcvs	0x00772f63
  78:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
  7c:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
  80:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
  84:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
  88:	2f636367 	svccs	0x00636367
  8c:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
  90:	612f6769 	teqvs	pc, r9, ror #14
  94:	00006d72 	andeq	r6, r0, r2, ror sp
  98:	3162696c 	cmncc	r2, ip, ror #18
  9c:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  a0:	00532e73 	subseq	r2, r3, r3, ror lr
  a4:	00000001 	andeq	r0, r0, r1
  a8:	90020500 	andls	r0, r2, r0, lsl #10
  ac:	03000087 	movweq	r0, #135	; 0x87
  b0:	300107cc 	andcc	r0, r1, ip, asr #15
  b4:	2f2f2f2f 	svccs	0x002f2f2f
  b8:	7cfe032f 	ldclvc	3, cr0, [lr], #188	; 0xbc
  bc:	0386032e 	orreq	r0, r6, #-1207959552	; 0xb8000000
  c0:	2f013e02 	svccs	0x00013e02
  c4:	032f2f31 	teqeq	pc, #49, 30	; 0xc4
  c8:	032e7db7 	teqeq	lr, #11712	; 0x2dc0
  cc:	900802cd 	andls	r0, r8, sp, asr #5
  d0:	1603322f 	strne	r3, [r3], -pc, lsr #4
  d4:	2f2f2f66 	svccs	0x002f2f66
  d8:	2f2f2f2f 	svccs	0x002f2f2f
  dc:	01000202 	tsteq	r0, r2, lsl #4
  e0:	0000b401 	andeq	fp, r0, r1, lsl #8
  e4:	9e000200 	cdpls	2, 0, cr0, cr0, cr0, {0}
  e8:	02000000 	andeq	r0, r0, #0
  ec:	0d0efb01 	vstreq	d15, [lr, #-4]
  f0:	01010100 	mrseq	r0, (UNDEF: 17)
  f4:	00000001 	andeq	r0, r0, r1
  f8:	01000001 	tsteq	r0, r1
  fc:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
 100:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
 104:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
 108:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff8c <STACK_ADR+0xfff7ff8c>
 10c:	6f706361 	svcvs	0x00706361
 110:	2f737472 	svccs	0x00737472
 114:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 118:	6f5f2f64 	svcvs	0x005f2f64
 11c:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff64 <STACK_ADR+0xfff7ff64>
 120:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
 124:	70645f73 	rsbvc	r5, r4, r3, ror pc
 128:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 12c:	6f72635f 	svcvs	0x0072635f
 130:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
 134:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 138:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 13c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 140:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
 144:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 148:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 14c:	61652d65 	cmnvs	r5, r5, ror #26
 150:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
 154:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
 158:	2f6b726f 	svccs	0x006b726f
 15c:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 160:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
 164:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
 168:	63636762 	cmnvs	r3, #25690112	; 0x1880000
 16c:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
 170:	2f676966 	svccs	0x00676966
 174:	006d7261 	rsbeq	r7, sp, r1, ror #4
 178:	62696c00 	rsbvs	r6, r9, #0, 24
 17c:	6e756631 	mrcvs	6, 3, r6, cr5, cr1, {1}
 180:	532e7363 	teqpl	lr, #-1946157055	; 0x8c000001
 184:	00000100 	andeq	r0, r0, r0, lsl #2
 188:	02050000 	andeq	r0, r5, #0
 18c:	000088a4 	andeq	r8, r0, r4, lsr #17
 190:	010a9303 	tsteq	sl, r3, lsl #6
 194:	01000202 	tsteq	r0, r2, lsl #4
 198:	Address 0x00000198 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000127 	andeq	r0, r0, r7, lsr #2
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000000 	andeq	r0, r0, r0
  10:	00008790 	muleq	r0, r0, r7
  14:	000088a4 	andeq	r8, r0, r4, lsr #17
  18:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  1c:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  20:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  24:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; fffffea8 <STACK_ADR+0xfff7fea8>
  28:	6f706361 	svcvs	0x00706361
  2c:	2f737472 	svccs	0x00737472
  30:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  34:	6f5f2f64 	svcvs	0x005f2f64
  38:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; fffffe80 <STACK_ADR+0xfff7fe80>
  3c:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  40:	70645f73 	rsbvc	r5, r4, r3, ror pc
  44:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  48:	6f72635f 	svcvs	0x0072635f
  4c:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  50:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  54:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  58:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  5c:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  60:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  64:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  68:	61652d65 	cmnvs	r5, r5, ror #26
  6c:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  70:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  74:	2f6b726f 	svccs	0x006b726f
  78:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
  7c:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
  80:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
  84:	63636762 	cmnvs	r3, #25690112	; 0x1880000
  88:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
  8c:	2f676966 	svccs	0x00676966
  90:	2f6d7261 	svccs	0x006d7261
  94:	3162696c 	cmncc	r2, ip, ror #18
  98:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  9c:	00532e73 	subseq	r2, r3, r3, ror lr
  a0:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  a4:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  a8:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  ac:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff30 <STACK_ADR+0xfff7ff30>
  b0:	6f706361 	svcvs	0x00706361
  b4:	2f737472 	svccs	0x00737472
  b8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  bc:	6f5f2f64 	svcvs	0x005f2f64
  c0:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff08 <STACK_ADR+0xfff7ff08>
  c4:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  c8:	70645f73 	rsbvc	r5, r4, r3, ror pc
  cc:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  d0:	6f72635f 	svcvs	0x0072635f
  d4:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  d8:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  dc:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  e0:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  e4:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  e8:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  ec:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  f0:	61652d65 	cmnvs	r5, r5, ror #26
  f4:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  f8:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  fc:	2f6b726f 	svccs	0x006b726f
 100:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 104:	72612f64 	rsbvc	r2, r1, #100, 30	; 0x190
 108:	6f6e2d6d 	svcvs	0x006e2d6d
 10c:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 110:	2f696261 	svccs	0x00696261
 114:	6762696c 	strbvs	r6, [r2, -ip, ror #18]!
 118:	47006363 	strmi	r6, [r0, -r3, ror #6]
 11c:	4120554e 	teqmi	r0, lr, asr #10
 120:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 124:	312e3332 	teqcc	lr, r2, lsr r3
 128:	27800100 	strcs	r0, [r0, r0, lsl #2]
 12c:	02000001 	andeq	r0, r0, #1
 130:	00001400 	andeq	r1, r0, r0, lsl #8
 134:	e1010400 	tst	r1, r0, lsl #8
 138:	a4000000 	strge	r0, [r0], #-0
 13c:	a8000088 	stmdage	r0, {r3, r7}
 140:	2f000088 	svccs	0x00000088
 144:	2f74706f 	svccs	0x0074706f
 148:	61636f6c 	cmnvs	r3, ip, ror #30
 14c:	61762f6c 	cmnvs	r6, ip, ror #30
 150:	616d2f72 	smcvs	54002	; 0xd2f2
 154:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 158:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 15c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 160:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 164:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 168:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 16c:	6f70645f 	svcvs	0x0070645f
 170:	5f737472 	svcpl	0x00737472
 174:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 178:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 17c:	6f6e2d6d 	svcvs	0x006e2d6d
 180:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 184:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 188:	2f636367 	svccs	0x00636367
 18c:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 190:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 194:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 198:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 19c:	6f772f63 	svcvs	0x00772f63
 1a0:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
 1a4:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
 1a8:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
 1ac:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 1b0:	2f636367 	svccs	0x00636367
 1b4:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 1b8:	612f6769 	teqvs	pc, r9, ror #14
 1bc:	6c2f6d72 	stcvs	13, cr6, [pc], #-456	; fffffffc <STACK_ADR+0xfff7fffc>
 1c0:	66316269 	ldrtvs	r6, [r1], -r9, ror #4
 1c4:	73636e75 	cmnvc	r3, #1872	; 0x750
 1c8:	2f00532e 	svccs	0x0000532e
 1cc:	2f74706f 	svccs	0x0074706f
 1d0:	61636f6c 	cmnvs	r3, ip, ror #30
 1d4:	61762f6c 	cmnvs	r6, ip, ror #30
 1d8:	616d2f72 	smcvs	54002	; 0xd2f2
 1dc:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 1e0:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 1e4:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 1e8:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 1ec:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 1f0:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 1f4:	6f70645f 	svcvs	0x0070645f
 1f8:	5f737472 	svcpl	0x00737472
 1fc:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 200:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 204:	6f6e2d6d 	svcvs	0x006e2d6d
 208:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 20c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 210:	2f636367 	svccs	0x00636367
 214:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 218:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 21c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 220:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 224:	6f772f63 	svcvs	0x00772f63
 228:	622f6b72 	eorvs	r6, pc, #116736	; 0x1c800
 22c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 230:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 234:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 238:	61652d65 	cmnvs	r5, r5, ror #26
 23c:	6c2f6962 	stcvs	9, cr6, [pc], #-392	; bc <vectors_start-0x7f44>
 240:	63676269 	cmnvs	r7, #-1879048186	; 0x90000006
 244:	4e470063 	cdpmi	0, 4, cr0, cr7, cr3, {3}
 248:	53412055 	movtpl	r2, #4181	; 0x1055
 24c:	322e3220 	eorcc	r3, lr, #32, 4
 250:	00312e33 	eorseq	r2, r1, r3, lsr lr
 254:	Address 0x00000254 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <STACK_ADR+0x180c14>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	10001101 	andne	r1, r0, r1, lsl #2
  18:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
  1c:	1b080301 	blne	200c28 <STACK_ADR+0x180c28>
  20:	13082508 	movwne	r2, #34056	; 0x8508
  24:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008790 	muleq	r0, r0, r7
  14:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	012b0002 	teqeq	fp, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000088a4 	andeq	r8, r0, r4, lsr #17
  34:	00000004 	andeq	r0, r0, r4
	...
