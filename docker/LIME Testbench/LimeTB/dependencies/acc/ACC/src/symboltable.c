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
#include "symboltable.h"
#include "pointcut.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* global tables/variables to store information */
struct FuncInfo *funcTable = NULL;	
struct TypedefInfo * typedefTable = NULL;

struct FuncInfo *fpTable = NULL;	/* a table of function pointers */

struct FuncInfo *varTable = NULL;	/* a table of global variable declarations */

struct checkFrame * currCheckFrame = NULL;	/* current declaration frame */

int gcc_attribute_level = 0; 	/* indicate whether inside a gcc attribute specifier */
				/* gcc allows: __attribute__((const)), it might be confused 
				   with "const" qualifier on a type */
				/* for anything inside a gcc attribute, it should be ignored */
 
/* switch the source and target */
/* for "typedef struct A MYA".
before: souce is "struct A", target is "MYA".

after switching: source is "MYA", target is "struct A".


if we also have "typedef MYA MYA2 ; "
before: source is "MYA", target is "MYA2".

after switching: source is "MYA2", target is "struct A".
*/
void switchTypedefTargetSource(struct TypedefInfo * oneTypedef) {
	char * temp = oneTypedef->source;
	char * realType = NULL;
	oneTypedef->source = oneTypedef->target;

	realType = findRealType(temp);
	if(realType == temp) {
		oneTypedef->target = temp;
	}else {
		MYFREE(temp);
		oneTypedef->target = copy_chars(realType);
	}

} 

/********************************************************************/

/* find the real type name */
char * findRealType(char * name) {
	struct TypedefInfo * ptr = typedefTable;
        char * target = NULL;
        while(ptr) {
                if(match_name(ptr->source, name)) {
                        target = ptr->target;
                        break;
                }
                ptr = ptr->next;
        }

	if(target == NULL || strstr(target, NONAMETAG)) {
		return name;
	}

	return findRealType(target);
} 

/********************************************************************/

boolean match_typedef_name(char * name1, char * source) {
        struct TypedefInfo * ptr = typedefTable;
	boolean matched = FALSE;
	
	if(match_name(name1, source)) return TRUE;
        
	while(ptr) {
                if(match_name(name1, ptr->source) && match_name(ptr->target, source)) {
			matched = TRUE;
			break;
		}
                ptr = ptr->next;
        }

        return matched;
}

/********************************************************************/

char * make_paramtype(char * t) {
       char buf[NAMELEN];
       char * result;
       sprintf(buf, "(%s)", t);
       result = (char*)malloc(strlen(buf) + 1);
       sprintf(result, "%s", buf);

       return result;
}

char * make_param_name(int index) {
	char buf[NAMELEN];
	char * result;
	sprintf(buf, "%s%d", PARAM_NAME, index);

	result = (char*)malloc(strlen(buf) + 1);
	sprintf(result, "%s", buf);

	return result;	
} 

/* return a string representing a function pointer */
/* it is like: fp:[...]        [(), (),...] */
/*                return type   parameter type */ 
char * make_func_pointer_type(struct checkFrame * f) {
	char buf[ONELINE];
	char * bufP = buf;
	char * result;
	struct Param * p;
	assert( f->type == FUNCPDECL || 
		f->type == TYPEDEFFPDECL || 
		f->type == PARAMFPDECL ||
		f->info & ISFUNCLIKE);

	bufP += sprintf(bufP, "%s", "fp:[");
	
	if(f->info & DECLHASSTAR) removeStarToType(&(f->curFunc->rtType));
	
	bufP += sprintf(bufP, "%s][", f->curFunc->rtType);

	p = f->curFunc->p;

	while(p) {
		bufP += sprintf(bufP, "(%s)", p->type);
		p = p->next;
	}

	bufP += sprintf(bufP, "%s", "]");

	result = (char *)malloc(sizeof(buf) + 1);

	sprintf(result, "%s", buf);

	return result;
}

