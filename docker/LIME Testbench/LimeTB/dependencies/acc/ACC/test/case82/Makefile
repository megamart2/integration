LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1mc_m.mc t1ac_ac.acc ;\
	"$$ACCTEST" t2mc_m.mc t2ac_ac.acc ;\
        "$$ACCTEST" t3mc_m.mc t3ac_ac.acc ;\
        "$$ACCTEST" t4mc_m.mc t4ac_ac.acc ;\
        "$$ACCTEST" t5mc_m.mc t5ac_ac.acc ;\
	"$$ACCTEST" t6mc_m.mc t6ac_ac.acc 
	diff working/t1mc_m.c exp/
	diff working/t2mc_m.c exp/
	diff working/t3mc_m.c exp/
	diff working/t4mc_m.c exp/
	diff working/t5mc_m.c exp/
	diff working/t6mc_m.c exp/
	diff working/t1ac_ac.c exp/
	diff working/t2ac_ac.c exp/
	diff working/t3ac_ac.c exp/
	diff working/t4ac_ac.c exp/
	diff working/t5ac_ac.c exp/
	diff working/t5ac_ac.c exp/
	diff working/t6ac_ac.c exp/

clean:
	rm -rf working   
