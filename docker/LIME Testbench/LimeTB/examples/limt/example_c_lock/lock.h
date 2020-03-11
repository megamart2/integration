typedef struct lock {
  int locked;
} lock_t;

/*@ CallSpecifications(
        callPropositions = {
            "lock ::= lock()",
            "unlock ::= unlock()"
        },
        regexp = {"alternation ::= (lock ; unlock)*"}
)@*/

/*@ Instance(instance = {"foo"}) @*/
void lock(lock_t *foo);
/*@ Instance(instance = {"bar"}) @*/
void unlock(lock_t *bar);
void something();
void somethingelse();
