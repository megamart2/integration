CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
        $(CPP) t1ac_ac.c > t1ac.ac  ; \
	$(CPP) t2ac_ac.c > t2ac.ac ; \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc t2ac.ac
	diff -I '^#' working/t1mc.c  exp/t1.output.exp
	diff -I '^#' working/t1ac.c  exp/t1ac.output.exp
	diff -I '^#' working/t2ac.c  exp/t2ac.output.exp

clean:
	rm -rf working   
