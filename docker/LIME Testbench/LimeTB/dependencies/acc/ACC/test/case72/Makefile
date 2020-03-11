LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc
LBITS := $(shell getconf LONG_BIT)

all:
	rm -rf working 
	mkdir working
	cp src/*.[ma]c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc t2mc.mc ; \
	${CC}  t1mc.c -o t1mc  ${LIBACC}  ;  \
	./t1mc > t1mc.out ; \
	${CC}  t1ac.c -o t1ac  ${LIBACC}  ;  \
	./t1ac > t1ac.out ; \
	"$$ACCTEST" -af=.ac orbit-policy.mc test-linc.mc client.mc test-dynany.mc 


	if [ $(LBITS) = 32 ]; then diff working/t1mc.out exp/t1mc.out.exp;\
				diff working/t1ac.out exp/t1mc.out.exp;\
				diff working/t2mc.c exp/t2mc.c.exp;\
	else 	diff working/t1mc.out exp/t1mc.out.64bit.exp;\
		diff working/t1ac.out exp/t1mc.out.64bit.exp;\
		diff working/t2mc.c exp/t2mc.c.exp;fi;\
	




clean:
	rm -rf working   
