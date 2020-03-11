/*
   lexer.c

   A lexer for C following the lex/yacc conventions for function yylex.
   (In the old days scanners of compilers described in Gentle
   were written by hand.)

   This lexer comprises a language independent frame
   and a language dependent kernel
   which is written using a set of macros
*/

/*----------------------------------------------------------------------------*/

#include "gen.h"
#include "lexer.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define sy_UNDEF 9999
#define sy_eof 0

#define NEXTCH  { \
	if( BUFPTR == lastptr) { \
		bufptr = BUFPTR ; FillBuf(); BUFPTR = bufptr; \
	} else { \
		*(curr_token_p) = *BUFPTR ; \
		if(curr_token_p - curr_token < MaxTokenLen - 1) {	\
			curr_token_p ++;  \
		}\
		BUFPTR++ ; \
	} \
} 

#define CH      *BUFPTR
#define AGAIN   goto again
#define MARK(p) p = BUFPTR

#define RECOG(x) {                                   \
   bufptr = BUFPTR;                                  \
   CurCol = BUFPTR - firstcolptr;                    \
   preSYM = (x);					\
   *curr_token_p = '\0';                              \
   return(x);                                        \
}

#define NEXTLINE {                                   \
   if (BUFPTR == sentinelptr) {                      \
      bufptr = BUFPTR; FillBuf(); BUFPTR = bufptr;   \
   }                                                 \
   else BUFPTR++;                                    \
   CurLine++; firstcolptr = bufptr;                  \
}


#define maxpos        500000 
#define bufsize       500002 
#define HashTabSize   2048 /* should be a power of two */
#define STRINGTABSIZE   500000 
#define FloatTabSize   200
#define idstringtabSize   500000
#define Maxidtab   50000
#define MaxTokenLen 32
#define MaxInclFileDepth 50

#define NULLCHAR      '\000'
#define EOL           '\012'
#define EOB           '\014'
#define TAB           '\011'

#define NIL            0

#define FALSE          0
#define TRUE           1


/* when seeing a TYPEDEFNAME token , there are 2 options to report:
	either as TYPEDEFNAME or as IDENTIFIER 
*/
/* the rule is :
	1. check previous token:
	if a TYPEDEFNAME token can not follow it, --> IDENTIFIER
        2. check next token:
	if a TYPEDEFNAME token can not precede it, --> IDENTIFIER
	3. otherwise, use the default, ie.        --> TYPEDEFNAME
	
	* we might add other rules later.
*/
 
#define NOT_HAVE_TYPEDEF_BEFORE	0	/* a token can not have typedef name ahead of it */
#define MI__HAVE_TYPEDEF_BEFORE 1       /* a token might have typedef name ahead of it */

/*identifier */
#define SEPARTOKEN	1	/* next token is ";", "]", "%", "+", "-" */

#define SKIPWHITECHAR { \
   while(1) { \
        if(CH == ' ' || CH == TAB) { \
                NEXTCH; \
        }else if(CH == EOL) { \
                NEXTLINE; \
        }else { \
                break; \
        } \
  } \
}

/*---------------------------------------------------------------------------*/

struct file_chain * first_file = 0;
struct file_chain * last_file = 0;

/*----------------------------------------------------------------------------*/

long   SYM;
long   preSYM;	/* the previous token */
long   CurCol;
long   CurLine;
unsigned long   CurFileNo;
Ident  CurId;
char   CurChar;
char   *CurString;
long   CurNumber;
double *CurFloatPtr;
double CurFloat;

char *bufptr;
char *lastptr;
char *sentinelptr;
char *firstcolptr;
char buf [bufsize];

int IsLetgit [256];
int IsDigit [256];
int IsHexDigit [256];
int IsAlNum[256];
char idstringtab [idstringtabSize];
char *idstringtab_ptr;
Ident HashTab [HashTabSize];
struct IdentRec idtab [Maxidtab];
long idnum;
double FloatTab [FloatTabSize];
char stringtab [STRINGTABSIZE];
char *stringtab_ptr;

char isWideChar;         /* indicate a wide character, like: L'h', L"abc" */
unsigned long name_to_number();
unsigned long create_file_pos(unsigned long fileno, unsigned long lineno) ;
unsigned long create_new_file_pos(unsigned long fileno, unsigned long lineno);

extern char * copy_chars (char *);


/* to handle continuous # line directives in the preprocessed files */
/* eg: after preprocessing, normally there are a lot of continuous # line directives generated, like:
	# 3 "file 1" 2 4 6
	# 2 "file 2" 3
	# 4 "file 3" 

	int a;

The preFilePos[] array stores the file position of the "# 3" line and the "# 2" line, because these 2 directive information should be output in the end.

The file number and line number for the "int a" should be the "# 4", because it is the closest # line directive */
		
unsigned long preFilePos[MaxInclFileDepth];
long lastPreFilePosIndex;

unsigned long totalFiles = 0 ;

FILE *stream;
char curr_token[MaxTokenLen];
char *curr_token_p = curr_token;

