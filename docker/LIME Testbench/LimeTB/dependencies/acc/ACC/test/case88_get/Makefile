LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" t1a1.acc t1mc.mc ; \
	$(CC) -o t1a1 t1a1.c t1mc.c ${LIBACC}  ; \
	./t1a1 > t1a1.out ; \
	"$$ACCTEST" t1a2.acc t1mc.mc ; \
	$(CC) -o t1a2 t1a2.c t1mc.c ${LIBACC}  ; \
	./t1a2 > t1a2.out ; \
	"$$ACCTEST" t1a3.acc t1mc.mc ; \
	$(CC) -o t1a3 t1a3.c t1mc.c ${LIBACC}  ; \
	./t1a3 > t1a3.out ; \
	"$$ACCTEST" t2a1.acc t2mc.mc ; \
	$(CC) -o t2a1 t2a1.c t2mc.c ${LIBACC}  ; \
	./t2a1 > t2a1.out ; \
	"$$ACCTEST" t2a2.acc t2mc.mc ; \
	$(CC) -o t2a2 t2a2.c t2mc.c ${LIBACC}  ; \
	./t2a2 > t2a2.out ; \
        "$$ACCTEST" t3a1.acc t3mc.mc ; \
	$(CC) -o t3a1 t3a1.c t3mc.c ${LIBACC}  ; \
	./t3a1 > t3a1.out ; \
        "$$ACCTEST" t3a2.acc t3mc.mc ; \
	$(CC) -o t3a2 t3a2.c t3mc.c ${LIBACC}  ; \
	./t3a2 > t3a2.out ; \
	"$$ACCTEST" t4a1.acc t4mc.mc ; \
	$(CC) -o t4a1 t4a1.c t4mc.c ${LIBACC}  ; \
	./t4a1 > t4a1.out ; \
	"$$ACCTEST" t5a1.acc t5mc.mc ; \
	$(CC) -o t5a1 t5a1.c t5mc.c ${LIBACC}  ; \
	./t5a1 > t5a1.out ; \
	"$$ACCTEST" t5a2.acc t5mc.mc ; \
        $(CC) -o t5a2 t5a2.c t5mc.c ${LIBACC}  ; \
        ./t5a2 > t5a2.out ; \
	"$$ACCTEST" t5a3.acc t5mc.mc ; \
        $(CC) -o t5a3 t5a3.c t5mc.c ${LIBACC}  ; \
        ./t5a3 > t5a3.out ; \
	"$$ACCTEST" t6a1.acc t6a2.acc t6mc.mc ; \
        $(CC) -o t6a1 t6a1.c t6a2.c t6mc.c ${LIBACC}  ; \
        ./t6a1 > t6a1.out ; \
	"$$ACCTEST" t7a1.acc t7mc.mc ; \
        $(CC) -o t7a1 t7a1.c t7mc.c ${LIBACC}  ; \
        ./t7a1 > t7a1.out ; \
	"$$ACCTEST" t8a1.acc t8mc.mc
	diff working/t1a1.out exp
	diff working/t1a2.out exp
	diff working/t1a3.out exp
	diff working/t2a1.out exp
	diff working/t2a2.out exp
	diff working/t3a1.out exp
	diff working/t3a2.out exp
	diff working/t4a1.out exp
	diff working/t5a1.out exp
	diff working/t5a2.out exp
	diff working/t5a3.out exp
	diff working/t6a1.out exp
	diff working/t7a1.out exp
	diff working/t8mc.c exp 

clean:
	rm -rf working   
