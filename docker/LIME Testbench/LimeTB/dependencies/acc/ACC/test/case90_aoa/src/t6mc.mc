extern int a;
extern char b;

int main() {
	printf("set a in main \n");
	a = 3;
	printf("get a = %d in main \n", a);
	
	printf("set b in main \n");
        b = 'x';
        printf("get b = %c in main \n", b);

	return 0;
}

