/*MEMORY
{
    ram : ORIGIN = 0x8000, LENGTH = 0x1000000
}

SECTIONS
{
    .text : { *(.text*) } > ram
    .bss : { *(.bss*) } > ram
	
	. = 0x80000;
	.stack :
	{
		STACK_ADR = .;
	}
}*/

ENTRY(_start)

SECTIONS
{
	. = 0x8000;
	.text : { *(.text) }
	
	. = ALIGN(4);
	.data : { *(.data) }
	
	. = ALIGN(4);
	__bss_start = .;
	.bss : { *(.bss*) }
	__bss_end = .;

	. = 0x80000;
	.stack :
	{
		STACK_ADR = .;
	}
}

