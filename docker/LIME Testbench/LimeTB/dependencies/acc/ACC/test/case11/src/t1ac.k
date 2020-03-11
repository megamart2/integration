
before ():infile("t1mc.k") && call(int foo3()) && infunc(main)    
{
	printf("match all foo3 in main of t1mc.c \n"); 
}

before (): infile("t2mc.k") && call(int foo3()) 
{
	printf("match call foo3 in t2mc.c\n");
}

