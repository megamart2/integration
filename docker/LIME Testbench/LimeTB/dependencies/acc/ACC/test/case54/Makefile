LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1ac_ac.c > t1ac.ac  ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac ; \
	cp t1ac.c t1ac.c.nothread ; rm -rf t1ac.c ; \
	"$$ACCTEST" -af=.ac t1ac.ac -t ; \
	cp t1ac.c t1ac.c.t ; rm -rf t1ac.c ; \
	"$$ACCTEST" -af=.ac t1ac.ac --thread-safe ; \
	cp t1ac.c t1ac.c.threadsafe 
	diff -I '^#' working/t1ac.c.nothread exp/t1.nothread 
	diff -I '^#' working/t1ac.c.t exp/t1.thread
	diff -I '^#' working/t1ac.c.threadsafe exp/t1.thread 

clean:
	rm -rf working   
