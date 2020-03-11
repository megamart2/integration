LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc
ACC=acc
all:

	${ACC} world.mc hello.acc ; \
	${CC}  -o mypro world.c hello.c  ${LIBACC}  ;  \
        ./mypro  > output.real;\
	diff output.real output.exp
clean:
	rm -f *.o *.c *.real mypro;