/************************************************************/
/* return 1 if current token can't be a typedef name */
/* return 0 otherwise */ 
int not_typedef_by_preToken(long preToken) {
 	switch(preToken) {
		case LB : case DOT : case COLON: case XOR_ASOP : case XOR:
		case MOD_ASOP: case MOD: case TIMES_ASOP: case ASTERISK: case LSHIFT_ASOP:
		case LSHIFT: case LE : case LT: case RSHIFT_ASOP: case RSHIFT:
		case GE : case GT : case ORELSE: case OR_ASOP : case OR:
		case ANDTHEN: case AND_ASOP: case AND : case EQ: case ASOP:
		case NE : case NOT : case PLUSPLUS : case PLUS_ASOP: case PLUS:
		case MINUSMINUS: case MINUS_ASOP: case ARROW: case MINUS : case DIV_ASOP:
		case DIV:
		case TYPEDEFNAME: case VOID : case CHAR : case SHORT : case INTTOKEN : case COMPLEX : case IMAGINARY :
		case LONG : case FLOAT : case DOUBLE : case SIGNED   : case UUSIGNEDUU: case UNSIGNED :
		case BOOL : case STRUCT : case UNION : case ENUM : case CASE :
		case IDENTIFIER :
			return 1;
		default:
			return 0;
	}
}

/**********************************************/
/* peek next token, and set its token type in val */
char * get_next_token_type(char * buf, char * val) {
   register char *BUFPTR;
   int category = MI__HAVE_TYPEDEF_BEFORE;
   int old_line_no = CurLine;
   BUFPTR = buf;
   SKIPWHITECHAR;
   switch(*BUFPTR) {
   	case ';' : case '?' : case '~' : case ']' : case '.' : 
	case '^' : case '%' : case '<' : case '>' :
	case '|' : case '&' : case '=' : case '!' : case '+' :
	case '-' :
		category = NOT_HAVE_TYPEDEF_BEFORE;
   }
   
   CurLine = old_line_no;
   *val = category;
   return BUFPTR;
}

/* mapOption is like: -map=file1|file2 */
/* since it is a hidden option, I assume the format of the input string is always correct */

void addMapFileName(char * mapOption) {
	char * src, *target;
	char * ptr;
	
	ptr = strstr(mapOption, "=");	/* ptr points to = " */
	ptr ++;				/* ptr points to f */
	src = ptr;

	ptr = strstr(ptr, "|");		/* ptr points to | */
	*ptr = '\0';

	ptr ++;				/* ptr points to f */
	target = ptr;
	name_to_number(src, target);
}

/*----------------------------------------------------------------------------*/

