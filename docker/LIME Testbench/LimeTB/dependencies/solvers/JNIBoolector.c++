#include <jni.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <iostream> 
#include <string> 
#include <cstring>
#include <list>

#include "fi_hut_ics_lime_tester_solver_Boolector.h"
#include "BoolectorSolver.h"

using namespace std;

JNIEXPORT jstring JNICALL Java_fi_hut_ics_lime_tester_solver_Boolector_boolectorSolveBV (JNIEnv* env, jobject jobj, jstring str)
{
    const char* utf_string;
    jboolean isCopy;
    utf_string = env->GetStringUTFChars (str, &isCopy);
    
    BoolectorSolver solver;
    string constraint;
    string result;

    constraint = utf_string;
    result = solver.solve(constraint);

    if (isCopy == JNI_TRUE)
       env->ReleaseStringUTFChars (str, utf_string);
    
    return env->NewStringUTF(result.c_str());

}
