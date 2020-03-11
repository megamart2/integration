/* recognize integer suffix */



int foo3() {
	printf("inside foo3\n");
	return 0;
}

int foo4() {
	printf("call foo3 inside foo4\n");
	foo3();
	printf("end of call foo3 inside foo4\n");
}


int main() {
	
	int a = 1ul + 1uL + 1u + 1Ul + 1UL + 1U + 1l + 1L + 1;

	printf("call foo3 inside main, a= %d \n", a);

	foo3();

	printf("end of calling foo3 inside main\n");
	
	foo4();

        return 0;
}