int yylex ()
{
   register char *BUFPTR;

   BUFPTR = bufptr;

   again:

   curr_token_p = curr_token;
 
   switch (*BUFPTR) {

/*** begin scankernel ***/

   /*--- simple tokens -------------------------------------------------------*/
   case ',' : NEXTCH; RECOG(CM)
   case ';' : NEXTCH; RECOG(SM)
   case '?' : NEXTCH; RECOG(QUEST)
   case '~' : NEXTCH; RECOG(COMPLEMENT)
   case '(' : NEXTCH; RECOG(LP)
   case ')' : NEXTCH; RECOG(RP)
   case '[' : NEXTCH; RECOG(LB)
   case ']' : NEXTCH; RECOG(RB)

   case '.' :
      NEXTCH;
      if (CH == '.') {
	 NEXTCH;
         if (CH == '.') {
	    NEXTCH; RECOG(ELLIPSIS)
	 }
	 else RECOG(sy_UNDEF)
      } else {
	switch(CH) {
		case '0': case '1': case '2': case '3' : case '4' :
   		case '5' : case '6' : case '7' : case '8' : case '9' :
			/* support like: .01 */
			/* I deliberately insert a '0' */
			BUFPTR = BUFPTR - 2;
			*BUFPTR = '0';
			AGAIN;
		default:
     			RECOG(DOT);
	}
      }

   case ':' :
      NEXTCH;
      RECOG(COLON)


   case '{' :
      NEXTCH;
      RECOG(LC)

   case '}' : NEXTCH; RECOG(RC)

   case '^' :
      NEXTCH;
      if (CH == '=') {
	 NEXTCH; RECOG(XOR_ASOP)
      } else RECOG(XOR)

   case '%' :
      NEXTCH;
      if (CH == '=') {
	 NEXTCH; RECOG(MOD_ASOP)
      } else RECOG(MOD)

   case '*' :
      NEXTCH;
      if (CH == '=') {
	 NEXTCH; RECOG(TIMES_ASOP)
      } else RECOG(ASTERISK)

   case '<' :
      NEXTCH;
      if (CH == '<') {
	 NEXTCH;
	 if (CH == '=') { NEXTCH; RECOG(LSHIFT_ASOP)}
	 else RECOG( LSHIFT)
      } else if (CH == '=') { NEXTCH; RECOG( LE) }
      else RECOG( LT)
      break;
   case '>' :
      NEXTCH;
      if (CH == '>') {
	 NEXTCH;
	 if (CH == '=') { NEXTCH; RECOG(RSHIFT_ASOP)}
	 else RECOG( RSHIFT)
      } else if (CH == '=') { NEXTCH; RECOG( GE) }
      else RECOG( GT)
      break;
   case '|' :
      NEXTCH;
      if (CH == '|') { NEXTCH; RECOG( ORELSE) }
      else if (CH == '=') { NEXTCH; RECOG(OR_ASOP) }
      else RECOG( OR)
      break;
   case '&' :
      NEXTCH;
      if (CH == '&'){ NEXTCH; RECOG( ANDTHEN) }
      else if (CH == '=') { NEXTCH; RECOG(AND_ASOP) }
      else RECOG( AND)
      break;
   case '=' :
      NEXTCH;
      if (CH == '=') { NEXTCH; RECOG( EQ) }
      else RECOG( ASOP)
      break;
   case '!' :
      NEXTCH;
      if (CH == '=') { NEXTCH; RECOG( NE) }
      else RECOG( NOT)
      break;
   case '+' :
      NEXTCH;
      if (CH == '+') { NEXTCH; RECOG( PLUSPLUS) }
      else if (CH == '=') {NEXTCH; RECOG (PLUS_ASOP)}
      else RECOG( PLUS)
      break;
   case '-' :
      NEXTCH;
      if (CH == '-') { NEXTCH; RECOG( MINUSMINUS) }
      else if (CH == '=') {NEXTCH; RECOG (MINUS_ASOP)}
      else if (CH == '>') { NEXTCH; RECOG( ARROW) }
      else RECOG( MINUS)
      break;

   /*---  comment, slash -----------------------------------------------------*/

   case '/' :
      NEXTCH;
      if (CH == '*') {
	 NEXTCH;
	 for(;;) {
	    if (CH == '*') { NEXTCH; if (CH == '/') { NEXTCH; AGAIN; } }
	    else if (CH == EOL) NEXTLINE
	    else if (CH == EOB) {
	       LexError("eof inside comment");
	       SYM = sy_UNDEF;
	       break;
	    }
	    else NEXTCH;
	 }
      }
      else if (CH == '/') {
	  /* C++-style comment */
	  NEXTCH;
	  for(;;) {
		if(CH==EOL || CH==EOB) 
		{
			AGAIN; 
		}
		NEXTCH;		
	  } 
      }
      else if (CH == '=') { NEXTCH; RECOG(DIV_ASOP) }
      else RECOG(DIV)

   /*--- identifiers ---------------------------------------------------------*/
   case 'L' :
	if( *(BUFPTR+1) == '\'' || *(BUFPTR+1) == '\"') {
		isWideChar = 1;
		NEXTCH;
		AGAIN ;
	}else {
		isWideChar = 0;
	}
   case 'a' : case 'b' : case 'c' : case 'd' : case 'e' : case 'f' :
   case 'g' : case 'h' : case 'i' : case 'j' : case 'k' : case 'l' :
   case 'm' : case 'n' : case 'o' : case 'p' : case 'q' : case 'r' :
   case 's' : case 't' : case 'u' : case 'v' : case 'w' : case 'x' :
   case 'y' : case 'z' : case 'A' : case 'B' : case 'C' : case 'D' :
   case 'E' : case 'F' : case 'G' : case 'H' : case 'I' : case 'J' :
   case 'K' : case 'M' : case 'N' : case 'O' : case 'P' :
   case 'Q' : case 'R' : case 'S' : case 'T' : case 'U' : case 'V' :
   case 'W' : case 'X' : case 'Y' : case 'Z' :
   case '_' : case '$' :

      { 
	 char namebuf[300];
	 char *idstart, *idstop;
	 idstart = &namebuf[0];
	
	 while (IsLetgit[CH]) {
        	*idstart = CH;
		idstart ++;	
		NEXTCH ;
	}
	process_ident(namebuf, idstart);
      }

      SYM = CurId->symbol_class;

      if(SYM == TYPEDEFNAME) {
             if(not_typedef_by_preToken(preSYM)) {
			SYM = IDENTIFIER;
	     }else {
		char nextTokenType;
	     	BUFPTR = get_next_token_type(BUFPTR, &nextTokenType);
             	if(nextTokenType == NOT_HAVE_TYPEDEF_BEFORE) {
			SYM = IDENTIFIER;
	     	}
             }
      }

      yylval.attr[1] = (long) CurId;
       
      RECOG(SYM)

   /*--- strings, chars ------------------------------------------------------*/

   case '"' : case '\'':

      {
	 char delimiter;
	 long length;
	 char preIsBackSlash=0;

	 /* char literal is treated same as string literal */
	 delimiter = CH;
	 NEXTCH;
	 length = 0;

	 CurString = stringtab_ptr;
	 stringtab_ptr++;   /*length field*/

	 for (;;) {
	    if (CH == delimiter && preIsBackSlash == 0) {
	       if (delimiter == '\'') {
                  app_to_string('\0');
                  length++;
                  if(isWideChar) {
			SYM = WCHARCONST;
		  }else {
			SYM = CHARCONST;
		  }
                  isWideChar = 0;
		  *CurString = length;
                  yylval.attr[1] = (long) CurString;
 
                  NEXTCH;
		}
	       else {
		 app_to_string('\0');
		 length++;
		 if(isWideChar) {
			SYM= WSTRINGTOKEN;
		}else {
			SYM = STRINGTOKEN;
		 }
		isWideChar = 0;
		*CurString = length;
                yylval.attr[1] = (long) CurString;
		  NEXTCH;
		}
	       break;
	    }
	    else if (CH == EOL) {
	       LexError("eol inside char or string constant");
	       SYM = sy_UNDEF;
	       break;
	    }
	    else if (CH == EOB) {
	       LexError("eof inside char or string");
	       SYM = sy_UNDEF;
	       break;
	    }
	    else { 
		CurChar = CH;
		if(CurChar == '\\' && preIsBackSlash == 0) {
			preIsBackSlash = 1;
                }else {
			preIsBackSlash = 0;
		} 
	    }
	    app_to_string(CurChar);
	    length++;
	    NEXTCH;
	 }
      }

      break;

   /*--- numbers -------------------------------------------------------------*/
   case '0' : case '1' : case '2' : case '3' : case '4' :
   case '5' : case '6' : case '7' : case '8' : case '9' :

      {
	 long base;
	 int len; 
	 char *start_number;
	 char *stop_number;
	 char *stop_int_number;
	 char *Repr;
	 char *p;

	 MARK(start_number);
	 Repr = stringtab_ptr;
	
	 /* Michael: no need to deal with different formats of constant, like hexadecimal floating, imaginary value, various integer constant suffixs */
	 /* Since a constant is treated as a string, the lexical analyzer just collects all characters until the first character which could not be a part of a number constant */
         /* all number constants are reported as FLOATCONST */
	while(IsAlNum[CH] || CH == '.' ) {
                if( 'e' == CH || 'E' == CH) {
			NEXTCH;
			if('+' == CH || '-' == CH) {
				NEXTCH;
			} 
		}else {
			NEXTCH;
		}
	}
	
        SYM = FLOATCONST;
	MARK(stop_number);
	for (p = start_number; p != stop_number; p++) {
	    app_to_string(*p);
	}
	app_to_string('\0');
        yylval.attr[1] = (long) Repr;
      }

      break;

   /*--- layout --------------------------------------------------------------*/

   case ' ' : NEXTCH;   AGAIN;
   case TAB : NEXTCH;   AGAIN;
   case EOL : NEXTLINE; AGAIN;

   /*--- line pragma ---------------------------------------------------------*/

   case '#' :

      /* # line "filename" level */

      {
	 int n;
	 char strbuf[256];
	 char *strptr;

	 NEXTCH;

        if(	strstr(BUFPTR, "include ") == BUFPTR ||
		strstr(BUFPTR, "pragma ") == BUFPTR ) {
      		/* recognize the #include or #pragma directive */
		char *start;
               	char *stop;
               	char *Repr;
               	char *p;

               	MARK(start);
               	Repr = stringtab_ptr;
               	while( CH != EOL) {
                       NEXTCH;
               	}
               	MARK(stop);
               	for (p = start; p != stop; p++) {
                       app_to_string(*p);
               	}
               	app_to_string('\0');
               	yylval.attr[1] = (long) Repr;
               	SYM = POUND_DIR;
               	break;
       	}else if(strstr(BUFPTR, "line") == BUFPTR) {
	 	/* skip the "line" just following # */
		BUFPTR += 4;
       	}

       while (CH == ' ' || CH == TAB) NEXTCH;

	 /* <line> */

	 if (CH == 'p') {
	    do {
	       NEXTCH;
	    } while (CH != '\n');
	    /* assume "pragma" */
	    AGAIN;
	 }

	 if (! IsDigit[CH]) {
	    LexError("lineno missing");
	    RECOG(sy_UNDEF);
	 }
	 n = 0;
	 while (IsDigit[CH]) {
	    n = n*10+(CH - '0');
	    NEXTCH;
	 }
	 CurLine = n;

	 while (CH == ' ' || CH == TAB) NEXTCH;

	 /* <filename> */

	 if (CH == '"') {
	    NEXTCH;
	    strptr = &strbuf[0];
	    while (CH != '"') {
	       if (CH == EOL || CH == EOB) {
		  LexError("string not closed");
		  RECOG(sy_UNDEF);
	       }
	       *strptr++ = CH;
	       NEXTCH;
	    }
	    NEXTCH;
	 }

	 while (CH == ' ' || CH == TAB) NEXTCH;

	 /* <level > */

	 if ( IsDigit[CH] ) {

	   	*strptr++ = '&';	/* use '&' to separate name and level */ 
		*strptr++ = CH;
 
		NEXTCH;
	    while (CH == ' ' || CH == TAB) NEXTCH;
	 }

	 while (CH == ' ' || CH == TAB) NEXTCH;

	 /* <???> */

	 while (IsDigit[CH]) {

	   	*strptr++ = ' ';
                *strptr++ = CH;
 
		NEXTCH;
	 }

	 /* handle the 3rd number */
         while (CH == ' ' || CH == TAB) NEXTCH;

         while (IsDigit[CH]) {

           	*strptr++ = ' ';
                *strptr++ = CH;
 
		NEXTCH;
         }

         while (CH == ' ' || CH == TAB) NEXTCH;

         if (CH == EOL) {
               	*strptr = '\0';
            	CurFileNo = name_to_number(strbuf, 0);
		
		NEXTLINE;
	    	CurLine--;
	
		/* save the file position */
		assert(lastPreFilePosIndex <= (MaxInclFileDepth-2));
		preFilePos[++lastPreFilePosIndex] = create_file_pos(CurFileNo, CurLine);
	 }
	 else {
	    LexError("invalid line directive");
	    RECOG(sy_UNDEF);
	 }


	 AGAIN;
      }

   /*--- eof -----------------------------------------------------------------*/

   case EOB : 
	/* on Solaris machine (ugsparc), there will be ^L characters inserted in the middle of source file after preprocessing */
	/* since ^L has the same value as EOB, it confuses with the EOB in the end of the input */
	/* so we need to distinguish them */
	if( *(BUFPTR+1) != NULLCHAR) {
		NEXTCH;
		AGAIN;
	}
	SYM = sy_eof; break;
/*** end scankernel ***/

   default :
      BUFPTR++;
      SYM = sy_UNDEF;
   };

   RECOG(SYM)
}
/*-------------------------------------------------------------------------*/
//Gilbert: every time this function is called, the new data is pended at the 
//end of buffer, buf, up to maxpos. The new data is read from stdin.

