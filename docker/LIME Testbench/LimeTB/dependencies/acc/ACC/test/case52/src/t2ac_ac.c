
introduce(): intype(MYSTRX3) {
        double f;
}

introduce(): intype(MYSTRX4) {
        double g;
}

introduce(): intype(MYSTRX5) {
        double h;
}

introduce(): intype(MYSTRX6) {
        double i;
}

introduce(): intype($STR$) {
	char * point;
}

after(): execution($ main(...)) {
	printf("aspect 2: after execution main\n");
}

/* the introduce() advice from the manual */

introduce() : intype(struct E) { 

   double b;

}

introduce() : intype(MYE1) { 

  double c;

}

introduce() : intype(MYE3) {

   double c;

}

introduce(): intype(MYE3) || intype(MYE1) { 

  char * p;
}

