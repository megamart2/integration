LIBACC=-L../../../lib -lacc
CPP=gcc -E
CC=gcc
TESTOPT= --test=correctness --size=5 --repeat=1 --seed=10000 --insert=balanced --delete=reverse --alloc=no-track -vvvv
SRC=test.c rb-test.c rb.c 

LBITS := $(shell getconf LONG_BIT)


REF_ACC_SRC_NOASPECT=test_ref.mc rb-test_ref.mc rb_ref.mc
REF_GCC_SRC_NOASPECT=test_ref.c rb-test_ref.c rb_ref.c

REF_ACC_SRC_T=$(REF_ACC_SRC_NOASPECT) trace_ac.ac
REF_GCC_SRC_T=$(REF_GCC_SRC_NOASPECT) trace_ac.c

REF_ACC_SRC_N=$(REF_ACC_SRC_NOASPECT) nodec_ac.ac
REF_GCC_SRC_N=$(REF_GCC_SRC_NOASPECT) nodec_ac.c

REF_ACC_SRC_M=$(REF_ACC_SRC_NOASPECT) memory_ac.ac
REF_GCC_SRC_M=$(REF_GCC_SRC_NOASPECT) memory_ac.c

REF_ACC_SRC_TN=$(REF_ACC_SRC_NOASPECT) trace_ac.ac nodec_ac.ac
REF_GCC_SRC_TN=$(REF_GCC_SRC_NOASPECT) trace_ac.c nodec_ac.c

REF_ACC_SRC_TM=$(REF_ACC_SRC_NOASPECT) trace_ac.ac memory_ac.ac
REF_GCC_SRC_TM=$(REF_GCC_SRC_NOASPECT) trace_ac.c memory_ac.c

REF_ACC_SRC_NM=$(REF_ACC_SRC_NOASPECT) nodec_ac.ac memory_ac.ac
REF_GCC_SRC_NM=$(REF_GCC_SRC_NOASPECT) nodec_ac.c memory_ac.c

REF_ACC_SRC_TNM=$(REF_ACC_SRC_NOASPECT) trace_ac.ac nodec_ac.ac memory_ac.ac
REF_GCC_SRC_TNM=$(REF_GCC_SRC_NOASPECT) trace_ac.c nodec_ac.c memory_ac.c

#total memory allocated: 448

all: setup rbt rbt_ref_pre  rbt_ref_noaspect rbt_ref_T rbt_ref_N rbt_ref_M rbt_ref_TN rbt_ref_TM rbt_ref_NM rbt_ref_TNM

