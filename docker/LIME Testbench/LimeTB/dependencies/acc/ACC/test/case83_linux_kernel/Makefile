LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac bootflag.mc main.mc summit.mc es7000.mc sched.mc sky2.mc; \
	"$$ACCTEST" exit_reduce.mc exit_reduce_acc.acc
	diff working/exit_reduce.c exp/
	diff working/exit_reduce_acc.c exp/

	
clean:
	rm -rf working   
