
struct s {
	int (*f)(void);
};

/* 
int my_f1(void);
int my_f2(void);
*/

int call_f(struct s *my_s)
{
	int (*f)(void);
	int (*f2)(void);
	f = my_s->f;
	f();
}

int my_f1(void) {
	printf("Function \"my_f1\" has been called\n");
}

int my_f2(void) {
	printf("Function \"my_f2\" has been called\n");
}

int f(void) {
	printf("Function \"f\" has been called\n");
}

int main(int argc, char *argv[]) {
	struct s my_s;
	my_s.f = &my_f1;
	call_f(&my_s);
	my_s.f = &my_f2;
	call_f(&my_s);
	return 0;
}

