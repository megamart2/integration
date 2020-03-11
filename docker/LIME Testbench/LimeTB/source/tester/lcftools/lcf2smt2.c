// S -> C | C 'D' S
// C -> OP V E
// E -> V | OP V V
// OP -> '==' | '<' | '>' | '<=' | '>=' | ...
// V -> 'i' <int> '_' <name> | 'u' <int> '_' <name> | 
//      'b' '_' <name> | 'O' '_' <name> | <const>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "lcf2smt2.h"

char buf[BUFSIZE];

int assertslen = 0;
Assert *asserts = 0;
int assertscount = 0;

int varslen = 0;
Var *vars = 0;
int varscount = 0;

void addAssert(Assert assert) {
	if (assertscount >= assertslen) {
		assertslen += ASSERTS_INCREMENT;
		// should be equal to malloc(size) the first time this is called
		asserts = realloc(asserts, sizeof(Assert)*assertslen);
	}
	asserts[assertscount++] = assert;
}

Var *addVar(Var var) {
	int i;
	if (var.type != CONST) {
		for (i = 0; i < varscount; i++) {
			if (vars[i].type == CONST) {
				continue;
			}
			else if (!strcmp(var.name, vars[i].name)) {
				// make sure the bit widths are the same for sanity
				if (var.bitwidth != vars[i].bitwidth)
					error("variable bit width mismatch");
				free(var.name);
				return &vars[i];
			}
		}
	}
	if (varscount >= varslen) {
		varslen += VARS_INCREMENT;
		// should be equal to malloc(size) the first time this is called
		vars = realloc(vars, sizeof(Var)*varslen);
	}
	vars[varscount++] = var;
	return &vars[varscount-1];
}

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

void ignorewhitespace() {
	int c;
	while (isspace(c = getchar()))
		;
	ungetc(c, stdin);
}

int main(int argc, char **argv) {
	int i;

	while (1) {
		Assert assert = readAssert();
		addAssert(assert);
		if (!accept('D')) {
			ignorewhitespace();
			expect(EOF);
			break;
		}
	}

	printf("(set-logic QF_BV)\n");
	printdeclares();
	printasserts();
	// not really sure what is necessary, this works with z3 to a degree
	printf("(check-sat)\n");
	printf("(get-info model)\n");
	printf("(exit)\n");

	free(asserts);
	for (i = 0; i < varscount; i++) {
		if (vars[i].type != CONST)
			free(vars[i].name);
	}
	free(vars);
}

Assert readAssert() {
	Assert assert;
	if (!readop(&assert.op))
		error("reading operator failed");
	expect(' ');
	assert.lhs = readVar();
	expect(' ');
	assert.rhs = readExp();
	return assert;
}

Exp readExp() {
	Exp exp;
	enum optype op;
	if (readop(&op)) {
		expect(' ');
		exp.type = OP;
		exp.op  = op;
		exp.lhs = readVar();
		expect(' ');
		exp.rhs = readVar();
	} else {
		exp.type = VAR;
		exp.var = readVar();
	}
	return exp;
}

Var *readVar() {
	Var var;
	if (accept('i')) {
		var.type = SIGNED;
		if (!readbitwidth(&var.bitwidth))
			error("reading variable bit width failed");
		expect('_');
		if (!readname(&var.name))
			error("reading variable name failed");
	}
	else if (accept('u')) {
		var.type = UNSIGNED;
		if (!readbitwidth(&var.bitwidth))
			error("reading variable bit width failed");
		expect('_');
		if (!readname(&var.name))
			error("reading variable name failed");
	}
	else if (accept('b')) {
		var.type = BOOLEAN;
		var.bitwidth = 1;
		expect('_');
		if (!readname(&var.name))
			error("reading variable name failed");
	}
	else if (accept('O')) {
		var.type = REFERENCE;
		var.bitwidth = REFERENCE_BITWIDTH;
		expect('_');
		if (!readname(&var.name))
			error("reading variable name failed");
	}
	else {
		var.type = CONST;
		// need to do something sensible about this
		var.bitwidth = -1;
		if (!readvalue(&var.value))
			// the value might be "true" or "false" maybe
			error("reading constant value failed");
	}
	return addVar(var);
}

int readop(enum optype *op) {
	int c = getchar();
	switch (c) {
		case '<':
			if (accept('='))
				*op = LTE;
			else if (accept('<'))
				*op = SLL;
			else
				*op = LT;
			break;
		case '>':
			if (accept('='))
				*op = GTE;
			else if (accept('>'))
				*op = SRL;
			else
				*op = GT;
			break;
		case '=':
			expect('=');
			*op = EQ;
			break;
		case '!':
			expect('=');
			*op = NE;
			break;
		case '+':
			*op = ADD;
			break;
		case '-':
			if (accept(' ')) {
				ungetc(' ', stdin);
				*op = SUB;
				break;
			}
		case '*':
			*op = MUL;
			break;
		case '/':
			*op = DIV;
			break;
		case '%':
			*op = REM;
			break;
		case '|':
			*op = OR;
			break;
		case '&':
			*op = AND;
			break;
		case '^':
			*op = XOR;
			break;
		default:
			ungetc(c, stdin);
			return 0;
	}
	return 1;
}

int readbitwidth(int *bitwidth) {
	int c, i = 0;
	while (isdigit(c = getchar()))
		buf[i++] = c;
	ungetc(c, stdin);
	buf[i] = 0;
	if (sscanf(buf, "%u", bitwidth) != 1)
		return 0;
	return 1;
}

int readvalue(int *value) {
	int c, i = 0;
	if ((c = getchar()) == '-')
		buf[i++] = c;
	else
		ungetc(c, stdin);
	while (isdigit(c = getchar()))
		buf[i++] = c;
	ungetc(c, stdin);
	buf[i] = 0;
	if (sscanf(buf, "%d", value) != 1)
		return 0;
	return 1;

}

