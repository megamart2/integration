void around(): execution(void foo()) {
	printf("aspect 1\n");
	proceed();
}
void around(): execution(void foo()) {
        printf("aspect 2\n");
        proceed();
}
void around(): execution(void foo()) {
        printf("aspect 3\n");
        proceed();
}
void around(): execution(void foo()) {
        printf("aspect 4\n");
        proceed();
}
void around(): execution(void foo()) {
        printf("aspect 5\n");
        proceed();
}
void around(): execution(void foo()) {
        printf("aspect 6\n");
        proceed();
}
void around(): execution(void foo()) {
        printf("aspect 7\n");
        proceed();
}

void around(): execution(void foo()) {

	printf("aspect 8\n");
	proceed();
}
