LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc


all:
	rm -rf working
	mkdir working
	cp src/*.k working
	cd working ; \
	$(CPP) b-bug.k > b-bug.mc ; \
	$(CPP) b+bug.k > b+bug.mc ; \
	$(CPP) bAspect.k > bAspect.ac ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac b-bug.mc bAspect.ac ; \
	${CC}  -o myb b-bug.c bAspect.c  ${LIBACC}  ;  \
	./myb > myb_out_real; \
	rm -rf bAspect.c ; \
	"$$ACCTEST" -af=.ac b+bug.mc bAspect.ac ; \
	${CC}  -o myb2 b+bug.c bAspect.c  ${LIBACC}  ;  \
	./myb2 > myb2_out_real 
	diff exp/myb_out_exp working/myb_out_real
	diff exp/myb_out_exp working/myb2_out_real 

clean:
	rm -rf working 

