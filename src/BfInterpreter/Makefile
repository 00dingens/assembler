all: hello
	./hello

hello: hello.o
	ld -s -o hello hello.o

hello.o: hello.asm
	nasm -f elf hello.asm

clean:
	rm *.o

# allgemeines target.
# wenn "make x" aufgerufen wird, enthält $@ den wert x
%:	%.asm
	nasm -f elf $@.asm
	ld -s -o $@ $@.o	
	./$@ a1 b2

