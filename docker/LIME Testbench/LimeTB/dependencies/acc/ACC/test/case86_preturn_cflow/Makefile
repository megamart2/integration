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
        ${CC}  -o t1a1 t1mc.c t1ac.c ${LIBACC}  ;\
         ./t1a1 > t1a1.out  ;  \
        "$$ACCTEST" t2ac.acc t1mc.mc ; \
        ${CC}  -o t1a2 t1mc.c t2ac.c  ${LIBACC}  ;\
        ./t1a2 > t1a2.out 
	diff working/t1a1.out exp/
	diff working/t1a2.out exp/

clean:
	rm -rf working   
