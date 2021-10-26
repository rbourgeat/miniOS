# +---------------------------------------------+
# | Original code by Raphaël Bourgeat for rbOS	|
# +---------------------------------------------+
# | > Kernel entry point that sets up			|
# | processor environment						|
# +---------------------------------------------+
# | $ i686-elf-as boot.s -o boot.o				|
# +---------------------------------------------+

# Multiboot header's constants
.set	ALIGN,		1<<0
.set	MEMINFO,	1<<1				# Memory map
.set 	FLAGS,		ALIGN | MEMINFO
.set	MAGIC,		0x1BADB002			# 'magic number'
.set	CHECKSUM,	-(MAGIC + FLAGS)	# Multiboot's proof

# Multiboot's definition
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

# Entry point function
.section .text
.global _start
.type _start, @function
_start:
		mov $stack_top, %esp	# Setup top of the stack (esp)
		call kernel_main
		cli						# Infinite loop
1:		hlt						# Wait halt instruction
		jmp 1b					

# For debugging
.size	_start, . - _start
