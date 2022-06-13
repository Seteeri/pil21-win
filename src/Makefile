# 08apr22 Software Lab. Alexander Burger

#.SILENT:

CC = clang
PIL = ../pil  # pil
ASM = opt -O3  # llvm-as
LLC = llc
LINK = llvm-link
MAIN = -static -lc -lutil -lm -ldl -lreadline -lffi -ltinfo
SHARED = -shared
STRIP = strip

OS = $(shell uname)
CPU = $(shell uname -m)

BIN = ../bin
LIB = ../lib

INC = lib/llvm.l vers.l defs.l glob.l dec.l
SRC = main.l gc.l big.l sym.l io.l db.l apply.l flow.l subr.l

all: $(LIB)/sysdefs $(BIN)/picolisp $(BIN)/balance

# System definitions
$(LIB)/sysdefs: sysdefs.c
	$(CC) -w -D_OS='"$(OS)"' -D_CPU='"$(CPU)"' sysdefs.c  &&  ./a.exe > $(LIB)/sysdefs  &&  rm ./a.exe

# Base system
$(BIN)/picolisp: picolisp.bc
	mkdir -p $(BIN) $(LIB)
	$(LLC) picolisp.bc -relocation-model=pic -o picolisp.s
	$(CC) picolisp.s -o $(BIN)/picolisp $(MAIN)
	$(STRIP) $(BIN)/picolisp

picolisp.bc: base.bc lib.bc
	$(LINK) -o picolisp.bc base.bc lib.bc

base.bc: base.ll
	$(ASM) -o base.bc base.ll

base.ll: $(INC) $(SRC)
	$(PIL) lib/llvm.l main.l -bye > base.ll
	mv base.map $(LIB)/map

lib.bc: pico.h lib.c
	$(CC) -O3 -w -c -o lib.bc -D_OS='"$(OS)"' -D_CPU='"$(CPU)"' `pkg-config --cflags libffi` -emit-llvm lib.c

# Tools
$(BIN)/balance: balance.c
	$(CC) -O3 -w -o $(BIN)/balance balance.c
	$(STRIP) $(BIN)/balance

# Clean up
clean:
	rm -f *.ll *.bc *.s

clean2: clean
	rm -f $(BIN)/balance $(BIN)/ssl $(BIN)/httpGate
