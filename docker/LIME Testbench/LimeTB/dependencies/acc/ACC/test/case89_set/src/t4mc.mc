typedef int myintt;

myintt daf = 1;

int a = 2;


int main() {
	int j = 9 ;

	j= daf = j;

	printf("daf = %d\n", daf);

	a += j;

	printf("a = %d\n", a);
	return 0;
}

