# 💾 rbOS

## 🔌 Build

- ```i686-elf-as boot.s -o boot.o```
- ```i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra```
- ```i686-elf-gcc -T linker.ld -o rbOS.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc```

## 🐧 Linux

Use grub with `grub.cfg`.

```
mkdir -p isodir/boot/grub

cp rbOS.bin isodir/boot/myos.bin

cp grub.cfg isodir/boot/grub/grub.cfg

grub-mkrescue -o rbOS.iso isodir
```


##  Mac

Use bchunk with `rbOS.cue` for creating iso file.

```bchunk rbOS.bin rbOS.cue rbOS.iso```

## 🙏🏻 Thanks to

- [OSdev](https://wiki.osdev.org/)