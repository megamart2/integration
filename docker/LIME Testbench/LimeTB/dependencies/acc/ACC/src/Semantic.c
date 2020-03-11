/*
 * ASPECT-ORIENTED C (ACC) - an aspect-oriented extension for the C language
 *
 * Copyright (C) 2006 . All rights reserved.
 *
 * Weigang (Michael) Gong, Hans-Arno-Jacobsen
 *
 * ACC development team (www.aspectc.net),
 * Middleware Systems Research Group (www.msrg.utoronto.ca),
 * University of Toronto.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Semantic", l);
}
SemanticUnit(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
yy_1_1 = yyv_D;
Scode_external_declaration_list(yy_1_1);
return;
}
}
Scode_external_declaration_list(yyin_1)
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
Scode_external_declaration_list(yy_1_1);
yy_2_1 = yyv_Decl;
Scode_external_decl(yy_2_1);
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
yyErr(2,34);
}
Scode_external_decl(yyin_1)
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
Sccd(yy_1_1);
return;
}
}
SccS(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_4_1;
return;
yyfl_4_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_List;
yy yy_0_1_1;
yy yyv_DeclStmt;
yy yy_0_1_2;
yy yyv_Line;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_4_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_List = yy_0_1_1;
yyv_DeclStmt = yy_0_1_2;
yyv_Line = yy_0_1_3;
yy_1_1 = yyv_List;
SccS(yy_1_1);
yy_2_1 = yyv_DeclStmt;
SccS(yy_2_1);
return;
yyfl_4_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Decl;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_4_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Decl = yy_0_1_1;
yy_1_1 = yyv_Decl;
Sccd(yy_1_1);
return;
yyfl_4_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Stmt;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 21) goto yyfl_4_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Stmt = yy_0_1_1;
return;
yyfl_4_4 : ;
}
yyErr(2,51);
}
Sccd(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_5_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
return;
yyfl_5_1 : ;
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
if (yy_0_1[0] != 172) goto yyfl_5_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Desig = yy_0_1_1;
yyv_Init = yy_0_1_2;
yy_1_1 = yyv_Desig;
Sccd(yy_1_1);
yy_2_1 = yyv_Init;
Sccd(yy_2_1);
return;
yyfl_5_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_D;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_5_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_D = yy_0_1_1;
return;
yyfl_5_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 165) goto yyfl_5_4;
return;
yyfl_5_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Desig_list;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 166) goto yyfl_5_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Desig_list = yy_0_1_1;
yy_1_1 = yyv_Desig_list;
Sccd(yy_1_1);
return;
yyfl_5_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 167) goto yyfl_5_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
Sid(yy_1_1);
return;
yyfl_5_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 168) goto yyfl_5_7;
return;
yyfl_5_7 : ;
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
if (yy_0_1[0] != 169) goto yyfl_5_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Desig = yy_0_1_2;
yy_1_1 = yyv_List;
Sccd(yy_1_1);
yy_2_1 = yyv_Desig;
Sccd(yy_2_1);
return;
yyfl_5_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expr;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 170) goto yyfl_5_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expr = yy_0_1_1;
return;
yyfl_5_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 171) goto yyfl_5_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
Sid(yy_1_1);
return;
yyfl_5_10 : ;
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
yy yy_4_1;
yy yy_5_1_1_1;
yy yy_5_1_1_2;
yy yyv_DeclStmtList;
yy yy_5_1_1_2_1;
yy yy_5_1_2_1;
yy yy_5_1_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_5_11;
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
yy_1_1 = ((yy)"func");
initDeclCollection(yy_1_1);
yy_2_1 = yyv_DeclSpecifiersOpt;
Sccd(yy_2_1);
yy_3_1 = yyv_Declarator;
Sccd(yy_3_1);
yy_4_1 = yyv_DeclarationListOpt;
Sccd(yy_4_1);
{
yy yysb = yyb;
yy_5_1_1_1 = yyv_Statement;
yy_5_1_1_2 = yy_5_1_1_1;
if (yy_5_1_1_2[0] != 5) goto yyfl_5_11_5_1;
yy_5_1_1_2_1 = ((yy)yy_5_1_1_2[1]);
yyv_DeclStmtList = yy_5_1_1_2_1;
yy_5_1_2_1 = ((yy)"funcbody");
initDeclCollection(yy_5_1_2_1);
yy_5_1_3_1 = yyv_DeclStmtList;
SccS(yy_5_1_3_1);
endDeclCollection();
goto yysl_5_11_5;
yyfl_5_11_5_1 : ;
goto yysl_5_11_5;
yysl_5_11_5 : ;
yyb = yysb;
}
endDeclCollection();
return;
yyfl_5_11 : ;
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
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_1_1_2_1;
yy yy_1_2_1_1;
yy yy_1_2_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_5_12;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_InitDeclaratorListOpt = yy_0_1_2;
yyv_Pos = yy_0_1_3;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_InitDeclaratorListOpt;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 19) goto yyfl_5_12_1_1;
yy_1_1_2_1 = yyv_DeclarationSpecifiers;
Sccd(yy_1_1_2_1);
goto yysl_5_12_1;
yyfl_5_12_1_1 : ;
yy_1_2_1_1 = yyv_DeclarationSpecifiers;
yy_1_2_1_2 = yyv_InitDeclaratorListOpt;
SEmitDeclaration(yy_1_2_1_1, yy_1_2_1_2);
goto yysl_5_12_1;
yysl_5_12_1 : ;
yyb = yysb;
}
return;
yyfl_5_12 : ;
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
if (yy_0_1[0] != 13) goto yyfl_5_13;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationList = yy_0_1_1;
yyv_Declaration = yy_0_1_2;
yy_1_1 = yyv_DeclarationList;
Sccd(yy_1_1);
yy_2_1 = yyv_Declaration;
Sccd(yy_2_1);
return;
yyfl_5_13 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 14) goto yyfl_5_14;
return;
yyfl_5_14 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 15) goto yyfl_5_15;
return;
yyfl_5_15 : ;
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
if (yy_0_1[0] != 16) goto yyfl_5_16;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccExtension = yy_0_1_1;
yyv_DeclSpecifiers = yy_0_1_2;
yy_1_1 = yyv_GccExtension;
Sccd(yy_1_1);
yy_2_1 = yyv_DeclSpecifiers;
Sccd(yy_2_1);
return;
yyfl_5_16 : ;
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
if (yy_0_1[0] != 17) goto yyfl_5_17;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Specifier;
Sccd(yy_1_1);
yy_2_1 = yyv_List;
Sccd(yy_2_1);
return;
yyfl_5_17 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 46) goto yyfl_5_18;
return;
yyfl_5_18 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 47) goto yyfl_5_19;
return;
yyfl_5_19 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_K;
yy yy_0_1_1;
yy yyv_G;
yy yy_0_1_2;
yy yyv_V;
yy yy_0_1_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_5_20;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_K = yy_0_1_1;
yyv_G = yy_0_1_2;
yyv_V = yy_0_1_3;
return;
yyfl_5_20 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_5_21;
return;
yyfl_5_21 : ;
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
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 18) goto yyfl_5_22;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 19) goto yyfl_5_22_1_1;
goto yysl_5_22_1;
yyfl_5_22_1_1 : ;
yy_1_2_1_1 = yyv_List;
Sccd(yy_1_2_1_1);
goto yysl_5_22_1;
yysl_5_22_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
yyfl_5_22 : ;
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
if (yy_0_1[0] != 21) goto yyfl_5_23;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccAttr = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_GccAttr;
Sccd(yy_1_1);
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
yyfl_5_23 : ;
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
if (yy_0_1[0] != 22) goto yyfl_5_24;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_GccAttr = yy_0_1_2;
yy_1_1 = yyv_Declarator;
Sccd(yy_1_1);
yy_2_1 = yyv_GccAttr;
Sccd(yy_2_1);
return;
yyfl_5_24 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 24) goto yyfl_5_25;
return;
yyfl_5_25 : ;
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
if (yy_0_1[0] != 25) goto yyfl_5_26;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_SpecList = yy_0_1_1;
yyv_Spec = yy_0_1_2;
yy_1_1 = yyv_SpecList;
Sccd(yy_1_1);
yy_2_1 = yyv_Spec;
Sccd(yy_2_1);
return;
yyfl_5_26 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 19) goto yyfl_5_27;
return;
yyfl_5_27 : ;
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
yy_0_1 = yyin_1;
if (yy_0_1[0] != 20) goto yyfl_5_28;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_Initializer = yy_0_1_2;
yy_1_1 = yyv_Declarator;
Sccd(yy_1_1);
yy_2_1 = yyv_Initializer;
Sccd(yy_2_1);
return;
yyfl_5_28 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 26) goto yyfl_5_29;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Declarator = yy_0_1_1;
yy_1_1 = yyv_Declarator;
Sccd(yy_1_1);
return;
yyfl_5_29 : ;
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
yy yyv_Flag;
yy yy_2_1;
yy yy_3_1_1_1;
yy yy_3_1_1_2;
yy yy_3_1_2_1;
yy yy_3_1_3_1;
yy yyv_Str;
yy yy_3_1_3_2;
yy yy_3_1_4_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 27) goto yyfl_5_30;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Identifier = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 28) goto yyfl_5_30_1_1;
goto yysl_5_30_1;
yyfl_5_30_1_1 : ;
yy_1_2_1_1 = yyv_List;
Sccd(yy_1_2_1_1);
goto yysl_5_30_1;
yysl_5_30_1 : ;
yyb = yysb;
}
isKNRDecl(&yy_2_1);
yyv_Flag = yy_2_1;
{
yy yysb = yyb;
yy_3_1_1_1 = yyv_Flag;
yy_3_1_1_2 = ((yy)1);
if ((long)yy_3_1_1_1 != (long)yy_3_1_1_2) goto yyfl_5_30_3_1;
yy_3_1_2_1 = ((yy)"param");
initDeclCollection(yy_3_1_2_1);
yy_3_1_3_1 = yyv_Identifier;
GetRepr2(yy_3_1_3_1, &yy_3_1_3_2);
yyv_Str = yy_3_1_3_2;
yy_3_1_4_1 = yyv_Str;
setId(yy_3_1_4_1);
endDeclCollection();
goto yysl_5_30_3;
yyfl_5_30_3_1 : ;
goto yysl_5_30_3;
yysl_5_30_3 : ;
yyb = yysb;
}
yy_4_1 = yyv_Identifier;
Sid(yy_4_1);
return;
yyfl_5_30 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 28) goto yyfl_5_31;
return;
yyfl_5_31 : ;
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
if (yy_0_1[0] != 29) goto yyfl_5_32;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Pointer = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_Pointer;
Sccd(yy_1_1);
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
yyfl_5_32 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 30) goto yyfl_5_33;
return;
yyfl_5_33 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 31) goto yyfl_5_34;
return;
yyfl_5_34 : ;
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
yy yy_1_1_3_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 116) goto yyfl_5_35;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParenDecl = yy_0_1_1;
yyv_Params = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParenDecl;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 114) goto yyfl_5_35_1_1;
yy_1_1_1_2_1 = ((yy)yy_1_1_1_2[1]);
yyv_Tp = yy_1_1_1_2_1;
enter_paren_declarator();
yy_1_1_3_1 = yyv_Tp;
Sccd(yy_1_1_3_1);
leave_paren_declarator();
goto yysl_5_35_1;
yyfl_5_35_1_1 : ;
goto yysl_5_35_1;
yysl_5_35_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Params;
Sccd(yy_2_1);
return;
yyfl_5_35 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_TypeQualifierList;
yy yy_0_1_1;
yy yyv_Pointer;
yy yy_0_1_2;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 32) goto yyfl_5_36;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_TypeQualifierList = yy_0_1_1;
yyv_Pointer = yy_0_1_2;
setPointerType();
yy_2_1 = yyv_TypeQualifierList;
Sccd(yy_2_1);
yy_3_1 = yyv_Pointer;
Sccd(yy_3_1);
return;
yyfl_5_36 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_GccAttribute;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy yyv_Str;
yy yy_2_2;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 33) goto yyfl_5_37;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Ident = yy_0_1_1;
yyv_GccAttribute = yy_0_1_2;
yy_1_1 = yyv_Ident;
Sid(yy_1_1);
yy_2_1 = yyv_Ident;
GetRepr2(yy_2_1, &yy_2_2);
yyv_Str = yy_2_2;
yy_3_1 = yyv_Str;
setId(yy_3_1);
yy_4_1 = yyv_GccAttribute;
Sccd(yy_4_1);
return;
yyfl_5_37 : ;
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
if (yy_0_1[0] != 38) goto yyfl_5_38;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_Post_spec = yy_0_1_2;
yy_1_1 = yyv_Declarator;
Sccd(yy_1_1);
yy_2_1 = yyv_Post_spec;
Sccd(yy_2_1);
return;
yyfl_5_38 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 48) goto yyfl_5_39;
return;
yyfl_5_39 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_MultiAttributes;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 66) goto yyfl_5_40;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_MultiAttributes = yy_0_1_1;
yy_1_1 = yyv_MultiAttributes;
Sccd(yy_1_1);
return;
yyfl_5_40 : ;
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
if (yy_0_1[0] != 65) goto yyfl_5_41;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_OneAttribute = yy_0_1_2;
yy_1_1 = yyv_List;
Sccd(yy_1_1);
yy_2_1 = yyv_OneAttribute;
Sccd(yy_2_1);
return;
yyfl_5_41 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_AttributeSpec;
yy yy_0_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 49) goto yyfl_5_42;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_AttributeSpec = yy_0_1_1;
enter_gcc_attribute();
yy_2_1 = yyv_AttributeSpec;
Sccd(yy_2_1);
leave_gcc_attribute();
return;
yyfl_5_42 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_AttributeSpec;
yy yy_0_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 50) goto yyfl_5_43;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_AttributeSpec = yy_0_1_1;
enter_gcc_attribute();
yy_2_1 = yyv_AttributeSpec;
Sccd(yy_2_1);
leave_gcc_attribute();
return;
yyfl_5_43 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttributeList;
yy yy_0_1_1;
yy yyv_GccAttribute;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 51) goto yyfl_5_44;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccAttributeList = yy_0_1_1;
yyv_GccAttribute = yy_0_1_2;
yy_1_1 = yyv_GccAttributeList;
Sccd(yy_1_1);
yy_2_1 = yyv_GccAttribute;
Sccd(yy_2_1);
return;
yyfl_5_44 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 52) goto yyfl_5_45;
return;
yyfl_5_45 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 53) goto yyfl_5_46;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id = yy_0_1_1;
yy_1_1 = yyv_Id;
Sid(yy_1_1);
return;
yyfl_5_46 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_KeyWord;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 54) goto yyfl_5_47;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_KeyWord = yy_0_1_1;
yy_1_1 = yyv_KeyWord;
Sccd(yy_1_1);
return;
yyfl_5_47 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy yyv_ExprList;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 55) goto yyfl_5_48;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Id = yy_0_1_1;
yyv_ExprList = yy_0_1_2;
yy_1_1 = yyv_Id;
Sid(yy_1_1);
return;
yyfl_5_48 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 157) goto yyfl_5_49;
return;
yyfl_5_49 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 158) goto yyfl_5_50;
return;
yyfl_5_50 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 34) goto yyfl_5_51;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Declarator = yy_0_1_1;
enter_paren_declarator();
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
leave_paren_declarator();
return;
yyfl_5_51 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_ConstExprOpt;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 35) goto yyfl_5_52;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_ConstExprOpt = yy_0_1_2;
yy_1_1 = yyv_Declarator;
Sccd(yy_1_1);
setPointerType();
return;
yyfl_5_52 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_ParameterTypeList;
yy yy_0_1_2;
yy yyv_GccAttribute;
yy yy_0_1_3;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 36) goto yyfl_5_53;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Declarator = yy_0_1_1;
yyv_ParameterTypeList = yy_0_1_2;
yyv_GccAttribute = yy_0_1_3;
setFuncDecl();
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
yy_3_1 = yyv_ParameterTypeList;
Sccd(yy_3_1);
yy_4_1 = yyv_GccAttribute;
Sccd(yy_4_1);
setEndFuncDeclarator();
return;
yyfl_5_53 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Declarator;
yy yy_0_1_1;
yy yyv_IdentListOpt;
yy yy_0_1_2;
yy yy_1_1_1_1;
yy yy_1_1_1_2;
yy yy_2_1;
yy yy_4_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 37) goto yyfl_5_54;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator = yy_0_1_1;
yyv_IdentListOpt = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_IdentListOpt;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 28) goto yyfl_5_54_1_1;
setFuncDecl();
goto yysl_5_54_1;
yyfl_5_54_1_1 : ;
setFuncDecl_old();
goto yysl_5_54_1;
yysl_5_54_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
setDeclIsFuncLike();
yy_4_1 = yyv_IdentListOpt;
Sccd(yy_4_1);
setEndFuncDeclarator();
return;
yyfl_5_54 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Class;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 39) goto yyfl_5_55;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Class = yy_0_1_1;
yy_1_1 = yyv_Class;
Sccd(yy_1_1);
return;
yyfl_5_55 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 40) goto yyfl_5_56;
return;
yyfl_5_56 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 41) goto yyfl_5_57;
return;
yyfl_5_57 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 42) goto yyfl_5_58;
return;
yyfl_5_58 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 43) goto yyfl_5_59;
yy_1_1 = ((yy)"static");
setStorageClass(yy_1_1);
return;
yyfl_5_59 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 44) goto yyfl_5_60;
return;
yyfl_5_60 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 45) goto yyfl_5_61;
setInsideATypedefDecl();
return;
yyfl_5_61 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 67) goto yyfl_5_62;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Specifier = yy_0_1_1;
yy_1_1 = yyv_Specifier;
Sccd(yy_1_1);
return;
yyfl_5_62 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 68) goto yyfl_5_63;
yy_1_1 = ((yy)"void");
setType(yy_1_1);
return;
yyfl_5_63 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 69) goto yyfl_5_64;
yy_1_1 = ((yy)"char");
setType(yy_1_1);
return;
yyfl_5_64 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 70) goto yyfl_5_65;
yy_1_1 = ((yy)"short");
setType(yy_1_1);
return;
yyfl_5_65 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 71) goto yyfl_5_66;
yy_1_1 = ((yy)"int");
setType(yy_1_1);
return;
yyfl_5_66 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 72) goto yyfl_5_67;
yy_1_1 = ((yy)"_Complex");
setType(yy_1_1);
return;
yyfl_5_67 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 73) goto yyfl_5_68;
yy_1_1 = ((yy)"_Imaginary");
setType(yy_1_1);
return;
yyfl_5_68 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 80) goto yyfl_5_69;
yy_1_1 = ((yy)"_Bool");
setType(yy_1_1);
return;
yyfl_5_69 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 74) goto yyfl_5_70;
yy_1_1 = ((yy)"long");
setType(yy_1_1);
return;
yyfl_5_70 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 75) goto yyfl_5_71;
yy_1_1 = ((yy)"float");
setType(yy_1_1);
return;
yyfl_5_71 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 85) goto yyfl_5_72;
yy_1_1 = ((yy)"__builtin_va_list");
setType(yy_1_1);
return;
yyfl_5_72 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 76) goto yyfl_5_73;
yy_1_1 = ((yy)"double");
setType(yy_1_1);
return;
yyfl_5_73 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 77) goto yyfl_5_74;
yy_1_1 = ((yy)"signed");
setType(yy_1_1);
return;
yyfl_5_74 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 78) goto yyfl_5_75;
yy_1_1 = ((yy)"__signed__");
setType(yy_1_1);
return;
yyfl_5_75 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 79) goto yyfl_5_76;
yy_1_1 = ((yy)"unsigned");
setType(yy_1_1);
return;
yyfl_5_76 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yyv_Str;
yy yy_2_2;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 86) goto yyfl_5_77;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Ident = yy_0_1_1;
yy_1_1 = yyv_Ident;
Sid(yy_1_1);
yy_2_1 = yyv_Ident;
GetRepr2(yy_2_1, &yy_2_2);
yyv_Str = yy_2_2;
yy_3_1 = yyv_Str;
setType(yy_3_1);
return;
yyfl_5_77 : ;
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
yy_0_1 = yyin_1;
if (yy_0_1[0] != 88) goto yyfl_5_78;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Op = yy_0_1_1;
yyv_Expr = yy_0_1_2;
yy_1_1 = yyv_Op;
Sccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Expr;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 3) goto yyfl_5_78_2_1;
yy_2_1_1_2_1 = ((yy)yy_2_1_1_2[1]);
yyv_T = yy_2_1_1_2_1;
yy_2_1_2_1 = yyv_T;
Sccd(yy_2_1_2_1);
goto yysl_5_78_2;
yyfl_5_78_2_1 : ;
yy_2_2_1_1 = ((yy)"a_typeof_expr");
setType(yy_2_2_1_1);
goto yysl_5_78_2;
yysl_5_78_2 : ;
yyb = yysb;
}
return;
yyfl_5_78 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 89) goto yyfl_5_79;
return;
yyfl_5_79 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 90) goto yyfl_5_80;
return;
yyfl_5_80 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 91) goto yyfl_5_81;
return;
yyfl_5_81 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Qualifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 87) goto yyfl_5_82;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Qualifier = yy_0_1_1;
yy_1_1 = yyv_Qualifier;
Sccd(yy_1_1);
return;
yyfl_5_82 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 92) goto yyfl_5_83;
yy_1_1 = ((yy)"const");
setQualifier(yy_1_1);
return;
yyfl_5_83 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 97) goto yyfl_5_84;
yy_1_1 = ((yy)"__const");
setQualifier(yy_1_1);
return;
yyfl_5_84 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 56) goto yyfl_5_85;
yy_1_1 = ((yy)"__restrict");
setQualifier(yy_1_1);
return;
yyfl_5_85 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Specifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 81) goto yyfl_5_86;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Specifier = yy_0_1_1;
yy_1_1 = yyv_Specifier;
Sccd(yy_1_1);
return;
yyfl_5_86 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 82) goto yyfl_5_87;
return;
yyfl_5_87 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 83) goto yyfl_5_88;
return;
yyfl_5_88 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 84) goto yyfl_5_89;
return;
yyfl_5_89 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 93) goto yyfl_5_90;
yy_1_1 = ((yy)"volatile");
setQualifier(yy_1_1);
return;
yyfl_5_90 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 94) goto yyfl_5_91;
yy_1_1 = ((yy)"__volatile");
setQualifier(yy_1_1);
return;
yyfl_5_91 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 95) goto yyfl_5_92;
yy_1_1 = ((yy)"__volatile__");
setQualifier(yy_1_1);
return;
yyfl_5_92 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Filename;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 149) goto yyfl_5_93;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Filename = yy_0_1_1;
return;
yyfl_5_93 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_RetType;
yy yy_0_1_1;
yy yyv_Id;
yy yy_0_1_2;
yy yyv_ParamType;
yy yy_0_1_3;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 150) goto yyfl_5_94;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_RetType = yy_0_1_1;
yyv_Id = yy_0_1_2;
yyv_ParamType = yy_0_1_3;
yy_1_1 = yyv_RetType;
Sccd(yy_1_1);
yy_2_1 = yyv_Id;
Sid(yy_2_1);
yy_3_1 = yyv_ParamType;
Sccd(yy_3_1);
return;
yyfl_5_94 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ArgList;
yy yy_0_1_1;
yy yyv_ArgDeclarations;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 151) goto yyfl_5_95;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ArgList = yy_0_1_1;
yyv_ArgDeclarations = yy_0_1_2;
yy_1_1 = yyv_ArgList;
Sccd(yy_1_1);
yy_2_1 = yyv_ArgDeclarations;
Sccd(yy_2_1);
return;
yyfl_5_95 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ArgDecls;
yy yy_0_1_1;
yy yyv_ArgDeclaration;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 152) goto yyfl_5_96;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ArgDecls = yy_0_1_1;
yyv_ArgDeclaration = yy_0_1_2;
yy_1_1 = yyv_ArgDecls;
Sccd(yy_1_1);
yy_2_1 = yyv_ArgDeclaration;
Sccd(yy_2_1);
return;
yyfl_5_96 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 153) goto yyfl_5_97;
return;
yyfl_5_97 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_ArgsType;
yy yy_0_1_1;
yy yyv_Declarator;
yy yy_0_1_2;
yy yy_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 154) goto yyfl_5_98;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ArgsType = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_ArgsType;
Sccd(yy_1_1);
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
yyfl_5_98 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 155) goto yyfl_5_99;
return;
yyfl_5_99 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 156) goto yyfl_5_100;
return;
yyfl_5_100 : ;
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
yy yyv_Position;
yy yy_0_1_4;
yy yyv_Pointcut;
yy yy_0_1_5;
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 159) goto yyfl_5_101;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yy_0_1_5 = ((yy)yy_0_1[5]);
yyv_DeclSpecifiersOpt = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yyv_Statement = yy_0_1_3;
yyv_Position = yy_0_1_4;
yyv_Pointcut = yy_0_1_5;
yy_1_1 = yyv_DeclSpecifiersOpt;
Sccd(yy_1_1);
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
yy_3_1 = yyv_Pointcut;
Sccd(yy_3_1);
return;
yyfl_5_101 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Expression;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 98) goto yyfl_5_102;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Expression = yy_0_1_1;
return;
yyfl_5_102 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitializerList;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 99) goto yyfl_5_103;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_InitializerList = yy_0_1_1;
yy_1_1 = yyv_InitializerList;
Sccd(yy_1_1);
return;
yyfl_5_103 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_InitializerList;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 100) goto yyfl_5_104;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_InitializerList = yy_0_1_1;
yy_1_1 = yyv_InitializerList;
Sccd(yy_1_1);
return;
yyfl_5_104 : ;
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
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 101) goto yyfl_5_105;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_InitializerList = yy_0_1_1;
yyv_Initializer = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_InitializerList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 102) goto yyfl_5_105_1_1;
goto yysl_5_105_1;
yyfl_5_105_1_1 : ;
yy_1_2_1_1 = yyv_InitializerList;
Sccd(yy_1_2_1_1);
goto yysl_5_105_1;
yysl_5_105_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Initializer;
Sccd(yy_2_1);
return;
yyfl_5_105 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 102) goto yyfl_5_106;
return;
yyfl_5_106 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 103) goto yyfl_5_107;
return;
yyfl_5_107 : ;
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
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 104) goto yyfl_5_108;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParameterList = yy_0_1_1;
yyv_Ellipsis = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParameterList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 106) goto yyfl_5_108_1_1;
goto yysl_5_108_1;
yyfl_5_108_1_1 : ;
yy_1_2_1_1 = yyv_ParameterList;
Sccd(yy_1_2_1_1);
{
yy yysb = yyb;
yy_1_2_2_1_1_1 = yyv_Ellipsis;
yy_1_2_2_1_1_2 = yy_1_2_2_1_1_1;
if (yy_1_2_2_1_1_2[0] != 108) goto yyfl_5_108_1_2_2_1;
setEllipsis();
goto yysl_5_108_1_2_2;
yyfl_5_108_1_2_2_1 : ;
goto yysl_5_108_1_2_2;
yysl_5_108_1_2_2 : ;
yyb = yysb;
}
goto yysl_5_108_1;
yysl_5_108_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Ellipsis;
Sccd(yy_2_1);
return;
yyfl_5_108 : ;
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
yy yy_2_1;
yy yy_3_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 105) goto yyfl_5_109;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_ParameterList = yy_0_1_1;
yyv_ParameterDeclaration = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_ParameterList;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 106) goto yyfl_5_109_1_1;
goto yysl_5_109_1;
yyfl_5_109_1_1 : ;
yy_1_2_1_1 = yyv_ParameterList;
Sccd(yy_1_2_1_1);
goto yysl_5_109_1;
yysl_5_109_1 : ;
yyb = yysb;
}
yy_2_1 = ((yy)"param");
initDeclCollection(yy_2_1);
yy_3_1 = yyv_ParameterDeclaration;
Sccd(yy_3_1);
endDeclCollection();
return;
yyfl_5_109 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 106) goto yyfl_5_110;
return;
yyfl_5_110 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 107) goto yyfl_5_111;
return;
yyfl_5_111 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 108) goto yyfl_5_112;
return;
yyfl_5_112 : ;
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
if (yy_0_1[0] != 109) goto yyfl_5_113;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
yy_1_1 = yyv_DeclarationSpecifiers;
yy_1_2 = yyv_Declarator;
SEmitParameterDeclaration(yy_1_1, yy_1_2);
return;
yyfl_5_113 : ;
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
if (yy_0_1[0] != 110) goto yyfl_5_114;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_DeclarationSpecifiers = yy_0_1_1;
yyv_AbstractDeclarator = yy_0_1_2;
yy_1_1 = yyv_DeclarationSpecifiers;
yy_1_2 = yyv_AbstractDeclarator;
SEmitAbstractParameterDeclaration(yy_1_1, yy_1_2);
return;
yyfl_5_114 : ;
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
if (yy_0_1[0] != 111) goto yyfl_5_115;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Pointer = yy_0_1_1;
yyv_DirectAbstractDeclarator = yy_0_1_2;
yy_1_1 = yyv_Pointer;
Sccd(yy_1_1);
yy_2_1 = yyv_DirectAbstractDeclarator;
Sccd(yy_2_1);
return;
yyfl_5_115 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 112) goto yyfl_5_116;
return;
yyfl_5_116 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 113) goto yyfl_5_117;
return;
yyfl_5_117 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_AbstractDeclarator;
yy yy_0_1_1;
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 114) goto yyfl_5_118;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_AbstractDeclarator = yy_0_1_1;
enter_paren_declarator();
yy_2_1 = yyv_AbstractDeclarator;
Sccd(yy_2_1);
leave_paren_declarator();
return;
yyfl_5_118 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Direct_abstract_declarator_opt;
yy yy_0_1_1;
yy yyv_Constant_expression_opt;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 115) goto yyfl_5_119;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Direct_abstract_declarator_opt = yy_0_1_1;
yyv_Constant_expression_opt = yy_0_1_2;
yy_1_1 = yyv_Direct_abstract_declarator_opt;
Sccd(yy_1_1);
return;
yyfl_5_119 : ;
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
yy_0_1 = yyin_1;
if (yy_0_1[0] != 116) goto yyfl_5_120;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Direct_abstract_declarator = yy_0_1_1;
yyv_Parameter_type_list_opt = yy_0_1_2;
yy_1_1 = yyv_Direct_abstract_declarator;
Sccd(yy_1_1);
yy_2_1 = yyv_Parameter_type_list_opt;
Sccd(yy_2_1);
return;
yyfl_5_120 : ;
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
yy yy_1_1;
yy yy_2_1;
yy yy_3_1;
yy yy_4_1;
yy yy_5_1_1_1;
yy yy_5_1_1_2;
yy yyv_StrName;
yy yy_5_1_2_1;
yy yy_5_2_1_1;
yy yy_5_2_1_2;
yy yyv_Id;
yy yy_5_2_1_2_1;
yy yy_5_2_2_1;
yy yy_5_2_2_2;
yy yy_6_1;
yy yy_7_1;
yy yy_9_1_1_1;
yy yy_9_1_1_2;
yy yyv_Str;
yy yy_9_1_2_1;
yy yy_9_2_1_1;
yy yy_9_2_1_2;
yy yy_9_2_1_2_1;
yy yy_9_2_2_1;
yy yy_9_2_2_2;
yy yy_10_1_1_1;
yy yy_10_1_1_2;
yy yy_10_1_2_1;
yy yy_10_1_2_2;
yy yy_10_2_1_1;
yy yy_10_2_1_2;
yy yy_10_2_2_1;
yy yy_10_2_2_2;
yy yy_10_3_1_1;
yy yy_10_3_1_2;
yy yy_10_3_2_1;
yy yy_10_3_2_2;
yy yy_10_4_1_1;
yy yy_10_4_1_2;
yy yy_10_4_2_1;
yy yy_10_4_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 117) goto yyfl_5_121;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Gccextension = yy_0_1_1;
yyv_Indicator = yy_0_1_2;
yyv_Tag = yy_0_1_3;
yyv_Struct_declaration_list = yy_0_1_4;
yy_1_1 = yyv_Gccextension;
Sccd(yy_1_1);
yy_2_1 = yyv_Indicator;
Sccd(yy_2_1);
yy_3_1 = yyv_Tag;
SccIdOpt(yy_3_1);
yy_4_1 = ((yy)"struct");
initDeclCollection(yy_4_1);
{
yy yysb = yyb;
yy_5_1_1_1 = yyv_Tag;
yy_5_1_1_2 = yy_5_1_1_1;
if (yy_5_1_1_2[0] != 2) goto yyfl_5_121_5_1;
setNoNameTag(&yy_5_1_2_1);
yyv_StrName = yy_5_1_2_1;
goto yysl_5_121_5;
yyfl_5_121_5_1 : ;
yy_5_2_1_1 = yyv_Tag;
yy_5_2_1_2 = yy_5_2_1_1;
if (yy_5_2_1_2[0] != 1) goto yyfl_5_121_5_2;
yy_5_2_1_2_1 = ((yy)yy_5_2_1_2[1]);
yyv_Id = yy_5_2_1_2_1;
yy_5_2_2_1 = yyv_Id;
GetRepr2(yy_5_2_2_1, &yy_5_2_2_2);
yyv_StrName = yy_5_2_2_2;
goto yysl_5_121_5;
yyfl_5_121_5_2 : ;
goto yyfl_5_121;
yysl_5_121_5 : ;
yyb = yysb;
}
yy_6_1 = yyv_StrName;
setId(yy_6_1);
yy_7_1 = yyv_Struct_declaration_list;
Sccd(yy_7_1);
endDeclCollection();
{
yy yysb = yyb;
yy_9_1_1_1 = yyv_Tag;
yy_9_1_1_2 = yy_9_1_1_1;
if (yy_9_1_1_2[0] != 2) goto yyfl_5_121_9_1;
setNoNameTag(&yy_9_1_2_1);
yyv_Str = yy_9_1_2_1;
goto yysl_5_121_9;
yyfl_5_121_9_1 : ;
yy_9_2_1_1 = yyv_Tag;
yy_9_2_1_2 = yy_9_2_1_1;
if (yy_9_2_1_2[0] != 1) goto yyfl_5_121_9_2;
yy_9_2_1_2_1 = ((yy)yy_9_2_1_2[1]);
yyv_Id = yy_9_2_1_2_1;
yy_9_2_2_1 = yyv_Id;
GetRepr2(yy_9_2_2_1, &yy_9_2_2_2);
yyv_Str = yy_9_2_2_2;
goto yysl_5_121_9;
yyfl_5_121_9_2 : ;
goto yyfl_5_121;
yysl_5_121_9 : ;
yyb = yysb;
}
{
yy yysb = yyb;
yy_10_1_1_1 = yyv_Indicator;
yy_10_1_1_2 = yy_10_1_1_1;
if (yy_10_1_1_2[0] != 119) goto yyfl_5_121_10_1;
yy_10_1_2_1 = ((yy)1);
yy_10_1_2_2 = yyv_Str;
setComplexType(yy_10_1_2_1, yy_10_1_2_2);
goto yysl_5_121_10;
yyfl_5_121_10_1 : ;
yy_10_2_1_1 = yyv_Indicator;
yy_10_2_1_2 = yy_10_2_1_1;
if (yy_10_2_1_2[0] != 120) goto yyfl_5_121_10_2;
yy_10_2_2_1 = ((yy)2);
yy_10_2_2_2 = yyv_Str;
setComplexType(yy_10_2_2_1, yy_10_2_2_2);
goto yysl_5_121_10;
yyfl_5_121_10_2 : ;
yy_10_3_1_1 = yyv_Indicator;
yy_10_3_1_2 = yy_10_3_1_1;
if (yy_10_3_1_2[0] != 121) goto yyfl_5_121_10_3;
yy_10_3_2_1 = ((yy)1);
yy_10_3_2_2 = yyv_Str;
setComplexType(yy_10_3_2_1, yy_10_3_2_2);
goto yysl_5_121_10;
yyfl_5_121_10_3 : ;
yy_10_4_1_1 = yyv_Indicator;
yy_10_4_1_2 = yy_10_4_1_1;
if (yy_10_4_1_2[0] != 122) goto yyfl_5_121_10_4;
yy_10_4_2_1 = ((yy)2);
yy_10_4_2_2 = yyv_Str;
setComplexType(yy_10_4_2_1, yy_10_4_2_2);
goto yysl_5_121_10;
yyfl_5_121_10_4 : ;
goto yyfl_5_121;
yysl_5_121_10 : ;
yyb = yysb;
}
return;
yyfl_5_121 : ;
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
yy yyv_Str;
yy yy_4_2;
yy yy_5_1_1_1;
yy yy_5_1_1_2;
yy yy_5_1_2_1;
yy yy_5_1_2_2;
yy yy_5_2_1_1;
yy yy_5_2_1_2;
yy yy_5_2_2_1;
yy yy_5_2_2_2;
yy yy_5_3_1_1;
yy yy_5_3_1_2;
yy yy_5_3_2_1;
yy yy_5_3_2_2;
yy yy_5_4_1_1;
yy yy_5_4_1_2;
yy yy_5_4_2_1;
yy yy_5_4_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 118) goto yyfl_5_122;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Gccextension = yy_0_1_1;
yyv_Indicator = yy_0_1_2;
yyv_Tag = yy_0_1_3;
yy_1_1 = yyv_Gccextension;
Sccd(yy_1_1);
yy_2_1 = yyv_Indicator;
Sccd(yy_2_1);
yy_3_1 = yyv_Tag;
Sid(yy_3_1);
yy_4_1 = yyv_Tag;
GetRepr2(yy_4_1, &yy_4_2);
yyv_Str = yy_4_2;
{
yy yysb = yyb;
yy_5_1_1_1 = yyv_Indicator;
yy_5_1_1_2 = yy_5_1_1_1;
if (yy_5_1_1_2[0] != 119) goto yyfl_5_122_5_1;
yy_5_1_2_1 = ((yy)1);
yy_5_1_2_2 = yyv_Str;
setComplexType(yy_5_1_2_1, yy_5_1_2_2);
goto yysl_5_122_5;
yyfl_5_122_5_1 : ;
yy_5_2_1_1 = yyv_Indicator;
yy_5_2_1_2 = yy_5_2_1_1;
if (yy_5_2_1_2[0] != 120) goto yyfl_5_122_5_2;
yy_5_2_2_1 = ((yy)2);
yy_5_2_2_2 = yyv_Str;
setComplexType(yy_5_2_2_1, yy_5_2_2_2);
goto yysl_5_122_5;
yyfl_5_122_5_2 : ;
yy_5_3_1_1 = yyv_Indicator;
yy_5_3_1_2 = yy_5_3_1_1;
if (yy_5_3_1_2[0] != 121) goto yyfl_5_122_5_3;
yy_5_3_2_1 = ((yy)1);
yy_5_3_2_2 = yyv_Str;
setComplexType(yy_5_3_2_1, yy_5_3_2_2);
goto yysl_5_122_5;
yyfl_5_122_5_3 : ;
yy_5_4_1_1 = yyv_Indicator;
yy_5_4_1_2 = yy_5_4_1_1;
if (yy_5_4_1_2[0] != 122) goto yyfl_5_122_5_4;
yy_5_4_2_1 = ((yy)2);
yy_5_4_2_2 = yyv_Str;
setComplexType(yy_5_4_2_1, yy_5_4_2_2);
goto yysl_5_122_5;
yyfl_5_122_5_4 : ;
goto yyfl_5_122;
yysl_5_122_5 : ;
yyb = yysb;
}
return;
yyfl_5_122 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 119) goto yyfl_5_123;
return;
yyfl_5_123 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 120) goto yyfl_5_124;
return;
yyfl_5_124 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 121) goto yyfl_5_125;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = yyv_GccAttr;
Sccd(yy_1_1);
return;
yyfl_5_125 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 122) goto yyfl_5_126;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = yyv_GccAttr;
Sccd(yy_1_1);
return;
yyfl_5_126 : ;
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
if (yy_0_1[0] != 123) goto yyfl_5_127;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Struct_declaration = yy_0_1_2;
yy_1_1 = yyv_List;
Sccd(yy_1_1);
yy_2_1 = yyv_Struct_declaration;
Sccd(yy_2_1);
return;
yyfl_5_127 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 124) goto yyfl_5_128;
return;
yyfl_5_128 : ;
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
if (yy_0_1[0] != 125) goto yyfl_5_129;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_GccExt = yy_0_1_1;
yyv_DeclSpec = yy_0_1_2;
yy_1_1 = yyv_GccExt;
Sccd(yy_1_1);
yy_2_1 = yyv_DeclSpec;
Sccd(yy_2_1);
return;
yyfl_5_129 : ;
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
yy_0_1 = yyin_1;
if (yy_0_1[0] != 126) goto yyfl_5_130;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier_qualifier_list = yy_0_1_1;
yyv_Struct_declarator_list = yy_0_1_2;
yy_1_1 = yyv_Specifier_qualifier_list;
Sccd(yy_1_1);
yy_2_1 = yyv_Struct_declarator_list;
Sccd(yy_2_1);
return;
yyfl_5_130 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Type_specifier;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 127) goto yyfl_5_131;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Type_specifier = yy_0_1_1;
yy_1_1 = yyv_Type_specifier;
Sccd(yy_1_1);
return;
yyfl_5_131 : ;
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
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 128) goto yyfl_5_132;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Declarator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_List;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 129) goto yyfl_5_132_1_1;
goto yysl_5_132_1;
yyfl_5_132_1_1 : ;
yy_1_2_1_1 = yyv_List;
Sccd(yy_1_2_1_1);
goto yysl_5_132_1;
yysl_5_132_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
yyfl_5_132 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 129) goto yyfl_5_133;
return;
yyfl_5_133 : ;
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
if (yy_0_1[0] != 130) goto yyfl_5_134;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Specifier = yy_0_1_1;
yyv_List = yy_0_1_2;
yy_1_1 = yyv_Specifier;
Sccd(yy_1_1);
yy_2_1 = yyv_List;
Sccd(yy_2_1);
return;
yyfl_5_134 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 131) goto yyfl_5_135;
return;
yyfl_5_135 : ;
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
yy_0_1 = yyin_1;
if (yy_0_1[0] != 132) goto yyfl_5_136;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Declarator_opt = yy_0_1_1;
yyv_Width_opt = yy_0_1_2;
yy_1_1 = yyv_Declarator_opt;
Sccd(yy_1_1);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Width_opt;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 26) goto yyfl_5_136_2_1;
goto yysl_5_136_2;
yyfl_5_136_2_1 : ;
goto yysl_5_136_2;
yysl_5_136_2 : ;
yyb = yysb;
}
return;
yyfl_5_136 : ;
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
if (yy_0_1[0] != 133) goto yyfl_5_137;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_List = yy_0_1_1;
yyv_Qualifier = yy_0_1_2;
yy_1_1 = yyv_List;
Sccd(yy_1_1);
yy_2_1 = yyv_Qualifier;
Sccd(yy_2_1);
return;
yyfl_5_137 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 134) goto yyfl_5_138;
return;
yyfl_5_138 : ;
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
yy yy_3_1_1_1;
yy yy_3_1_1_2;
yy yyv_Str;
yy yy_3_1_2_1;
yy yy_3_2_1_1;
yy yy_3_2_1_2;
yy yyv_Id;
yy yy_3_2_1_2_1;
yy yy_3_2_2_1;
yy yy_3_2_2_2;
yy yy_4_1;
yy yy_4_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 135) goto yyfl_5_139;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Tag = yy_0_1_1;
yyv_Enumeratorlist = yy_0_1_2;
yy_1_1 = yyv_Tag;
SccIdOpt(yy_1_1);
yy_2_1 = yyv_Enumeratorlist;
Sccd(yy_2_1);
{
yy yysb = yyb;
yy_3_1_1_1 = yyv_Tag;
yy_3_1_1_2 = yy_3_1_1_1;
if (yy_3_1_1_2[0] != 2) goto yyfl_5_139_3_1;
setNoNameTag(&yy_3_1_2_1);
yyv_Str = yy_3_1_2_1;
goto yysl_5_139_3;
yyfl_5_139_3_1 : ;
yy_3_2_1_1 = yyv_Tag;
yy_3_2_1_2 = yy_3_2_1_1;
if (yy_3_2_1_2[0] != 1) goto yyfl_5_139_3_2;
yy_3_2_1_2_1 = ((yy)yy_3_2_1_2[1]);
yyv_Id = yy_3_2_1_2_1;
yy_3_2_2_1 = yyv_Id;
GetRepr2(yy_3_2_2_1, &yy_3_2_2_2);
yyv_Str = yy_3_2_2_2;
goto yysl_5_139_3;
yyfl_5_139_3_2 : ;
goto yyfl_5_139;
yysl_5_139_3 : ;
yyb = yysb;
}
yy_4_1 = ((yy)3);
yy_4_2 = yyv_Str;
setComplexType(yy_4_1, yy_4_2);
return;
yyfl_5_139 : ;
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
yy yy_4_1_1_1;
yy yy_4_1_1_2;
yy yyv_Str;
yy yy_4_1_2_1;
yy yy_4_2_1_1;
yy yy_4_2_1_2;
yy yyv_Id;
yy yy_4_2_1_2_1;
yy yy_4_2_2_1;
yy yy_4_2_2_2;
yy yy_5_1;
yy yy_5_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 137) goto yyfl_5_140;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_T = yy_0_1_1;
yyv_Tag = yy_0_1_2;
yyv_Enumeratorlist = yy_0_1_3;
yy_1_1 = yyv_T;
Sccd(yy_1_1);
yy_2_1 = yyv_Tag;
SccIdOpt(yy_2_1);
yy_3_1 = yyv_Enumeratorlist;
Sccd(yy_3_1);
{
yy yysb = yyb;
yy_4_1_1_1 = yyv_Tag;
yy_4_1_1_2 = yy_4_1_1_1;
if (yy_4_1_1_2[0] != 2) goto yyfl_5_140_4_1;
setNoNameTag(&yy_4_1_2_1);
yyv_Str = yy_4_1_2_1;
goto yysl_5_140_4;
yyfl_5_140_4_1 : ;
yy_4_2_1_1 = yyv_Tag;
yy_4_2_1_2 = yy_4_2_1_1;
if (yy_4_2_1_2[0] != 1) goto yyfl_5_140_4_2;
yy_4_2_1_2_1 = ((yy)yy_4_2_1_2[1]);
yyv_Id = yy_4_2_1_2_1;
yy_4_2_2_1 = yyv_Id;
GetRepr2(yy_4_2_2_1, &yy_4_2_2_2);
yyv_Str = yy_4_2_2_2;
goto yysl_5_140_4;
yyfl_5_140_4_2 : ;
goto yyfl_5_140;
yysl_5_140_4 : ;
yyb = yysb;
}
yy_5_1 = ((yy)3);
yy_5_2 = yyv_Str;
setComplexType(yy_5_1, yy_5_2);
return;
yyfl_5_140 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Tag;
yy yy_0_1_1;
yy yy_1_1;
yy yy_2_1;
yy yyv_Str;
yy yy_2_2;
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 136) goto yyfl_5_141;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Tag = yy_0_1_1;
yy_1_1 = yyv_Tag;
Sid(yy_1_1);
yy_2_1 = yyv_Tag;
GetRepr2(yy_2_1, &yy_2_2);
yyv_Str = yy_2_2;
yy_3_1 = ((yy)3);
yy_3_2 = yyv_Str;
setComplexType(yy_3_1, yy_3_2);
return;
yyfl_5_141 : ;
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
yy yyv_Str;
yy yy_3_2;
yy yy_4_1;
yy yy_4_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 138) goto yyfl_5_142;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_T = yy_0_1_1;
yyv_Tag = yy_0_1_2;
yy_1_1 = yyv_T;
Sccd(yy_1_1);
yy_2_1 = yyv_Tag;
Sid(yy_2_1);
yy_3_1 = yyv_Tag;
GetRepr2(yy_3_1, &yy_3_2);
yyv_Str = yy_3_2;
yy_4_1 = ((yy)3);
yy_4_2 = yyv_Str;
setComplexType(yy_4_1, yy_4_2);
return;
yyfl_5_142 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_GccAttr;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 139) goto yyfl_5_143;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_GccAttr = yy_0_1_1;
yy_1_1 = yyv_GccAttr;
Sccd(yy_1_1);
return;
yyfl_5_143 : ;
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
yy yy_2_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 140) goto yyfl_5_144;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Enumeratorlist = yy_0_1_1;
yyv_Enumerator = yy_0_1_2;
{
yy yysb = yyb;
yy_1_1_1_1 = yyv_Enumeratorlist;
yy_1_1_1_2 = yy_1_1_1_1;
if (yy_1_1_1_2[0] != 141) goto yyfl_5_144_1_1;
goto yysl_5_144_1;
yyfl_5_144_1_1 : ;
yy_1_2_1_1 = yyv_Enumeratorlist;
Sccd(yy_1_2_1_1);
goto yysl_5_144_1;
yysl_5_144_1 : ;
yyb = yysb;
}
yy_2_1 = yyv_Enumerator;
Sccd(yy_2_1);
return;
yyfl_5_144 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 141) goto yyfl_5_145;
return;
yyfl_5_145 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Enumconst;
yy yy_0_1_1;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 142) goto yyfl_5_146;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Enumconst = yy_0_1_1;
yy_1_1 = yyv_Enumconst;
Sid(yy_1_1);
return;
yyfl_5_146 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Enumconst;
yy yy_0_1_1;
yy yyv_InitializationExpression;
yy yy_0_1_2;
yy yy_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 143) goto yyfl_5_147;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Enumconst = yy_0_1_1;
yyv_InitializationExpression = yy_0_1_2;
yy_1_1 = yyv_Enumconst;
Sid(yy_1_1);
return;
yyfl_5_147 : ;
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
if (yy_0_1[0] != 144) goto yyfl_5_148;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_D1 = yy_0_1_1;
yyv_D = yy_0_1_2;
yy_1_1 = yyv_D1;
Sccd(yy_1_1);
yy_2_1 = yyv_D;
Sccd(yy_2_1);
return;
yyfl_5_148 : ;
}
yyErr(2,65);
}
SEmitDeclaration(yyin_1, yyin_2)
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
SEmitDeclaratorList(yy_1_1, yy_1_2);
return;
}
}
SEmitDeclaratorList(yyin_1, yyin_2)
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
yy yy_3_1;
yy yy_3_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 18) goto yyfl_7_1;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
yyv_BL = yy_0_2_1;
yyv_L = yy_0_2_2;
yy_1_1 = yyv_Specifiers;
yy_1_2 = yyv_BL;
SEmitDeclaratorList(yy_1_1, yy_1_2);
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Specifiers;
yy_2_1_1_2 = yy_2_1_1_1;
if (yy_2_1_1_2[0] != 15) goto yyfl_7_1_2_1;
goto yysl_7_1_2;
yyfl_7_1_2_1 : ;
yy_2_2_1_1 = yyv_BL;
yy_2_2_1_2 = yy_2_2_1_1;
if (yy_2_2_1_2[0] != 19) goto yyfl_7_1_2_2;
goto yysl_7_1_2;
yyfl_7_1_2_2 : ;
goto yysl_7_1_2;
yysl_7_1_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_Specifiers;
yy_3_2 = yyv_L;
SEmitDeclarator(yy_3_1, yy_3_2);
return;
yyfl_7_1 : ;
}
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 19) goto yyfl_7_2;
return;
yyfl_7_2 : ;
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
yy yy_2_1;
yy yy_2_2;
yy yy_3_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
if (yy_0_2[0] != 23) goto yyfl_7_3;
yy_0_2_1 = ((yy)yy_0_2[1]);
yy_0_2_2 = ((yy)yy_0_2[2]);
if (yy_0_2_1[0] != 18) goto yyfl_7_3;
yy_0_2_1_1 = ((yy)yy_0_2_1[1]);
yy_0_2_1_2 = ((yy)yy_0_2_1[2]);
yyv_BL = yy_0_2_1_1;
yyv_L = yy_0_2_1_2;
yyv_G1 = yy_0_2_2;
yy_1_1 = yyv_Specifiers;
yy_1_2 = yyv_BL;
SEmitDeclaratorList(yy_1_1, yy_1_2);
yy_2_1 = yyv_Specifiers;
yy_2_2 = yyv_L;
SEmitDeclarator(yy_2_1, yy_2_2);
yy_3_1 = yyv_G1;
Sccd(yy_3_1);
return;
yyfl_7_3 : ;
}
yyErr(2,711);
}
SEmitDeclarator(yyin_1, yyin_2)
yy yyin_1;
yy yyin_2;
{
{
yy yyb;
yy yyv_Specifiers;
yy yy_0_1;
yy yyv_InitDeclarator;
yy yy_0_2;
yy yyv_Flag1;
yy yy_1_1;
yy yy_2_1_1_1;
yy yy_2_1_1_2;
yy yy_2_1_2_1;
yy yy_2_2_1_1;
yy yy_3_1;
yy yyv_Flag;
yy yy_4_1_1_1;
yy yy_4_1_2_1;
yy yy_4_1_2_2;
yy yy_5_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Specifiers = yy_0_1;
yyv_InitDeclarator = yy_0_2;
isKNRDecl(&yy_1_1);
yyv_Flag1 = yy_1_1;
{
yy yysb = yyb;
yy_2_1_1_1 = yyv_Flag1;
yy_2_1_1_2 = ((yy)1);
if ((long)yy_2_1_1_1 != (long)yy_2_1_1_2) goto yyfl_8_1_2_1;
yy_2_1_2_1 = ((yy)"param");
initDeclCollection(yy_2_1_2_1);
setKNRPara();
goto yysl_8_1_2;
yyfl_8_1_2_1 : ;
yy_2_2_1_1 = ((yy)"unknown");
initDeclCollection(yy_2_2_1_1);
goto yysl_8_1_2;
yysl_8_1_2 : ;
yyb = yysb;
}
yy_3_1 = yyv_Specifiers;
Sccd(yy_3_1);
{
yy yysb = yyb;
isATypeDefDecl(&yy_4_1_1_1);
yyv_Flag = yy_4_1_1_1;
yy_4_1_2_1 = yyv_Flag;
yy_4_1_2_2 = ((yy)1);
if ((long)yy_4_1_2_1 != (long)yy_4_1_2_2) goto yyfl_8_1_4_1;
setTypeDefTarget();
goto yysl_8_1_4;
yyfl_8_1_4_1 : ;
goto yysl_8_1_4;
yysl_8_1_4 : ;
yyb = yysb;
}
yy_5_1 = yyv_InitDeclarator;
Sccd(yy_5_1);
endDeclCollection();
return;
}
}
SEmitParameterDeclaration(yyin_1, yyin_2)
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
Sccd(yy_1_1);
yy_2_1 = yyv_Declarator;
Sccd(yy_2_1);
return;
}
}
SEmitAbstractParameterDeclaration(yyin_1, yyin_2)
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
Sccd(yy_1_1);
yy_2_1 = yyv_AbstractDeclarator;
Sccd(yy_2_1);
return;
}
}
SccIdOpt(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Id;
yy yy_0_1_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_11_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yyv_Id = yy_0_1_1;
return;
yyfl_11_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_11_2;
return;
yyfl_11_2 : ;
}
yyErr(2,771);
}
Sid(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yyv_Id;
yy yy_0_1;
yy_0_1 = yyin_1;
yyv_Id = yy_0_1;
return;
}
}