/* Michael:
  before calling: "bufptr" points to the last character(say X)
  after calling: 
        1. the buffer will be filled up with new data
        2. "bufptr" points to the character just after X
*/
FillBuf ()
{
   register char *i, *p;
   long n;
   int nbytes;

   /* [1 .. curpos-1] [curpos] [curpos+1 .. lastpos] [lastpos+1 .. maxpos] */
   /* already         sentinel not yet               free                  */
   /* processed                processed                                   */

   /* copy rest of buffer to beginning */
   p = &buf[0]; i = bufptr;
   while (i < lastptr) {
      *++p = *++i;
   }

   /* fill buffer */
   nbytes = &buf[maxpos]-p;
   nbytes--;  /* need to add NULL after EOB */

   n = fread
         (/*ptr=>*/ p+1, /*size=>*/ 1, /*nobj=>*/ nbytes, /*stream=>*/ stream);
       //(/*ptr=>*/ p+1, /*size=>*/ 1, /*nobj=>*/ nbytes, /*stream=>*/ stdin);

   lastptr = p+n;
   bufptr = &buf[1];

   /* set new sentinel */
   buf[0] = EOL;
   i = lastptr;
   while (*i != EOL) i--;

   sentinelptr = i;
   *(lastptr+1) = EOB ; 
   *(lastptr+2) = NULLCHAR; 
}

