typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Unparse", l);
}
UnparseUnit(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yyv_Name;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_6_1;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
get_target_file_name(&yy_1_1);
yyv_Name = yy_1_1;
yy_2_1 = yyv_Name;
Tell(yy_2_1);
yy_3_1 = yyv_Name;
TdeclBuf(yy_3_1);
outputJoinPointStrDecl();
output_exception_cflow_handler_func_decl();
yy_6_1 = yyv_D;
code_external_declaration_list(yy_6_1);
true_nl();
output_cflow_function();
true_nl();
Told();
TcloseDeclBuf();
return;
}
}
code_external_declaration_list(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Decl;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_2_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Decl = yy_0_1_2;
yy_1_1 = yyv_List;
code_external_declaration_list(yy_1_1);
yy_2_1 = yyv_Decl;
code_external_decl(yy_2_1);
return;
yyfl_2_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_2_2;
return;
yyfl_2_2 : ;
}
yyErr(2,45);
}
code_external_decl(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Decl;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
yyv_Decl = yy_0_1;
yy_1_1 = yyv_Decl;
ccd(yy_1_1);
nl();
return;
}
}
ccd(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_4_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yy_1_1 = ((yy)"\n#");
s(yy_1_1);
yy_2_1 = yyv_D;
f(yy_2_1);
yy_3_1 = ((yy)"\n");
s(yy_3_1);
return;
yyfl_4_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_4_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yy_1_1 = yyv_D;
ccd(yy_1_1);
yy_2_1 = ((yy)";");
s(yy_2_1);
return;
yyfl_4_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Desig;
yy yy_0_1_1;
yy yyv_Init;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 172) goto yyfl_4_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Desig = yy_0_1_1;
yyv_Init = yy_0_1_2;
yy_1_1 = yyv_Desig;
ccd(yy_1_1);
yy_2_1 = yyv_Init;
ccd(yy_2_1);
return;
yyfl_4_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 165) goto yyfl_4_4;
return;
yyfl_4_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Desig_list;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 166) goto yyfl_4_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Desig_list = yy_0_1_1;
yy_1_1 = yyv_Desig_list;
ccd(yy_1_1);
yy_2_1 = ((yy)" = ");
s(yy_2_1);
return;
yyfl_4_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 167) goto yyfl_4_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
id(yy_1_1);
yy_2_1 = ((yy)":");
s(yy_2_1);
return;
yyfl_4_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 168) goto yyfl_4_7;
return;
yyfl_4_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Desig;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 169) goto yyfl_4_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Desig = yy_0_1_2;
yy_1_1 = yyv_List;
ccd(yy_1_1);
yy_2_1 = yyv_Desig;
ccd(yy_2_1);
return;
yyfl_4_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 170) goto yyfl_4_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expr = yy_0_1_1;
yy_1_1 = ((yy)"[");
s(yy_1_1);
yy_2_1 = yyv_Expr;
ccE(yy_2_1);
yy_3_1 = ((yy)"]");
s(yy_3_1);
return;
yyfl_4_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 171) goto yyfl_4_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = ((yy)".");
s(yy_1_1);
yy_2_1 = yyv_Ident;
id(yy_2_1);
return;
yyfl_4_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclSpecifiersOpt;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yyv_DeclarationListOpt;
yy yy_0_1_3;
yy yyv_Statement;
yy yy_0_1_4;
yy yyv_Pos;
yy yy_0_1_5;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy yy_7_1;
yy yy_9_1;
yy yy_10_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_4_11;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yy_0_1_5 = ((yy)yy_0_1[5]);
yyv_DeclSpecifiersOpt = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yyv_DeclarationListOpt = yy_0_1_3;
yyv_Statement = yy_0_1_4;
yyv_Pos = yy_0_1_5;
yy_1_1 = yyv_Pos;
LineInfo(yy_1_1);
yy_2_1 = yyv_DeclSpecifiersOpt;
ccd(yy_2_1);
yy_3_1 = yyv_Declarator;
ccd(yy_3_1);
nl();
yy_5_1 = yyv_DeclarationListOpt;
ccd(yy_5_1);
nl();
yy_7_1 = ((yy)"{");
s(yy_7_1);
NL();
yy_9_1 = yyv_Statement;
ccS(yy_9_1);
yy_10_1 = ((yy)"}");
s(yy_10_1);
NL();
return;
yyfl_4_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Keyword;
yy yy_0_1_1;
yy yyv_PCName;
yy yy_0_1_2;
yy yyv_ParamList;
yy yy_0_1_3;
yy yyv_Pointcut;
yy yy_0_1_4;
yy yyv_Pos;
yy yy_0_1_5;
yy yy_1_1;
yy yy_4_1;
yy yyv_Str1;
yy yy_4_2;
yy yy_5_1;
yy yy_5_2;
yy yy_6_1;
yy yyv_Str2;
yy yy_6_2;
yy yy_7_1;
yy yy_9_1;
yy yy_10_1;
yy yy_13_1;
yy yy_14_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_4_12;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yy_0_1_5 = ((yy)yy_0_1[5]);
yyv_Keyword = yy_0_1_1;
yyv_PCName = yy_0_1_2;
yyv_ParamList = yy_0_1_3;
yyv_Pointcut = yy_0_1_4;
yyv_Pos = yy_0_1_5;
yy_1_1 = yyv_Pos;
LineInfo(yy_1_1);
startPointcutInfo();
startAdFuncHeader();
yy_4_1 = yyv_Keyword;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str1 = yy_4_2;
yy_5_1 = yyv_Str1;
yy_5_2 = ((yy)"pointcut");
assertKeyword(yy_5_1, yy_5_2);
yy_6_1 = yyv_PCName;
GetRepr2(yy_6_1, &yy_6_2);
yyv_Str2 = yy_6_2;
yy_7_1 = yyv_Str2;
setPointcutName(yy_7_1);
turnOffOutput();
yy_9_1 = ((yy)"adfunc");
initDeclCollection(yy_9_1);
yy_10_1 = yyv_ParamList;
ccd(yy_10_1);
endACParamDeclCollection();
endAdFuncHeader();
yy_13_1 = ((yy)0);
pushAChildForCompPC(yy_13_1);
yy_14_1 = yyv_Pointcut;
ccd(yy_14_1);
popChild();
endPointcutInfo();
turnOnOutput();
return;
yyfl_4_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 57) goto yyfl_4_13;
yy_1_1 = ((yy)" asm ");
s(yy_1_1);
return;
yyfl_4_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 58) goto yyfl_4_14;
yy_1_1 = ((yy)" __asm ");
s(yy_1_1);
return;
yyfl_4_14 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 59) goto yyfl_4_15;
yy_1_1 = ((yy)" __asm__ ");
s(yy_1_1);
return;
yyfl_4_15 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_S;
yy yy_0_1_1;
yy yyv_O;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 60) goto yyfl_4_16;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_S = yy_0_1_1;
yyv_O = yy_0_1_2;
yy_1_1 = yyv_S;
ccE(yy_1_1);
yy_2_1 = yyv_O;
ccd(yy_2_1);
return;
yyfl_4_16 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_O;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 61) goto yyfl_4_17;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_O = yy_0_1_1;
yy_1_1 = ((yy)" : ");
s(yy_1_1);
yy_2_1 = yyv_O;
ccd(yy_2_1);
return;
yyfl_4_17 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_V;
yy yy_0_1_1;
yy yyv_O;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 62) goto yyfl_4_18;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_V = yy_0_1_1;
yyv_O = yy_0_1_2;
yy_1_1 = yyv_V;
ccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_O;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 161) goto yyfl_4_18_2_1;
goto yysl_4_18_2;
yyfl_4_18_2_1 : ;
yy_2_2_1_1 = ((yy)" : ");
s(yy_2_2_1_1);
yy_2_2_2_1 = yyv_O;
ccd(yy_2_2_2_1);
goto yysl_4_18_2;
yysl_4_18_2 : ;
yyb = yysb;
}
return;
yyfl_4_18 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_V;
yy yy_0_1_1;
yy yyv_O;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 63) goto yyfl_4_19;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_V = yy_0_1_1;
yyv_O = yy_0_1_2;
yy_1_1 = yyv_V;
ccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_O;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 161) goto yyfl_4_19_2_1;
goto yysl_4_19_2;
yyfl_4_19_2_1 : ;
yy_2_2_1_1 = ((yy)" : ");
s(yy_2_2_1_1);
yy_2_2_2_1 = yyv_O;
ccd(yy_2_2_2_1);
goto yysl_4_19_2;
yysl_4_19_2 : ;
yyb = yysb;
}
return;
yyfl_4_19 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_V;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 64) goto yyfl_4_20;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_V = yy_0_1_1;
yy_1_1 = yyv_V;
ccd(yy_1_1);
return;
yyfl_4_20 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 96) goto yyfl_4_21;
return;
yyfl_4_21 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 161) goto yyfl_4_22;
return;
yyfl_4_22 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_OperandList;
yy yy_0_1_1;
yy yyv_Operand;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 160) goto yyfl_4_23;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_OperandList = yy_0_1_1;
yyv_Operand = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_OperandList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 161) goto yyfl_4_23_1_1;
goto yysl_4_23_1;
yyfl_4_23_1_1 : ;
yy_1_2_1_1 = yyv_OperandList;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_23_1;
yysl_4_23_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Operand;
ccd(yy_2_1);
return;
yyfl_4_23 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_SymLink;
yy yy_0_1_1;
yy yyv_Str;
yy yy_0_1_2;
yy yyv_Expr;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 162) goto yyfl_4_24;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_SymLink = yy_0_1_1;
yyv_Str = yy_0_1_2;
yyv_Expr = yy_0_1_3;
yy_1_1 = yyv_SymLink;
ccE(yy_1_1);
yy_2_1 = yyv_Str;
ccE(yy_2_1);
yy_3_1 = ((yy)"(");
s(yy_3_1);
yy_4_1 = yyv_Expr;
ccE(yy_4_1);
yy_5_1 = ((yy)")");
s(yy_5_1);
return;
yyfl_4_24 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 163) goto yyfl_4_25;
return;
yyfl_4_25 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ClobRegList;
yy yy_0_1_1;
yy yyv_Str;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 164) goto yyfl_4_26;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ClobRegList = yy_0_1_1;
yyv_Str = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ClobRegList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 163) goto yyfl_4_26_1_1;
goto yysl_4_26_1;
yyfl_4_26_1_1 : ;
yy_1_2_1_1 = yyv_ClobRegList;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_26_1;
yysl_4_26_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Str;
ccE(yy_2_1);
return;
yyfl_4_26 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclarationSpecifiers;
yy yy_0_1_1;
yy yyv_InitDeclaratorListOpt;
yy yy_0_1_2;
yy yyv_Pos;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_2_1;
yy yy_2_2_1_1;
yy yy_2_2_1_2;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_4_27;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_InitDeclaratorListOpt = yy_0_1_2;
yyv_Pos = yy_0_1_3;
yy_1_1 = yyv_Pos;
LineInfo(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_InitDeclaratorListOpt;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 19) goto yyfl_4_27_2_1;
yy_2_1_2_1 = yyv_DeclarationSpecifiers;
ccd(yy_2_1_2_1);
goto yysl_4_27_2;
yyfl_4_27_2_1 : ;
yy_2_2_1_1 = yyv_DeclarationSpecifiers;
yy_2_2_1_2 = yyv_InitDeclaratorListOpt;
EmitDeclaration(yy_2_2_1_1, yy_2_2_1_2);
goto yysl_4_27_2;
yysl_4_27_2 : ;
yyb = yysb;
}
yy_3_1 = ((yy)";");
s(yy_3_1);
return;
yyfl_4_27 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclarationList;
yy yy_0_1_1;
yy yyv_Declaration;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_4_28;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationList = yy_0_1_1;
yyv_Declaration = yy_0_1_2;
yy_1_1 = yyv_DeclarationList;
ccd(yy_1_1);
yy_2_1 = yyv_Declaration;
ccd(yy_2_1);
nl();
return;
yyfl_4_28 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 14) goto yyfl_4_29;
return;
yyfl_4_29 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 15) goto yyfl_4_30;
return;
yyfl_4_30 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccExtension;
yy yy_0_1_1;
yy yyv_DeclSpecifiers;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 16) goto yyfl_4_31;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccExtension = yy_0_1_1;
yyv_DeclSpecifiers = yy_0_1_2;
yy_1_1 = yyv_GccExtension;
ccd(yy_1_1);
yy_2_1 = yyv_DeclSpecifiers;
ccd(yy_2_1);
return;
yyfl_4_31 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_4_32;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Specifier;
ccd(yy_1_1);
yy_2_1 = yyv_List;
ccd(yy_2_1);
return;
yyfl_4_32 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 46) goto yyfl_4_33;
return;
yyfl_4_33 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 47) goto yyfl_4_34;
yy_1_1 = ((yy)" __extension__ ");
s(yy_1_1);
return;
yyfl_4_34 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_4_35;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 19) goto yyfl_4_35_1_1;
goto yysl_4_35_1;
yyfl_4_35_1_1 : ;
yy_1_2_1_1 = yyv_List;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_35_1;
yysl_4_35_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Declarator;
ccd(yy_2_1);
return;
yyfl_4_35 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_4_36;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccAttr = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_GccAttr;
ccd(yy_1_1);
yy_2_1 = yyv_Declarator;
ccd(yy_2_1);
return;
yyfl_4_36 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_GccAttr;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 22) goto yyfl_4_37;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_GccAttr = yy_0_1_2;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
yy_2_1 = yyv_GccAttr;
ccd(yy_2_1);
return;
yyfl_4_37 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 24) goto yyfl_4_38;
return;
yyfl_4_38 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_SpecList;
yy yy_0_1_1;
yy yyv_Spec;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 25) goto yyfl_4_39;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_SpecList = yy_0_1_1;
yyv_Spec = yy_0_1_2;
yy_1_1 = yyv_SpecList;
ccd(yy_1_1);
yy_2_1 = yyv_Spec;
ccd(yy_2_1);
return;
yyfl_4_39 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_4_40;
return;
yyfl_4_40 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_Initializer;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_4_41;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_Initializer = yy_0_1_2;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
yy_2_1 = ((yy)" = ");
s(yy_2_1);
yy_3_1 = yyv_Initializer;
ccd(yy_3_1);
return;
yyfl_4_41 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_4_42;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Declarator = yy_0_1_1;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
return;
yyfl_4_42 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Identifier;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 27) goto yyfl_4_43;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Identifier = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 28) goto yyfl_4_43_1_1;
goto yysl_4_43_1;
yyfl_4_43_1_1 : ;
yy_1_2_1_1 = yyv_List;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_43_1;
yysl_4_43_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Identifier;
id(yy_2_1);
return;
yyfl_4_43 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Type;
yy yy_0_1_1;
yy yyv_Names;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_4_44;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Type = yy_0_1_1;
yyv_Names = yy_0_1_2;
yy_1_1 = yyv_Type;
ccd(yy_1_1);
yy_2_1 = yyv_Names;
ccd(yy_2_1);
return;
yyfl_4_44 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Identifier;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_2_1;
yy yyv_Str;
yy yy_2_1_2_2;
yy yy_2_1_3_1;
yy yy_2_2_1_1;
yy yy_2_2_1_2;
yy yy_2_2_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_4_45;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Identifier = yy_0_1_2;
yy_1_1 = yyv_List;
ccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_List;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 7) goto yyfl_4_45_2_1;
yy_2_1_2_1 = yyv_Identifier;
GetRepr2(yy_2_1_2_1, &yy_2_1_2_2);
yyv_Str = yy_2_1_2_2;
yy_2_1_3_1 = yyv_Str;
setACName(yy_2_1_3_1);
goto yysl_4_45_2;
yyfl_4_45_2_1 : ;
yy_2_2_1_1 = yyv_Identifier;
GetRepr2(yy_2_2_1_1, &yy_2_2_1_2);
yyv_Str = yy_2_2_1_2;
yy_2_2_2_1 = yyv_Str;
appendId(yy_2_2_2_1);
goto yysl_4_45_2;
yysl_4_45_2 : ;
yyb = yysb;
}
return;
yyfl_4_45 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_4_46;
return;
yyfl_4_46 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 28) goto yyfl_4_47;
return;
yyfl_4_47 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Pointer;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_4_48;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Pointer = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_Pointer;
ccd(yy_1_1);
yy_2_1 = yyv_Declarator;
ccd(yy_2_1);
return;
yyfl_4_48 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 30) goto yyfl_4_49;
return;
yyfl_4_49 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 31) goto yyfl_4_50;
return;
yyfl_4_50 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParenDecl;
yy yy_0_1_1;
yy yyv_Params;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yyv_Tp;
yy yy_1_1_1_2_1;
yy yy_1_1_2_1;
yy yy_1_1_4_1;
yy yy_1_1_6_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 116) goto yyfl_4_51;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParenDecl = yy_0_1_1;
yyv_Params = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParenDecl;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 114) goto yyfl_4_51_1_1;
yy_1_1_1_2_1 = ((yy)yy_1_1_1_2[1]);
yyv_Tp = yy_1_1_1_2_1;
yy_1_1_2_1 = ((yy)"(");
s(yy_1_1_2_1);
enter_paren_declarator();
yy_1_1_4_1 = yyv_Tp;
ccd(yy_1_1_4_1);
leave_paren_declarator();
yy_1_1_6_1 = ((yy)")");
s(yy_1_1_6_1);
goto yysl_4_51_1;
yyfl_4_51_1_1 : ;
goto yysl_4_51_1;
yysl_4_51_1 : ;
yyb = yysb;
}
yy_2_1 = ((yy)"(");
s(yy_2_1);
yy_3_1 = yyv_Params;
ccd(yy_3_1);
yy_4_1 = ((yy)")");
s(yy_4_1);
return;
yyfl_4_51 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TypeQualifierList;
yy yy_0_1_1;
yy yyv_Pointer;
yy yy_0_1_2;
yy yy_1_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 32) goto yyfl_4_52;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TypeQualifierList = yy_0_1_1;
yyv_Pointer = yy_0_1_2;
yy_1_1 = ((yy)"*");
s(yy_1_1);
setACTypePointer();
yy_3_1 = yyv_TypeQualifierList;
ccd(yy_3_1);
yy_4_1 = yyv_Pointer;
ccd(yy_4_1);
return;
yyfl_4_52 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_GccAttribute;
yy yy_0_1_2;
yy yyv_Flag;
yy yy_1_1_1_1;
yy yy_1_1_2_1;
yy yy_1_1_2_2;
yy yy_1_1_3_1;
yy yy_1_2_1_1;
yy yyv_Str;
yy yy_1_2_1_2;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 33) goto yyfl_4_53;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Ident = yy_0_1_1;
yyv_GccAttribute = yy_0_1_2;
{
yy yysb = yyb;
isPointcutInfo(&yy_1_1_1_1);
yyv_Flag = yy_1_1_1_1;
yy_1_1_2_1 = yyv_Flag;
yy_1_1_2_2 = ((yy)0);
if ((long)yy_1_1_2_1 != (long)yy_1_1_2_2) goto yyfl_4_53_1_1;
yy_1_1_3_1 = yyv_Ident;
id(yy_1_1_3_1);
goto yysl_4_53_1;
yyfl_4_53_1_1 : ;
yy_1_2_1_1 = yyv_Ident;
GetRepr2(yy_1_2_1_1, &yy_1_2_1_2);
yyv_Str = yy_1_2_1_2;
yy_1_2_2_1 = yyv_Str;
setACName(yy_1_2_2_1);
goto yysl_4_53_1;
yysl_4_53_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_GccAttribute;
ccd(yy_2_1);
return;
yyfl_4_53 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_Post_spec;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 38) goto yyfl_4_54;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_Post_spec = yy_0_1_2;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
yy_2_1 = yyv_Post_spec;
ccd(yy_2_1);
return;
yyfl_4_54 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 48) goto yyfl_4_55;
return;
yyfl_4_55 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_MultiAttributes;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 66) goto yyfl_4_56;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_MultiAttributes = yy_0_1_1;
yy_1_1 = yyv_MultiAttributes;
ccd(yy_1_1);
return;
yyfl_4_56 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_OneAttribute;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 65) goto yyfl_4_57;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_OneAttribute = yy_0_1_2;
yy_1_1 = yyv_List;
ccd(yy_1_1);
yy_2_1 = yyv_OneAttribute;
ccd(yy_2_1);
return;
yyfl_4_57 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttrList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 49) goto yyfl_4_58;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttrList = yy_0_1_1;
yy_1_1 = ((yy)" __attribute__ ");
s(yy_1_1);
yy_2_1 = ((yy)" (( ");
s(yy_2_1);
yy_3_1 = yyv_GccAttrList;
ccd(yy_3_1);
yy_4_1 = ((yy)" )) ");
s(yy_4_1);
return;
yyfl_4_58 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttrList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 50) goto yyfl_4_59;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttrList = yy_0_1_1;
yy_1_1 = ((yy)" __attribute ");
s(yy_1_1);
yy_2_1 = ((yy)" (( ");
s(yy_2_1);
yy_3_1 = yyv_GccAttrList;
ccd(yy_3_1);
yy_4_1 = ((yy)" )) ");
s(yy_4_1);
return;
yyfl_4_59 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_GccAttr;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 51) goto yyfl_4_60;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 52) goto yyfl_4_60;
yyv_GccAttr = yy_0_1_2;
yy_1_1 = yyv_GccAttr;
ccd(yy_1_1);
return;
yyfl_4_60 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttrList;
yy yy_0_1_1;
yy yyv_GccAttr;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 51) goto yyfl_4_61;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccAttrList = yy_0_1_1;
yyv_GccAttr = yy_0_1_2;
yy_1_1 = yyv_GccAttrList;
ccd(yy_1_1);
yy_2_1 = ((yy)" , ");
s(yy_2_1);
yy_3_1 = yyv_GccAttr;
ccd(yy_3_1);
return;
yyfl_4_61 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttrId;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 53) goto yyfl_4_62;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttrId = yy_0_1_1;
yy_1_1 = yyv_GccAttrId;
id(yy_1_1);
return;
yyfl_4_62 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_KeyWord;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 54) goto yyfl_4_63;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_KeyWord = yy_0_1_1;
yy_1_1 = yyv_KeyWord;
ccd(yy_1_1);
return;
yyfl_4_63 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_ExprList;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 55) goto yyfl_4_64;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id = yy_0_1_1;
yyv_ExprList = yy_0_1_2;
yy_1_1 = yyv_Id;
id(yy_1_1);
yy_2_1 = ((yy)" ( ");
s(yy_2_1);
yy_3_1 = yyv_ExprList;
ccE(yy_3_1);
yy_4_1 = ((yy)" ) ");
s(yy_4_1);
return;
yyfl_4_64 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yy_1_1;
yy yy_3_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 34) goto yyfl_4_65;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Declarator = yy_0_1_1;
yy_1_1 = ((yy)"(");
s(yy_1_1);
enter_paren_declarator();
yy_3_1 = yyv_Declarator;
ccd(yy_3_1);
leave_paren_declarator();
yy_5_1 = ((yy)")");
s(yy_5_1);
return;
yyfl_4_65 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_ConstExprOpt;
yy yy_0_1_2;
yy yy_1_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 35) goto yyfl_4_66;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_ConstExprOpt = yy_0_1_2;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
setACTypePointer();
yy_3_1 = ((yy)"[");
s(yy_3_1);
yy_4_1 = yyv_ConstExprOpt;
ccE(yy_4_1);
yy_5_1 = ((yy)"]");
s(yy_5_1);
return;
yyfl_4_66 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_ParameterTypeList;
yy yy_0_1_2;
yy yyv_GccAttributeList;
yy yy_0_1_3;
yy yy_1_1;
yy yyv_Flag;
yy yy_2_1_1_1;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yy_2_1_3_1;
yy yy_2_1_4_1;
yy yy_2_1_5_1;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy yy_2_2_2_2;
yy yy_2_2_3_1;
yy yy_2_2_4_1;
yy yy_2_2_5_1;
yy yy_2_3_1_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 36) goto yyfl_4_67;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Declarator = yy_0_1_1;
yyv_ParameterTypeList = yy_0_1_2;
yyv_GccAttributeList = yy_0_1_3;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
{
yy yysb = yyb;
isAdFuncHeader(&yy_2_1_1_1);
yyv_Flag = yy_2_1_1_1;
yy_2_1_2_1 = yyv_Flag;
yy_2_1_2_2 = ((yy)1);
if ((long)yy_2_1_2_1 != (long)yy_2_1_2_2) goto yyfl_4_67_2_1;
yy_2_1_3_1 = ((yy)"(");
s(yy_2_1_3_1);
yy_2_1_4_1 = yyv_ParameterTypeList;
ccd(yy_2_1_4_1);
yy_2_1_5_1 = ((yy)")");
s(yy_2_1_5_1);
goto yysl_4_67_2;
yyfl_4_67_2_1 : ;
isPointcutInfo(&yy_2_2_1_1);
yyv_Flag = yy_2_2_1_1;
yy_2_2_2_1 = yyv_Flag;
yy_2_2_2_2 = ((yy)0);
if ((long)yy_2_2_2_1 != (long)yy_2_2_2_2) goto yyfl_4_67_2_2;
yy_2_2_3_1 = ((yy)"(");
s(yy_2_2_3_1);
yy_2_2_4_1 = yyv_ParameterTypeList;
ccd(yy_2_2_4_1);
yy_2_2_5_1 = ((yy)")");
s(yy_2_2_5_1);
goto yysl_4_67_2;
yyfl_4_67_2_2 : ;
yy_2_3_1_1 = yyv_ParameterTypeList;
ccd(yy_2_3_1_1);
goto yysl_4_67_2;
yysl_4_67_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_GccAttributeList;
ccd(yy_3_1);
return;
yyfl_4_67 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_IdentListOpt;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Flag;
yy yy_2_1_1_1;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yy_2_1_3_1;
yy yy_2_1_4_1;
yy yy_2_1_5_1;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy yy_2_2_2_2;
yy yy_2_2_3_1;
yy yy_2_2_4_1;
yy yy_2_2_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 37) goto yyfl_4_68;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_IdentListOpt = yy_0_1_2;
yy_1_1 = yyv_Declarator;
ccd(yy_1_1);
{
yy yysb = yyb;
isAdFuncHeader(&yy_2_1_1_1);
yyv_Flag = yy_2_1_1_1;
yy_2_1_2_1 = yyv_Flag;
yy_2_1_2_2 = ((yy)1);
if ((long)yy_2_1_2_1 != (long)yy_2_1_2_2) goto yyfl_4_68_2_1;
yy_2_1_3_1 = ((yy)"(");
s(yy_2_1_3_1);
yy_2_1_4_1 = yyv_IdentListOpt;
ccd(yy_2_1_4_1);
yy_2_1_5_1 = ((yy)")");
s(yy_2_1_5_1);
goto yysl_4_68_2;
yyfl_4_68_2_1 : ;
isPointcutInfo(&yy_2_2_1_1);
yyv_Flag = yy_2_2_1_1;
yy_2_2_2_1 = yyv_Flag;
yy_2_2_2_2 = ((yy)0);
if ((long)yy_2_2_2_1 != (long)yy_2_2_2_2) goto yyfl_4_68_2_2;
yy_2_2_3_1 = ((yy)"(");
s(yy_2_2_3_1);
yy_2_2_4_1 = yyv_IdentListOpt;
ccd(yy_2_2_4_1);
yy_2_2_5_1 = ((yy)")");
s(yy_2_2_5_1);
goto yysl_4_68_2;
yyfl_4_68_2_2 : ;
goto yysl_4_68_2;
yysl_4_68_2 : ;
yyb = yysb;
}
return;
yyfl_4_68 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Class;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 39) goto yyfl_4_69;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Class = yy_0_1_1;
yy_1_1 = yyv_Class;
ccd(yy_1_1);
return;
yyfl_4_69 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 40) goto yyfl_4_70;
return;
yyfl_4_70 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 41) goto yyfl_4_71;
yy_1_1 = ((yy)"auto ");
s(yy_1_1);
return;
yyfl_4_71 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 42) goto yyfl_4_72;
yy_1_1 = ((yy)"register ");
s(yy_1_1);
return;
yyfl_4_72 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 43) goto yyfl_4_73;
yy_1_1 = ((yy)"static ");
s(yy_1_1);
return;
yyfl_4_73 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 44) goto yyfl_4_74;
yy_1_1 = ((yy)"extern ");
s(yy_1_1);
return;
yyfl_4_74 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 45) goto yyfl_4_75;
yy_1_1 = ((yy)"typedef ");
s(yy_1_1);
setTypedefTargetName();
return;
yyfl_4_75 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 67) goto yyfl_4_76;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Specifier = yy_0_1_1;
yy_1_1 = yyv_Specifier;
ccd(yy_1_1);
return;
yyfl_4_76 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 68) goto yyfl_4_77;
yy_1_1 = ((yy)"void ");
s(yy_1_1);
yy_2_1 = ((yy)"void");
setACType(yy_2_1);
return;
yyfl_4_77 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 69) goto yyfl_4_78;
yy_1_1 = ((yy)"char ");
s(yy_1_1);
yy_2_1 = ((yy)"char");
setACType(yy_2_1);
return;
yyfl_4_78 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 70) goto yyfl_4_79;
yy_1_1 = ((yy)"short ");
s(yy_1_1);
yy_2_1 = ((yy)"short");
setACType(yy_2_1);
return;
yyfl_4_79 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 71) goto yyfl_4_80;
yy_1_1 = ((yy)"int ");
s(yy_1_1);
yy_2_1 = ((yy)"int");
setACType(yy_2_1);
return;
yyfl_4_80 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 80) goto yyfl_4_81;
yy_1_1 = ((yy)"_Bool ");
s(yy_1_1);
yy_2_1 = ((yy)"_Bool");
setACType(yy_2_1);
return;
yyfl_4_81 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 72) goto yyfl_4_82;
yy_1_1 = ((yy)"_Complex ");
s(yy_1_1);
yy_2_1 = ((yy)"_Complex");
setACType(yy_2_1);
return;
yyfl_4_82 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 73) goto yyfl_4_83;
yy_1_1 = ((yy)"_Imaginary  ");
s(yy_1_1);
yy_2_1 = ((yy)"_Imaginary");
setACType(yy_2_1);
return;
yyfl_4_83 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 74) goto yyfl_4_84;
yy_1_1 = ((yy)"long ");
s(yy_1_1);
yy_2_1 = ((yy)"long");
setACType(yy_2_1);
return;
yyfl_4_84 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 75) goto yyfl_4_85;
yy_1_1 = ((yy)"float ");
s(yy_1_1);
yy_2_1 = ((yy)"float");
setACType(yy_2_1);
return;
yyfl_4_85 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 85) goto yyfl_4_86;
yy_1_1 = ((yy)"__builtin_va_list ");
s(yy_1_1);
yy_2_1 = ((yy)"__builtin_va_list");
setACType(yy_2_1);
return;
yyfl_4_86 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 76) goto yyfl_4_87;
yy_1_1 = ((yy)"double ");
s(yy_1_1);
yy_2_1 = ((yy)"double");
setACType(yy_2_1);
return;
yyfl_4_87 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 77) goto yyfl_4_88;
yy_1_1 = ((yy)"signed ");
s(yy_1_1);
yy_2_1 = ((yy)"signed");
setACType(yy_2_1);
return;
yyfl_4_88 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 79) goto yyfl_4_89;
yy_1_1 = ((yy)"unsigned ");
s(yy_1_1);
yy_2_1 = ((yy)"unsigned");
setACType(yy_2_1);
return;
yyfl_4_89 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 78) goto yyfl_4_90;
yy_1_1 = ((yy)"__signed__ ");
s(yy_1_1);
yy_2_1 = ((yy)"__signed__");
setACType(yy_2_1);
return;
yyfl_4_90 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yyv_Str;
yy yy_4_2;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 86) goto yyfl_4_91;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = ((yy)" ");
s(yy_1_1);
yy_2_1 = yyv_Ident;
id(yy_2_1);
yy_3_1 = ((yy)" ");
s(yy_3_1);
yy_4_1 = yyv_Ident;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str = yy_4_2;
yy_5_1 = yyv_Str;
setACType(yy_5_1);
return;
yyfl_4_91 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Op;
yy yy_0_1_1;
yy yyv_Expr;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yyv_T;
yy yy_2_1_1_2_1;
yy yy_2_1_2_1;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy yy_2_2_3_1;
yy yy_2_2_4_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 88) goto yyfl_4_92;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Op = yy_0_1_1;
yyv_Expr = yy_0_1_2;
yy_1_1 = yyv_Op;
ccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Expr;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 3) goto yyfl_4_92_2_1;
yy_2_1_1_2_1 = ((yy)yy_2_1_1_2[1]);
yyv_T = yy_2_1_1_2_1;
yy_2_1_2_1 = yyv_Expr;
ccE(yy_2_1_2_1);
goto yysl_4_92_2;
yyfl_4_92_2_1 : ;
yy_2_2_1_1 = ((yy)"a_typeof_expr_in_ac");
setACType(yy_2_2_1_1);
yy_2_2_2_1 = ((yy)"(");
s(yy_2_2_2_1);
yy_2_2_3_1 = yyv_Expr;
ccE(yy_2_2_3_1);
yy_2_2_4_1 = ((yy)")");
s(yy_2_2_4_1);
goto yysl_4_92_2;
yysl_4_92_2 : ;
yyb = yysb;
}
yy_3_1 = ((yy)" ");
s(yy_3_1);
return;
yyfl_4_92 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 89) goto yyfl_4_93;
yy_1_1 = ((yy)"__typeof ");
s(yy_1_1);
return;
yyfl_4_93 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 90) goto yyfl_4_94;
yy_1_1 = ((yy)"__typeof__ ");
s(yy_1_1);
return;
yyfl_4_94 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 91) goto yyfl_4_95;
yy_1_1 = ((yy)"typeof ");
s(yy_1_1);
return;
yyfl_4_95 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Qualifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 87) goto yyfl_4_96;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Qualifier = yy_0_1_1;
yy_1_1 = yyv_Qualifier;
ccd(yy_1_1);
return;
yyfl_4_96 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 92) goto yyfl_4_97;
yy_1_1 = ((yy)"const ");
s(yy_1_1);
yy_2_1 = ((yy)"const");
setQualifier(yy_2_1);
return;
yyfl_4_97 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 93) goto yyfl_4_98;
yy_1_1 = ((yy)"volatile ");
s(yy_1_1);
yy_2_1 = ((yy)"volatile");
setQualifier(yy_2_1);
return;
yyfl_4_98 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 94) goto yyfl_4_99;
yy_1_1 = ((yy)"__volatile ");
s(yy_1_1);
yy_2_1 = ((yy)"__volatile");
setQualifier(yy_2_1);
return;
yyfl_4_99 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 95) goto yyfl_4_100;
yy_1_1 = ((yy)"__volatile__ ");
s(yy_1_1);
yy_2_1 = ((yy)"__volatile__");
setQualifier(yy_2_1);
return;
yyfl_4_100 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 97) goto yyfl_4_101;
yy_1_1 = ((yy)"__const ");
s(yy_1_1);
yy_2_1 = ((yy)"__const");
setQualifier(yy_2_1);
return;
yyfl_4_101 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 56) goto yyfl_4_102;
yy_1_1 = ((yy)"__restrict ");
s(yy_1_1);
yy_2_1 = ((yy)"__restrict");
setQualifier(yy_2_1);
return;
yyfl_4_102 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 81) goto yyfl_4_103;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Specifier = yy_0_1_1;
yy_1_1 = yyv_Specifier;
ccd(yy_1_1);
return;
yyfl_4_103 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 82) goto yyfl_4_104;
yy_1_1 = ((yy)"inline ");
s(yy_1_1);
return;
yyfl_4_104 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 83) goto yyfl_4_105;
yy_1_1 = ((yy)"__inline ");
s(yy_1_1);
return;
yyfl_4_105 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 84) goto yyfl_4_106;
yy_1_1 = ((yy)"__inline__ ");
s(yy_1_1);
return;
yyfl_4_106 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 98) goto yyfl_4_107;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expression = yy_0_1_1;
yy_1_1 = yyv_Expression;
ccE(yy_1_1);
return;
yyfl_4_107 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitializerList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 99) goto yyfl_4_108;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_InitializerList = yy_0_1_1;
yy_1_1 = ((yy)"{");
s(yy_1_1);
yy_2_1 = yyv_InitializerList;
ccd(yy_2_1);
yy_3_1 = ((yy)"}");
s(yy_3_1);
return;
yyfl_4_108 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitializerList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 100) goto yyfl_4_109;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_InitializerList = yy_0_1_1;
yy_1_1 = ((yy)"{");
s(yy_1_1);
yy_2_1 = yyv_InitializerList;
ccd(yy_2_1);
yy_3_1 = ((yy)",}");
s(yy_3_1);
return;
yyfl_4_109 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitializerList;
yy yy_0_1_1;
yy yyv_Initializer;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 101) goto yyfl_4_110;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_InitializerList = yy_0_1_1;
yyv_Initializer = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_InitializerList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 102) goto yyfl_4_110_1_1;
goto yysl_4_110_1;
yyfl_4_110_1_1 : ;
yy_1_2_1_1 = yyv_InitializerList;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_110_1;
yysl_4_110_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Initializer;
ccd(yy_2_1);
return;
yyfl_4_110 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 102) goto yyfl_4_111;
return;
yyfl_4_111 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 103) goto yyfl_4_112;
return;
yyfl_4_112 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParameterList;
yy yy_0_1_1;
yy yyv_Ellipsis;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1_1_1;
yy yy_1_2_2_1_1_2;
yy yy_1_2_2_1_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 104) goto yyfl_4_113;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParameterList = yy_0_1_1;
yyv_Ellipsis = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParameterList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 106) goto yyfl_4_113_1_1;
goto yysl_4_113_1;
yyfl_4_113_1_1 : ;
yy_1_2_1_1 = yyv_ParameterList;
ccd(yy_1_2_1_1);
{
yy yysb = yyb;
yy_1_2_2_1_1_1 = yyv_Ellipsis;
yy_1_2_2_1_1_2 = yy_1_2_2_1_1_1;
if (yy_1_2_2_1_1_2[0] != 108) goto yyfl_4_113_1_2_2_1;
yy_1_2_2_1_2_1 = ((yy)", ");
s(yy_1_2_2_1_2_1);
goto yysl_4_113_1_2_2;
yyfl_4_113_1_2_2_1 : ;
goto yysl_4_113_1_2_2;
yysl_4_113_1_2_2 : ;
yyb = yysb;
}
goto yysl_4_113_1;
yysl_4_113_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Ellipsis;
ccd(yy_2_1);
return;
yyfl_4_113 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ParameterList;
yy yy_0_1_1;
yy yyv_ParameterDeclaration;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yyv_Flag;
yy yy_2_1_1_1;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yy_2_1_3_1;
yy yy_3_1;
yy yy_4_1_1_1;
yy yy_4_1_2_1;
yy yy_4_1_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 105) goto yyfl_4_114;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParameterList = yy_0_1_1;
yyv_ParameterDeclaration = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParameterList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 106) goto yyfl_4_114_1_1;
goto yysl_4_114_1;
yyfl_4_114_1_1 : ;
yy_1_2_1_1 = yyv_ParameterList;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)", ");
s(yy_1_2_2_1);
goto yysl_4_114_1;
yysl_4_114_1 : ;
yyb = yysb;
}
{
yy yysb = yyb;
isPointcutInfo(&yy_2_1_1_1);
yyv_Flag = yy_2_1_1_1;
yy_2_1_2_1 = yyv_Flag;
yy_2_1_2_2 = ((yy)1);
if ((long)yy_2_1_2_1 != (long)yy_2_1_2_2) goto yyfl_4_114_2_1;
yy_2_1_3_1 = ((yy)"param");
initDeclCollection(yy_2_1_3_1);
goto yysl_4_114_2;
yyfl_4_114_2_1 : ;
goto yysl_4_114_2;
yysl_4_114_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_ParameterDeclaration;
ccd(yy_3_1);
{
yy yysb = yyb;
isPointcutInfo(&yy_4_1_1_1);
yyv_Flag = yy_4_1_1_1;
yy_4_1_2_1 = yyv_Flag;
yy_4_1_2_2 = ((yy)1);
if ((long)yy_4_1_2_1 != (long)yy_4_1_2_2) goto yyfl_4_114_4_1;
endACParamDeclCollection();
goto yysl_4_114_4;
yyfl_4_114_4_1 : ;
goto yysl_4_114_4;
yysl_4_114_4 : ;
yyb = yysb;
}
return;
yyfl_4_114 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 106) goto yyfl_4_115;
return;
yyfl_4_115 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 107) goto yyfl_4_116;
return;
yyfl_4_116 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 108) goto yyfl_4_117;
yy_1_1 = ((yy)"...");
s(yy_1_1);
yy_2_1 = ((yy)"...");
setACType(yy_2_1);
return;
yyfl_4_117 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclarationSpecifiers;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 109) goto yyfl_4_118;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_DeclarationSpecifiers;
yy_1_2 = yyv_Declarator;
EmitParameterDeclaration(yy_1_1, yy_1_2);
return;
yyfl_4_118 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclarationSpecifiers;
yy yy_0_1_1;
yy yyv_AbstractDeclarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 110) goto yyfl_4_119;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_AbstractDeclarator = yy_0_1_2;
yy_1_1 = yyv_DeclarationSpecifiers;
yy_1_2 = yyv_AbstractDeclarator;
EmitAbstractParameterDeclaration(yy_1_1, yy_1_2);
return;
yyfl_4_119 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Pointer;
yy yy_0_1_1;
yy yyv_DirectAbstractDeclarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 111) goto yyfl_4_120;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Pointer = yy_0_1_1;
yyv_DirectAbstractDeclarator = yy_0_1_2;
yy_1_1 = yyv_Pointer;
ccd(yy_1_1);
yy_2_1 = yyv_DirectAbstractDeclarator;
ccd(yy_2_1);
return;
yyfl_4_120 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 112) goto yyfl_4_121;
return;
yyfl_4_121 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 113) goto yyfl_4_122;
return;
yyfl_4_122 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_AbstractDeclarator;
yy yy_0_1_1;
yy yy_1_1;
yy yy_3_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 114) goto yyfl_4_123;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_AbstractDeclarator = yy_0_1_1;
yy_1_1 = ((yy)"(");
s(yy_1_1);
enter_paren_declarator();
yy_3_1 = yyv_AbstractDeclarator;
ccd(yy_3_1);
leave_paren_declarator();
yy_5_1 = ((yy)")");
s(yy_5_1);
return;
yyfl_4_123 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Direct_abstract_declarator_opt;
yy yy_0_1_1;
yy yyv_Constant_expression_opt;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 115) goto yyfl_4_124;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Direct_abstract_declarator_opt = yy_0_1_1;
yyv_Constant_expression_opt = yy_0_1_2;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_Direct_abstract_declarator_opt;
ccd(yy_2_1);
setACTypePointer();
yy_4_1 = ((yy)"[");
s(yy_4_1);
yy_5_1 = yyv_Constant_expression_opt;
ccE(yy_5_1);
yy_6_1 = ((yy)"])");
s(yy_6_1);
return;
yyfl_4_124 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Direct_abstract_declarator;
yy yy_0_1_1;
yy yyv_Parameter_type_list_opt;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 116) goto yyfl_4_125;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Direct_abstract_declarator = yy_0_1_1;
yyv_Parameter_type_list_opt = yy_0_1_2;
yy_1_1 = yyv_Direct_abstract_declarator;
ccd(yy_1_1);
yy_2_1 = ((yy)"(");
s(yy_2_1);
yy_3_1 = yyv_Parameter_type_list_opt;
ccd(yy_3_1);
yy_4_1 = ((yy)")");
s(yy_4_1);
return;
yyfl_4_125 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Gccextension;
yy yy_0_1_1;
yy yyv_Indicator;
yy yy_0_1_2;
yy yyv_Tag;
yy yy_0_1_3;
yy yyv_Struct_declaration_list;
yy yy_0_1_4;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy yy_7_1;
yy yy_9_1_1_1;
yy yy_9_1_1_2;
yy yyv_Str;
yy yy_9_1_2_1;
yy yy_9_2_1_1;
yy yy_9_2_1_2;
yy yyv_Id;
yy yy_9_2_1_2_1;
yy yy_9_2_2_1;
yy yyv_TName;
yy yy_9_2_2_2;
yy yy_9_2_3_1_1_1;
yy yy_9_2_3_1_1_2;
yy yy_9_2_3_1_2_1;
yy yy_9_2_3_1_2_2;
yy yy_9_2_3_1_2_3;
yy yy_9_2_3_2_1_1;
yy yy_9_2_3_2_1_2;
yy yy_9_2_3_2_2_1;
yy yy_9_2_3_2_2_2;
yy yy_9_2_3_2_2_3;
yy yy_9_2_3_3_1_1;
yy yy_9_2_3_3_1_2;
yy yy_9_2_3_3_2_1;
yy yy_9_2_3_3_2_2;
yy yy_9_2_3_3_2_3;
yy yy_9_2_3_4_1_1;
yy yy_9_2_3_4_1_2;
yy yy_9_2_3_4_2_1;
yy yy_9_2_3_4_2_2;
yy yy_9_2_3_4_2_3;
yy yy_11_1;
yy yy_12_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 117) goto yyfl_4_126;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Gccextension = yy_0_1_1;
yyv_Indicator = yy_0_1_2;
yyv_Tag = yy_0_1_3;
yyv_Struct_declaration_list = yy_0_1_4;
enterStrDecl();
yy_2_1 = yyv_Gccextension;
ccd(yy_2_1);
yy_3_1 = yyv_Indicator;
ccd(yy_3_1);
yy_4_1 = yyv_Tag;
ccIdOpt(yy_4_1);
yy_5_1 = ((yy)"{");
s(yy_5_1);
yy_6_1 = ((yy)"struct");
initDeclCollection(yy_6_1);
yy_7_1 = yyv_Struct_declaration_list;
ccd(yy_7_1);
endDeclCollection();
{
yy yysb = yyb;
yy_9_1_1_1 = yyv_Tag;
yy_9_1_1_2 = yy_9_1_1_1;
if (yy_9_1_1_2[0] != 2) goto yyfl_4_126_9_1;
getTypedefTarget(&yy_9_1_2_1);
yyv_Str = yy_9_1_2_1;
goto yysl_4_126_9;
yyfl_4_126_9_1 : ;
yy_9_2_1_1 = yyv_Tag;
yy_9_2_1_2 = yy_9_2_1_1;
if (yy_9_2_1_2[0] != 1) goto yyfl_4_126_9_2;
yy_9_2_1_2_1 = ((yy)yy_9_2_1_2[1]);
yyv_Id = yy_9_2_1_2_1;
yy_9_2_2_1 = yyv_Id;
GetRepr2(yy_9_2_2_1, &yy_9_2_2_2);
yyv_TName = yy_9_2_2_2;
{
yy yysb = yyb;
yy_9_2_3_1_1_1 = yyv_Indicator;
yy_9_2_3_1_1_2 = yy_9_2_3_1_1_1;
if (yy_9_2_3_1_1_2[0] != 119) goto yyfl_4_126_9_2_3_1;
yy_9_2_3_1_2_1 = ((yy)1);
yy_9_2_3_1_2_2 = yyv_TName;
buildType(yy_9_2_3_1_2_1, yy_9_2_3_1_2_2, &yy_9_2_3_1_2_3);
yyv_Str = yy_9_2_3_1_2_3;
goto yysl_4_126_9_2_3;
yyfl_4_126_9_2_3_1 : ;
yy_9_2_3_2_1_1 = yyv_Indicator;
yy_9_2_3_2_1_2 = yy_9_2_3_2_1_1;
if (yy_9_2_3_2_1_2[0] != 120) goto yyfl_4_126_9_2_3_2;
yy_9_2_3_2_2_1 = ((yy)2);
yy_9_2_3_2_2_2 = yyv_TName;
buildType(yy_9_2_3_2_2_1, yy_9_2_3_2_2_2, &yy_9_2_3_2_2_3);
yyv_Str = yy_9_2_3_2_2_3;
goto yysl_4_126_9_2_3;
yyfl_4_126_9_2_3_2 : ;
yy_9_2_3_3_1_1 = yyv_Indicator;
yy_9_2_3_3_1_2 = yy_9_2_3_3_1_1;
if (yy_9_2_3_3_1_2[0] != 121) goto yyfl_4_126_9_2_3_3;
yy_9_2_3_3_2_1 = ((yy)1);
yy_9_2_3_3_2_2 = yyv_TName;
buildType(yy_9_2_3_3_2_1, yy_9_2_3_3_2_2, &yy_9_2_3_3_2_3);
yyv_Str = yy_9_2_3_3_2_3;
goto yysl_4_126_9_2_3;
yyfl_4_126_9_2_3_3 : ;
yy_9_2_3_4_1_1 = yyv_Indicator;
yy_9_2_3_4_1_2 = yy_9_2_3_4_1_1;
if (yy_9_2_3_4_1_2[0] != 122) goto yyfl_4_126_9_2_3_4;
yy_9_2_3_4_2_1 = ((yy)2);
yy_9_2_3_4_2_2 = yyv_TName;
buildType(yy_9_2_3_4_2_1, yy_9_2_3_4_2_2, &yy_9_2_3_4_2_3);
yyv_Str = yy_9_2_3_4_2_3;
goto yysl_4_126_9_2_3;
yyfl_4_126_9_2_3_4 : ;
goto yyfl_4_126_9_2;
yysl_4_126_9_2_3 : ;
yyb = yysb;
}
goto yysl_4_126_9;
yyfl_4_126_9_2 : ;
goto yyfl_4_126;
yysl_4_126_9 : ;
yyb = yysb;
}
NL();
yy_11_1 = yyv_Str;
outputTypeInsertionMarkerInAC(yy_11_1);
yy_12_1 = ((yy)"}");
s(yy_12_1);
leaveStrDecl();
return;
yyfl_4_126 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Gccextension;
yy yy_0_1_1;
yy yyv_Indicator;
yy yy_0_1_2;
yy yyv_Tag;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yyv_Str;
yy yy_5_2;
yy yy_6_1_1_1;
yy yy_6_1_1_2;
yy yy_6_1_2_1;
yy yy_6_1_2_2;
yy yy_6_2_1_1;
yy yy_6_2_1_2;
yy yy_6_2_2_1;
yy yy_6_2_2_2;
yy yy_6_3_1_1;
yy yy_6_3_1_2;
yy yy_6_3_2_1;
yy yy_6_3_2_2;
yy yy_6_4_1_1;
yy yy_6_4_1_2;
yy yy_6_4_2_1;
yy yy_6_4_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 118) goto yyfl_4_127;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Gccextension = yy_0_1_1;
yyv_Indicator = yy_0_1_2;
yyv_Tag = yy_0_1_3;
yy_1_1 = yyv_Gccextension;
ccd(yy_1_1);
yy_2_1 = yyv_Indicator;
ccd(yy_2_1);
yy_3_1 = yyv_Tag;
id(yy_3_1);
yy_4_1 = ((yy)" ");
s(yy_4_1);
yy_5_1 = yyv_Tag;
GetRepr2(yy_5_1, &yy_5_2);
yyv_Str = yy_5_2;
{
yy yysb = yyb;
yy_6_1_1_1 = yyv_Indicator;
yy_6_1_1_2 = yy_6_1_1_1;
if (yy_6_1_1_2[0] != 119) goto yyfl_4_127_6_1;
yy_6_1_2_1 = ((yy)1);
yy_6_1_2_2 = yyv_Str;
setACComplexType(yy_6_1_2_1, yy_6_1_2_2);
goto yysl_4_127_6;
yyfl_4_127_6_1 : ;
yy_6_2_1_1 = yyv_Indicator;
yy_6_2_1_2 = yy_6_2_1_1;
if (yy_6_2_1_2[0] != 120) goto yyfl_4_127_6_2;
yy_6_2_2_1 = ((yy)2);
yy_6_2_2_2 = yyv_Str;
setACComplexType(yy_6_2_2_1, yy_6_2_2_2);
goto yysl_4_127_6;
yyfl_4_127_6_2 : ;
yy_6_3_1_1 = yyv_Indicator;
yy_6_3_1_2 = yy_6_3_1_1;
if (yy_6_3_1_2[0] != 121) goto yyfl_4_127_6_3;
yy_6_3_2_1 = ((yy)1);
yy_6_3_2_2 = yyv_Str;
setACComplexType(yy_6_3_2_1, yy_6_3_2_2);
goto yysl_4_127_6;
yyfl_4_127_6_3 : ;
yy_6_4_1_1 = yyv_Indicator;
yy_6_4_1_2 = yy_6_4_1_1;
if (yy_6_4_1_2[0] != 122) goto yyfl_4_127_6_4;
yy_6_4_2_1 = ((yy)2);
yy_6_4_2_2 = yyv_Str;
setACComplexType(yy_6_4_2_1, yy_6_4_2_2);
goto yysl_4_127_6;
yyfl_4_127_6_4 : ;
goto yyfl_4_127;
yysl_4_127_6 : ;
yyb = yysb;
}
return;
yyfl_4_127 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 119) goto yyfl_4_128;
yy_1_1 = ((yy)"struct ");
s(yy_1_1);
return;
yyfl_4_128 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 120) goto yyfl_4_129;
yy_1_1 = ((yy)"union ");
s(yy_1_1);
return;
yyfl_4_129 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 121) goto yyfl_4_130;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = ((yy)"struct ");
s(yy_1_1);
yy_2_1 = yyv_GccAttr;
ccd(yy_2_1);
return;
yyfl_4_130 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 122) goto yyfl_4_131;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = ((yy)"union ");
s(yy_1_1);
yy_2_1 = yyv_GccAttr;
ccd(yy_2_1);
return;
yyfl_4_131 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Struct_declaration;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 123) goto yyfl_4_132;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Struct_declaration = yy_0_1_2;
yy_1_1 = yyv_List;
ccd(yy_1_1);
yy_2_1 = yyv_Struct_declaration;
ccd(yy_2_1);
return;
yyfl_4_132 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 124) goto yyfl_4_133;
return;
yyfl_4_133 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccExt;
yy yy_0_1_1;
yy yyv_DeclSpec;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 125) goto yyfl_4_134;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccExt = yy_0_1_1;
yyv_DeclSpec = yy_0_1_2;
yy_1_1 = yyv_GccExt;
ccd(yy_1_1);
yy_2_1 = yyv_DeclSpec;
ccd(yy_2_1);
return;
yyfl_4_134 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier_qualifier_list;
yy yy_0_1_1;
yy yyv_Struct_declarator_list;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 126) goto yyfl_4_135;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier_qualifier_list = yy_0_1_1;
yyv_Struct_declarator_list = yy_0_1_2;
yy_1_1 = yyv_Specifier_qualifier_list;
ccd(yy_1_1);
yy_2_1 = yyv_Struct_declarator_list;
ccd(yy_2_1);
yy_3_1 = ((yy)";");
s(yy_3_1);
nl();
return;
yyfl_4_135 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Type_specifier;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 127) goto yyfl_4_136;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Type_specifier = yy_0_1_1;
yy_1_1 = yyv_Type_specifier;
ccd(yy_1_1);
yy_2_1 = ((yy)";");
s(yy_2_1);
nl();
return;
yyfl_4_136 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 128) goto yyfl_4_137;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 129) goto yyfl_4_137_1_1;
goto yysl_4_137_1;
yyfl_4_137_1_1 : ;
yy_1_2_1_1 = yyv_List;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_137_1;
yysl_4_137_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Declarator;
ccd(yy_2_1);
return;
yyfl_4_137 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 129) goto yyfl_4_138;
return;
yyfl_4_138 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 130) goto yyfl_4_139;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Specifier;
ccd(yy_1_1);
yy_2_1 = yyv_List;
ccd(yy_2_1);
return;
yyfl_4_139 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 131) goto yyfl_4_140;
return;
yyfl_4_140 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator_opt;
yy yy_0_1_1;
yy yyv_Width_opt;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 132) goto yyfl_4_141;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator_opt = yy_0_1_1;
yyv_Width_opt = yy_0_1_2;
yy_1_1 = yyv_Declarator_opt;
ccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Width_opt;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 26) goto yyfl_4_141_2_1;
goto yysl_4_141_2;
yyfl_4_141_2_1 : ;
yy_2_2_1_1 = ((yy)":");
s(yy_2_2_1_1);
yy_2_2_2_1 = yyv_Width_opt;
ccE(yy_2_2_2_1);
goto yysl_4_141_2;
yysl_4_141_2 : ;
yyb = yysb;
}
return;
yyfl_4_141 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Qualifier;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 133) goto yyfl_4_142;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Qualifier = yy_0_1_2;
yy_1_1 = yyv_List;
ccd(yy_1_1);
yy_2_1 = yyv_Qualifier;
ccd(yy_2_1);
return;
yyfl_4_142 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 134) goto yyfl_4_143;
return;
yyfl_4_143 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tag;
yy yy_0_1_1;
yy yyv_Enumeratorlist;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 135) goto yyfl_4_144;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Tag = yy_0_1_1;
yyv_Enumeratorlist = yy_0_1_2;
yy_1_1 = ((yy)"enum ");
s(yy_1_1);
yy_2_1 = yyv_Tag;
ccIdOpt(yy_2_1);
yy_3_1 = ((yy)"{");
s(yy_3_1);
yy_4_1 = yyv_Enumeratorlist;
ccd(yy_4_1);
yy_5_1 = ((yy)"}");
s(yy_5_1);
return;
yyfl_4_144 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tag;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yyv_Str;
yy yy_4_2;
yy yy_5_1;
yy yy_5_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 136) goto yyfl_4_145;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Tag = yy_0_1_1;
yy_1_1 = ((yy)"enum ");
s(yy_1_1);
yy_2_1 = yyv_Tag;
id(yy_2_1);
yy_3_1 = ((yy)" ");
s(yy_3_1);
yy_4_1 = yyv_Tag;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str = yy_4_2;
yy_5_1 = ((yy)3);
yy_5_2 = yyv_Str;
setACComplexType(yy_5_1, yy_5_2);
return;
yyfl_4_145 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_T;
yy yy_0_1_1;
yy yyv_Tag;
yy yy_0_1_2;
yy yyv_Enumeratorlist;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 137) goto yyfl_4_146;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_T = yy_0_1_1;
yyv_Tag = yy_0_1_2;
yyv_Enumeratorlist = yy_0_1_3;
yy_1_1 = yyv_T;
ccd(yy_1_1);
yy_2_1 = yyv_Tag;
ccIdOpt(yy_2_1);
yy_3_1 = ((yy)"{");
s(yy_3_1);
yy_4_1 = yyv_Enumeratorlist;
ccd(yy_4_1);
yy_5_1 = ((yy)"}");
s(yy_5_1);
return;
yyfl_4_146 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_T;
yy yy_0_1_1;
yy yyv_Tag;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yyv_Str;
yy yy_4_2;
yy yy_5_1;
yy yy_5_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 138) goto yyfl_4_147;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_T = yy_0_1_1;
yyv_Tag = yy_0_1_2;
yy_1_1 = yyv_T;
ccd(yy_1_1);
yy_2_1 = yyv_Tag;
id(yy_2_1);
yy_3_1 = ((yy)" ");
s(yy_3_1);
yy_4_1 = yyv_Tag;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str = yy_4_2;
yy_5_1 = ((yy)3);
yy_5_2 = yyv_Str;
setACComplexType(yy_5_1, yy_5_2);
return;
yyfl_4_147 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 139) goto yyfl_4_148;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = ((yy)"enum ");
s(yy_1_1);
yy_2_1 = yyv_GccAttr;
ccd(yy_2_1);
return;
yyfl_4_148 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Enumeratorlist;
yy yy_0_1_1;
yy yyv_Enumerator;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 140) goto yyfl_4_149;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Enumeratorlist = yy_0_1_1;
yyv_Enumerator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_Enumeratorlist;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 141) goto yyfl_4_149_1_1;
goto yysl_4_149_1;
yyfl_4_149_1_1 : ;
yy_1_2_1_1 = yyv_Enumeratorlist;
ccd(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)",");
s(yy_1_2_2_1);
goto yysl_4_149_1;
yysl_4_149_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Enumerator;
ccd(yy_2_1);
return;
yyfl_4_149 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 141) goto yyfl_4_150;
return;
yyfl_4_150 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Enumconst;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 142) goto yyfl_4_151;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Enumconst = yy_0_1_1;
yy_1_1 = yyv_Enumconst;
id(yy_1_1);
return;
yyfl_4_151 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Enumconst;
yy yy_0_1_1;
yy yyv_InitializationExpression;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 143) goto yyfl_4_152;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Enumconst = yy_0_1_1;
yyv_InitializationExpression = yy_0_1_2;
yy_1_1 = yyv_Enumconst;
id(yy_1_1);
yy_2_1 = ((yy)"=");
s(yy_2_1);
yy_3_1 = yyv_InitializationExpression;
ccE(yy_3_1);
return;
yyfl_4_152 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D1;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 144) goto yyfl_4_153;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D1 = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D1;
ccd(yy_1_1);
yy_2_1 = yyv_D;
ccd(yy_2_1);
return;
yyfl_4_153 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Op;
yy yy_0_1_1;
yy yyv_Pointcut;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 145) goto yyfl_4_154;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Op = yy_0_1_1;
yyv_Pointcut = yy_0_1_2;
yy_1_1 = ((yy)"not");
addPointCutType2Current(yy_1_1);
yy_2_1 = ((yy)0);
pushAChildForCompPC(yy_2_1);
yy_3_1 = yyv_Pointcut;
ccd(yy_3_1);
popChild();
return;
yyfl_4_154 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Op;
yy yy_0_1_1;
yy yyv_LeftPointCut;
yy yy_0_1_2;
yy yyv_RightPointCut;
yy yy_0_1_3;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_1_2_1;
yy yy_1_2_1_1;
yy yy_1_2_1_2;
yy yy_1_2_2_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 146) goto yyfl_4_155;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Op = yy_0_1_1;
yyv_LeftPointCut = yy_0_1_2;
yyv_RightPointCut = yy_0_1_3;
{
yy yysb = yyb;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1_1_1 = yyv_Op;
yy_1_1_1_2 = yyb + 0;
yy_1_1_1_2[0] = 23;
if (! yyeq_Op(yy_1_1_1_1, yy_1_1_1_2)) goto yyfl_4_155_1_1;
yy_1_1_2_1 = ((yy)"and");
addPointCutType2Current(yy_1_1_2_1);
goto yysl_4_155_1;
yyfl_4_155_1_1 : ;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_2_1_1 = yyv_Op;
yy_1_2_1_2 = yyb + 0;
yy_1_2_1_2[0] = 22;
if (! yyeq_Op(yy_1_2_1_1, yy_1_2_1_2)) goto yyfl_4_155_1_2;
yy_1_2_2_1 = ((yy)"or");
addPointCutType2Current(yy_1_2_2_1);
goto yysl_4_155_1;
yyfl_4_155_1_2 : ;
goto yyfl_4_155;
yysl_4_155_1 : ;
yyb = yysb;
}
yy_2_1 = ((yy)0);
pushAChildForCompPC(yy_2_1);
yy_3_1 = yyv_LeftPointCut;
ccd(yy_3_1);
popChild();
yy_5_1 = ((yy)1);
pushAChildForCompPC(yy_5_1);
yy_6_1 = yyv_RightPointCut;
ccd(yy_6_1);
popChild();
return;
yyfl_4_155 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclSpecifiersOpt;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yyv_Statement;
yy yy_0_1_3;
yy yyv_Pos;
yy yy_0_1_4;
yy yyv_Pointcut;
yy yy_0_1_5;
yy yy_2_1;
yy yy_8_1;
yy yy_9_1;
yy yy_11_1;
yy yy_15_1;
yy yy_19_1;
yy yy_22_1;
yy yy_24_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 159) goto yyfl_4_156;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yy_0_1_5 = ((yy)yy_0_1[5]);
yyv_DeclSpecifiersOpt = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yyv_Statement = yy_0_1_3;
yyv_Pos = yy_0_1_4;
yyv_Pointcut = yy_0_1_5;
setFuncDefinition();
yy_2_1 = yyv_Pos;
LineInfo(yy_2_1);
unsetFuncDefinition();
outputAdviceFuncBeginTag();
startPointcutInfo();
startAdFuncHeader();
startAdReturnType();
yy_8_1 = ((yy)"adfunc");
initDeclCollection(yy_8_1);
yy_9_1 = yyv_DeclSpecifiersOpt;
ccd(yy_9_1);
endAdReturnType();
yy_11_1 = yyv_Declarator;
ccd(yy_11_1);
endAdFuncHeader();
endACParamDeclCollection();
turnOffOutput();
yy_15_1 = yyv_Pointcut;
ccd(yy_15_1);
turnOnOutput();
endPointcutInfo();
nl();
yy_19_1 = ((yy)"{");
s(yy_19_1);
startAdFunctionBD();
NL();
yy_22_1 = yyv_Statement;
ccS(yy_22_1);
endAdFunctionBD();
yy_24_1 = ((yy)"}");
s(yy_24_1);
NL();
outputAdviceFuncEndTag();
return;
yyfl_4_156 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ReturnType;
yy yy_0_1_1;
yy yyv_FuncName;
yy yy_0_1_2;
yy yyv_ParamType;
yy yy_0_1_3;
yy yy_2_1;
yy yy_4_1;
yy yyv_Str;
yy yy_4_2;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 150) goto yyfl_4_157;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_ReturnType = yy_0_1_1;
yyv_FuncName = yy_0_1_2;
yyv_ParamType = yy_0_1_3;
startJPReturnType();
yy_2_1 = yyv_ReturnType;
ccd(yy_2_1);
endJPReturnType();
yy_4_1 = yyv_FuncName;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str = yy_4_2;
yy_5_1 = yyv_Str;
setACName(yy_5_1);
yy_6_1 = yyv_ParamType;
ccd(yy_6_1);
return;
yyfl_4_157 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_IdName;
yy yy_0_1_1;
yy yyv_Pointcut;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Str1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yy_2_3;
yy yy_3_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 148) goto yyfl_4_158;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_IdName = yy_0_1_1;
yyv_Pointcut = yy_0_1_2;
yy_1_1 = yyv_IdName;
GetRepr2(yy_1_1, &yy_1_2);
yyv_Str1 = yy_1_2;
yy_2_1 = yyv_Str1;
yy_2_2 = ((yy)"cflow");
yy_2_3 = ((yy)"try");
assert2Keywords(yy_2_1, yy_2_2, yy_2_3);
yy_3_1 = yyv_Str1;
addPointCutType2Current(yy_3_1);
startGetDynInfo();
yy_5_1 = yyv_Pointcut;
ccd(yy_5_1);
endGetDynInfo();
return;
yyfl_4_158 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ArgsList;
yy yy_0_1_1;
yy yyv_ArgsDeclarations;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 151) goto yyfl_4_159;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ArgsList = yy_0_1_1;
yyv_ArgsDeclarations = yy_0_1_2;
yy_1_1 = yyv_ArgsList;
ccd(yy_1_1);
yy_2_1 = yyv_ArgsDeclarations;
ccd(yy_2_1);
return;
yyfl_4_159 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ArgsDecls;
yy yy_0_1_1;
yy yyv_ArgsDeclaration;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 152) goto yyfl_4_160;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ArgsDecls = yy_0_1_1;
yyv_ArgsDeclaration = yy_0_1_2;
yy_1_1 = yyv_ArgsDecls;
ccd(yy_1_1);
yy_2_1 = yyv_ArgsDeclaration;
ccd(yy_2_1);
return;
yyfl_4_160 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 153) goto yyfl_4_161;
return;
yyfl_4_161 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TypeSpecifier;
yy yy_0_1_1;
yy yyv_OneArgDeclaration;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_2_1;
yy yy_2_2_1_1;
yy yy_2_2_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 154) goto yyfl_4_162;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TypeSpecifier = yy_0_1_1;
yyv_OneArgDeclaration = yy_0_1_2;
yy_1_1 = ((yy)"param");
initDeclCollection(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_TypeSpecifier;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 156) goto yyfl_4_162_2_1;
yy_2_1_2_1 = yyv_OneArgDeclaration;
ccd(yy_2_1_2_1);
goto yysl_4_162_2;
yyfl_4_162_2_1 : ;
yy_2_2_1_1 = yyv_TypeSpecifier;
ccd(yy_2_2_1_1);
yy_2_2_2_1 = yyv_OneArgDeclaration;
ccd(yy_2_2_2_1);
goto yysl_4_162_2;
yysl_4_162_2 : ;
yyb = yysb;
}
endACParamDeclCollection();
return;
yyfl_4_162 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yy_1_1;
yy yyv_Str;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 157) goto yyfl_4_163;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id = yy_0_1_1;
yy_1_1 = yyv_Id;
GetRepr2(yy_1_1, &yy_1_2);
yyv_Str = yy_1_2;
yy_2_1 = yyv_Str;
setACType(yy_2_1);
setACTypePointer();
return;
yyfl_4_163 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yy_1_1;
yy yyv_Str;
yy yy_1_2;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 158) goto yyfl_4_164;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id = yy_0_1_1;
yy_1_1 = yyv_Id;
GetRepr2(yy_1_1, &yy_1_2);
yyv_Str = yy_1_2;
setACTypePointer();
yy_3_1 = yyv_Str;
setACName(yy_3_1);
return;
yyfl_4_164 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_M;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Str;
yy yy_1_2;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yyv_L;
yy yy_2_1_1_2_1;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yy_2_1_3_1;
yy yy_2_2_1_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 147) goto yyfl_4_165;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id = yy_0_1_1;
yyv_M = yy_0_1_2;
yy_1_1 = yyv_Id;
GetRepr2(yy_1_1, &yy_1_2);
yyv_Str = yy_1_2;
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_M;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 149) goto yyfl_4_165_2_1;
yy_2_1_1_2_1 = ((yy)yy_2_1_1_2[1]);
yyv_L = yy_2_1_1_2_1;
yy_2_1_2_1 = yyv_Str;
yy_2_1_2_2 = ((yy)"infile");
assertKeyword(yy_2_1_2_1, yy_2_1_2_2);
yy_2_1_3_1 = ((yy)"infile");
addPointCutType2Current(yy_2_1_3_1);
goto yysl_4_165_2;
yyfl_4_165_2_1 : ;
yy_2_2_1_1 = yyv_Str;
addPointCutType2Current(yy_2_2_1_1);
assertNotINFILE();
goto yysl_4_165_2;
yysl_4_165_2 : ;
yyb = yysb;
}
yy_3_1 = ((yy)"pcmatching");
initDeclCollection(yy_3_1);
yy_4_1 = yyv_M;
ccd(yy_4_1);
endACParamDeclCollection();
return;
yyfl_4_165 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_L;
yy yy_0_1_1_1;
yy yy_0_1_1_2;
yy yyv_LSTRING;
yy yy_0_1_1_2_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 149) goto yyfl_4_166;
yy_0_1_1 = ((yy)yy_0_1[1]);
if (yy_0_1_1[0] != 15) goto yyfl_4_166;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
yy_0_1_1_2 = ((yy)yy_0_1_1[2]);
yyv_L = yy_0_1_1_1;
if (yy_0_1_1_2[0] != 17) goto yyfl_4_166;
yy_0_1_1_2_1 = ((yy)yy_0_1_1_2[1]);
yyv_LSTRING = yy_0_1_1_2_1;
yy_1_1 = yyv_LSTRING;
setInsideFile(yy_1_1);
return;
yyfl_4_166 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_L;
yy yy_0_1_1_1;
yy yy_0_1_1_2;
yy yyv_LSTRING;
yy yy_0_1_1_2_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 149) goto yyfl_4_167;
yy_0_1_1 = ((yy)yy_0_1[1]);
if (yy_0_1_1[0] != 15) goto yyfl_4_167;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
yy_0_1_1_2 = ((yy)yy_0_1_1[2]);
yyv_L = yy_0_1_1_1;
if (yy_0_1_1_2[0] != 18) goto yyfl_4_167;
yy_0_1_1_2_1 = ((yy)yy_0_1_1_2[1]);
yyv_LSTRING = yy_0_1_1_2_1;
yy_1_1 = yyv_LSTRING;
setInsideFile(yy_1_1);
return;
yyfl_4_167 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_K;
yy yy_0_1_1;
yy yyv_V;
yy yy_0_1_2;
yy yyv_O;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_4_168;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_K = yy_0_1_1;
yyv_V = yy_0_1_2;
yyv_O = yy_0_1_3;
yy_1_1 = yyv_K;
ccd(yy_1_1);
yy_2_1 = yyv_V;
ccd(yy_2_1);
yy_3_1 = ((yy)"(");
s(yy_3_1);
yy_4_1 = yyv_O;
ccd(yy_4_1);
yy_5_1 = ((yy)")");
s(yy_5_1);
return;
yyfl_4_168 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_4_169;
yy_1_1 = ((yy)";");
s(yy_1_1);
return;
yyfl_4_169 : ;
}
yyErr(2,63);
}
ccS(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_5_1;
return;
yyfl_5_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_DeclStmt;
yy yy_0_1_2;
yy yyv_SrcLine;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_5_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_List = yy_0_1_1;
yyv_DeclStmt = yy_0_1_2;
yyv_SrcLine = yy_0_1_3;
yy_1_1 = yyv_List;
ccS(yy_1_1);
yy_2_1 = yyv_SrcLine;
LineInfo(yy_2_1);
yy_3_1 = yyv_DeclStmt;
ccS(yy_3_1);
return;
yyfl_5_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Decl;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_5_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Decl = yy_0_1_1;
yy_1_1 = yyv_Decl;
ccd(yy_1_1);
return;
yyfl_5_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Stmt;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_5_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Stmt = yy_0_1_1;
yy_1_1 = yyv_Stmt;
ccS(yy_1_1);
return;
yyfl_5_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_5_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expression = yy_0_1_1;
yy_1_1 = yyv_Expression;
ccE(yy_1_1);
yy_2_1 = ((yy)";");
s(yy_2_1);
nl();
return;
yyfl_5_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TestExpr;
yy yy_0_1_1;
yy yyv_Statement;
yy yy_0_1_2;
yy yy_1_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_5_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TestExpr = yy_0_1_1;
yyv_Statement = yy_0_1_2;
yy_1_1 = ((yy)"do {");
s(yy_1_1);
nl();
yy_3_1 = yyv_Statement;
ccS(yy_3_1);
yy_4_1 = ((yy)"} while(");
s(yy_4_1);
yy_5_1 = yyv_TestExpr;
ccE(yy_5_1);
yy_6_1 = ((yy)");");
s(yy_6_1);
nl();
return;
yyfl_5_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TestExpr;
yy yy_0_1_1;
yy yyv_Statement;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_5_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TestExpr = yy_0_1_1;
yyv_Statement = yy_0_1_2;
yy_1_1 = ((yy)"while(");
s(yy_1_1);
yy_2_1 = yyv_TestExpr;
ccE(yy_2_1);
yy_3_1 = ((yy)") {");
s(yy_3_1);
nl();
yy_5_1 = yyv_Statement;
ccS(yy_5_1);
yy_6_1 = ((yy)"}");
s(yy_6_1);
nl();
return;
yyfl_5_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitExpr;
yy yy_0_1_1;
yy yyv_TestExpr;
yy yy_0_1_2;
yy yyv_IncExpr;
yy yy_0_1_3;
yy yyv_Statement;
yy yy_0_1_4;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy yy_7_1;
yy yy_9_1;
yy yy_10_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_5_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_InitExpr = yy_0_1_1;
yyv_TestExpr = yy_0_1_2;
yyv_IncExpr = yy_0_1_3;
yyv_Statement = yy_0_1_4;
yy_1_1 = ((yy)"for(");
s(yy_1_1);
yy_2_1 = yyv_InitExpr;
ccE(yy_2_1);
yy_3_1 = ((yy)";");
s(yy_3_1);
yy_4_1 = yyv_TestExpr;
ccE(yy_4_1);
yy_5_1 = ((yy)";");
s(yy_5_1);
yy_6_1 = yyv_IncExpr;
ccE(yy_6_1);
yy_7_1 = ((yy)") {");
s(yy_7_1);
nl();
yy_9_1 = yyv_Statement;
ccS(yy_9_1);
yy_10_1 = ((yy)"}");
s(yy_10_1);
nl();
return;
yyfl_5_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclStmtList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_5_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_DeclStmtList = yy_0_1_1;
yy_1_1 = ((yy)"funcbody");
initDeclCollection(yy_1_1);
yy_2_1 = yyv_DeclStmtList;
ccS(yy_2_1);
endDeclCollection();
return;
yyfl_5_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_DeclStmtList;
yy yy_0_1_1;
yy yy_1_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_5_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_DeclStmtList = yy_0_1_1;
yy_1_1 = ((yy)"{");
s(yy_1_1);
nl();
yy_3_1 = yyv_DeclStmtList;
ccS(yy_3_1);
yy_4_1 = ((yy)"}");
s(yy_4_1);
nl();
return;
yyfl_5_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_LabelName;
yy yy_0_1_1;
yy yyv_GccAttrOpt;
yy yy_0_1_2;
yy yyv_Statement;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_5_11;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_LabelName = yy_0_1_1;
yyv_GccAttrOpt = yy_0_1_2;
yyv_Statement = yy_0_1_3;
yy_1_1 = yyv_LabelName;
id(yy_1_1);
yy_2_1 = ((yy)": ");
s(yy_2_1);
yy_3_1 = yyv_GccAttrOpt;
ccd(yy_3_1);
nl();
yy_5_1 = yyv_Statement;
ccS(yy_5_1);
return;
yyfl_5_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yyv_Statement;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_5_12;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Expression = yy_0_1_1;
yyv_Statement = yy_0_1_2;
yy_1_1 = ((yy)"case ");
s(yy_1_1);
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
yy_3_1 = ((yy)":");
s(yy_3_1);
nl();
yy_5_1 = yyv_Statement;
ccS(yy_5_1);
return;
yyfl_5_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Statement;
yy yy_0_1_1;
yy yy_1_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_5_13;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Statement = yy_0_1_1;
yy_1_1 = ((yy)"default:");
s(yy_1_1);
nl();
yy_3_1 = yyv_Statement;
ccS(yy_3_1);
return;
yyfl_5_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yyv_Statement;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_6_1;
yy yy_7_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_5_14;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Expression = yy_0_1_1;
yyv_Statement = yy_0_1_2;
yy_1_1 = ((yy)"if (");
s(yy_1_1);
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
yy_4_1 = ((yy)"{");
s(yy_4_1);
NL();
yy_6_1 = yyv_Statement;
ccS(yy_6_1);
yy_7_1 = ((yy)"}");
s(yy_7_1);
return;
yyfl_5_14 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yyv_Then;
yy yy_0_1_2;
yy yyv_Else;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_6_1;
yy yy_7_1;
yy yy_8_1;
yy yy_9_1;
yy yy_11_1;
yy yy_12_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_5_15;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Expression = yy_0_1_1;
yyv_Then = yy_0_1_2;
yyv_Else = yy_0_1_3;
yy_1_1 = ((yy)"if (");
s(yy_1_1);
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
yy_4_1 = ((yy)"{");
s(yy_4_1);
NL();
yy_6_1 = yyv_Then;
ccS(yy_6_1);
yy_7_1 = ((yy)"}");
s(yy_7_1);
yy_8_1 = ((yy)"else");
s(yy_8_1);
yy_9_1 = ((yy)"{");
s(yy_9_1);
NL();
yy_11_1 = yyv_Else;
ccS(yy_11_1);
yy_12_1 = ((yy)"}");
s(yy_12_1);
return;
yyfl_5_15 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yyv_Statement;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_5_16;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Expression = yy_0_1_1;
yyv_Statement = yy_0_1_2;
yy_1_1 = ((yy)"switch(");
s(yy_1_1);
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
yy_3_1 = ((yy)"){");
s(yy_3_1);
nl();
yy_5_1 = yyv_Statement;
ccS(yy_5_1);
yy_6_1 = ((yy)"}");
s(yy_6_1);
nl();
return;
yyfl_5_16 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Label;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_5_17;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Label = yy_0_1_1;
yy_1_1 = ((yy)"goto ");
s(yy_1_1);
yy_2_1 = yyv_Label;
id(yy_2_1);
yy_3_1 = ((yy)";");
s(yy_3_1);
nl();
return;
yyfl_5_17 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 14) goto yyfl_5_18;
yy_1_1 = ((yy)"continue;");
s(yy_1_1);
nl();
return;
yyfl_5_18 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 15) goto yyfl_5_19;
yy_1_1 = ((yy)"break;");
s(yy_1_1);
nl();
return;
yyfl_5_19 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_5_20;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yy_1_1 = yyv_D;
ccd(yy_1_1);
yy_2_1 = ((yy)";");
s(yy_2_1);
nl();
return;
yyfl_5_20 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 16) goto yyfl_5_21;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expression = yy_0_1_1;
yy_1_1 = ((yy)"return ");
s(yy_1_1);
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
yy_3_1 = ((yy)";");
s(yy_3_1);
nl();
return;
yyfl_5_21 : ;
}
yyErr(2,976);
}
ccE(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 27) goto yyfl_6_1;
return;
yyfl_6_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 28) goto yyfl_6_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = ((yy)"[");
s(yy_1_1);
yy_2_1 = yyv_Ident;
id(yy_2_1);
yy_3_1 = ((yy)"] ");
s(yy_3_1);
return;
yyfl_6_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_6_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expr = yy_0_1_1;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_Expr;
ccE(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
return;
yyfl_6_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expr;
yy yy_0_1_1;
yy yyv_Type;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 31) goto yyfl_6_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Expr = yy_0_1_1;
yyv_Type = yy_0_1_2;
yy_1_1 = yyv_Expr;
ccE(yy_1_1);
yy_2_1 = ((yy)", ");
s(yy_2_1);
yy_3_1 = yyv_Type;
ccd(yy_3_1);
return;
yyfl_6_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Type;
yy yy_0_1_1;
yy yyv_Init_list;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_6_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Type = yy_0_1_1;
yyv_Init_list = yy_0_1_2;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_Type;
ccd(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
yy_4_1 = ((yy)"{");
s(yy_4_1);
yy_5_1 = yyv_Init_list;
ccd(yy_5_1);
yy_6_1 = ((yy)"}");
s(yy_6_1);
return;
yyfl_6_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Type;
yy yy_0_1_1;
yy yyv_Init_list;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy yy_7_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 30) goto yyfl_6_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Type = yy_0_1_1;
yyv_Init_list = yy_0_1_2;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_Type;
ccd(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
yy_4_1 = ((yy)"{");
s(yy_4_1);
yy_5_1 = yyv_Init_list;
ccd(yy_5_1);
yy_6_1 = ((yy)",");
s(yy_6_1);
yy_7_1 = ((yy)"}");
s(yy_7_1);
return;
yyfl_6_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_Expression;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_2_1_1;
yy yy_1_2_2_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_6_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Expression = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 2) goto yyfl_6_7_1_1;
goto yysl_6_7_1;
yyfl_6_7_1_1 : ;
yy_1_2_1_1 = yyv_List;
ccE(yy_1_2_1_1);
yy_1_2_2_1 = ((yy)", ");
s(yy_1_2_2_1);
goto yysl_6_7_1;
yysl_6_7_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Expression;
ccE(yy_2_1);
return;
yyfl_6_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_6_8;
return;
yyfl_6_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TypeName;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_6_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_TypeName = yy_0_1_1;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_TypeName;
ccd(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
return;
yyfl_6_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TypeName;
yy yy_0_1_1;
yy yyv_Expression;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_6_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TypeName = yy_0_1_1;
yyv_Expression = yy_0_1_2;
yy_1_1 = yyv_TypeName;
ccd(yy_1_1);
yy_2_1 = ((yy)" , ");
s(yy_2_1);
yy_3_1 = yyv_Expression;
ccE(yy_3_1);
return;
yyfl_6_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expr;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_6_11;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expr = yy_0_1_1;
yy_1_1 = ((yy)" *");
s(yy_1_1);
yy_2_1 = yyv_Expr;
ccE(yy_2_1);
return;
yyfl_6_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_6_12;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
id(yy_1_1);
return;
yyfl_6_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Expression;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_13;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 37) goto yyfl_6_13;
yyv_Expression = yy_0_1_2;
yy_1_1 = yyv_Expression;
ccE(yy_1_1);
yy_2_1 = ((yy)"++");
s(yy_2_1);
return;
yyfl_6_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Expression;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_14;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 38) goto yyfl_6_14;
yyv_Expression = yy_0_1_2;
yy_1_1 = yyv_Expression;
ccE(yy_1_1);
yy_2_1 = ((yy)"--");
s(yy_2_1);
return;
yyfl_6_14 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_E;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_15;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 47) goto yyfl_6_15;
yyv_E = yy_0_1_2;
yy_1_1 = ((yy)"sizeof ");
s(yy_1_1);
yy_2_1 = yyv_E;
ccE(yy_2_1);
return;
yyfl_6_15 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_E;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_16;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 49) goto yyfl_6_16;
yyv_E = yy_0_1_2;
yy_1_1 = ((yy)"__alignof__ ");
s(yy_1_1);
yy_2_1 = yyv_E;
ccE(yy_2_1);
return;
yyfl_6_16 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_E;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_17;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 50) goto yyfl_6_17;
yyv_E = yy_0_1_2;
yy_1_1 = ((yy)"__extension__ ");
s(yy_1_1);
yy_2_1 = yyv_E;
ccE(yy_2_1);
return;
yyfl_6_17 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_E;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_18;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 48) goto yyfl_6_18;
yyv_E = yy_0_1_2;
yy_1_1 = ((yy)"__builtin_offsetof (");
s(yy_1_1);
yy_2_1 = yyv_E;
ccE(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
return;
yyfl_6_18 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_E;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_19;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 51) goto yyfl_6_19;
yyv_E = yy_0_1_2;
yy_1_1 = ((yy)"__builtin_va_arg (");
s(yy_1_1);
yy_2_1 = yyv_E;
ccE(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
return;
yyfl_6_19 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Operator;
yy yy_0_1_1;
yy yyv_Expression;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_6_20;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Operator = yy_0_1_1;
yyv_Expression = yy_0_1_2;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_Operator;
ccOp(yy_2_1);
yy_3_1 = yyv_Expression;
ccE(yy_3_1);
yy_4_1 = ((yy)")");
s(yy_4_1);
return;
yyfl_6_20 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_A;
yy yy_0_1_2;
yy yyv_I;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_6_21;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 4) goto yyfl_6_21;
yyv_A = yy_0_1_2;
yyv_I = yy_0_1_3;
yy_1_1 = yyv_A;
ccE(yy_1_1);
yy_2_1 = ((yy)"[");
s(yy_2_1);
yy_3_1 = yyv_I;
ccE(yy_3_1);
yy_4_1 = ((yy)"]");
s(yy_4_1);
return;
yyfl_6_21 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_E1;
yy yy_0_1_1;
yy yyv_E2;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_6_22;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_E1 = yy_0_1_1;
yyv_E2 = yy_0_1_2;
yy_1_1 = yyv_E1;
ccE(yy_1_1);
yy_2_1 = ((yy)" ... ");
s(yy_2_1);
yy_3_1 = yyv_E2;
ccE(yy_3_1);
return;
yyfl_6_22 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Left;
yy yy_0_1_2;
yy yyv_FieldName;
yy yy_0_1_3;
yy yy_1_1;
yy yyv_Flag;
yy yy_2_1;
yy yy_3_1_1_1;
yy yy_3_1_1_2;
yy yy_3_1_2_1;
yy yy_3_1_2_2;
yy yyv_Ident;
yy yy_3_1_2_2_1;
yy yy_3_1_3_1;
yy yyv_Str;
yy yy_3_1_3_2;
yy yy_3_1_4_1;
yy yyv_Flag2;
yy yy_3_1_4_2;
yy yy_3_1_5_1;
yy yy_3_1_5_2;
yy yy_3_1_6_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy yy_7_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_6_23;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 3) goto yyfl_6_23;
yyv_Left = yy_0_1_2;
yyv_FieldName = yy_0_1_3;
yy_1_1 = ((yy)"(");
s(yy_1_1);
isAdFunctionBD(&yy_2_1);
yyv_Flag = yy_2_1;
{
yy yysb = yyb;
yy_3_1_1_1 = yyv_Flag;
yy_3_1_1_2 = ((yy)1);
if ((long)yy_3_1_1_1 != (long)yy_3_1_1_2) goto yyfl_6_23_3_1;
yy_3_1_2_1 = yyv_Left;
yy_3_1_2_2 = yy_3_1_2_1;
if (yy_3_1_2_2[0] != 6) goto yyfl_6_23_3_1;
yy_3_1_2_2_1 = ((yy)yy_3_1_2_2[1]);
yyv_Ident = yy_3_1_2_2_1;
yy_3_1_3_1 = yyv_Ident;
GetRepr2(yy_3_1_3_1, &yy_3_1_3_2);
yyv_Str = yy_3_1_3_2;
yy_3_1_4_1 = yyv_Str;
checkKeywordInAdvice(yy_3_1_4_1, &yy_3_1_4_2);
yyv_Flag2 = yy_3_1_4_2;
yy_3_1_5_1 = yyv_Flag2;
yy_3_1_5_2 = ((yy)3);
if ((long)yy_3_1_5_1 != (long)yy_3_1_5_2) goto yyfl_6_23_3_1;
yy_3_1_6_1 = yyv_Flag2;
setFoundAdKeyword(yy_3_1_6_1);
goto yysl_6_23_3;
yyfl_6_23_3_1 : ;
goto yysl_6_23_3;
yysl_6_23_3 : ;
yyb = yysb;
}
yy_4_1 = yyv_Left;
ccE(yy_4_1);
yy_5_1 = ((yy)"->");
s(yy_5_1);
yy_6_1 = yyv_FieldName;
id(yy_6_1);
yy_7_1 = ((yy)")");
s(yy_7_1);
return;
yyfl_6_23 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Operator;
yy yy_0_1_1;
yy yyv_Left;
yy yy_0_1_2;
yy yyv_Right;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_6_24;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Operator = yy_0_1_1;
yyv_Left = yy_0_1_2;
yyv_Right = yy_0_1_3;
yy_1_1 = yyv_Left;
ccE(yy_1_1);
yy_2_1 = yyv_Operator;
ccOp(yy_2_1);
yy_3_1 = yyv_Right;
id(yy_3_1);
return;
yyfl_6_24 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Function;
yy yy_0_1_2;
yy yyv_Arguments;
yy yy_0_1_3;
yy yyv_Flag;
yy yy_1_1_1_1;
yy yy_1_1_2_1;
yy yy_1_1_2_2;
yy yy_1_1_3_1;
yy yy_1_1_4_1;
yy yy_1_1_5_1;
yy yy_1_1_6_1;
yy yy_1_2_1_1;
yy yy_1_2_1_2;
yy yyv_Ident;
yy yy_1_2_1_2_1;
yy yy_1_2_2_1;
yy yyv_Str;
yy yy_1_2_2_2;
yy yy_1_2_3_1;
yy yyv_Flag2;
yy yy_1_2_3_2;
yy yy_1_2_4_1_1_1;
yy yy_1_2_4_1_1_2;
yy yy_1_2_4_1_2_1_1_1;
yy yy_1_2_4_1_2_1_1_2;
yy yy_1_2_4_1_2_2_1_1;
yy yy_1_2_4_1_2_2_2_1;
yy yy_1_2_4_1_2_2_3_1;
yy yy_1_2_4_1_2_2_4_1;
yy yy_1_2_4_2_1_1;
yy yy_1_2_4_2_1_2;
yy yy_1_2_4_2_2_1_1_1;
yy yy_1_2_4_2_2_1_1_2;
yy yy_1_2_4_2_2_1_1_2_1;
yy yyv_Arg;
yy yy_1_2_4_2_2_1_1_2_2;
yy yy_1_2_4_2_2_1_3_1;
yy yy_1_2_4_2_2_2_1_1;
yy yy_1_2_4_2_2_2_2_1;
yy yy_1_2_4_2_2_2_3_1;
yy yy_1_2_4_2_2_2_4_1;
yy yy_1_2_4_3_1_1;
yy yy_1_2_4_3_1_2;
yy yy_1_2_4_3_2_1_1_1;
yy yy_1_2_4_3_2_1_1_2;
yy yy_1_2_4_3_2_1_1_2_1;
yy yy_1_2_4_3_2_1_1_2_2;
yy yy_1_2_4_3_2_1_3_1;
yy yy_1_2_4_3_2_1_4_1;
yy yy_1_2_4_3_2_2_1_1;
yy yy_1_2_4_3_2_2_2_1;
yy yy_1_2_4_3_2_2_3_1;
yy yy_1_2_4_3_2_2_4_1;
yy yy_1_2_4_4_1_1;
yy yy_1_2_4_4_2_1;
yy yy_1_2_4_4_3_1;
yy yy_1_2_4_4_4_1;
yy yy_1_3_1_1;
yy yy_1_3_1_2;
yy yy_1_3_1_2_1;
yy yy_1_3_1_2_2;
yy yy_1_3_1_2_2_1;
yy yyv_FieldName;
yy yy_1_3_1_2_3;
yy yy_1_3_2_1;
yy yyv_Id;
yy yy_1_3_2_2;
yy yy_1_3_3_1;
yy yyv_Field;
yy yy_1_3_3_2;
yy yy_1_3_4_1;
yy yyv_Flag3;
yy yy_1_3_4_2;
yy yy_1_3_5_1;
yy yyv_Flag4;
yy yy_1_3_5_2;
yy yy_1_3_6_1;
yy yy_1_3_6_2;
yy yy_1_3_7_1_1_1;
yy yy_1_3_7_1_1_2;
yy yy_1_3_7_2_1_1;
yy yy_1_3_7_2_1_2;
yy yy_1_3_8_1;
yy yy_1_3_8_2;
yy yy_1_3_8_2_1;
yy yy_1_3_8_2_2;
yy yy_1_3_9_1;
yy yy_1_3_10_1;
yy yy_1_3_11_1;
yy yy_1_3_12_1;
yy yy_1_3_13_1;
yy yy_1_4_1_1;
yy yy_1_4_2_1;
yy yy_1_4_3_1;
yy yy_1_4_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_6_25;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 5) goto yyfl_6_25;
yyv_Function = yy_0_1_2;
yyv_Arguments = yy_0_1_3;
{
yy yysb = yyb;
isAdFunctionBD(&yy_1_1_1_1);
yyv_Flag = yy_1_1_1_1;
yy_1_1_2_1 = yyv_Flag;
yy_1_1_2_2 = ((yy)0);
if ((long)yy_1_1_2_1 != (long)yy_1_1_2_2) goto yyfl_6_25_1_1;
yy_1_1_3_1 = yyv_Function;
ccE(yy_1_1_3_1);
yy_1_1_4_1 = ((yy)"(");
s(yy_1_1_4_1);
yy_1_1_5_1 = yyv_Arguments;
ccE(yy_1_1_5_1);
yy_1_1_6_1 = ((yy)")");
s(yy_1_1_6_1);
goto yysl_6_25_1;
yyfl_6_25_1_1 : ;
yy_1_2_1_1 = yyv_Function;
yy_1_2_1_2 = yy_1_2_1_1;
if (yy_1_2_1_2[0] != 6) goto yyfl_6_25_1_2;
yy_1_2_1_2_1 = ((yy)yy_1_2_1_2[1]);
yyv_Ident = yy_1_2_1_2_1;
yy_1_2_2_1 = yyv_Ident;
GetRepr2(yy_1_2_2_1, &yy_1_2_2_2);
yyv_Str = yy_1_2_2_2;
yy_1_2_3_1 = yyv_Str;
checkKeywordInAdvice(yy_1_2_3_1, &yy_1_2_3_2);
yyv_Flag2 = yy_1_2_3_2;
{
yy yysb = yyb;
yy_1_2_4_1_1_1 = yyv_Flag2;
yy_1_2_4_1_1_2 = ((yy)0);
if ((long)yy_1_2_4_1_1_1 != (long)yy_1_2_4_1_1_2) goto yyfl_6_25_1_2_4_1;
{
yy yysb = yyb;
yy_1_2_4_1_2_1_1_1 = yyv_Arguments;
yy_1_2_4_1_2_1_1_2 = yy_1_2_4_1_2_1_1_1;
if (yy_1_2_4_1_2_1_1_2[0] != 2) goto yyfl_6_25_1_2_4_1_2_1;
genNewProceedCall();
goto yysl_6_25_1_2_4_1_2;
yyfl_6_25_1_2_4_1_2_1 : ;
yy_1_2_4_1_2_2_1_1 = yyv_Function;
ccE(yy_1_2_4_1_2_2_1_1);
yy_1_2_4_1_2_2_2_1 = ((yy)"(");
s(yy_1_2_4_1_2_2_2_1);
yy_1_2_4_1_2_2_3_1 = yyv_Arguments;
ccE(yy_1_2_4_1_2_2_3_1);
yy_1_2_4_1_2_2_4_1 = ((yy)")");
s(yy_1_2_4_1_2_2_4_1);
goto yysl_6_25_1_2_4_1_2;
yysl_6_25_1_2_4_1_2 : ;
yyb = yysb;
}
goto yysl_6_25_1_2_4;
yyfl_6_25_1_2_4_1 : ;
yy_1_2_4_2_1_1 = yyv_Flag2;
yy_1_2_4_2_1_2 = ((yy)1);
if ((long)yy_1_2_4_2_1_1 != (long)yy_1_2_4_2_1_2) goto yyfl_6_25_1_2_4_2;
{
yy yysb = yyb;
yy_1_2_4_2_2_1_1_1 = yyv_Arguments;
yy_1_2_4_2_2_1_1_2 = yy_1_2_4_2_2_1_1_1;
if (yy_1_2_4_2_2_1_1_2[0] != 1) goto yyfl_6_25_1_2_4_2_2_1;
yy_1_2_4_2_2_1_1_2_1 = ((yy)yy_1_2_4_2_2_1_1_2[1]);
yy_1_2_4_2_2_1_1_2_2 = ((yy)yy_1_2_4_2_2_1_1_2[2]);
if (yy_1_2_4_2_2_1_1_2_1[0] != 2) goto yyfl_6_25_1_2_4_2_2_1;
yyv_Arg = yy_1_2_4_2_2_1_1_2_2;
genNewPreturnCall();
yy_1_2_4_2_2_1_3_1 = yyv_Arguments;
ccE(yy_1_2_4_2_2_1_3_1);
enclosePreturnCall();
goto yysl_6_25_1_2_4_2_2;
yyfl_6_25_1_2_4_2_2_1 : ;
yy_1_2_4_2_2_2_1_1 = yyv_Function;
ccE(yy_1_2_4_2_2_2_1_1);
yy_1_2_4_2_2_2_2_1 = ((yy)"(");
s(yy_1_2_4_2_2_2_2_1);
yy_1_2_4_2_2_2_3_1 = yyv_Arguments;
ccE(yy_1_2_4_2_2_2_3_1);
yy_1_2_4_2_2_2_4_1 = ((yy)")");
s(yy_1_2_4_2_2_2_4_1);
goto yysl_6_25_1_2_4_2_2;
yysl_6_25_1_2_4_2_2 : ;
yyb = yysb;
}
goto yysl_6_25_1_2_4;
yyfl_6_25_1_2_4_2 : ;
yy_1_2_4_3_1_1 = yyv_Flag2;
yy_1_2_4_3_1_2 = ((yy)2);
if ((long)yy_1_2_4_3_1_1 != (long)yy_1_2_4_3_1_2) goto yyfl_6_25_1_2_4_3;
{
yy yysb = yyb;
yy_1_2_4_3_2_1_1_1 = yyv_Arguments;
yy_1_2_4_3_2_1_1_2 = yy_1_2_4_3_2_1_1_1;
if (yy_1_2_4_3_2_1_1_2[0] != 1) goto yyfl_6_25_1_2_4_3_2_1;
yy_1_2_4_3_2_1_1_2_1 = ((yy)yy_1_2_4_3_2_1_1_2[1]);
yy_1_2_4_3_2_1_1_2_2 = ((yy)yy_1_2_4_3_2_1_1_2[2]);
if (yy_1_2_4_3_2_1_1_2_1[0] != 2) goto yyfl_6_25_1_2_4_3_2_1;
yyv_Arg = yy_1_2_4_3_2_1_1_2_2;
genNewThrowCall();
yy_1_2_4_3_2_1_3_1 = yyv_Arguments;
ccE(yy_1_2_4_3_2_1_3_1);
yy_1_2_4_3_2_1_4_1 = ((yy)");}");
s(yy_1_2_4_3_2_1_4_1);
goto yysl_6_25_1_2_4_3_2;
yyfl_6_25_1_2_4_3_2_1 : ;
yy_1_2_4_3_2_2_1_1 = yyv_Function;
ccE(yy_1_2_4_3_2_2_1_1);
yy_1_2_4_3_2_2_2_1 = ((yy)"(");
s(yy_1_2_4_3_2_2_2_1);
yy_1_2_4_3_2_2_3_1 = yyv_Arguments;
ccE(yy_1_2_4_3_2_2_3_1);
yy_1_2_4_3_2_2_4_1 = ((yy)")");
s(yy_1_2_4_3_2_2_4_1);
goto yysl_6_25_1_2_4_3_2;
yysl_6_25_1_2_4_3_2 : ;
yyb = yysb;
}
goto yysl_6_25_1_2_4;
yyfl_6_25_1_2_4_3 : ;
yy_1_2_4_4_1_1 = yyv_Function;
ccE(yy_1_2_4_4_1_1);
yy_1_2_4_4_2_1 = ((yy)"(");
s(yy_1_2_4_4_2_1);
yy_1_2_4_4_3_1 = yyv_Arguments;
ccE(yy_1_2_4_4_3_1);
yy_1_2_4_4_4_1 = ((yy)")");
s(yy_1_2_4_4_4_1);
goto yysl_6_25_1_2_4;
yysl_6_25_1_2_4 : ;
yyb = yysb;
}
goto yysl_6_25_1;
yyfl_6_25_1_2 : ;
yy_1_3_1_1 = yyv_Function;
yy_1_3_1_2 = yy_1_3_1_1;
if (yy_1_3_1_2[0] != 8) goto yyfl_6_25_1_3;
yy_1_3_1_2_1 = ((yy)yy_1_3_1_2[1]);
yy_1_3_1_2_2 = ((yy)yy_1_3_1_2[2]);
yy_1_3_1_2_3 = ((yy)yy_1_3_1_2[3]);
if (yy_1_3_1_2_1[0] != 3) goto yyfl_6_25_1_3;
if (yy_1_3_1_2_2[0] != 6) goto yyfl_6_25_1_3;
yy_1_3_1_2_2_1 = ((yy)yy_1_3_1_2_2[1]);
yyv_Ident = yy_1_3_1_2_2_1;
yyv_FieldName = yy_1_3_1_2_3;
yy_1_3_2_1 = yyv_Ident;
GetRepr2(yy_1_3_2_1, &yy_1_3_2_2);
yyv_Id = yy_1_3_2_2;
yy_1_3_3_1 = yyv_FieldName;
GetRepr2(yy_1_3_3_1, &yy_1_3_3_2);
yyv_Field = yy_1_3_3_2;
yy_1_3_4_1 = yyv_Id;
checkKeywordInAdvice(yy_1_3_4_1, &yy_1_3_4_2);
yyv_Flag3 = yy_1_3_4_2;
yy_1_3_5_1 = yyv_Field;
checkKeywordInAdvice(yy_1_3_5_1, &yy_1_3_5_2);
yyv_Flag4 = yy_1_3_5_2;
yy_1_3_6_1 = yyv_Flag3;
yy_1_3_6_2 = ((yy)3);
if ((long)yy_1_3_6_1 != (long)yy_1_3_6_2) goto yyfl_6_25_1_3;
{
yy yysb = yyb;
yy_1_3_7_1_1_1 = yyv_Flag4;
yy_1_3_7_1_1_2 = ((yy)4);
if ((long)yy_1_3_7_1_1_1 != (long)yy_1_3_7_1_1_2) goto yyfl_6_25_1_3_7_1;
goto yysl_6_25_1_3_7;
yyfl_6_25_1_3_7_1 : ;
yy_1_3_7_2_1_1 = yyv_Flag4;
yy_1_3_7_2_1_2 = ((yy)5);
if ((long)yy_1_3_7_2_1_1 != (long)yy_1_3_7_2_1_2) goto yyfl_6_25_1_3_7_2;
goto yysl_6_25_1_3_7;
yyfl_6_25_1_3_7_2 : ;
goto yyfl_6_25_1_3;
yysl_6_25_1_3_7 : ;
yyb = yysb;
}
yy_1_3_8_1 = yyv_Arguments;
yy_1_3_8_2 = yy_1_3_8_1;
if (yy_1_3_8_2[0] != 1) goto yyfl_6_25_1_3;
yy_1_3_8_2_1 = ((yy)yy_1_3_8_2[1]);
yy_1_3_8_2_2 = ((yy)yy_1_3_8_2[2]);
if (yy_1_3_8_2_1[0] != 2) goto yyfl_6_25_1_3;
yyv_Arg = yy_1_3_8_2_2;
yy_1_3_9_1 = yyv_Flag4;
setFoundAdKeyword(yy_1_3_9_1);
yy_1_3_10_1 = yyv_Function;
ccE(yy_1_3_10_1);
yy_1_3_11_1 = ((yy)"(");
s(yy_1_3_11_1);
yy_1_3_12_1 = yyv_Arguments;
ccE(yy_1_3_12_1);
yy_1_3_13_1 = ((yy)" , this ) ");
s(yy_1_3_13_1);
goto yysl_6_25_1;
yyfl_6_25_1_3 : ;
yy_1_4_1_1 = yyv_Function;
ccE(yy_1_4_1_1);
yy_1_4_2_1 = ((yy)"(");
s(yy_1_4_2_1);
yy_1_4_3_1 = yyv_Arguments;
ccE(yy_1_4_3_1);
yy_1_4_4_1 = ((yy)")");
s(yy_1_4_4_1);
goto yysl_6_25_1;
yysl_6_25_1 : ;
yyb = yysb;
}
return;
yyfl_6_25 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yyv_T;
yy yy_0_1_2_1;
yy yyv_E;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_6_26;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 36) goto yyfl_6_26;
if (yy_0_1_2[0] != 3) goto yyfl_6_26;
yy_0_1_2_1 = ((yy)yy_0_1_2[1]);
yyv_T = yy_0_1_2_1;
yyv_E = yy_0_1_3;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = ((yy)"(");
s(yy_2_1);
yy_3_1 = yyv_T;
ccd(yy_3_1);
yy_4_1 = ((yy)")");
s(yy_4_1);
yy_5_1 = yyv_E;
ccE(yy_5_1);
yy_6_1 = ((yy)")");
s(yy_6_1);
return;
yyfl_6_26 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Operator;
yy yy_0_1_1;
yy yyv_Left;
yy yy_0_1_2;
yy yyv_Right;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_6_27;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Operator = yy_0_1_1;
yyv_Left = yy_0_1_2;
yyv_Right = yy_0_1_3;
yy_1_1 = yyv_Left;
ccE(yy_1_1);
yy_2_1 = ((yy)" ");
s(yy_2_1);
yy_3_1 = yyv_Operator;
ccOp(yy_3_1);
yy_4_1 = ((yy)" ");
s(yy_4_1);
yy_5_1 = yyv_Right;
ccE(yy_5_1);
return;
yyfl_6_27 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_First;
yy yy_0_1_2;
yy yyv_Second;
yy yy_0_1_3;
yy yyv_Third;
yy yy_0_1_4;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1;
yy yy_6_1;
yy yy_7_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_6_28;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
if (yy_0_1_1[0] != 1) goto yyfl_6_28;
yyv_First = yy_0_1_2;
yyv_Second = yy_0_1_3;
yyv_Third = yy_0_1_4;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_First;
ccE(yy_2_1);
yy_3_1 = ((yy)"?");
s(yy_3_1);
yy_4_1 = yyv_Second;
ccE(yy_4_1);
yy_5_1 = ((yy)":");
s(yy_5_1);
yy_6_1 = yyv_Third;
ccE(yy_6_1);
yy_7_1 = ((yy)")");
s(yy_7_1);
return;
yyfl_6_28 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_6_29;
return;
yyfl_6_29 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 14) goto yyfl_6_30;
yy_1_1 = ((yy)"__restrict");
s(yy_1_1);
return;
yyfl_6_30 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_L;
yy yy_0_1_1;
yy yyv_S;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 15) goto yyfl_6_31;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_L = yy_0_1_1;
yyv_S = yy_0_1_2;
yy_1_1 = yyv_L;
ccE(yy_1_1);
yy_2_1 = yyv_S;
ccE(yy_2_1);
return;
yyfl_6_31 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 16) goto yyfl_6_32;
return;
yyfl_6_32 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_LSTRING;
yy yy_0_1_1;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_6_33;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_LSTRING = yy_0_1_1;
yy_1_1 = yyv_LSTRING;
yy_1_2 = ((yy)0);
yy_1_3 = ((yy)0);
lstring(yy_1_1, yy_1_2, yy_1_3);
return;
yyfl_6_33 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_LSTRING;
yy yy_0_1_1;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_6_34;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_LSTRING = yy_0_1_1;
yy_1_1 = yyv_LSTRING;
yy_1_2 = ((yy)0);
yy_1_3 = ((yy)1);
lstring(yy_1_1, yy_1_2, yy_1_3);
return;
yyfl_6_34 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_N;
yy yy_0_1_1;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_6_35;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_N = yy_0_1_1;
yy_1_1 = yyv_N;
yy_1_2 = ((yy)1);
yy_1_3 = ((yy)0);
lstring(yy_1_1, yy_1_2, yy_1_3);
return;
yyfl_6_35 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_N;
yy yy_0_1_1;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_6_36;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_N = yy_0_1_1;
yy_1_1 = yyv_N;
yy_1_2 = ((yy)1);
yy_1_3 = ((yy)1);
lstring(yy_1_1, yy_1_2, yy_1_3);
return;
yyfl_6_36 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Float;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_6_37;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Float = yy_0_1_1;
yy_1_1 = yyv_Float;
f(yy_1_1);
return;
yyfl_6_37 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 22) goto yyfl_6_38;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
id(yy_1_1);
return;
yyfl_6_38 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 24) goto yyfl_6_39;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_C = yy_0_1_1;
yy_1_1 = yyv_C;
ccE(yy_1_1);
return;
yyfl_6_39 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_N;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 23) goto yyfl_6_40;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_N = yy_0_1_1;
yy_1_1 = yyv_N;
sIntConst(yy_1_1);
return;
yyfl_6_40 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_S;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 25) goto yyfl_6_41;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_S = yy_0_1_1;
yy_1_1 = ((yy)"(");
s(yy_1_1);
yy_2_1 = yyv_S;
ccS(yy_2_1);
yy_3_1 = ((yy)")");
s(yy_3_1);
return;
yyfl_6_41 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_6_42;
return;
yyfl_6_42 : ;
}
yyErr(2,1045);
}
ccOp(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_7_1;
yy_1_1 = ((yy)".");
s(yy_1_1);
return;
yyfl_7_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_7_2;
yy_1_1 = ((yy)"+");
s(yy_1_1);
return;
yyfl_7_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_7_3;
yy_1_1 = ((yy)"-");
s(yy_1_1);
return;
yyfl_7_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_7_4;
yy_1_1 = ((yy)"*");
s(yy_1_1);
return;
yyfl_7_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_7_5;
yy_1_1 = ((yy)"/");
s(yy_1_1);
return;
yyfl_7_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_7_6;
yy_1_1 = ((yy)"%");
s(yy_1_1);
return;
yyfl_7_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_7_7;
yy_1_1 = ((yy)"<<");
s(yy_1_1);
return;
yyfl_7_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_7_8;
yy_1_1 = ((yy)">>");
s(yy_1_1);
return;
yyfl_7_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_7_9;
yy_1_1 = ((yy)"!=");
s(yy_1_1);
return;
yyfl_7_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 14) goto yyfl_7_10;
yy_1_1 = ((yy)"<");
s(yy_1_1);
return;
yyfl_7_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 15) goto yyfl_7_11;
yy_1_1 = ((yy)"<=");
s(yy_1_1);
return;
yyfl_7_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 16) goto yyfl_7_12;
yy_1_1 = ((yy)">");
s(yy_1_1);
return;
yyfl_7_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_7_13;
yy_1_1 = ((yy)">=");
s(yy_1_1);
return;
yyfl_7_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_7_14;
yy_1_1 = ((yy)"|");
s(yy_1_1);
return;
yyfl_7_14 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_7_15;
yy_1_1 = ((yy)"^");
s(yy_1_1);
return;
yyfl_7_15 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_7_16;
yy_1_1 = ((yy)"==");
s(yy_1_1);
return;
yyfl_7_16 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_7_17;
yy_1_1 = ((yy)"&");
s(yy_1_1);
return;
yyfl_7_17 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 22) goto yyfl_7_18;
yy_1_1 = ((yy)"||");
s(yy_1_1);
return;
yyfl_7_18 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 23) goto yyfl_7_19;
yy_1_1 = ((yy)"&&");
s(yy_1_1);
return;
yyfl_7_19 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 24) goto yyfl_7_20;
yy_1_1 = ((yy)"=");
s(yy_1_1);
return;
yyfl_7_20 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 25) goto yyfl_7_21;
yy_1_1 = ((yy)"&=");
s(yy_1_1);
return;
yyfl_7_21 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_7_22;
yy_1_1 = ((yy)"^=");
s(yy_1_1);
return;
yyfl_7_22 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 27) goto yyfl_7_23;
yy_1_1 = ((yy)"|=");
s(yy_1_1);
return;
yyfl_7_23 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 28) goto yyfl_7_24;
yy_1_1 = ((yy)"*=");
s(yy_1_1);
return;
yyfl_7_24 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_7_25;
yy_1_1 = ((yy)"/=");
s(yy_1_1);
return;
yyfl_7_25 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 30) goto yyfl_7_26;
yy_1_1 = ((yy)"%=");
s(yy_1_1);
return;
yyfl_7_26 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 31) goto yyfl_7_27;
yy_1_1 = ((yy)"+=");
s(yy_1_1);
return;
yyfl_7_27 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 32) goto yyfl_7_28;
yy_1_1 = ((yy)"-=");
s(yy_1_1);
return;
yyfl_7_28 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 33) goto yyfl_7_29;
yy_1_1 = ((yy)"<<=");
s(yy_1_1);
return;
yyfl_7_29 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 34) goto yyfl_7_30;
yy_1_1 = ((yy)">>=");
s(yy_1_1);
return;
yyfl_7_30 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 35) goto yyfl_7_31;
yy_1_1 = ((yy)",");
s(yy_1_1);
return;
yyfl_7_31 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 39) goto yyfl_7_32;
yy_1_1 = ((yy)"++");
s(yy_1_1);
return;
yyfl_7_32 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 40) goto yyfl_7_33;
yy_1_1 = ((yy)"--");
s(yy_1_1);
return;
yyfl_7_33 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 41) goto yyfl_7_34;
yy_1_1 = ((yy)"&");
s(yy_1_1);
return;
yyfl_7_34 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 42) goto yyfl_7_35;
yy_1_1 = ((yy)"+");
s(yy_1_1);
return;
yyfl_7_35 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 43) goto yyfl_7_36;
yy_1_1 = ((yy)"-");
s(yy_1_1);
return;
yyfl_7_36 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 44) goto yyfl_7_37;
yy_1_1 = ((yy)"!");
s(yy_1_1);
return;
yyfl_7_37 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 45) goto yyfl_7_38;
yy_1_1 = ((yy)"*");
s(yy_1_1);
return;
yyfl_7_38 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 46) goto yyfl_7_39;
yy_1_1 = ((yy)"~");
s(yy_1_1);
return;
yyfl_7_39 : ;
}
yyErr(2,1269);
}
EmitDeclaration(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_DeclarationSpecifiers;
yy yy_0_1;
yy yyv_InitDeclaratorListOpt;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_DeclarationSpecifiers = yy_0_1;
yyv_InitDeclaratorListOpt = yy_0_2;
yy_1_1 = yyv_DeclarationSpecifiers;
yy_1_2 = yyv_InitDeclaratorListOpt;
EmitDeclaratorList(yy_1_1, yy_1_2);
return;
}
}
EmitDeclaratorList(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yy_0_2;
yy yyv_BL;
yy yy_0_2_1;
yy yyv_L;
yy yy_0_2_2;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_2_1_1;
yy yy_2_2_1_2;
yy yy_2_3_1_1;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 18) goto yyfl_9_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_BL = yy_0_2_1;
yyv_L = yy_0_2_2;
yy_1_1 = yyv_Specifiers;
yy_1_2 = yyv_BL;
EmitDeclaratorList(yy_1_1, yy_1_2);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Specifiers;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 15) goto yyfl_9_1_2_1;
goto yysl_9_1_2;
yyfl_9_1_2_1 : ;
yy_2_2_1_1 = yyv_BL;
yy_2_2_1_2 = yy_2_2_1_1;
if (yy_2_2_1_2[0] != 19) goto yyfl_9_1_2_2;
setFirstDeclarator();
goto yysl_9_1_2;
yyfl_9_1_2_2 : ;
yy_2_3_1_1 = ((yy)",");
s(yy_2_3_1_1);
goto yysl_9_1_2;
yysl_9_1_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_Specifiers;
yy_3_2 = yyv_L;
EmitDeclarator(yy_3_1, yy_3_2);
return;
yyfl_9_1 : ;
}
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 19) goto yyfl_9_2;
return;
yyfl_9_2 : ;
}
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yy_0_2;
yy yy_0_2_1;
yy yyv_BL;
yy yy_0_2_1_1;
yy yyv_L;
yy yy_0_2_1_2;
yy yyv_G1;
yy yy_0_2_2;
yy yy_1_1;
yy yy_1_2;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_2_1_1;
yy yy_2_2_1_2;
yy yy_2_3_1_1;
yy yy_3_1;
yy yy_3_2;
yy yy_4_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 23) goto yyfl_9_3;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
if (yy_0_2_1[0] != 18) goto yyfl_9_3;
yy_0_2_1_1 = ((yy)yy_0_2_1[1]);
yy_0_2_1_2 = ((yy)yy_0_2_1[2]);
yyv_BL = yy_0_2_1_1;
yyv_L = yy_0_2_1_2;
yyv_G1 = yy_0_2_2;
yy_1_1 = yyv_Specifiers;
yy_1_2 = yyv_BL;
EmitDeclaratorList(yy_1_1, yy_1_2);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Specifiers;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 15) goto yyfl_9_3_2_1;
goto yysl_9_3_2;
yyfl_9_3_2_1 : ;
yy_2_2_1_1 = yyv_BL;
yy_2_2_1_2 = yy_2_2_1_1;
if (yy_2_2_1_2[0] != 19) goto yyfl_9_3_2_2;
setFirstDeclarator();
goto yysl_9_3_2;
yyfl_9_3_2_2 : ;
yy_2_3_1_1 = ((yy)",");
s(yy_2_3_1_1);
goto yysl_9_3_2;
yysl_9_3_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_Specifiers;
yy_3_2 = yyv_L;
EmitDeclarator(yy_3_1, yy_3_2);
yy_4_1 = yyv_G1;
ccd(yy_4_1);
return;
yyfl_9_3 : ;
}
yyErr(2,1331);
}
EmitDeclarator(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yyv_InitDeclarator;
yy yy_0_2;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yyv_Id1;
yy yy_2_1_1_2_1;
yy yy_2_1_2_1;
yy yy_2_1_2_2;
yy yyv_Id2;
yy yy_2_1_2_2_1;
yy yyv_GccAttr;
yy yy_2_1_2_2_2;
yy yy_2_1_3_1;
yy yy_2_1_3_2;
yy yy_2_1_3_2_1;
yy yyv_Id3;
yy yy_2_1_3_2_2;
yy yy_2_1_4_1;
yy yy_2_1_4_2;
yy yyv_IdName;
yy yy_2_1_4_2_1;
yy yyv_G;
yy yy_2_1_4_2_2;
yy yy_2_1_5_1;
yy yyv_Str;
yy yy_2_1_5_2;
yy yy_2_1_6_1;
yy yyv_Flag;
yy yy_3_1;
yy yy_4_1_1_1;
yy yy_4_1_1_2;
yy yy_4_1_2_1;
yy yy_5_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
yyv_InitDeclarator = yy_0_2;
unsetDeclaratorTarget();
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_InitDeclarator;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 26) goto yyfl_10_1_2_1;
yy_2_1_1_2_1 = ((yy)yy_2_1_1_2[1]);
yyv_Id1 = yy_2_1_1_2_1;
yy_2_1_2_1 = yyv_Id1;
yy_2_1_2_2 = yy_2_1_2_1;
if (yy_2_1_2_2[0] != 22) goto yyfl_10_1_2_1;
yy_2_1_2_2_1 = ((yy)yy_2_1_2_2[1]);
yy_2_1_2_2_2 = ((yy)yy_2_1_2_2[2]);
yyv_Id2 = yy_2_1_2_2_1;
yyv_GccAttr = yy_2_1_2_2_2;
yy_2_1_3_1 = yyv_Id2;
yy_2_1_3_2 = yy_2_1_3_1;
if (yy_2_1_3_2[0] != 29) goto yyfl_10_1_2_1;
yy_2_1_3_2_1 = ((yy)yy_2_1_3_2[1]);
yy_2_1_3_2_2 = ((yy)yy_2_1_3_2[2]);
if (yy_2_1_3_2_1[0] != 31) goto yyfl_10_1_2_1;
yyv_Id3 = yy_2_1_3_2_2;
yy_2_1_4_1 = yyv_Id3;
yy_2_1_4_2 = yy_2_1_4_1;
if (yy_2_1_4_2[0] != 33) goto yyfl_10_1_2_1;
yy_2_1_4_2_1 = ((yy)yy_2_1_4_2[1]);
yy_2_1_4_2_2 = ((yy)yy_2_1_4_2[2]);
yyv_IdName = yy_2_1_4_2_1;
yyv_G = yy_2_1_4_2_2;
yy_2_1_5_1 = yyv_IdName;
GetRepr2(yy_2_1_5_1, &yy_2_1_5_2);
yyv_Str = yy_2_1_5_2;
yy_2_1_6_1 = yyv_Str;
setDeclaratorTarget(yy_2_1_6_1);
goto yysl_10_1_2;
yyfl_10_1_2_1 : ;
goto yysl_10_1_2;
yysl_10_1_2 : ;
yyb = yysb;
}
isFirstDeclarator(&yy_3_1);
yyv_Flag = yy_3_1;
{
yy yysb = yyb;
yy_4_1_1_1 = yyv_Flag;
yy_4_1_1_2 = ((yy)1);
if ((long)yy_4_1_1_1 != (long)yy_4_1_1_2) goto yyfl_10_1_4_1;
yy_4_1_2_1 = yyv_Specifiers;
ccd(yy_4_1_2_1);
unsetFirstDeclarator();
goto yysl_10_1_4;
yyfl_10_1_4_1 : ;
goto yysl_10_1_4;
yysl_10_1_4 : ;
yyb = yysb;
}
yy_5_1 = yyv_InitDeclarator;
ccd(yy_5_1);
unsetDeclaratorTarget();
return;
}
}
EmitParameterDeclaration(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_DeclarationSpecifiers;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_DeclarationSpecifiers = yy_0_1;
yyv_Declarator = yy_0_2;
yy_1_1 = yyv_DeclarationSpecifiers;
ccd(yy_1_1);
yy_2_1 = yyv_Declarator;
ccd(yy_2_1);
return;
}
}
EmitAbstractParameterDeclaration(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_DeclarationSpecifiers;
yy yy_0_1;
yy yyv_AbstractDeclarator;
yy yy_0_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_DeclarationSpecifiers = yy_0_1;
yyv_AbstractDeclarator = yy_0_2;
yy_1_1 = yyv_DeclarationSpecifiers;
ccd(yy_1_1);
yy_2_1 = yyv_AbstractDeclarator;
ccd(yy_2_1);
return;
}
}
ccIdOpt(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_13_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id = yy_0_1_1;
yy_1_1 = yyv_Id;
id(yy_1_1);
yy_2_1 = ((yy)" ");
s(yy_2_1);
return;
yyfl_13_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_13_2;
return;
yyfl_13_2 : ;
}
yyErr(2,1402);
}
id(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy yy_1_1;
yy yyv_Str;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
yy_1_1 = yyv_Id;
GetRepr2(yy_1_1, &yy_1_2);
yyv_Str = yy_1_2;
yy_2_1 = yyv_Str;
s(yy_2_1);
return;
}
}
NL()
{
{
yy yyb;
true_nl();
return;
}
}
