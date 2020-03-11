LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc

all:
	rm -rf working 
	mkdir working
	cp src/*.k working
	cd working ;  \
        $(CPP) t1_mc.k > t1.mc ; \
        $(CPP) t2_ac.k > t2.ac ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1.mc t2.ac ; \
	$(CC) -c t1.c ; \
	$(CC) -c t2.c

clean:
	rm -rf working   
