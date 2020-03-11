BOOLECTOR=boolector-1.4-ffc2089-100608
PICOSAT=picosat-936

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

.PHONY: boolector

all: boolector

$(BOOLECTOR): $(BOOLECTOR).tar.gz
	tar xzf $<
	mv $@/btormem.h btormem.h
	cat btormem.h | sed 's/size_t new/size_t neu/g' > $@/btormem.h
	rm btormem.h
	mv $@/configure configure
	cat configure | sed 's/CFLAGS=-Wall/CFLAGS="-Wall -fPIC"/g' > $@/configure
	chmod a+x $@/configure
	rm configure

$(BOOLECTOR)/libboolector.a: $(BOOLECTOR) picosat/picosat.o
	cd $(BOOLECTOR) && ./configure && make

picosat: $(PICOSAT).tar.gz
	tar xzf $<
	mv $(patsubst %.tar.gz,%,$<) $@
	mv $@/configure configure
	cat configure | sed 's/sed /CFLAGS="$$CFLAGS -fPIC"\nsed /g' > $@/configure
	chmod a+x $@/configure
	rm configure

picosat/picosat.o: picosat
	cd $< && ./configure && make

boolector: BoolectorSolver.c++ $(BOOLECTOR)/libboolector.a
	gcc -g -Wall -W -Wextra -fPIC JNIBoolector.c++ BoolectorSolver.c++ -o ./libboolector.so -shared -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I$(BOOLECTOR) -L$(BOOLECTOR) -lboolector -lstdc++
	cp libboolector.so ../../lib
yices:
	@echo "Yices is not supported at the moment" && false

clean:
	rm -rf picosat $(BOOLECTOR) *.so

$(PICOSAT).tar.gz:
	@echo "$@ is missing. Download it from http://fmv.jku.at/picosat/" && false

$(BOOLECTOR).tar.gz:
	@echo "$@ is missing. Download it from http://fmv.jku.at/boolector/" && false
