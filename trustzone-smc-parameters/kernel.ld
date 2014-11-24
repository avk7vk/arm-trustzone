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
	. = 0x90000;
	RESV_AREA = .;
}

