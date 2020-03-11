LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
        $(CPP) t1ac_ac.c > t1ac.ac  ;  \
	$(CPP) t2mc_mc.c > t2mc.mc ;  \
	$(CPP) t3mc_mc.c > t3mc.mc ; \
	$(CPP) t3ac_ac.c > t3ac.ac ; \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc t2mc.mc ; \
	${CC}  -o myt1 t1ac.c t1mc.c t2mc.c  ${LIBACC}  ;  \
	"$$ACCTEST" -af=.ac t3ac.ac t3mc.mc ; \
        ./myt1  > t1.output.real 
	diff working/t1.output.real  exp/t1.output.exp
	diff -I '^#' working/t3mc.c   exp/t3mc.output.exp

clean:
	rm -rf working   
