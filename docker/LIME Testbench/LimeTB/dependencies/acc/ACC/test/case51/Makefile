LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
	$(CPP) t2mc_mc.c > t2mc.mc ; \
        $(CPP) t1ac_ac.c > t1ac.ac  ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc   ; rm -rf t1ac.c ; \
	"$$ACCTEST" -af=.ac t1ac.ac t2mc.mc   ; \
	$(CC) -c t1mc.c ; \
	$(CC) -c t2mc.c ; \
	$(CC) -c t1ac.c ; \
	${CC}  -o myt1 t1ac.o t1mc.o t2mc.o   ${LIBACC}  ;  \
        ./myt1  > t1.output.real
	diff working/t1.output.real  exp/t1.output.exp

clean:
	rm -rf working   