int isnamechar(int c) {
	return (isalnum(c) || c == '_') && c != 'D';
}

int readname(char **name) {
	int c, i = 0;
	while (isnamechar(c = getchar()))
		buf[i++] = c;
	ungetc(c, stdin);
	buf[i] = 0;
	if (i < 1)
		return 0;
	// put "var" in front of everything that starts with a number, not sure if
	// this is necessary
	if (isdigit(buf[0])) {
		memcpy(&buf[4], &buf[0], i+1);
		memcpy(&buf[0], "var_", 4);
		i += 4;
	}
	*name = malloc(i+1);
	strcpy(*name, buf);
	return 1;
}

int getmaxbw(Assert assert) {
	int max = assert.lhs->bitwidth;
	if (assert.rhs.type == VAR) {
		if (assert.rhs.var->bitwidth > max) {
			max = assert.rhs.var->bitwidth;
		}
	}
	else {
		if (assert.rhs.lhs->bitwidth > max) {
			max = assert.rhs.lhs->bitwidth;
		}
		if (assert.rhs.rhs->bitwidth > max) {
			max = assert.rhs.rhs->bitwidth;
		}
	}
	return max;
		
}

enum opsign getopsignAss(Assert assert) {
	enum opsign lsign, rsign;
	lsign = getopsignVar(assert.lhs);
	rsign = getopsignExp(assert.rhs);
	if ((lsign == OPUNSIGNED && rsign == OPSIGNED) || 
		(lsign == OPSIGNED && rsign == OPUNSIGNED))
		error("comparison of signed and unsigned variables");
	else if (lsign == WHATEVER)
		return rsign;
	return lsign;
}

enum opsign getopsignExp(Exp exp) {
	enum opsign lsign, rsign;
	if (exp.type == VAR)
		return getopsignVar(exp.var);
	else {
		lsign = getopsignVar(exp.lhs);
		rsign = getopsignVar(exp.rhs);
		if ((lsign == OPUNSIGNED && rsign == OPSIGNED) || 
		    (lsign == OPSIGNED && rsign == OPUNSIGNED))
			error("comparison of signed and unsigned variables");
		else if (lsign == WHATEVER)
			return rsign;
		return lsign;
	}
}

enum opsign getopsignVar(Var *var) {
	if (var->type == UNSIGNED)
		return OPUNSIGNED;
	else if (var->type == SIGNED)
		return OPSIGNED;
	else
		return WHATEVER;
}

void printdeclares() {
	int i;
	for (i = 0; i < varscount; i++) {
		if (vars[i].type != CONST) {
			printf("(declare-fun %s () (_ BitVec %u))\n", 
			       vars[i].name, vars[i].bitwidth);
		}
	}
}

void printasserts() {
	int i, maxbw;
	for (i = 0; i < assertscount; i++) {
		maxbw = getmaxbw(asserts[i]);
		printf("(assert (");
		if (asserts[i].op == NE)
			printf("not (");
		printop(asserts[i].op, getopsignAss(asserts[i]));
		printf(" ");
		printVar(asserts[i].lhs, maxbw);
		printf(" ");
		printExp(asserts[i].rhs, maxbw);
		if (asserts[i].op == NE)
			printf(")");
		printf("))\n");
	}
}

// opunsigned != 0 -> use unsigned versions of operations where applicable
void printop(enum optype op, enum opsign opsigned) {
	// check the correct operations and signed / unsigned etc
	switch (op) {
		case LT:
			if (opsigned)
				printf("bvslt");
			else
				printf("bvult");
			break;
		case LTE:
			if (opsigned)
				printf("bvsle");
			else
				printf("bvule");
			break;
		case GT:
			if (opsigned)
				printf("bvsgt");
			else
				printf("bvugt");
			break;
		case GTE:
			if (opsigned)
				printf("bvsge");
			else
				printf("bvuge");
			break;
		case EQ:
			printf("=");
			break;
		case NE:
			// this is handled with (not (= ...))
			printf("=");
			break;
		case ADD:
			printf("bvadd");
			break;
		case SUB:
			printf("bvsub");
			break;
		case MUL:
			printf("bvmul");
			break;
		case DIV:
			if (opsigned)
				printf("bvsdiv");
			else
				printf("bvudiv");
			break;
		case REM:
			// make sure that these are correct ones to use
			if (opsigned)
				printf("bvsrem");
			else
				printf("bvurem");
			break;
		// make sure the logical vs arithmetic makes sense here
		case SLL:
			printf("bvshl");
			break;
		case SRL:
			printf("bvshr");
			break;
		case OR:
			printf("bvor");
			break;
		case AND:
			printf("bvand");
			break;
		case XOR:
			printf("bvxor");
			break;
		default:
			error("unknown op type (should not happen)");
	}
}

void printExp(Exp exp, int maxbw) {
	if (exp.type == VAR)
		printVar(exp.var, maxbw);
	else {
		printf("(");
		if (exp.op == NE)
			printf("not (");
		printop(exp.op, getopsignExp(exp));
		printf(" ");
		printVar(exp.lhs, maxbw);
		printf(" ");
		printVar(exp.rhs, maxbw);
		if (exp.op == NE)
			printf(")");
		printf(")");
	}
}

void printVar(Var *var, int maxbw) {
	if (var->type == CONST) {
		printf("(_ bv%d %d)", var->value, maxbw);
		return;
	}
	if (maxbw > var->bitwidth)
		printf("((_ sign_extend %d) ", maxbw - var->bitwidth);
	printf("(%s)", var->name);
	if (maxbw > var->bitwidth)
		printf(")");
}
