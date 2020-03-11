LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
        $(CPP) t1ac_ac.c > t1ac.ac  ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc  ; \
	${CC}   -o myt1 t1ac.c t1mc.c   ${LIBACC}   -L../../../lib -lacc ;   \
	"$$ACCTEST" t2.mc t2_a1.acc t2_a2.acc t2_a3.acc ; \
	${CC}   -o myt2 t2.c t2_a1.c t2_a2.c t2_a3.c  ${LIBACC}   -L../../../lib -lacc ;   \
	./myt1  > t1.output.real ; \
	./myt2  > t2.output.real
	diff working/t1.output.real  exp/t1.output.exp
	diff working/t2.output.real  exp/t2.output.exp


clean:
	rm -rf working   
