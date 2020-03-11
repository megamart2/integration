typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"DefTab", l);
}
yyeq_Object(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& (t1[2] == t2[2])
&& yyeq_ObjDescr((yy)t1[3], (yy)t2[3])
&& yyeq_Object((yy)t1[4], (yy)t2[4])
;
}
}
yyPrint_Object(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("obj_nil");
yyNoArgs();
break;
case 2: 
yyTerm("obj");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_INT((yy)t[2]);
yyNextArg();
yyPrint_ObjDescr((yy)t[3]);
yyNextArg();
yyPrint_Object((yy)t[4]);
yyEndArgs();
break;
}
}
yybroadcast_Object(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Object, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
yybroadcast_ObjDescr((yy)t[3], B, &A, Handler);
yybroadcast_Object((yy)t[4], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_ObjDescr(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
&& yyeq_NStClass((yy)t1[2], (yy)t2[2])
&& yyeq_Linkage((yy)t1[3], (yy)t2[3])
&& yyeq_Ident((yy)t1[4], (yy)t2[4])
;
case 2: return (t2[0] == 2)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
&& yyeq_NStClass((yy)t1[2], (yy)t2[2])
&& yyeq_ObjNr((yy)t1[3], (yy)t2[3])
;
case 3: return (t2[0] == 3)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
&& yyeq_NStClass((yy)t1[2], (yy)t2[2])
&& yyeq_ObjNr((yy)t1[3], (yy)t2[3])
;
case 4: return (t2[0] == 4)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
&& yyeq_Linkage((yy)t1[2], (yy)t2[2])
&& yyeq_Ident((yy)t1[3], (yy)t2[3])
;
case 5: return (t2[0] == 5)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
;
case 6: return (t2[0] == 6)
&& (t1[1] == t2[1])
;
case 7: return (t2[0] == 7)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
;
case 8: return (t2[0] == 8)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
;
case 9: return (t2[0] == 9)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
;
case 10: return (t2[0] == 10)
&& yyeq_TpDescr((yy)t1[1], (yy)t2[1])
;
}
}
yyPrint_ObjDescr(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("objdescr_static_var");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyNextArg();
yyPrint_NStClass((yy)t[2]);
yyNextArg();
yyPrint_Linkage((yy)t[3]);
yyNextArg();
yyPrint_Ident((yy)t[4]);
yyEndArgs();
break;
case 2: 
yyTerm("objdescr_auto_var");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyNextArg();
yyPrint_NStClass((yy)t[2]);
yyNextArg();
yyPrint_ObjNr((yy)t[3]);
yyEndArgs();
break;
case 3: 
yyTerm("objdescr_param");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyNextArg();
yyPrint_NStClass((yy)t[2]);
yyNextArg();
yyPrint_ObjNr((yy)t[3]);
yyEndArgs();
break;
case 4: 
yyTerm("objdescr_function");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyNextArg();
yyPrint_Linkage((yy)t[2]);
yyNextArg();
yyPrint_Ident((yy)t[3]);
yyEndArgs();
break;
case 5: 
yyTerm("objdescr_typedefname");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyEndArgs();
break;
case 6: 
yyTerm("objdescr_enum_const");
yyFirstArg();
yyPrint_INT((yy)t[1]);
yyEndArgs();
break;
case 7: 
yyTerm("objdescr_enum_tag");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyEndArgs();
break;
case 8: 
yyTerm("objdescr_structure_tag");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyEndArgs();
break;
case 9: 
yyTerm("objdescr_union_tag");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyEndArgs();
break;
case 10: 
yyTerm("objdescr_smart2_domtag");
yyFirstArg();
yyPrint_TpDescr((yy)t[1]);
yyEndArgs();
break;
}
}
yybroadcast_ObjDescr(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ObjDescr, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_NStClass((yy)t[2], A, &B, Handler);
yybroadcast_Linkage((yy)t[3], B, &A, Handler);
yybroadcast_Ident((yy)t[4], A, &B, Handler);
*Out = B;
break;
case 2: 
yybroadcast_NStClass((yy)t[2], A, &B, Handler);
yybroadcast_ObjNr((yy)t[3], B, &A, Handler);
*Out = A;
break;
case 3: 
yybroadcast_NStClass((yy)t[2], A, &B, Handler);
yybroadcast_ObjNr((yy)t[3], B, &A, Handler);
*Out = A;
break;
case 4: 
yybroadcast_Linkage((yy)t[2], A, &B, Handler);
yybroadcast_Ident((yy)t[3], B, &A, Handler);
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
yybroadcast_TpDescr((yy)t[1], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_NStClass(t1, t2) yy t1, t2;
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
yyPrint_NStClass(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("nscl_auto");
yyNoArgs();
break;
case 2: 
yyTerm("nscl_register");
yyNoArgs();
break;
case 3: 
yyTerm("nscl_static");
yyNoArgs();
break;
}
}
yybroadcast_NStClass(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_NStClass, t, In, Out)) {
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
yyeq_Linkage(t1, t2) yy t1, t2;
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
}
}
yyPrint_Linkage(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("external");
yyNoArgs();
break;
case 2: 
yyTerm("internal");
yyNoArgs();
break;
case 3: 
yyTerm("none");
yyNoArgs();
break;
case 4: 
yyTerm("auto_external");
yyNoArgs();
break;
}
}
yybroadcast_Linkage(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Linkage, t, In, Out)) {
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
}
}
}
yyeq_ObjNr(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_ObjNr(t) yy t;
{
yyPrintOpaque(t);
}
yybroadcast_ObjNr(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ObjNr, t, In, Out)) {
*Out = In;}
}
yyeq_TagKind(t1, t2) yy t1, t2;
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
yyPrint_TagKind(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("struct");
yyNoArgs();
break;
case 2: 
yyTerm("union");
yyNoArgs();
break;
case 3: 
yyTerm("enum");
yyNoArgs();
break;
}
}
yybroadcast_TagKind(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_TagKind, t, In, Out)) {
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
yyeq_Nest(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_ObjectList((yy)t1[1], (yy)t2[1])
&& yyeq_ObjectList((yy)t1[2], (yy)t2[2])
&& (t1[3] == t2[3])
&& yyeq_Nest((yy)t1[4], (yy)t2[4])
;
case 2: return (t2[0] == 2)
;
}
}
yyPrint_Nest(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("nest_decls");
yyFirstArg();
yyPrint_ObjectList((yy)t[1]);
yyNextArg();
yyPrint_ObjectList((yy)t[2]);
yyNextArg();
yyPrint_INT((yy)t[3]);
yyNextArg();
yyPrint_Nest((yy)t[4]);
yyEndArgs();
break;
case 2: 
yyTerm("nest_nil");
yyNoArgs();
break;
}
}
yybroadcast_Nest(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Nest, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_ObjectList((yy)t[1], A, &B, Handler);
yybroadcast_ObjectList((yy)t[2], B, &A, Handler);
yybroadcast_Nest((yy)t[4], A, &B, Handler);
*Out = B;
break;
case 2: 
*Out = A;
break;
}
}
}
yyeq_ObjectList(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Object((yy)t1[1], (yy)t2[1])
&& yyeq_ObjectList((yy)t1[2], (yy)t2[2])
;
case 2: return (t2[0] == 2)
;
}
}
yyPrint_ObjectList(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("objlist");
yyFirstArg();
yyPrint_Object((yy)t[1]);
yyNextArg();
yyPrint_ObjectList((yy)t[2]);
yyEndArgs();
break;
case 2: 
yyTerm("objlist_nil");
yyNoArgs();
break;
}
}
yybroadcast_ObjectList(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ObjectList, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Object((yy)t[1], A, &B, Handler);
yybroadcast_ObjectList((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 2: 
*Out = A;
break;
}
}
}
yy yyglov_Var_NestLevel = (yy) yyu;
yy yyglov_Var_Nest = (yy) yyu;
yy yyglov_Var_DeclList = (yy) yyu;
yy yyglov_Var_TagList = (yy) yyu;
init_scope_stack()
{
{
yy yyb;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yyb = yyh;
yyh += 3; if (yyh > yyhx) yyExtend();
yy_1_1 = yyb + 0;
yy_1_1[0] = 2;
PUTVarNest(yy_1_1);
yy_2_1 = yyb + 1;
yy_2_1[0] = 2;
PUTVarDeclList(yy_2_1);
yy_3_1 = yyb + 2;
yy_3_1[0] = 2;
PUTVarTagList(yy_3_1);
return;
}
}
enter_scope()
{
{
yy yyb;
yy yyv_OldNest;
yy yy_1_1;
yy yyv_OldNestLevel;
yy yy_2_1;
yy yyv_OldDeclList;
yy yy_3_1;
yy yyv_OldTagList;
yy yy_4_1;
yy yy_5_1;
yy yy_5_1_1;
yy yy_5_1_2;
yy yy_5_1_3;
yy yy_5_1_4;
yy yy_6_1;
yy yy_7_1;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
GETVarNest(&yy_1_1);
yyv_OldNest = yy_1_1;
GETVarNestLevel(&yy_2_1);
yyv_OldNestLevel = yy_2_1;
GETVarDeclList(&yy_3_1);
yyv_OldDeclList = yy_3_1;
GETVarTagList(&yy_4_1);
yyv_OldTagList = yy_4_1;
yy_5_1_1 = yyv_OldDeclList;
yy_5_1_2 = yyv_OldTagList;
yy_5_1_3 = yyv_OldNestLevel;
yy_5_1_4 = yyv_OldNest;
yy_5_1 = yyb + 0;
yy_5_1[0] = 1;
yy_5_1[1] = ((long)yy_5_1_1);
yy_5_1[2] = ((long)yy_5_1_2);
yy_5_1[3] = ((long)yy_5_1_3);
yy_5_1[4] = ((long)yy_5_1_4);
PUTVarNest(yy_5_1);
yy_6_1 = yyb + 5;
yy_6_1[0] = 2;
PUTVarDeclList(yy_6_1);
yy_7_1 = yyb + 6;
yy_7_1[0] = 2;
PUTVarTagList(yy_7_1);
IncNestLevel();
return;
}
}
leave_scope()
{
{
yy yyb;
yy yyv_Locals;
yy yy_1_1;
yy yy_2_1;
yy yyv_LocalTags;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yyv_OldDeclList;
yy yy_5_1_1;
yy yyv_OldTagList;
yy yy_5_1_2;
yy yyv_OldNestLevel;
yy yy_5_1_3;
yy yyv_OldNest;
yy yy_5_1_4;
yy yy_6_1;
yy yy_7_1;
yy yy_8_1;
yy yy_9_1;
GETVarDeclList(&yy_1_1);
yyv_Locals = yy_1_1;
yy_2_1 = yyv_Locals;
undeclare(yy_2_1);
GETVarTagList(&yy_3_1);
yyv_LocalTags = yy_3_1;
yy_4_1 = yyv_LocalTags;
undeclare_tags(yy_4_1);
GETVarNest(&yy_5_1);
if (yy_5_1[0] != 1) goto yyfl_9_1;
yy_5_1_1 = ((yy)yy_5_1[1]);
yy_5_1_2 = ((yy)yy_5_1[2]);
yy_5_1_3 = ((yy)yy_5_1[3]);
yy_5_1_4 = ((yy)yy_5_1[4]);
yyv_OldDeclList = yy_5_1_1;
yyv_OldTagList = yy_5_1_2;
yyv_OldNestLevel = yy_5_1_3;
yyv_OldNest = yy_5_1_4;
yy_6_1 = yyv_OldDeclList;
PUTVarDeclList(yy_6_1);
yy_7_1 = yyv_OldTagList;
PUTVarTagList(yy_7_1);
yy_8_1 = yyv_OldNest;
PUTVarNest(yy_8_1);
yy_9_1 = yyv_OldNestLevel;
PUTVarNestLevel(yy_9_1);
return;
yyfl_9_1 : ;
}
{
yy yyb;
yy yy_1_1;
yy_1_1 = ((yy)"error_leave_scope");
compiler_error(yy_1_1);
return;
yyfl_9_2 : ;
}
yyErr(2,130);
}
compute_linkage(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_10_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_10_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_10_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 2;
*yyout_1 = yy_0_2;
return;
yyfl_10_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_10_3;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
if (! current_nest_level_equal_zero()) goto yyfl_10_3;
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_10_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_10_4;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 3;
*yyout_1 = yy_0_2;
return;
yyfl_10_4 : ;
}
{
yy yyb;
yy yyv_C;
yy yy_0_1;
yy yy_0_2;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_C = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
if (! current_nest_level_equal_zero()) goto yyfl_10_5;
yy_2_1 = ((yy)"this storage class is not allowed on level 0");
semantic_error(yy_2_1);
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_10_5 : ;
}
{
yy yyb;
yy yyv_C;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yyv_C = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 3;
*yyout_1 = yy_0_2;
return;
yyfl_10_6 : ;
}
yyErr(2,151);
}
declare_object(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yyv_Descr;
yy yy_0_2;
yy yy_1_1;
yy yyv_HiddenObj;
yy yy_1_2;
yy yyv_NestLevel;
yy yy_2_1;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy yy_3_2_2;
yy yy_3_2_3;
yy yy_3_2_4;
yy yy_4_1;
yy yy_4_1_1;
yy yy_4_1_2;
yy yy_4_1_3;
yy yy_4_1_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
yyv_Descr = yy_0_2;
yyb = yyh;
yyh += 10; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Id;
GetMeaning0(yy_1_1, &yy_1_2);
yyv_HiddenObj = yy_1_2;
GETVarNestLevel(&yy_2_1);
yyv_NestLevel = yy_2_1;
yy_3_1 = yyv_Id;
yy_3_2_1 = yyv_Id;
yy_3_2_2 = yyv_NestLevel;
yy_3_2_3 = yyv_Descr;
yy_3_2_4 = yyv_HiddenObj;
yy_3_2 = yyb + 0;
yy_3_2[0] = 2;
yy_3_2[1] = ((long)yy_3_2_1);
yy_3_2[2] = ((long)yy_3_2_2);
yy_3_2[3] = ((long)yy_3_2_3);
yy_3_2[4] = ((long)yy_3_2_4);
DefMeaning(yy_3_1, yy_3_2);
yy_4_1_1 = yyv_Id;
yy_4_1_2 = yyv_NestLevel;
yy_4_1_3 = yyv_Descr;
yy_4_1_4 = yyv_HiddenObj;
yy_4_1 = yyb + 5;
yy_4_1[0] = 2;
yy_4_1[1] = ((long)yy_4_1_1);
yy_4_1[2] = ((long)yy_4_1_2);
yy_4_1[3] = ((long)yy_4_1_3);
yy_4_1[4] = ((long)yy_4_1_4);
push_decl(yy_4_1);
return;
}
}
declare_tag(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yyv_Descr;
yy yy_0_2;
yy yy_1_1;
yy yyv_HiddenObj;
yy yy_1_2;
yy yyv_NestLevel;
yy yy_2_1;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy yy_3_2_2;
yy yy_3_2_3;
yy yy_3_2_4;
yy yy_4_1;
yy yy_4_1_1;
yy yy_4_1_2;
yy yy_4_1_3;
yy yy_4_1_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
yyv_Descr = yy_0_2;
yyb = yyh;
yyh += 10; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Id;
GetTagMeaning0(yy_1_1, &yy_1_2);
yyv_HiddenObj = yy_1_2;
GETVarNestLevel(&yy_2_1);
yyv_NestLevel = yy_2_1;
yy_3_1 = yyv_Id;
yy_3_2_1 = yyv_Id;
yy_3_2_2 = yyv_NestLevel;
yy_3_2_3 = yyv_Descr;
yy_3_2_4 = yyv_HiddenObj;
yy_3_2 = yyb + 0;
yy_3_2[0] = 2;
yy_3_2[1] = ((long)yy_3_2_1);
yy_3_2[2] = ((long)yy_3_2_2);
yy_3_2[3] = ((long)yy_3_2_3);
yy_3_2[4] = ((long)yy_3_2_4);
DefTagMeaning(yy_3_1, yy_3_2);
yy_4_1_1 = yyv_Id;
yy_4_1_2 = yyv_NestLevel;
yy_4_1_3 = yyv_Descr;
yy_4_1_4 = yyv_HiddenObj;
yy_4_1 = yyb + 5;
yy_4_1[0] = 2;
yy_4_1[1] = ((long)yy_4_1_1);
yy_4_1[2] = ((long)yy_4_1_2);
yy_4_1[3] = ((long)yy_4_1_3);
yy_4_1[4] = ((long)yy_4_1_4);
push_tag_decl(yy_4_1);
return;
}
}
declare_forward_tagged_type(yyin_1, yyin_2, yyout_1)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yyv_Tp;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy yy_2_2_1;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tag = yy_0_1;
if (yy_0_2[0] != 2) goto yyfl_13_1;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
make_tp(&yy_1_1);
yyv_Tp = yy_1_1;
yy_2_1 = yyv_Tp;
yy_2_2_1 = yyv_Tag;
yy_2_2 = yyb + 0;
yy_2_2[0] = 6;
yy_2_2[1] = ((long)yy_2_2_1);
put_tp_descr(yy_2_1, yy_2_2);
yy_3_1 = yyv_Tag;
yy_3_2_1 = yyv_Tp;
yy_3_2 = yyb + 2;
yy_3_2[0] = 9;
yy_3_2[1] = ((long)yy_3_2_1);
declare_tag(yy_3_1, yy_3_2);
yy_0_3 = yyv_Tp;
*yyout_1 = yy_0_3;
return;
yyfl_13_1 : ;
}
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yyv_Tp;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy yy_2_2_1;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tag = yy_0_1;
if (yy_0_2[0] != 1) goto yyfl_13_2;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
make_tp(&yy_1_1);
yyv_Tp = yy_1_1;
yy_2_1 = yyv_Tp;
yy_2_2_1 = yyv_Tag;
yy_2_2 = yyb + 0;
yy_2_2[0] = 7;
yy_2_2[1] = ((long)yy_2_2_1);
put_tp_descr(yy_2_1, yy_2_2);
yy_3_1 = yyv_Tag;
yy_3_2_1 = yyv_Tp;
yy_3_2 = yyb + 2;
yy_3_2[0] = 8;
yy_3_2[1] = ((long)yy_3_2_1);
declare_tag(yy_3_1, yy_3_2);
yy_0_3 = yyv_Tp;
*yyout_1 = yy_0_3;
return;
yyfl_13_2 : ;
}
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yyv_Tp;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy yy_2_2_1;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tag = yy_0_1;
if (yy_0_2[0] != 3) goto yyfl_13_3;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
make_tp(&yy_1_1);
yyv_Tp = yy_1_1;
yy_2_1 = yyv_Tp;
yy_2_2_1 = yyv_Tag;
yy_2_2 = yyb + 0;
yy_2_2[0] = 11;
yy_2_2[1] = ((long)yy_2_2_1);
put_tp_descr(yy_2_1, yy_2_2);
yy_3_1 = yyv_Tag;
yy_3_2_1 = yyv_Tp;
yy_3_2 = yyb + 2;
yy_3_2[0] = 7;
yy_3_2[1] = ((long)yy_3_2_1);
declare_tag(yy_3_1, yy_3_2);
yy_0_3 = yyv_Tp;
*yyout_1 = yy_0_3;
return;
yyfl_13_3 : ;
}
yyErr(2,208);
}
declare_function_or_test_legal_redeclaration(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yyv_Name;
yy yy_0_1;
yy yyv_NewType;
yy yy_0_2;
yy yyv_StClass;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yyv_Ident;
yy yy_1_2_1;
yy yyv_Nest;
yy yy_1_2_2;
yy yyv_Descr;
yy yy_1_2_3;
yy yyv_Object;
yy yy_1_2_4;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Name = yy_0_1;
yyv_NewType = yy_0_2;
yyv_StClass = yy_0_3;
yy_1_1 = yyv_Name;
if (! GetMeaning(yy_1_1, &yy_1_2)) goto yyfl_14_1;
if (yy_1_2[0] != 2) goto yyfl_14_1;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yy_1_2_3 = ((yy)yy_1_2[3]);
yy_1_2_4 = ((yy)yy_1_2[4]);
yyv_Ident = yy_1_2_1;
yyv_Nest = yy_1_2_2;
yyv_Descr = yy_1_2_3;
yyv_Object = yy_1_2_4;
yy_2_1 = yyv_Name;
yy_2_2 = yyv_Descr;
yy_2_3 = yyv_NewType;
test_legal_function_redeclaration(yy_2_1, yy_2_2, yy_2_3);
return;
yyfl_14_1 : ;
}
{
yy yyb;
yy yyv_Name;
yy yy_0_1;
yy yyv_Type;
yy yy_0_2;
yy yyv_StClass;
yy yy_0_3;
yy yy_1_1;
yy yyv_Linkage;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_3_1;
yy yy_3_2;
yy yy_3_2_1;
yy yy_3_2_2;
yy yy_3_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Name = yy_0_1;
yyv_Type = yy_0_2;
yyv_StClass = yy_0_3;
yyb = yyh;
yyh += 4; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_StClass;
compute_linkage(yy_1_1, &yy_1_2);
yyv_Linkage = yy_1_2;
yy_2_1 = yyv_Name;
yy_2_2 = yyv_Linkage;
cg_new_function(yy_2_1, yy_2_2);
yy_3_1 = yyv_Name;
yy_3_2_1 = yyv_Type;
yy_3_2_2 = yyv_Linkage;
yy_3_2_3 = yyv_Name;
yy_3_2 = yyb + 0;
yy_3_2[0] = 4;
yy_3_2[1] = ((long)yy_3_2_1);
yy_3_2[2] = ((long)yy_3_2_2);
yy_3_2[3] = ((long)yy_3_2_3);
declare_not_yet_declared_function(yy_3_1, yy_3_2);
return;
yyfl_14_2 : ;
}
yyErr(2,231);
}
get_offset_and_type(yyin_1, yyin_2, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yyv_Id;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy yyv_MemberList;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yyv_Tp1;
yy yy_2_3;
yy yyv_Offset;
yy yy_2_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tp = yy_0_1;
yyv_Id = yy_0_2;
yy_1_1 = yyv_Tp;
test_struct_or_union(yy_1_1, &yy_1_2);
yyv_MemberList = yy_1_2;
yy_2_1 = yyv_Id;
yy_2_2 = yyv_MemberList;
lookup_in_memberlist(yy_2_1, yy_2_2, &yy_2_3, &yy_2_4);
yyv_Tp1 = yy_2_3;
yyv_Offset = yy_2_4;
yy_0_3 = yyv_Tp1;
yy_0_4 = yyv_Offset;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
}
}
ApplyIdent(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Obj;
yy yy_1_2;
yy yy_2_1;
yy yyv_Objdescr;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
if (! GetMeaning(yy_1_1, &yy_1_2)) goto yyfl_16_1;
yyv_Obj = yy_1_2;
yy_2_1 = yyv_Obj;
get_objdescr(yy_2_1, &yy_2_2);
yyv_Objdescr = yy_2_2;
yy_0_2 = yyv_Objdescr;
*yyout_1 = yy_0_2;
return;
yyfl_16_1 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Obj;
yy yy_1_2;
yy yy_2_1;
yy yyv_Objdescr;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
if (! GetMeaning(yy_1_1, &yy_1_2)) goto yyfl_16_2;
yyv_Obj = yy_1_2;
yy_2_1 = yyv_Obj;
get_objdescr(yy_2_1, &yy_2_2);
yyv_Objdescr = yy_2_2;
yy_0_2 = yyv_Objdescr;
*yyout_1 = yy_0_2;
return;
yyfl_16_2 : ;
}
yyErr(2,260);
}
TestIdentification(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Obj;
yy yy_1_2;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yy_2_1_2_3;
yy yy_3_1;
yy yyv_Objdescr;
yy yy_3_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
GetMeaning0(yy_1_1, &yy_1_2);
yyv_Obj = yy_1_2;
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Obj;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 1) goto yyfl_18_1_2_1;
yy_2_1_2_1 = ((yy)"identifier '");
yy_2_1_2_2 = yyv_Id;
yy_2_1_2_3 = ((yy)"' not declared");
semantic_error_i(yy_2_1_2_1, yy_2_1_2_2, yy_2_1_2_3);
goto yysl_18_1_2;
yyfl_18_1_2_1 : ;
goto yysl_18_1_2;
yysl_18_1_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_Obj;
get_objdescr(yy_3_1, &yy_3_2);
yyv_Objdescr = yy_3_2;
yy_0_2 = yyv_Objdescr;
*yyout_1 = yy_0_2;
return;
}
}
apply_and_declare_function_id(yyin_1, yyout_1, yyout_2)
yy yyin_1;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Obj1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yyv_Tp;
yy yy_2_3;
yy yyv_Res;
yy yy_2_4;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
GetMeaning0(yy_1_1, &yy_1_2);
yyv_Obj1 = yy_1_2;
yy_2_1 = yyv_Id;
yy_2_2 = yyv_Obj1;
get_type_and_code_or_declare_function_id(yy_2_1, yy_2_2, &yy_2_3, &yy_2_4);
yyv_Tp = yy_2_3;
yyv_Res = yy_2_4;
yy_0_2 = yyv_Tp;
yy_0_3 = yyv_Res;
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
}
}
apply_tag_and_return_typekey(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yyv_T;
yy yy_1_2_1;
yy yyv_Nest;
yy yy_1_2_2;
yy yy_1_2_3;
yy yyv_Tp;
yy yy_1_2_3_1;
yy yyv_O;
yy yy_1_2_4;
yy_0_1 = yyin_1;
yyv_Tag = yy_0_1;
yy_1_1 = yyv_Tag;
if (! GetTagMeaning(yy_1_1, &yy_1_2)) goto yyfl_20_1;
if (yy_1_2[0] != 2) goto yyfl_20_1;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yy_1_2_3 = ((yy)yy_1_2[3]);
yy_1_2_4 = ((yy)yy_1_2[4]);
yyv_T = yy_1_2_1;
yyv_Nest = yy_1_2_2;
if (yy_1_2_3[0] != 7) goto yyfl_20_1;
yy_1_2_3_1 = ((yy)yy_1_2_3[1]);
yyv_Tp = yy_1_2_3_1;
yyv_O = yy_1_2_4;
yy_0_2 = yyv_Tp;
*yyout_1 = yy_0_2;
return;
yyfl_20_1 : ;
}
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yyv_T;
yy yy_1_2_1;
yy yyv_Nest;
yy yy_1_2_2;
yy yy_1_2_3;
yy yyv_Tp;
yy yy_1_2_3_1;
yy yyv_O;
yy yy_1_2_4;
yy_0_1 = yyin_1;
yyv_Tag = yy_0_1;
yy_1_1 = yyv_Tag;
if (! GetTagMeaning(yy_1_1, &yy_1_2)) goto yyfl_20_2;
if (yy_1_2[0] != 2) goto yyfl_20_2;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yy_1_2_3 = ((yy)yy_1_2[3]);
yy_1_2_4 = ((yy)yy_1_2[4]);
yyv_T = yy_1_2_1;
yyv_Nest = yy_1_2_2;
if (yy_1_2_3[0] != 8) goto yyfl_20_2;
yy_1_2_3_1 = ((yy)yy_1_2_3[1]);
yyv_Tp = yy_1_2_3_1;
yyv_O = yy_1_2_4;
yy_0_2 = yyv_Tp;
*yyout_1 = yy_0_2;
return;
yyfl_20_2 : ;
}
{
yy yyb;
yy yyv_Tag;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yyv_T;
yy yy_1_2_1;
yy yyv_Nest;
yy yy_1_2_2;
yy yy_1_2_3;
yy yyv_Tp;
yy yy_1_2_3_1;
yy yyv_O;
yy yy_1_2_4;
yy_0_1 = yyin_1;
yyv_Tag = yy_0_1;
yy_1_1 = yyv_Tag;
if (! GetTagMeaning(yy_1_1, &yy_1_2)) goto yyfl_20_3;
if (yy_1_2[0] != 2) goto yyfl_20_3;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yy_1_2_3 = ((yy)yy_1_2[3]);
yy_1_2_4 = ((yy)yy_1_2[4]);
yyv_T = yy_1_2_1;
yyv_Nest = yy_1_2_2;
if (yy_1_2_3[0] != 9) goto yyfl_20_3;
yy_1_2_3_1 = ((yy)yy_1_2_3[1]);
yyv_Tp = yy_1_2_3_1;
yyv_O = yy_1_2_4;
yy_0_2 = yyv_Tp;
*yyout_1 = yy_0_2;
return;
yyfl_20_3 : ;
}
yyErr(2,302);
}
GetMeaning0(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Obj;
yy yy_1_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
if (! GetMeaning(yy_1_1, &yy_1_2)) goto yyfl_21_1;
yyv_Obj = yy_1_2;
yy_0_2 = yyv_Obj;
*yyout_1 = yy_0_2;
return;
yyfl_21_1 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_21_2 : ;
}
yyErr(2,318);
}
GetTagMeaning0(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Obj;
yy yy_1_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
if (! GetTagMeaning(yy_1_1, &yy_1_2)) goto yyfl_22_1;
yyv_Obj = yy_1_2;
yy_0_2 = yyv_Obj;
*yyout_1 = yy_0_2;
return;
yyfl_22_1 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_22_2 : ;
}
yyErr(2,328);
}
int test_not_current_nest(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_NestLevel;
yy yy_0_1;
yy yyv_CurNest;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_NestLevel = yy_0_1;
GETVarNestLevel(&yy_1_1);
yyv_CurNest = yy_1_1;
yy_2_1 = yyv_NestLevel;
yy_2_2 = yyv_CurNest;
if (! not_equal_nest(yy_2_1, yy_2_2)) goto yyfl_23_1;
return 1;
yyfl_23_1 : ;
}
return 0;
}
int is_nest_level_zero(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_X;
yy yy_0_1;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yyv_X = yy_0_1;
yy_1_1 = yyv_X;
yy_1_2 = ((yy)0);
if ((long)yy_1_1 != (long)yy_1_2) goto yyfl_24_1;
return 1;
yyfl_24_1 : ;
}
return 0;
}
int current_nest_level_equal_zero()
{
{
yy yyb;
yy yyv_X;
yy yy_1;
yy yy_2_1;
yy yy_2_2;
yy_1 = yyglov_Var_NestLevel;
if (yy_1 == (yy) yyu) yyErr(1,353);
yyv_X = yy_1;
yy_2_1 = yyv_X;
yy_2_2 = ((yy)0);
if ((long)yy_2_1 != (long)yy_2_2) goto yyfl_25_1;
return 1;
yyfl_25_1 : ;
}
return 0;
}
int is_current_nest(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Nest;
yy yy_0_1;
yy yyv_CurNest;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Nest = yy_0_1;
GETVarNestLevel(&yy_1_1);
yyv_CurNest = yy_1_1;
yy_2_1 = yyv_Nest;
yy_2_2 = yyv_CurNest;
if (! is_equal_nest(yy_2_1, yy_2_2)) goto yyfl_26_1;
return 1;
yyfl_26_1 : ;
}
return 0;
}
InitDefTab()
{
{
yy yyb;
yy yy_1;
yy yy_1_1;
yy_1_1 = ((yy)1);
yy_1 = (yy)(-((long)yy_1_1));
yyglov_Var_NestLevel = yy_1;
return;
}
}
GETVarNestLevel(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_1;
yy_1 = yyglov_Var_NestLevel;
if (yy_1 == (yy) yyu) yyErr(1,389);
yyv_X = yy_1;
yy_0_1 = yyv_X;
*yyout_1 = yy_0_1;
return;
}
}
PUTVarNestLevel(yyin_1)
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
yyglov_Var_NestLevel = yy_1;
return;
}
}
IncNestLevel()
{
{
yy yyb;
yy yyv_X;
yy yy_1;
yy yy_2;
yy yy_2_1;
yy yy_2_2;
yy_1 = yyglov_Var_NestLevel;
if (yy_1 == (yy) yyu) yyErr(1,396);
yyv_X = yy_1;
yy_2_1 = yyv_X;
yy_2_2 = ((yy)1);
yy_2 = (yy)(((long)yy_2_1)+((long)yy_2_2));
yyglov_Var_NestLevel = yy_2;
return;
}
}
GETVarNest(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_1;
yy_1 = yyglov_Var_Nest;
if (yy_1 == (yy) yyu) yyErr(1,403);
yyv_X = yy_1;
yy_0_1 = yyv_X;
*yyout_1 = yy_0_1;
return;
}
}
PUTVarNest(yyin_1)
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
yyglov_Var_Nest = yy_1;
return;
}
}
GETVarDeclList(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_1;
yy_1 = yyglov_Var_DeclList;
if (yy_1 == (yy) yyu) yyErr(1,412);
yyv_X = yy_1;
yy_0_1 = yyv_X;
*yyout_1 = yy_0_1;
return;
}
}
PUTVarDeclList(yyin_1)
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
yyglov_Var_DeclList = yy_1;
return;
}
}
push_decl(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Obj;
yy yy_0_1;
yy yyv_Old;
yy yy_1_1;
yy yy_2_1;
yy yy_2_1_1;
yy yy_2_1_2;
yy_0_1 = yyin_1;
yyv_Obj = yy_0_1;
yyb = yyh;
yyh += 3; if (yyh > yyhx) yyExtend();
GETVarDeclList(&yy_1_1);
yyv_Old = yy_1_1;
yy_2_1_1 = yyv_Obj;
yy_2_1_2 = yyv_Old;
yy_2_1 = yyb + 0;
yy_2_1[0] = 1;
yy_2_1[1] = ((long)yy_2_1_1);
yy_2_1[2] = ((long)yy_2_1_2);
PUTVarDeclList(yy_2_1);
return;
}
}
undeclare(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Obj;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_41_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Obj = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Obj;
undeclare_object(yy_1_1);
yy_2_1 = yyv_List;
undeclare(yy_2_1);
return;
yyfl_41_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_41_2;
return;
yyfl_41_2 : ;
}
yyErr(2,426);
}
undeclare_object(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_Nest;
yy yy_0_1_2;
yy yyv_Tp;
yy yy_0_1_3;
yy yyv_Hidden;
yy yy_0_1_4;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_42_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Id = yy_0_1_1;
yyv_Nest = yy_0_1_2;
yyv_Tp = yy_0_1_3;
yyv_Hidden = yy_0_1_4;
yy_1_1 = yyv_Id;
yy_1_2 = yyv_Hidden;
DefMeaning(yy_1_1, yy_1_2);
return;
yyfl_42_1 : ;
}
yyErr(2,437);
}
GETVarTagList(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_1;
yy_1 = yyglov_Var_TagList;
if (yy_1 == (yy) yyu) yyErr(1,450);
yyv_X = yy_1;
yy_0_1 = yyv_X;
*yyout_1 = yy_0_1;
return;
}
}
PUTVarTagList(yyin_1)
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
yyglov_Var_TagList = yy_1;
return;
}
}
undeclare_tags(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Obj;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_46_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Obj = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Obj;
undeclare_tag(yy_1_1);
yy_2_1 = yyv_List;
undeclare_tags(yy_2_1);
return;
yyfl_46_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_46_2;
return;
yyfl_46_2 : ;
}
yyErr(2,455);
}
undeclare_tag(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_Nest;
yy yy_0_1_2;
yy yyv_Tp;
yy yy_0_1_3;
yy yyv_Hidden;
yy yy_0_1_4;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_47_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Id = yy_0_1_1;
yyv_Nest = yy_0_1_2;
yyv_Tp = yy_0_1_3;
yyv_Hidden = yy_0_1_4;
yy_1_1 = yyv_Id;
yy_1_2 = yyv_Hidden;
DefTagMeaning(yy_1_1, yy_1_2);
return;
yyfl_47_1 : ;
}
yyErr(2,466);
}
push_tag_decl(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Obj;
yy yy_0_1;
yy yyv_Old;
yy yy_1_1;
yy yy_2_1;
yy yy_2_1_1;
yy yy_2_1_2;
yy_0_1 = yyin_1;
yyv_Obj = yy_0_1;
yyb = yyh;
yyh += 3; if (yyh > yyhx) yyExtend();
GETVarTagList(&yy_1_1);
yyv_Old = yy_1_1;
yy_2_1_1 = yyv_Obj;
yy_2_1_2 = yyv_Old;
yy_2_1 = yyb + 0;
yy_2_1[0] = 1;
yy_2_1[1] = ((long)yy_2_1_1);
yy_2_1[2] = ((long)yy_2_1_2);
PUTVarTagList(yy_2_1);
return;
}
}
lookup_in_memberlist(yyin_1, yyin_2, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yyv_Fields;
yy yy_0_2_1;
yy yy_0_2_2;
yy yyv_Ident;
yy yy_0_2_2_1;
yy yyv_Tp;
yy yy_0_2_2_2;
yy yyv_W;
yy yy_0_2_2_3;
yy yyv_O;
yy yy_0_2_2_4;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
if (yy_0_2[0] != 2) goto yyfl_49_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Fields = yy_0_2_1;
if (yy_0_2_2[0] != 1) goto yyfl_49_1;
yy_0_2_2_1 = ((yy)yy_0_2_2[1]);
yy_0_2_2_2 = ((yy)yy_0_2_2[2]);
yy_0_2_2_3 = ((yy)yy_0_2_2[3]);
yy_0_2_2_4 = ((yy)yy_0_2_2[4]);
yyv_Ident = yy_0_2_2_1;
yyv_Tp = yy_0_2_2_2;
yyv_W = yy_0_2_2_3;
yyv_O = yy_0_2_2_4;
yy_1_1 = yyv_Id;
yy_1_2 = yyv_Ident;
if (! equal_Ident(yy_1_1, yy_1_2)) goto yyfl_49_1;
yy_0_3 = yyv_Tp;
yy_0_4 = yyv_O;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_49_1 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yyv_Fields;
yy yy_0_2_1;
yy yyv_Field;
yy yy_0_2_2;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy yy_1_2;
yy yyv_Tp;
yy yy_1_3;
yy yyv_Offset;
yy yy_1_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
if (yy_0_2[0] != 2) goto yyfl_49_2;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Fields = yy_0_2_1;
yyv_Field = yy_0_2_2;
yy_1_1 = yyv_Id;
yy_1_2 = yyv_Fields;
lookup_in_memberlist(yy_1_1, yy_1_2, &yy_1_3, &yy_1_4);
yyv_Tp = yy_1_3;
yyv_Offset = yy_1_4;
yy_0_3 = yyv_Tp;
yy_0_4 = yyv_Offset;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_49_2 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yyv_Tp;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
if (yy_0_2[0] != 1) goto yyfl_49_3;
yy_1_1 = ((yy)"'");
yy_1_2 = yyv_Id;
yy_1_3 = ((yy)"' is not a member");
semantic_error_i(yy_1_1, yy_1_2, yy_1_3);
make_tp(&yy_2_1);
yyv_Tp = yy_2_1;
yy_0_3 = yyv_Tp;
yy_0_4 = ((yy)0);
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_49_3 : ;
}
yyErr(2,483);
}
test_struct_or_union(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yyv_Ident;
yy yy_1_2_1;
yy yyv_Fields;
yy yy_1_2_2;
yy_0_1 = yyin_1;
yyv_Tp = yy_0_1;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
if (yy_1_2[0] != 8) goto yyfl_50_1;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yyv_Ident = yy_1_2_1;
yyv_Fields = yy_1_2_2;
yy_0_2 = yyv_Fields;
*yyout_1 = yy_0_2;
return;
yyfl_50_1 : ;
}
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yyv_Ident;
yy yy_1_2_1;
yy yyv_Fields;
yy yy_1_2_2;
yy_0_1 = yyin_1;
yyv_Tp = yy_0_1;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
if (yy_1_2[0] != 9) goto yyfl_50_2;
yy_1_2_1 = ((yy)yy_1_2[1]);
yy_1_2_2 = ((yy)yy_1_2[2]);
yyv_Ident = yy_1_2_1;
yyv_Fields = yy_1_2_2;
yy_0_2 = yyv_Fields;
*yyout_1 = yy_0_2;
return;
yyfl_50_2 : ;
}
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yyv_Tp = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = ((yy)"not a struct or union type");
semantic_error(yy_1_1);
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_50_3 : ;
}
yyErr(2,502);
}
get_objdescr(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_Nest;
yy yy_0_1_2;
yy yyv_ObjDescr;
yy yy_0_1_3;
yy yyv_Object;
yy yy_0_1_4;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_51_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Ident = yy_0_1_1;
yyv_Nest = yy_0_1_2;
yyv_ObjDescr = yy_0_1_3;
yyv_Object = yy_0_1_4;
yy_0_2 = yyv_ObjDescr;
*yyout_1 = yy_0_2;
return;
yyfl_51_1 : ;
}
yyErr(2,519);
}
test_legal_function_redeclaration(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yyv_Name;
yy yy_0_1;
yy yy_0_2;
yy yyv_OldType;
yy yy_0_2_1;
yy yyv_Linkage;
yy yy_0_2_2;
yy yyv_ObjNr;
yy yy_0_2_3;
yy yyv_NewType;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Name = yy_0_1;
if (yy_0_2[0] != 4) goto yyfl_52_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yy_0_2_3 = ((yy)yy_0_2[3]);
yyv_OldType = yy_0_2_1;
yyv_Linkage = yy_0_2_2;
yyv_ObjNr = yy_0_2_3;
yyv_NewType = yy_0_3;
yy_1_1 = yyv_OldType;
yy_1_2 = yyv_NewType;
if (! test_equal_types(yy_1_1, yy_1_2)) goto yyfl_52_1;
return;
yyfl_52_1 : ;
}
{
yy yyb;
yy yyv_Name;
yy yy_0_1;
yy yyv_ObjDescr;
yy yy_0_2;
yy yyv_Type;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Name = yy_0_1;
yyv_ObjDescr = yy_0_2;
yyv_Type = yy_0_3;
yy_1_1 = ((yy)"illegal redeclaration");
semantic_error(yy_1_1);
return;
yyfl_52_2 : ;
}
yyErr(2,525);
}
get_type_and_code_or_declare_function_id(yyin_1, yyin_2, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_0_4_1;
yy yy_1_1;
yy yy_1_1_1;
yy yy_1_1_2;
yy yy_1_1_3;
yy yyv_Tp2;
yy yy_1_2;
yy yy_2_1;
yy yy_2_1_1;
yy yy_2_1_2;
yy yyv_Tp1;
yy yy_2_2;
yy yyv_Tp;
yy yy_3_1;
yy yy_4_1;
yy yy_4_2;
yy yy_4_2_1;
yy yy_4_2_2;
yy yy_5_1;
yy yy_5_2;
yy yy_5_2_1;
yy yy_5_2_2;
yy yy_5_2_3;
yy yy_6_1;
yy yy_6_1_1;
yy yy_6_1_2;
yy yyv_Tp3;
yy yy_6_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
if (yy_0_2[0] != 1) goto yyfl_53_1;
yyb = yyh;
yyh += 26; if (yyh > yyhx) yyExtend();
yy_1_1_1 = yyb + 6;
yy_1_1_1[0] = 2;
yy_1_1_2 = yyb + 7;
yy_1_1_2[0] = 1;
yy_1_1_3 = yyb + 8;
yy_1_1_3[0] = 6;
yy_1_1 = yyb + 2;
yy_1_1[0] = 13;
yy_1_1[1] = ((long)yy_1_1_1);
yy_1_1[2] = ((long)yy_1_1_2);
yy_1_1[3] = ((long)yy_1_1_3);
make_type_and_size(yy_1_1, &yy_1_2);
yyv_Tp2 = yy_1_2;
yy_2_1_1 = yyb + 12;
yy_2_1_1[0] = 4;
yy_2_1_2 = yyv_Tp2;
yy_2_1 = yyb + 9;
yy_2_1[0] = 12;
yy_2_1[1] = ((long)yy_2_1_1);
yy_2_1[2] = ((long)yy_2_1_2);
make_type_and_size(yy_2_1, &yy_2_2);
yyv_Tp1 = yy_2_2;
make_tp(&yy_3_1);
yyv_Tp = yy_3_1;
yy_4_1 = yyv_Tp;
yy_4_2_1 = yyb + 16;
yy_4_2_1[0] = 28;
yy_4_2_2 = yyv_Tp1;
yy_4_2 = yyb + 13;
yy_4_2[0] = 4;
yy_4_2[1] = ((long)yy_4_2_1);
yy_4_2[2] = ((long)yy_4_2_2);
put_tp_descr(yy_4_1, yy_4_2);
yy_5_1 = yyv_Id;
yy_5_2_1 = yyv_Tp;
yy_5_2_2 = yyb + 21;
yy_5_2_2[0] = 1;
yy_5_2_3 = yyv_Id;
yy_5_2 = yyb + 17;
yy_5_2[0] = 4;
yy_5_2[1] = ((long)yy_5_2_1);
yy_5_2[2] = ((long)yy_5_2_2);
yy_5_2[3] = ((long)yy_5_2_3);
declare_not_yet_declared_function(yy_5_1, yy_5_2);
yy_6_1_1 = yyb + 25;
yy_6_1_1[0] = 4;
yy_6_1_2 = yyv_Tp;
yy_6_1 = yyb + 22;
yy_6_1[0] = 5;
yy_6_1[1] = ((long)yy_6_1_1);
yy_6_1[2] = ((long)yy_6_1_2);
make_type_and_size(yy_6_1, &yy_6_2);
yyv_Tp3 = yy_6_2;
yy_0_3 = yyv_Tp3;
yy_0_4_1 = yyv_Id;
yy_0_4 = yyb + 0;
yy_0_4[0] = 17;
yy_0_4[1] = ((long)yy_0_4_1);
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_53_1 : ;
}
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yyv_Obj;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy yyv_Objdescr;
yy yy_1_2;
yy yy_2_1;
yy yyv_Tp;
yy yy_2_2;
yy yyv_IR;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
yyv_Obj = yy_0_2;
yy_1_1 = yyv_Obj;
get_objdescr(yy_1_1, &yy_1_2);
yyv_Objdescr = yy_1_2;
yy_2_1 = yyv_Objdescr;
test_function_and_return_code(yy_2_1, &yy_2_2, &yy_2_3);
yyv_Tp = yy_2_2;
yyv_IR = yy_2_3;
yy_0_3 = yyv_Tp;
yy_0_4 = yyv_IR;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_53_2 : ;
}
yyErr(2,539);
}
declare_not_yet_declared_function(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yyv_Descr;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yy_1_2_1;
yy yy_1_2_2;
yy yy_1_2_3;
yy yy_1_2_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Id = yy_0_1;
yyv_Descr = yy_0_2;
yyb = yyh;
yyh += 6; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Id;
yy_1_2_1 = yyv_Id;
yy_1_2_2 = ((yy)0);
yy_1_2_3 = yyv_Descr;
yy_1_2_4 = yyb + 5;
yy_1_2_4[0] = 1;
yy_1_2 = yyb + 0;
yy_1_2[0] = 2;
yy_1_2[1] = ((long)yy_1_2_1);
yy_1_2[2] = ((long)yy_1_2_2);
yy_1_2[3] = ((long)yy_1_2_3);
yy_1_2[4] = ((long)yy_1_2_4);
DefMeaning(yy_1_1, yy_1_2);
return;
}
}
int test_pointer_to_function(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Descr;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_55_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
yy_1_1 = yyv_Tp1;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_Descr = yy_1_2;
yy_2_1 = yyv_Descr;
if (! test_function(yy_2_1)) goto yyfl_55_1;
return 1;
yyfl_55_1 : ;
}
return 0;
}
int test_function(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_ParamTypes;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_56_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParamTypes = yy_0_1_1;
yyv_Tp = yy_0_1_2;
return 1;
yyfl_56_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_56_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_Tp = yy_0_1_2;
return 1;
yyfl_56_2 : ;
}
return 0;
}
test_function_and_return_code(yyin_1, yyout_1, yyout_2)
yy yyin_1;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Tp;
yy yy_0_1_1;
yy yyv_Linkage;
yy yy_0_1_2;
yy yyv_Id;
yy yy_0_1_3;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_1_1;
yy yy_1_1_1;
yy yy_1_1_2;
yy yyv_Tp1;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_57_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Tp = yy_0_1_1;
yyv_Linkage = yy_0_1_2;
yyv_Id = yy_0_1_3;
yyb = yyh;
yyh += 6; if (yyh > yyhx) yyExtend();
yy_1_1_1 = yyb + 5;
yy_1_1_1[0] = 4;
yy_1_1_2 = yyv_Tp;
yy_1_1 = yyb + 2;
yy_1_1[0] = 5;
yy_1_1[1] = ((long)yy_1_1_1);
yy_1_1[2] = ((long)yy_1_1_2);
make_type_and_size(yy_1_1, &yy_1_2);
yyv_Tp1 = yy_1_2;
yy_0_2 = yyv_Tp1;
yy_0_3_1 = yyv_Id;
yy_0_3 = yyb + 0;
yy_0_3[0] = 17;
yy_0_3[1] = ((long)yy_0_3_1);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_57_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tp;
yy yy_0_1_1;
yy yyv_C;
yy yy_0_1_2;
yy yyv_Linkage;
yy yy_0_1_3;
yy yyv_Ident;
yy yy_0_1_4;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_1_1;
yy yyv_TpDescr;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_57_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Tp = yy_0_1_1;
yyv_C = yy_0_1_2;
yyv_Linkage = yy_0_1_3;
yyv_Ident = yy_0_1_4;
yyb = yyh;
yyh += 2; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_TpDescr = yy_1_2;
yy_2_1 = yyv_TpDescr;
if (! test_pointer_to_function(yy_2_1)) goto yyfl_57_2;
yy_0_2 = yyv_Tp;
yy_0_3_1 = yyv_Ident;
yy_0_3 = yyb + 0;
yy_0_3[0] = 15;
yy_0_3[1] = ((long)yy_0_3_1);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_57_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tp;
yy yy_0_1_1;
yy yyv_C;
yy yy_0_1_2;
yy yyv_ObjNr;
yy yy_0_1_3;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_1_1;
yy yyv_TpDescr;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_57_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Tp = yy_0_1_1;
yyv_C = yy_0_1_2;
yyv_ObjNr = yy_0_1_3;
yyb = yyh;
yyh += 2; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_TpDescr = yy_1_2;
yy_2_1 = yyv_TpDescr;
if (! test_pointer_to_function(yy_2_1)) goto yyfl_57_3;
yy_0_2 = yyv_Tp;
yy_0_3_1 = yyv_ObjNr;
yy_0_3 = yyb + 0;
yy_0_3[0] = 14;
yy_0_3[1] = ((long)yy_0_3_1);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_57_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tp;
yy yy_0_1_1;
yy yyv_C;
yy yy_0_1_2;
yy yyv_ObjNr;
yy yy_0_1_3;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_2_1;
yy yy_1_1;
yy yyv_TpDescr;
yy yy_1_2;
yy yy_2_1;
yy yy_3_1;
yy yyv_Mode;
yy yy_3_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_57_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Tp = yy_0_1_1;
yyv_C = yy_0_1_2;
yyv_ObjNr = yy_0_1_3;
yyb = yyh;
yyh += 5; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_TpDescr = yy_1_2;
yy_2_1 = yyv_TpDescr;
if (! test_pointer_to_function(yy_2_1)) goto yyfl_57_4;
yy_3_1 = yyv_TpDescr;
td_map_to_mode(yy_3_1, &yy_3_2);
yyv_Mode = yy_3_2;
yy_0_2 = yyv_Tp;
yy_0_3_1 = yyv_Mode;
yy_0_3_2_1 = yyv_ObjNr;
yy_0_3_2 = yyb + 3;
yy_0_3_2[0] = 16;
yy_0_3_2[1] = ((long)yy_0_3_2_1);
yy_0_3 = yyb + 0;
yy_0_3[0] = 22;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_57_4 : ;
}
{
yy yyb;
yy yyv_Objdescr;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Tp;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_Objdescr = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = ((yy)"ident is not a (pointer to a) function");
semantic_error(yy_1_1);
make_tp(&yy_2_1);
yyv_Tp = yy_2_1;
yy_0_2 = yyv_Tp;
yy_0_3 = yyb + 0;
yy_0_3[0] = 6;
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_57_5 : ;
}
yyErr(2,584);
}
TestError(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_58_1;
yy_1_1 = ((yy)"undeclared identifier");
semantic_error(yy_1_1);
return;
yyfl_58_1 : ;
}
{
yy yyb;
yy yyv_OBJ;
yy yy_0_1;
yy_0_1 = yyin_1;
yyv_OBJ = yy_0_1;
return;
yyfl_58_2 : ;
}
yyErr(2,614);
}
int is_equal_nest(yyin_1, yyin_2)
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
if ((long)yy_1_1 != (long)yy_1_2) goto yyfl_59_1;
return 1;
yyfl_59_1 : ;
}
return 0;
}
int not_equal_nest(yyin_1, yyin_2)
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
if ((long)yy_1_1 == (long)yy_1_2) goto yyfl_60_1;
return 1;
yyfl_60_1 : ;
}
return 0;
}