/* the function pointer's name should include its parent's information */
/* eg.
   int (*p)();  <-- its name should be: "p"
   void foo() {
        int (*p)();  <-- its name should be : "p#foo";
        {
                int (*p)(); <-- its name should be : "p##foo", but it hasn't been supported yet
        }
  }
*/
void make_fp_name(struct checkFrame * frame) {
        struct checkFrame * pf;
        char buf[NAMELEN];
        char *bufP = buf;
        char *newName;
        if(frame == NULL || frame->parent == NULL) return;

        pf = frame->parent;
        bufP += sprintf(bufP, "%s#", frame->curFunc->fname == NULL ? "noname" : frame->curFunc->fname);
        while(pf->type != FUNCDECL) {
                if(pf->type != FUNCBODY) bufP += sprintf(bufP, "%s", "#");
                if(pf->parent) pf = pf->parent;
		else break;
        }
        bufP += sprintf(bufP, "%s", pf->curFunc->fname == NULL ? FP_NAME : pf->curFunc->fname);

        newName = (char*)malloc(strlen(buf) + 1);

        sprintf(newName, "%s", buf);

        MYFREE(frame->curFunc->fname);
        frame->curFunc->fname = newName;
}


/********************************************************************/

void enter_paren_declarator() {
	if(currCheckFrame) currCheckFrame->info |= INSIDE_PAREN_DECLARATOR;  
}

/********************************************************************/
void leave_paren_declarator() {
	if(currCheckFrame) currCheckFrame->info &= ~INSIDE_PAREN_DECLARATOR; 
}

/********************************************************************/

void enter_gcc_attribute() {
        gcc_attribute_level ++;
}

/********************************************************************/
void leave_gcc_attribute() {
        gcc_attribute_level --;
}


/********************************************************************/

//add function in the end of the function table
//if found an existing one, use the new one to replace the old one, assuming they are compatible
// (* the ideal solution is to check whether the 2 declarations are compatible)
void addFunc(struct FuncInfo **head, struct FuncInfo *data){
    struct FuncInfo *ptr = NULL;
    if(data == NULL){
       return;
    }

    /* handle the special case when parameter type is a single void */
    if(data->p && data->p->next == NULL && match_name("void", data->p->type)) {
        free_parameters(data->p);
        data->p = NULL;
        data->malInfo |= EMITVOIDFORNOPARAM;
    }

    /* if there is no return type, it should be "int" by default */
    if(data->rtType == NULL) {
	data->rtType = copy_chars("int");
    }

    ptr = searchFunc(*head, data->fname);
    if(ptr == NULL) {
        ptr = *head;
        *head = data;
        data->next = ptr;
    }else {
        MYFREE(ptr->fname);
        MYFREE(ptr->rtType);
        free_parameters(ptr->p);

	ptr->fname = data->fname;
        ptr->rtType = data->rtType;
        ptr->p = data->p;
        ptr->malInfo = data->malInfo;

        MYFREE(data);
    }

}

void addTypedef(struct TypedefInfo ** head, struct TypedefInfo * new) {
	assert(new);

	switchTypedefTargetSource(new);

	new->next = *head;
	*head = new;
}

//save parameters in order so save the new param to the end
//return the last address of the last parameter in the original list
struct Param * addParam(struct Param **head, struct Param *data){
	struct Param *tmp = NULL;
	struct Param *cur = NULL;
	struct Param *pre = NULL;
    
    	if(data == NULL){
       		return NULL;	
    	}	
    
    	cur = *head;
    	pre = NULL;
    
    	while(cur != NULL){
      		pre = cur;
       		cur = cur->next;	
    	}
    
    	if(pre == NULL){
       		*head = data;
    	}else{
    		pre->next = data;
    	}
    	data->next = NULL;
   
    	return pre;
}

//return a type like "t1 t2"
char * addType(char * t1, char * t2) {
	char * newType = NULL;
	int len = 0;
	
	assert(t2);

	if(t1 == NULL) return t2;

	len =strlen(t1) + strlen(t2) + 2; // 1 for space, and 1 for '\0'
	
	newType = (char *)malloc(len);
	
	sprintf(newType, "%s %s", t1, t2);
	
	free(t1);
	free(t2);

	return newType;
}

