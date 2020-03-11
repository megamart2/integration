
int around() : call (int foo3(char )) || call (int foo4(int, int)) {
	int k;
	int temp = 3;
	
	printf("in around aspect \n"); 

	return temp +  proceed();
}
