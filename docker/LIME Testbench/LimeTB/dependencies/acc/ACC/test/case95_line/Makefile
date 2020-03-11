LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc


all:
	rm -rf working 
	mkdir working
	cp src/*.* working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1ac.acc t1mc.mc 
	diff working/t1ac.c exp/
	diff working/t1mc.c exp/

clean:
	rm -rf working   