void addParamToFunc(struct checkFrame * funcFrame, struct checkFrame * paraFrame) {
	struct Param * preParam;
	struct Param * newParam = (struct Param *)malloc(sizeof(struct Param));
    	if(paraFrame->curFunc->fname == NULL) {
		newParam->id = make_param_name(funcFrame->paramCount++);
    	}else {
		newParam->id = copy_chars(paraFrame->curFunc->fname);
	}
	
	if(paraFrame->type == PARAMFPDECL || paraFrame->info & ISFUNCLIKE ) {
		newParam->type = make_func_pointer_type(paraFrame);
	}else {
		newParam->type = copy_chars(paraFrame->curFunc->rtType);
    	}

	newParam->next = NULL;

	preParam = addParam(&(funcFrame->curFunc->p), newParam);

    	if(funcFrame->declaratorLevel >= 1 && funcFrame->paramFor2ndDeclaratorIsSet == FALSE ) {
		funcFrame->paramFor2ndDeclaratorIsSet = TRUE;
		funcFrame->paramFor2ndDeclarator = preParam;
	}
}

/* the parameter is a K&R style, so it only changes the existing parameter type, not adds new parameter */
void chgParamToFunc(struct checkFrame * funcFrame, struct checkFrame * paraFrame) {
	struct Param * para = findParam(funcFrame->curFunc->p, paraFrame->curFunc->fname);
	assert(para);
	
	if(paraFrame->type == PARAMFPDECL || paraFrame->info & ISFUNCLIKE ) {
                para->type = make_func_pointer_type(paraFrame);
        }else {
                para->type = copy_chars(paraFrame->curFunc->rtType);
        }
} 

void addStarToType(char ** type) {
	char * newType;
	char * temp = *type;
	int oldTypeLen = strlen(temp);

	newType = (char *)malloc(oldTypeLen + 1 + 1);

	sprintf(newType, "%s*", temp);

	free(temp);

	*type = newType;

}

void addQualifier(char ** type, char ** qualifier) {
	if(*type == NULL || *qualifier == NULL) return ;
	if(strstr(*type, *qualifier) != NULL) {
		MYFREE(*qualifier);
		*qualifier = NULL;
		return;
	}

	*type = addType(*type, *qualifier);

	*qualifier = NULL;
}

/********************************************************************/

struct FuncInfo *searchFunc(struct FuncInfo *head, char * key){
     struct FuncInfo *ptr;
     
     if(head == NULL || key == NULL){
        return NULL;	
     }	
     
     ptr = head;
     while(ptr != NULL){
        if(strcmp(ptr->fname, key) == 0){
            return ptr;	
        }
        ptr = ptr->next;	
     }
     return NULL;
}

/* a function pointer could be declared as a parameter, a local variable or a global variable */
/* return the closest function pointer declaration */

struct FuncInfo * searchFP(struct FuncInfo *head, char * fpName, char * infunc) {
     char key[NAMELEN];
     struct FuncInfo * tmp;

     if(fpName == NULL || infunc == NULL) return searchFunc(head, fpName);
     
     sprintf(key, "%s#%s", fpName, infunc);

     tmp = searchFunc(head, key);
     
     if(tmp) return tmp;
     
     return searchFunc(head, fpName);
} 

/********************************************************************/

