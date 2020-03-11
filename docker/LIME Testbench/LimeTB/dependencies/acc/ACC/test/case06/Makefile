LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc


all:
	rm -rf working 
	mkdir working
	cp src/*.k working
	cd working ;  \
        $(CPP) t1mc.k > t1mc.mc ; \
        $(CPP) t1ac.k > t1ac.ac  ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc  ; \
	${CC}  -o myt1 t1ac.c t1mc.c   ${LIBACC}  ;  \
        ./myt1  > t1.output.real
	diff working/t1.output.real  exp/t1.output.exp

clean:
	rm -rf working   
