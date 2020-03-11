LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp -r src/* working
	cd working ;  \
        $(CPP) dir2/t1mc_mc.c > dir2/t1mc.mc ; \
        $(CPP) dir1/t1ac_ac.c > dir1/t1ac.ac  ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac ./dir1/t1ac.ac ./dir2/t1mc.mc  ; \
	${CC}  -o myt1 ./dir1/t1ac.c ./dir2/t1mc.c   ${LIBACC}  ;  \
        ./myt1  > t1.output.real
	diff working/t1.output.real  exp/t1.output.exp

clean:
	rm -rf working   
