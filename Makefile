export BITBOX=$(shell pwd)/sdk

dist:
	mkdir -p out
	for i in * ; do \
		echo -e "\x1B[43m   $$i\n\x1B[0m" ;\
		make -C $$i ; \
		k=$$? ; r="$$r$$i\t" ;\
		if [ $$k -ne 0 ] ; then \
			r="$$r\x1B[41mFAIL\x1B[0m\n" ; \
		else\
			r="$$r\x1B[42m OK!\x1B[0m\n" ; \
		fi ;\
		cp $$i/*.bin out/ ;\
		done ; echo -e "Build status:\n$$r"

haikudeps:
	pkgman install arm_none_eabi_gcc_x86 arm_none_eabi_newlib_x86 arm_none_eabi_binutils_x86 \
		libsdl_x86_devel ncurses_x86_devel mpc_x86 make python_imaging gws
	echo "Remember to run \"setarch x86\" before compiling!"

update:
	gws fetch
