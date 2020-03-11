#ifndef YICESSOLVER_H 
#define YICESSOLVER_H 

#include <iostream> 
#include <string> 
#include <cstring>
#include <sstream>
#include <list>

extern "C" {
#include "yices_c.h" 
}

using namespace std;

class YicesSolver 
{
public:
    YicesSolver();         
    void solve (string constraint);
    string getSolution();

private:
    yices_context context;
    yices_type intType;
    yices_type booleanType;
    list<yices_var_decl> variables;
    string solution;

    void buildConstraint (string constraint);
    void buildExpression (const string& constraint, int& location, yices_expr& expression);
    bool isNumber(const string& myString);
    bool isVariable(const string& myString);
    void solveContext();
};

#endif
