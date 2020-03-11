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


/*

   ARITH.c

   Implementation of interface Arith.g

*/

#define UNDEF -4711

get_UNDEF_int (C)
   long *C;
{
   *C= UNDEF;
   return 1;
}

is_equal (C1, C2)
   long C1;
   long C2;
{
   return(C1==C2);
}

test_UNDEF_int (C)
   long C;
{
   return(C== UNDEF);
}

test_two (S)
   long S;
{
   return(S==2);
}

test_one (S)
   long S;
{
   return(S==1);
}

test_greater_two (S)
   long S;
{
   return(S>2);
}

max (S1, S2, Max)
   long S1;
   long S2;
   long *Max;
{
   if (S1>=S2)
      *Max=S1;
    else
      *Max=S2;
    return 1;
}

make_at_least_four (Size1, Size)
   long Size1;
   long *Size;
{
if (Size1<4) *Size=4;
 else *Size=Size1;

}

make_even (S1, S2)
   long S1;
   long *S2;

{

if ((S1 % 2)!= 0)
   *S2=S1+1;
 else
    *S2=S1;
 return 1;

}

c_and (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1&C2;
   return 1;
}

c_or (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1|C2;
   return 1;
}

c_xor (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1^C2;
}

c_eq (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1==C2;
}

c_ne (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1!=C2;
}

c_lt (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1<C2;
}

c_gt (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1>C2;
}

c_ge (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1>=C2;
}

c_le (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1<=C2;
}

c_lshift (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1<<C2;
}

c_rshift (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1>>C2;
}

c_minus (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1-C2;
}

c_plus (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1+C2;
}

c_mult (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1*C2;
}

c_div (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1/C2;
}

c_mod (C1, C2, C3)
   long C1;
   long C2;
   long *C3;
{
   *C3=C1%C2;
}

c_unsigned (C1, C2)
   long C1;
   long *C2;
{
   *C2=(unsigned long) C1;
}

c_unminus (C1, C2)
   long C1;
   long *C2;
{
   *C2=(-C1);
}

c_not (C1, C2)
   long C1;
   long *C2;
{
   *C2=(!C1);
}

c_complement (C1, C2)
   long C1;
   long *C2;
{
   *C2=(~C1);
}