void initStream(FILE *s){
  stream = s;	
}

/*-------------------------------------------------------------------------*/

SkipRestOfInput()
{
   char buf[5000];
   int n;

   do {
      n = fread (/*ptr=>*/ buf, /*size=>*/ 1, /*nobj=>*/ sizeof buf, /*stream=>*/ stdin);
   } while (n > 0);
}

/*-------------------------------------------------------------------------*/

app_to_string (ch)
   char ch;
{
   if (stringtab_ptr>=&stringtab[STRINGTABSIZE]){
      printf("stringtab full\n");
      exit(1);
   }
   *stringtab_ptr++ = ch;
}

/*-------------------------------------------------------------------------*/

InitScanner ()
{
   char ch;
   long i;

   for (i = 0; i <= 255; i++) {
      ch = i;
      switch (ch) {
      case '0' : case '1' : case '2' : case '3' : case '4' : case '5' :
      case '6' : case '7' : case '8' : case '9' :
	 IsDigit[i] = TRUE;
      case 'A' : case 'B' : case 'C' : case 'D' : case 'E' : case 'F' :
	 IsHexDigit[i] = TRUE;
      case 'a' : case 'b' : case 'c' : case 'd' : case 'e' : case 'f' :
      case 'g' : case 'h' : case 'i' : case 'j' : case 'k' : case 'l' :
      case 'm' : case 'n' : case 'o' : case 'p' : case 'q' : case 'r' :
      case 's' : case 't' : case 'u' : case 'v' : case 'w' : case 'x' :
      case 'y' : case 'z' :
      case 'G' : case 'H' : case 'I' : case 'J' : case 'K' : case 'L' :
      case 'M' : case 'N' : case 'O' : case 'P' : case 'Q' : case 'R' :
      case 'S' : case 'T' : case 'U' : case 'V' : case 'W' : case 'X' :
      case 'Y' : case 'Z' :
      	 IsLetgit[i] = TRUE;
	 IsAlNum[i] = TRUE;
	 break;
      case '_' : case '$' :
         IsLetgit[i] = TRUE;
         IsAlNum[i] = FALSE;
	 break;
      default:
         IsAlNum[i] = FALSE;
	 IsLetgit[i] = FALSE;
      }
   }

   for (i = 0; i<=HashTabSize-1; i++) HashTab[i] = NIL;

   idstringtab_ptr = &idstringtab[1];
   idnum = 0;

   stringtab_ptr = &stringtab[1];

/*** begin scaninit ***/
enter_ident(SIZEOF, "sizeof");
enter_ident(AUTO, "auto");
enter_ident(STATIC, "static");
enter_ident(REGISTER, "register");
enter_ident(UNSIGNED, "unsigned");
enter_ident(LONG, "long");
enter_ident(FLOAT, "float");
enter_ident(DOUBLE, "double");
enter_ident(VOID, "void");
enter_ident(CHAR, "char");
enter_ident(INTTOKEN, "int");
enter_ident(COMPLEX, "_Complex");
enter_ident(IMAGINARY, "_Imaginary");
enter_ident(SHORT, "short");
enter_ident(STRUCT, "struct");
enter_ident(UNION, "union");
enter_ident(ENUM, "enum");
enter_ident(IF, "if");
enter_ident(ELSE, "else");
enter_ident(DO, "do");
enter_ident(WHILE, "while");
enter_ident(BREAK, "break");
enter_ident(CONTINUE, "continue");
enter_ident(RETURN, "return");
enter_ident(GOTO, "goto");
enter_ident(FOR, "for");
enter_ident(SWITCH, "switch");
enter_ident(CASE, "case");
enter_ident(DEFAULT, "default");
enter_ident(EXTERN, "extern");
enter_ident(TYPEDEF, "typedef");
enter_ident(SIGNED, "signed");
enter_ident(UUSIGNEDUU, "__signed__");
enter_ident(CONST, "const");
enter_ident(VOLATILE, "volatile");
enter_ident(UUVOLATILE, "__volatile");
enter_ident(UUVOLATILEUU, "__volatile__");
enter_ident(BOOL, "_Bool");

//for handling gcc extension in the system header file
enter_ident(GCCEXTENSION, "__extension__");
enter_ident(GCCCONST, "__const");
enter_ident(GCCATTRIBUTE, "__attribute__");
enter_ident(GCCUUATTRIBUTE, "__attribute");
enter_ident(GCCVALIST, "__builtin_va_list");
enter_ident(GCCOFFSETOF, "__builtin_offsetof");
enter_ident(GCCRESTRICT, "__restrict");
enter_ident(GCCVAARG, "__builtin_va_arg");


enter_ident(INLINE, "inline");
enter_ident(GCCINLINE, "__inline");
enter_ident(GCCUUINLINE, "__inline__");

enter_ident(GCCASM, "asm");
enter_ident(GCCUUASM, "__asm");
enter_ident(GCCUUASMUU, "__asm__");
enter_ident(ALIGNOF, "__alignof__");

enter_ident(UUTYPEOF, "__typeof");
enter_ident(UUTYPEOFUU, "__typeof__");
enter_ident(TYPEOF, "typeof");


/*** end scaninit ***/

   lastptr = &buf[0];
   bufptr = &buf[0];
   sentinelptr = bufptr;

   CurLine = 1;
   firstcolptr = &buf[1];

   lastPreFilePosIndex = -1; 
   
   FillBuf();

   /* CurFileNo = name_to_number("<sourcefile>"); */
}

