typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"AST", l);
}
yyeq_S(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 2: return (t2[0] == 2)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
;
case 3: return (t2[0] == 3)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
;
case 4: return (t2[0] == 4)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
&& yyeq_E((yy)t1[3], (yy)t2[3])
&& yyeq_S((yy)t1[4], (yy)t2[4])
;
case 5: return (t2[0] == 5)
&& yyeq_S((yy)t1[1], (yy)t2[1])
;
case 6: return (t2[0] == 6)
&& yyeq_S((yy)t1[1], (yy)t2[1])
;
case 7: return (t2[0] == 7)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_S((yy)t1[3], (yy)t2[3])
;
case 8: return (t2[0] == 8)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
;
case 9: return (t2[0] == 9)
&& yyeq_S((yy)t1[1], (yy)t2[1])
;
case 10: return (t2[0] == 10)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
;
case 11: return (t2[0] == 11)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
&& yyeq_S((yy)t1[3], (yy)t2[3])
;
case 12: return (t2[0] == 12)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
;
case 13: return (t2[0] == 13)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 14: return (t2[0] == 14)
;
case 15: return (t2[0] == 15)
;
case 16: return (t2[0] == 16)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 17: return (t2[0] == 17)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 18: return (t2[0] == 18)
;
case 19: return (t2[0] == 19)
&& yyeq_S((yy)t1[1], (yy)t2[1])
&& yyeq_S((yy)t1[2], (yy)t2[2])
&& (t1[3] == t2[3])
;
case 20: return (t2[0] == 20)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 21: return (t2[0] == 21)
&& yyeq_S((yy)t1[1], (yy)t2[1])
;
}
}
yyPrint_S(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("a_expression_stmt");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 2: 
yyTerm("a_do");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyEndArgs();
break;
case 3: 
yyTerm("a_while");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyEndArgs();
break;
case 4: 
yyTerm("a_for");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyNextArg();
yyPrint_E((yy)t[3]);
yyNextArg();
yyPrint_S((yy)t[4]);
yyEndArgs();
break;
case 5: 
yyTerm("a_function_body");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyEndArgs();
break;
case 6: 
yyTerm("a_compound");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyEndArgs();
break;
case 7: 
yyTerm("a_labeled");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_S((yy)t[3]);
yyEndArgs();
break;
case 8: 
yyTerm("a_labeled_case");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyEndArgs();
break;
case 9: 
yyTerm("a_labeled_default");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyEndArgs();
break;
case 10: 
yyTerm("a_if_then");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyEndArgs();
break;
case 11: 
yyTerm("a_if_then_else");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyNextArg();
yyPrint_S((yy)t[3]);
yyEndArgs();
break;
case 12: 
yyTerm("a_switch");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyEndArgs();
break;
case 13: 
yyTerm("a_goto");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 14: 
yyTerm("a_continue");
yyNoArgs();
break;
case 15: 
yyTerm("a_break");
yyNoArgs();
break;
case 16: 
yyTerm("a_return");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 17: 
yyTerm("a_asm_statement");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 18: 
yyTerm("a_decl_stmt_list_nil");
yyNoArgs();
break;
case 19: 
yyTerm("a_decl_stmt_list");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyNextArg();
yyPrint_S((yy)t[2]);
yyNextArg();
yyPrint_INT((yy)t[3]);
yyEndArgs();
break;
case 20: 
yyTerm("a_decl_stmt_decl");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 21: 
yyTerm("a_decl_stmt_stmt");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyEndArgs();
break;
}
}
yybroadcast_S(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_S, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 2: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 3: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 4: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
yybroadcast_E((yy)t[3], A, &B, Handler);
yybroadcast_S((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 5: 
yybroadcast_S((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 6: 
yybroadcast_S((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 7: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_S((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 8: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 9: 
yybroadcast_S((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 10: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 11: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
yybroadcast_S((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 12: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 13: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 14: 
*Out = A;
break;
case 15: 
*Out = A;
break;
case 16: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 17: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 18: 
*Out = A;
break;
case 19: 
yybroadcast_S((yy)t[1], A, &B, Handler);
yybroadcast_S((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 20: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 21: 
yybroadcast_S((yy)t[1], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_E(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 2: return (t2[0] == 2)
;
case 3: return (t2[0] == 3)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 4: return (t2[0] == 4)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 5: return (t2[0] == 5)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 6: return (t2[0] == 6)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 7: return (t2[0] == 7)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 8: return (t2[0] == 8)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
&& yyeq_Ident((yy)t1[3], (yy)t2[3])
;
case 9: return (t2[0] == 9)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
&& yyeq_E((yy)t1[3], (yy)t2[3])
;
case 10: return (t2[0] == 10)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
&& yyeq_E((yy)t1[3], (yy)t2[3])
&& yyeq_E((yy)t1[4], (yy)t2[4])
;
case 11: return (t2[0] == 11)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 12: return (t2[0] == 12)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 13: return (t2[0] == 13)
;
case 14: return (t2[0] == 14)
;
case 15: return (t2[0] == 15)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 16: return (t2[0] == 16)
;
case 17: return (t2[0] == 17)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 18: return (t2[0] == 18)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 19: return (t2[0] == 19)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 20: return (t2[0] == 20)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 21: return (t2[0] == 21)
&& yyeq_Float((yy)t1[1], (yy)t2[1])
;
case 22: return (t2[0] == 22)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 23: return (t2[0] == 23)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 24: return (t2[0] == 24)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 25: return (t2[0] == 25)
&& yyeq_S((yy)t1[1], (yy)t2[1])
;
case 26: return (t2[0] == 26)
;
case 27: return (t2[0] == 27)
;
case 28: return (t2[0] == 28)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 29: return (t2[0] == 29)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 30: return (t2[0] == 30)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 31: return (t2[0] == 31)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_E(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("a_argument_expression_list");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 2: 
yyTerm("a_argument_expression_list_nil");
yyNoArgs();
break;
case 3: 
yyTerm("a_typename_expr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 4: 
yyTerm("a_type_and_member_expr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 5: 
yyTerm("a_def_expr");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 6: 
yyTerm("a_noop_exprid");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 7: 
yyTerm("a_unexpr");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 8: 
yyTerm("a_biexprid");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyNextArg();
yyPrint_Ident((yy)t[3]);
yyEndArgs();
break;
case 9: 
yyTerm("a_biexpr");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyNextArg();
yyPrint_E((yy)t[3]);
yyEndArgs();
break;
case 10: 
yyTerm("a_triexpr");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyNextArg();
yyPrint_E((yy)t[3]);
yyNextArg();
yyPrint_E((yy)t[4]);
yyEndArgs();
break;
case 11: 
yyTerm("a_const_range");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 12: 
yyTerm("a_paren_expr");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 13: 
yyTerm("a_noexpr");
yyNoArgs();
break;
case 14: 
yyTerm("a_gcc_restrict_expr");
yyNoArgs();
break;
case 15: 
yyTerm("a_string_token");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 16: 
yyTerm("a_string_nil");
yyNoArgs();
break;
case 17: 
yyTerm("a_string");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 18: 
yyTerm("a_wstring");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 19: 
yyTerm("a_charconst");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 20: 
yyTerm("a_wcharconst");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 21: 
yyTerm("a_floatconst");
yyFirstArg();
yyPrint_Float((yy)t[1]);
yyEndArgs();
break;
case 22: 
yyTerm("a_enumerationconst");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 23: 
yyTerm("a_integerconst");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 24: 
yyTerm("a_inttype_const");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 25: 
yyTerm("a_expr_with_comp_statement");
yyFirstArg();
yyPrint_S((yy)t[1]);
yyEndArgs();
break;
case 26: 
yyTerm("a_unspec_width");
yyNoArgs();
break;
case 27: 
yyTerm("a_asm_symlink_nil");
yyNoArgs();
break;
case 28: 
yyTerm("a_asm_symlink");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 29: 
yyTerm("a_complit_expr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 30: 
yyTerm("a_complit_expr_incomplete");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 31: 
yyTerm("a_vaarg_expr");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_E(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_E, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 2: 
*Out = A;
break;
case 3: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 4: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 5: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 6: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 7: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 8: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
yybroadcast_Ident((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 9: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
yybroadcast_E((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 10: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
yybroadcast_E((yy)t[3], A, &B, Handler);
yybroadcast_E((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 11: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 12: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 13: 
*Out = A;
break;
case 14: 
*Out = A;
break;
case 15: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 16: 
*Out = A;
break;
case 17: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 18: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 19: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 20: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 21: 
yybroadcast_Float((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 22: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 23: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 24: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 25: 
yybroadcast_S((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 26: 
*Out = A;
break;
case 27: 
*Out = A;
break;
case 28: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 29: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 30: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 31: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_D(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Float((yy)t1[1], (yy)t2[1])
;
case 2: return (t2[0] == 2)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 3: return (t2[0] == 3)
;
case 4: return (t2[0] == 4)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 5: return (t2[0] == 5)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 6: return (t2[0] == 6)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_Ident((yy)t1[2], (yy)t2[2])
;
case 7: return (t2[0] == 7)
;
case 8: return (t2[0] == 8)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
&& yyeq_S((yy)t1[4], (yy)t2[4])
&& (t1[5] == t2[5])
;
case 9: return (t2[0] == 9)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& (t1[3] == t2[3])
;
case 10: return (t2[0] == 10)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
;
case 11: return (t2[0] == 11)
;
case 12: return (t2[0] == 12)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_Ident((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
&& yyeq_D((yy)t1[4], (yy)t2[4])
&& (t1[5] == t2[5])
;
case 13: return (t2[0] == 13)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 14: return (t2[0] == 14)
;
case 15: return (t2[0] == 15)
;
case 16: return (t2[0] == 16)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 17: return (t2[0] == 17)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 18: return (t2[0] == 18)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 19: return (t2[0] == 19)
;
case 20: return (t2[0] == 20)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 21: return (t2[0] == 21)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 22: return (t2[0] == 22)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 23: return (t2[0] == 23)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 24: return (t2[0] == 24)
;
case 25: return (t2[0] == 25)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 26: return (t2[0] == 26)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 27: return (t2[0] == 27)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_Ident((yy)t1[2], (yy)t2[2])
;
case 28: return (t2[0] == 28)
;
case 29: return (t2[0] == 29)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 30: return (t2[0] == 30)
;
case 31: return (t2[0] == 31)
;
case 32: return (t2[0] == 32)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 33: return (t2[0] == 33)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 34: return (t2[0] == 34)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 35: return (t2[0] == 35)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 36: return (t2[0] == 36)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
;
case 37: return (t2[0] == 37)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 38: return (t2[0] == 38)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 39: return (t2[0] == 39)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 40: return (t2[0] == 40)
;
case 41: return (t2[0] == 41)
;
case 42: return (t2[0] == 42)
;
case 43: return (t2[0] == 43)
;
case 44: return (t2[0] == 44)
;
case 45: return (t2[0] == 45)
;
case 46: return (t2[0] == 46)
;
case 47: return (t2[0] == 47)
;
case 48: return (t2[0] == 48)
;
case 49: return (t2[0] == 49)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 50: return (t2[0] == 50)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 51: return (t2[0] == 51)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 52: return (t2[0] == 52)
;
case 53: return (t2[0] == 53)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 54: return (t2[0] == 54)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 55: return (t2[0] == 55)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 56: return (t2[0] == 56)
;
case 57: return (t2[0] == 57)
;
case 58: return (t2[0] == 58)
;
case 59: return (t2[0] == 59)
;
case 60: return (t2[0] == 60)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 61: return (t2[0] == 61)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 62: return (t2[0] == 62)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 63: return (t2[0] == 63)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 64: return (t2[0] == 64)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 65: return (t2[0] == 65)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 66: return (t2[0] == 66)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 67: return (t2[0] == 67)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 68: return (t2[0] == 68)
;
case 69: return (t2[0] == 69)
;
case 70: return (t2[0] == 70)
;
case 71: return (t2[0] == 71)
;
case 72: return (t2[0] == 72)
;
case 73: return (t2[0] == 73)
;
case 74: return (t2[0] == 74)
;
case 75: return (t2[0] == 75)
;
case 76: return (t2[0] == 76)
;
case 77: return (t2[0] == 77)
;
case 78: return (t2[0] == 78)
;
case 79: return (t2[0] == 79)
;
case 80: return (t2[0] == 80)
;
case 81: return (t2[0] == 81)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 82: return (t2[0] == 82)
;
case 83: return (t2[0] == 83)
;
case 84: return (t2[0] == 84)
;
case 85: return (t2[0] == 85)
;
case 86: return (t2[0] == 86)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 87: return (t2[0] == 87)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 88: return (t2[0] == 88)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 89: return (t2[0] == 89)
;
case 90: return (t2[0] == 90)
;
case 91: return (t2[0] == 91)
;
case 92: return (t2[0] == 92)
;
case 93: return (t2[0] == 93)
;
case 94: return (t2[0] == 94)
;
case 95: return (t2[0] == 95)
;
case 96: return (t2[0] == 96)
;
case 97: return (t2[0] == 97)
;
case 98: return (t2[0] == 98)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 99: return (t2[0] == 99)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 100: return (t2[0] == 100)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 101: return (t2[0] == 101)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 102: return (t2[0] == 102)
;
case 103: return (t2[0] == 103)
;
case 104: return (t2[0] == 104)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 105: return (t2[0] == 105)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 106: return (t2[0] == 106)
;
case 107: return (t2[0] == 107)
;
case 108: return (t2[0] == 108)
;
case 109: return (t2[0] == 109)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 110: return (t2[0] == 110)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 111: return (t2[0] == 111)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 112: return (t2[0] == 112)
;
case 113: return (t2[0] == 113)
;
case 114: return (t2[0] == 114)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 115: return (t2[0] == 115)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 116: return (t2[0] == 116)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 117: return (t2[0] == 117)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_IdOpt((yy)t1[3], (yy)t2[3])
&& yyeq_D((yy)t1[4], (yy)t2[4])
;
case 118: return (t2[0] == 118)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_Ident((yy)t1[3], (yy)t2[3])
;
case 119: return (t2[0] == 119)
;
case 120: return (t2[0] == 120)
;
case 121: return (t2[0] == 121)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 122: return (t2[0] == 122)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 123: return (t2[0] == 123)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 124: return (t2[0] == 124)
;
case 125: return (t2[0] == 125)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 126: return (t2[0] == 126)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 127: return (t2[0] == 127)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 128: return (t2[0] == 128)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 129: return (t2[0] == 129)
;
case 130: return (t2[0] == 130)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 131: return (t2[0] == 131)
;
case 132: return (t2[0] == 132)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 133: return (t2[0] == 133)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 134: return (t2[0] == 134)
;
case 135: return (t2[0] == 135)
&& yyeq_IdOpt((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 136: return (t2[0] == 136)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 137: return (t2[0] == 137)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_IdOpt((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
;
case 138: return (t2[0] == 138)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_Ident((yy)t1[2], (yy)t2[2])
;
case 139: return (t2[0] == 139)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 140: return (t2[0] == 140)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 141: return (t2[0] == 141)
;
case 142: return (t2[0] == 142)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 143: return (t2[0] == 143)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 144: return (t2[0] == 144)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 145: return (t2[0] == 145)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 146: return (t2[0] == 146)
&& yyeq_Op((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
;
case 147: return (t2[0] == 147)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 148: return (t2[0] == 148)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 149: return (t2[0] == 149)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 150: return (t2[0] == 150)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_Ident((yy)t1[2], (yy)t2[2])
&& yyeq_D((yy)t1[3], (yy)t2[3])
;
case 151: return (t2[0] == 151)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 152: return (t2[0] == 152)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 153: return (t2[0] == 153)
;
case 154: return (t2[0] == 154)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 155: return (t2[0] == 155)
;
case 156: return (t2[0] == 156)
;
case 157: return (t2[0] == 157)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 158: return (t2[0] == 158)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 159: return (t2[0] == 159)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
&& yyeq_S((yy)t1[3], (yy)t2[3])
&& (t1[4] == t2[4])
&& yyeq_D((yy)t1[5], (yy)t2[5])
;
case 160: return (t2[0] == 160)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 161: return (t2[0] == 161)
;
case 162: return (t2[0] == 162)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
&& yyeq_E((yy)t1[3], (yy)t2[3])
;
case 163: return (t2[0] == 163)
;
case 164: return (t2[0] == 164)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_E((yy)t1[2], (yy)t2[2])
;
case 165: return (t2[0] == 165)
;
case 166: return (t2[0] == 166)
&& yyeq_D((yy)t1[1], (yy)t2[1])
;
case 167: return (t2[0] == 167)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 168: return (t2[0] == 168)
;
case 169: return (t2[0] == 169)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
case 170: return (t2[0] == 170)
&& yyeq_E((yy)t1[1], (yy)t2[1])
;
case 171: return (t2[0] == 171)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 172: return (t2[0] == 172)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_D((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_D(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("a_pound_dir");
yyFirstArg();
yyPrint_Float((yy)t[1]);
yyEndArgs();
break;
case 2: 
yyTerm("a_external_declaration_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 3: 
yyTerm("a_external_declaration_list_nil");
yyNoArgs();
break;
case 4: 
yyTerm("a_external_asm");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 5: 
yyTerm("a_var_decl");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 6: 
yyTerm("a_id_dot_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_Ident((yy)t[2]);
yyEndArgs();
break;
case 7: 
yyTerm("a_identifier_dot_list_nil");
yyNoArgs();
break;
case 8: 
yyTerm("a_function_definition");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyNextArg();
yyPrint_S((yy)t[4]);
yyNextArg();
yyPrint_INT((yy)t[5]);
yyEndArgs();
break;
case 9: 
yyTerm("a_declaration");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_INT((yy)t[3]);
yyEndArgs();
break;
case 10: 
yyTerm("a_asm_decl");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyEndArgs();
break;
case 11: 
yyTerm("a_empty_decl");
yyNoArgs();
break;
case 12: 
yyTerm("a_pointcut_declaration");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_Ident((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyNextArg();
yyPrint_D((yy)t[4]);
yyNextArg();
yyPrint_INT((yy)t[5]);
yyEndArgs();
break;
case 13: 
yyTerm("a_declaration_list_old_style");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 14: 
yyTerm("a_declaration_list_nil");
yyNoArgs();
break;
case 15: 
yyTerm("a_no_declaration_specifiers");
yyNoArgs();
break;
case 16: 
yyTerm("a_declaration_specifiers_with_gcc_ext");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 17: 
yyTerm("a_declaration_specifiers_no_gcc_ext");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 18: 
yyTerm("a_init_declarator_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 19: 
yyTerm("a_init_declarator_list_nil");
yyNoArgs();
break;
case 20: 
yyTerm("a_init_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 21: 
yyTerm("a_declarator_with_gcc_attr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 22: 
yyTerm("a_declarator_with_post_spec");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 23: 
yyTerm("a_declarator_list_with_gcc_attr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 24: 
yyTerm("a_post_spec_list_nil");
yyNoArgs();
break;
case 25: 
yyTerm("a_post_spec_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 26: 
yyTerm("a_uninit_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 27: 
yyTerm("a_identifier_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_Ident((yy)t[2]);
yyEndArgs();
break;
case 28: 
yyTerm("a_identifier_list_nil");
yyNoArgs();
break;
case 29: 
yyTerm("a_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 30: 
yyTerm("a_declarator_nil");
yyNoArgs();
break;
case 31: 
yyTerm("a_no_pointer");
yyNoArgs();
break;
case 32: 
yyTerm("a_pointer");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 33: 
yyTerm("a_direct_declarator_ident");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 34: 
yyTerm("a_direct_declarator_paren_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 35: 
yyTerm("a_direct_declarator_array");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 36: 
yyTerm("a_direct_declarator_function_new");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyEndArgs();
break;
case 37: 
yyTerm("a_direct_declarator_function_old");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 38: 
yyTerm("a_str_declarator_with_post_spec");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 39: 
yyTerm("a_storage_class");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 40: 
yyTerm("a_class_nil");
yyNoArgs();
break;
case 41: 
yyTerm("a_auto");
yyNoArgs();
break;
case 42: 
yyTerm("a_register");
yyNoArgs();
break;
case 43: 
yyTerm("a_static");
yyNoArgs();
break;
case 44: 
yyTerm("a_extern");
yyNoArgs();
break;
case 45: 
yyTerm("a_typedef");
yyNoArgs();
break;
case 46: 
yyTerm("a_gcc_ext_nil");
yyNoArgs();
break;
case 47: 
yyTerm("a_gcc_extension");
yyNoArgs();
break;
case 48: 
yyTerm("a_gcc_attribute_nil");
yyNoArgs();
break;
case 49: 
yyTerm("a_gcc_attribute");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 50: 
yyTerm("a_gcc_uuattribute");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 51: 
yyTerm("a_gcc_attribute_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 52: 
yyTerm("a_gcc_attribute_list_nil");
yyNoArgs();
break;
case 53: 
yyTerm("a_gcc_attr_no_value");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 54: 
yyTerm("a_gcc_attr_one_keyword");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 55: 
yyTerm("a_gcc_attr_with_parameter");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 56: 
yyTerm("a_gcc_restrict");
yyNoArgs();
break;
case 57: 
yyTerm("a_gcc_asm");
yyNoArgs();
break;
case 58: 
yyTerm("a_gcc_uu_asm");
yyNoArgs();
break;
case 59: 
yyTerm("a_gcc_uu_asm_uu");
yyNoArgs();
break;
case 60: 
yyTerm("a_asm_operand1");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 61: 
yyTerm("a_asm_operand2");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 62: 
yyTerm("a_asm_operand3");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 63: 
yyTerm("a_asm_operand4");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 64: 
yyTerm("a_asm_operand5");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 65: 
yyTerm("a_gcc_multiple_attribute_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 66: 
yyTerm("a_gcc_multiple_attribute");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 67: 
yyTerm("a_type_specifier");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 68: 
yyTerm("a_void");
yyNoArgs();
break;
case 69: 
yyTerm("a_char");
yyNoArgs();
break;
case 70: 
yyTerm("a_short");
yyNoArgs();
break;
case 71: 
yyTerm("a_int");
yyNoArgs();
break;
case 72: 
yyTerm("a_complex");
yyNoArgs();
break;
case 73: 
yyTerm("a_imaginary");
yyNoArgs();
break;
case 74: 
yyTerm("a_long");
yyNoArgs();
break;
case 75: 
yyTerm("a_float");
yyNoArgs();
break;
case 76: 
yyTerm("a_double");
yyNoArgs();
break;
case 77: 
yyTerm("a_signed");
yyNoArgs();
break;
case 78: 
yyTerm("a_uusigneduu");
yyNoArgs();
break;
case 79: 
yyTerm("a_unsigned");
yyNoArgs();
break;
case 80: 
yyTerm("a_bool");
yyNoArgs();
break;
case 81: 
yyTerm("a_function_specifier");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 82: 
yyTerm("a_inline");
yyNoArgs();
break;
case 83: 
yyTerm("a_gcc_inline");
yyNoArgs();
break;
case 84: 
yyTerm("a_gcc_uu_inline");
yyNoArgs();
break;
case 85: 
yyTerm("a_gcc_va_list");
yyNoArgs();
break;
case 86: 
yyTerm("a_typedefname");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 87: 
yyTerm("a_type_qualifier");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 88: 
yyTerm("a_typeoftype");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 89: 
yyTerm("a_uu_typeof");
yyNoArgs();
break;
case 90: 
yyTerm("a_uu_typeof_uu");
yyNoArgs();
break;
case 91: 
yyTerm("a_typeof");
yyNoArgs();
break;
case 92: 
yyTerm("a_const");
yyNoArgs();
break;
case 93: 
yyTerm("a_volatile");
yyNoArgs();
break;
case 94: 
yyTerm("a_uuvolatile");
yyNoArgs();
break;
case 95: 
yyTerm("a_uuvolatileuu");
yyNoArgs();
break;
case 96: 
yyTerm("a_volatile_nil");
yyNoArgs();
break;
case 97: 
yyTerm("a_gcc_const");
yyNoArgs();
break;
case 98: 
yyTerm("a_initializer_expr");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 99: 
yyTerm("a_initializer_aggregate");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 100: 
yyTerm("a_initializer_incomplete_aggregate");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 101: 
yyTerm("a_initializer_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 102: 
yyTerm("a_initializer_list_nil");
yyNoArgs();
break;
case 103: 
yyTerm("a_parameter_type_list_nil");
yyNoArgs();
break;
case 104: 
yyTerm("a_parameter_type_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 105: 
yyTerm("a_parameter_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 106: 
yyTerm("a_parameter_list_nil");
yyNoArgs();
break;
case 107: 
yyTerm("a_no_ellipsis");
yyNoArgs();
break;
case 108: 
yyTerm("a_ellipsis");
yyNoArgs();
break;
case 109: 
yyTerm("a_declarator_parameter_declaration");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 110: 
yyTerm("a_abstract_declarator_parameter_declaration");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 111: 
yyTerm("a_abstract_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 112: 
yyTerm("a_abstract_declarator_nil");
yyNoArgs();
break;
case 113: 
yyTerm("a_direct_abstract_declarator_nil");
yyNoArgs();
break;
case 114: 
yyTerm("a_direct_abstract_declarator_paren_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 115: 
yyTerm("a_direct_abstract_declarator_array");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 116: 
yyTerm("a_direct_abstract_declarator_function_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 117: 
yyTerm("a_struct_or_union");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_IdOpt((yy)t[3]);
yyNextArg();
yyPrint_D((yy)t[4]);
yyEndArgs();
break;
case 118: 
yyTerm("a_incomplete_struct_or_union");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_Ident((yy)t[3]);
yyEndArgs();
break;
case 119: 
yyTerm("a_struct");
yyNoArgs();
break;
case 120: 
yyTerm("a_union");
yyNoArgs();
break;
case 121: 
yyTerm("a_struct_with_gcc_attr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 122: 
yyTerm("a_union_with_gcc_attr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 123: 
yyTerm("a_struct_declaration_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 124: 
yyTerm("a_struct_declaration_list_nil");
yyNoArgs();
break;
case 125: 
yyTerm("a_struct_declaration_with_gcc_ext");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 126: 
yyTerm("a_struct_declaration_no_gcc_ext");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 127: 
yyTerm("a_struct_declaration_no_gcc_ext_noname");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 128: 
yyTerm("a_struct_declarator_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 129: 
yyTerm("a_struct_declarator_list_nil");
yyNoArgs();
break;
case 130: 
yyTerm("a_specifier_qualifier_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 131: 
yyTerm("a_specifier_qualifier_list_nil");
yyNoArgs();
break;
case 132: 
yyTerm("a_struct_declarator");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 133: 
yyTerm("a_type_qualifier_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 134: 
yyTerm("a_type_qualifier_list_empty");
yyNoArgs();
break;
case 135: 
yyTerm("a_enum_specifier");
yyFirstArg();
yyPrint_IdOpt((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 136: 
yyTerm("a_incomplete_enum_specifier");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 137: 
yyTerm("a_enum_specifier_new");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_IdOpt((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyEndArgs();
break;
case 138: 
yyTerm("a_incomplete_enum_specifier_new");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_Ident((yy)t[2]);
yyEndArgs();
break;
case 139: 
yyTerm("a_enum_with_gcc_attr");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 140: 
yyTerm("a_enumerator_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 141: 
yyTerm("a_enumerator_list_nil");
yyNoArgs();
break;
case 142: 
yyTerm("a_enumerator");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 143: 
yyTerm("a_assigned_enumerator");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 144: 
yyTerm("a_typename");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 145: 
yyTerm("a_unpointcut");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 146: 
yyTerm("a_bipointcut");
yyFirstArg();
yyPrint_Op((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyEndArgs();
break;
case 147: 
yyTerm("a_pointcut");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 148: 
yyTerm("a_cflow_or_try");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 149: 
yyTerm("a_infile_decl");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 150: 
yyTerm("a_func_jointpoint");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_Ident((yy)t[2]);
yyNextArg();
yyPrint_D((yy)t[3]);
yyEndArgs();
break;
case 151: 
yyTerm("a_args_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 152: 
yyTerm("a_args_decls");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 153: 
yyTerm("a_args_list_nil");
yyNoArgs();
break;
case 154: 
yyTerm("a_args_declaration");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 155: 
yyTerm("a_args_declarator_nil");
yyNoArgs();
break;
case 156: 
yyTerm("a_args_type_specifier_nil");
yyNoArgs();
break;
case 157: 
yyTerm("a_ident_pointer");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 158: 
yyTerm("a_pointer_ident");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 159: 
yyTerm("a_advice_definition");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyNextArg();
yyPrint_S((yy)t[3]);
yyNextArg();
yyPrint_INT((yy)t[4]);
yyNextArg();
yyPrint_D((yy)t[5]);
yyEndArgs();
break;
case 160: 
yyTerm("a_asm_operand_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 161: 
yyTerm("a_asm_operand_list_nil");
yyNoArgs();
break;
case 162: 
yyTerm("a_asm_operand");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyNextArg();
yyPrint_E((yy)t[3]);
yyEndArgs();
break;
case 163: 
yyTerm("a_asm_clob_reg_list_nil");
yyNoArgs();
break;
case 164: 
yyTerm("a_asm_clob_reg_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_E((yy)t[2]);
yyEndArgs();
break;
case 165: 
yyTerm("a_designation_nil");
yyNoArgs();
break;
case 166: 
yyTerm("a_designation");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyEndArgs();
break;
case 167: 
yyTerm("a_designation_old_style");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 168: 
yyTerm("a_designator_list_nil");
yyNoArgs();
break;
case 169: 
yyTerm("a_designator_list");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
case 170: 
yyTerm("a_const_designator");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyEndArgs();
break;
case 171: 
yyTerm("a_member_designator");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 172: 
yyTerm("a_designated_initializer");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_D((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_D(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_D, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Float((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 2: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 3: 
*Out = A;
break;
case 4: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 5: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 6: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_Ident((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 7: 
*Out = A;
break;
case 8: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
yybroadcast_S((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 9: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 10: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 11: 
*Out = A;
break;
case 12: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_Ident((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
yybroadcast_D((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 13: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 14: 
*Out = A;
break;
case 15: 
*Out = A;
break;
case 16: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 17: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 18: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 19: 
*Out = A;
break;
case 20: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 21: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 22: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 23: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 24: 
*Out = A;
break;
case 25: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 26: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 27: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_Ident((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 28: 
*Out = A;
break;
case 29: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 30: 
*Out = A;
break;
case 31: 
*Out = A;
break;
case 32: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 33: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 34: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 35: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 36: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 37: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 38: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 39: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 40: 
*Out = A;
break;
case 41: 
*Out = A;
break;
case 42: 
*Out = A;
break;
case 43: 
*Out = A;
break;
case 44: 
*Out = A;
break;
case 45: 
*Out = A;
break;
case 46: 
*Out = A;
break;
case 47: 
*Out = A;
break;
case 48: 
*Out = A;
break;
case 49: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 50: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 51: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 52: 
*Out = A;
break;
case 53: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 54: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 55: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 56: 
*Out = A;
break;
case 57: 
*Out = A;
break;
case 58: 
*Out = A;
break;
case 59: 
*Out = A;
break;
case 60: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 61: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 62: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 63: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 64: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 65: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 66: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 67: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 68: 
*Out = A;
break;
case 69: 
*Out = A;
break;
case 70: 
*Out = A;
break;
case 71: 
*Out = A;
break;
case 72: 
*Out = A;
break;
case 73: 
*Out = A;
break;
case 74: 
*Out = A;
break;
case 75: 
*Out = A;
break;
case 76: 
*Out = A;
break;
case 77: 
*Out = A;
break;
case 78: 
*Out = A;
break;
case 79: 
*Out = A;
break;
case 80: 
*Out = A;
break;
case 81: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 82: 
*Out = A;
break;
case 83: 
*Out = A;
break;
case 84: 
*Out = A;
break;
case 85: 
*Out = A;
break;
case 86: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 87: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 88: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 89: 
*Out = A;
break;
case 90: 
*Out = A;
break;
case 91: 
*Out = A;
break;
case 92: 
*Out = A;
break;
case 93: 
*Out = A;
break;
case 94: 
*Out = A;
break;
case 95: 
*Out = A;
break;
case 96: 
*Out = A;
break;
case 97: 
*Out = A;
break;
case 98: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 99: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 100: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 101: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 102: 
*Out = A;
break;
case 103: 
*Out = A;
break;
case 104: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 105: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 106: 
*Out = A;
break;
case 107: 
*Out = A;
break;
case 108: 
*Out = A;
break;
case 109: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 110: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 111: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 112: 
*Out = A;
break;
case 113: 
*Out = A;
break;
case 114: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 115: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 116: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 117: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_IdOpt((yy)t[3], A, &B, Handler);
yybroadcast_D((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 118: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_Ident((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 119: 
*Out = A;
break;
case 120: 
*Out = A;
break;
case 121: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 122: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 123: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 124: 
*Out = A;
break;
case 125: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 126: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 127: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 128: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 129: 
*Out = A;
break;
case 130: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 131: 
*Out = A;
break;
case 132: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 133: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 134: 
*Out = A;
break;
case 135: 
yybroadcast_IdOpt((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 136: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 137: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_IdOpt((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 138: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_Ident((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 139: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 140: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 141: 
*Out = A;
break;
case 142: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 143: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 144: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 145: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 146: 
yybroadcast_Op((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 147: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 148: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 149: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 150: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_Ident((yy)t[2], B, &A, Handler);
yybroadcast_D((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 151: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 152: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 153: 
*Out = A;
break;
case 154: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 155: 
*Out = A;
break;
case 156: 
*Out = A;
break;
case 157: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 158: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 159: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
yybroadcast_S((yy)t[3], A, &B, Handler);
yybroadcast_D((yy)t[5], B, &A, Handler);
*Out = A;
break;
case 160: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 161: 
*Out = A;
break;
case 162: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
yybroadcast_E((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 163: 
*Out = A;
break;
case 164: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_E((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 165: 
*Out = A;
break;
case 166: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 167: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 168: 
*Out = A;
break;
case 169: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 170: 
yybroadcast_E((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 171: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 172: 
yybroadcast_D((yy)t[1], A, &B, Handler);
yybroadcast_D((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_Op(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
;
case 3: return (t2[0] == 3)
;
case 4: return (t2[0] == 4)
;
case 5: return (t2[0] == 5)
;
case 6: return (t2[0] == 6)
;
case 7: return (t2[0] == 7)
;
case 8: return (t2[0] == 8)
;
case 9: return (t2[0] == 9)
;
case 10: return (t2[0] == 10)
;
case 11: return (t2[0] == 11)
;
case 12: return (t2[0] == 12)
;
case 13: return (t2[0] == 13)
;
case 14: return (t2[0] == 14)
;
case 15: return (t2[0] == 15)
;
case 16: return (t2[0] == 16)
;
case 17: return (t2[0] == 17)
;
case 18: return (t2[0] == 18)
;
case 19: return (t2[0] == 19)
;
case 20: return (t2[0] == 20)
;
case 21: return (t2[0] == 21)
;
case 22: return (t2[0] == 22)
;
case 23: return (t2[0] == 23)
;
case 24: return (t2[0] == 24)
;
case 25: return (t2[0] == 25)
;
case 26: return (t2[0] == 26)
;
case 27: return (t2[0] == 27)
;
case 28: return (t2[0] == 28)
;
case 29: return (t2[0] == 29)
;
case 30: return (t2[0] == 30)
;
case 31: return (t2[0] == 31)
;
case 32: return (t2[0] == 32)
;
case 33: return (t2[0] == 33)
;
case 34: return (t2[0] == 34)
;
case 35: return (t2[0] == 35)
;
case 36: return (t2[0] == 36)
;
case 37: return (t2[0] == 37)
;
case 38: return (t2[0] == 38)
;
case 39: return (t2[0] == 39)
;
case 40: return (t2[0] == 40)
;
case 41: return (t2[0] == 41)
;
case 42: return (t2[0] == 42)
;
case 43: return (t2[0] == 43)
;
case 44: return (t2[0] == 44)
;
case 45: return (t2[0] == 45)
;
case 46: return (t2[0] == 46)
;
case 47: return (t2[0] == 47)
;
case 48: return (t2[0] == 48)
;
case 49: return (t2[0] == 49)
;
case 50: return (t2[0] == 50)
;
case 51: return (t2[0] == 51)
;
}
}
yyPrint_Op(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("a_conditional");
yyNoArgs();
break;
case 2: 
yyTerm("a_select");
yyNoArgs();
break;
case 3: 
yyTerm("a_deref_and_select");
yyNoArgs();
break;
case 4: 
yyTerm("a_subscript");
yyNoArgs();
break;
case 5: 
yyTerm("a_function_call");
yyNoArgs();
break;
case 6: 
yyTerm("a_plus");
yyNoArgs();
break;
case 7: 
yyTerm("a_minus");
yyNoArgs();
break;
case 8: 
yyTerm("a_mult");
yyNoArgs();
break;
case 9: 
yyTerm("a_div");
yyNoArgs();
break;
case 10: 
yyTerm("a_mod");
yyNoArgs();
break;
case 11: 
yyTerm("a_lshift");
yyNoArgs();
break;
case 12: 
yyTerm("a_rshift");
yyNoArgs();
break;
case 13: 
yyTerm("a_ne");
yyNoArgs();
break;
case 14: 
yyTerm("a_lt");
yyNoArgs();
break;
case 15: 
yyTerm("a_le");
yyNoArgs();
break;
case 16: 
yyTerm("a_gt");
yyNoArgs();
break;
case 17: 
yyTerm("a_ge");
yyNoArgs();
break;
case 18: 
yyTerm("a_or");
yyNoArgs();
break;
case 19: 
yyTerm("a_xor");
yyNoArgs();
break;
case 20: 
yyTerm("a_eq");
yyNoArgs();
break;
case 21: 
yyTerm("a_and");
yyNoArgs();
break;
case 22: 
yyTerm("a_orelse");
yyNoArgs();
break;
case 23: 
yyTerm("a_andthen");
yyNoArgs();
break;
case 24: 
yyTerm("a_asop");
yyNoArgs();
break;
case 25: 
yyTerm("a_and_asop");
yyNoArgs();
break;
case 26: 
yyTerm("a_xor_asop");
yyNoArgs();
break;
case 27: 
yyTerm("a_or_asop");
yyNoArgs();
break;
case 28: 
yyTerm("a_mult_asop");
yyNoArgs();
break;
case 29: 
yyTerm("a_div_asop");
yyNoArgs();
break;
case 30: 
yyTerm("a_mod_asop");
yyNoArgs();
break;
case 31: 
yyTerm("a_plus_asop");
yyNoArgs();
break;
case 32: 
yyTerm("a_minus_asop");
yyNoArgs();
break;
case 33: 
yyTerm("a_lshift_asop");
yyNoArgs();
break;
case 34: 
yyTerm("a_rshift_asop");
yyNoArgs();
break;
case 35: 
yyTerm("a_cm");
yyNoArgs();
break;
case 36: 
yyTerm("a_cast");
yyNoArgs();
break;
case 37: 
yyTerm("a_post_plusplus");
yyNoArgs();
break;
case 38: 
yyTerm("a_post_minusminus");
yyNoArgs();
break;
case 39: 
yyTerm("a_pre_plusplus");
yyNoArgs();
break;
case 40: 
yyTerm("a_pre_minusminus");
yyNoArgs();
break;
case 41: 
yyTerm("a_address");
yyNoArgs();
break;
case 42: 
yyTerm("a_unary_plus");
yyNoArgs();
break;
case 43: 
yyTerm("a_unary_minus");
yyNoArgs();
break;
case 44: 
yyTerm("a_not");
yyNoArgs();
break;
case 45: 
yyTerm("a_deref");
yyNoArgs();
break;
case 46: 
yyTerm("a_complement");
yyNoArgs();
break;
case 47: 
yyTerm("a_sizeof");
yyNoArgs();
break;
case 48: 
yyTerm("a_offsetof");
yyNoArgs();
break;
case 49: 
yyTerm("a_alignof");
yyNoArgs();
break;
case 50: 
yyTerm("a_gcc_extension");
yyNoArgs();
break;
case 51: 
yyTerm("a_builtin_va_arg");
yyNoArgs();
break;
}
}
yybroadcast_Op(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Op, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
*Out = A;
break;
case 3: 
*Out = A;
break;
case 4: 
*Out = A;
break;
case 5: 
*Out = A;
break;
case 6: 
*Out = A;
break;
case 7: 
*Out = A;
break;
case 8: 
*Out = A;
break;
case 9: 
*Out = A;
break;
case 10: 
*Out = A;
break;
case 11: 
*Out = A;
break;
case 12: 
*Out = A;
break;
case 13: 
*Out = A;
break;
case 14: 
*Out = A;
break;
case 15: 
*Out = A;
break;
case 16: 
*Out = A;
break;
case 17: 
*Out = A;
break;
case 18: 
*Out = A;
break;
case 19: 
*Out = A;
break;
case 20: 
*Out = A;
break;
case 21: 
*Out = A;
break;
case 22: 
*Out = A;
break;
case 23: 
*Out = A;
break;
case 24: 
*Out = A;
break;
case 25: 
*Out = A;
break;
case 26: 
*Out = A;
break;
case 27: 
*Out = A;
break;
case 28: 
*Out = A;
break;
case 29: 
*Out = A;
break;
case 30: 
*Out = A;
break;
case 31: 
*Out = A;
break;
case 32: 
*Out = A;
break;
case 33: 
*Out = A;
break;
case 34: 
*Out = A;
break;
case 35: 
*Out = A;
break;
case 36: 
*Out = A;
break;
case 37: 
*Out = A;
break;
case 38: 
*Out = A;
break;
case 39: 
*Out = A;
break;
case 40: 
*Out = A;
break;
case 41: 
*Out = A;
break;
case 42: 
*Out = A;
break;
case 43: 
*Out = A;
break;
case 44: 
*Out = A;
break;
case 45: 
*Out = A;
break;
case 46: 
*Out = A;
break;
case 47: 
*Out = A;
break;
case 48: 
*Out = A;
break;
case 49: 
*Out = A;
break;
case 50: 
*Out = A;
break;
case 51: 
*Out = A;
break;
}
}
}
yyeq_ArgList(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_E((yy)t1[1], (yy)t2[1])
&& yyeq_ArgList((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_ArgList(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("arg_list_nil");
yyNoArgs();
break;
case 2: 
yyTerm("arg_list");
yyFirstArg();
yyPrint_E((yy)t[1]);
yyNextArg();
yyPrint_ArgList((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_ArgList(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ArgList, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_E((yy)t[1], A, &B, Handler);
yybroadcast_ArgList((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_StClass(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
;
case 3: return (t2[0] == 3)
;
case 4: return (t2[0] == 4)
;
case 5: return (t2[0] == 5)
;
case 6: return (t2[0] == 6)
;
}
}
yyPrint_StClass(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("scl_auto");
yyNoArgs();
break;
case 2: 
yyTerm("scl_register");
yyNoArgs();
break;
case 3: 
yyTerm("scl_extern");
yyNoArgs();
break;
case 4: 
yyTerm("scl_static");
yyNoArgs();
break;
case 5: 
yyTerm("scl_typedef");
yyNoArgs();
break;
case 6: 
yyTerm("scl_stclass_nil");
yyNoArgs();
break;
}
}
yybroadcast_StClass(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_StClass, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
*Out = A;
break;
case 3: 
*Out = A;
break;
case 4: 
*Out = A;
break;
case 5: 
*Out = A;
break;
case 6: 
*Out = A;
break;
}
}
}
yyeq_IdOpt(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 2: return (t2[0] == 2)
;
}
}
yyPrint_IdOpt(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("a_id");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 2: 
yyTerm("a_id_nil");
yyNoArgs();
break;
}
}
yybroadcast_IdOpt(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_IdOpt, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 2: 
*Out = A;
break;
}
}
}
yyeq_Float(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_Float(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_Float(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Float, t, In, Out)) {
*Out = In;}
}
yyeq_Ident(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_Ident(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_Ident(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Ident, t, In, Out)) {
*Out = In;}
}
