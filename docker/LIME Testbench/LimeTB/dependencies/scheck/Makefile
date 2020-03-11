all:
	tar zxf scheck-1.2.0.tar.gz
	cd scheck; patch -p1 <../scheck-1.2.0-compilation-fix.patch
	cd scheck; make
	cp scheck/scheck2 ../../bin/
	
clean:
	rm -rf scheck
	rm -rf ../../bin/scheck2