setup:
	rm -rf working*
	mkdir workingrbt workingrbt_ref
	cp src/rbt/*.* workingrbt
	cp src/rbt_ref/*.* workingrbt_ref/

#original red black tree 
rbt: 
	cd workingrbt ; \
	$(CC) -o rbt $(SRC) ; \
	./rbt $(TESTOPT) > rbt_output
	diff exp/rbt_output_exp workingrbt/rbt_output

#refactor: preprocess all files

rbt_ref_pre:
	cd workingrbt_ref ; \
	$(CPP) test.c > test_ref.mc ; \
	$(CPP) rb-test.c > rb-test_ref.mc ; \
	$(CPP) rb.c > rb_ref.mc ; \
	cp trace.ac trace_ac_ac.c ; \
	cp nodec.ac nodec_ac_ac.c ; \
	cp memory.ac memory_ac_ac.c ; \
	$(CPP) trace_ac_ac.c > trace_ac.ac ; \
	$(CPP) nodec_ac_ac.c > nodec_ac.ac ; \
	$(CPP) memory_ac_ac.c > memory_ac.ac 
	
#refactored red black tree
#config1: no aspect		
rbt_ref_noaspect: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_NOASPECT) ; \
	$(CC) -o rbt_ref_noaspect $(REF_GCC_SRC_NOASPECT) ${LIBACC}   ; rm -rf $(REF_GCC_SRC_NOASPECT); \
	./rbt_ref_noaspect $(TESTOPT) > rbt_ref_noaspect_output
	diff exp/rbt_ref_noaspect_output_exp workingrbt_ref/rbt_ref_noaspect_output

########################################################
## add 3 aspects:
##
##  "T" --> trace aspect
##  "N" --> node count aspect
##  "M" --> memory profiling aspect 
##
#######################################################

#config2: trace aspect only		
rbt_ref_T: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_T) ; \
	$(CC) -o rbt_ref_T $(REF_GCC_SRC_T) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_T) ; \
	./rbt_ref_T $(TESTOPT) > rbt_ref_T_output
	diff exp/rbt_ref_T_output_exp workingrbt_ref/rbt_ref_T_output


#config3: node count aspect only		
rbt_ref_N: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_N) ; \
	$(CC) -o rbt_ref_N $(REF_GCC_SRC_N) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_N) ; \
	./rbt_ref_N $(TESTOPT) > rbt_ref_N_output
	diff exp/rbt_ref_N_output_exp workingrbt_ref/rbt_ref_N_output

#config4: memory profiling aspect only		
rbt_ref_M: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_M) ; \
	$(CC) -o rbt_ref_M $(REF_GCC_SRC_M) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_M) ; \
	./rbt_ref_M $(TESTOPT) > rbt_ref_M_output;\

	if [ $(LBITS) = 32 ]; then diff exp/rbt_ref_M_output_exp workingrbt_ref/rbt_ref_M_output;\
	else 	diff exp/rbt_ref_M_output_64bit_exp workingrbt_ref/rbt_ref_M_output;fi;\




#config5: trace + node count
rbt_ref_TN: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_TN) ; \
	$(CC) -o rbt_ref_TN $(REF_GCC_SRC_TN) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_TN) ; \
	./rbt_ref_TN $(TESTOPT) > rbt_ref_TN_output
	diff exp/rbt_ref_TN_output_exp workingrbt_ref/rbt_ref_TN_output

#config6: trace + memory profiling
rbt_ref_TM: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_TM) ; \
	$(CC) -o rbt_ref_TM $(REF_GCC_SRC_TM) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_TM) ; \
	./rbt_ref_TM $(TESTOPT) > rbt_ref_TM_output

	if [ $(LBITS) = 32 ]; then diff exp/rbt_ref_TM_output_exp workingrbt_ref/rbt_ref_TM_output;\
	else 	diff exp/rbt_ref_TM_output_64bit_exp workingrbt_ref/rbt_ref_TM_output;fi;\




	

#config7: node count + memory profiling
rbt_ref_NM: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_NM) ; \
	$(CC) -o rbt_ref_NM $(REF_GCC_SRC_NM) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_NM) ; \
	./rbt_ref_NM $(TESTOPT) > rbt_ref_NM_output

	if [ $(LBITS) = 32 ]; then diff exp/rbt_ref_NM_output_exp workingrbt_ref/rbt_ref_NM_output;\
	else 	diff exp/rbt_ref_NM_output_64bit_exp workingrbt_ref/rbt_ref_NM_output;fi;\


#config8: trace + node count + memory profiling
rbt_ref_TNM: 
	cd workingrbt_ref ; \
	if [ ${ACCTEST}x = "x" ] ; then  ACCTEST=../../../bin/acc && export ACCTEST && echo "ACCTEST is not set by user, set it to be default value ../../../bin/acc" ; fi; \
	"$$ACCTEST" -af=.ac $(REF_ACC_SRC_TNM) ; \
	$(CC) -o rbt_ref_TNM $(REF_GCC_SRC_TNM) ${LIBACC}  ; rm -rf $(REF_GCC_SRC_TNM) ; \
	./rbt_ref_TNM $(TESTOPT) > rbt_ref_TNM_output

	if [ $(LBITS) = 32 ]; then diff exp/rbt_ref_TNM_output_exp workingrbt_ref/rbt_ref_TNM_output;\
	else  diff exp/rbt_ref_TNM_output_64bit_exp workingrbt_ref/rbt_ref_TNM_output;fi;\
	

clean:
	rm -rf working*
