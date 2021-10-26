/* +--------------------------------------------+
** | Original code by Raphaël Bourgeat for rbOS |
** +--------------------------------------------+
** | > Linking boot.s & kernel.c files			|
** +--------------------------------------------+-----------------------------------------------+
** | $ i686-elf-gcc -T linker.ld -o rbOS.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc |
** +--------------------------------------------------------------------------------------------+
*/

ENTRY(_start)

SECTIONS
{
    /* Setup place of kernel at 1 Mib */
    . = 1M;

    .text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

    /* Read-only */
    .rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}

    /* Read&Write-only initialized*/
    .data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}

    /* Read&Write-only unitialized*/
    .bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}
}
