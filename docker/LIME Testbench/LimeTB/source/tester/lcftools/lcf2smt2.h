#define ASSERTS_INCREMENT 20
#define VARS_INCREMENT 20
#define BUFSIZE 1024
#define REFERENCE_BITWIDTH 16

enum vartype {
	CONST, SIGNED, UNSIGNED, BOOLEAN, REFERENCE
};

enum exptype {
	VAR, OP
};

enum optype {
	LT, LTE, GT, GTE, EQ, NE, ADD, SUB, MUL, DIV, REM, SLL, SRL, OR, AND, XOR
};

enum opsign {
	OPUNSIGNED = 0, OPSIGNED = 1, WHATEVER = 2
};

typedef struct {
	enum vartype type;
	// for constants
	int value;
	// for non-constants
	int bitwidth;
	char *name;
} Var;

typedef struct {
	enum exptype type;
	// if type == VAR
	Var *var;
	// if type == OP
	enum optype op;
	Var *lhs, *rhs;
} Exp;

typedef struct {
	enum optype op;
	Var *lhs;
	Exp rhs;
} Assert;

void error(char *);

void ignorewhitespace();

int accept(int);
void expect(int);

void addAssert(Assert);
Var *addVar(Var);

Assert readAssert();
Exp readExp();
Var *readVar();
int readop(enum optype *);
int readbitwidth(int *);
int readvalue(int *);
int isnamechar(int);
int readname(char **);

void printdeclares();

void printasserts();
void printop(enum optype, enum opsign);
void printExp(Exp, int);
void printVar(Var *, int);


int getmaxbw(Assert);
enum opsign getopsignAss(Assert);
enum opsign getopsignExp(Exp);
enum opsign getopsignVar(Var *);
