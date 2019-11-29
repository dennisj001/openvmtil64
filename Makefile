
SOURCES = src/basis/compiler/machineCode.c src/basis/compiler/_compile.c src/basis/compiler/memory.c\
	src/basis/compiler/combinators.c src/basis/compiler/math.c src/basis/compiler/cpu.c src/basis/compiler/mcPrimitives.c\
	src/basis/compiler/stack.c src/basis/compiler/logic.c src/basis/core/dataObjectRun.c\
	src/basis/core/block.c src/basis/compiler/blocks.c src/basis/core/conditionals.c src/basis/compiler/compile.c src/basis/core/_system.c\
	src/basis/compiler/optimize.c src/basis/compiler/bit.c src/basis/compiler/udis.c src/basis/compiler/arrays.c \
	src/basis/core/io.c src/basis/core/symbol.c src/basis/repl.c src/basis/core/syntax.c src/basis/core/dataObjectNew.c\
        src/basis/cfrtil64.c src/basis/core/parse.c src/basis/core/memSpace.c src/basis/init.c src/basis/system.c src/basis/core/charSet.c\
	src/basis/core/dllist.c src/basis/core/interpret.c src/basis/core/lexer.c src/basis/core/cstack.c src/basis/core/classes.c src/basis/debugOutput.c\
	src/basis/core/namespace.c src/basis/history.c src/basis/core/readline.c src/basis/core/dataStack.c src/basis/context.c\
	src/basis/core/word.c src/basis/core/readTable.c src/basis/bigNum.c src/basis/core/_readline.c src/basis/core/array.c\
	src/basis/compiler/compiler.c src/basis/core/dllnodes.c src/basis/core/finder.c src/basis/interpreters.c\
	src/basis/tabCompletion.c src/basis/colors.c src/basis/sourceCode.c src/basis/debugStepping.c\
	src/basis/core/string.c src/basis/openVmTil.c src/basis/core/dobject.c src/basis/core/preprocessor.c\
	src/basis/attribute.c src/basis/lists.c src/basis/debugDisassembly.c src/basis/typeCheck.c\
	src/basis/linux.c src/basis/exception.c src/basis/compiler/locals.c\
	src/basis/debugger.c src/basis/interpreter.c src/basis/_debug.c src/basis/lc/lambdaCalculus.c \
	src/basis/lc/apply.c src/basis/lc/eval.c src/basis/lc/read.c src/basis/lc/print.c src/basis/lc/special.c \
	src/primitives/strings.c src/primitives/bits.c src/primitives/maths.c src/primitives/logics.c src/primitives/openvmtils.c\
	src/primitives/ios.c src/primitives/parsers.c src/primitives/interpreters.c src/primitives/namespaces.c src/primitives/systems.c\
	src/primitives/compilers.c src/primitives/words.c  src/primitives/file.c src/primitives/stacks.c\
	src/primitives/debuggers.c src/primitives/memorys.c src/primitives/primitives.c src/primitives/contexts.c\
	src/primitives/disassembler.c src/primitives/syntaxes.c src/primitives/cmaths.c src/primitives/dataObjectNews.c  #src/basis/x.c

INCLUDES = src/include/machineCode.h src/include/defines.h src/include/types.h \
	src/include/cfrtil64.h src/include/macros.h src/include/lc.h\
	src/include/machineCodeMacros.h 
	

OBJECTS = $(SOURCES:%.c=%.o) 
CC = g++ #gcc #tcc
OUT = cfrtil64-gdb

default : debug

debug : bin/cfrtil64-gdb 
run : cfrtil64
all: cfrtil64-gdb #cfrtil64s
	
#CFLAGS_CORE = -finline-functions -fno-use-cxa-atexit 
CFLAGS = $(CFLAGS_CORE) -Wall 
LIBS = -L/usr/local/lib -ludis86 -lrt -lc -ldl -lm  -lmpfr -lgmp #-ltcc #-lpython3.7#-lFOX-1.6  -lX11

