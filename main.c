#include <stdint.h>

volatile unsigned char * const UART0_BASE = (unsigned char *)0x0101f1000;

// the version of print implemented in assembly
extern void as_print(char *str);

void copy_vectors(void) {
 extern uint32_t vectors_start;
 extern uint32_t vectors_end;
 uint32_t *vectors_src = &vectors_start;
 uint32_t *vectors_dst = (uint32_t *)0;
 
while(vectors_src < &vectors_end)
 *vectors_dst++ = *vectors_src++;
}

void print_string(const char *str)
{
	while(*str != '\0')
	{
		*UART0_BASE = *str;
		str++;
	}
}

void uart_send(unsigned int c)
{
	*UART0_BASE = c;
}

static void printint(int xx, int base, int sign)
{
	static char digits[] = "0123456789abcdef";
	char buf[16];
	int i;
	unsigned int x;

	if(sign && (sign = xx < 0))
		x = -xx;
	else
		x = xx;

	i = 0;
	do{
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);

	if(sign)
		buf[i++] = '-';

	while(--i >= 0)
		uart_send(buf[i]);
}

void cprintf(char *fmt, ...)
{
	int i, c;
	unsigned int *argp;
	char *s;

	argp = (unsigned int*)(void*)(&fmt + 1);
	for(i = 0; (c = fmt[i] & 0xff) != 0; i++)
	{
		if(c != '%')
		{
			uart_send(c);
			continue;
		}
		c = fmt[++i] & 0xff;
		if(c == 0)
			break;
		switch(c)
		{
		case 'd':
			printint(*argp++, 10, 1);
			break;
		case 'x':
		case 'p':
			printint(*argp++, 16, 0);
			break;
		case 's':
			if((s = (char*)*argp++) == 0)
				s = "(null)";
			for(; *s; s++)
				uart_send(*s);
			break;
		case '%':
			uart_send('%');
			break;
		default:
			// Print unknown % sequence to draw attention.
			uart_send('%');
			uart_send(c);
			break;
		}
	}
}
void swi_code ( unsigned int inst)
{
    print_string("In SWI_CODE\n");
    cprintf("SWI SYSCALL : %x\n", inst);
}
void bootmain()
{
	print_string("In Main\n");
	cprintf("Before SWI\n");
	asm volatile("swi #4");
	cprintf("After SWI\n");
}
