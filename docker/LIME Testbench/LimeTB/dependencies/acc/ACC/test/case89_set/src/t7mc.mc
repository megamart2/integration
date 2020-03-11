int t;
int * a = &t ;

int main() {
	int ** ap;
	int *a2;
	int b;
	*a = 4;		/* should not match */
	ap = &a;	/* should not match */
	printf("should match set(int *a) \n");
	a = &b;
	printf("should match set(int *a) \n");
	a = a2;
	return 0;
}

