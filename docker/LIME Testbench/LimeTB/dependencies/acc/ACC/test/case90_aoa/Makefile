LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -a t1a1a.acc t1mc.mc t1a1b.acc ; \
	$(CC) -o t1a1 t1a1a.c t1a1b.c t1mc.c ${LIBACC}  ; \
	./t1a1 > t1a1.out ; \
	"$$ACCTEST" -a t1a2a.acc t1mc.mc t1a2b.acc ; \
        $(CC) -o t1a2 t1a2a.c t1a2b.c t1mc.c ${LIBACC}  ; \
        ./t1a2 > t1a2.out; \
	"$$ACCTEST" -a t1a3.acc t1mc.mc ; \
        $(CC) -o t1a3 t1a3.c t1mc.c ${LIBACC}  ; \
        ./t1a3 > t1a3.out ; \
	"$$ACCTEST" -a t1a4.acc t1mc.mc ; \
        $(CC) -o t1a4 t1a4.c t1mc.c ${LIBACC}  ; \
        ./t1a4 > t1a4.out ; \
	"$$ACCTEST" -a t2a1.acc t2a2.acc t2mc.mc ; \
        $(CC) -o t2a1 t2a1.c t2a2.c t2mc.c ${LIBACC}  ; \
        ./t2a1 > t2a1.out ; \
	"$$ACCTEST" -a t3a1.acc t3a2.acc t3mc.mc ; \
        $(CC) -o t3a1 t3a1.c t3a2.c t3mc.c ${LIBACC}  ; \
        ./t3a1 > t3a1.out ; \
	"$$ACCTEST" -a t4a1.acc t4mc.mc ; \
        $(CC) -o t4a1 t4a1.c t4mc.c ${LIBACC}  ; \
        ./t4a1 > t4a1.out ; \
	"$$ACCTEST" -a t5a1.acc t5mc.mc ; \
        $(CC) -o t5a1 t5a1.c t5mc.c ${LIBACC}  ; \
        ./t5a1 > t5a1.out ; \
	"$$ACCTEST" -a t5a2.acc t5mc.mc ; \
        $(CC) -o t5a2 t5a2.c t5mc.c ${LIBACC}  ; \
        ./t5a2 > t5a2.out ; \
   	"$$ACCTEST" -a t5a3.acc t5mc.mc ; \
        $(CC) -o t5a3 t5a3.c t5mc.c ${LIBACC}  ; \
        ./t5a3 > t5a3.out ; \
   	"$$ACCTEST" -a t5a4.acc t5mc.mc ; \
        $(CC) -o t5a4 t5a4.c t5mc.c ${LIBACC}  ; \
        ./t5a4 > t5a4.out ; \
	"$$ACCTEST" -a t6a1.acc t6a2.acc t6mc.mc ; \
        $(CC) -o t6a1 t6a1.c t6a2.c t6mc.c ${LIBACC}  ; \
        ./t6a1 > t6a1.out
	diff working/t1a1.out exp
	diff working/t1a2.out exp
	diff working/t1a3.out exp
	diff working/t1a4.out exp
	diff working/t2a1.out exp
	diff working/t3a1.out exp
	diff working/t4a1.out exp
	diff working/t5a1.out exp
	diff working/t5a2.out exp
	diff working/t5a3.out exp
	diff working/t5a4.out exp
	diff working/t6a1.out exp

clean:
	rm -rf working   
