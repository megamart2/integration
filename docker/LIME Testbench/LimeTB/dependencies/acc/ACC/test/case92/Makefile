LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1ac.acc t1mc.mc ; \
	$(CC) -o a.out t1ac.c t1mc.c ; \
	./a.out > t1.out
	diff working/t1.out exp/

clean:
	rm -rf working   
