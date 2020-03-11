LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1a1.acc t1mc.mc ; $(CC) -o t1a1 t1a1.c t1mc.c ${LIBACC}  ; ./t1a1 > t1a1.out ; \
	"$$ACCTEST" t1a2.acc t1mc.mc ; $(CC) -o t1a2 t1a2.c t1mc.c ${LIBACC}  ; ./t1a2 > t1a2.out ; \
	"$$ACCTEST" t1a3.acc t1mc.mc ; $(CC) -o t1a3 t1a3.c t1mc.c ${LIBACC}  ; ./t1a3 > t1a3.out ; \
	"$$ACCTEST" t1a4.acc t1mc.mc ; $(CC) -o t1a4 t1a4.c t1mc.c ${LIBACC}  ; ./t1a4 > t1a4.out ; \
	"$$ACCTEST" t1a5.acc t1mc.mc ; $(CC) -o t1a5 t1a5.c t1mc.c ${LIBACC}  ; ./t1a5 > t1a5.out ; \
	"$$ACCTEST" t2a1.acc t2mc.mc ; $(CC) -o t2a1 t2a1.c t2mc.c ${LIBACC}  ; ./t2a1 > t2a1.out ; \
	"$$ACCTEST" t3a1.acc t3mc.mc ; $(CC) -o t3a1 t3a1.c t3mc.c ${LIBACC}  ; ./t3a1 > t3a1.out ; \
	"$$ACCTEST" t3a2.acc t3mc.mc ; $(CC) -o t3a2 t3a2.c t3mc.c ${LIBACC}  ; ./t3a2 > t3a2.out ; \
	"$$ACCTEST" t3a3.acc t3mc.mc ; $(CC) -o t3a3 t3a3.c t3mc.c ${LIBACC}  ; ./t3a3 > t3a3.out ; \
	"$$ACCTEST" t3a4.acc t3mc.mc ; $(CC) -o t3a4 t3a4.c t3mc.c ${LIBACC}  ; ./t3a4 > t3a4.out ; \
	"$$ACCTEST" t3a5.acc t3mc.mc ; $(CC) -o t3a5 t3a5.c t3mc.c ${LIBACC}  ; ./t3a5 > t3a5.out ; \
	"$$ACCTEST" t4a1.acc t4mc.mc ; $(CC) -o t4a1 t4a1.c t4mc.c ${LIBACC}  ; ./t4a1 > t4a1.out ; \
	"$$ACCTEST" t5a1.acc t5mc.mc ; $(CC) -o t5a1 t5a1.c t5mc.c ${LIBACC}  ; ./t5a1 > t5a1.out ; \
	"$$ACCTEST" t5a2.acc t5mc.mc ; $(CC) -o t5a2 t5a2.c t5mc.c ${LIBACC}  ; ./t5a2 > t5a2.out ; \
	"$$ACCTEST" t6a1.acc t6mc.mc ; $(CC) -o t6a1 t6a1.c t6mc.c ${LIBACC}  ; ./t6a1 > t6a1.out ; \
        "$$ACCTEST" t6a2.acc t6mc.mc ; $(CC) -o t6a2 t6a2.c t6mc.c ${LIBACC}  ; ./t6a2 > t6a2.out ; \
        "$$ACCTEST" t6a3.acc t6mc.mc ; $(CC) -o t6a3 t6a3.c t6mc.c ${LIBACC}  ; ./t6a3 > t6a3.out ; \
	"$$ACCTEST" t6a4.acc t6m1.mc ; $(CC) -o t6a4 t6a4.c t6m1.c ${LIBACC}  ; ./t6a4 > t6a4.out ; \
	"$$ACCTEST" t6a5.acc t6m1.mc ; $(CC) -o t6a5 t6a5.c t6m1.c ${LIBACC}  ; ./t6a5 > t6a5.out ; \
	"$$ACCTEST" t6a6.acc t6m1.mc ; $(CC) -o t6a6 t6a6.c t6m1.c ${LIBACC}  ; ./t6a6 > t6a6.out ; \
        "$$ACCTEST" t6a7.acc t6m1.mc ; $(CC) -o t6a7 t6a7.c t6m1.c ${LIBACC}  ; ./t6a7 > t6a7.out ; \
	"$$ACCTEST" t6a8.acc t6m1.mc ; $(CC) -o t6a8 t6a8.c t6m1.c ${LIBACC}  ; ./t6a8 > t6a8.out ; \
        "$$ACCTEST" t6a9.acc t6m1.mc ; $(CC) -o t6a9 t6a9.c t6m1.c ${LIBACC}  ; ./t6a9 > t6a9.out ; \
	"$$ACCTEST" t7a1.acc t7mc.mc ; $(CC) -o t7a1 t7a1.c t7mc.c ${LIBACC}  ; ./t7a1 > t7a1.out ; \
	"$$ACCTEST" t7a2.acc t7mc.mc ; $(CC) -o t7a2 t7a2.c t7mc.c ${LIBACC}  ; ./t7a2 > t7a2.out ; \
	"$$ACCTEST" t7a3.acc t7mc.mc ; $(CC) -o t7a3 t7a3.c t7mc.c ${LIBACC}  ; ./t7a3 > t7a3.out ; \
        "$$ACCTEST" t7a4.acc t7mc.mc ; $(CC) -o t7a4 t7a4.c t7mc.c ${LIBACC}  ; ./t7a4 > t7a4.out ; \
 	"$$ACCTEST" t7a5.acc t7mc.mc ; $(CC) -o t7a5 t7a5.c t7mc.c ${LIBACC}  ; ./t7a5 > t7a5.out ; \
        "$$ACCTEST" t7a6.acc t7mc.mc ; $(CC) -o t7a6 t7a6.c t7mc.c ${LIBACC}  ; ./t7a6 > t7a6.out
	diff working/t1a1.out exp
	diff working/t1a2.out exp
	diff working/t1a3.out exp
	diff working/t1a4.out exp
	diff working/t1a5.out exp
	diff working/t2a1.out exp
	diff working/t3a1.out exp
	diff working/t3a2.out exp
	diff working/t3a3.out exp
	diff working/t3a4.out exp
	diff working/t3a5.out exp
	diff working/t4a1.out exp
	diff working/t5a1.out exp
	diff working/t5a2.out exp
	diff working/t6a1.out exp
	diff working/t6a2.out exp
	diff working/t6a3.out exp
	diff working/t6a4.out exp
	diff working/t6a5.out exp
	diff working/t6a6.out exp
	diff working/t6a7.out exp
	diff working/t6a8.out exp
	diff working/t6a9.out exp
	diff working/t7a1.out exp
	diff working/t7a2.out exp
	diff working/t7a3.out exp
	diff working/t7a4.out exp
	diff working/t7a5.out exp
	diff working/t7a6.out exp

clean:
	rm -rf working   
