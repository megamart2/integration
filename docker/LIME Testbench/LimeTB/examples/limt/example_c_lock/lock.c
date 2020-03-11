#include <stdlib.h>
#include <stdio.h>
#include "lime.h"
#include "lock.h"

int main() {
    _LIME_create_obs(alternation);
    lock_t *lock1 = malloc(sizeof(lock_t));
    _LIME_create_obs_inst(alternation, lock1);
    lock_t *lock2 = malloc(sizeof(lock_t));
    _LIME_create_obs_inst(alternation, lock2);

    lock(lock1);
    unlock(lock1);
    lock(lock2);
    lock(lock1);
    unlock(lock1);
    lock(lock2);

    _LIME_free_obs_inst(alternation, lock1);
    free(lock1);
    _LIME_free_obs_inst(alternation, lock2);
    free(lock2);
    _LIME_free_obs(alternation);

    printf("Program exited correctly.\n");
    return 0;
}

void lock(lock_t *foo) {
	printf("locking %lu\n", (unsigned long)foo);
}

void unlock(lock_t *bar) {
	printf("unlocking %lu\n", (unsigned long)bar);
}

void something() {
  printf("doing something\n");
}

void somethingelse() {
  printf("doing something else\n");
}
