LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc
ACC=acc
LBITS := $(shell getconf LONG_BIT)

all:

	${ACC} foo.mc fooac.acc ; \
	${CC}  -o mypro foo.c fooac.c  ${LIBACC}  ;  \
        ./mypro  > output.real;\
	
	if [ $(LBITS) = 32 ]; then diff output.real output32.exp;\
	else 	diff output.real output64.exp;fi;\



clean:
	rm -f *.o *.c *.real mypro;
