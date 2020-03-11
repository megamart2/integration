typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Types", l);
}
yyeq_Tp(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_Tp(t) yy t;
{
yyPrintIndex(t);
}
yyeq_NameInfo(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
}
}
yyPrint_NameInfo(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("noname");
yyNoArgs();
break;
case 2: 
yyTerm("name");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
}
}
yybroadcast_NameInfo(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_NameInfo, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_TpDescr(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& (t1[1] == t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
case 3: return (t2[0] == 3)
&& yyeq_ParamTypes((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
case 4: return (t2[0] == 4)
&& yyeq_D((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
case 5: return (t2[0] == 5)
&& yyeq_Qual((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
case 6: return (t2[0] == 6)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 7: return (t2[0] == 7)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 8: return (t2[0] == 8)
&& yyeq_IdOpt((yy)t1[1], (yy)t2[1])
&& yyeq_Fields((yy)t1[2], (yy)t2[2])
;
case 9: return (t2[0] == 9)
&& yyeq_IdOpt((yy)t1[1], (yy)t2[1])
&& yyeq_Fields((yy)t1[2], (yy)t2[2])
;
case 10: return (t2[0] == 10)
&& yyeq_IdOpt((yy)t1[1], (yy)t2[1])
&& yyeq_AMode((yy)t1[2], (yy)t2[2])
;
case 11: return (t2[0] == 11)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
;
case 12: return (t2[0] == 12)
&& yyeq_Qual((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
case 13: return (t2[0] == 13)
&& yyeq_Sign((yy)t1[1], (yy)t2[1])
&& yyeq_Size((yy)t1[2], (yy)t2[2])
&& yyeq_Mode((yy)t1[3], (yy)t2[3])
;
}
}
yyPrint_TpDescr(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_nil");
yyNoArgs();
break;
case 2: 
yyTerm("tp_array");
yyFirstArg();
yyPrint_INT((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
case 3: 
yyTerm("tp_function_new");
yyFirstArg();
yyPrint_ParamTypes((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
case 4: 
yyTerm("tp_function_old");
yyFirstArg();
yyPrint_D((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
case 5: 
yyTerm("tp_pointer");
yyFirstArg();
yyPrint_Qual((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
case 6: 
yyTerm("tp_forward_union");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 7: 
yyTerm("tp_forward_struct");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 8: 
yyTerm("tp_union");
yyFirstArg();
yyPrint_IdOpt((yy)t[1]);
yyNextArg();
yyPrint_Fields((yy)t[2]);
yyEndArgs();
break;
case 9: 
yyTerm("tp_struct");
yyFirstArg();
yyPrint_IdOpt((yy)t[1]);
yyNextArg();
yyPrint_Fields((yy)t[2]);
yyEndArgs();
break;
case 10: 
yyTerm("tp_enum_specifier");
yyFirstArg();
yyPrint_IdOpt((yy)t[1]);
yyNextArg();
yyPrint_AMode((yy)t[2]);
yyEndArgs();
break;
case 11: 
yyTerm("tp_forward_enum_specifier");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyEndArgs();
break;
case 12: 
yyTerm("tp_base_type");
yyFirstArg();
yyPrint_Qual((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
case 13: 
yyTerm("tp_triple");
yyFirstArg();
yyPrint_Sign((yy)t[1]);
yyNextArg();
yyPrint_Size((yy)t[2]);
yyNextArg();
yyPrint_Mode((yy)t[3]);
yyEndArgs();
break;
}
}
yybroadcast_TpDescr(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_TpDescr, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
*Out = A;
break;
case 3: 
yybroadcast_ParamTypes((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 4: 
yybroadcast_D((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 5: 
yybroadcast_Qual((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 6: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 7: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 8: 
yybroadcast_IdOpt((yy)t[1], A, &B, Handler);
yybroadcast_Fields((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 9: 
yybroadcast_IdOpt((yy)t[1], A, &B, Handler);
yybroadcast_Fields((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 10: 
yybroadcast_IdOpt((yy)t[1], A, &B, Handler);
yybroadcast_AMode((yy)t[2], B, &A, Handler);
*Out = A;
break;
case 11: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 12: 
yybroadcast_Qual((yy)t[1], A, &B, Handler);
*Out = B;
break;
case 13: 
yybroadcast_Sign((yy)t[1], A, &B, Handler);
yybroadcast_Size((yy)t[2], B, &A, Handler);
yybroadcast_Mode((yy)t[3], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_RefTp(t1, t2) yy t1, t2;
{
return t1 == t2;
}
yyPrint_RefTp(t) yy t;
{
yyPrintIndex(t);
}
yyeq_ParamTypes(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_ParamType((yy)t1[1], (yy)t2[1])
&& yyeq_ParamTypes((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_ParamTypes(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("param_types_nil");
yyNoArgs();
break;
case 2: 
yyTerm("param_types");
yyFirstArg();
yyPrint_ParamType((yy)t[1]);
yyNextArg();
yyPrint_ParamTypes((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_ParamTypes(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ParamTypes, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_ParamType((yy)t[1], A, &B, Handler);
yybroadcast_ParamTypes((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_Qual(t1, t2) yy t1, t2;
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
yyPrint_Qual(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_const_volatile");
yyNoArgs();
break;
case 2: 
yyTerm("tp_volatile");
yyNoArgs();
break;
case 3: 
yyTerm("tp_const");
yyNoArgs();
break;
case 4: 
yyTerm("tp_qualifier_nil");
yyNoArgs();
break;
}
}
yybroadcast_Qual(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Qual, t, In, Out)) {
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
yyeq_Fields(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_Fields((yy)t1[1], (yy)t2[1])
&& yyeq_Field((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_Fields(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("fields_nil");
yyNoArgs();
break;
case 2: 
yyTerm("fields");
yyFirstArg();
yyPrint_Fields((yy)t[1]);
yyNextArg();
yyPrint_Field((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_Fields(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Fields, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_Fields((yy)t[1], A, &B, Handler);
yybroadcast_Field((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_Sign(t1, t2) yy t1, t2;
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
yyPrint_Sign(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_sign_nil");
yyNoArgs();
break;
case 2: 
yyTerm("tp_signed");
yyNoArgs();
break;
case 3: 
yyTerm("tp_unsigned");
yyNoArgs();
break;
}
}
yybroadcast_Sign(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Sign, t, In, Out)) {
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
yyeq_Size(t1, t2) yy t1, t2;
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
yyPrint_Size(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_size_nil");
yyNoArgs();
break;
case 2: 
yyTerm("tp_short");
yyNoArgs();
break;
case 3: 
yyTerm("tp_long");
yyNoArgs();
break;
}
}
yybroadcast_Size(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Size, t, In, Out)) {
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
yyeq_Mode(t1, t2) yy t1, t2;
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
yyPrint_Mode(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_mode_nil");
yyNoArgs();
break;
case 2: 
yyTerm("tp_void");
yyNoArgs();
break;
case 3: 
yyTerm("tp_char");
yyNoArgs();
break;
case 4: 
yyTerm("tp_float");
yyNoArgs();
break;
case 5: 
yyTerm("tp_double");
yyNoArgs();
break;
case 6: 
yyTerm("tp_int");
yyNoArgs();
break;
}
}
yybroadcast_Mode(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Mode, t, In, Out)) {
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
yyeq_ParamType(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_IdOpt((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
&& yyeq_StClass((yy)t1[3], (yy)t2[3])
;
}
}
yyPrint_ParamType(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("ellipsis");
yyNoArgs();
break;
case 2: 
yyTerm("param_type");
yyFirstArg();
yyPrint_IdOpt((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyNextArg();
yyPrint_StClass((yy)t[3]);
yyEndArgs();
break;
}
}
yybroadcast_ParamType(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_ParamType, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_IdOpt((yy)t[1], A, &B, Handler);
yybroadcast_StClass((yy)t[3], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_Field(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Ident((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
&& (t1[3] == t2[3])
&& (t1[4] == t2[4])
;
}
}
yyPrint_Field(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("field");
yyFirstArg();
yyPrint_Ident((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyNextArg();
yyPrint_INT((yy)t[3]);
yyNextArg();
yyPrint_INT((yy)t[4]);
yyEndArgs();
break;
}
}
yybroadcast_Field(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_Field, t, In, Out)) {
switch(t[0]) {
case 1: 
yybroadcast_Ident((yy)t[1], A, &B, Handler);
*Out = B;
break;
}
}
}
yyeq_TpPairs(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
;
case 2: return (t2[0] == 2)
&& yyeq_TpPair((yy)t1[1], (yy)t2[1])
&& yyeq_TpPairs((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_TpPairs(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_pair_list_nil");
yyNoArgs();
break;
case 2: 
yyTerm("tp_pair_list");
yyFirstArg();
yyPrint_TpPair((yy)t[1]);
yyNextArg();
yyPrint_TpPairs((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_TpPairs(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_TpPairs, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
case 2: 
yybroadcast_TpPair((yy)t[1], A, &B, Handler);
yybroadcast_TpPairs((yy)t[2], B, &A, Handler);
*Out = A;
break;
}
}
}
yyeq_TpPair(t1, t2) yy t1, t2;
{
switch(t1[0]) {
case 1: return (t2[0] == 1)
&& yyeq_Tp((yy)t1[1], (yy)t2[1])
&& yyeq_Tp((yy)t1[2], (yy)t2[2])
;
}
}
yyPrint_TpPair(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("tp_pair");
yyFirstArg();
yyPrint_Tp((yy)t[1]);
yyNextArg();
yyPrint_Tp((yy)t[2]);
yyEndArgs();
break;
}
}
yybroadcast_TpPair(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_TpPair, t, In, Out)) {
switch(t[0]) {
case 1: 
*Out = A;
break;
}
}
}
make_type_and_size_and_mode(yyin_1, yyout_1, yyout_2)
yy yyin_1;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Descr;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Tp;
yy yy_1_2;
yy yy_2_1;
yy yyv_AMode;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Descr = yy_0_1;
yy_1_1 = yyv_Descr;
make_type_and_size(yy_1_1, &yy_1_2);
yyv_Tp = yy_1_2;
yy_2_1 = yyv_Descr;
td_map_to_mode(yy_2_1, &yy_2_2);
yyv_AMode = yy_2_2;
yy_0_2 = yyv_Tp;
yy_0_3 = yyv_AMode;
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
}
}
make_type_and_size(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Descr;
yy yy_0_1;
yy yy_0_2;
yy yyv_Tp;
yy yy_1_1;
yy yy_2_1;
yy yy_2_2;
yy yy_3_1;
yy yyv_Size;
yy yy_3_2;
yy yy_4_1;
yy yy_4_2;
yy_0_1 = yyin_1;
yyv_Descr = yy_0_1;
make_tp(&yy_1_1);
yyv_Tp = yy_1_1;
yy_2_1 = yyv_Tp;
yy_2_2 = yyv_Descr;
put_tp_descr(yy_2_1, yy_2_2);
yy_3_1 = yyv_Descr;
td_map_to_size(yy_3_1, &yy_3_2);
yyv_Size = yy_3_2;
yy_4_1 = yyv_Tp;
yy_4_2 = yyv_Size;
put_tp_size(yy_4_1, yy_4_2);
yy_0_2 = yyv_Tp;
*yyout_1 = yy_0_2;
return;
}
}
make_tp(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Tp;
yy yy_2;
yy yy_2_1;
yy yy_3;
yyb = yyh;
yyh += 5; if (yyh > yyhx) yyExtend();
yyv_Tp = yyb + 0;
yyb[3] = yyu;
yyb[2] = yyu;
yyb[1] = yyu;
yy_2_1 = ((yy)1);
yy_2 = (yy)(-((long)yy_2_1));
yyv_Tp[2] = (long) yy_2;
yy_3 = yyb + 4;
yy_3[0] = 1;
yyv_Tp[3] = (long) yy_3;
yy_0_1 = yyv_Tp;
*yyout_1 = yy_0_1;
return;
}
}
put_tp_descr(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yyv_TpDescr;
yy yy_0_2;
yy yy_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tp = yy_0_1;
yyv_TpDescr = yy_0_2;
yy_1 = yyv_TpDescr;
yyv_Tp[1] = (long) yy_1;
return;
}
}
get_tp_descr(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yy_0_2;
yy yyv_TpDescr;
yy yy_1;
yy_0_1 = yyin_1;
yyv_Tp = yy_0_1;
yy_1 = (yy) yyv_Tp[1];
if (yy_1 == (yy) yyu) yyErr(1,156);
yyv_TpDescr = yy_1;
yy_0_2 = yyv_TpDescr;
*yyout_1 = yy_0_2;
return;
}
}
put_tp_size(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yyv_Size;
yy yy_0_2;
yy yy_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tp = yy_0_1;
yyv_Size = yy_0_2;
yy_1 = yyv_Size;
yyv_Tp[2] = (long) yy_1;
return;
}
}
get_tp_size(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yy_0_2;
yy yyv_Size;
yy yy_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_1_2_1;
yy yy_2_1_2_1;
yy_0_1 = yyin_1;
yyv_Tp = yy_0_1;
yy_1 = (yy) yyv_Tp[2];
if (yy_1 == (yy) yyu) yyErr(1,166);
yyv_Size = yy_1;
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Size;
yy_2_1_1_2_1 = ((yy)1);
yy_2_1_1_2 = (yy)(-((long)yy_2_1_1_2_1));
if ((long)yy_2_1_1_1 != (long)yy_2_1_1_2) goto yyfl_19_1_2_1;
yy_2_1_2_1 = ((yy)"cannot compute size");
semantic_error(yy_2_1_2_1);
goto yysl_19_1_2;
yyfl_19_1_2_1 : ;
goto yysl_19_1_2;
yysl_19_1_2 : ;
yyb = yysb;
}
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
}
}
int test_equal_types(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyb + 0;
yy_1_3[0] = 1;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_20_1;
return 1;
yyfl_20_1 : ;
}
return 0;
}
int compare_amode(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_21_1;
if (yy_0_2[0] != 2) goto yyfl_21_1;
return 1;
yyfl_21_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 3) goto yyfl_21_2;
if (yy_0_2[0] != 3) goto yyfl_21_2;
return 1;
yyfl_21_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 4) goto yyfl_21_3;
if (yy_0_2[0] != 4) goto yyfl_21_3;
return 1;
yyfl_21_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 5) goto yyfl_21_4;
if (yy_0_2[0] != 5) goto yyfl_21_4;
return 1;
yyfl_21_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 7) goto yyfl_21_5;
if (yy_0_2[0] != 7) goto yyfl_21_5;
return 1;
yyfl_21_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 6) goto yyfl_21_6;
if (yy_0_2[0] != 6) goto yyfl_21_6;
return 1;
yyfl_21_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 8) goto yyfl_21_7;
if (yy_0_2[0] != 8) goto yyfl_21_7;
return 1;
yyfl_21_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 9) goto yyfl_21_8;
if (yy_0_2[0] != 9) goto yyfl_21_8;
return 1;
yyfl_21_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 11) goto yyfl_21_9;
if (yy_0_2[0] != 11) goto yyfl_21_9;
return 1;
yyfl_21_9 : ;
}
return 0;
}
int test_equal_keys(yyin_1, yyin_2)
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
if (! yyeq_Tp(yy_1_1, yy_1_2)) goto yyfl_24_1;
return 1;
yyfl_24_1 : ;
}
return 0;
}
int test_already_compared(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yyv_Tp3;
yy yy_0_3_1_1;
yy yyv_Tp4;
yy yy_0_3_1_2;
yy yyv_Pairs;
yy yy_0_3_2;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
if (yy_0_3[0] != 2) goto yyfl_25_1;
yy_0_3_1 = ((yy)yy_0_3[1]);
yy_0_3_2 = ((yy)yy_0_3[2]);
if (yy_0_3_1[0] != 1) goto yyfl_25_1;
yy_0_3_1_1 = ((yy)yy_0_3_1[1]);
yy_0_3_1_2 = ((yy)yy_0_3_1[2]);
yyv_Tp3 = yy_0_3_1_1;
yyv_Tp4 = yy_0_3_1_2;
yyv_Pairs = yy_0_3_2;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp3;
if (! test_equal_keys(yy_1_1, yy_1_2)) goto yyfl_25_1;
yy_2_1 = yyv_Tp2;
yy_2_2 = yyv_Tp4;
if (! test_equal_keys(yy_2_1, yy_2_2)) goto yyfl_25_1;
return 1;
yyfl_25_1 : ;
}
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yyv_Tp3;
yy yy_0_3_1_1;
yy yyv_Tp4;
yy yy_0_3_1_2;
yy yyv_Pairs;
yy yy_0_3_2;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
if (yy_0_3[0] != 2) goto yyfl_25_2;
yy_0_3_1 = ((yy)yy_0_3[1]);
yy_0_3_2 = ((yy)yy_0_3[2]);
if (yy_0_3_1[0] != 1) goto yyfl_25_2;
yy_0_3_1_1 = ((yy)yy_0_3_1[1]);
yy_0_3_1_2 = ((yy)yy_0_3_1[2]);
yyv_Tp3 = yy_0_3_1_1;
yyv_Tp4 = yy_0_3_1_2;
yyv_Pairs = yy_0_3_2;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! test_already_compared(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_25_2;
return 1;
yyfl_25_2 : ;
}
return 0;
}
int test_equal_tpdescr(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Sign1;
yy yy_0_1_1;
yy yyv_Size1;
yy yy_0_1_2;
yy yyv_Mode1;
yy yy_0_1_3;
yy yy_0_2;
yy yyv_Sign2;
yy yy_0_2_1;
yy yyv_Size2;
yy yy_0_2_2;
yy yyv_Mode2;
yy yy_0_2_3;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 13) goto yyfl_26_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign1 = yy_0_1_1;
yyv_Size1 = yy_0_1_2;
yyv_Mode1 = yy_0_1_3;
if (yy_0_2[0] != 13) goto yyfl_26_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yy_0_2_3 = ((yy)yy_0_2[3]);
yyv_Sign2 = yy_0_2_1;
yyv_Size2 = yy_0_2_2;
yyv_Mode2 = yy_0_2_3;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Sign1;
yy_1_2 = yyv_Sign2;
if (! compare_sign(yy_1_1, yy_1_2)) goto yyfl_26_1;
yy_2_1 = yyv_Size1;
yy_2_2 = yyv_Size2;
if (! compare_size(yy_2_1, yy_2_2)) goto yyfl_26_1;
yy_3_1 = yyv_Mode1;
yy_3_2 = yyv_Mode2;
if (! compare_mode(yy_3_1, yy_3_2)) goto yyfl_26_1;
return 1;
yyfl_26_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Qual1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Qual2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 12) goto yyfl_26_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Qual1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 12) goto yyfl_26_2;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Qual2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Qual1;
yy_1_2 = yyv_Qual2;
if (! compare_qualifiers(yy_1_1, yy_1_2)) goto yyfl_26_2;
yy_2_1 = yyv_Tp1;
yy_2_2 = yyv_Tp2;
yy_2_3 = yyv_Pairs;
if (! compare_types(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_2;
return 1;
yyfl_26_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yyv_Fields1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Fields2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 8) goto yyfl_26_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id1 = yy_0_1_1;
yyv_Fields1 = yy_0_1_2;
if (yy_0_2[0] != 8) goto yyfl_26_3;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Id2 = yy_0_2_1;
yyv_Fields2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! compare_IdOpt(yy_1_1, yy_1_2)) goto yyfl_26_3;
yy_2_1 = yyv_Fields1;
yy_2_2 = yyv_Fields2;
yy_2_3 = yyv_Pairs;
if (! compare_fields(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_3;
return 1;
yyfl_26_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yyv_Fields1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Fields2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 9) goto yyfl_26_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id1 = yy_0_1_1;
yyv_Fields1 = yy_0_1_2;
if (yy_0_2[0] != 9) goto yyfl_26_4;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Id2 = yy_0_2_1;
yyv_Fields2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! compare_IdOpt(yy_1_1, yy_1_2)) goto yyfl_26_4;
yy_2_1 = yyv_Fields1;
yy_2_2 = yyv_Fields2;
yy_2_3 = yyv_Pairs;
if (! compare_fields(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_4;
return 1;
yyfl_26_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 7) goto yyfl_26_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id1 = yy_0_1_1;
if (yy_0_2[0] != 7) goto yyfl_26_5;
yy_0_2_1 = ((yy)yy_0_2[1]);
yyv_Id2 = yy_0_2_1;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! equal_Ident(yy_1_1, yy_1_2)) goto yyfl_26_5;
return 1;
yyfl_26_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 6) goto yyfl_26_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id1 = yy_0_1_1;
if (yy_0_2[0] != 6) goto yyfl_26_6;
yy_0_2_1 = ((yy)yy_0_2[1]);
yyv_Id2 = yy_0_2_1;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! equal_Ident(yy_1_1, yy_1_2)) goto yyfl_26_6;
return 1;
yyfl_26_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Qual1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Qual2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 5) goto yyfl_26_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Qual1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 5) goto yyfl_26_7;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Qual2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Qual1;
yy_1_2 = yyv_Qual2;
if (! compare_qualifiers(yy_1_1, yy_1_2)) goto yyfl_26_7;
yy_2_1 = yyv_Tp1;
yy_2_2 = yyv_Tp2;
yy_2_3 = yyv_Pairs;
if (! compare_types(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_7;
return 1;
yyfl_26_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_C2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_26_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 2) goto yyfl_26_8;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_C2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_C1;
yy_1_2 = yyv_C2;
if (! compare_array_size(yy_1_1, yy_1_2)) goto yyfl_26_8;
yy_2_1 = yyv_Tp1;
yy_2_2 = yyv_Tp2;
yy_2_3 = yyv_Pairs;
if (! compare_types(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_8;
return 1;
yyfl_26_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_L1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_L2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 4) goto yyfl_26_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_L1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 4) goto yyfl_26_9;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_L2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_26_9;
return 1;
yyfl_26_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParamTypes1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_ParamTypes2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_26_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParamTypes1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 3) goto yyfl_26_10;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_ParamTypes2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_ParamTypes1;
yy_1_2 = yyv_ParamTypes2;
yy_1_3 = yyv_Pairs;
if (! compare_param_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_26_10;
yy_2_1 = yyv_Tp1;
yy_2_2 = yyv_Tp2;
yy_2_3 = yyv_Pairs;
if (! compare_types(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_26_10;
return 1;
yyfl_26_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParamTypes;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_L;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_26_11;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParamTypes = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 4) goto yyfl_26_11;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_L = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_26_11;
yy_2_1 = yyv_ParamTypes;
if (! test_fixed_number_of_parameters(yy_2_1)) goto yyfl_26_11;
return 1;
yyfl_26_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_L;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_ParamTypes;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 4) goto yyfl_26_12;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_L = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
if (yy_0_2[0] != 3) goto yyfl_26_12;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_ParamTypes = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_26_12;
yy_2_1 = yyv_ParamTypes;
if (! test_fixed_number_of_parameters(yy_2_1)) goto yyfl_26_12;
return 1;
yyfl_26_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 11) goto yyfl_26_13;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id1 = yy_0_1_1;
if (yy_0_2[0] != 11) goto yyfl_26_13;
yy_0_2_1 = ((yy)yy_0_2[1]);
yyv_Id2 = yy_0_2_1;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! equal_Ident(yy_1_1, yy_1_2)) goto yyfl_26_13;
return 1;
yyfl_26_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yyv_Ttp1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Ttp2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 10) goto yyfl_26_14;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id1 = yy_0_1_1;
yyv_Ttp1 = yy_0_1_2;
if (yy_0_2[0] != 10) goto yyfl_26_14;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Id2 = yy_0_2_1;
yyv_Ttp2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! compare_IdOpt(yy_1_1, yy_1_2)) goto yyfl_26_14;
yy_2_1 = yyv_Ttp1;
yy_2_2 = yyv_Ttp2;
if (! compare_amode(yy_2_1, yy_2_2)) goto yyfl_26_14;
return 1;
yyfl_26_14 : ;
}
return 0;
}
int test_fixed_number_of_parameters(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_IdOpt;
yy yy_0_1_1_1;
yy yyv_Tp;
yy yy_0_1_1_2;
yy yyv_StClass;
yy yy_0_1_1_3;
yy yyv_L;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_27_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 2) goto yyfl_27_1;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
yy_0_1_1_2 = ((yy)yy_0_1_1[2]);
yy_0_1_1_3 = ((yy)yy_0_1_1[3]);
yyv_IdOpt = yy_0_1_1_1;
yyv_Tp = yy_0_1_1_2;
yyv_StClass = yy_0_1_1_3;
yyv_L = yy_0_1_2;
yy_1_1 = yyv_L;
if (! test_fixed_number_of_parameters(yy_1_1)) goto yyfl_27_1;
return 1;
yyfl_27_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_27_2;
return 1;
yyfl_27_2 : ;
}
return 0;
}
int compare_types(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
if (! test_equal_keys(yy_1_1, yy_1_2)) goto yyfl_28_1;
return 1;
yyfl_28_1 : ;
}
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! test_already_compared(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_28_2;
return 1;
yyfl_28_2 : ;
}
{
yy yyb;
yy yyv_Tp1;
yy yy_0_1;
yy yyv_Tp2;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yyv_Descr1;
yy yy_1_2;
yy yy_2_1;
yy yyv_Descr2;
yy yy_2_2;
yy yy_3_1;
yy yy_3_2;
yy yy_3_3;
yy yy_3_3_1;
yy yy_3_3_1_1;
yy yy_3_3_1_2;
yy yy_3_3_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp1 = yy_0_1;
yyv_Tp2 = yy_0_2;
yyv_Pairs = yy_0_3;
yyb = yyh;
yyh += 6; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_Tp1;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_Descr1 = yy_1_2;
yy_2_1 = yyv_Tp2;
get_tp_descr(yy_2_1, &yy_2_2);
yyv_Descr2 = yy_2_2;
yy_3_1 = yyv_Descr1;
yy_3_2 = yyv_Descr2;
yy_3_3_1_1 = yyv_Tp1;
yy_3_3_1_2 = yyv_Tp2;
yy_3_3_1 = yyb + 3;
yy_3_3_1[0] = 1;
yy_3_3_1[1] = ((long)yy_3_3_1_1);
yy_3_3_1[2] = ((long)yy_3_3_1_2);
yy_3_3_2 = yyv_Pairs;
yy_3_3 = yyb + 0;
yy_3_3[0] = 2;
yy_3_3[1] = ((long)yy_3_3_1);
yy_3_3[2] = ((long)yy_3_3_2);
if (! test_equal_tpdescr(yy_3_1, yy_3_2, yy_3_3)) goto yyfl_28_3;
return 1;
yyfl_28_3 : ;
}
return 0;
}
int compare_sign(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 1) goto yyfl_29_1;
if (yy_0_2[0] != 1) goto yyfl_29_1;
return 1;
yyfl_29_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_29_2;
if (yy_0_2[0] != 2) goto yyfl_29_2;
return 1;
yyfl_29_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 3) goto yyfl_29_3;
if (yy_0_2[0] != 3) goto yyfl_29_3;
return 1;
yyfl_29_3 : ;
}
return 0;
}
int compare_size(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 1) goto yyfl_30_1;
if (yy_0_2[0] != 1) goto yyfl_30_1;
return 1;
yyfl_30_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_30_2;
if (yy_0_2[0] != 2) goto yyfl_30_2;
return 1;
yyfl_30_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 3) goto yyfl_30_3;
if (yy_0_2[0] != 3) goto yyfl_30_3;
return 1;
yyfl_30_3 : ;
}
return 0;
}
int compare_mode(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 6) goto yyfl_31_1;
if (yy_0_2[0] != 6) goto yyfl_31_1;
return 1;
yyfl_31_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_31_2;
if (yy_0_2[0] != 2) goto yyfl_31_2;
return 1;
yyfl_31_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 3) goto yyfl_31_3;
if (yy_0_2[0] != 3) goto yyfl_31_3;
return 1;
yyfl_31_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 4) goto yyfl_31_4;
if (yy_0_2[0] != 4) goto yyfl_31_4;
return 1;
yyfl_31_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 5) goto yyfl_31_5;
if (yy_0_2[0] != 5) goto yyfl_31_5;
return 1;
yyfl_31_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 1) goto yyfl_31_6;
if (yy_0_2[0] != 1) goto yyfl_31_6;
return 1;
yyfl_31_6 : ;
}
return 0;
}
int compare_qualifiers(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 4) goto yyfl_32_1;
if (yy_0_2[0] != 4) goto yyfl_32_1;
return 1;
yyfl_32_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_32_2;
if (yy_0_2[0] != 2) goto yyfl_32_2;
return 1;
yyfl_32_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 3) goto yyfl_32_3;
if (yy_0_2[0] != 3) goto yyfl_32_3;
return 1;
yyfl_32_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 1) goto yyfl_32_4;
if (yy_0_2[0] != 1) goto yyfl_32_4;
return 1;
yyfl_32_4 : ;
}
{
yy yyb;
yy yyv_Q1;
yy yy_0_1;
yy yyv_Q2;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Q1 = yy_0_1;
yyv_Q2 = yy_0_2;
return 1;
yyfl_32_5 : ;
}
return 0;
}
int compare_IdOpt(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 1) goto yyfl_33_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id1 = yy_0_1_1;
if (yy_0_2[0] != 1) goto yyfl_33_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yyv_Id2 = yy_0_2_1;
yy_1_1 = yyv_Id1;
yy_1_2 = yyv_Id2;
if (! equal_Ident(yy_1_1, yy_1_2)) goto yyfl_33_1;
return 1;
yyfl_33_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_33_2;
if (yy_0_2[0] != 2) goto yyfl_33_2;
return 1;
yyfl_33_2 : ;
}
return 0;
}
int compare_fields(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_34_1;
if (yy_0_2[0] != 1) goto yyfl_34_1;
yyv_Pairs = yy_0_3;
return 1;
yyfl_34_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Fields1;
yy yy_0_1_1;
yy yyv_Field1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_Fields2;
yy yy_0_2_1;
yy yyv_Field2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_34_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Fields1 = yy_0_1_1;
yyv_Field1 = yy_0_1_2;
if (yy_0_2[0] != 2) goto yyfl_34_2;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_Fields2 = yy_0_2_1;
yyv_Field2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Fields1;
yy_1_2 = yyv_Fields2;
yy_1_3 = yyv_Pairs;
if (! compare_fields(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_34_2;
yy_2_1 = yyv_Field1;
yy_2_2 = yyv_Field2;
yy_2_3 = yyv_Pairs;
if (! compare_field(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_34_2;
return 1;
yyfl_34_2 : ;
}
return 0;
}
int compare_field(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yyv_W1;
yy yy_0_1_3;
yy yyv_O1;
yy yy_0_1_4;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_W2;
yy yy_0_2_3;
yy yyv_O2;
yy yy_0_2_4;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_35_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Id1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
yyv_W1 = yy_0_1_3;
yyv_O1 = yy_0_1_4;
if (yy_0_2[0] != 1) goto yyfl_35_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yy_0_2_3 = ((yy)yy_0_2[3]);
yy_0_2_4 = ((yy)yy_0_2[4]);
yyv_Id2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_W2 = yy_0_2_3;
yyv_O2 = yy_0_2_4;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_35_1;
return 1;
yyfl_35_1 : ;
}
return 0;
}
int compare_array_size(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_C1;
yy yy_0_1;
yy yyv_C2;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_C1 = yy_0_1;
yyv_C2 = yy_0_2;
yy_1_1 = yyv_C1;
yy_1_2 = yyv_C2;
if (! is_equal(yy_1_1, yy_1_2)) goto yyfl_36_1;
return 1;
yyfl_36_1 : ;
}
{
yy yyb;
yy yyv_C1;
yy yy_0_1;
yy yyv_C2;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_C1 = yy_0_1;
yyv_C2 = yy_0_2;
yy_1_1 = yyv_C1;
if (! test_UNDEF_int(yy_1_1)) goto yyfl_36_2;
return 1;
yyfl_36_2 : ;
}
{
yy yyb;
yy yyv_C1;
yy yy_0_1;
yy yyv_C2;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_C1 = yy_0_1;
yyv_C2 = yy_0_2;
yy_1_1 = yyv_C2;
if (! test_UNDEF_int(yy_1_1)) goto yyfl_36_3;
return 1;
yyfl_36_3 : ;
}
return 0;
}
int compare_param_types(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_37_1;
if (yy_0_2[0] != 1) goto yyfl_37_1;
yyv_Pairs = yy_0_3;
return 1;
yyfl_37_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParamType1;
yy yy_0_1_1;
yy yyv_ParamTypes1;
yy yy_0_1_2;
yy yy_0_2;
yy yyv_ParamType2;
yy yy_0_2_1;
yy yyv_ParamTypes2;
yy yy_0_2_2;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_37_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParamType1 = yy_0_1_1;
yyv_ParamTypes1 = yy_0_1_2;
if (yy_0_2[0] != 2) goto yyfl_37_2;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_ParamType2 = yy_0_2_1;
yyv_ParamTypes2 = yy_0_2_2;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_ParamTypes1;
yy_1_2 = yyv_ParamTypes2;
yy_1_3 = yyv_Pairs;
if (! compare_param_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_37_2;
yy_2_1 = yyv_ParamType1;
yy_2_2 = yyv_ParamType2;
yy_2_3 = yyv_Pairs;
if (! compare_param_type(yy_2_1, yy_2_2, yy_2_3)) goto yyfl_37_2;
return 1;
yyfl_37_2 : ;
}
return 0;
}
int compare_param_type(yyin_1, yyin_2, yyin_3)
yy yyin_1;
yy yyin_2;
yy yyin_3;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id1;
yy yy_0_1_1;
yy yyv_Tp1;
yy yy_0_1_2;
yy yyv_C1;
yy yy_0_1_3;
yy yy_0_2;
yy yyv_Id2;
yy yy_0_2_1;
yy yyv_Tp2;
yy yy_0_2_2;
yy yyv_C2;
yy yy_0_2_3;
yy yyv_Pairs;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_38_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Id1 = yy_0_1_1;
yyv_Tp1 = yy_0_1_2;
yyv_C1 = yy_0_1_3;
if (yy_0_2[0] != 2) goto yyfl_38_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yy_0_2_3 = ((yy)yy_0_2[3]);
yyv_Id2 = yy_0_2_1;
yyv_Tp2 = yy_0_2_2;
yyv_C2 = yy_0_2_3;
yyv_Pairs = yy_0_3;
yy_1_1 = yyv_Tp1;
yy_1_2 = yyv_Tp2;
yy_1_3 = yyv_Pairs;
if (! compare_types(yy_1_1, yy_1_2, yy_1_3)) goto yyfl_38_1;
return 1;
yyfl_38_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yyv_Pairs;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_38_2;
if (yy_0_2[0] != 1) goto yyfl_38_2;
yyv_Pairs = yy_0_3;
return 1;
yyfl_38_2 : ;
}
return 0;
}
