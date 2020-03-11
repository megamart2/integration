#ifndef BOOLECTORSOLVER_H
#define BOOLECTORSOLVER_H

#include <iostream>
#include <string>
//#include <cstring>
#include <sstream>
#include <ctime>
#include <cstdlib>
//#include <list>

#include <stdio.h>

extern "C" {
#include "boolector.h"
}

using namespace std;

class BoolectorSolver
{
public:
    BoolectorSolver();
    string solve (string constraint);
    string getSolution();

private:
    Btor *btor;
    string solution;

    BtorExp * buildExpression (const string &constraint, BtorExp **expressions);
};

#endif
