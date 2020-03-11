LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc
ACC=acc
all:

	${ACC} foo.mc fooac.acc ; \
	${CC}  -o mypro foo.c fooac.c  ${LIBACC}  ;  \
        ./mypro  > output.real;\
	diff output.real output.exp
clean:
	rm -f *.o *.c *.real mypro;
