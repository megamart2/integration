LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc ; \
	"$$ACCTEST" -af=.ac t2ac.ac t2mc.mc ; \
	"$$ACCTEST" -af=.ac t3ac.ac t3mc.mc 
	diff working/t1mc.c exp/
	diff working/t2mc.c exp/
	diff working/t3mc.c exp/
clean:
	rm -rf working   
