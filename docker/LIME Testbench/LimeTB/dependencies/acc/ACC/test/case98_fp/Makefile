LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc


all:
	rm -rf working 
	mkdir working
	cp src/*.* working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1mc.mc t1ac.acc ; \
	${CC} -o myt1 t1mc.c t1ac.c ${LIBACC}  ;  \
        ./myt1  > t1.output
	diff working/t1.output  exp/

clean:
	rm -rf working   
