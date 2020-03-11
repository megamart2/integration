LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.[ma]c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac charset.mc md5.mc libgcc2.mc crtstuff.mc jcf-io.mc ; \
	"$$ACCTEST" -af=.ac tree-mudflap.mc tree-outof-ssa.mc reload.mc fixincl.mc timevar.mc ; \
	"$$ACCTEST" -af=.ac floatformat.mc symtab.mc insn-attrtab.mc insn-emit.mc insn-recog.mc ; \
	"$$ACCTEST" -af=.ac call.mc argv.mc 

clean:
	rm -rf working   
