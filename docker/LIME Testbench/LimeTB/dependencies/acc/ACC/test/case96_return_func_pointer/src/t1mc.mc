void (*myabc(int a , void (*func)(int )))(int) {
	printf("inside myabc\n");
	return func;
}

void p(int b) {

}

int main() {

	myabc(3, p);

	return 0;
}
