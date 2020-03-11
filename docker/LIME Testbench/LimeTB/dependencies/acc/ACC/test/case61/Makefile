LIBACC=-L../../../lib -lacc
#CPP=cpp
#CC=cc

CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac_mac.ac t1mc_mac.mc ; \
	"$$ACCTEST" -af=.ac t1ac_cygwin.ac t1mc_cygwin.mc
 

clean:
	rm -rf working   
