#include <stdlib.h>
#include "rb.h"
introduce(): 
     intype (struct rb_table) {
        size_t rb_count;
}

after(struct rb_table * newtable) :
     execution($ rb_create(...)) && result (newtable) 
{       newtable->rb_count = 0; }


after(void ** res, struct rb_table * tree) : 
     call($ rb_probe(...)) && result(res) && args (tree, $)
 {     if(res)  tree->rb_count ++;  }


after(void * res, struct rb_table * tree): 
     call($ rb_delete(...)) && result (res) && args (tree, $) 
{        if(res) tree->rb_count --; }

before(const struct rb_table * tree) : 
     call($ print_whole_tree(...)) && args(tree, $) 
{        printf ("rbcount = %d , ", tree->rb_count); }

struct rb_table *  
around(const struct rb_table * org, 
	struct libavl_allocator *allocator) :
    call ($ rb_copy(...)) && args (org, ..., allocator) 
{
         if(org->rb_count == 0) {
	return rb_create(org->rb_compare,
                                              org->rb_param,
		allocator != NULL ? allocator :
			org->rb_alloc);
         } else {
	return proceed();
         }
}

after(struct rb_table * new, struct rb_table * org) : 
   call($ rb_copy(...)) && result(new)  && args(org, ...) 
{
         if(new) new->rb_count = org->rb_count;
}

/* a new advice applying to the verify_tree function in rb-test.c */
/* it is not included in the CASCON2006 slides */

int around(struct rb_table * tree, size_t n):
	execution($ verify_tree(...)) &&
	args(tree, $, n) {

   if(tree->rb_count != n) {
   	printf (" Tree count is %lu, but should be %lu.\n",
              (unsigned long) tree->rb_count, (unsigned long) n);
   	return 0;
   }else {
	return proceed();
   }
}
  
