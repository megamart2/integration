#define BASE_MON_ADDR 0x81000000

#include <stdio.h>


int main()

{

	unsigned int *base_monitor = (unsigned int *)BASE_MON_ADDR;
	unsigned int *base_memory = (unsigned int *) 0x50000000;

// start the monitor
	*base_monitor = 66; //range address mode and soft reset to monitor
	*(base_monitor + 1) = 0x40; //lower part of the range to be monitored
	*(base_monitor + 2) = 0x60000000; //upper part of the range to be monitored
	*(base_monitor + 3) = 34; // run monitor

// monitored application
	*base_memory = 8;
	*base_memory = *base_memory + 9;
// we performed three memory accesses, so the monitor results we expect is 3.

// stop the monitor and read results
	*base_monitor = 2;//power off monitor

	printf ("The number of memory accesses within the range from %x to %x is equal to %d", *(base_monitor + 1), *(base_monitor + 2), *(base_monitor + 4));

	return 0;

}