void  setCurFileName(char * fName) {
    CurFileNo = name_to_number(fName, 0);
}

/*============================================================================*/
/* Symbol Table                                                               */
/*============================================================================*/

process_ident (idstart, idstop) char *idstart, *idstop;
{
   long  hash, length;
   Ident chain;

   length = idstop-idstart;
   hash = ( length*256 + ((*idstart)&0xf)*16 + (*(idstop-1)&0xf) ) 
   & (HashTabSize-1);
   chain = HashTab[hash];

   for(;;) {
      if (chain == NIL) {
	 /* not in table */
	 idnum++;
	 if (idnum>=Maxidtab){
	    printf ("idtab full\n");
	    exit(1);
	 }
	 {
	    register Ident new;
	    new = & idtab[idnum];
	    new->firstposptr = idstringtab_ptr;
	    new->length = length;
	    new->next = HashTab[hash];
	    new->symbol_class = IDENTIFIER;
	    new->meaning = NIL;
	    new->tagmeaning = NIL;
	    HashTab[hash] = new;
	    CurId = new;
	 }
	 { 
	    register char *i, *freeptr, *stop;
	    i = idstart;
	    freeptr = idstringtab_ptr;
	    stop = idstop;
	    while (i < stop) {
	       *freeptr++ = *i++;
	    }
	    *freeptr = NULLCHAR;
	    freeptr++;
	    idstringtab_ptr= freeptr;
	    if (freeptr >&idstringtab[idstringtabSize]){
	       printf("idstringtab full\n");
	       exit(1);
	    }
	 }
	 break;
      }

      /* current token == ident at chain ? */
      if (chain->length == length) {
         char *i;
	 register char *j;
	 int index = 0;
	 i = idstart; j = chain->firstposptr;
	 for(index = 0 ; index < length ; index ++) {
		if(*i != *j) break;
		i++; j++;
	 }
	 if ((i) == idstop && *(j) == NULLCHAR) { 
		CurId = chain;
		break;
	 }
      }

      chain = chain->next;
   }
}
/*-------------------------------------------------------------------------*/

