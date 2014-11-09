
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	ea00001d 	b	807c <_ns_end>
    8004:	e59ff014 	ldr	pc, [pc, #20]	; 8020 <UndefAddr>
    8008:	e59ff014 	ldr	pc, [pc, #20]	; 8024 <SWIAddr>
    800c:	e59ff014 	ldr	pc, [pc, #20]	; 8028 <PAbortAddr>
    8010:	e59ff014 	ldr	pc, [pc, #20]	; 802c <DAbortAddr>
    8014:	e59ff014 	ldr	pc, [pc, #20]	; 8030 <ReservedAddr>
    8018:	e59ff014 	ldr	pc, [pc, #20]	; 8034 <IRQAddr>
    801c:	e59ff014 	ldr	pc, [pc, #20]	; 8038 <FIQAddr>

00008020 <UndefAddr>:
    8020:	00008e40 	andeq	r8, r0, r0, asr #28

00008024 <SWIAddr>:
    8024:	00008e44 	andeq	r8, r0, r4, asr #28

00008028 <PAbortAddr>:
    8028:	00008e54 	andeq	r8, r0, r4, asr lr

0000802c <DAbortAddr>:
    802c:	00008e58 	andeq	r8, r0, r8, asr lr

00008030 <ReservedAddr>:
    8030:	00000000 	andeq	r0, r0, r0

00008034 <IRQAddr>:
    8034:	00008e5c 	andeq	r8, r0, ip, asr lr

00008038 <FIQAddr>:
    8038:	00008e60 	andeq	r8, r0, r0, ror #28

0000803c <_ns_start>:
    803c:	e59ff018 	ldr	pc, [pc, #24]	; 805c <ns_Reset>
    8040:	e59ff018 	ldr	pc, [pc, #24]	; 8060 <ns_UndefAddr>
    8044:	e59ff018 	ldr	pc, [pc, #24]	; 8064 <ns_SWIAddr>
    8048:	e59ff018 	ldr	pc, [pc, #24]	; 8068 <ns_PAbortAddr>
    804c:	e59ff018 	ldr	pc, [pc, #24]	; 806c <ns_DAbortAddr>
    8050:	e59ff018 	ldr	pc, [pc, #24]	; 8070 <ns_ReservedAddr>
    8054:	e59ff018 	ldr	pc, [pc, #24]	; 8074 <ns_IRQAddr>
    8058:	e59ff018 	ldr	pc, [pc, #24]	; 8078 <ns_FIQAddr>

0000805c <ns_Reset>:
    805c:	00008e64 	andeq	r8, r0, r4, ror #28

00008060 <ns_UndefAddr>:
    8060:	00008e74 	andeq	r8, r0, r4, ror lr

00008064 <ns_SWIAddr>:
    8064:	00008e84 	andeq	r8, r0, r4, lsl #29

00008068 <ns_PAbortAddr>:
    8068:	00008e94 	muleq	r0, r4, lr

0000806c <ns_DAbortAddr>:
    806c:	00008ea4 	andeq	r8, r0, r4, lsr #29

00008070 <ns_ReservedAddr>:
    8070:	00000000 	andeq	r0, r0, r0

00008074 <ns_IRQAddr>:
    8074:	00008eb4 			; <UNDEFINED> instruction: 0x00008eb4

00008078 <ns_FIQAddr>:
    8078:	00008ec4 	andeq	r8, r0, r4, asr #29

0000807c <_ns_end>:
    807c:	e59f00f4 	ldr	r0, [pc, #244]	; 8178 <Init_clock+0x40>
    8080:	f1020016 	cps	#22
    8084:	e59fd0ec 	ldr	sp, [pc, #236]	; 8178 <Init_clock+0x40>
    8088:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
    808c:	e240d000 	sub	sp, r0, #0
    8090:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8094:	e240d040 	sub	sp, r0, #64	; 0x40
    8098:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
    809c:	e240d080 	sub	sp, r0, #128	; 0x80
    80a0:	e321f0db 	msr	CPSR_c, #219	; 0xdb
    80a4:	e240d0c0 	sub	sp, r0, #192	; 0xc0
    80a8:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    80ac:	e240dc01 	sub	sp, r0, #256	; 0x100
    80b0:	eb000241 	bl	89bc <bootmain>

000080b4 <CPU_SVC32_MODE>:
    80b4:	e10f0000 	mrs	r0, CPSR
    80b8:	e3c0001f 	bic	r0, r0, #31
    80bc:	e38000d3 	orr	r0, r0, #211	; 0xd3
    80c0:	e129f000 	msr	CPSR_fc, r0
    80c4:	e12fff1e 	bx	lr

000080c8 <Disable_MMU_L1cache>:
    80c8:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
    80cc:	e3c00a02 	bic	r0, r0, #8192	; 0x2000
    80d0:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
    80d4:	e3c00004 	bic	r0, r0, #4
    80d8:	e3c00001 	bic	r0, r0, #1
    80dc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
    80e0:	e12fff1e 	bx	lr

000080e4 <Init_aips>:
    80e4:	e59f0090 	ldr	r0, [pc, #144]	; 817c <Init_clock+0x44>
    80e8:	e59f1090 	ldr	r1, [pc, #144]	; 8180 <Init_clock+0x48>
    80ec:	e5801000 	str	r1, [r0]
    80f0:	e5801004 	str	r1, [r0, #4]
    80f4:	e3a01000 	mov	r1, #0
    80f8:	e5801040 	str	r1, [r0, #64]	; 0x40
    80fc:	e5801044 	str	r1, [r0, #68]	; 0x44
    8100:	e5801048 	str	r1, [r0, #72]	; 0x48
    8104:	e580104c 	str	r1, [r0, #76]	; 0x4c
    8108:	e5801050 	str	r1, [r0, #80]	; 0x50
    810c:	e59f0070 	ldr	r0, [pc, #112]	; 8184 <Init_clock+0x4c>
    8110:	e59f1068 	ldr	r1, [pc, #104]	; 8180 <Init_clock+0x48>
    8114:	e5801000 	str	r1, [r0]
    8118:	e5801004 	str	r1, [r0, #4]
    811c:	e3a01000 	mov	r1, #0
    8120:	e5801040 	str	r1, [r0, #64]	; 0x40
    8124:	e5801044 	str	r1, [r0, #68]	; 0x44
    8128:	e5801048 	str	r1, [r0, #72]	; 0x48
    812c:	e580104c 	str	r1, [r0, #76]	; 0x4c
    8130:	e5801050 	str	r1, [r0, #80]	; 0x50
    8134:	e12fff1e 	bx	lr

00008138 <Init_clock>:
    8138:	e59f0048 	ldr	r0, [pc, #72]	; 8188 <Init_clock+0x50>
    813c:	e59f1048 	ldr	r1, [pc, #72]	; 818c <Init_clock+0x54>
    8140:	e5801068 	str	r1, [r0, #104]	; 0x68
    8144:	e59f1044 	ldr	r1, [pc, #68]	; 8190 <Init_clock+0x58>
    8148:	e580106c 	str	r1, [r0, #108]	; 0x6c
    814c:	e59f1040 	ldr	r1, [pc, #64]	; 8194 <Init_clock+0x5c>
    8150:	e5801070 	str	r1, [r0, #112]	; 0x70
    8154:	e59f103c 	ldr	r1, [pc, #60]	; 8198 <Init_clock+0x60>
    8158:	e5801074 	str	r1, [r0, #116]	; 0x74
    815c:	e59f1038 	ldr	r1, [pc, #56]	; 819c <Init_clock+0x64>
    8160:	e5801078 	str	r1, [r0, #120]	; 0x78
    8164:	e59f1034 	ldr	r1, [pc, #52]	; 81a0 <Init_clock+0x68>
    8168:	e580107c 	str	r1, [r0, #124]	; 0x7c
    816c:	e3a01fff 	mov	r1, #1020	; 0x3fc
    8170:	e5801080 	str	r1, [r0, #128]	; 0x80
    8174:	e12fff1e 	bx	lr
    8178:	00080000 	andeq	r0, r8, r0
    817c:	0207c000 	andeq	ip, r7, #0
    8180:	77777777 			; <UNDEFINED> instruction: 0x77777777
    8184:	0217c000 	andseq	ip, r7, #0
    8188:	020c4000 	andeq	r4, ip, #0
    818c:	00c0003f 	sbceq	r0, r0, pc, lsr r0
    8190:	0030fc00 	eorseq	pc, r0, r0, lsl #24
    8194:	0fffc000 	svceq	0x00ffc000
    8198:	3ff00000 	svccc	0x00f00000	; IMB
    819c:	00fff300 	rscseq	pc, pc, r0, lsl #6
    81a0:	0f0000c3 	svceq	0x000000c3

000081a4 <uart_lcr>:
    81a4:	e92d4800 	push	{fp, lr}
    81a8:	e28db004 	add	fp, sp, #4
    81ac:	e59f000c 	ldr	r0, [pc, #12]	; 81c0 <uart_lcr+0x1c>
    81b0:	eb0002db 	bl	8d24 <GET32>
    81b4:	e1a03000 	mov	r3, r0
    81b8:	e1a00003 	mov	r0, r3
    81bc:	e8bd8800 	pop	{fp, pc}
    81c0:	20215054 	eorcs	r5, r1, r4, asr r0

000081c4 <uart_recv>:
    81c4:	e92d4800 	push	{fp, lr}
    81c8:	e28db004 	add	fp, sp, #4
    81cc:	e59f0030 	ldr	r0, [pc, #48]	; 8204 <uart_recv+0x40>
    81d0:	eb0002d3 	bl	8d24 <GET32>
    81d4:	e1a03000 	mov	r3, r0
    81d8:	e2033001 	and	r3, r3, #1
    81dc:	e3530000 	cmp	r3, #0
    81e0:	0a000000 	beq	81e8 <uart_recv+0x24>
    81e4:	ea000000 	b	81ec <uart_recv+0x28>
    81e8:	eafffff7 	b	81cc <uart_recv+0x8>
    81ec:	e59f0014 	ldr	r0, [pc, #20]	; 8208 <uart_recv+0x44>
    81f0:	eb0002cb 	bl	8d24 <GET32>
    81f4:	e1a03000 	mov	r3, r0
    81f8:	e6ef3073 	uxtb	r3, r3
    81fc:	e1a00003 	mov	r0, r3
    8200:	e8bd8800 	pop	{fp, pc}
    8204:	20215054 	eorcs	r5, r1, r4, asr r0
    8208:	20215040 	eorcs	r5, r1, r0, asr #32

0000820c <uart_send>:
    820c:	e92d4800 	push	{fp, lr}
    8210:	e28db004 	add	fp, sp, #4
    8214:	e24dd008 	sub	sp, sp, #8
    8218:	e50b0008 	str	r0, [fp, #-8]
    821c:	e59f002c 	ldr	r0, [pc, #44]	; 8250 <uart_send+0x44>
    8220:	eb0002bf 	bl	8d24 <GET32>
    8224:	e1a03000 	mov	r3, r0
    8228:	e2033020 	and	r3, r3, #32
    822c:	e3530000 	cmp	r3, #0
    8230:	0a000000 	beq	8238 <uart_send+0x2c>
    8234:	ea000000 	b	823c <uart_send+0x30>
    8238:	eafffff7 	b	821c <uart_send+0x10>
    823c:	e59f0010 	ldr	r0, [pc, #16]	; 8254 <uart_send+0x48>
    8240:	e51b1008 	ldr	r1, [fp, #-8]
    8244:	eb0002b0 	bl	8d0c <PUT32>
    8248:	e24bd004 	sub	sp, fp, #4
    824c:	e8bd8800 	pop	{fp, pc}
    8250:	20215054 	eorcs	r5, r1, r4, asr r0
    8254:	20215040 	eorcs	r5, r1, r0, asr #32

00008258 <uart_flush>:
    8258:	e92d4800 	push	{fp, lr}
    825c:	e28db004 	add	fp, sp, #4
    8260:	e59f001c 	ldr	r0, [pc, #28]	; 8284 <uart_flush+0x2c>
    8264:	eb0002ae 	bl	8d24 <GET32>
    8268:	e1a03000 	mov	r3, r0
    826c:	e2033c01 	and	r3, r3, #256	; 0x100
    8270:	e3530000 	cmp	r3, #0
    8274:	1a000000 	bne	827c <uart_flush+0x24>
    8278:	ea000000 	b	8280 <uart_flush+0x28>
    827c:	eafffff7 	b	8260 <uart_flush+0x8>
    8280:	e8bd8800 	pop	{fp, pc}
    8284:	20215054 	eorcs	r5, r1, r4, asr r0

00008288 <hexstring>:
    8288:	e92d4800 	push	{fp, lr}
    828c:	e28db004 	add	fp, sp, #4
    8290:	e24dd008 	sub	sp, sp, #8
    8294:	e50b0008 	str	r0, [fp, #-8]
    8298:	e51b0008 	ldr	r0, [fp, #-8]
    829c:	eb000005 	bl	82b8 <hexstrings>
    82a0:	e3a0000d 	mov	r0, #13
    82a4:	ebffffd8 	bl	820c <uart_send>
    82a8:	e3a0000a 	mov	r0, #10
    82ac:	ebffffd6 	bl	820c <uart_send>
    82b0:	e24bd004 	sub	sp, fp, #4
    82b4:	e8bd8800 	pop	{fp, pc}

000082b8 <hexstrings>:
    82b8:	e92d4800 	push	{fp, lr}
    82bc:	e28db004 	add	fp, sp, #4
    82c0:	e24dd010 	sub	sp, sp, #16
    82c4:	e50b0010 	str	r0, [fp, #-16]
    82c8:	e3a03020 	mov	r3, #32
    82cc:	e50b3008 	str	r3, [fp, #-8]
    82d0:	e51b3008 	ldr	r3, [fp, #-8]
    82d4:	e2433004 	sub	r3, r3, #4
    82d8:	e50b3008 	str	r3, [fp, #-8]
    82dc:	e51b3008 	ldr	r3, [fp, #-8]
    82e0:	e51b2010 	ldr	r2, [fp, #-16]
    82e4:	e1a03332 	lsr	r3, r2, r3
    82e8:	e203300f 	and	r3, r3, #15
    82ec:	e50b300c 	str	r3, [fp, #-12]
    82f0:	e51b300c 	ldr	r3, [fp, #-12]
    82f4:	e3530009 	cmp	r3, #9
    82f8:	9a000003 	bls	830c <hexstrings+0x54>
    82fc:	e51b300c 	ldr	r3, [fp, #-12]
    8300:	e2833037 	add	r3, r3, #55	; 0x37
    8304:	e50b300c 	str	r3, [fp, #-12]
    8308:	ea000002 	b	8318 <hexstrings+0x60>
    830c:	e51b300c 	ldr	r3, [fp, #-12]
    8310:	e2833030 	add	r3, r3, #48	; 0x30
    8314:	e50b300c 	str	r3, [fp, #-12]
    8318:	e51b000c 	ldr	r0, [fp, #-12]
    831c:	ebffffba 	bl	820c <uart_send>
    8320:	e51b3008 	ldr	r3, [fp, #-8]
    8324:	e3530000 	cmp	r3, #0
    8328:	1a000000 	bne	8330 <hexstrings+0x78>
    832c:	ea000000 	b	8334 <hexstrings+0x7c>
    8330:	eaffffe6 	b	82d0 <hexstrings+0x18>
    8334:	e3a00020 	mov	r0, #32
    8338:	ebffffb3 	bl	820c <uart_send>
    833c:	e24bd004 	sub	sp, fp, #4
    8340:	e8bd8800 	pop	{fp, pc}

00008344 <uart_init>:
    8344:	e92d4800 	push	{fp, lr}
    8348:	e28db004 	add	fp, sp, #4
    834c:	e24dd008 	sub	sp, sp, #8
    8350:	e59f0130 	ldr	r0, [pc, #304]	; 8488 <uart_init+0x144>
    8354:	e3a01001 	mov	r1, #1
    8358:	eb00026b 	bl	8d0c <PUT32>
    835c:	e59f0128 	ldr	r0, [pc, #296]	; 848c <uart_init+0x148>
    8360:	e3a01000 	mov	r1, #0
    8364:	eb000268 	bl	8d0c <PUT32>
    8368:	e59f0120 	ldr	r0, [pc, #288]	; 8490 <uart_init+0x14c>
    836c:	e3a01000 	mov	r1, #0
    8370:	eb000265 	bl	8d0c <PUT32>
    8374:	e59f0118 	ldr	r0, [pc, #280]	; 8494 <uart_init+0x150>
    8378:	e3a01003 	mov	r1, #3
    837c:	eb000262 	bl	8d0c <PUT32>
    8380:	e59f0110 	ldr	r0, [pc, #272]	; 8498 <uart_init+0x154>
    8384:	e3a01000 	mov	r1, #0
    8388:	eb00025f 	bl	8d0c <PUT32>
    838c:	e59f00f8 	ldr	r0, [pc, #248]	; 848c <uart_init+0x148>
    8390:	e3a01000 	mov	r1, #0
    8394:	eb00025c 	bl	8d0c <PUT32>
    8398:	e59f00fc 	ldr	r0, [pc, #252]	; 849c <uart_init+0x158>
    839c:	e3a010c6 	mov	r1, #198	; 0xc6
    83a0:	eb000259 	bl	8d0c <PUT32>
    83a4:	e59f00f4 	ldr	r0, [pc, #244]	; 84a0 <uart_init+0x15c>
    83a8:	e59f10f4 	ldr	r1, [pc, #244]	; 84a4 <uart_init+0x160>
    83ac:	eb000256 	bl	8d0c <PUT32>
    83b0:	e59f00f0 	ldr	r0, [pc, #240]	; 84a8 <uart_init+0x164>
    83b4:	eb00025a 	bl	8d24 <GET32>
    83b8:	e50b0008 	str	r0, [fp, #-8]
    83bc:	e51b3008 	ldr	r3, [fp, #-8]
    83c0:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    83c4:	e50b3008 	str	r3, [fp, #-8]
    83c8:	e51b3008 	ldr	r3, [fp, #-8]
    83cc:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    83d0:	e50b3008 	str	r3, [fp, #-8]
    83d4:	e51b3008 	ldr	r3, [fp, #-8]
    83d8:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    83dc:	e50b3008 	str	r3, [fp, #-8]
    83e0:	e51b3008 	ldr	r3, [fp, #-8]
    83e4:	e3833801 	orr	r3, r3, #65536	; 0x10000
    83e8:	e50b3008 	str	r3, [fp, #-8]
    83ec:	e59f00b4 	ldr	r0, [pc, #180]	; 84a8 <uart_init+0x164>
    83f0:	e51b1008 	ldr	r1, [fp, #-8]
    83f4:	eb000244 	bl	8d0c <PUT32>
    83f8:	e59f00ac 	ldr	r0, [pc, #172]	; 84ac <uart_init+0x168>
    83fc:	e3a01000 	mov	r1, #0
    8400:	eb000241 	bl	8d0c <PUT32>
    8404:	e3a03000 	mov	r3, #0
    8408:	e50b3008 	str	r3, [fp, #-8]
    840c:	ea000004 	b	8424 <uart_init+0xe0>
    8410:	e51b0008 	ldr	r0, [fp, #-8]
    8414:	eb000247 	bl	8d38 <dummy>
    8418:	e51b3008 	ldr	r3, [fp, #-8]
    841c:	e2833001 	add	r3, r3, #1
    8420:	e50b3008 	str	r3, [fp, #-8]
    8424:	e51b3008 	ldr	r3, [fp, #-8]
    8428:	e3530095 	cmp	r3, #149	; 0x95
    842c:	9afffff7 	bls	8410 <uart_init+0xcc>
    8430:	e59f0078 	ldr	r0, [pc, #120]	; 84b0 <uart_init+0x16c>
    8434:	e3a01903 	mov	r1, #49152	; 0xc000
    8438:	eb000233 	bl	8d0c <PUT32>
    843c:	e3a03000 	mov	r3, #0
    8440:	e50b3008 	str	r3, [fp, #-8]
    8444:	ea000004 	b	845c <uart_init+0x118>
    8448:	e51b0008 	ldr	r0, [fp, #-8]
    844c:	eb000239 	bl	8d38 <dummy>
    8450:	e51b3008 	ldr	r3, [fp, #-8]
    8454:	e2833001 	add	r3, r3, #1
    8458:	e50b3008 	str	r3, [fp, #-8]
    845c:	e51b3008 	ldr	r3, [fp, #-8]
    8460:	e3530095 	cmp	r3, #149	; 0x95
    8464:	9afffff7 	bls	8448 <uart_init+0x104>
    8468:	e59f0040 	ldr	r0, [pc, #64]	; 84b0 <uart_init+0x16c>
    846c:	e3a01000 	mov	r1, #0
    8470:	eb000225 	bl	8d0c <PUT32>
    8474:	e59f0014 	ldr	r0, [pc, #20]	; 8490 <uart_init+0x14c>
    8478:	e3a01003 	mov	r1, #3
    847c:	eb000222 	bl	8d0c <PUT32>
    8480:	e24bd004 	sub	sp, fp, #4
    8484:	e8bd8800 	pop	{fp, pc}
    8488:	20215004 	eorcs	r5, r1, r4
    848c:	20215044 	eorcs	r5, r1, r4, asr #32
    8490:	20215060 	eorcs	r5, r1, r0, rrx
    8494:	2021504c 	eorcs	r5, r1, ip, asr #32
    8498:	20215050 	eorcs	r5, r1, r0, asr r0
    849c:	20215048 	eorcs	r5, r1, r8, asr #32
    84a0:	20215068 	eorcs	r5, r1, r8, rrx
    84a4:	0000010e 	andeq	r0, r0, lr, lsl #2
    84a8:	20200004 	eorcs	r0, r0, r4
    84ac:	20200094 	mlacs	r0, r4, r0, r0
    84b0:	20200098 	mlacs	r0, r8, r0, r0

000084b4 <uprint>:
    84b4:	e92d4800 	push	{fp, lr}
    84b8:	e28db004 	add	fp, sp, #4
    84bc:	e24dd010 	sub	sp, sp, #16
    84c0:	e50b0010 	str	r0, [fp, #-16]
    84c4:	e3a03000 	mov	r3, #0
    84c8:	e50b3008 	str	r3, [fp, #-8]
    84cc:	ea000010 	b	8514 <uprint+0x60>
    84d0:	e51b3008 	ldr	r3, [fp, #-8]
    84d4:	e51b2010 	ldr	r2, [fp, #-16]
    84d8:	e0823003 	add	r3, r2, r3
    84dc:	e5d33000 	ldrb	r3, [r3]
    84e0:	e353000a 	cmp	r3, #10
    84e4:	1a000001 	bne	84f0 <uprint+0x3c>
    84e8:	e3a0000d 	mov	r0, #13
    84ec:	ebffff46 	bl	820c <uart_send>
    84f0:	e51b3008 	ldr	r3, [fp, #-8]
    84f4:	e51b2010 	ldr	r2, [fp, #-16]
    84f8:	e0823003 	add	r3, r2, r3
    84fc:	e5d33000 	ldrb	r3, [r3]
    8500:	e1a00003 	mov	r0, r3
    8504:	ebffff40 	bl	820c <uart_send>
    8508:	e51b3008 	ldr	r3, [fp, #-8]
    850c:	e2833001 	add	r3, r3, #1
    8510:	e50b3008 	str	r3, [fp, #-8]
    8514:	e51b3008 	ldr	r3, [fp, #-8]
    8518:	e51b2010 	ldr	r2, [fp, #-16]
    851c:	e0823003 	add	r3, r2, r3
    8520:	e5d33000 	ldrb	r3, [r3]
    8524:	e3530000 	cmp	r3, #0
    8528:	1affffe8 	bne	84d0 <uprint+0x1c>
    852c:	e24bd004 	sub	sp, fp, #4
    8530:	e8bd8800 	pop	{fp, pc}

00008534 <printint>:
    8534:	e92d4810 	push	{r4, fp, lr}
    8538:	e28db008 	add	fp, sp, #8
    853c:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    8540:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8544:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    8548:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    854c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8550:	e3530000 	cmp	r3, #0
    8554:	0a00000a 	beq	8584 <printint+0x50>
    8558:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    855c:	e1a03fa3 	lsr	r3, r3, #31
    8560:	e6ef3073 	uxtb	r3, r3
    8564:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8568:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    856c:	e3530000 	cmp	r3, #0
    8570:	0a000003 	beq	8584 <printint+0x50>
    8574:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8578:	e2633000 	rsb	r3, r3, #0
    857c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8580:	ea000001 	b	858c <printint+0x58>
    8584:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8588:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    858c:	e3a03000 	mov	r3, #0
    8590:	e50b3010 	str	r3, [fp, #-16]
    8594:	e51b4010 	ldr	r4, [fp, #-16]
    8598:	e2843001 	add	r3, r4, #1
    859c:	e50b3010 	str	r3, [fp, #-16]
    85a0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85a4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    85a8:	e1a00002 	mov	r0, r2
    85ac:	e1a01003 	mov	r1, r3
    85b0:	eb000188 	bl	8bd8 <__aeabi_uidivmod>
    85b4:	e1a03001 	mov	r3, r1
    85b8:	e59f20b0 	ldr	r2, [pc, #176]	; 8670 <printint+0x13c>
    85bc:	e7d22003 	ldrb	r2, [r2, r3]
    85c0:	e3e03017 	mvn	r3, #23
    85c4:	e24b000c 	sub	r0, fp, #12
    85c8:	e0801004 	add	r1, r0, r4
    85cc:	e0813003 	add	r3, r1, r3
    85d0:	e5c32000 	strb	r2, [r3]
    85d4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85d8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    85dc:	e1a01003 	mov	r1, r3
    85e0:	eb00013f 	bl	8ae4 <__aeabi_uidiv>
    85e4:	e1a03000 	mov	r3, r0
    85e8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    85ec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    85f0:	e3530000 	cmp	r3, #0
    85f4:	1affffe6 	bne	8594 <printint+0x60>
    85f8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    85fc:	e3530000 	cmp	r3, #0
    8600:	0a000009 	beq	862c <printint+0xf8>
    8604:	e51b3010 	ldr	r3, [fp, #-16]
    8608:	e2832001 	add	r2, r3, #1
    860c:	e50b2010 	str	r2, [fp, #-16]
    8610:	e3e02017 	mvn	r2, #23
    8614:	e24b100c 	sub	r1, fp, #12
    8618:	e0813003 	add	r3, r1, r3
    861c:	e0833002 	add	r3, r3, r2
    8620:	e3a0202d 	mov	r2, #45	; 0x2d
    8624:	e5c32000 	strb	r2, [r3]
    8628:	ea000008 	b	8650 <printint+0x11c>
    862c:	ea000007 	b	8650 <printint+0x11c>
    8630:	e3e03017 	mvn	r3, #23
    8634:	e51b2010 	ldr	r2, [fp, #-16]
    8638:	e24b000c 	sub	r0, fp, #12
    863c:	e0802002 	add	r2, r0, r2
    8640:	e0823003 	add	r3, r2, r3
    8644:	e5d33000 	ldrb	r3, [r3]
    8648:	e1a00003 	mov	r0, r3
    864c:	ebfffeee 	bl	820c <uart_send>
    8650:	e51b3010 	ldr	r3, [fp, #-16]
    8654:	e2433001 	sub	r3, r3, #1
    8658:	e50b3010 	str	r3, [fp, #-16]
    865c:	e51b3010 	ldr	r3, [fp, #-16]
    8660:	e3530000 	cmp	r3, #0
    8664:	aafffff1 	bge	8630 <printint+0xfc>
    8668:	e24bd008 	sub	sp, fp, #8
    866c:	e8bd8810 	pop	{r4, fp, pc}
    8670:	000090fc 	strdeq	r9, [r0], -ip

00008674 <cprintf>:
    8674:	e92d000f 	push	{r0, r1, r2, r3}
    8678:	e92d4800 	push	{fp, lr}
    867c:	e28db004 	add	fp, sp, #4
    8680:	e24dd010 	sub	sp, sp, #16
    8684:	e28b3008 	add	r3, fp, #8
    8688:	e50b300c 	str	r3, [fp, #-12]
    868c:	e3a03000 	mov	r3, #0
    8690:	e50b3008 	str	r3, [fp, #-8]
    8694:	ea00005c 	b	880c <cprintf+0x198>
    8698:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    869c:	e3530025 	cmp	r3, #37	; 0x25
    86a0:	0a000008 	beq	86c8 <cprintf+0x54>
    86a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86a8:	e353000a 	cmp	r3, #10
    86ac:	1a000001 	bne	86b8 <cprintf+0x44>
    86b0:	e3a0000d 	mov	r0, #13
    86b4:	ebfffed4 	bl	820c <uart_send>
    86b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86bc:	e1a00003 	mov	r0, r3
    86c0:	ebfffed1 	bl	820c <uart_send>
    86c4:	ea00004d 	b	8800 <cprintf+0x18c>
    86c8:	e59b2004 	ldr	r2, [fp, #4]
    86cc:	e51b3008 	ldr	r3, [fp, #-8]
    86d0:	e2833001 	add	r3, r3, #1
    86d4:	e50b3008 	str	r3, [fp, #-8]
    86d8:	e51b3008 	ldr	r3, [fp, #-8]
    86dc:	e0823003 	add	r3, r2, r3
    86e0:	e5d33000 	ldrb	r3, [r3]
    86e4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    86e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86ec:	e3530000 	cmp	r3, #0
    86f0:	1a000000 	bne	86f8 <cprintf+0x84>
    86f4:	ea00004c 	b	882c <cprintf+0x1b8>
    86f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86fc:	e3530070 	cmp	r3, #112	; 0x70
    8700:	0a000014 	beq	8758 <cprintf+0xe4>
    8704:	e3530070 	cmp	r3, #112	; 0x70
    8708:	ca000004 	bgt	8720 <cprintf+0xac>
    870c:	e3530025 	cmp	r3, #37	; 0x25
    8710:	0a000031 	beq	87dc <cprintf+0x168>
    8714:	e3530064 	cmp	r3, #100	; 0x64
    8718:	0a000005 	beq	8734 <cprintf+0xc0>
    871c:	ea000031 	b	87e8 <cprintf+0x174>
    8720:	e3530073 	cmp	r3, #115	; 0x73
    8724:	0a000014 	beq	877c <cprintf+0x108>
    8728:	e3530078 	cmp	r3, #120	; 0x78
    872c:	0a000009 	beq	8758 <cprintf+0xe4>
    8730:	ea00002c 	b	87e8 <cprintf+0x174>
    8734:	e51b300c 	ldr	r3, [fp, #-12]
    8738:	e2832004 	add	r2, r3, #4
    873c:	e50b200c 	str	r2, [fp, #-12]
    8740:	e5933000 	ldr	r3, [r3]
    8744:	e1a00003 	mov	r0, r3
    8748:	e3a0100a 	mov	r1, #10
    874c:	e3a02001 	mov	r2, #1
    8750:	ebffff77 	bl	8534 <printint>
    8754:	ea000029 	b	8800 <cprintf+0x18c>
    8758:	e51b300c 	ldr	r3, [fp, #-12]
    875c:	e2832004 	add	r2, r3, #4
    8760:	e50b200c 	str	r2, [fp, #-12]
    8764:	e5933000 	ldr	r3, [r3]
    8768:	e1a00003 	mov	r0, r3
    876c:	e3a01010 	mov	r1, #16
    8770:	e3a02000 	mov	r2, #0
    8774:	ebffff6e 	bl	8534 <printint>
    8778:	ea000020 	b	8800 <cprintf+0x18c>
    877c:	e51b300c 	ldr	r3, [fp, #-12]
    8780:	e2832004 	add	r2, r3, #4
    8784:	e50b200c 	str	r2, [fp, #-12]
    8788:	e5933000 	ldr	r3, [r3]
    878c:	e50b3010 	str	r3, [fp, #-16]
    8790:	e51b3010 	ldr	r3, [fp, #-16]
    8794:	e3530000 	cmp	r3, #0
    8798:	1a000002 	bne	87a8 <cprintf+0x134>
    879c:	e59f3098 	ldr	r3, [pc, #152]	; 883c <cprintf+0x1c8>
    87a0:	e50b3010 	str	r3, [fp, #-16]
    87a4:	ea000007 	b	87c8 <cprintf+0x154>
    87a8:	ea000006 	b	87c8 <cprintf+0x154>
    87ac:	e51b3010 	ldr	r3, [fp, #-16]
    87b0:	e5d33000 	ldrb	r3, [r3]
    87b4:	e1a00003 	mov	r0, r3
    87b8:	ebfffe93 	bl	820c <uart_send>
    87bc:	e51b3010 	ldr	r3, [fp, #-16]
    87c0:	e2833001 	add	r3, r3, #1
    87c4:	e50b3010 	str	r3, [fp, #-16]
    87c8:	e51b3010 	ldr	r3, [fp, #-16]
    87cc:	e5d33000 	ldrb	r3, [r3]
    87d0:	e3530000 	cmp	r3, #0
    87d4:	1afffff4 	bne	87ac <cprintf+0x138>
    87d8:	ea000008 	b	8800 <cprintf+0x18c>
    87dc:	e3a00025 	mov	r0, #37	; 0x25
    87e0:	ebfffe89 	bl	820c <uart_send>
    87e4:	ea000005 	b	8800 <cprintf+0x18c>
    87e8:	e3a00025 	mov	r0, #37	; 0x25
    87ec:	ebfffe86 	bl	820c <uart_send>
    87f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87f4:	e1a00003 	mov	r0, r3
    87f8:	ebfffe83 	bl	820c <uart_send>
    87fc:	e1a00000 	nop			; (mov r0, r0)
    8800:	e51b3008 	ldr	r3, [fp, #-8]
    8804:	e2833001 	add	r3, r3, #1
    8808:	e50b3008 	str	r3, [fp, #-8]
    880c:	e59b2004 	ldr	r2, [fp, #4]
    8810:	e51b3008 	ldr	r3, [fp, #-8]
    8814:	e0823003 	add	r3, r2, r3
    8818:	e5d33000 	ldrb	r3, [r3]
    881c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8820:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8824:	e3530000 	cmp	r3, #0
    8828:	1affff9a 	bne	8698 <cprintf+0x24>
    882c:	e24bd004 	sub	sp, fp, #4
    8830:	e8bd4800 	pop	{fp, lr}
    8834:	e28dd010 	add	sp, sp, #16
    8838:	e12fff1e 	bx	lr
    883c:	00008f00 	andeq	r8, r0, r0, lsl #30

00008840 <copy_vectors>:
    8840:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8844:	e28db000 	add	fp, sp, #0
    8848:	e24dd00c 	sub	sp, sp, #12
    884c:	e59f3048 	ldr	r3, [pc, #72]	; 889c <copy_vectors+0x5c>
    8850:	e50b3008 	str	r3, [fp, #-8]
    8854:	e3a03000 	mov	r3, #0
    8858:	e50b300c 	str	r3, [fp, #-12]
    885c:	ea000007 	b	8880 <copy_vectors+0x40>
    8860:	e51b300c 	ldr	r3, [fp, #-12]
    8864:	e2832004 	add	r2, r3, #4
    8868:	e50b200c 	str	r2, [fp, #-12]
    886c:	e51b2008 	ldr	r2, [fp, #-8]
    8870:	e2821004 	add	r1, r2, #4
    8874:	e50b1008 	str	r1, [fp, #-8]
    8878:	e5922000 	ldr	r2, [r2]
    887c:	e5832000 	str	r2, [r3]
    8880:	e51b2008 	ldr	r2, [fp, #-8]
    8884:	e59f3014 	ldr	r3, [pc, #20]	; 88a0 <copy_vectors+0x60>
    8888:	e1520003 	cmp	r2, r3
    888c:	3afffff3 	bcc	8860 <copy_vectors+0x20>
    8890:	e24bd000 	sub	sp, fp, #0
    8894:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8898:	e12fff1e 	bx	lr
    889c:	0000803c 	andeq	r8, r0, ip, lsr r0
    88a0:	0000807c 	andeq	r8, r0, ip, ror r0

000088a4 <secure_swi>:
    88a4:	e92d4800 	push	{fp, lr}
    88a8:	e28db004 	add	fp, sp, #4
    88ac:	e59f0004 	ldr	r0, [pc, #4]	; 88b8 <secure_swi+0x14>
    88b0:	ebffff6f 	bl	8674 <cprintf>
    88b4:	e8bd8800 	pop	{fp, pc}
    88b8:	00008f08 	andeq	r8, r0, r8, lsl #30

000088bc <ns_reset>:
    88bc:	e92d4800 	push	{fp, lr}
    88c0:	e28db004 	add	fp, sp, #4
    88c4:	e59f0004 	ldr	r0, [pc, #4]	; 88d0 <ns_reset+0x14>
    88c8:	ebffff69 	bl	8674 <cprintf>
    88cc:	e8bd8800 	pop	{fp, pc}
    88d0:	00008f28 	andeq	r8, r0, r8, lsr #30

000088d4 <ns_undef>:
    88d4:	e92d4800 	push	{fp, lr}
    88d8:	e28db004 	add	fp, sp, #4
    88dc:	e59f0004 	ldr	r0, [pc, #4]	; 88e8 <ns_undef+0x14>
    88e0:	ebffff63 	bl	8674 <cprintf>
    88e4:	e8bd8800 	pop	{fp, pc}
    88e8:	00008f4c 	andeq	r8, r0, ip, asr #30

000088ec <ns_swi>:
    88ec:	e92d4800 	push	{fp, lr}
    88f0:	e28db004 	add	fp, sp, #4
    88f4:	e59f0004 	ldr	r0, [pc, #4]	; 8900 <ns_swi+0x14>
    88f8:	ebffff5d 	bl	8674 <cprintf>
    88fc:	e8bd8800 	pop	{fp, pc}
    8900:	00008f70 	andeq	r8, r0, r0, ror pc

00008904 <ns_pa>:
    8904:	e92d4800 	push	{fp, lr}
    8908:	e28db004 	add	fp, sp, #4
    890c:	e59f0004 	ldr	r0, [pc, #4]	; 8918 <ns_pa+0x14>
    8910:	ebffff57 	bl	8674 <cprintf>
    8914:	e8bd8800 	pop	{fp, pc}
    8918:	00008f90 	muleq	r0, r0, pc	; <UNPREDICTABLE>

0000891c <ns_da>:
    891c:	e92d4800 	push	{fp, lr}
    8920:	e28db004 	add	fp, sp, #4
    8924:	e59f0004 	ldr	r0, [pc, #4]	; 8930 <ns_da+0x14>
    8928:	ebffff51 	bl	8674 <cprintf>
    892c:	e8bd8800 	pop	{fp, pc}
    8930:	00008f70 	andeq	r8, r0, r0, ror pc

00008934 <ns_irq>:
    8934:	e92d4800 	push	{fp, lr}
    8938:	e28db004 	add	fp, sp, #4
    893c:	e59f0004 	ldr	r0, [pc, #4]	; 8948 <ns_irq+0x14>
    8940:	ebffff4b 	bl	8674 <cprintf>
    8944:	e8bd8800 	pop	{fp, pc}
    8948:	00008fb0 			; <UNDEFINED> instruction: 0x00008fb0

0000894c <ns_fiq>:
    894c:	e92d4800 	push	{fp, lr}
    8950:	e28db004 	add	fp, sp, #4
    8954:	e59f0004 	ldr	r0, [pc, #4]	; 8960 <ns_fiq+0x14>
    8958:	ebffff45 	bl	8674 <cprintf>
    895c:	e8bd8800 	pop	{fp, pc}
    8960:	00008fd0 	ldrdeq	r8, [r0], -r0

00008964 <Normal_World>:
    8964:	e92d4800 	push	{fp, lr}
    8968:	e28db004 	add	fp, sp, #4
    896c:	e24dd008 	sub	sp, sp, #8
    8970:	e59f0034 	ldr	r0, [pc, #52]	; 89ac <Normal_World+0x48>
    8974:	eb0000ea 	bl	8d24 <GET32>
    8978:	e1a03000 	mov	r3, r0
    897c:	e50b3008 	str	r3, [fp, #-8]
    8980:	e59f0028 	ldr	r0, [pc, #40]	; 89b0 <Normal_World+0x4c>
    8984:	e51b1008 	ldr	r1, [fp, #-8]
    8988:	e51b2008 	ldr	r2, [fp, #-8]
    898c:	ebffff38 	bl	8674 <cprintf>
    8990:	e59f001c 	ldr	r0, [pc, #28]	; 89b4 <Normal_World+0x50>
    8994:	ebffff36 	bl	8674 <cprintf>
    8998:	ef000000 	svc	0x00000000
    899c:	e59f0014 	ldr	r0, [pc, #20]	; 89b8 <Normal_World+0x54>
    89a0:	ebffff33 	bl	8674 <cprintf>
    89a4:	e1600070 	smc	0
    89a8:	eafffff0 	b	8970 <Normal_World+0xc>
    89ac:	20003004 	andcs	r3, r0, r4
    89b0:	00008ff0 	strdeq	r8, [r0], -r0
    89b4:	00009010 	andeq	r9, r0, r0, lsl r0
    89b8:	00009024 	andeq	r9, r0, r4, lsr #32

000089bc <bootmain>:
    89bc:	e92d4800 	push	{fp, lr}
    89c0:	e28db004 	add	fp, sp, #4
    89c4:	e24dde1a 	sub	sp, sp, #416	; 0x1a0
    89c8:	ebfffe5d 	bl	8344 <uart_init>
    89cc:	e3a03064 	mov	r3, #100	; 0x64
    89d0:	e50b300c 	str	r3, [fp, #-12]
    89d4:	e3a03000 	mov	r3, #0
    89d8:	e50b3008 	str	r3, [fp, #-8]
    89dc:	ea00000a 	b	8a0c <bootmain+0x50>
    89e0:	e51b2008 	ldr	r2, [fp, #-8]
    89e4:	e59f30cc 	ldr	r3, [pc, #204]	; 8ab8 <bootmain+0xfc>
    89e8:	e1a02102 	lsl	r2, r2, #2
    89ec:	e24b1004 	sub	r1, fp, #4
    89f0:	e0812002 	add	r2, r1, r2
    89f4:	e0823003 	add	r3, r2, r3
    89f8:	e3a02c01 	mov	r2, #256	; 0x100
    89fc:	e5832000 	str	r2, [r3]
    8a00:	e51b3008 	ldr	r3, [fp, #-8]
    8a04:	e2833001 	add	r3, r3, #1
    8a08:	e50b3008 	str	r3, [fp, #-8]
    8a0c:	e51b2008 	ldr	r2, [fp, #-8]
    8a10:	e51b300c 	ldr	r3, [fp, #-12]
    8a14:	e1520003 	cmp	r2, r3
    8a18:	bafffff0 	blt	89e0 <bootmain+0x24>
    8a1c:	e59f0098 	ldr	r0, [pc, #152]	; 8abc <bootmain+0x100>
    8a20:	ebfffea3 	bl	84b4 <uprint>
    8a24:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    8a28:	e1a00003 	mov	r0, r3
    8a2c:	ebfffe15 	bl	8288 <hexstring>
    8a30:	e59f0088 	ldr	r0, [pc, #136]	; 8ac0 <bootmain+0x104>
    8a34:	ebfffe9e 	bl	84b4 <uprint>
    8a38:	e59f0084 	ldr	r0, [pc, #132]	; 8ac4 <bootmain+0x108>
    8a3c:	ebfffe9c 	bl	84b4 <uprint>
    8a40:	e59f0080 	ldr	r0, [pc, #128]	; 8ac8 <bootmain+0x10c>
    8a44:	eb00008b 	bl	8c78 <monitorInit>
    8a48:	e59f007c 	ldr	r0, [pc, #124]	; 8acc <bootmain+0x110>
    8a4c:	ebfffe98 	bl	84b4 <uprint>
    8a50:	e3a03000 	mov	r3, #0
    8a54:	e50b3008 	str	r3, [fp, #-8]
    8a58:	ea000012 	b	8aa8 <bootmain+0xec>
    8a5c:	e59f006c 	ldr	r0, [pc, #108]	; 8ad0 <bootmain+0x114>
    8a60:	ebffff03 	bl	8674 <cprintf>
    8a64:	e59f0068 	ldr	r0, [pc, #104]	; 8ad4 <bootmain+0x118>
    8a68:	eb0000ad 	bl	8d24 <GET32>
    8a6c:	e1a03000 	mov	r3, r0
    8a70:	e50b3010 	str	r3, [fp, #-16]
    8a74:	e1600070 	smc	0
    8a78:	e59f0058 	ldr	r0, [pc, #88]	; 8ad8 <bootmain+0x11c>
    8a7c:	e51b1010 	ldr	r1, [fp, #-16]
    8a80:	e51b2010 	ldr	r2, [fp, #-16]
    8a84:	ebfffefa 	bl	8674 <cprintf>
    8a88:	e59f004c 	ldr	r0, [pc, #76]	; 8adc <bootmain+0x120>
    8a8c:	ebfffef8 	bl	8674 <cprintf>
    8a90:	ef000000 	svc	0x00000000
    8a94:	e59f0044 	ldr	r0, [pc, #68]	; 8ae0 <bootmain+0x124>
    8a98:	ebfffef5 	bl	8674 <cprintf>
    8a9c:	e51b3008 	ldr	r3, [fp, #-8]
    8aa0:	e2833001 	add	r3, r3, #1
    8aa4:	e50b3008 	str	r3, [fp, #-8]
    8aa8:	e51b3008 	ldr	r3, [fp, #-8]
    8aac:	e3530009 	cmp	r3, #9
    8ab0:	daffffe9 	ble	8a5c <bootmain+0xa0>
    8ab4:	eafffffe 	b	8ab4 <bootmain+0xf8>
    8ab8:	fffffe64 			; <UNDEFINED> instruction: 0xfffffe64
    8abc:	00009038 	andeq	r9, r0, r8, lsr r0
    8ac0:	0000905c 	andeq	r9, r0, ip, asr r0
    8ac4:	00009070 	andeq	r9, r0, r0, ror r0
    8ac8:	00008964 	andeq	r8, r0, r4, ror #18
    8acc:	00009080 	andeq	r9, r0, r0, lsl #1
    8ad0:	000090a0 	andeq	r9, r0, r0, lsr #1
    8ad4:	20003004 	andcs	r3, r0, r4
    8ad8:	000090bc 	strheq	r9, [r0], -ip
    8adc:	000090d4 	ldrdeq	r9, [r0], -r4
    8ae0:	000090e8 	andeq	r9, r0, r8, ror #1

00008ae4 <__aeabi_uidiv>:
    8ae4:	e2512001 	subs	r2, r1, #1
    8ae8:	012fff1e 	bxeq	lr
    8aec:	3a000036 	bcc	8bcc <__aeabi_uidiv+0xe8>
    8af0:	e1500001 	cmp	r0, r1
    8af4:	9a000022 	bls	8b84 <__aeabi_uidiv+0xa0>
    8af8:	e1110002 	tst	r1, r2
    8afc:	0a000023 	beq	8b90 <__aeabi_uidiv+0xac>
    8b00:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    8b04:	01a01181 	lsleq	r1, r1, #3
    8b08:	03a03008 	moveq	r3, #8
    8b0c:	13a03001 	movne	r3, #1
    8b10:	e3510201 	cmp	r1, #268435456	; 0x10000000
    8b14:	31510000 	cmpcc	r1, r0
    8b18:	31a01201 	lslcc	r1, r1, #4
    8b1c:	31a03203 	lslcc	r3, r3, #4
    8b20:	3afffffa 	bcc	8b10 <__aeabi_uidiv+0x2c>
    8b24:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    8b28:	31510000 	cmpcc	r1, r0
    8b2c:	31a01081 	lslcc	r1, r1, #1
    8b30:	31a03083 	lslcc	r3, r3, #1
    8b34:	3afffffa 	bcc	8b24 <__aeabi_uidiv+0x40>
    8b38:	e3a02000 	mov	r2, #0
    8b3c:	e1500001 	cmp	r0, r1
    8b40:	20400001 	subcs	r0, r0, r1
    8b44:	21822003 	orrcs	r2, r2, r3
    8b48:	e15000a1 	cmp	r0, r1, lsr #1
    8b4c:	204000a1 	subcs	r0, r0, r1, lsr #1
    8b50:	218220a3 	orrcs	r2, r2, r3, lsr #1
    8b54:	e1500121 	cmp	r0, r1, lsr #2
    8b58:	20400121 	subcs	r0, r0, r1, lsr #2
    8b5c:	21822123 	orrcs	r2, r2, r3, lsr #2
    8b60:	e15001a1 	cmp	r0, r1, lsr #3
    8b64:	204001a1 	subcs	r0, r0, r1, lsr #3
    8b68:	218221a3 	orrcs	r2, r2, r3, lsr #3
    8b6c:	e3500000 	cmp	r0, #0
    8b70:	11b03223 	lsrsne	r3, r3, #4
    8b74:	11a01221 	lsrne	r1, r1, #4
    8b78:	1affffef 	bne	8b3c <__aeabi_uidiv+0x58>
    8b7c:	e1a00002 	mov	r0, r2
    8b80:	e12fff1e 	bx	lr
    8b84:	03a00001 	moveq	r0, #1
    8b88:	13a00000 	movne	r0, #0
    8b8c:	e12fff1e 	bx	lr
    8b90:	e3510801 	cmp	r1, #65536	; 0x10000
    8b94:	21a01821 	lsrcs	r1, r1, #16
    8b98:	23a02010 	movcs	r2, #16
    8b9c:	33a02000 	movcc	r2, #0
    8ba0:	e3510c01 	cmp	r1, #256	; 0x100
    8ba4:	21a01421 	lsrcs	r1, r1, #8
    8ba8:	22822008 	addcs	r2, r2, #8
    8bac:	e3510010 	cmp	r1, #16
    8bb0:	21a01221 	lsrcs	r1, r1, #4
    8bb4:	22822004 	addcs	r2, r2, #4
    8bb8:	e3510004 	cmp	r1, #4
    8bbc:	82822003 	addhi	r2, r2, #3
    8bc0:	908220a1 	addls	r2, r2, r1, lsr #1
    8bc4:	e1a00230 	lsr	r0, r0, r2
    8bc8:	e12fff1e 	bx	lr
    8bcc:	e3500000 	cmp	r0, #0
    8bd0:	13e00000 	mvnne	r0, #0
    8bd4:	ea000007 	b	8bf8 <__aeabi_idiv0>

00008bd8 <__aeabi_uidivmod>:
    8bd8:	e3510000 	cmp	r1, #0
    8bdc:	0afffffa 	beq	8bcc <__aeabi_uidiv+0xe8>
    8be0:	e92d4003 	push	{r0, r1, lr}
    8be4:	ebffffbe 	bl	8ae4 <__aeabi_uidiv>
    8be8:	e8bd4006 	pop	{r1, r2, lr}
    8bec:	e0030092 	mul	r3, r2, r0
    8bf0:	e0411003 	sub	r1, r1, r3
    8bf4:	e12fff1e 	bx	lr

00008bf8 <__aeabi_idiv0>:
    8bf8:	e12fff1e 	bx	lr

Disassembly of section .init:

00008c00 <monitor>:
    8c00:	e1a00000 	nop			; (mov r0, r0)
    8c04:	e1a00000 	nop			; (mov r0, r0)
    8c08:	ea000004 	b	8c20 <SMC_Handler>
    8c0c:	e1a00000 	nop			; (mov r0, r0)
    8c10:	e1a00000 	nop			; (mov r0, r0)
    8c14:	e1a00000 	nop			; (mov r0, r0)
    8c18:	e1a00000 	nop			; (mov r0, r0)
    8c1c:	e1a00000 	nop			; (mov r0, r0)

00008c20 <SMC_Handler>:
    8c20:	e92d000f 	push	{r0, r1, r2, r3}
    8c24:	ee110f11 	mrc	15, 0, r0, cr1, cr1, {0}
    8c28:	e3100001 	tst	r0, #1
    8c2c:	e2200001 	eor	r0, r0, #1
    8c30:	ee010f11 	mcr	15, 0, r0, cr1, cr1, {0}
    8c34:	059f0298 	ldreq	r0, [pc, #664]	; 8ed4 <ns_FIQHandler+0x10>
    8c38:	159f0298 	ldrne	r0, [pc, #664]	; 8ed8 <ns_FIQHandler+0x14>
    8c3c:	e5902000 	ldr	r2, [r0]
    8c40:	059f1290 	ldreq	r1, [pc, #656]	; 8ed8 <ns_FIQHandler+0x14>
    8c44:	159f1288 	ldrne	r1, [pc, #648]	; 8ed4 <ns_FIQHandler+0x10>
    8c48:	e5913000 	ldr	r3, [r1]
    8c4c:	e9221ff0 	stmdb	r2!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8c50:	e14f4000 	mrs	r4, SPSR
    8c54:	e9224010 	stmdb	r2!, {r4, lr}
    8c58:	e5802000 	str	r2, [r0]
    8c5c:	e8b34001 	ldm	r3!, {r0, lr}
    8c60:	e16ff000 	msr	SPSR_fsxc, r0
    8c64:	e8b31ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8c68:	e5813000 	str	r3, [r1]
    8c6c:	f57ff01f 	clrex
    8c70:	e8bd000f 	pop	{r0, r1, r2, r3}
    8c74:	e1b0f00e 	movs	pc, lr

00008c78 <monitorInit>:
    8c78:	e59f125c 	ldr	r1, [pc, #604]	; 8edc <ns_FIQHandler+0x18>
    8c7c:	e5810000 	str	r0, [r1]
    8c80:	e59f0258 	ldr	r0, [pc, #600]	; 8ee0 <ns_FIQHandler+0x1c>
    8c84:	ee0c0f30 	mcr	15, 0, r0, cr12, cr0, {1}
    8c88:	e59f0254 	ldr	r0, [pc, #596]	; 8ee4 <ns_FIQHandler+0x20>
    8c8c:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
    8c90:	e59f0250 	ldr	r0, [pc, #592]	; 8ee8 <ns_FIQHandler+0x24>
    8c94:	e9201ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8c98:	e10f1000 	mrs	r1, CPSR
    8c9c:	e9204002 	stmdb	r0!, {r1, lr}
    8ca0:	f1020016 	cps	#22
    8ca4:	e59f1228 	ldr	r1, [pc, #552]	; 8ed4 <ns_FIQHandler+0x10>
    8ca8:	e5810000 	str	r0, [r1]
    8cac:	e59f0224 	ldr	r0, [pc, #548]	; 8ed8 <ns_FIQHandler+0x14>
    8cb0:	e59f1234 	ldr	r1, [pc, #564]	; 8eec <ns_FIQHandler+0x28>
    8cb4:	e5801000 	str	r1, [r0]
    8cb8:	e59fe17c 	ldr	lr, [pc, #380]	; 8e3c <ns_image>
    8cbc:	e36ff013 	msr	SPSR_fsxc, #19
    8cc0:	ee114f11 	mrc	15, 0, r4, cr1, cr1, {0}
    8cc4:	e3844001 	orr	r4, r4, #1
    8cc8:	ee014f11 	mcr	15, 0, r4, cr1, cr1, {0}
    8ccc:	e59f021c 	ldr	r0, [pc, #540]	; 8ef0 <ns_FIQHandler+0x2c>
    8cd0:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
    8cd4:	e3a00000 	mov	r0, #0
    8cd8:	e3a01000 	mov	r1, #0
    8cdc:	e3a02000 	mov	r2, #0
    8ce0:	e3a03000 	mov	r3, #0
    8ce4:	e3a04000 	mov	r4, #0
    8ce8:	e3a05000 	mov	r5, #0
    8cec:	e3a06000 	mov	r6, #0
    8cf0:	e3a07000 	mov	r7, #0
    8cf4:	e3a08000 	mov	r8, #0
    8cf8:	e3a09000 	mov	r9, #0
    8cfc:	e3a0a000 	mov	sl, #0
    8d00:	e3a0b000 	mov	fp, #0
    8d04:	e3a0c000 	mov	ip, #0
    8d08:	e1b0f00e 	movs	pc, lr

00008d0c <PUT32>:
    8d0c:	e5801000 	str	r1, [r0]
    8d10:	e12fff1e 	bx	lr

00008d14 <PUT16>:
    8d14:	e1c010b0 	strh	r1, [r0]
    8d18:	e12fff1e 	bx	lr

00008d1c <PUT8>:
    8d1c:	e5c01000 	strb	r1, [r0]
    8d20:	e12fff1e 	bx	lr

00008d24 <GET32>:
    8d24:	e5900000 	ldr	r0, [r0]
    8d28:	e12fff1e 	bx	lr

00008d2c <GETPC>:
    8d2c:	e1a0000e 	mov	r0, lr
    8d30:	e12fff1e 	bx	lr

00008d34 <BRANCHTO>:
    8d34:	e12fff10 	bx	r0

00008d38 <dummy>:
    8d38:	e12fff1e 	bx	lr

00008d3c <NS_STACK_BASE>:
	...

00008db8 <NS_STACK_LIMIT>:
	...

00008e34 <NS_STACK_SP>:
    8e34:	00000000 	andeq	r0, r0, r0

00008e38 <S_STACK_SP>:
    8e38:	00000000 	andeq	r0, r0, r0

00008e3c <ns_image>:
    8e3c:	00000000 	andeq	r0, r0, r0

00008e40 <UndefHandler>:
    8e40:	eafffffe 	b	8e40 <UndefHandler>

00008e44 <SWIHandler>:
    8e44:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e48:	ebfffe95 	bl	88a4 <secure_swi>
    8e4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8e50:	e1a0f00e 	mov	pc, lr

00008e54 <PAbortHandler>:
    8e54:	eafffffe 	b	8e54 <PAbortHandler>

00008e58 <DAbortHandler>:
    8e58:	eafffffe 	b	8e58 <DAbortHandler>

00008e5c <IRQHandler>:
    8e5c:	eafffffe 	b	8e5c <IRQHandler>

00008e60 <FIQHandler>:
    8e60:	eafffffe 	b	8e60 <FIQHandler>

00008e64 <ns_ResetHandler>:
    8e64:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e68:	ebfffe93 	bl	88bc <ns_reset>
    8e6c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8e70:	e1a0f00e 	mov	pc, lr

00008e74 <ns_UndefHandler>:
    8e74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e78:	ebfffe95 	bl	88d4 <ns_undef>
    8e7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8e80:	e1a0f00e 	mov	pc, lr

00008e84 <ns_SWIHandler>:
    8e84:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e88:	ebfffe97 	bl	88ec <ns_swi>
    8e8c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8e90:	e1a0f00e 	mov	pc, lr

00008e94 <ns_PAbortHandler>:
    8e94:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e98:	ebfffe99 	bl	8904 <ns_pa>
    8e9c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8ea0:	e1a0f00e 	mov	pc, lr

00008ea4 <ns_DAbortHandler>:
    8ea4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8ea8:	ebfffe9b 	bl	891c <ns_da>
    8eac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8eb0:	e1a0f00e 	mov	pc, lr

00008eb4 <ns_IRQHandler>:
    8eb4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8eb8:	ebfffe9d 	bl	8934 <ns_irq>
    8ebc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8ec0:	e1a0f00e 	mov	pc, lr

00008ec4 <ns_FIQHandler>:
    8ec4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8ec8:	ebfffe9f 	bl	894c <ns_fiq>
    8ecc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8ed0:	e1a0f00e 	mov	pc, lr
    8ed4:	00008e38 	andeq	r8, r0, r8, lsr lr
    8ed8:	00008e34 	andeq	r8, r0, r4, lsr lr
    8edc:	00008e3c 	andeq	r8, r0, ip, lsr lr
    8ee0:	00008c00 	andeq	r8, r0, r0, lsl #24
    8ee4:	00008000 	andeq	r8, r0, r0
    8ee8:	00008e34 	andeq	r8, r0, r4, lsr lr
    8eec:	00008db8 			; <UNDEFINED> instruction: 0x00008db8
    8ef0:	0000803c 	andeq	r8, r0, ip, lsr r0
    8ef4:	e1a00000 	nop			; (mov r0, r0)
    8ef8:	e1a00000 	nop			; (mov r0, r0)
    8efc:	e1a00000 	nop			; (mov r0, r0)

Disassembly of section .rodata:

00008f00 <.rodata>:
    8f00:	6c756e28 	ldclvs	14, cr6, [r5], #-160	; 0xffffff60
    8f04:	0000296c 	andeq	r2, r0, ip, ror #18
    8f08:	53206e49 	teqpl	r0, #1168	; 0x490
    8f0c:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    8f10:	6f572065 	svcvs	0x00572065
    8f14:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8f18:	57532073 			; <UNDEFINED> instruction: 0x57532073
    8f1c:	61482049 	cmpvs	r8, r9, asr #32
    8f20:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    8f24:	00000a72 	andeq	r0, r0, r2, ror sl
    8f28:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8f2c:	616d726f 	cmnvs	sp, pc, ror #4
    8f30:	6f57206c 	svcvs	0x0057206c
    8f34:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8f38:	65722073 	ldrbvs	r2, [r2, #-115]!	; 0xffffff8d
    8f3c:	20746573 	rsbscs	r6, r4, r3, ror r5
    8f40:	646e6148 	strbtvs	r6, [lr], #-328	; 0xfffffeb8
    8f44:	0a72656c 	beq	1ca24fc <STACK_ADR+0x1c224fc>
    8f48:	00000000 	andeq	r0, r0, r0
    8f4c:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8f50:	616d726f 	cmnvs	sp, pc, ror #4
    8f54:	6f57206c 	svcvs	0x0057206c
    8f58:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8f5c:	6e552073 	mrcvs	0, 2, r2, cr5, cr3, {3}
    8f60:	20666564 	rsbcs	r6, r6, r4, ror #10
    8f64:	646e6148 	strbtvs	r6, [lr], #-328	; 0xfffffeb8
    8f68:	0a72656c 	beq	1ca2520 <STACK_ADR+0x1c22520>
    8f6c:	00000000 	andeq	r0, r0, r0
    8f70:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8f74:	616d726f 	cmnvs	sp, pc, ror #4
    8f78:	6f57206c 	svcvs	0x0057206c
    8f7c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8f80:	57532073 			; <UNDEFINED> instruction: 0x57532073
    8f84:	61482049 	cmpvs	r8, r9, asr #32
    8f88:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    8f8c:	00000a72 	andeq	r0, r0, r2, ror sl
    8f90:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8f94:	616d726f 	cmnvs	sp, pc, ror #4
    8f98:	6f57206c 	svcvs	0x0057206c
    8f9c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8fa0:	41502073 	cmpmi	r0, r3, ror r0
    8fa4:	6e614820 	cdpvs	8, 6, cr4, cr1, cr0, {1}
    8fa8:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
    8fac:	0000000a 	andeq	r0, r0, sl
    8fb0:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8fb4:	616d726f 	cmnvs	sp, pc, ror #4
    8fb8:	6f57206c 	svcvs	0x0057206c
    8fbc:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8fc0:	52492073 	subpl	r2, r9, #115	; 0x73
    8fc4:	61482051 	qdaddvs	r2, r1, r8
    8fc8:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    8fcc:	00000a72 	andeq	r0, r0, r2, ror sl
    8fd0:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8fd4:	616d726f 	cmnvs	sp, pc, ror #4
    8fd8:	6f57206c 	svcvs	0x0057206c
    8fdc:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8fe0:	49462073 	stmdbmi	r6, {r0, r1, r4, r5, r6, sp}^
    8fe4:	61482051 	qdaddvs	r2, r1, r8
    8fe8:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    8fec:	00000a72 	andeq	r0, r0, r2, ror sl
    8ff0:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    8ff4:	7266206f 	rsbvc	r2, r6, #111	; 0x6f
    8ff8:	4e206d6f 	cdpmi	13, 2, cr6, cr0, cr15, {3}
    8ffc:	616d726f 	cmnvs	sp, pc, ror #4
    9000:	6f77206c 	svcvs	0x0077206c
    9004:	3a646c72 	bcc	19241d4 <STACK_ADR+0x18a41d4>
    9008:	20642520 	rsbcs	r2, r4, r0, lsr #10
    900c:	000a7825 	andeq	r7, sl, r5, lsr #16
    9010:	6f666542 	svcvs	0x00666542
    9014:	4e206572 	mcrmi	5, 1, r6, cr0, cr2, {3}
    9018:	616d726f 	cmnvs	sp, pc, ror #4
    901c:	5753206c 	ldrbpl	r2, [r3, -ip, rrx]
    9020:	00000a49 	andeq	r0, r0, r9, asr #20
    9024:	65746641 	ldrbvs	r6, [r4, #-1601]!	; 0xfffff9bf
    9028:	6f4e2072 	svcvs	0x004e2072
    902c:	6c616d72 	stclvs	13, cr6, [r1], #-456	; 0xfffffe38
    9030:	49575320 	ldmdbmi	r7, {r5, r8, r9, ip, lr}^
    9034:	0000000a 	andeq	r0, r0, sl
    9038:	2a2a0a0a 	bcs	a8b868 <STACK_ADR+0xa0b868>
    903c:	2a2a2a2a 	bcs	a938ec <STACK_ADR+0xa138ec>
    9040:	2a2a2a2a 	bcs	a938f0 <STACK_ADR+0xa138f0>
    9044:	20707845 	rsbscs	r7, r0, r5, asr #16
    9048:	72617453 	rsbvc	r7, r1, #1392508928	; 0x53000000
    904c:	2a2a2a74 	bcs	a93a24 <STACK_ADR+0xa13a24>
    9050:	2a2a2a2a 	bcs	a93900 <STACK_ADR+0xa13900>
    9054:	2a2a2a2a 	bcs	a93904 <STACK_ADR+0xa13904>
    9058:	0000000a 	andeq	r0, r0, sl
    905c:	74736554 	ldrbtvc	r6, [r3], #-1364	; 0xfffffaac
    9060:	75725420 	ldrbvc	r5, [r2, #-1056]!	; 0xfffffbe0
    9064:	6f5a7473 	svcvs	0x005a7473
    9068:	7620656e 	strtvc	r6, [r0], -lr, ror #10
    906c:	00000a32 	andeq	r0, r0, r2, lsr sl
    9070:	6c6c6548 	cfstr64vs	mvdx6, [ip], #-288	; 0xfffffee0
    9074:	6f57206f 	svcvs	0x0057206f
    9078:	0a646c72 	beq	1924248 <STACK_ADR+0x18a4248>
    907c:	00000000 	andeq	r0, r0, r0
    9080:	74736e49 	ldrbtvc	r6, [r3], #-3657	; 0xfffff1b7
    9084:	206c6c61 	rsbcs	r6, ip, r1, ror #24
    9088:	696e6f4d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, r9, sl, fp, sp, lr}^
    908c:	20726f74 	rsbscs	r6, r2, r4, ror pc
    9090:	63637553 	cmnvs	r3, #348127232	; 0x14c00000
    9094:	66737365 	ldrbtvs	r7, [r3], -r5, ror #6
    9098:	796c6c75 	stmdbvc	ip!, {r0, r2, r4, r5, r6, sl, fp, sp, lr}^
    909c:	0000000a 	andeq	r0, r0, sl
    90a0:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    90a4:	7266206f 	rsbvc	r2, r6, #111	; 0x6f
    90a8:	53206d6f 	teqpl	r0, #7104	; 0x1bc0
    90ac:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    90b0:	6f772065 	svcvs	0x00772065
    90b4:	0a646c72 	beq	1924284 <STACK_ADR+0x18a4284>
    90b8:	00000000 	andeq	r0, r0, r0
    90bc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
    90c0:	206e6920 	rsbcs	r6, lr, r0, lsr #18
    90c4:	75636573 	strbvc	r6, [r3, #-1395]!	; 0xfffffa8d
    90c8:	203a6572 	eorscs	r6, sl, r2, ror r5
    90cc:	25206425 	strcs	r6, [r0, #-1061]!	; 0xfffffbdb
    90d0:	00000a78 	andeq	r0, r0, r8, ror sl
    90d4:	6f666542 	svcvs	0x00666542
    90d8:	53206572 	teqpl	r0, #478150656	; 0x1c800000
    90dc:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    90e0:	57532065 	ldrbpl	r2, [r3, -r5, rrx]
    90e4:	00000a49 	andeq	r0, r0, r9, asr #20
    90e8:	65746641 	ldrbvs	r6, [r4, #-1601]!	; 0xfffff9bf
    90ec:	65532072 	ldrbvs	r2, [r3, #-114]	; 0xffffff8e
    90f0:	65727563 	ldrbvs	r7, [r2, #-1379]!	; 0xfffffa9d
    90f4:	49575320 	ldmdbmi	r7, {r5, r8, r9, ip, lr}^
    90f8:	0000000a 	andeq	r0, r0, sl

Disassembly of section .data:

000090fc <digits.3684>:
    90fc:	33323130 	teqcc	r2, #48, 2
    9100:	37363534 			; <UNDEFINED> instruction: 0x37363534
    9104:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    9108:	66656463 	strbtvs	r6, [r5], -r3, ror #8
    910c:	00000000 	andeq	r0, r0, r0

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003341 	andeq	r3, r0, r1, asr #6
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000029 	andeq	r0, r0, r9, lsr #32
  10:	4d524105 	ldfmie	f4, [r2, #-20]	; 0xffffffec
  14:	36373131 			; <UNDEFINED> instruction: 0x36373131
  18:	2d465a4a 	vstrcs	s11, [r6, #-296]	; 0xfffffed8
  1c:	07060053 	smlsdeq	r6, r3, r0, r0
  20:	01090108 	tsteq	r9, r8, lsl #2
  24:	01140412 	tsteq	r4, r2, lsl r4
  28:	03170115 	tsteq	r7, #1073741829	; 0x40000005
  2c:	011a0118 	tsteq	sl, r8, lsl r1
  30:	01440122 	cmpeq	r4, r2, lsr #2

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
  18:	00008ae4 	andeq	r8, r0, r4, ror #21
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
  a8:	e4020500 	str	r0, [r2], #-1280	; 0xfffffb00
  ac:	0300008a 	movweq	r0, #138	; 0x8a
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
 18c:	00008bf8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 190:	010a9303 	tsteq	sl, r3, lsl #6
 194:	01000202 	tsteq	r0, r2, lsl #4
 198:	Address 0x00000198 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000127 	andeq	r0, r0, r7, lsr #2
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000000 	andeq	r0, r0, r0
  10:	00008ae4 	andeq	r8, r0, r4, ror #21
  14:	00008bf8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
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
 138:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
 13c:	fc00008b 	stc2	0, cr0, [r0], {139}	; 0x8b
 140:	2f00008b 	svccs	0x0000008b
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
 23c:	6c2f6962 	stcvs	9, cr6, [pc], #-392	; bc <I_Bit+0x3c>
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
  10:	00008ae4 	andeq	r8, r0, r4, ror #21
  14:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	012b0002 	teqeq	fp, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008bf8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  34:	00000004 	andeq	r0, r0, r4
	...
