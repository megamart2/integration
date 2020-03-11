all:
	mkdir -p lib/lime
	chmod +x bin/*
	cd source/common; make
	cd source/aspect-monitor; make
	cd source/limec; make
	cd source/limegui; make
	cd source/ljut; make
	cd source/partial; make
	cd source/tester; make
	cd source/tracer; make
	
	cd dependencies/acc; make
	cd dependencies/scheck; make
	cd dependencies/solvers; make


clean:
	rm -rf lib/lime
	cd source/aspect-monitor; make clean
	cd source/common; make clean
	cd source/limec; make clean
	cd source/limegui; make clean
	cd source/ljut; make clean
	cd source/partial; make clean
	cd source/tester; make clean
	cd source/tracer; make clean
	
	cd dependencies/acc; make clean
	cd dependencies/scheck; make clean
	cd dependencies/solvers; make clean
