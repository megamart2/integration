
before (): infunc(main) && args (int *)     
{
	printf("match call using args (int *) \n");
}

before (): infunc(main) && args( int )  
{
	printf("match call using args (int ) \n");
}

