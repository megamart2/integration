LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
        $(CPP) t1ac_ac.c > t1ac.ac ; \
	$(CPP) t2ac_ac.c > t2ac.ac ; \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc   ; \
	${CC}  -o myt1_a t1ac.c t1mc.c ${LIBACC}  ; rm -rf  t1mc.c   ;  \
        ./myt1_a  > t1.output.real.v1 ; \
	"$$ACCTEST" -af=.ac t2ac.ac t1mc.mc   ; \
	${CC}  -o myt1_b t2ac.c t1mc.c  ${LIBACC}  ;  \
	./myt1_b > t1.output.real.v2  
	diff working/t1.output.real.v1  exp/t1.output.exp.v1
	diff working/t1.output.real.v2 exp/t1.output.exp.v2 

clean:
	rm -rf working   
