
/* keyword is used as typedef name */

#define KEYUSE4(x) \
	typedef int x ; \
	x x##x () { return 1 ; }

KEYUSE4(before)
KEYUSE4(after)
KEYUSE4(around)

KEYUSE4(call)
KEYUSE4(execution)
KEYUSE4(args)
KEYUSE4(result)
KEYUSE4(infile)
KEYUSE4(infunc)

KEYUSE4(proceed)
 
