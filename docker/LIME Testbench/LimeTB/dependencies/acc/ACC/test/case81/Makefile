LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.[ma]c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc; \
	${CC}  -o t1a1 t1mc.c t1ac.c ${LIBACC}  ;\
	rm -rf t1mc.c;  \
	"$$ACCTEST" -af=.ac t2ac.ac t1mc.mc ; \
	${CC}  -o t1a2 t1mc.c t2ac.c ${LIBACC}  ; \
	rm -rf t1mc.c ;  \
	"$$ACCTEST" -af=.ac t3ac.ac t1mc.mc; \
        ${CC}  -o t1a3 t1mc.c t3ac.c ${LIBACC}  ; \
	rm -rf t1mc.c  ;  \
        "$$ACCTEST" -af=.ac t4ac.ac t1mc.mc ; \
        ${CC}  -o t1a4 t1mc.c t4ac.c  ${LIBACC}  ; \
	./t1a1 > t1a1.out ;\
	./t1a2 > t1a2.out ;\
	./t1a3 > t1a3.out ;\
	./t1a4 > t1a4.out
	diff working/t1a1.out exp/t1a1.out.exp
	diff working/t1a2.out exp/t1a2.out.exp
	diff working/t1a3.out exp/t1a3.out.exp
	diff working/t1a4.out exp/t1a4.out.exp

clean:
	rm -rf working   
