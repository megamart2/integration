typedef int INT;

before (): infunc(main) && args (INT *)     
{
	printf("match call using args (int *) \n");
}

before (): infunc(main) && args( INT )  
{
	printf("match call using args (int ) \n");
}

