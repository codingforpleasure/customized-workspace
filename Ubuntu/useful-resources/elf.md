# ELF

## What is ELF?

* ELF is a standard binary file format for Unix/Linux.

* The reason behind that decision was the design of ELF - flexibility, extensibilty and cross platform support for different endian formats and address sizes.

* ELF's deisgn is not limited to specific processor, instruction set, and hardware architecture.


## hexdump of binary file

```bash
hd /usr/bin/touch | head -5
```

## readelf

### Display the header of an ELF file

```bash
readelf -h /usr/bin/touch
```

### Display information about the program headers

```bash
readelf -l /usr/bin/touch
```

