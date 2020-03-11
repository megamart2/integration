
int * a ;

int main() {
	int ** ap;
	int *a2;
	int b;
	a = &b;
	ap = &a;	/* should not match */
	*a = 3;
	b = *a;		/* should not match */
	printf("should match get(int *a) \n");
	a2 = a;
	return 0;
}