oclean : 
	-rm src/basis/*.o src/primitives/*.o src/basis/compiler/*.o src/basis/core/*.o src/basis/lc/*.o
	
clean : 
	make oclean
	touch src/include/defines.h
	make src/include/prototypes.h

src/include/prototypes.h : $(INCLUDES)
	cp src/include/_proto.h src/include/prototypes.h
	bin/cproto -o proto.h $(SOURCES)
	mv proto.h src/include/prototypes.h
	make oclean

cfrtil64 : CFLAGS = $(CFLAGS_CORE)
cfrtil64 : $(INCLUDES) $(OBJECTS) #_cfrtil64_O3
	$(CC) $(CFLAGS) $(OBJECTS) -o cfrtil64 $(LIBS)
	#strip -o cfrtil64 cfrtil64
	mv cfrtil64 bin/
	
cfrtil64s : CFLAGS = $(CFLAGS_CORE) -O3
cfrtil64s : src/include/prototypes.h $(OBJECTS)
	$(CC) -static $(CFLAGS) $(OBJECTS) -O3 -o cfrtil64s $(LIBS)
	strip cfrtil64s
	mv cfrtil64s bin/
	
static : CFLAGS = $(CFLAGS_CORE)
static : src/include/prototypes.h $(OBJECTS)
	$(CC) -static $(CFLAGS) $(OBJECTS) -o cfrtil64s $(LIBS)
	strip cfrtil64s
	mv cfrtil64s bin/

bin/cfrtil64-gdb : CFLAGS = $(CFLAGS_CORE) -ggdb 
bin/cfrtil64-gdb : src/include/prototypes.h $(OBJECTS) 
	$(CC) $(CFLAGS) $(OBJECTS) -o bin/cfrtil64-gdb $(LIBS)
	strip -o bin/cfrtil64 bin/cfrtil64-gdb
	

cfrtil64o : oclean $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(OUT) $(LIBS)
	strip $(OUT)
	mv $(OUT) bin

_cfrtil64_O1 : CFLAGS = $(CFLAGS_CORE) -O1
_cfrtil64_O1 : OUT = cfrtil64o1
_cfrtil64_O1 : cfrtil64o

_cfrtil64_O2 : CFLAGS = $(CFLAGS_CORE) -O2
_cfrtil64_O2 : OUT = cfrtil64o2
_cfrtil64_O2 : cfrtil64o

_cfrtil64_O3 : CFLAGS = $(CFLAGS_CORE) -O3
_cfrtil64_O3 : OUT = cfrtil64o3
_cfrtil64_O3 : cfrtil64o
	cp bin/cfrtil64o3 bin/cfrtil64

_cfrtil64o :  src/include/prototypes.h $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(OUT) $(LIBS)

src/primitives/cmaths.o : src/primitives/cmaths.c
	$(CC) $(CFLAGS) -O3 -c src/primitives/cmaths.c -o src/primitives/cmaths.o
	
proto:
	touch src/include/defines.h
	make src/include/prototypes.h

optimize1 : oclean _cfrtil64_O1

optimize2 : oclean _cfrtil64_O2

optimize3 : oclean _cfrtil64_O3

optimize : 
	-rm bin/cfrtil64*
	#make optimize1
	#make optimize2
	make optimize3
	make cfrtil64s
	make oclean
	#make
	#-sudo cp bin/cfrtil64o3 /usr/local/bin/cfrtil64
	#cp bin/cfrtil64o3 bin/cfrtil64

editorClean :
	rm *.*~ src/basis/*.*~ src/basis/compiler/*.*~ src/primitives/*.*~ src/include/*.*~

realClean : oclean editorClean
	rm cfrtil64 cfrtil64-gdb

udis :
	wget http://prdownloads.sourceforge.net/udis86/udis86-1.7.2.tar.gz
	tar -xvf udis86-1.7.2.tar.gz 
	cd udis86-1.7.2 && \
	./configure --enable-shared && \
	make && \
	sudo make install && \
	sudo ldconfig
	
_gmp : 
	wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz 
	tar -xvf gmp-6.1.2.tar.xz
	cd gmp-6.1.2 && \
	./configure --enable-shared && \
	make && \
	sudo make install && \
	sudo ldconfig
	
_mpfr :	
	wget https://www.mpfr.org/mpfr-current/mpfr-4.0.1.tar.xz 
	tar xvf mpfr-4.0.1.tar.xz
	cd mpfr-4.0.1 && \
	./configure --enable-shared && \
	make && \
	sudo make install && \
	sudo ldconfig
mpfr :
	sudo apt-get install libmpfr4 libmpfr-dev
	
_mpc :	_mpfr
	wget https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz.sig 
	tar xzf mpc-1.1.0.tar.gz
	cd mpc-1.1.0 && \
	./configure --enable-shared && \
	make && \
	sudo make install && \
	sudo ldconfig
	
gmp :
	sudo apt-get install libgmp10 libgmp-dev
	
_cproto :
	wget https://launchpad.net/ubuntu/+archive/primary/+files/cproto_4.7m.orig.tar.gz 
	tar -xvf cproto_4.7m.orig.tar.gz
	cd cproto-4.7m && \
	./configure --enable-shared && \
	make && \
	sudo make install

cproto : 
	sudo apt-get install cproto
	
tar.xz :	
	tar -c --xz --exclude=nbproject --exclude=objects --exclude=mpfr* --exclude=.git --exclude=*.png --exclude=cfrtil64-gdb  --exclude=*.o --exclude *.kdev* -f ../backup/cfrtil64.tar.xz * *.*

xz : 
	-rm ~/openvmtil64/core
	-rm -rf ~/backup/openvmtil64/
	-mv .git ../backup
	-cp -r ~/openvmtil64/ ~/backup/openvmtil64/
	-mv ../backup/.git .
	make tar.xz

_all : realClean install
	make xz

_install : 
	-mv .git ../backup
	-cp ./init.cft ./namespaces/
	-sudo rm -rf /usr/local/lib/cfrTil64/
	-sudo cp -r ~/openvmtil64 /usr/local/lib/cfrTil64/
	-sudo cp -r ~/openvmtil64/etc /usr/local/
	-sudo cp ~/openvmtil64/lib/lib*.* /usr/lib
	-sudo cp bin/* /usr/local/bin
	-mv ../backup/.git .
	-sudo ldconfig

install :
	make
	make _install
	ls -l /usr/local/bin/cfrtil64*
	
run :
	cfrtil64

runLocal :
	./bin/cfrtil64

