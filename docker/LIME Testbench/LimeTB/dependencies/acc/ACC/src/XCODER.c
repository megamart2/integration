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
   CODER.c
   dummy implentation od some predicates from old coder
*/

cg_new_label (ref_Label)
   long *ref_Label;
{
   *ref_Label = 0;
}

cg_dummy_ObjNr (ref_ObjNr)
   long *ref_ObjNr;
{
   *ref_ObjNr = 0;
}