void initDeclCollection(char * type) {
	struct checkFrame * newFrame  = (struct checkFrame *)malloc(sizeof (struct checkFrame));
	
	newFrame->curTypedef = NULL;
	
	newFrame->info = 0; 
	newFrame->paramCount = 0; 
        newFrame->curFunc = (struct FuncInfo *)malloc(sizeof(struct FuncInfo));
        newFrame->curFunc->fname = NULL;
        newFrame->curFunc->rtType = NULL;
        newFrame->curFunc->p = NULL;
        newFrame->curFunc->next = NULL;
        newFrame->curFunc->malInfo = 0;
	newFrame->qualifier = NULL ;
	newFrame->declaratorLevel = 0;	
	newFrame->paramFor2ndDeclarator = NULL;
	newFrame->paramFor2ndDeclaratorIsSet = FALSE;
	newFrame->parent = NULL;

	/* update current declaration frame */
	if(currCheckFrame != NULL) {
		newFrame->parent = currCheckFrame;
	} 
	
	currCheckFrame = newFrame;

	if( strcmp(type, "func") == 0 ) {
		newFrame->type = FUNCDECL;
	}else if(strcmp(type, "param") == 0) {
		newFrame->type = PARAMDECL; 
		newFrame->parent->info |= ISFUNCLIKE;
	}else if(strcmp(type, "unknown") == 0) {
		if(newFrame->parent == NULL) {
			newFrame->type = GLOBVARDECL;
		}else {
			newFrame->type = UNKNOWNDECL;
		}
	}else if(strcmp(type, "struct") == 0 ) {
		newFrame->type = STRUCTDECL;
	}else if(strcmp(type, "pcmatching") == 0) {
		newFrame->type = PCMATCHING;
	}else if(strcmp(type, "adfunc") == 0) {
		newFrame->type = ADFUNCDECL;
	}else if(strcmp(type, "funcbody") == 0) {
		newFrame->type = FUNCBODY;
	}else assert(0);
}

/********************************************************************/

void removeStarToType(char ** type) {
        int len = strlen(*type);
        int i = len - 1;
	while(i >= 0) {
		if( (*type)[i] == '*') {
			(*type)[i] = '\0';
			return;
		}
		i--;
	}

	assert(0);
}

/********************************************************************/

void endDeclCollection() {
	struct checkFrame * tmpDeclFrame = currCheckFrame;

	switch(currCheckFrame->type) {
		case PARAMFPDECL:
                        if( (currCheckFrame->info & ISFUNCLIKE) == 0) {
				/* a special case: void foo(int (*a)) ;
                                        "a" is not a function pointer, but a "int *"
                                */
				currCheckFrame->type = PARAMDECL;
			}
		case PARAMDECL:
			if(currCheckFrame->info & KNR_PARA ) {
                               	chgParamToFunc(currCheckFrame->parent, currCheckFrame);
                        }else {
                       		addParamToFunc(currCheckFrame->parent, currCheckFrame);
                        }
		
			if(currCheckFrame->info & ISFUNCLIKE) {
                        	assert(currCheckFrame->curFunc);
                        	make_fp_name(currCheckFrame);
                        	addFunc(&fpTable, currCheckFrame->curFunc);
			}else {
                        	free_func(currCheckFrame->curFunc);
                        }
			break;
        	case TYPEDEFDECL:
                	addTypedef(&typedefTable, currCheckFrame->curTypedef);
     			free_func(currCheckFrame->curFunc);
	   		break;
		case TYPEDEFFPDECL:
                	assert(currCheckFrame->curTypedef == NULL);
                	currCheckFrame->curTypedef = (struct TypedefInfo*)malloc(sizeof(struct TypedefInfo));
                	currCheckFrame->curTypedef->target = copy_chars(currCheckFrame->curFunc->fname);
                	currCheckFrame->curTypedef->source = make_func_pointer_type(currCheckFrame);
                	currCheckFrame->curTypedef->next = NULL;
                	addTypedef(&typedefTable, currCheckFrame->curTypedef);
        		free_func(currCheckFrame->curFunc);
			break;
		case FUNCDECL:
			assert(currCheckFrame->curFunc);
                	addFunc(&funcTable, currCheckFrame->curFunc);
        		break;
		case FUNCPDECL:
			assert(currCheckFrame->curFunc);
		
			if(currCheckFrame->declaratorLevel == 2) {
				//a declaration of a function returning a function pointer
				char * new_rtType;
				struct Param * ori_p;

				if(currCheckFrame->paramFor2ndDeclarator == NULL) {
					ori_p = NULL;
				}else {
					ori_p = currCheckFrame->curFunc->p;
					currCheckFrame->curFunc->p = currCheckFrame->paramFor2ndDeclarator->next;
				}	

				new_rtType = make_func_pointer_type(currCheckFrame);
				
				MYFREE(currCheckFrame->curFunc->rtType);
				
				currCheckFrame->curFunc->rtType = new_rtType;
				
				currCheckFrame->curFunc->p = ori_p;
				
				if(currCheckFrame->paramFor2ndDeclarator == NULL) {
					free_parameters(currCheckFrame->curFunc->p);	
				}else {
					free_parameters(currCheckFrame->paramFor2ndDeclarator->next);
					currCheckFrame->paramFor2ndDeclarator->next = NULL;
				}	
				currCheckFrame->curFunc->p = ori_p;
								
				addFunc(&funcTable, currCheckFrame->curFunc);
			}else {

				if(currCheckFrame->info & DECLHASSTAR) removeStarToType(&(currCheckFrame->curFunc->rtType));
				make_fp_name(currCheckFrame);
				addFunc(&fpTable, currCheckFrame->curFunc);
			}
			break;	
		case GLOBVARDECL:
                        assert(currCheckFrame->curFunc);
                        assert(currCheckFrame->curFunc->p == NULL);
		
			if(!(currCheckFrame->curFunc->malInfo & ISSTATIC)) {	
				/* create a fake paramenter */
				struct Param * p = (struct Param *)malloc(sizeof(struct Param));
				p->id = make_param_name(currCheckFrame->paramCount++);
				p->type = copy_chars(currCheckFrame->curFunc->rtType);
				p->next = NULL;
				currCheckFrame->curFunc->p = p;
                        	addFunc(&varTable, currCheckFrame->curFunc);
                        	break;
			}
                default:
                        assert(currCheckFrame->curFunc);
                        free_func(currCheckFrame->curFunc);
        }

	currCheckFrame = tmpDeclFrame->parent;

	free_declframe(tmpDeclFrame); 

}

