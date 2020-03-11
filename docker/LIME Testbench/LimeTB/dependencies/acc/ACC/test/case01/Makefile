LIBACC=-L../../../lib -lacc
CPP=cpp
CC=cc

all:
	rm -rf working 
	mkdir working
	cp src/*.k working
	cd working ;  \
        $(CPP) SelectionSort.k > SelectionSort.mc ; \
        $(CPP) TestAspect.k > TestAspect.ac ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac SelectionSort.mc TestAspect.ac ; \
	${CC}  -o mysort SelectionSort.c TestAspect.c  ${LIBACC}  ;  \
        ./mysort  > sort.output.real
	diff working/sort.output.real exp/sort.output.exp

foo:	
	cd working ; \
        $(CPP) foo.k > foo.mc ; \
        $(CPP) fooAspect.k > fooAspect.ac ; \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac foo.mc fooAspect.ac ; \
	${CC}  -o myfoo foo.c fooAspect.c  ${LIBACC}  ;  \
        ./myfoo  > foo.output.real
	diff working/foo.output.real exp/foo.output.exp

clean:
	rm -rf working   
