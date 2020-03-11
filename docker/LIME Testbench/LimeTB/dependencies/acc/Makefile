all: compile
	
untar:
	tar xf ACC_v09.tar
	rm -rf ACC/src/.acc_dir
	rm -rf ACC/bin/.acc_dir

compile:
	cd ACC/src; make all
	cp ACC/bin/acc.exe ../../bin/ | true
	cp ACC/bin/acc ../../bin/
	cp ACC/lib/libacc.a ../../lib/
	

clean:
	cd ACC; make clean
	rm -rf ../../bin/acc.exe
	rm -rf ../../bin/acc
	rm -rf ../../lib/libacc.a

