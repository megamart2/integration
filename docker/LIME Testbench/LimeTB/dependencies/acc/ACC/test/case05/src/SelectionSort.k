
void foo3(short  p1, int p2) {
	printf("here is foo3, short = %d, int = %d\n", p1, p2);
	return p2 -1;
}

void foo4(int c) {
	printf("here is foo4, c = %d\n", c);
}

int foo5(int d, int e) {
	printf("here is foo5, input = %d , %d\n", d, e);
	
	return d+e;
}


int main() {
	int pp;
	pp = 99;

	foo3(2, pp);

 
	return 0;
}
