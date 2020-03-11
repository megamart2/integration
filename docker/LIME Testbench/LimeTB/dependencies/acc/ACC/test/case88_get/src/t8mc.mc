
int  a ;
int d;
int main() {
	typeof(a) b;
	int c;

	c = __alignof__(a);

	c = sizeof(a);

	c = __builtin_offsetof(struct A , a);

}


