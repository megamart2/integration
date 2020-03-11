
int __attribute__((__cdecl__)) gcc_attr1_in_ac(int *);
int * __attribute__((__cdecl__)) gcc_attr2_in_ac(int);

struct X_in_ac {
        int __attribute__((__cdecl__)) (* abc ) (int);
        int * __attribute__((__cdecl__)) (*def) (int);
};


before ():infile("t1mc.mc") && call(int foo3()) && infunc(main)    
{
	printf("match all foo3 in main of t1mc.c \n"); 
}

before (): infile("t2mc.mc") && call(int foo3()) 
{
	printf("match call foo3 in t2mc.c\n");
}

