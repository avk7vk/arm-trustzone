CROSS_PREFIX= arm-none-eabi-

AS = $(CROSS_PREFIX)as
CC = $(CROSS_PREFIX)gcc
LD = $(CROSS_PREFIX)ld
OBJCOPY = $(CROSS_PREFIX)objcopy
OBJDUMP = $(CROSS_PREFIX)objdump

CFLAGS = -Wall -O2 -nostdlib -nostartfiles -ffreestanding 

all : kernel.img

entry.o : entry.S
	$(AS) entry.S -o entry.o

main.o : main.c io.h
	$(CC) $(CFLAGS) -c main.c -o main.o

uart.o : uart.c io.h
	$(CC) $(CFLAGS) -c uart.c -o uart.o

kernel.img : kernel.ld entry.o uart.o main.o 
	$(LD) entry.o uart.o main.o -T kernel.ld -o kernel.elf -L . -lgcc
	$(OBJDUMP) -D kernel.elf > kernel.asm
	$(OBJCOPY) kernel.elf -O binary kernel.img

clean :
	rm -f *.o *.elf *.asm *.img 
