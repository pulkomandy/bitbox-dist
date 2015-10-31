export BITBOX=$(shell pwd)/sdk

all:
	mkdir -p out
	for i in * ; do echo -e "\x1B[41m   $$i\n\x1B[0m" ; make -C $$i && cp $$i/*.bin out/ ; done ;

haikudeps:
	pkgman install arm_none_eabi_gcc_x86 arm_none_eabi_newlib_x86 arm_none_eabi_binutils_x86 \
		libsdl_x86_devel ncurses_x86_devel mpc_x86 colormake
	echo "Remember to run \"setarch x86\" before compiling!"
