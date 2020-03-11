/*
 * ASPECT-ORIENTED C (ACC) - an aspect-oriented extension for the C language
 *
 * Copyright (C) 2006 . All rights reserved.
 *
 * Weigang (Michael) Gong, Hans-Arno-Jacobsen
 *
 * ACC development team (www.aspectc.net),
 * Middleware Systems Research Group (www.msrg.utoronto.ca),
 * University of Toronto.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

typedef int boolean;


typedef enum{FUNCDECL, FUNCBODY, STRUCTDECL, PARAMDECL, PARAMFPDECL, FUNCPDECL, TYPEDEFFPDECL, TYPEDEFDECL, PCMATCHING, ADFUNCDECL, GLOBVARDECL, UNKNOWNDECL} DeclType;


struct Param{
   char *id;
   char *type;
   struct Param *next;
};

#define INSIDE_PAREN_DECLARATOR 0x0000000000000001
#define SET_TYPEDEF_TARGET      0x0000000000000002
#define KNR_DECL                0x0000000000000004
#define KNR_PARA                0x0000000000000008
#define ISFUNCLIKE              0x0000000000000010
#define DECLHASSTAR             0x0000000000000020  /* the declarator has * ahead, like : void (*p)(); */
#define EMITVOIDFORNOPARAM      0x0000000000000040  /* should emit "void" for a function prototype without parameters */

#define HASELLIPSIS 		0x0000000000000080
#define ISSTATIC    		0x0000000000000100
#define HASKNRDECL  		0x0000000000000200
#define HASPROCEED 		0x0000000000000400
#define HASPRETURN 		0x0000000000000800
#define HASTHROW 		0x0000000000001000
#define HASTHISJPN 		0x0000000000002000
#define NEEDEXTRAP              0x0000000000004000
#define HASTRY                  0x0000000000008000
#define ISSHADOWED              0x0000000000010000
#define HASTHISJPNARG		0x0000000000020000


struct FuncInfo{
   char *fname;
   char *rtType; //maybe null
   struct Param *p;
   struct FuncInfo *next;
   int malInfo ;    //malicious information, like:
		    // 1. whether it has ellipsis,
		    // 2. whether it is a static function
		    // 3. whether it has a K&R declaration
};

/* typedef struct A { }           MYA             ;
           |<-source-->|      |<-target->|

   typedef    MYA                 MYA2            ;
           |<-source-->|      |<-target->|
*/
struct TypedefInfo{
	char * source;
	char * target;
	struct TypedefInfo * next;
};


struct checkFrame {
        int info ;
	DeclType type;
	int paramCount;
	struct FuncInfo * curFunc;
        struct TypedefInfo * curTypedef;
        struct checkFrame * parent;
	char * qualifier;
	int declaratorLevel;
	struct Param * paramFor2ndDeclarator;
		//to handle the case of returning a function pointer,
		//like : void (*p(double))(char);
		//p is a function returning a pointer to a function which takes a char and return void

		//the paramFor2ndDeclarator points to "char"
	boolean paramFor2ndDeclaratorIsSet;
};


extern struct FuncInfo *funcTable;
extern struct FuncInfo *fpTable;
extern struct FuncInfo *varTable;

extern struct TypedefInfo * typedefTable;

void addFunc(struct FuncInfo **head, struct FuncInfo *data);
struct FuncInfo *searchFunc(struct FuncInfo *head, char * key);
struct FuncInfo *searchFP(struct FuncInfo *head, char * key, char * infunc);

struct Param * addParam(struct Param **head, struct Param *data);
struct Param * copy_parameters(struct Param *);
char * copy_chars(char *);
void setType(char *t);
void setQualifier(char *);
void setComplexType(long, char*);
void setComplexTypeName(long, char [], char *);
void setPointerType() ;
void setEllipsis();
void setStorageClass(char *);

void addStarToType(char **);
void removeStarToType(char **);
char * addType(char * t1, char * t2);
void setId(char *id);
void appendId(char *id);
char * add_chars_with_dot(char * str1, char * str2);
void printFuncs(struct FuncInfo *table);
void free_func(struct FuncInfo *);
void free_typedefTable(struct TypedefInfo *);
void free_declframe(struct checkFrame * f);


void initDeclCollection(char *);
void endDeclCollection();
void setFuncDecl();
void setFuncDecl_old();
void setInsideATypedefDecl();

char * make_param_name(int);
char * make_func_pointer_type(struct checkFrame *);
void make_fp_name(struct checkFrame * frame);

void enter_paren_declarator();
void leave_paren_declarator();
void setDeclaratorWithPointer();

void enter_gcc_attribute();
void leave_gcc_attribute();


void isATypeDefDecl(long *);
void setTypeDefTarget();

void isKNRDecl(long *);

void setNoNameTag(char **);

void setTypedefTargetSource(char *);
char * findRealType(char * name);
void switchTypedefTargetSource(struct TypedefInfo * oneTypedef);

void addQualifier(char ** type, char ** qualifier);
void getPlainType(char *, char *);

void setDeclIsFuncLike();

void isDiffName(char *, char *, long *);

void setEndFuncDeclarator();

#endif
