
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	ea07dffe 	b	200000 <start_code>
	...

00200000 <start_code>:
  200000:	e3a0d302 	mov	sp, #134217728	; 0x8000000
  200004:	eb0000ff 	bl	200408 <bootmain>

00200008 <halt>:
  200008:	eafffffe 	b	200008 <halt>

0020000c <PUT32>:
  20000c:	e5801000 	str	r1, [r0]
  200010:	e12fff1e 	bx	lr

00200014 <PUT16>:
  200014:	e1c010b0 	strh	r1, [r0]
  200018:	e12fff1e 	bx	lr

0020001c <PUT8>:
  20001c:	e5c01000 	strb	r1, [r0]
  200020:	e12fff1e 	bx	lr

00200024 <GET32>:
  200024:	e5900000 	ldr	r0, [r0]
  200028:	e12fff1e 	bx	lr

0020002c <GETPC>:
  20002c:	e1a0000e 	mov	r0, lr
  200030:	e12fff1e 	bx	lr

00200034 <BRANCHTO>:
  200034:	e12fff10 	bx	r0

00200038 <dummy>:
  200038:	e12fff1e 	bx	lr

0020003c <uart_lcr>:
  20003c:	e92d4008 	push	{r3, lr}
  200040:	e59f0008 	ldr	r0, [pc, #8]	; 200050 <uart_lcr+0x14>
  200044:	ebfffff6 	bl	200024 <GET32>
  200048:	e8bd4008 	pop	{r3, lr}
  20004c:	e12fff1e 	bx	lr
  200050:	20215054 	eorcs	r5, r1, r4, asr r0

00200054 <uart_recv>:
  200054:	e92d4008 	push	{r3, lr}
  200058:	e59f001c 	ldr	r0, [pc, #28]	; 20007c <uart_recv+0x28>
  20005c:	ebfffff0 	bl	200024 <GET32>
  200060:	e3100001 	tst	r0, #1
  200064:	0afffffb 	beq	200058 <uart_recv+0x4>
  200068:	e59f0010 	ldr	r0, [pc, #16]	; 200080 <uart_recv+0x2c>
  20006c:	ebffffec 	bl	200024 <GET32>
  200070:	e8bd4008 	pop	{r3, lr}
  200074:	e20000ff 	and	r0, r0, #255	; 0xff
  200078:	e12fff1e 	bx	lr
  20007c:	20215054 	eorcs	r5, r1, r4, asr r0
  200080:	20215040 	eorcs	r5, r1, r0, asr #32

00200084 <uart_send>:
  200084:	e92d4010 	push	{r4, lr}
  200088:	e1a04000 	mov	r4, r0
  20008c:	e59f001c 	ldr	r0, [pc, #28]	; 2000b0 <uart_send+0x2c>
  200090:	ebffffe3 	bl	200024 <GET32>
  200094:	e3100020 	tst	r0, #32
  200098:	0afffffb 	beq	20008c <uart_send+0x8>
  20009c:	e1a01004 	mov	r1, r4
  2000a0:	e59f000c 	ldr	r0, [pc, #12]	; 2000b4 <uart_send+0x30>
  2000a4:	ebffffd8 	bl	20000c <PUT32>
  2000a8:	e8bd4010 	pop	{r4, lr}
  2000ac:	e12fff1e 	bx	lr
  2000b0:	20215054 	eorcs	r5, r1, r4, asr r0
  2000b4:	20215040 	eorcs	r5, r1, r0, asr #32

002000b8 <uart_flush>:
  2000b8:	e92d4008 	push	{r3, lr}
  2000bc:	e59f0010 	ldr	r0, [pc, #16]	; 2000d4 <uart_flush+0x1c>
  2000c0:	ebffffd7 	bl	200024 <GET32>
  2000c4:	e3100c01 	tst	r0, #256	; 0x100
  2000c8:	1afffffb 	bne	2000bc <uart_flush+0x4>
  2000cc:	e8bd4008 	pop	{r3, lr}
  2000d0:	e12fff1e 	bx	lr
  2000d4:	20215054 	eorcs	r5, r1, r4, asr r0

002000d8 <uart_init>:
  2000d8:	e92d4010 	push	{r4, lr}
  2000dc:	e59f00d8 	ldr	r0, [pc, #216]	; 2001bc <uart_init+0xe4>
  2000e0:	e3a01001 	mov	r1, #1
  2000e4:	ebffffc8 	bl	20000c <PUT32>
  2000e8:	e59f00d0 	ldr	r0, [pc, #208]	; 2001c0 <uart_init+0xe8>
  2000ec:	e3a01000 	mov	r1, #0
  2000f0:	ebffffc5 	bl	20000c <PUT32>
  2000f4:	e59f00c8 	ldr	r0, [pc, #200]	; 2001c4 <uart_init+0xec>
  2000f8:	e3a01000 	mov	r1, #0
  2000fc:	ebffffc2 	bl	20000c <PUT32>
  200100:	e59f00c0 	ldr	r0, [pc, #192]	; 2001c8 <uart_init+0xf0>
  200104:	e3a01003 	mov	r1, #3
  200108:	ebffffbf 	bl	20000c <PUT32>
  20010c:	e59f00b8 	ldr	r0, [pc, #184]	; 2001cc <uart_init+0xf4>
  200110:	e3a01000 	mov	r1, #0
  200114:	ebffffbc 	bl	20000c <PUT32>
  200118:	e59f00a0 	ldr	r0, [pc, #160]	; 2001c0 <uart_init+0xe8>
  20011c:	e3a01000 	mov	r1, #0
  200120:	ebffffb9 	bl	20000c <PUT32>
  200124:	e59f00a4 	ldr	r0, [pc, #164]	; 2001d0 <uart_init+0xf8>
  200128:	e3a010c6 	mov	r1, #198	; 0xc6
  20012c:	ebffffb6 	bl	20000c <PUT32>
  200130:	e59f109c 	ldr	r1, [pc, #156]	; 2001d4 <uart_init+0xfc>
  200134:	e59f009c 	ldr	r0, [pc, #156]	; 2001d8 <uart_init+0x100>
  200138:	ebffffb3 	bl	20000c <PUT32>
  20013c:	e59f0098 	ldr	r0, [pc, #152]	; 2001dc <uart_init+0x104>
  200140:	ebffffb7 	bl	200024 <GET32>
  200144:	e3c01a3f 	bic	r1, r0, #258048	; 0x3f000
  200148:	e3811a12 	orr	r1, r1, #73728	; 0x12000
  20014c:	e59f0088 	ldr	r0, [pc, #136]	; 2001dc <uart_init+0x104>
  200150:	ebffffad 	bl	20000c <PUT32>
  200154:	e59f0084 	ldr	r0, [pc, #132]	; 2001e0 <uart_init+0x108>
  200158:	e3a01000 	mov	r1, #0
  20015c:	ebffffaa 	bl	20000c <PUT32>
  200160:	e3a04000 	mov	r4, #0
  200164:	e1a00004 	mov	r0, r4
  200168:	e2844001 	add	r4, r4, #1
  20016c:	ebffffb1 	bl	200038 <dummy>
  200170:	e3540096 	cmp	r4, #150	; 0x96
  200174:	1afffffa 	bne	200164 <uart_init+0x8c>
  200178:	e59f0064 	ldr	r0, [pc, #100]	; 2001e4 <uart_init+0x10c>
  20017c:	e3a01903 	mov	r1, #49152	; 0xc000
  200180:	ebffffa1 	bl	20000c <PUT32>
  200184:	e3a04000 	mov	r4, #0
  200188:	e1a00004 	mov	r0, r4
  20018c:	e2844001 	add	r4, r4, #1
  200190:	ebffffa8 	bl	200038 <dummy>
  200194:	e3540096 	cmp	r4, #150	; 0x96
  200198:	1afffffa 	bne	200188 <uart_init+0xb0>
  20019c:	e59f0040 	ldr	r0, [pc, #64]	; 2001e4 <uart_init+0x10c>
  2001a0:	e3a01000 	mov	r1, #0
  2001a4:	ebffff98 	bl	20000c <PUT32>
  2001a8:	e59f0014 	ldr	r0, [pc, #20]	; 2001c4 <uart_init+0xec>
  2001ac:	e3a01003 	mov	r1, #3
  2001b0:	ebffff95 	bl	20000c <PUT32>
  2001b4:	e8bd4010 	pop	{r4, lr}
  2001b8:	e12fff1e 	bx	lr
  2001bc:	20215004 	eorcs	r5, r1, r4
  2001c0:	20215044 	eorcs	r5, r1, r4, asr #32
  2001c4:	20215060 	eorcs	r5, r1, r0, rrx
  2001c8:	2021504c 	eorcs	r5, r1, ip, asr #32
  2001cc:	20215050 	eorcs	r5, r1, r0, asr r0
  2001d0:	20215048 	eorcs	r5, r1, r8, asr #32
  2001d4:	0000010e 	andeq	r0, r0, lr, lsl #2
  2001d8:	20215068 	eorcs	r5, r1, r8, rrx
  2001dc:	20200004 	eorcs	r0, r0, r4
  2001e0:	20200094 	mlacs	r0, r4, r0, r0
  2001e4:	20200098 	mlacs	r0, r8, r0, r0

002001e8 <printint>:
  2001e8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
  2001ec:	e3520000 	cmp	r2, #0
  2001f0:	e24dd010 	sub	sp, sp, #16
  2001f4:	e1a07001 	mov	r7, r1
  2001f8:	0a000023 	beq	20028c <printint+0xa4>
  2001fc:	e3500000 	cmp	r0, #0
  200200:	b2605000 	rsblt	r5, r0, #0
  200204:	b3a0a001 	movlt	sl, #1
  200208:	aa00001f 	bge	20028c <printint+0xa4>
  20020c:	e59f9084 	ldr	r9, [pc, #132]	; 200298 <printint+0xb0>
  200210:	e24d6001 	sub	r6, sp, #1
  200214:	e3a08000 	mov	r8, #0
  200218:	ea000000 	b	200220 <printint+0x38>
  20021c:	e1a08004 	mov	r8, r4
  200220:	e1a00005 	mov	r0, r5
  200224:	e1a01007 	mov	r1, r7
  200228:	eb0000df 	bl	2005ac <__aeabi_uidivmod>
  20022c:	e7d93001 	ldrb	r3, [r9, r1]
  200230:	e1a00005 	mov	r0, r5
  200234:	e1a01007 	mov	r1, r7
  200238:	e5e63001 	strb	r3, [r6, #1]!
  20023c:	eb00009d 	bl	2004b8 <__aeabi_uidiv>
  200240:	e2505000 	subs	r5, r0, #0
  200244:	e2884001 	add	r4, r8, #1
  200248:	1afffff3 	bne	20021c <printint+0x34>
  20024c:	e35a0000 	cmp	sl, #0
  200250:	128d2010 	addne	r2, sp, #16
  200254:	e1a03004 	mov	r3, r4
  200258:	10823004 	addne	r3, r2, r4
  20025c:	13a0202d 	movne	r2, #45	; 0x2d
  200260:	12884002 	addne	r4, r8, #2
  200264:	15432010 	strbne	r2, [r3, #-16]
  200268:	e2444001 	sub	r4, r4, #1
  20026c:	e7dd0004 	ldrb	r0, [sp, r4]
  200270:	e2444001 	sub	r4, r4, #1
  200274:	ebffff82 	bl	200084 <uart_send>
  200278:	e3740001 	cmn	r4, #1
  20027c:	1afffffa 	bne	20026c <printint+0x84>
  200280:	e28dd010 	add	sp, sp, #16
  200284:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
  200288:	e12fff1e 	bx	lr
  20028c:	e1a05000 	mov	r5, r0
  200290:	e3a0a000 	mov	sl, #0
  200294:	eaffffdc 	b	20020c <printint+0x24>
  200298:	002005d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>

0020029c <uprint>:
  20029c:	e92d4010 	push	{r4, lr}
  2002a0:	e1a04000 	mov	r4, r0
  2002a4:	e5d00000 	ldrb	r0, [r0]
  2002a8:	e3500000 	cmp	r0, #0
  2002ac:	0a000003 	beq	2002c0 <uprint+0x24>
  2002b0:	ebffff73 	bl	200084 <uart_send>
  2002b4:	e5f40001 	ldrb	r0, [r4, #1]!
  2002b8:	e3500000 	cmp	r0, #0
  2002bc:	1afffffb 	bne	2002b0 <uprint+0x14>
  2002c0:	e3a0000d 	mov	r0, #13
  2002c4:	ebffff6e 	bl	200084 <uart_send>
  2002c8:	e3a0000a 	mov	r0, #10
  2002cc:	ebffff6c 	bl	200084 <uart_send>
  2002d0:	e8bd4010 	pop	{r4, lr}
  2002d4:	e12fff1e 	bx	lr

002002d8 <cprintf>:
  2002d8:	e92d000f 	push	{r0, r1, r2, r3}
  2002dc:	e92d43f8 	push	{r3, r4, r5, r6, r7, r8, r9, lr}
  2002e0:	e59d6020 	ldr	r6, [sp, #32]
  2002e4:	e5d64000 	ldrb	r4, [r6]
  2002e8:	e3540000 	cmp	r4, #0
  2002ec:	0a000022 	beq	20037c <cprintf+0xa4>
  2002f0:	e59f910c 	ldr	r9, [pc, #268]	; 200404 <cprintf+0x12c>
  2002f4:	e28d8024 	add	r8, sp, #36	; 0x24
  2002f8:	e3a05000 	mov	r5, #0
  2002fc:	ea000007 	b	200320 <cprintf+0x48>
  200300:	e354000a 	cmp	r4, #10
  200304:	0a00002f 	beq	2003c8 <cprintf+0xf0>
  200308:	e1a00004 	mov	r0, r4
  20030c:	ebffff5c 	bl	200084 <uart_send>
  200310:	e2855001 	add	r5, r5, #1
  200314:	e7d64005 	ldrb	r4, [r6, r5]
  200318:	e3540000 	cmp	r4, #0
  20031c:	0a000016 	beq	20037c <cprintf+0xa4>
  200320:	e3540025 	cmp	r4, #37	; 0x25
  200324:	1afffff5 	bne	200300 <cprintf+0x28>
  200328:	e2855001 	add	r5, r5, #1
  20032c:	e7d67005 	ldrb	r7, [r6, r5]
  200330:	e3570000 	cmp	r7, #0
  200334:	0a000010 	beq	20037c <cprintf+0xa4>
  200338:	e3570070 	cmp	r7, #112	; 0x70
  20033c:	0a000015 	beq	200398 <cprintf+0xc0>
  200340:	8a000010 	bhi	200388 <cprintf+0xb0>
  200344:	e3570025 	cmp	r7, #37	; 0x25
  200348:	0affffee 	beq	200308 <cprintf+0x30>
  20034c:	e3570064 	cmp	r7, #100	; 0x64
  200350:	1a000017 	bne	2003b4 <cprintf+0xdc>
  200354:	e2883004 	add	r3, r8, #4
  200358:	e5980000 	ldr	r0, [r8]
  20035c:	e3a0100a 	mov	r1, #10
  200360:	e3a02001 	mov	r2, #1
  200364:	e2855001 	add	r5, r5, #1
  200368:	e1a08003 	mov	r8, r3
  20036c:	ebffff9d 	bl	2001e8 <printint>
  200370:	e7d64005 	ldrb	r4, [r6, r5]
  200374:	e3540000 	cmp	r4, #0
  200378:	1affffe8 	bne	200320 <cprintf+0x48>
  20037c:	e8bd43f8 	pop	{r3, r4, r5, r6, r7, r8, r9, lr}
  200380:	e28dd010 	add	sp, sp, #16
  200384:	e12fff1e 	bx	lr
  200388:	e3570073 	cmp	r7, #115	; 0x73
  20038c:	0a000010 	beq	2003d4 <cprintf+0xfc>
  200390:	e3570078 	cmp	r7, #120	; 0x78
  200394:	1a000006 	bne	2003b4 <cprintf+0xdc>
  200398:	e2883004 	add	r3, r8, #4
  20039c:	e5980000 	ldr	r0, [r8]
  2003a0:	e3a01010 	mov	r1, #16
  2003a4:	e3a02000 	mov	r2, #0
  2003a8:	e1a08003 	mov	r8, r3
  2003ac:	ebffff8d 	bl	2001e8 <printint>
  2003b0:	eaffffd6 	b	200310 <cprintf+0x38>
  2003b4:	e3a00025 	mov	r0, #37	; 0x25
  2003b8:	ebffff31 	bl	200084 <uart_send>
  2003bc:	e1a00007 	mov	r0, r7
  2003c0:	ebffff2f 	bl	200084 <uart_send>
  2003c4:	eaffffd1 	b	200310 <cprintf+0x38>
  2003c8:	e3a0000d 	mov	r0, #13
  2003cc:	ebffff2c 	bl	200084 <uart_send>
  2003d0:	eaffffcc 	b	200308 <cprintf+0x30>
  2003d4:	e5984000 	ldr	r4, [r8]
  2003d8:	e3540000 	cmp	r4, #0
  2003dc:	01a04009 	moveq	r4, r9
  2003e0:	e5d40000 	ldrb	r0, [r4]
  2003e4:	e3500000 	cmp	r0, #0
  2003e8:	e2888004 	add	r8, r8, #4
  2003ec:	0affffc7 	beq	200310 <cprintf+0x38>
  2003f0:	ebffff23 	bl	200084 <uart_send>
  2003f4:	e5f40001 	ldrb	r0, [r4, #1]!
  2003f8:	e3500000 	cmp	r0, #0
  2003fc:	1afffffb 	bne	2003f0 <cprintf+0x118>
  200400:	eaffffc2 	b	200310 <cprintf+0x38>
  200404:	002005e4 	eoreq	r0, r0, r4, ror #11

00200408 <bootmain>:
  200408:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
  20040c:	ebffff31 	bl	2000d8 <uart_init>
  200410:	e59f0088 	ldr	r0, [pc, #136]	; 2004a0 <bootmain+0x98>
  200414:	e3a0100a 	mov	r1, #10
  200418:	e3a02001 	mov	r2, #1
  20041c:	ebffff71 	bl	2001e8 <printint>
  200420:	e59f107c 	ldr	r1, [pc, #124]	; 2004a4 <bootmain+0x9c>
  200424:	e59f207c 	ldr	r2, [pc, #124]	; 2004a8 <bootmain+0xa0>
  200428:	e59f007c 	ldr	r0, [pc, #124]	; 2004ac <bootmain+0xa4>
  20042c:	ebffffa9 	bl	2002d8 <cprintf>
  200430:	e59f0078 	ldr	r0, [pc, #120]	; 2004b0 <bootmain+0xa8>
  200434:	ebffff98 	bl	20029c <uprint>
  200438:	e3a00024 	mov	r0, #36	; 0x24
  20043c:	ebffff10 	bl	200084 <uart_send>
  200440:	e3a05000 	mov	r5, #0
  200444:	e59f6068 	ldr	r6, [pc, #104]	; 2004b4 <bootmain+0xac>
  200448:	e1a07005 	mov	r7, r5
  20044c:	ebffff00 	bl	200054 <uart_recv>
  200450:	e20040ff 	and	r4, r0, #255	; 0xff
  200454:	e1a00004 	mov	r0, r4
  200458:	ebffff09 	bl	200084 <uart_send>
  20045c:	e354000d 	cmp	r4, #13
  200460:	17c64005 	strbne	r4, [r6, r5]
  200464:	12855001 	addne	r5, r5, #1
  200468:	1afffff7 	bne	20044c <bootmain+0x44>
  20046c:	e1a00004 	mov	r0, r4
  200470:	e7c67005 	strb	r7, [r6, r5]
  200474:	ebffff02 	bl	200084 <uart_send>
  200478:	e3a0000a 	mov	r0, #10
  20047c:	ebffff00 	bl	200084 <uart_send>
  200480:	e3a00023 	mov	r0, #35	; 0x23
  200484:	ebfffefe 	bl	200084 <uart_send>
  200488:	e59f0024 	ldr	r0, [pc, #36]	; 2004b4 <bootmain+0xac>
  20048c:	ebffff82 	bl	20029c <uprint>
  200490:	e3a00024 	mov	r0, #36	; 0x24
  200494:	ebfffefa 	bl	200084 <uart_send>
  200498:	e3a05000 	mov	r5, #0
  20049c:	eaffffea 	b	20044c <bootmain+0x44>
  2004a0:	000004d2 	ldrdeq	r0, [r0], -r2
  2004a4:	000004c6 	andeq	r0, r0, r6, asr #9
  2004a8:	00000d05 	andeq	r0, r0, r5, lsl #26
  2004ac:	002005ec 	eoreq	r0, r0, ip, ror #11
  2004b0:	00200604 	eoreq	r0, r0, r4, lsl #12
  2004b4:	00200620 	eoreq	r0, r0, r0, lsr #12

002004b8 <__aeabi_uidiv>:
  2004b8:	e2512001 	subs	r2, r1, #1
  2004bc:	012fff1e 	bxeq	lr
  2004c0:	3a000036 	bcc	2005a0 <__aeabi_uidiv+0xe8>
  2004c4:	e1500001 	cmp	r0, r1
  2004c8:	9a000022 	bls	200558 <__aeabi_uidiv+0xa0>
  2004cc:	e1110002 	tst	r1, r2
  2004d0:	0a000023 	beq	200564 <__aeabi_uidiv+0xac>
  2004d4:	e311020e 	tst	r1, #-536870912	; 0xe0000000
  2004d8:	01a01181 	lsleq	r1, r1, #3
  2004dc:	03a03008 	moveq	r3, #8
  2004e0:	13a03001 	movne	r3, #1
  2004e4:	e3510201 	cmp	r1, #268435456	; 0x10000000
  2004e8:	31510000 	cmpcc	r1, r0
  2004ec:	31a01201 	lslcc	r1, r1, #4
  2004f0:	31a03203 	lslcc	r3, r3, #4
  2004f4:	3afffffa 	bcc	2004e4 <__aeabi_uidiv+0x2c>
  2004f8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  2004fc:	31510000 	cmpcc	r1, r0
  200500:	31a01081 	lslcc	r1, r1, #1
  200504:	31a03083 	lslcc	r3, r3, #1
  200508:	3afffffa 	bcc	2004f8 <__aeabi_uidiv+0x40>
  20050c:	e3a02000 	mov	r2, #0
  200510:	e1500001 	cmp	r0, r1
  200514:	20400001 	subcs	r0, r0, r1
  200518:	21822003 	orrcs	r2, r2, r3
  20051c:	e15000a1 	cmp	r0, r1, lsr #1
  200520:	204000a1 	subcs	r0, r0, r1, lsr #1
  200524:	218220a3 	orrcs	r2, r2, r3, lsr #1
  200528:	e1500121 	cmp	r0, r1, lsr #2
  20052c:	20400121 	subcs	r0, r0, r1, lsr #2
  200530:	21822123 	orrcs	r2, r2, r3, lsr #2
  200534:	e15001a1 	cmp	r0, r1, lsr #3
  200538:	204001a1 	subcs	r0, r0, r1, lsr #3
  20053c:	218221a3 	orrcs	r2, r2, r3, lsr #3
  200540:	e3500000 	cmp	r0, #0
  200544:	11b03223 	lsrsne	r3, r3, #4
  200548:	11a01221 	lsrne	r1, r1, #4
  20054c:	1affffef 	bne	200510 <__aeabi_uidiv+0x58>
  200550:	e1a00002 	mov	r0, r2
  200554:	e12fff1e 	bx	lr
  200558:	03a00001 	moveq	r0, #1
  20055c:	13a00000 	movne	r0, #0
  200560:	e12fff1e 	bx	lr
  200564:	e3510801 	cmp	r1, #65536	; 0x10000
  200568:	21a01821 	lsrcs	r1, r1, #16
  20056c:	23a02010 	movcs	r2, #16
  200570:	33a02000 	movcc	r2, #0
  200574:	e3510c01 	cmp	r1, #256	; 0x100
  200578:	21a01421 	lsrcs	r1, r1, #8
  20057c:	22822008 	addcs	r2, r2, #8
  200580:	e3510010 	cmp	r1, #16
  200584:	21a01221 	lsrcs	r1, r1, #4
  200588:	22822004 	addcs	r2, r2, #4
  20058c:	e3510004 	cmp	r1, #4
  200590:	82822003 	addhi	r2, r2, #3
  200594:	908220a1 	addls	r2, r2, r1, lsr #1
  200598:	e1a00230 	lsr	r0, r0, r2
  20059c:	e12fff1e 	bx	lr
  2005a0:	e3500000 	cmp	r0, #0
  2005a4:	13e00000 	mvnne	r0, #0
  2005a8:	ea000007 	b	2005cc <__aeabi_idiv0>

002005ac <__aeabi_uidivmod>:
  2005ac:	e3510000 	cmp	r1, #0
  2005b0:	0afffffa 	beq	2005a0 <__aeabi_uidiv+0xe8>
  2005b4:	e92d4003 	push	{r0, r1, lr}
  2005b8:	ebffffbe 	bl	2004b8 <__aeabi_uidiv>
  2005bc:	e8bd4006 	pop	{r1, r2, lr}
  2005c0:	e0030092 	mul	r3, r2, r0
  2005c4:	e0411003 	sub	r1, r1, r3
  2005c8:	e12fff1e 	bx	lr

002005cc <__aeabi_idiv0>:
  2005cc:	e12fff1e 	bx	lr

Disassembly of section .rodata:

002005d0 <digits.3649>:
  2005d0:	33323130 	teqcc	r2, #48, 2
  2005d4:	37363534 			; <UNDEFINED> instruction: 0x37363534
  2005d8:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
  2005dc:	66656463 	strbtvs	r6, [r5], -r3, ror #8
  2005e0:	00000000 	andeq	r0, r0, r0

Disassembly of section .rodata.str1.4:

002005e4 <.rodata.str1.4>:
  2005e4:	6c756e28 	ldclvs	14, cr6, [r5], #-160	; 0xffffff60
  2005e8:	0000296c 	andeq	r2, r0, ip, ror #18
  2005ec:	6548200a 	strbvs	r2, [r8, #-10]
  2005f0:	206f6c6c 	rsbcs	r6, pc, ip, ror #24
  2005f4:	6c726f57 	ldclvs	15, cr6, [r2], #-348	; 0xfffffea4
  2005f8:	64252064 	strtvs	r2, [r5], #-100	; 0xffffff9c
  2005fc:	0a642520 	beq	1b09a84 <buf+0x1909464>
  200600:	00000000 	andeq	r0, r0, r0
  200604:	73696854 	cmnvc	r9, #84, 16	; 0x540000
  200608:	20736920 	rsbscs	r6, r3, r0, lsr #18
  20060c:	20656874 	rsbcs	r6, r5, r4, ror r8
  200610:	6f686365 	svcvs	0x00686365
  200614:	72657320 	rsbvc	r7, r5, #32, 6	; 0x80000000
  200618:	65636976 	strbvs	r6, [r3, #-2422]!	; 0xfffff68a
  20061c:	0000003a 	andeq	r0, r0, sl, lsr r0

Disassembly of section .bss:

00200620 <buf>:
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
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
   0:	3a434347 	bcc	10d0d24 <buf+0xed0704>
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
  18:	002004b8 	strhteq	r0, [r0], -r8
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
  a8:	b8020500 	stmdalt	r2, {r8, sl}
  ac:	03002004 	movweq	r2, #4
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
 108:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff8c <buf+0xffdff96c>
 10c:	6f706361 	svcvs	0x00706361
 110:	2f737472 	svccs	0x00737472
 114:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 118:	6f5f2f64 	svcvs	0x005f2f64
 11c:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff64 <buf+0xffdff944>
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
 18c:	002005cc 	eoreq	r0, r0, ip, asr #11
 190:	010a9303 	tsteq	sl, r3, lsl #6
 194:	01000202 	tsteq	r0, r2, lsl #4
 198:	Address 0x00000198 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000127 	andeq	r0, r0, r7, lsr #2
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000000 	andeq	r0, r0, r0
  10:	002004b8 	strhteq	r0, [r0], -r8
  14:	002005cc 	eoreq	r0, r0, ip, asr #11
  18:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  1c:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  20:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  24:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; fffffea8 <buf+0xffdff888>
  28:	6f706361 	svcvs	0x00706361
  2c:	2f737472 	svccs	0x00737472
  30:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  34:	6f5f2f64 	svcvs	0x005f2f64
  38:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; fffffe80 <buf+0xffdff860>
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
  ac:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff30 <buf+0xffdff910>
  b0:	6f706361 	svcvs	0x00706361
  b4:	2f737472 	svccs	0x00737472
  b8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  bc:	6f5f2f64 	svcvs	0x005f2f64
  c0:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff08 <buf+0xffdff8e8>
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
 138:	cc000000 	stcgt	0, cr0, [r0], {-0}
 13c:	d0002005 	andle	r2, r0, r5
 140:	2f002005 	svccs	0x00002005
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
 1bc:	6c2f6d72 	stcvs	13, cr6, [pc], #-456	; fffffffc <buf+0xffdff9dc>
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
 23c:	6c2f6962 	stcvs	9, cr6, [pc], #-392	; bc <_start-0x7f44>
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
   8:	1b080301 	blne	200c14 <buf+0x5f4>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	10001101 	andne	r1, r0, r1, lsl #2
  18:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
  1c:	1b080301 	blne	200c28 <buf+0x608>
  20:	13082508 	movwne	r2, #34056	; 0x8508
  24:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	002004b8 	strhteq	r0, [r0], -r8
  14:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	012b0002 	teqeq	fp, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	002005cc 	eoreq	r0, r0, ip, asr #11
  34:	00000004 	andeq	r0, r0, r4
	...
