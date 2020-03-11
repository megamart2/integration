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
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc 
	diff exp/t1ac.c_exp working/t1ac.c
	diff exp/t1mc.c_exp working/t1mc.c
 

clean:
	rm -rf working   