/********************************************************************/
//note: "t" represents a string, like "void" or "char", which is an automatic string.
//Since the type may be changed later by adding one or more "*" because of pointer type, I make an explicit copy by using malloc(). The benefit is that the memory of the type could be managed consistently. The disadvantage is that it may use more memory and affect the performance.

void setType(char *t){
   if(t == NULL || currCheckFrame == NULL) {
   	  return;
   }

   t = copy_chars(t);

   addQualifier(&t, &(currCheckFrame->qualifier));
   
   if(currCheckFrame->type == TYPEDEFDECL) {
	setTypedefTargetSource(t);
   }else {
  	currCheckFrame->curFunc->rtType = addType(currCheckFrame->curFunc->rtType, t);
   }
}

void setDeclaratorWithPointer() {
	if(currCheckFrame->info & INSIDE_PAREN_DECLARATOR ) {
		currCheckFrame->info |= DECLHASSTAR;
		if(currCheckFrame->type == TYPEDEFDECL) {
			currCheckFrame->type = TYPEDEFFPDECL;
			/* typedef a function pointer */
			/* typedef int (*p)(char , double); */
			/* treat it like a normal function pointer declaration, when finishing the declaration, create a typedef source: p, and a typedef target: a function pointer type */
			assert(currCheckFrame->curTypedef);
			assert(currCheckFrame->curFunc && currCheckFrame->curFunc->rtType == NULL);
			currCheckFrame->curFunc->rtType = copy_chars(currCheckFrame->curTypedef->source);
			free_typedefTable(currCheckFrame->curTypedef);
			currCheckFrame->curTypedef = NULL;
		}else if(currCheckFrame->type == PARAMDECL) {
			currCheckFrame->type = PARAMFPDECL;
		}else if(currCheckFrame->type == FUNCDECL) {
			currCheckFrame->type = FUNCPDECL;
		}
	} 
}

