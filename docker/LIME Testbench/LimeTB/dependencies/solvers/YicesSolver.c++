#include "YicesSolver.h"

using namespace std;

YicesSolver::YicesSolver() 
{
    context     = yices_mk_context();
    intType     = yices_mk_type(context, "int");
    booleanType = yices_mk_type(context, "bool");
    solution    = "empty";
}



void 
YicesSolver::solve (string constraint) 
{
    int i        = 0;
    int location = 0;
    int start    = 0;

    solution = "empty";
    yices_reset(context);
    context     = yices_mk_context();
    intType     = yices_mk_type(context, "int");
    booleanType = yices_mk_type(context, "bool");

    while (i != string::npos) { 
        i = constraint.find("D", location);
        buildConstraint(constraint.substr(location, i - location));
        location = i + 1;
    }

    solveContext();	
}


string 
YicesSolver::getSolution()
{
    return solution;
}



bool
YicesSolver::isNumber (const string& myString)
{
    if (myString[0] >= '0' && myString[0] <= '9')
        return true;

    if (myString.length() > 1)
        if (myString[0] == '-' && myString[1] >= '0' && myString[1] <= '9')
            return true;

    return false;
}



bool
YicesSolver::isVariable (const string& myString)
{
    if ((myString[0] >= 'a' && myString[0] <= 'z') || (myString[0] >= 'A' && myString[0] <= 'Z') || myString[0] == '_' || myString[0] == '$') 
        return true;   

    return false;
}



void
YicesSolver::buildExpression (const string& constraint, int& location, yices_expr& expression)
{
    string token;
    int i = 0;
    bool hasAnswer = false;
    string temp;

    i        = constraint.find(" ",location);
    token    = constraint.substr(location,i-location);
    location = i + 1;
    
    if (isNumber(token)) {
        char *temp;
        
        temp = new char[token.length() + 1];
        strcpy(temp, token.c_str());

        expression = yices_mk_num_from_string(context, temp);

        delete[] temp;
    }  
    else if (token.compare("true") == 0)
    {
        expression = yices_mk_true(context);
    }
    else if (token.compare("false") == 0)
        expression = yices_mk_false(context);
    else if (isVariable(token)) {
    
        list<yices_var_decl>::iterator myIterator;

        for (myIterator = variables.begin(); myIterator != variables.end(); myIterator++ ) {
            temp = yices_get_var_decl_name(*myIterator);
            if (token == temp) {
                expression = yices_mk_var_from_decl(context, *myIterator);
                hasAnswer = true;
                myIterator = variables.end();
                myIterator--;
            }
        }       
        if (hasAnswer == false) {
            char *temp;
        
            temp = new char[token.length() + 1];
            strcpy(temp, token.c_str());
    
            yices_var_decl newVariable;

            if (token[0] == 'i' || token[0] == 'u' || token[0] == 'O')
                newVariable = yices_mk_var_decl(context, temp, intType);  
            else if (token[0] == 'b')
                newVariable = yices_mk_var_decl(context, temp, booleanType);

            expression = yices_mk_var_from_decl(context, newVariable); 
            variables.push_back(newVariable);

            delete[] temp;
        }
    }
    else if (token[0] == '+') {
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        expression = yices_mk_sum(context, args, 2);
    
    }
    else if (token[0] == '-') { 
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        expression = yices_mk_sub(context, args, 2);
    
    }
    else if (token[0] == '*') { 
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        expression = yices_mk_mul(context, args, 2);
    
    }
    else if (token[0] == '/') {
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        yices_var_decl div_decl = yices_get_var_decl_from_name(context, "div");
        yices_expr div = yices_mk_var_from_decl(context, div_decl);

        expression = yices_mk_app(context, div, args, 2);

    }
    else if (token[0] == '!' && token[1] == '=') {
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        expression = yices_mk_diseq(context, args[0], args[1]);        
    }
    else if (token[0] == '=' && token[1] == '=') {
        yices_expr args[2];

        buildExpression(constraint, location, args[0]);
        buildExpression(constraint, location, args[1]);

        expression = yices_mk_eq(context, args[0], args[1]); 

    }  
    else if (token[0] == '!') {
        yices_expr arg;

        buildExpression(constraint, location, arg);

        expression = yices_mk_not(context, arg);

    }
    else {
        cout << "ERROR: invalid path constraint or unsupported arithmetic operator (buildExpression)\n";
        cout << token << "\n";
        // Error handling?
    }
} 



void
YicesSolver::buildConstraint (string constraint)
{
    yices_expr expression1;
    yices_expr expression2;
    yices_expr result;
    
    int comparator = 0;
    int location = 0;

    location = constraint.find(" ", 0);
    location++;

    buildExpression(constraint, location, expression1);
    buildExpression(constraint, location, expression2);

    //Error handling?

    if (constraint[0] == '<' && constraint[1] == ' ')
        result = yices_mk_lt(context, expression1, expression2);
    else if (constraint[0] == '>' && constraint[1] == ' ')
        result = yices_mk_gt(context, expression1, expression2);
    else if (constraint[0] == '<' && constraint[1] == '=')
        result = yices_mk_le(context, expression1, expression2);
    else if (constraint[0] == '>' && constraint[1] == '=')
        result = yices_mk_ge(context, expression1, expression2);
    else if (constraint[0] == '=' && constraint[1] == '=')
        result = yices_mk_eq(context, expression1, expression2);
    else if (constraint[0] == '!' && constraint[1] == '=')
        result = yices_mk_diseq(context, expression1, expression2);
    else
        cout << "ERROR: invalid path constraint or unsupported arithmetic operator (buildContraint)\n";

    yices_assert(context, result);

}



void 
YicesSolver::solveContext()
{
    lbool satisfiability;
    yices_model model;
    list<yices_var_decl>::iterator myIterator;
    long* value;
    
    satisfiability = yices_check(context);
    model = yices_get_model(context);
    solution = "";
    *value = 0;

    switch (satisfiability) {
        case l_true:
            for (myIterator = variables.begin(); myIterator != variables.end(); myIterator++ ) {
                char* name = yices_get_var_decl_name(*myIterator);
                lbool bvalue;
                ostringstream o;

                if (name[0] == 'i' || name[0] == 'u' || name[0] == 'O') {
                    yices_get_int_value(model, *myIterator, value);
                     o << *value;
                }
                else if (name[0] == 'b') {
                    bvalue = yices_get_value(model, *myIterator);
                    
                    if (bvalue == l_true)
                        o << "true";
                    else
                        o << "false";
                }

                solution = solution + name;
                solution = solution + " " + o.str() + " ";
            }   
          
        break;  
        case l_false:
            solution = "unsat";
        break;
        case l_undef:
            solution = "unknown";
        break;
    }
}



int main() 
{
	YicesSolver solver;
	//solver.solve(">= + s0 5 8&> s1 1&!= s0 s1&== b2 ! b3");
    //solver.solve("== b0 b_input_1&== b0 false");
    solver.solve("== int32_input_1 int32_1D== int32_1 / int32_1 1");
    //solver.solve("> x 5");
    cout << solver.getSolution() + "\n";

	return 0;
}
