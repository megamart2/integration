
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

/* the example in the manual */
struct E { 

   int a;

};

typedef struct E MYE1;

typedef MYE1  MYE2;

typedef struct { 

  int b;

} MYE3;

typedef MYE3 MYE4;


/*******************************/
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

	printf("size of struct E = %d, MYE3 = %d\n", sizeof(struct E), sizeof(MYE3));

	return 0;		
}

