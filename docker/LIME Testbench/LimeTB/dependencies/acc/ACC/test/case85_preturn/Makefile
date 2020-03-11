LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1ac.acc t1mc.mc ; \
        ${CC}  -o t1a1 t1mc.c t1ac.c   ${LIBACC}  ;  \
        ./t1a1 > t1a1.out ; \
        "$$ACCTEST" t2ac.acc t1mc.mc ; \
        ${CC}  -o t1a2 t1mc.c t2ac.c ${LIBACC}  ; \
        ./t1a2 > t1a2.out ;  \
        "$$ACCTEST" t3ac.acc t1mc.mc; \
        ${CC}  -o t1a3 t1mc.c t3ac.c ${LIBACC}  ; \
        ./t1a3 > t1a3.out  ;  \
        "$$ACCTEST" t4ac.acc t1mc.mc ; \
        ${CC}  -o t1a4 t1mc.c t4ac.c ${LIBACC}  ; \
        ./t1a4 > t1a4.out ;  \
        "$$ACCTEST" t5ac.acc t1mc.mc; \
        ${CC}  -o t1a5 t1mc.c t5ac.c ${LIBACC}  ; \
        ./t1a5 > t1a5.out ;  \
        "$$ACCTEST" t6ac.acc t1mc.mc ; \
        ${CC}  -o t1a6 t1mc.c t6ac.c ${LIBACC}  ; \
        ./t1a6 > t1a6.out  ;  \
	"$$ACCTEST" t7ac.acc t2mc.mc ; \
        ${CC}  -o t2a7 t2mc.c t7ac.c ${LIBACC}  ; \
        ./t2a7 > t2a7.out   ; \
	"$$ACCTEST" t8ac.acc t2mc.mc ; \
        ${CC}  -o t2a8 t2mc.c t8ac.c ${LIBACC}  ; \
        ./t2a8 > t2a8.out ;  \
	${CPP} t3.c > t3mc.mc ; \
	"$$ACCTEST" t3mc.mc t1ac.acc; \
	${CC}  -o t3a1 t3mc.c t1ac.c ${LIBACC}  ; \
	./t3a1 > t3a1.out ;  \
	"$$ACCTEST" t4mc.mc t9ac.acc ; \
	${CC}  -o t4a9 t4mc.c t9ac.c ${LIBACC}  ;  \
	./t4a9 > t4a9.out ; \
	"$$ACCTEST" t5mc.mc t10ac.acc ; \
        ${CC}  -o t5a10 t5mc.c t10ac.c ${LIBACC}  ;  \
        ./t5a10 > t5a10.out
	diff working/t1a1.out exp/
	diff working/t1a2.out exp/
	diff working/t1a3.out exp/
	diff working/t1a4.out exp/
	diff working/t1a5.out exp/
	diff working/t1a6.out exp/
	diff working/t2a7.out exp/
	diff working/t2a8.out exp/
	diff working/t3a1.out exp/t1a1.out
	diff working/t4a9.out exp/
	diff working/t5a10.out exp/

clean:
	rm -rf working   
