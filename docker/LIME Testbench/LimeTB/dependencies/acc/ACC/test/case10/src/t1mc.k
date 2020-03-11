

int foo3(char k) {
        printf("inside foo3, parameter =  %d, return 99 \n", k);
	return 99;
}

int foo4(int a, int b) {
	printf("inside foo4, parameter = %d + %d \n", a, b);
	return a * b;
}



int main() {

        printf("result of foo3 = %d\n", foo3(3));


	printf("result of foo4 = %d\n", foo4(3, 8));
	
        return 0;
}
