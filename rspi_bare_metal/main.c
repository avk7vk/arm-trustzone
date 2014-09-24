#include "io.h"
#include "uart.h"
#include <stdint.h>

void uprint(char *s)
{
	int i = 0;
	while(s[i])
	{
		uart_send(s[i]);
		i++;
	}
	uart_send('\r');
	uart_send('\n');
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

// Print to the console. only understands %d, %x, %p, %s.
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
			if(c == '\n')
				uart_send('\r');
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

// cache the input from user via UART
char buf[64];
// SWI Code
void swi_code ( unsigned int inst)
{
    cprintf("In SWI SYSCALL : %x\n", inst);
}
// first "C" function
int bootmain(void)
{
	// init uart to enable debugging with TTL
    uart_init();

	printint(1234, 10, 1);

	cprintf("\n Hello World %d %d\n", 1222, 3333);

	// print string
	uprint("This is the echo service:");

	// print char
	uart_send('$');

	char c;
	int i = 0;
	while(1)
	{
		c = uart_recv();
		uart_send(c);

		if(c == '\r')
		{
			buf[i] = '\0';
			i = 0;

			uart_send('\r');
			uart_send('\n');
			uart_send('#');
			uprint(buf);

			uart_send('$');
		}
		else
		{
			buf[i] = c;
			i++;
		}
	}

	cprintf("Before SWI Code!\n");
	asm volatile("swi #8");
	cprintf("After SWI Code!\n");
	while(1);
    
	return(0);
}
