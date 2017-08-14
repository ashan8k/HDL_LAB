SECTIONS {
	. = 0x0000;
	.text	: { *(.text) }
	. = 0x0200;
	.data	: { *(.data) }
	.bss	: { *(.bss) }
}