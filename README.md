pil21-win
=========

This is a build of PicoLisp on Windows using MSYS2 - `bin\picolisp.exe`

## notes

* Normally incuded with the PicoLisp distribution is a prebuilt picolisp binary required for building, however, since Windows is not supported, there is no windows executable and the build will fail when attempting to run pil to produce the `*.ll` files. The `base.ll` file in this repo was built as normal on Linux with the modified codebase and no `libreadline` (see next bullet), and included so the picolisp binary is not required for bootstrapping.

* There are issues with dynamic linking `libreadline` - it requires another library called `libtinfo` (included with ncurses?).

* After disabling `libreadline`, it compiles dynamically-linked, however, MSYS2 throws an "invalid relocation" error on startup. After some googling, this appears to be an issue with clang or cygwin - possibly the memory model of the prebuilt libraries (https://www.mail-archive.com/cygwin@cygwin.com/msg161967.html). There appears to be a fix for it dated earlier this year, which might be included in later versions of LLVM. Until then, one possible solution would be to rebuild `libreadline` in MSYS2 (TODO).

* There are issues building the extension libraries: `ht` and `ext`. The assembly is same as on Linux, but clang fails - needs more investigation. Maybe llc needs additional/different flags for windows to preprocess?

		$ (cd src; make)
		llc ext.bc -relocation-model=pic -o ext.s
		clang ext.s -o ../lib/ext.so -shared
		ext.s:5:8: error: expected absolute expression
				.type   Snx,@function
						^
		ext.s:171:2: error: unknown directive
				.size   Snx, .Lfunc_end0-Snx
				^
		ext.s:176:8: error: expected absolute expression
				.type   FD,@function
						^
		ext.s:227:2: error: unknown directive
				.size   FD, .Lfunc_end1-FD
				^
		ext.s:232:8: error: expected absolute expression
				.type   Base64,@function
						^
		ext.s:487:2: error: unknown directive
				.size   Base64, .Lfunc_end2-Base64
				^
		ext.s:490:8: error: expected absolute expression
				.type   $Empty,@object                  # @"$Empty"
						^
		ext.s:491:23: error: expected comdat type such as 'discard' or 'largest' after protection bits
				.section        .rodata,"a",@progbits
											^
		ext.s:495:2: error: unknown directive
				.size   $Empty, 1
				^
		ext.s:497:8: error: expected absolute expression
				.type   $Delim,@object                  # @"$Delim"
						^
		ext.s:501:2: error: unknown directive
				.size   $Delim, 16
				^
		ext.s:503:8: error: expected absolute expression
				.type   $SnxTab,@object                 # @"$SnxTab"
						^
		ext.s:509:2: error: unknown directive
				.size   $SnxTab, 194
				^
		ext.s:511:8: error: expected absolute expression
				.type   $Chr64,@object                  # @"$Chr64"
						^
		ext.s:512:23: error: expected comdat type such as 'discard' or 'largest' after protection bits
				.section        .rodata,"a",@progbits
											^
		ext.s:517:2: error: unknown directive
				.size   $Chr64, 65
				^
		ext.s:519:8: error: expected absolute expression
				.type   $Stat64,@object                 # @"$Stat64"
						^
		ext.s:525:2: error: unknown directive
				.size   $Stat64, 4
				^
		ext.s:527:8: error: expected absolute expression
				.type   $Next64,@object                 # @"$Next64"
						^
		ext.s:532:2: error: unknown directive
				.size   $Next64, 4
				^
		ext.s:534:32: error: expected comdat type such as 'discard' or 'largest' after protection bits
				.section        ".note.GNU-stack","",@progbits
													 ^
		make: *** [Makefile:56: ../lib/ext.so] Error 1

* Finally, it is able to build successfully, statically linked without `libreadline`, and appears to work for the most part such as the infamous `fork` system call. There is no builtin REPL, so the CLI should be used, i.e. specify file to load as an argument. Technically, this is lisp so the REPL can be built in PicoLisp ;)

* To distribute the picolisp binary, only `msys-2.0.dll` need be included (**LGPL**), and its dependencies.