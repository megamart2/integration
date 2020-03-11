#include <stdio.h>

char * foo(int a) {
   return "just a test ";
}

void foo2(int a, double b) {
   foo(3);
}

void foo3() {
   foo2(5, 2.2);
}

int main() {
   foo3();
}

