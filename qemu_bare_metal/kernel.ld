ENTRY(vectors_start)
SECTIONS
{
	. = 0x10000;
	.entry . : { entry.o(.text) }
	.text : {*(.text)}
	.data : {*(.data)}
	.bss : {*(.bss)}
	. = ALIGN(8);
	. = . + 0x1000;
	stack_top = .;	
}
