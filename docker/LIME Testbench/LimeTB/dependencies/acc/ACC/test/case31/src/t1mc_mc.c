
/* keyword is used as parameter name, struct member, function name */

#define KEYUSE1(x) \
	int x##x (int x ); \
	struct x##x##x { int x ; }; \
	int x ();


KEYUSE1(before)
KEYUSE1(after)
KEYUSE1(around)

KEYUSE1(call)
KEYUSE1(execution)
KEYUSE1(args)
KEYUSE1(result)
KEYUSE1(infile)
KEYUSE1(infunc)

KEYUSE1(proceed)

