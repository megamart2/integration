// z3 -smt2 -m -in -rs:0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define BUFSIZE 1024
#define VARSIZE 100

typedef struct {
	// int might not be enough
	int value;
	int bitwidth;
	// maybe also store variable type or something here
} Var;

char buf[BUFSIZE];

void error(char *msg) {
	printf("%s\n", msg);
	exit(1);
}

int accept(int x) {
	int c = getchar();
	if (c == x)
		return 1;
	ungetc(c, stdin);
	return 0;
}

void expect(int x) {
	if (!accept(x))
		error("encountered unexpected character");
}

int readvalue() {
	int value, c, i = 0;
	expect(' ');
	expect('-');
	expect('>');
	expect(' ');
	expect('b');
	expect('v');
	while(isdigit(c = getchar()))
		buf[i++] = c;
	ungetc(c, stdin);
	buf[i] = 0;
	if (sscanf(buf, "%d", &value) != 1)
		error("failed to read input variable value");
	return value;
}

int readbitwidth() {
	int bw, c, i = 0;
	expect('[');
	while(isdigit(c = getchar()))
		buf[i++] = c;
	ungetc(c, stdin);
	buf[i] = 0;
	if (sscanf(buf, "%d", &bw) != 1)
		error("failed to read input variable bit width");
	return bw;
}

void ignorewhitespace() {
	int c;
	while (isspace(c = getchar()))
		;
	ungetc(c, stdin);
}

int main(int argc, char **charv) {
	int c, i, last = 0;
	Var vars[VARSIZE];

	while (1) {
		i = 0;
		ignorewhitespace();
		if (accept(EOF)) {
			break;
		}
		while (!isspace(c = getchar())) {
			// skip quotation marks
			if (c == '"')
				continue;
			buf[i++] = c;
		}
		ungetc(c, stdin);
		buf[i] = 0;
		if (!strcmp(buf, "unsat")) {
			printf("unsat\n");
			exit(0);
		}
		else if (!strncmp(buf, "input_", 6)) {
			int id;
			Var var;
			if (sscanf(&buf[6], "%d", &id) != 1)
				error("failed to read input variable id");
			// need to substract one from id as the numbering of input variables
			// starts from 1 and array indices from 0
			id--;
			var.value = readvalue();
			var.bitwidth = readbitwidth();
			expect(']');
			vars[id] = var;
			if (id > last)
				last = id;
		}
	}
	
	for (i = 0; i <= last; i++) {
		printf("%d ", vars[i].value);
	}
	printf("\n");
	exit(0);
}
