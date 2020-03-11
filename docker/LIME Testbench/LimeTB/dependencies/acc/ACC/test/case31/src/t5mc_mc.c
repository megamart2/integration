
/* keyword is used as enum name */

#define KEYUSE5(x) \
	enum x { x##x };

KEYUSE5(before)
KEYUSE5(after)
KEYUSE5(around)

KEYUSE5(call)
KEYUSE5(execution)
KEYUSE5(args)
KEYUSE5(result)
KEYUSE5(infile)
KEYUSE5(infunc)

KEYUSE5(proceed)
 
