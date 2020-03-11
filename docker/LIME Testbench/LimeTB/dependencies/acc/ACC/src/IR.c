typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"IR", l);
}
yyeq_INSTR(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
;
case 2: return (t2[0] == 2)
;
case 3: return (t2[0] == 3)
&& yyeq_INSTR((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
;
case 4: return (t2[0] == 4)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
&& yyeq_INSTR((yy)t1[4], (yy)t2[4])
&& yyeq_AMode((yy)t1[5], (yy)t2[5])
&& yyeq_Label((yy)t1[6], (yy)t2[6])
&& yyeq_Label((yy)t1[7], (yy)t2[7])
;
case 5: return (t2[0] == 5)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
&& yyeq_AMode((yy)t1[3], (yy)t2[3])
&& yyeq_Label((yy)t1[4], (yy)t2[4])
&& yyeq_Label((yy)t1[5], (yy)t2[5])
;
case 6: return (t2[0] == 6)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
&& yyeq_AMode((yy)t1[3], (yy)t2[3])
&& yyeq_Label((yy)t1[4], (yy)t2[4])
&& yyeq_Label((yy)t1[5], (yy)t2[5])
;
case 7: return (t2[0] == 7)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
&& yyeq_AMode((yy)t1[3], (yy)t2[3])
;
case 8: return (t2[0] == 8)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_INSTR((yy)t1[2], (yy)t2[2])
&& yyeq_INSTR((yy)t1[3], (yy)t2[3])
&& yyeq_AMode((yy)t1[4], (yy)t2[4])
;
case 9: return (t2[0] == 9)
&& yyeq_Label((yy)t1[1], (yy)t2[1])
;
case 10: return (t2[0] == 10)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
;
case 11: return (t2[0] == 11)
&& yyeq_Label((yy)t1[1], (yy)t2[1])
;
case 12: return (t2[0] == 12)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_AMode((yy)t1[2], (yy)t2[2])
&& yyeq_CaseList((yy)t1[3], (yy)t2[3])
&& yyeq_Label((yy)t1[4], (yy)t2[4])
&& yyeq_Label((yy)t1[5], (yy)t2[5])
&& yyeq_INSTR((yy)t1[6], (yy)t2[6])
;
case 13: return (t2[0] == 13)
;
case 14: return (t2[0] == 14)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_AMode((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_INSTR(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("x_function");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyEndArgs();
break;
case 2: 
yyTerm("x_null");
yyNoArgs();
break;
case 3: 
yyTerm("x_seq");
yyFirstArg();
yyPrint_INSTR((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyEndArgs();
break;
case 4: 
yyTerm("x_for");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyNextArg();
yyPrint_INSTR((yy)t[4]);
yyNextArg();
yyPrint_AMode((yy)t[5]);
yyNextArg();
yyPrint_Label((yy)t[6]);
yyNextArg();
yyPrint_Label((yy)t[7]);
yyEndArgs();
break;
case 5: 
yyTerm("x_do");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyNextArg();
yyPrint_AMode((yy)t[3]);
yyNextArg();
yyPrint_Label((yy)t[4]);
yyNextArg();
yyPrint_Label((yy)t[5]);
yyEndArgs();
break;
case 6: 
yyTerm("x_while");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyNextArg();
yyPrint_AMode((yy)t[3]);
yyNextArg();
yyPrint_Label((yy)t[4]);
yyNextArg();
yyPrint_Label((yy)t[5]);
yyEndArgs();
break;
case 7: 
yyTerm("x_if");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyNextArg();
yyPrint_AMode((yy)t[3]);
yyEndArgs();
break;
case 8: 
yyTerm("x_if_else");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_INSTR((yy)t[2]);
yyNextArg();
yyPrint_INSTR((yy)t[3]);
yyNextArg();
yyPrint_AMode((yy)t[4]);
yyEndArgs();
break;
case 9: 
yyTerm("x_goto");
yyFirstArg();
yyPrint_Label((yy)t[1]);
yyEndArgs();
break;
case 10: 
yyTerm("x_void");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyEndArgs();
break;
case 11: 
yyTerm("x_label");
yyFirstArg();
yyPrint_Label((yy)t[1]);
yyEndArgs();
break;
case 12: 
yyTerm("x_switch");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_AMode((yy)t[2]);
yyNextArg();
yyPrint_CaseList((yy)t[3]);
yyNextArg();
yyPrint_Label((yy)t[4]);
yyNextArg();
yyPrint_Label((yy)t[5]);
yyNextArg();
yyPrint_INSTR((yy)t[6]);
yyEndArgs();
break;
case 13: 
yyTerm("x_return");
yyNoArgs();
break;
case 14: 
yyTerm("x_returnval");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_AMode((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_INSTR(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_INSTR, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 2: 
*Out = A;
break;
case 3: 
yybroadcast_INSTR((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 4: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
yybroadcast_INSTR((yy)t[4], B, &A, Handler);
yybroadcast_AMode((yy)t[5], A, &B, Handler);
yybroadcast_Label((yy)t[6], B, &A, Handler);
yybroadcast_Label((yy)t[7], A, &B, Handler);
*Out = B;
break;
case 5: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
yybroadcast_AMode((yy)t[3], A, &B, Handler);
yybroadcast_Label((yy)t[4], B, &A, Handler);
yybroadcast_Label((yy)t[5], A, &B, Handler);
*Out = B;
break;
case 6: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
yybroadcast_AMode((yy)t[3], A, &B, Handler);
yybroadcast_Label((yy)t[4], B, &A, Handler);
yybroadcast_Label((yy)t[5], A, &B, Handler);
*Out = B;
break;
case 7: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
yybroadcast_AMode((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 8: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_INSTR((yy)t[2], B, &A, Handler);
yybroadcast_INSTR((yy)t[3], A, &B, Handler);
yybroadcast_AMode((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 9: 
yybroadcast_Label((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 10: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 11: 
yybroadcast_Label((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 12: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_AMode((yy)t[2], B, &A, Handler);
yybroadcast_CaseList((yy)t[3], A, &B, Handler);
yybroadcast_Label((yy)t[4], B, &A, Handler);
yybroadcast_Label((yy)t[5], A, &B, Handler);
yybroadcast_INSTR((yy)t[6], B, &A, Handler);
*Out = A;
break;
case 13: 
*Out = A;
break;
case 14: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_AMode((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_IR(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_Label((yy)t1[3], (yy)t2[3])
;
case 2: return (t2[0] == 2)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_Label((yy)t1[3], (yy)t2[3])
;
case 3: return (t2[0] == 3)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
;
case 4: return (t2[0] == 4)
&& yyeq_Label((yy)t1[1], (yy)t2[1])
;
case 5: return (t2[0] == 5)
&& yyeq_Label((yy)t1[1], (yy)t2[1])
;
case 6: return (t2[0] == 6)
;
case 7: return (t2[0] == 7)
;
case 8: return (t2[0] == 8)
&& yyeq_LSTRING((yy)t1[1], (yy)t2[1])
;
case 9: return (t2[0] == 9)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& (t1[2] == t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
&& yyeq_IR((yy)t1[4], (yy)t2[4])
;
case 10: return (t2[0] == 10)
;
case 11: return (t2[0] == 11)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 12: return (t2[0] == 12)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 13: return (t2[0] == 13)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 14: return (t2[0] == 14)
&& yyeq_ObjNr((yy)t1[1], (yy)t2[1])
;
case 15: return (t2[0] == 15)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 16: return (t2[0] == 16)
&& yyeq_ObjNr((yy)t1[1], (yy)t2[1])
;
case 17: return (t2[0] == 17)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 18: return (t2[0] == 18)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_AMode((yy)t1[2], (yy)t2[2])
&& yyeq_CaseList((yy)t1[3], (yy)t2[3])
&& yyeq_Label((yy)t1[4], (yy)t2[4])
;
case 19: return (t2[0] == 19)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 20: return (t2[0] == 20)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_Float((yy)t1[2], (yy)t2[2])
;
case 21: return (t2[0] == 21)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& (t1[2] == t2[2])
;
case 22: return (t2[0] == 22)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 23: return (t2[0] == 23)
&& (t1[1] == t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 24: return (t2[0] == 24)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 25: return (t2[0] == 25)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 26: return (t2[0] == 26)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 27: return (t2[0] == 27)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 28: return (t2[0] == 28)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 29: return (t2[0] == 29)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 30: return (t2[0] == 30)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 31: return (t2[0] == 31)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 32: return (t2[0] == 32)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 33: return (t2[0] == 33)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 34: return (t2[0] == 34)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 35: return (t2[0] == 35)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 36: return (t2[0] == 36)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 37: return (t2[0] == 37)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 38: return (t2[0] == 38)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 39: return (t2[0] == 39)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 40: return (t2[0] == 40)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 41: return (t2[0] == 41)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 42: return (t2[0] == 42)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 43: return (t2[0] == 43)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 44: return (t2[0] == 44)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 45: return (t2[0] == 45)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 46: return (t2[0] == 46)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
&& yyeq_IR((yy)t1[4], (yy)t2[4])
;
case 47: return (t2[0] == 47)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 48: return (t2[0] == 48)
;
case 49: return (t2[0] == 49)
&& yyeq_ObjNr((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 50: return (t2[0] == 50)
&& yyeq_ObjNr((yy)t1[1], (yy)t2[1])
;
case 51: return (t2[0] == 51)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_ObjNr((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
case 52: return (t2[0] == 52)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_ObjNr((yy)t1[2], (yy)t2[2])
;
case 53: return (t2[0] == 53)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_IR((yy)t1[2], (yy)t2[2])
;
case 54: return (t2[0] == 54)
&& (t1[1] == t2[1])
;
case 55: return (t2[0] == 55)
&& yyeq_AMode((yy)t1[1], (yy)t2[1])
&& yyeq_AMode((yy)t1[2], (yy)t2[2])
&& yyeq_IR((yy)t1[3], (yy)t2[3])
;
}
}
yyPrint_IR(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("ir_jump_on_true");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_Label((yy)t[3]);
yyEndArgs();
break;
case 2: 
yyTerm("ir_jump_on_false");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_Label((yy)t[3]);
yyEndArgs();
break;
case 3: 
yyTerm("ir_make_void");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyEndArgs();
break;
case 4: 
yyTerm("ir_goto");
yyFirstArg();
yyPrint_Label((yy)t[1]);
yyEndArgs();
break;
case 5: 
yyTerm("ir_label");
yyFirstArg();
yyPrint_Label((yy)t[1]);
yyEndArgs();
break;
case 6: 
yyTerm("ir_no_expr");
yyNoArgs();
break;
case 7: 
yyTerm("ir_nil");
yyNoArgs();
break;
case 8: 
yyTerm("ir_string");
yyFirstArg();
yyPrint_LSTRING((yy)t[1]);
yyEndArgs();
break;
case 9: 
yyTerm("ir_call");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_INT((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyNextArg();
yyPrint_IR((yy)t[4]);
yyEndArgs();
break;
case 10: 
yyTerm("ir_param_list_nil");
yyNoArgs();
break;
case 11: 
yyTerm("ir_param_list");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 12: 
yyTerm("ir_adr_plus");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 13: 
yyTerm("ir_adr_minus");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 14: 
yyTerm("ir_use_auto");
yyFirstArg();
yyPrint_ObjNr((yy)t[1]);
yyEndArgs();
break;
case 15: 
yyTerm("ir_use_static");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 16: 
yyTerm("ir_use_param");
yyFirstArg();
yyPrint_ObjNr((yy)t[1]);
yyEndArgs();
break;
case 17: 
yyTerm("ir_use_function");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 18: 
yyTerm("ir_switch");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_AMode((yy)t[2]);
yyNextArg();
yyPrint_CaseList((yy)t[3]);
yyNextArg();
yyPrint_Label((yy)t[4]);
yyEndArgs();
break;
case 19: 
yyTerm("ir_unary_minus");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 20: 
yyTerm("ir_float_const");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_Float((yy)t[2]);
yyEndArgs();
break;
case 21: 
yyTerm("ir_int_const");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_INT((yy)t[2]);
yyEndArgs();
break;
case 22: 
yyTerm("ir_cont");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 23: 
yyTerm("ir_byteblock_cont");
yyFirstArg();
yyPrint_INT((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 24: 
yyTerm("ir_not");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 25: 
yyTerm("ir_complement");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 26: 
yyTerm("ir_orelse");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 27: 
yyTerm("ir_andthen");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 28: 
yyTerm("ir_lshift");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 29: 
yyTerm("ir_rshift");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 30: 
yyTerm("ir_and");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 31: 
yyTerm("ir_or");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 32: 
yyTerm("ir_xor");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 33: 
yyTerm("ir_eq");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 34: 
yyTerm("ir_ne");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 35: 
yyTerm("ir_le");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 36: 
yyTerm("ir_lt");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 37: 
yyTerm("ir_ge");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 38: 
yyTerm("ir_gt");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 39: 
yyTerm("ir_mod");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 40: 
yyTerm("ir_plus");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 41: 
yyTerm("ir_minus");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 42: 
yyTerm("ir_mult");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 43: 
yyTerm("ir_div");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 44: 
yyTerm("ir_assign");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 45: 
yyTerm("ir_cm");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 46: 
yyTerm("ir_conditional");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyNextArg();
yyPrint_IR((yy)t[4]);
yyEndArgs();
break;
case 47: 
yyTerm("ir_return");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 48: 
yyTerm("ir_return_noval");
yyNoArgs();
break;
case 49: 
yyTerm("ir_assign_address_tempo");
yyFirstArg();
yyPrint_ObjNr((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 50: 
yyTerm("ir_use_address_tempo");
yyFirstArg();
yyPrint_ObjNr((yy)t[1]);
yyEndArgs();
break;
case 51: 
yyTerm("ir_assign_tempo");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_ObjNr((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
case 52: 
yyTerm("ir_use_tempo");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_ObjNr((yy)t[2]);
yyEndArgs();
break;
case 53: 
yyTerm("ir_braces");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_IR((yy)t[2]);
yyEndArgs();
break;
case 54: 
yyTerm("ir_offset");
yyFirstArg();
yyPrint_INT((yy)t[1]);
yyEndArgs();
break;
case 55: 
yyTerm("ir_convert");
yyFirstArg();
yyPrint_AMode((yy)t[1]);
yyNextArg();
yyPrint_AMode((yy)t[2]);
yyNextArg();
yyPrint_IR((yy)t[3]);
yyEndArgs();
break;
}
}
yybroadcast_IR(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_IR, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_Label((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 2: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_Label((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 3: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 4: 
yybroadcast_Label((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 5: 
yybroadcast_Label((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 6: 
*Out = A;
break;
case 7: 
*Out = A;
break;
case 8: 
yybroadcast_LSTRING((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 9: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[3], B, &A, Handler);
yybroadcast_IR((yy)t[4], A, &B, Handler);
*Out = B;
break;
case 10: 
*Out = A;
break;
case 11: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 12: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 13: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 14: 
yybroadcast_ObjNr((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 15: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 16: 
yybroadcast_ObjNr((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 17: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 18: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_AMode((yy)t[2], B, &A, Handler);
yybroadcast_CaseList((yy)t[3], A, &B, Handler);
yybroadcast_Label((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 19: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 20: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_Float((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 21: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 22: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 23: 
yybroadcast_IR((yy)t[2], A, &B, Handler);
*Out = B;
break;
case 24: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 25: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 26: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 27: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 28: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 29: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 30: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 31: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 32: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 33: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 34: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 35: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 36: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 37: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 38: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 39: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 40: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 41: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 42: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 43: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 44: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 45: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 46: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
yybroadcast_IR((yy)t[4], B, &A, Handler);
*Out = A;
break;
case 47: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 48: 
*Out = A;
break;
case 49: 
yybroadcast_ObjNr((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 50: 
yybroadcast_ObjNr((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 51: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_ObjNr((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
case 52: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_ObjNr((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 53: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_IR((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 54: 
*Out = A;
break;
case 55: 
yybroadcast_AMode((yy)t[1], A, &B, Handler);
yybroadcast_AMode((yy)t[2], B, &A, Handler);
yybroadcast_IR((yy)t[3], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_CaseList(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Case((yy)t1[1], (yy)t2[1])
&& yyeq_CaseList((yy)t1[2], (yy)t2[2])
;
case 2: return (t2[0] == 2)
;
}
}
yyPrint_CaseList(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("case_list");
yyFirstArg();
yyPrint_Case((yy)t[1]);
yyNextArg();
yyPrint_CaseList((yy)t[2]);
yyEndArgs();
break;
case 2: 
yyTerm("case_list_nil");
yyNoArgs();
break;
}
}
yybroadcast_CaseList(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_CaseList, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Case((yy)t[1], A, &B, Handler);
yybroadcast_CaseList((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 2: 
*Out = A;
break;
}
}
}
yyeq_Case(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_IR((yy)t1[1], (yy)t2[1])
&& yyeq_Label((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_Case(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("case");
yyFirstArg();
yyPrint_IR((yy)t[1]);
yyNextArg();
yyPrint_Label((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_Case(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Case, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_IR((yy)t[1], A, &B, Handler);
yybroadcast_Label((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_Label(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_Label(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_Label(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Label, t, In, Out)) {
*Out = In;}
}
