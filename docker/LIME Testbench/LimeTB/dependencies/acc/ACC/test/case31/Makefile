LIBACC=-L../../../lib -lacc
#CPP=cpp
#CC=cc

CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.c working
	cd working ;  \
        $(CPP) t1mc_mc.c > t1mc.mc ; \
        cp t1mc.mc t1ac.ac  ;  \
        $(CPP) t2mc_mc.c > t2mc.mc ; \
	cp t2mc.mc t2ac.ac  ; \
 	$(CPP) t3mc_mc.c > t3mc.mc ; \
        cp t3mc.mc t3ac.ac  ;  \
        $(CPP) t4mc_mc.c > t4mc.mc ; \
        cp t4mc.mc t4ac.ac  ; \
 	$(CPP) t5mc_mc.c > t5mc.mc ; \
        cp t5mc.mc t5ac.ac  ;  \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac t1ac.ac t1mc.mc t2ac.ac t2mc.mc t3ac.ac t3mc.mc t4ac.ac t4mc.mc t5ac.ac t5mc.mc; \
	${CC} -c t1ac.c t1mc.c t2ac.c t2mc.c t3ac.c t3mc.c t4ac.c t4mc.c t5ac.c t5mc.c 

clean:
	rm -rf working   
