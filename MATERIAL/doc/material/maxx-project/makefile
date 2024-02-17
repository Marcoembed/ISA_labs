RISCV_PATH=/eda/pulp/riscv/bin
ARCH=riscv32-unknown-elf

CC=$(RISCV_PATH)/$(ARCH)-gcc
OBJCOPY=$(RISCV_PATH)/$(ARCH)-objcopy
OBJDUMP=$(RISCV_PATH)/$(ARCH)-objdump

LINKER_SCRIPT=riscv32-isa.ld
CRT0=crt0.s
OPTS=-march=rv32i -mabi=ilp32 -g -ffreestanding -O3 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,$(LINKER_SCRIPT) $(CRT0)

clean ::
	rm -f main main.hex data.hex

all :: main.hex data.hex

main :: main.c maxx.c
	$(CC) $(OPTS) -o $@ $^

main.hex :: main
	$(OBJDUMP) -d $< > $@

data.hex :: main
	$(OBJDUMP) -j .data -j .sdata -j .bss -D $< > $@