void setQualifier(char * s) {
   assert(s);
   if(currCheckFrame==NULL || gcc_attribute_level > 0 ) return;
   
   if(currCheckFrame->qualifier == NULL) {
        currCheckFrame->qualifier = copy_chars(s);
   }else {
        /* remove duplicate qualifier */
        if(strstr(currCheckFrame->qualifier , s) == NULL) {
                currCheckFrame->qualifier = addType(currCheckFrame->qualifier , copy_chars(s));
        }
   }

   if(currCheckFrame->type == TYPEDEFDECL) {
        addQualifier(&(currCheckFrame->curTypedef->source), &(currCheckFrame->qualifier));
   }else {
   	addQualifier(&(currCheckFrame->curFunc->rtType), &(currCheckFrame->qualifier) );
   }
}

//there are 3 complex type: struct, union, enum
void setComplexType(long type, char *t) {
        char buf[NAMELEN];
        setComplexTypeName(type, buf, t);
        setType(buf);
}

void setComplexTypeName(long type, char buf[], char * tag) {
	assert(type == 1 || type == 2 || type == 3);
	sprintf(buf, "%s %s ", (type == 1? "struct" : (type == 2 ? "union" : "enum")), 
				tag == NULL ? "" : tag );
}


void setPointerType(){
   if(currCheckFrame == NULL) {
	return;
   }

   if(currCheckFrame->type == TYPEDEFDECL) {
        assert(currCheckFrame->info & SET_TYPEDEF_TARGET );
	addStarToType(&(currCheckFrame->curTypedef->source));
   }else {
   	addStarToType(&(currCheckFrame->curFunc->rtType));
   }

   setDeclaratorWithPointer();

}

void setEllipsis () {
  if(currCheckFrame) {
	currCheckFrame->curFunc->malInfo |= HASELLIPSIS;
  }
}

void setStorageClass(char * stClass) {
  
  if(currCheckFrame && strcmp("static", stClass) == 0) {
	currCheckFrame->curFunc->malInfo |= ISSTATIC ; 
  }

} 


void setNoNameTag(char ** name) {
  *name = NONAMETAG;
}


void setFuncDecl() {
	if(currCheckFrame->type == UNKNOWNDECL ||
	   currCheckFrame->type == GLOBVARDECL ) {
		currCheckFrame->type = FUNCDECL;
	}
}

/* it is a K&R style function */
void setFuncDecl_old() {
        currCheckFrame->info |= KNR_DECL; 
	currCheckFrame->curFunc->malInfo |= HASKNRDECL;

	setFuncDecl();
}

void setEndFuncDeclarator() {
	currCheckFrame->declaratorLevel ++;
}

void setKNRPara() {
	currCheckFrame->info |= KNR_PARA ; 
}

void setDeclIsFuncLike() {
	currCheckFrame->info |= ISFUNCLIKE;
} 


void setInsideATypedefDecl () {
	currCheckFrame->type = TYPEDEFDECL;
	currCheckFrame->curTypedef = (struct TypedefInfo*)malloc(sizeof(struct TypedefInfo));
	currCheckFrame->curTypedef->source = currCheckFrame->curTypedef->target = NULL;
	currCheckFrame->curTypedef->next = NULL;
}

void setTypeDefTarget() {
	currCheckFrame->info |= SET_TYPEDEF_TARGET ; 
} 
	
void setTypedefTargetSource(char * name) {
	if(currCheckFrame->info & SET_TYPEDEF_TARGET ) {
                currCheckFrame->curTypedef->target = name;
        }else {
                currCheckFrame->curTypedef->source = addType(currCheckFrame->curTypedef->source, name);
        }
}

void setId(char *id){
   if(id == NULL || currCheckFrame == NULL) {
   	  return;
   }	
  
   if(currCheckFrame->type == TYPEDEFDECL) {
     	setTypedefTargetSource(copy_chars(id));
   }else {
   	if(currCheckFrame->curFunc->fname) MYFREE(currCheckFrame->curFunc->fname);
	currCheckFrame->curFunc->fname = copy_chars(id);
   }

}

/* append str2 to the end of str1, */
/* memory of "str1" will be freed */
/* memory of "str2" will not be freed here */
char * add_chars_with_dot(char * str1, char * str2) {
	char * newstr;
	
	newstr = (char *)malloc(strlen(str1) + strlen(str2) + 2);
	sprintf(newstr, "%s.%s", str1, str2);

	free(str1);
	return newstr;
}

