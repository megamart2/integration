LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc
ACC=acc
all:

	${ACC} foo.mc fooac1.acc fooac2.acc fooac3.acc; \
	${CC}  -o mypro foo.c fooac1.c fooac2.c fooac3.c  ${LIBACC}  ;  \
        ./mypro  > output.real;\
	diff output.real output.exp
clean:
	rm -f *.o *.c *.real mypro;
