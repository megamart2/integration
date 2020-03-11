all: force 
	cd src && make all_bs 
	cd test && ./runTest case*

clean: force
	cd src && make clean
	cd test && make clean

build: force
	cd src && make all_bs
  
test: force
	cd test && ./runTest case*

force:
