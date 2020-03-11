void foo() __asm__("");
void foo2() __attribute__ ((__nothrow__));
void foo3() __asm__("") __attribute__ ((__nonnull__ (2)));
void foo4() __attribute__ ((__nonnull__ (2))) __asm__("") ;
void foo5() ;

void foo6() __attribute__ ((__nonnull__ (2))) __asm__("") __attribute__ ((__nonnull__ (2))) __asm__("") ;

void foo7() {
	if ( __retval != ((void *)0) && 
	     (*__s = 
		(__extension__ (
			__builtin_constant_p (__reject) && 
			!__builtin_constant_p (__retval) && 
			(__reject) == '\0' ? 
				(char *) __rawmemchr (__retval, __reject) : 
				__builtin_strchr (__retval, __reject) 
                        )
                )
             ) != ((void *)0)
           )
    *(*__s)++ = '\0';
}

void foo8() __attribute__((visibility("hidden")));

int foo9() {
	char c;
	
	/* special character */
	'\n';
	'\r';
	'\0';
	'\1';
	'\7';
	'\b';
	'\t';
	'\f';
	'\r';
	'\\n';
	'\"';
	'\\';

	/* special character */
        "\n";
        "\r";
        "\0";
        "\1";
        "\7";
        "\b";
        "\t";
        "\f";
        "\r";
        "\\n";
        "\"";
        "\\";
	
		
	if ( __c <= '\x7f' ) {
	}

	if ( __wc <= L'\x7f') {

	}

	L"abc";

	"GNU libavl 2.0.2\n"
        "Copyright (C) 1998-2002, 2004 "
        "Free Software Foundation, Inc.\n"
        "This program comes with NO WARRANTY, not even for\n"
        "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n"
        "You may redistribute copies under the terms of the\n"
        "GNU General Public License.  For more information on\n";

}


