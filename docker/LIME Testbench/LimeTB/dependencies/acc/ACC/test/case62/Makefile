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
	"$$ACCTEST" -af=.ac test_ref_cygwin.mc rb-test_ref_cygwin.mc rb_ref_cygwin.mc ; \
	"$$ACCTEST" -af=.ac test_ref_mac.mc rb-test_ref_mac.mc rb_ref_mac.mc 
 

clean:
	rm -rf working   
