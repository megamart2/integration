typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Scanning", l);
}
yyeq_OpaqueIdClass(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_OpaqueIdClass(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_OpaqueIdClass(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_OpaqueIdClass, t, In, Out)) {
*Out = In;}
}
yyeq_IdClass(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
;
case 3: return (t2[0] == 3)
;
}
}
yyPrint_IdClass(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("cl_enum");
yyNoArgs();
break;
case 2: 
yyTerm("cl_typedef");
yyNoArgs();
break;
case 3: 
yyTerm("cl_identifier");
yyNoArgs();
break;
}
}
yybroadcast_IdClass(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_IdClass, t, In, Out)) {
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
}
}
}
yyeq_PatchStack(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_PatchList((yy)t1[1], (yy)t2[1])
&& yyeq_PatchStack((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_PatchStack(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("patch_stack_nil");
yyNoArgs();
break;
case 2: 
yyTerm("patch_stack");
yyFirstArg();
yyPrint_PatchList((yy)t[1]);
yyNextArg();
yyPrint_PatchStack((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_PatchStack(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_PatchStack, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_PatchList((yy)t[1], A, &B, Handler);
yybroadcast_PatchStack((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_PatchList(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_OpaqueIdClass((yy)t1[2], (yy)t2[2])
&& yyeq_PatchList((yy)t1[3], (yy)t2[3])
;
}
}
yyPrint_PatchList(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("empty_patch_list");
yyNoArgs();
break;
case 2: 
yyTerm("patch_list");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_OpaqueIdClass((yy)t[2]);
yyNextArg();
yyPrint_PatchList((yy)t[3]);
yyEndArgs();
break;
}
}
yybroadcast_PatchList(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_PatchList, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_OpaqueIdClass((yy)t[2], B, &A, Handler);
yybroadcast_PatchList((yy)t[3], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_LSTRING(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_LSTRING(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_LSTRING(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_LSTRING, t, In, Out)) {
*Out = In;}
}
yy yyglov_Var_PatchStack = (yy) yyu;
patch_symbol_class(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Ident;
yy yy_0_1;
yy yy_0_2;
yy yyv_L;
yy yy_1_1;
yy yy_2_1;
yy yyv_OpaqueClass;
yy yy_2_2;
yy yy_3_1;
yy yy_3_1_1;
yy yy_3_1_2;
yy yy_3_1_3;
yy yy_4_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Ident = yy_0_1;
if (yy_0_2[0] != 1) goto yyfl_10_1;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
get_this_patch_list(&yy_1_1);
yyv_L = yy_1_1;
yy_2_1 = yyv_Ident;
get_symbol_class(yy_2_1, &yy_2_2);
yyv_OpaqueClass = yy_2_2;
yy_3_1_1 = yyv_Ident;
yy_3_1_2 = yyv_OpaqueClass;
yy_3_1_3 = yyv_L;
yy_3_1 = yyb + 0;
yy_3_1[0] = 2;
yy_3_1[1] = ((long)yy_3_1_1);
yy_3_1[2] = ((long)yy_3_1_2);
yy_3_1[3] = ((long)yy_3_1_3);
put_this_patch_list(yy_3_1);
yy_4_1 = yyv_Ident;
set_enum(yy_4_1);
return;
yyfl_10_1 : ;
}
{
yy yyb;
yy yyv_Ident;
yy yy_0_1;
yy yy_0_2;
yy yyv_L;
yy yy_1_1;
yy yy_2_1;
yy yyv_OpaqueClass;
yy yy_2_2;
yy yy_3_1;
yy yy_3_1_1;
yy yy_3_1_2;
yy yy_3_1_3;
yy yy_4_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Ident = yy_0_1;
if (yy_0_2[0] != 2) goto yyfl_10_2;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
get_this_patch_list(&yy_1_1);
yyv_L = yy_1_1;
yy_2_1 = yyv_Ident;
get_symbol_class(yy_2_1, &yy_2_2);
yyv_OpaqueClass = yy_2_2;
yy_3_1_1 = yyv_Ident;
yy_3_1_2 = yyv_OpaqueClass;
yy_3_1_3 = yyv_L;
yy_3_1 = yyb + 0;
yy_3_1[0] = 2;
yy_3_1[1] = ((long)yy_3_1_1);
yy_3_1[2] = ((long)yy_3_1_2);
yy_3_1[3] = ((long)yy_3_1_3);
put_this_patch_list(yy_3_1);
yy_4_1 = yyv_Ident;
set_typedef(yy_4_1);
return;
yyfl_10_2 : ;
}
{
yy yyb;
yy yyv_Ident;
yy yy_0_1;
yy yy_0_2;
yy yyv_L;
yy yy_1_1;
yy yy_2_1;
yy yyv_OpaqueClass;
yy yy_2_2;
yy yy_3_1;
yy yy_3_1_1;
yy yy_3_1_2;
yy yy_3_1_3;
yy yy_4_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Ident = yy_0_1;
if (yy_0_2[0] != 3) goto yyfl_10_3;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
get_this_patch_list(&yy_1_1);
yyv_L = yy_1_1;
yy_2_1 = yyv_Ident;
get_symbol_class(yy_2_1, &yy_2_2);
yyv_OpaqueClass = yy_2_2;
yy_3_1_1 = yyv_Ident;
yy_3_1_2 = yyv_OpaqueClass;
yy_3_1_3 = yyv_L;
yy_3_1 = yyb + 0;
yy_3_1[0] = 2;
yy_3_1[1] = ((long)yy_3_1_1);
yy_3_1[2] = ((long)yy_3_1_2);
yy_3_1[3] = ((long)yy_3_1_3);
put_this_patch_list(yy_3_1);
yy_4_1 = yyv_Ident;
set_identifier(yy_4_1);
return;
yyfl_10_3 : ;
}
yyErr(2,86);
}
init_patch_stack()
{
{
yy yyb;
yy yy_1_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyb + 0;
yy_1_1[0] = 1;
PUTVarPatchStack(yy_1_1);
return;
}
}
enter_patch_scope()
{
{
yy yyb;
yy yyv_S;
yy yy_1_1;
yy yy_2_1;
yy yy_2_1_1;
yy yy_2_1_2;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
GETVarPatchStack(&yy_1_1);
yyv_S = yy_1_1;
yy_2_1_1 = yyb + 3;
yy_2_1_1[0] = 1;
yy_2_1_2 = yyv_S;
yy_2_1 = yyb + 0;
yy_2_1[0] = 2;
yy_2_1[1] = ((long)yy_2_1_1);
yy_2_1[2] = ((long)yy_2_1_2);
PUTVarPatchStack(yy_2_1);
return;
}
}
leave_patch_scope()
{
{
yy yyb;
yy yy_1_1;
yy yyv_L;
yy yy_1_1_1;
yy yyv_S;
yy yy_1_1_2;
yy yy_2_1;
yy yy_3_1;
GETVarPatchStack(&yy_1_1);
if (yy_1_1[0] != 2) goto yyfl_13_1;
yy_1_1_1 = ((yy)yy_1_1[1]);
yy_1_1_2 = ((yy)yy_1_1[2]);
yyv_L = yy_1_1_1;
yyv_S = yy_1_1_2;
yy_2_1 = yyv_L;
reset_patches(yy_2_1);
yy_3_1 = yyv_S;
PUTVarPatchStack(yy_3_1);
return;
yyfl_13_1 : ;
}
yyErr(2,127);
}
int equal_Ident(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_X;
yy yy_0_1;
yy yyv_Y;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_X = yy_0_1;
yyv_Y = yy_0_2;
yy_1_1 = yyv_X;
yy_1_2 = yyv_Y;
if (! yyeq_Ident(yy_1_1, yy_1_2)) goto yyfl_15_1;
return 1;
yyfl_15_1 : ;
}
return 0;
}
reset_patches(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_20_1;
return;
yyfl_20_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_OClass;
yy yy_0_1_2;
yy yyv_L;
yy yy_0_1_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_20_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Ident = yy_0_1_1;
yyv_OClass = yy_0_1_2;
yyv_L = yy_0_1_3;
yy_1_1 = yyv_Ident;
yy_1_2 = yyv_OClass;
set_symbol_class(yy_1_1, yy_1_2);
yy_2_1 = yyv_L;
reset_patches(yy_2_1);
return;
yyfl_20_2 : ;
}
yyErr(2,158);
}
get_this_patch_list(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yyv_L;
yy yy_1_1_1;
yy yyv_S;
yy yy_1_1_2;
GETVarPatchStack(&yy_1_1);
if (yy_1_1[0] != 2) goto yyfl_21_1;
yy_1_1_1 = ((yy)yy_1_1[1]);
yy_1_1_2 = ((yy)yy_1_1[2]);
yyv_L = yy_1_1_1;
yyv_S = yy_1_1_2;
yy_0_1 = yyv_L;
*yyout_1 = yy_0_1;
return;
yyfl_21_1 : ;
}
yyErr(2,168);
}
put_this_patch_list(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_L;
yy yy_0_1;
yy yy_1_1;
yy yyv_L1;
yy yy_1_1_1;
yy yyv_S;
yy yy_1_1_2;
yy yy_2_1;
yy yy_2_1_1;
yy yy_2_1_2;
yy_0_1 = yyin_1;
yyv_L = yy_0_1;
yyb = yyh;
yyh += 3; if (yyh > yyhx) yyExtend();
GETVarPatchStack(&yy_1_1);
if (yy_1_1[0] != 2) goto yyfl_22_1;
yy_1_1_1 = ((yy)yy_1_1[1]);
yy_1_1_2 = ((yy)yy_1_1[2]);
yyv_L1 = yy_1_1_1;
yyv_S = yy_1_1_2;
yy_2_1_1 = yyv_L;
yy_2_1_2 = yyv_S;
yy_2_1 = yyb + 0;
yy_2_1[0] = 2;
yy_2_1[1] = ((long)yy_2_1_1);
yy_2_1[2] = ((long)yy_2_1_2);
PUTVarPatchStack(yy_2_1);
return;
yyfl_22_1 : ;
}
yyErr(2,176);
}
PUTVarPatchStack(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_X;
yy yy_0_1;
yy yy_1;
yy_0_1 = yyin_1;
yyv_X = yy_0_1;
yy_1 = yyv_X;
yyglov_Var_PatchStack = yy_1;
return;
}
}
GETVarPatchStack(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_1;
yy_1 = yyglov_Var_PatchStack;
if (yy_1 == (yy) yyu) yyErr(1,200);
yyv_X = yy_1;
yy_0_1 = yyv_X;
*yyout_1 = yy_0_1;
return;
}
}
