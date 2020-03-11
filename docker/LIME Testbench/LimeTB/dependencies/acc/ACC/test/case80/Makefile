LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.[ma]c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc 
	diff --ignore-all-space -B -I '^#' working/t1mc.c exp/t1mc.c.exp 
	diff --ignore-all-space  -B -I '^#' working/t1ac.c exp/t1ac.c.exp 

clean:
	rm -rf working   
