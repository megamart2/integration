
int foo(_Bool a) {
  printf("in foo, a = %d\n", (int)(a));
  return 0;
}

int main() {
	foo(1);
	return 0;
}
