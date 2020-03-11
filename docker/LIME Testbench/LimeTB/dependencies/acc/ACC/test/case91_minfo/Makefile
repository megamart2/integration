LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc


all:
	rm -rf working 
	mkdir working
	cp src/*.*c working
	cd working ;  \
        if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -m t1ac.acc t2ac.acc t1mc.mc > output_std_1 ; \
	"$$ACCTEST" -m=outfile_1 t1ac.acc t2ac.acc t1mc.mc ; \
        "$$ACCTEST" --matchinfo t1ac.acc t2ac.acc t1mc.mc > output_std_2 ; \
        "$$ACCTEST" --matchinfo=outfile_2 t1ac.acc t2ac.acc t1mc.mc ; \
        "$$ACCTEST" -m -a t1ac.acc t2ac.acc t1mc.mc > output_std_aa_3 
	diff working/output_std_1 working/output_std_2
	diff working/output_std_1 working/outfile_1
	diff working/output_std_1 working/outfile_2
	diff working/output_std_1 exp
	diff working/output_std_aa_3 exp

clean:
	rm -rf working   
