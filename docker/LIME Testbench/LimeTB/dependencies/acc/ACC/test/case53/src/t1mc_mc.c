
struct            A {
	char * firstname;
};

union              B {
	char firstname;
};

typedef struct {
	char a;
} STRD;

typedef struct X {
	char a;
} MYSTRX;


typedef MYSTRX MYSTRX2;

typedef struct X MYSTRX3;

typedef MYSTRX3 MYSTRX4;

typedef MYSTRX4 MYSTRX5;

typedef MYSTRX5 * MYSTRX6;

int main() {
	printf("size of struct A = %d\n", sizeof(struct A));

	printf("size of union B = %d\n", sizeof(union B));

	printf("size of STRD = %d\n", sizeof(STRD));

	printf("size of struct X = %d\n", sizeof(struct X));
	
	printf("size of MYSTRX = %d, %d, %d, %d , %d , %d\n", 
			sizeof(struct X),
			sizeof(MYSTRX),
			sizeof(MYSTRX2),
			sizeof(MYSTRX3),
			sizeof(MYSTRX4),
			sizeof(MYSTRX5));
	printf("size of MYSTRX6 = %d\n", sizeof(MYSTRX6));

	return 0;		
}

