c_sources = lib.c main.c
objs = $(patsubst %.c, %.o, $(c_sources))

# RISCV_PREFIX = riscv32-unknown-elf-
RISCV_PREFIX =
RM = rm -f
CC = $(RISCV_PREFIX)gcc
OBJDUMP = $(RISCV_PREFIX)objdump
OBJCOPY = $(RISCV_PREFIX)objcopy

#LDFLAGS = -static -nostdlib -nostartfiles
LDFLAGS = -static

all: prog.elf prog.dump prog.bin

prog.dump: prog.elf
	$(OBJDUMP) -x -s -w -d $^ > $@

prog.bin: prog.elf
	$(OBJCOPY) -O binary $^ $@

prog.elf: $(objs)
	$(CC) $^ -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $<

clean:
	$(RM) *.o
	$(RM) *.out
	$(RM) *.elf
	$(RM) *.dump
	$(RM) *.hex
	$(RM) *.dump
	$(RM) *.bin
