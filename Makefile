SRCDIR = $(shell pwd)

TARGETS = $(foreach target,$(shell find src/targets/ -type d),$(subst src/targets/,, $(target)))

all: qemu_x86

overlay/configs/hjortron_%_defconfig: src/targets/%/defconfig src/hjortron_defconfig
	@mkdir -p overlay/configs
	cat $^ > $@

$(TARGETS): %: overlay/configs/hjortron_%_defconfig
	make -C buildroot hjortron_$@_defconfig BR2_EXTERNAL=$(SRCDIR)/overlay
	make -C buildroot BR2_EXTERNAL=$(SRCDIR)/overlay

clean:
	make -C buildroot $@

test: qemu_x86
	qemu-system-x86_64 \
		-soundhw hda \
		-kernel buildroot/output/images/bzImage \
		-append "root=/dev/sda vga=0x340" \
		-hda buildroot/output/images/rootfs.ext2