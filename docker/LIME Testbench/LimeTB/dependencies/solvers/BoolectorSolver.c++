
#include <list>

#include "BoolectorSolver.h"

using namespace std;

BoolectorSolver::BoolectorSolver()
{
    btor = boolector_new();
    boolector_enable_model_gen(btor);
    solution = "";
}



string
BoolectorSolver::solve (string constraint)
{
    size_t i        = 0;
    int j           = 0;
    int location    = 0;
    int temp        = 0;
    int variables;
    string lines;
    string returnVariables;
    BtorExp **expressions;
    list<int> returnList;

    i = constraint.find("\n", location);
    lines = constraint.substr(location, i - location);
    location = i + 1;

    temp = lines.find(":") + 2;
    stringstream ss(lines.substr(temp, lines.length() - 1));
    
    if ((ss >> variables).fail() ) {
        cout << "ERROR: failed to read the number of lines in a constraint\n";
        exit(1);
    }

    i = constraint.find("\n", location);
    returnVariables = constraint.substr(location, i - location);
    location = i + 1;

    size_t l = 0;
    int p = 0;

    l = returnVariables.find(" ", p);
    p = l + 1;

    while (l != string::npos) {
        int t = 0;
        l = returnVariables.find(" ", p);
        stringstream sstream(returnVariables.substr(p, l - p));
        if ((sstream >> t).fail() ) {
            cout << "ERROR: failed to parse a constraint in btor format\n";
            exit(-1);
        }

        returnList.push_back(t);

        p = l + 1;
    }

    expressions = new BtorExp *[variables + 1];

    j = 0;

    while (i != string::npos) {
        i = constraint.find("\n", location);
        int k = 0;

        while (true) {
            if (constraint.at(k + location) == ' ')
                break;
            k++;
        }

        stringstream ss2(constraint.substr(location, k));
        if ((ss2 >> j).fail() ) {
            cout << "ERROR: failed to read an identifier in a constraint\n";
            exit(-1);
        }

        k++;

        expressions[j] = buildExpression(constraint.substr(location + k, i - location - k), expressions);
        location = i + 1;
        
    }

   
    int dumpFile = 0;
    
    if (dumpFile == 1) {
        FILE * pFile;
        char timestamp [128];
        time_t now = time(NULL);

        strftime (timestamp, sizeof (timestamp), "%Y%m%d_%H%M%S", localtime (&now));
        pFile = fopen (timestamp , "w");

        boolector_dump_btor(btor, pFile, expressions[j]);
    //    boolector_dump_smt(btor, pFile, expressions[j]);

        fclose (pFile);
    }

    clock_t tstart=0, tstop=0;
    tstart = clock();

    boolector_assert(btor, expressions[j]);

    int result = boolector_sat (btor);

    tstop = clock();
   // cout << 1000*(double)(tstop-tstart)/(double)(CLOCKS_PER_SEC) << " (ms)" << std::endl;

    if (result == BOOLECTOR_SAT) {
        for (list<int>::iterator it = returnList.begin(); it != returnList.end(); it++) {
            solution += boolector_bv_assignment(btor, expressions[*it]);
            solution += "\n";
        }
    }
    else
        solution = "unsat";

    for (j = 1; j < variables + 1; j++)
        boolector_release(btor, expressions[j]);

    boolector_delete(btor);

    delete [] expressions;

    return solution;
}


string 
BoolectorSolver::getSolution()
{
    return solution;
}



BtorExp *
BoolectorSolver::buildExpression (const string &constraint, BtorExp **expressions)
{
    int bitwidth    = 0;
    int first       = 0;
    int second      = 0;
    int third       = 0;
    size_t i        = 0;
    int location    = 0;
    int target      = 0;
    string name;
    bool declaration = false;

    if (constraint.find("var ") != string::npos)
        declaration = true;

    while (i != string::npos) {
        i = constraint.find(" ", location);

        stringstream ss(constraint.substr(location, i - location));
        
        if (target == 1) {
            if ((ss >> bitwidth).fail() ) {
                cout << "ERROR: failed to parse a constraint in btor format (1)\n";
                exit(-1);
            }
        }
        else if (target == 2 && !declaration) {
            if ((ss >> first).fail()) {
                cout << "ERROR: failed to parse a constraint in btor format (2)\n";
                cout << constraint;
                exit(-1);
            }
        }
        else if (target == 2 && declaration) {
            name = constraint.substr(location, i - location);
        }
        else if (target == 3) {
            if ((ss >> second).fail() ) {
                cout << "ERROR: failed to parse a constraint in btor format (3)\n";
                exit(-1);
            }
        }
        else if (target == 4) {
            if ((ss >> third).fail() ) {
                cout << "ERROR: failed to parse a constraint in btor format (4)\n";
                exit(-1);
            }
        }

        location = i + 1;
        target++;

    }   

    if (constraint.find("constd ") != string::npos) {
        return boolector_int(btor, first, bitwidth);  // returns only signed ints (possible problem?)
    }
    else if (constraint.find("var ") != string::npos) {
        return boolector_var(btor, bitwidth, name.c_str());
    }
    else if (constraint.find("slte ") != string::npos) {
        return boolector_slte(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("ult ") != string::npos) {
        return boolector_ult(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("slt ") != string::npos) {
        return boolector_slt(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("ulte ") != string::npos) {
        return boolector_ulte(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("ugt ") != string::npos) {
        return boolector_ugt(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("ugte ") != string::npos) {
        return boolector_ugte(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sgt ") != string::npos) {
        return boolector_sgt(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sgte ") != string::npos) {
        return boolector_sgte(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("not ") != string::npos) {
        return boolector_not(btor, expressions[first]);
    }
    else if (constraint.find("neg ") != string::npos) {
        return boolector_neg(btor, expressions[first]);
    }
    else if (constraint.find("and ") != string::npos) {
        return boolector_and(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("or ") != string::npos) {
        return boolector_or(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("eq ") != string::npos) {
        return boolector_eq(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("ne ") != string::npos) {
        return boolector_ne(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("add ") != string::npos) {
        return boolector_add(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("mul ") != string::npos) {
        return boolector_mul(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sub ") != string::npos) {
        return boolector_sub(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("udiv ") != string::npos) {
        return boolector_udiv(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sdiv ") != string::npos) {
        return boolector_sdiv(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("srem ") != string::npos) {
        return boolector_srem(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sll ") != string::npos) {
        return boolector_sll(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("srl ") != string::npos) {
        return boolector_srl(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("sra ") != string::npos) {
        return boolector_sra(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("xor ") != string::npos) {
        return boolector_xor(btor, expressions[first], expressions[second]);
    }
    else if (constraint.find("slice ") != string::npos) {

        return boolector_slice(btor, expressions[first], second, third);
    }
    else if (constraint.find("sext ") != string::npos) {

        return boolector_sext(btor, expressions[first], second);
    }
    else {
        cout << "ERROR: unknown operator in path constraint (C-library)\n";
        cout << constraint;
        cout << "\n";
        exit(-1);
    }
    
   return NULL;
}

int main() {
    BoolectorSolver solver;

    cout << solver.solve("Lines: 11\nReturn: 5 6\n6 constd 32 6\n5 constd 32 5\n3 constd 32 3\n2 constd 32 2\n1 var 32\n4 var 32\n7 slt 1 1 2\n8 sgt 1 1 3\n9 eq 1 1 4\n10 sgte 1 1 5\n11 slte 1 1 6");

   // cout << solver.getSolution() + "\n";

    return 0;
}