void appendId(char *id){
   assert(currCheckFrame && currCheckFrame->curFunc->fname);

   currCheckFrame->curFunc->fname = add_chars_with_dot(currCheckFrame->curFunc->fname, id);

}

/********************************************************************/

void isATypeDefDecl(long * flag) {
	if(currCheckFrame && currCheckFrame->type == TYPEDEFDECL) {
		*flag = 1;
	}else {
		*flag = 0;
	}
}

void isKNRDecl(long * flag) {
	if(currCheckFrame && currCheckFrame->info & KNR_DECL ) {
		*flag = 1;
	}else {
		*flag = 0;
	}
}

void isDiffName(char * s1, char * s2, long * flag) {
	*flag = (strcmp(s1, s2) == 0 ? 0 : 1);
}

/********************************************************************/
//free memory 
void free_func(struct FuncInfo * fun) {
	if(fun == NULL) return;
	free_func(fun->next);
	
	MYFREE(fun->fname);
	MYFREE(fun->rtType);
	free_parameters(fun->p);

	MYFREE(fun);
}

void free_typedefTable(struct TypedefInfo *table) {
        if(table == NULL) return;
	free_typedefTable(table->next);
        
	MYFREE(table->source);
	MYFREE(table->target);
	MYFREE(table);
}

void free_declframe(struct checkFrame * f) {
	if(f == NULL) return ;

	MYFREE(f->qualifier);
	MYFREE(f);
}
/********************************************************************/

//make a copy of a string
char * copy_chars(char * s) {
	int len;
	char * newS;
	if(s == NULL) return NULL;
	len = strlen(s);
	newS = (char *)malloc(len + 1);
	sprintf(newS, "%s", s); 
	return newS;	
}


struct Param * copy_parameters(struct Param * head) {
        struct Param * newParam;
        if(head == NULL) return NULL;

        newParam = (struct Param*)(malloc(sizeof(struct Param)));
        newParam->id = copy_chars(head->id);
        newParam->type = copy_chars(head->type);
        newParam->next = copy_parameters(head->next);

        return newParam;
}

/********************************************************************/

/* remove type qualifiers, store the plain type in the buf */
/* assume: all type qualifiers are appended to the type itself */
/* ie. it is like: int const volatile; */
/* not: const int volatile */

void getPlainType(char * type , char * buf) {
	char * start, * end, *tmp;
	
	/* make a copy of the original type */
	sprintf(buf, "%s", type);
       
	/* "start" points to the first character of type */
	/* "end" points to the last character of type */
	start = buf;
	end = buf + (strlen(buf) -1);

	while(end >= start && *end != '*') {
		if(*end == ' ') {
			tmp = end + 1;	/* tmp points to the character just after the end */
			if(strcmp(tmp, "const") == 0 ||
			   strcmp(tmp, "__restrict") == 0 ||
			   strcmp(tmp, "__const") == 0 ||
			   strcmp(tmp, "volatile") == 0) {
				*end = '\0';
			}
		}
		
		end --;
	}
}

/********************************************************************/
#ifdef UT_AC_DEBUG
void printFuncs(struct FuncInfo *table){
   struct FuncInfo *ptr;
   struct Param *p;
   
   ptr = table;
   
   while(ptr != NULL){
   	   printf("rtType: %s, ident: %s ", ptr->rtType, ptr->fname);
   	   p = ptr->p;
   	   while(p != NULL){
   	   	 printf("%s(%s) ", p->id, p->type);
   	   	 p = p->next;
   	   }
   	   printf("\n");
   	   ptr = ptr->next;
   }	
}

void printTypedefTable(struct TypedefInfo *table) {
	struct TypedefInfo * ptr;
	ptr = table;
	printf("typedef table : \n----------------------------\n");
	while(ptr) {
		printf("%s ->", ptr->source);
		printf(" %s \n", ptr->target);
		ptr = ptr->next;
	}
	printf("\n----------------------------\n");

}
#endif

