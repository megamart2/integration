/*
 *
 *   C-TO-C COMPILER
 *
 *   Based on an ANSI-C compiler
 *   originally written by Birgit Schwarz
 *   in 1989 at GMD Karlsruhe
 *   using Gentle/0
 *
 *   Copyright (C) 1989, 1993 GMD 
 *
 */

#ifndef LEXER_H
#define LEXER_H

/* LEXER.h */

typedef struct IdentRec *Ident;

struct IdentRec
{
   char  *firstposptr;
   long  length;
   long  symbol_class;
   long  meaning;
   long  tagmeaning;
   Ident next;
} ;

struct file_pos_chain {
        unsigned long fpos;
        struct file_pos_chain * next;
};

struct file_chain {
        char * name;
        char * mappedName;
        char * level;
        char returnAble;
        struct file_pos_chain * preFilePos;
        struct file_chain *next;
};


extern long   SYM;
extern long   CurCol;
extern long   CurLine;
extern Ident  CurId;
extern char   CurChar;
extern long   CurNumber;
extern double CurFloat;
void addMapFileName(char * mapOption);
struct file_chain * number_to_file(unsigned long n) ;
char *number_to_name (unsigned long);
char *number_to_level (unsigned long);

#endif