enter_ident (class, idstart) long class; char *idstart;
{
   char *idstop;
   idstop = idstart;
   while (*idstop != NULLCHAR) idstop++;
   process_ident (idstart, idstop, 0);
   CurId->symbol_class = class;
}
/*-------------------------------------------------------------------------*/

string_to_id (str, ref_id)
   char *str;
   Ident *ref_id;
{
   enter_ident(IDENTIFIER, str);
   *ref_id = CurId;
}

/*-------------------------------------------------------------------------*/

int DefTagMeaning (id, m) Ident id; long m;
{
   id->tagmeaning = m;
   return 1;
}
/*-------------------------------------------------------------------------*/

int GetTagMeaning (id, m) Ident id; long *m;
{
   if (id->tagmeaning == NIL)
      return 0;
   *m = id->tagmeaning;
   return 1;
}
/*-------------------------------------------------------------------------*/

int DefMeaning (id, m) Ident id; long m;
{
   id->meaning = m;
   return 1;
}
/*-------------------------------------------------------------------------*/

int GetMeaning (id, m) Ident id; long *m;
{
   if (id->meaning == NIL)
      return 0;
   *m = id->meaning;
   return 1;
}
/*-------------------------------------------------------------------------*/

GetRepr (id, repr) Ident id; char *repr;
{
   char *i, *j;
   i = repr; j = id->firstposptr;
   do {
      *i = *j;
      i++; j++;
   } while (*j != NULLCHAR);
   *i = NULLCHAR;
}
/*-------------------------------------------------------------------------*/

int GetRepr2 (id, repr) Ident id; char **repr;
{
   *repr = id->firstposptr;
   return 1;
}

/*-------------------------------------------------------------------------*/

set_typedef (Id)
   long Id;
{
   ((Ident) Id) ->symbol_class = TYPEDEFNAME; 
}

set_identifier (Id)
   long Id;
{
   ((Ident) Id) ->symbol_class = IDENTIFIER;
}


/*-------------------------------------------------------------------------*/

set_enum (Id)
   long Id;
{
   /* Michael: */
   /* ACC is only a source translation tool, so it doesn't need to distinguish an IDENTIFIER or an ENUMERATIONCONST, because they are all symbols */
   /* To distinguish them only causes more trouble, because a ENUMERATIONCONST could be used as a varaible name, like:

	enum A { record_type = 3 };
	void foo(int record_type );
   
   If we treat "record_type" as an ENUMERATIONCONST, the above function declaraiton could not be parsed */
   /* The fix is just to treat all ENUMERATIONCONST as an IDENTIFIER */ 
   /* ((Ident) Id)->symbol_class = ENUMERATIONCONST; */
    
}

	
/*-------------------------------------------------------------------------*/

set_symbol_class (Id, C)
   long Id;
   long C;
{
   ((Ident) Id)->symbol_class = C;
}

/*-------------------------------------------------------------------------*/

get_symbol_class (Id, C)
   long Id;
   long *C;
{
   *C = ((Ident) Id)->symbol_class;
}

test_symclass_typedef(Id, C)
   long Id;
   long *C;
{
   if( ((Ident)Id)->symbol_class == TYPEDEFNAME) {
	*C = 1;
   }else {
	*C = 0;
   }
}

/*-------------------------------------------------------------------------*/

make_dummy_Ident (I)
   long *I;
{
   *I =-4711;
}

/*============================================================================*/
/* Source Coordinates                                                         */
/*============================================================================*/

get_current_pos (N, L)
   int N; unsigned long *L;

{
/* if N != 0: 
	create a new file number , and store the previous file position information into it, so that they could be printed out in the end */
   /* if N= 0:
	no need to save */
   if(N==0 || lastPreFilePosIndex < 1) {
	*L= create_file_pos(CurFileNo , CurLine);
   }else {
	*L= create_new_file_pos(CurFileNo, CurLine);
   }
   return 1;
}

/* a file position indicate including both file number and line number */
unsigned long create_file_pos(unsigned long fileno, unsigned long lineno) {
   unsigned long abc = fileno * 1000000 + CurLine;
  
   if(abc <= 0) {
	printf("fileno = %lu, lineno = %lu \n", fileno, lineno );
	printf("abc = %lu\n", abc);
	assert(0);
   }
 
   return abc;
}

