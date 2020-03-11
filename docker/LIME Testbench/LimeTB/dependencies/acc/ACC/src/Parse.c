typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Parse", l);
}
extern yy yyglov_Var_Line;
int yyparse_rc = 0;
ROOT()
{
extern char *THIS_RUNTIME_SYSTEM;
char *GENTLE = "Gentle 3.0 01100401 (C) 1992, 1997";
if (strcmp(THIS_RUNTIME_SYSTEM, GENTLE))
{ printf("INCONSISTENT GENTLE RUNTIME SYSTEM\n"); exit(1); }
yyExtend();
yyparse_rc = yyparse();
}
if_typedef_then_patch(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
yy_1_1 = yyv_S;
if (! test_typedef_in_list(yy_1_1)) goto yyfl_256_1;
yy_2_1 = yyv_L;
patch_init_declarator_list_to_typedef(yy_2_1);
return;
yyfl_256_1 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
return;
yyfl_256_2 : ;
}
yyErr(2,2540);
}
patch_init_declarator_list_to_typedef(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Last;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_257_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 19) goto yyfl_257_1;
yyv_Last = yy_0_1_2;
yy_1_1 = yyv_Last;
patch_init_declarator_to_typedef(yy_1_1);
return;
yyfl_257_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_1_1;
yy yy_0_1_1_2;
yy yy_0_1_2;
yy yyv_GccAttr;
yy yy_0_1_2_1;
yy yyv_Last;
yy yy_0_1_2_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_257_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 23) goto yyfl_257_2;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
yy_0_1_1_2 = ((yy)yy_0_1_1[2]);
yyv_List = yy_0_1_1_1;
if (yy_0_1_1_2[0] != 48) goto yyfl_257_2;
if (yy_0_1_2[0] != 21) goto yyfl_257_2;
yy_0_1_2_1 = ((yy)yy_0_1_2[1]);
yy_0_1_2_2 = ((yy)yy_0_1_2[2]);
yyv_GccAttr = yy_0_1_2_1;
yyv_Last = yy_0_1_2_2;
yy_1_1 = yyv_List;
patch_init_declarator_list_to_typedef(yy_1_1);
yy_2_1 = yyv_Last;
patch_init_declarator_to_typedef(yy_2_1);
return;
yyfl_257_2 : ;
}
yyErr(2,2552);
}
patch_init_declarator_to_typedef(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_258_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_2_1 = yyv_Name;
yy_2_2 = yyb + 0;
yy_2_2[0] = 2;
patch_symbol_class(yy_2_1, yy_2_2);
return;
yyfl_258_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_258_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_2_1 = yyv_Name;
yy_2_2 = yyb + 0;
yy_2_2[0] = 2;
patch_symbol_class(yy_2_1, yy_2_2);
return;
yyfl_258_2 : ;
}
yyErr(2,2563);
}
get_declarator_name(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_P;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_259_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_P = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_259_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_P;
yy yy_0_1_1;
yy yyv_G;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 22) goto yyfl_259_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_P = yy_0_1_1;
yyv_G = yy_0_1_2;
yy_1_1 = yyv_P;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_259_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_P;
yy yy_0_1_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_259_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_P = yy_0_1_1;
yy_1_1 = yyv_P;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_259_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_259_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_259_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_G;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_259_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_G = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_259_5 : ;
}
yyErr(2,2578);
}
get_direct_declarator_name(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_G;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 33) goto yyfl_260_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id = yy_0_1_1;
yyv_G = yy_0_1_2;
yy_0_2 = yyv_Id;
*yyout_1 = yy_0_2;
return;
yyfl_260_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 34) goto yyfl_260_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_G;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_260_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_G = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_Index;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 35) goto yyfl_260_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_Index = yy_0_1_2;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_P;
yy yy_0_1_2;
yy yyv_G;
yy yy_0_1_3;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 36) goto yyfl_260_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_D = yy_0_1_1;
yyv_P = yy_0_1_2;
yyv_G = yy_0_1_3;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 37) goto yyfl_260_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yyv_Id;
yy yy_0_1_2_1;
yy yyv_G;
yy yy_0_1_2_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_260_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_2[0] != 33) goto yyfl_260_7;
yy_0_1_2_1 = ((yy)yy_0_1_2[1]);
yy_0_1_2_2 = ((yy)yy_0_1_2[2]);
yyv_Id = yy_0_1_2_1;
yyv_G = yy_0_1_2_2;
yy_0_2 = yyv_Id;
*yyout_1 = yy_0_2;
return;
yyfl_260_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_P;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_260_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_P = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D;
get_direct_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_0_2 = yyv_Name;
*yyout_1 = yy_0_2;
return;
yyfl_260_8 : ;
}
yyErr(2,2598);
}
int test_typedef_in_list(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_L;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 16) goto yyfl_261_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_L = yy_0_1_2;
yy_1_1 = yyv_L;
if (! test_typedef_in_list(yy_1_1)) goto yyfl_261_1;
return 1;
yyfl_261_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_1_1;
yy yyv_L;
yy yy_0_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_261_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 39) goto yyfl_261_2;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
if (yy_0_1_1_1[0] != 45) goto yyfl_261_2;
yyv_L = yy_0_1_2;
return 1;
yyfl_261_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_S;
yy yy_0_1_1;
yy yyv_L;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 17) goto yyfl_261_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_S = yy_0_1_1;
yyv_L = yy_0_1_2;
yy_1_1 = yyv_L;
if (! test_typedef_in_list(yy_1_1)) goto yyfl_261_3;
return 1;
yyfl_261_3 : ;
}
return 0;
}
if_declarator_then_patch(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
yy_1_1 = yyv_S;
if (! test_typedef_in_list(yy_1_1)) goto yyfl_262_1;
return;
yyfl_262_1 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
yy_1_1 = yyv_L;
patch_init_declarator_list_to_ident(yy_1_1);
return;
yyfl_262_2 : ;
}
yyErr(2,2655);
}
patch_init_declarator_list_to_ident(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Last;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_263_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 19) goto yyfl_263_1;
yyv_Last = yy_0_1_2;
yy_1_1 = yyv_Last;
patch_init_declarator_to_ident(yy_1_1);
return;
yyfl_263_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_List;
yy yy_0_1_1_1;
yy yy_0_1_1_2;
yy yy_0_1_2;
yy yyv_GccAttr;
yy yy_0_1_2_1;
yy yyv_Last;
yy yy_0_1_2_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_263_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 23) goto yyfl_263_2;
yy_0_1_1_1 = ((yy)yy_0_1_1[1]);
yy_0_1_1_2 = ((yy)yy_0_1_1[2]);
yyv_List = yy_0_1_1_1;
if (yy_0_1_1_2[0] != 48) goto yyfl_263_2;
if (yy_0_1_2[0] != 21) goto yyfl_263_2;
yy_0_1_2_1 = ((yy)yy_0_1_2[1]);
yy_0_1_2_2 = ((yy)yy_0_1_2[2]);
yyv_GccAttr = yy_0_1_2_1;
yyv_Last = yy_0_1_2_2;
yy_1_1 = yyv_List;
patch_init_declarator_list_to_ident(yy_1_1);
yy_2_1 = yyv_Last;
patch_init_declarator_to_ident(yy_2_1);
return;
yyfl_263_2 : ;
}
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
return;
yyfl_263_3 : ;
}
yyErr(2,2664);
}
patch_init_declarator_to_ident(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy yy_2_1;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_264_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_2_1 = yyv_Name;
if (! test_symclass_is_typedef(yy_2_1)) goto yyfl_264_1;
yy_3_1 = yyv_Name;
yy_3_2 = yyb + 0;
yy_3_2[0] = 3;
patch_symbol_class(yy_3_1, yy_3_2);
return;
yyfl_264_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy yy_2_1;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_264_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_2_1 = yyv_Name;
if (! test_symclass_is_typedef(yy_2_1)) goto yyfl_264_2;
yy_3_1 = yyv_Name;
yy_3_2 = yyb + 0;
yy_3_2[0] = 3;
patch_symbol_class(yy_3_1, yy_3_2);
return;
yyfl_264_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_264_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
return;
yyfl_264_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_264_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
return;
yyfl_264_4 : ;
}
yyErr(2,2675);
}
int test_symclass_is_typedef(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Name;
yy yy_0_1;
yy yy_1_1;
yy yyv_Flag;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Name = yy_0_1;
yy_1_1 = yyv_Name;
if (! test_symclass_typedef(yy_1_1, &yy_1_2)) goto yyfl_265_1;
yyv_Flag = yy_1_2;
yy_2_1 = yyv_Flag;
yy_2_2 = ((yy)1);
if ((long)yy_2_1 != (long)yy_2_2) goto yyfl_265_1;
return 1;
yyfl_265_1 : ;
}
return 0;
}
patch_param_declarator(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
if (yy_0_2[0] != 112) goto yyfl_266_1;
return;
yyfl_266_1 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yy_0_2;
yy yyv_P;
yy yy_0_2_1;
yy yyv_D;
yy yy_0_2_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
if (yy_0_2[0] != 111) goto yyfl_266_2;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_P = yy_0_2_1;
yyv_D = yy_0_2_2;
return;
yyfl_266_2 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_D;
yy yy_0_2;
yy yy_1_1;
yy yyv_Name;
yy yy_1_2;
yy yy_2_1;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_D = yy_0_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = yyv_D;
get_declarator_name(yy_1_1, &yy_1_2);
yyv_Name = yy_1_2;
yy_2_1 = yyv_Name;
if (! test_symclass_is_typedef(yy_2_1)) goto yyfl_266_3;
yy_3_1 = yyv_Name;
yy_3_2 = yyb + 0;
yy_3_2[0] = 3;
patch_symbol_class(yy_3_1, yy_3_2);
return;
yyfl_266_3 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_D;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_D = yy_0_2;
return;
yyfl_266_4 : ;
}
yyErr(2,2703);
}
if_func_declarator_then_leave_scope(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
yy_1_1 = yyv_L;
if (! test_func_declarator(yy_1_1)) goto yyfl_267_1;
leave_patch_scope();
return;
yyfl_267_1 : ;
}
{
yy yyb;
yy yyv_S;
yy yy_0_1;
yy yyv_L;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_S = yy_0_1;
yyv_L = yy_0_2;
return;
yyfl_267_2 : ;
}
yyErr(2,2720);
}
int test_func_declarator(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yyv_Last;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_268_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
if (yy_0_1_1[0] != 19) goto yyfl_268_1;
yyv_Last = yy_0_1_2;
yy_1_1 = yyv_Last;
if (! test_func_declarator(yy_1_1)) goto yyfl_268_1;
return 1;
yyfl_268_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_268_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
yy_1_1 = yyv_D;
if (! test_func_declarator(yy_1_1)) goto yyfl_268_2;
return 1;
yyfl_268_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_G;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 22) goto yyfl_268_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_G = yy_0_1_2;
yy_1_1 = yyv_D;
if (! test_func_declarator(yy_1_1)) goto yyfl_268_3;
return 1;
yyfl_268_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_P;
yy yy_0_1_1;
yy yyv_D;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 29) goto yyfl_268_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_P = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D;
if (! test_func_declarator(yy_1_1)) goto yyfl_268_4;
return 1;
yyfl_268_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_P;
yy yy_0_1_2;
yy yyv_G;
yy yy_0_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 36) goto yyfl_268_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_D = yy_0_1_1;
yyv_P = yy_0_1_2;
yyv_G = yy_0_1_3;
return 1;
yyfl_268_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy yyv_I;
yy yy_0_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 37) goto yyfl_268_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D = yy_0_1_1;
yyv_I = yy_0_1_2;
return 1;
yyfl_268_6 : ;
}
return 0;
}
