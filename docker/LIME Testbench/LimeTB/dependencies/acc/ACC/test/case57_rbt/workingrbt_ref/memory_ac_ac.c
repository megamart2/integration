#include <stdlib.h>

size_t totalMemoryMalloced ;

after(size_t mem): call($ malloc(...)) && args(mem) && cflow (call($ test_correctness(...))) {
	totalMemoryMalloced += mem;
}

before(): execution($ main(...)) {
	totalMemoryMalloced = 0;
}

after(): execution($ main(...)) {
	printf("aspect: total memory allocated = %d\n", totalMemoryMalloced);
}
