LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.[ma]c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc ; \
	${CC}  t1mc.c t1ac.c -o t1  ${LIBACC}  ;  \
	./t1 > t1.out 
	diff working/t1.out exp/t1.out.exp


clean:
	rm -rf working   