/* create a new file number , and store the previous file position information into it, so that they could be printed out in the end */
/* should update the fileno with the newly created one */
unsigned long create_new_file_pos(unsigned long filep , unsigned long lineno) {
	struct file_chain * p;
	struct file_pos_chain * fpc;
	int i = 0;
	unsigned long fileno = filep;
 	
	struct file_chain * oldFile = number_to_file(fileno);

	assert(oldFile);
	
	/* create a new file */
	p = (struct file_chain *)malloc(sizeof(struct file_chain));
	
	p->name = copy_chars(oldFile->name);
	p->level = copy_chars(oldFile->level);
	p->mappedName=copy_chars(oldFile->mappedName);
	p->returnAble = 0;
	p->next = 0;
	p->preFilePos = (struct file_pos_chain *)malloc(sizeof(struct file_pos_chain));

	fpc = p->preFilePos;

	/* the last member in preFilePos[] should be the current file number */
	for(i = 0; i < lastPreFilePosIndex - 1 ; i++) {
		fpc->fpos =  preFilePos[i];
		fpc->next = (struct file_pos_chain *)malloc(sizeof(struct file_pos_chain));
		fpc=fpc->next;
	}
	
	fpc->fpos = preFilePos[i];
	fpc->next = 0;

	lastPreFilePosIndex = -1;

        last_file->next = p;
        last_file = p;
		
   	totalFiles++;

	return create_file_pos(totalFiles, lineno);
}

/*-------------------------------------------------------------------------*/

yyGetPos(ref_pos)
   long *ref_pos;
{
   *ref_pos = 0;
}

char * get_current_token() {
	return curr_token;
}
/*-------------------------------------------------------------------------*/
void free_file_pos(struct file_pos_chain * fpc) {
	if(fpc == 0) return;
	free_file_pos(fpc->next);
	free(fpc);
}

void free_files(struct file_chain * f) {
        if(0 == f) return;
        free_files(f->next);
     	free(f->name);
	if(f->mappedName) free(f->mappedName);
	if(f->level) free(f->level);
	free_file_pos(f->preFilePos);
	
	free(f);
}

void free_file_chain() {
      free_files(first_file);
}


/*-------------------------------------------------------------------------*/

unsigned long name_to_number(str, mappedStr)
   char *str;
   char *mappedStr;
{
   struct file_chain *p = first_file;
   unsigned long n = 1;
   char * level = 0;

   /* a file name might contains level information , which is indicated by "&" character */
   /* its format is like: /include/abc.h&2 3 4 */ 
   level = strstr(str, "&");
   if(level) {
	*level = '\0';	/* use '\0' to end the file name */ 
	level ++;	/* level points to the character just after the '\0' */
   }
   
   for (;;) {
      if(p == 0) {
	 /* enter new one */
	 p = (struct file_chain *) malloc(sizeof (struct file_chain));
	 if (p == 0) LexAbort("cannot malloc");
	 p->name = (char *) malloc(strlen(str)+1);
	 if (p->name == 0) LexAbort("cannot malloc");
	 strcpy(p->name, str); 
         if(mappedStr != 0) {
		p->mappedName = (char *) malloc(strlen(mappedStr)+1);
                if (p->mappedName == 0) LexAbort("cannot malloc");
		strcpy(p->mappedName, mappedStr);
	 }else {
		p->mappedName = 0;
	 }

	if(level != 0) {
		p->level = (char *)malloc(strlen(level) + 1);
		strcpy(p->level, level);
	}else {
		p->level = 0;
	}

        p->returnAble = 1;
        p->preFilePos = 0;
	p->next = 0;
	
	if(strstr(str, "setjmp.h")) {
       		setSJMPH_Emitted();
        }

	if (first_file == 0) first_file = p;
	else last_file->next = p;
	last_file = p;

	totalFiles ++;	
	
	return n;
      }
     
	if(strcmp(p->name, str) == 0 ) {
		if(mappedStr == 0) { 
			mappedStr = p->mappedName; 
		}
		
		if(p->returnAble == 1 &&
                	( (p->level == 0 && level == 0)  ||
                  	  (p->level != 0 && level != 0 && strcmp(p->level, level) == 0)
                	)
        	){
                	if(strstr(str, "setjmp.h")) {
                        	setSJMPH_Emitted();
                	}

                	/* found */
                	return n;
        	}
	}

        p = p->next;
      	n++;
   }
}
/*-------------------------------------------------------------------------*/
struct file_chain * number_to_file(unsigned long n) {

	struct file_chain *p;
   	unsigned long i;

   	p = first_file;
   	i = 1;
   	while(1) {
      		if (p == 0 || i == n) break;
      		p = p->next;
      		i++;
   	}

	return p;
} 


char *number_to_name (unsigned long n)
{
   struct file_chain *p = number_to_file(n);
   if(p == 0) {
	 return "<unknown file>";
   }
   return p->mappedName ? p->mappedName : p->name;
}

/*-------------------------------------------------------------------------*/

char *number_to_level (unsigned long n)
{
   struct file_chain *p = number_to_file(n);
   if(p == 0) return (char *)0;
   return p->level;
}


/*============================================================================*/
/* Error Messages                                                             */
/*============================================================================*/

LexError(msg)
   char *msg;
{
   yyerror(msg);
}

/*-------------------------------------------------------------------------*/

LexAbort(msg)
   char *msg;
{
   printf("%s\n", msg);
   exit(1);
}

/*-------------------------------------------------------------------------*/
