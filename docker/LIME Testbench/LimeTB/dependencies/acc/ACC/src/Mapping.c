typedef long * yy;
#define yyu (-2147483647L)
static yy yynull;
extern yy yyh;
extern yy yyhx;
static yyErr(n,l)
{
yyAbort(n,"Mapping", l);
}
yyeq_AMode(t1, t2) yy t1, t2;
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
}
}
yyPrint_AMode(t) yy t;
{
switch(t[0]) {
case 1: 
yyTerm("am_error");
yyNoArgs();
break;
case 2: 
yyTerm("am_float");
yyNoArgs();
break;
case 3: 
yyTerm("am_double");
yyNoArgs();
break;
case 4: 
yyTerm("am_ulong");
yyNoArgs();
break;
case 5: 
yyTerm("am_slong");
yyNoArgs();
break;
case 6: 
yyTerm("am_uword");
yyNoArgs();
break;
case 7: 
yyTerm("am_sword");
yyNoArgs();
break;
case 8: 
yyTerm("am_ubyte");
yyNoArgs();
break;
case 9: 
yyTerm("am_sbyte");
yyNoArgs();
break;
case 10: 
yyTerm("am_byteblock");
yyNoArgs();
break;
case 11: 
yyTerm("am_nil");
yyNoArgs();
break;
}
}
yybroadcast_AMode(t,In,Out,Handler)
yy t, In, *Out; int (*Handler) ();
{
yy A, B;
A = In;
if (! Handler(yybroadcast_AMode, t, In, Out)) {
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
}
}
}
get_slong_mode(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_1 = yyb + 0;
yy_0_1[0] = 5;
*yyout_1 = yy_0_1;
return;
}
}
get_ulong_mode(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_1 = yyb + 0;
yy_0_1[0] = 5;
*yyout_1 = yy_0_1;
return;
}
}
get_float_mode(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_1 = yyb + 0;
yy_0_1[0] = 2;
*yyout_1 = yy_0_1;
return;
}
}
get_double_mode(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_1 = yyb + 0;
yy_0_1[0] = 3;
*yyout_1 = yy_0_1;
return;
}
}
get_pointer_diff_type(yyout_1)
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
yy_0_1_1 = yyb + 4;
yy_0_1_1[0] = 2;
yy_0_1_2 = yyb + 5;
yy_0_1_2[0] = 3;
yy_0_1_3 = yyb + 6;
yy_0_1_3[0] = 6;
yy_0_1 = yyb + 0;
yy_0_1[0] = 13;
yy_0_1[1] = ((long)yy_0_1_1);
yy_0_1[2] = ((long)yy_0_1_2);
yy_0_1[3] = ((long)yy_0_1_3);
*yyout_1 = yy_0_1;
return;
}
}
perform_integral_promotions(yyin_1, yyin_2, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 2) goto yyfl_7_1;
if (yy_0_1_2[0] != 1) goto yyfl_7_1;
if (yy_0_1_3[0] != 6) goto yyfl_7_1;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 2;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4 = yyv_Rval1;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 3) goto yyfl_7_2;
if (yy_0_1_2[0] != 1) goto yyfl_7_2;
if (yy_0_1_3[0] != 6) goto yyfl_7_2;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 3;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4 = yyv_Rval1;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 3) goto yyfl_7_3;
if (yy_0_1_2[0] != 2) goto yyfl_7_3;
if (yy_0_1_3[0] != 6) goto yyfl_7_3;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 3;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4 = yyv_Rval1;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 2) goto yyfl_7_4;
if (yy_0_1_2[0] != 2) goto yyfl_7_4;
if (yy_0_1_3[0] != 6) goto yyfl_7_4;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 7; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 2;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4 = yyv_Rval1;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy yy_0_4_1;
yy yy_0_4_2;
yy yy_0_4_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 2) goto yyfl_7_5;
if (yy_0_1_2[0] != 1) goto yyfl_7_5;
if (yy_0_1_3[0] != 3) goto yyfl_7_5;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 13; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 2;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4_1 = yyb + 11;
yy_0_4_1[0] = 9;
yy_0_4_2 = yyb + 12;
yy_0_4_2[0] = 7;
yy_0_4_3 = yyv_Rval1;
yy_0_4 = yyb + 7;
yy_0_4[0] = 55;
yy_0_4[1] = ((long)yy_0_4_1);
yy_0_4[2] = ((long)yy_0_4_2);
yy_0_4[3] = ((long)yy_0_4_3);
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy yy_0_4_1;
yy yy_0_4_2;
yy yy_0_4_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 3) goto yyfl_7_6;
if (yy_0_1_2[0] != 1) goto yyfl_7_6;
if (yy_0_1_3[0] != 3) goto yyfl_7_6;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 13; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 3;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4_1 = yyb + 11;
yy_0_4_1[0] = 8;
yy_0_4_2 = yyb + 12;
yy_0_4_2[0] = 6;
yy_0_4_3 = yyv_Rval1;
yy_0_4 = yyb + 7;
yy_0_4[0] = 55;
yy_0_4[1] = ((long)yy_0_4_1);
yy_0_4[2] = ((long)yy_0_4_2);
yy_0_4[3] = ((long)yy_0_4_3);
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_1_1;
yy yy_0_1_2;
yy yy_0_1_3;
yy yyv_Rval1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_3_1;
yy yy_0_3_2;
yy yy_0_3_3;
yy yy_0_4;
yy yy_0_4_1;
yy yy_0_4_2;
yy yy_0_4_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_7_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
if (yy_0_1_1[0] != 1) goto yyfl_7_7;
if (yy_0_1_2[0] != 1) goto yyfl_7_7;
if (yy_0_1_3[0] != 3) goto yyfl_7_7;
yyv_Rval1 = yy_0_2;
yyb = yyh;
yyh += 13; if (yyh > yyhx) yyExtend();
yy_0_3_1 = yyb + 4;
yy_0_3_1[0] = 3;
yy_0_3_2 = yyb + 5;
yy_0_3_2[0] = 1;
yy_0_3_3 = yyb + 6;
yy_0_3_3[0] = 6;
yy_0_3 = yyb + 0;
yy_0_3[0] = 13;
yy_0_3[1] = ((long)yy_0_3_1);
yy_0_3[2] = ((long)yy_0_3_2);
yy_0_3[3] = ((long)yy_0_3_3);
yy_0_4_1 = yyb + 11;
yy_0_4_1[0] = 9;
yy_0_4_2 = yyb + 12;
yy_0_4_2[0] = 7;
yy_0_4_3 = yyv_Rval1;
yy_0_4 = yyb + 7;
yy_0_4[0] = 55;
yy_0_4[1] = ((long)yy_0_4_1);
yy_0_4[2] = ((long)yy_0_4_2);
yy_0_4[3] = ((long)yy_0_4_3);
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_7 : ;
}
{
yy yyb;
yy yyv_Descr;
yy yy_0_1;
yy yyv_R;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_Descr = yy_0_1;
yyv_R = yy_0_2;
yy_0_3 = yyv_Descr;
yy_0_4 = yyv_R;
*yyout_1 = yy_0_3;
*yyout_2 = yy_0_4;
return;
yyfl_7_8 : ;
}
yyErr(2,107);
}
td_map_to_mode(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Sign;
yy yy_0_1_1;
yy yyv_Size;
yy yy_0_1_2;
yy yyv_Mode;
yy yy_0_1_3;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yyv_AMode;
yy yy_1_4;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_8_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign = yy_0_1_1;
yyv_Size = yy_0_1_2;
yyv_Mode = yy_0_1_3;
yy_1_1 = yyv_Sign;
yy_1_2 = yyv_Size;
yy_1_3 = yyv_Mode;
td_map_triple_to_mode(yy_1_1, yy_1_2, yy_1_3, &yy_1_4);
yyv_AMode = yy_1_4;
yy_0_2 = yyv_AMode;
*yyout_1 = yy_0_2;
return;
yyfl_8_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_8_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 4;
*yyout_1 = yy_0_2;
return;
yyfl_8_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Descr;
yy yy_1_2;
yy yy_2_1;
yy yyv_AMode;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_8_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_Descr = yy_1_2;
yy_2_1 = yyv_Descr;
td_map_to_mode(yy_2_1, &yy_2_2);
yyv_AMode = yy_2_2;
yy_0_2 = yyv_AMode;
*yyout_1 = yy_0_2;
return;
yyfl_8_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_8_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 10;
*yyout_1 = yy_0_2;
return;
yyfl_8_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_8_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_2 = yyb + 0;
yy_0_2[0] = 10;
*yyout_1 = yy_0_2;
return;
yyfl_8_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_AMode;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_8_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_AMode = yy_0_1_2;
yy_0_2 = yyv_AMode;
*yyout_1 = yy_0_2;
return;
yyfl_8_6 : ;
}
{
yy yyb;
yy yyv_Descr;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy_0_1 = yyin_1;
yyv_Descr = yy_0_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = ((yy)"action map to mode failed");
compiler_error(yy_1_1);
yy_0_2 = yyb + 0;
yy_0_2[0] = 1;
*yyout_1 = yy_0_2;
return;
yyfl_8_7 : ;
}
yyErr(2,127);
}
td_map_triple_to_mode(yyin_1, yyin_2, yyin_3, yyout_1)
yy yyin_1;
yy yyin_2;
yy yyin_3;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_9_1;
if (yy_0_2[0] != 1) goto yyfl_9_1;
if (yy_0_3[0] != 4) goto yyfl_9_1;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 2;
*yyout_1 = yy_0_4;
return;
yyfl_9_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_9_2;
if (yy_0_2[0] != 1) goto yyfl_9_2;
if (yy_0_3[0] != 5) goto yyfl_9_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 3;
*yyout_1 = yy_0_4;
return;
yyfl_9_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_9_3;
if (yy_0_2[0] != 3) goto yyfl_9_3;
if (yy_0_3[0] != 5) goto yyfl_9_3;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 3;
*yyout_1 = yy_0_4;
return;
yyfl_9_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_9_4;
if (yy_0_2[0] != 1) goto yyfl_9_4;
if (yy_0_3[0] != 6) goto yyfl_9_4;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 4;
*yyout_1 = yy_0_4;
return;
yyfl_9_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_9_5;
if (yy_0_2[0] != 1) goto yyfl_9_5;
if (yy_0_3[0] != 6) goto yyfl_9_5;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 5;
*yyout_1 = yy_0_4;
return;
yyfl_9_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_9_6;
if (yy_0_2[0] != 2) goto yyfl_9_6;
if (yy_0_3[0] != 6) goto yyfl_9_6;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 7;
*yyout_1 = yy_0_4;
return;
yyfl_9_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_9_7;
if (yy_0_2[0] != 3) goto yyfl_9_7;
if (yy_0_3[0] != 6) goto yyfl_9_7;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 5;
*yyout_1 = yy_0_4;
return;
yyfl_9_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_9_8;
if (yy_0_2[0] != 3) goto yyfl_9_8;
if (yy_0_3[0] != 6) goto yyfl_9_8;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 4;
*yyout_1 = yy_0_4;
return;
yyfl_9_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_9_9;
if (yy_0_2[0] != 2) goto yyfl_9_9;
if (yy_0_3[0] != 6) goto yyfl_9_9;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 6;
*yyout_1 = yy_0_4;
return;
yyfl_9_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 3) goto yyfl_9_10;
if (yy_0_2[0] != 1) goto yyfl_9_10;
if (yy_0_3[0] != 3) goto yyfl_9_10;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 8;
*yyout_1 = yy_0_4;
return;
yyfl_9_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 2) goto yyfl_9_11;
if (yy_0_2[0] != 1) goto yyfl_9_11;
if (yy_0_3[0] != 3) goto yyfl_9_11;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 9;
*yyout_1 = yy_0_4;
return;
yyfl_9_11 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_9_12;
if (yy_0_2[0] != 1) goto yyfl_9_12;
if (yy_0_3[0] != 3) goto yyfl_9_12;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 9;
*yyout_1 = yy_0_4;
return;
yyfl_9_12 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
if (yy_0_1[0] != 1) goto yyfl_9_13;
if (yy_0_2[0] != 1) goto yyfl_9_13;
if (yy_0_3[0] != 2) goto yyfl_9_13;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_4 = yyb + 0;
yy_0_4[0] = 11;
*yyout_1 = yy_0_4;
return;
yyfl_9_13 : ;
}
{
yy yyb;
yy yyv_Sign;
yy yy_0_1;
yy yyv_Size;
yy yy_0_2;
yy yyv_Mode;
yy yy_0_3;
yy yy_0_4;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Sign = yy_0_1;
yyv_Size = yy_0_2;
yyv_Mode = yy_0_3;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = ((yy)"in td_map_triple_to_mode");
compiler_error(yy_1_1);
yy_0_4 = yyb + 0;
yy_0_4[0] = 11;
*yyout_1 = yy_0_4;
return;
yyfl_9_14 : ;
}
yyErr(2,153);
}
td_max_amode(yyin_1, yyin_2, yyout_1)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_M2;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 5) goto yyfl_10_1;
yyv_M2 = yy_0_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_3 = yyb + 0;
yy_0_3[0] = 5;
*yyout_1 = yy_0_3;
return;
yyfl_10_1 : ;
}
{
yy yyb;
yy yyv_M1;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_M1 = yy_0_1;
if (yy_0_2[0] != 5) goto yyfl_10_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_3 = yyb + 0;
yy_0_3[0] = 5;
*yyout_1 = yy_0_3;
return;
yyfl_10_2 : ;
}
{
yy yyb;
yy yyv_M1;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_M1 = yy_0_1;
if (yy_0_2[0] != 7) goto yyfl_10_3;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_3 = yyb + 0;
yy_0_3[0] = 7;
*yyout_1 = yy_0_3;
return;
yyfl_10_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_M2;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 7) goto yyfl_10_4;
yyv_M2 = yy_0_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_3 = yyb + 0;
yy_0_3[0] = 7;
*yyout_1 = yy_0_3;
return;
yyfl_10_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 9) goto yyfl_10_5;
if (yy_0_2[0] != 9) goto yyfl_10_5;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_0_3 = yyb + 0;
yy_0_3[0] = 9;
*yyout_1 = yy_0_3;
return;
yyfl_10_5 : ;
}
{
yy yyb;
yy yyv_M1;
yy yy_0_1;
yy yyv_M2;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_M1 = yy_0_1;
yyv_M2 = yy_0_2;
yyb = yyh;
yyh += 1; if (yyh > yyhx) yyExtend();
yy_1_1 = ((yy)"td_max_amode called with unexpected modes");
compiler_error(yy_1_1);
yy_0_3 = yyb + 0;
yy_0_3[0] = 11;
*yyout_1 = yy_0_3;
return;
yyfl_10_6 : ;
}
yyErr(2,187);
}
td_compute_next_offset_of_struct_or_union(yyin_1, yyin_2, yyin_3, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy yyin_3;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yyv_NextOff;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_0_5;
yy yy_1_1;
yy yyv_Descr;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy yy_3_1;
yy yyv_Align;
yy yy_3_2;
yy yy_4_1;
yy yy_4_2;
yy yy_4_3;
yy yyv_Offset;
yy yy_4_4;
yy yyv_NewNextOff;
yy yy_4_5;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp = yy_0_1;
yyv_NextOff = yy_0_2;
if (yy_0_3[0] != 1) goto yyfl_11_1;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_Descr = yy_1_2;
yy_2_1 = yyv_Descr;
td_map_to_size(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_3_1 = yyv_Descr;
get_field_align(yy_3_1, &yy_3_2);
yyv_Align = yy_3_2;
yy_4_1 = yyv_NextOff;
yy_4_2 = yyv_Size;
yy_4_3 = yyv_Align;
compute_field_offset_and_next_free_offset(yy_4_1, yy_4_2, yy_4_3, &yy_4_4, &yy_4_5);
yyv_Offset = yy_4_4;
yyv_NewNextOff = yy_4_5;
yy_0_4 = yyv_Offset;
yy_0_5 = yyv_NewNextOff;
*yyout_1 = yy_0_4;
*yyout_2 = yy_0_5;
return;
yyfl_11_1 : ;
}
{
yy yyb;
yy yyv_Tp;
yy yy_0_1;
yy yyv_NextOff;
yy yy_0_2;
yy yy_0_3;
yy yy_0_4;
yy yy_0_5;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_Tp = yy_0_1;
yyv_NextOff = yy_0_2;
if (yy_0_3[0] != 2) goto yyfl_11_2;
yy_0_4 = ((yy)0);
yy_0_5 = yyv_NextOff;
*yyout_1 = yy_0_4;
*yyout_2 = yy_0_5;
return;
yyfl_11_2 : ;
}
yyErr(2,206);
}
compute_param_list_size(yyin_1, yyin_2, yyout_1)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
{
{
yy yyb;
yy yyv_PSize;
yy yy_0_1;
yy yyv_Size;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yyv_Size2;
yy yy_1_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_PSize = yy_0_1;
yyv_Size = yy_0_2;
yy_1_1 = yyv_PSize;
yy_1_2 = yyv_Size;
c_plus(yy_1_1, yy_1_2, &yy_1_3);
yyv_Size2 = yy_1_3;
yy_0_3 = yyv_Size2;
*yyout_1 = yy_0_3;
return;
}
}
td_map_to_param_size_and_local_offset(yyin_1, yyout_1, yyout_2)
yy yyin_1;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_D;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy yyv_O;
yy yy_2_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_13_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_D = yy_1_2;
yy_2_1 = yyv_D;
td_map_to_param_size_and_local_offset(yy_2_1, &yy_2_2, &yy_2_3);
yyv_Size = yy_2_2;
yyv_O = yy_2_3;
yy_0_2 = yyv_Size;
yy_0_3 = yyv_O;
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_13_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_0_1_1;
yy yyv_Y;
yy yy_0_1_2;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_13_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_X = yy_0_1_1;
yyv_Y = yy_0_1_2;
yy_0_2 = ((yy)4);
yy_0_3 = ((yy)0);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_13_2 : ;
}
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_S;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
yy_1_1 = yyv_D;
td_map_to_size(yy_1_1, &yy_1_2);
yyv_S = yy_1_2;
yy_2_1 = yyv_S;
if (! test_one(yy_2_1)) goto yyfl_13_3;
yy_0_2 = ((yy)4);
yy_0_3 = ((yy)3);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_13_3 : ;
}
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_S;
yy yy_1_2;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
yy_1_1 = yyv_D;
td_map_to_size(yy_1_1, &yy_1_2);
yyv_S = yy_1_2;
yy_2_1 = yyv_S;
if (! test_two(yy_2_1)) goto yyfl_13_4;
yy_0_2 = ((yy)4);
yy_0_3 = ((yy)2);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_13_4 : ;
}
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Size;
yy yy_1_2;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
yy_1_1 = yyv_D;
td_map_to_param_size(yy_1_1, &yy_1_2);
yyv_Size = yy_1_2;
yy_0_2 = yyv_Size;
yy_0_3 = ((yy)0);
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_13_5 : ;
}
yyErr(2,233);
}
td_map_to_param_size(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Sign;
yy yy_0_1_1;
yy yyv_Size;
yy yy_0_1_2;
yy yy_0_1_3;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_14_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign = yy_0_1_1;
yyv_Size = yy_0_1_2;
if (yy_0_1_3[0] != 4) goto yyfl_14_1;
yy_0_2 = ((yy)8);
*yyout_1 = yy_0_2;
return;
yyfl_14_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_D;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_14_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_D = yy_1_2;
yy_2_1 = yyv_D;
td_map_to_param_size(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_14_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_X;
yy yy_0_1_1;
yy yyv_Y;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_14_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_X = yy_0_1_1;
yyv_Y = yy_0_1_2;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_14_3 : ;
}
{
yy yyb;
yy yyv_Descr;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size1;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy_0_1 = yyin_1;
yyv_Descr = yy_0_1;
yy_1_1 = yyv_Descr;
td_map_to_size(yy_1_1, &yy_1_2);
yyv_Size1 = yy_1_2;
yy_2_1 = yyv_Size1;
make_at_least_four(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_14_4 : ;
}
yyErr(2,260);
}
td_map_to_size(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Sign;
yy yy_0_1_1;
yy yyv_Size;
yy yy_0_1_2;
yy yyv_Mode;
yy yy_0_1_3;
yy yy_0_2;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yyv_AMode;
yy yy_1_4;
yy yy_2_1;
yy yyv_TpSize;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_15_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign = yy_0_1_1;
yyv_Size = yy_0_1_2;
yyv_Mode = yy_0_1_3;
yy_1_1 = yyv_Sign;
yy_1_2 = yyv_Size;
yy_1_3 = yyv_Mode;
td_map_triple_to_mode(yy_1_1, yy_1_2, yy_1_3, &yy_1_4);
yyv_AMode = yy_1_4;
yy_2_1 = yyv_AMode;
td_map_abstract_machine_mode_to_size(yy_2_1, &yy_2_2);
yyv_TpSize = yy_2_2;
yy_0_2 = yyv_TpSize;
*yyout_1 = yy_0_2;
return;
yyfl_15_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size1;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yyv_TpSize;
yy yy_2_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_15_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_size(yy_1_1, &yy_1_2);
yyv_Size1 = yy_1_2;
yy_2_1 = yyv_C;
yy_2_2 = yyv_Size1;
c_mult(yy_2_1, yy_2_2, &yy_2_3);
yyv_TpSize = yy_2_3;
yy_0_2 = yyv_TpSize;
*yyout_1 = yy_0_2;
return;
yyfl_15_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_15_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_15_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size1;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_15_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yy_1_1 = yyv_Fields;
td_max_of_fields(yy_1_1, &yy_1_2);
yyv_Size1 = yy_1_2;
yy_2_1 = yyv_Size1;
make_even(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_15_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size1;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_15_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yy_1_1 = yyv_Fields;
td_last_offset_plus_fieldsize(yy_1_1, &yy_1_2);
yyv_Size1 = yy_1_2;
yy_2_1 = yyv_Size1;
make_even(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_15_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_AMode;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 10) goto yyfl_15_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_AMode = yy_0_1_2;
yy_1_1 = yyv_AMode;
td_map_abstract_machine_mode_to_size(yy_1_1, &yy_1_2);
yyv_Size = yy_1_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_15_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Size;
yy yy_1_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_15_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_size(yy_1_1, &yy_1_2);
yyv_Size = yy_1_2;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_15_7 : ;
}
{
yy yyb;
yy yyv_TpDescr;
yy yy_0_1;
yy yy_0_2;
yy yy_1_1;
yy yyv_C;
yy yy_2_1;
yy_0_1 = yyin_1;
yyv_TpDescr = yy_0_1;
yy_1_1 = ((yy)"size cannot be computed for this type");
semantic_error(yy_1_1);
get_UNDEF_int(&yy_2_1);
yyv_C = yy_2_1;
yy_0_2 = yyv_C;
*yyout_1 = yy_0_2;
return;
yyfl_15_8 : ;
}
yyErr(2,281);
}
get_field_align(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_D;
yy yy_1_2;
yy yy_2_1;
yy yyv_Align;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_16_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_D = yy_1_2;
yy_2_1 = yyv_D;
get_field_align(yy_2_1, &yy_2_2);
yyv_Align = yy_2_2;
yy_0_2 = yyv_Align;
*yyout_1 = yy_0_2;
return;
yyfl_16_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_D;
yy yy_1_2;
yy yy_2_1;
yy yyv_Align;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 12) goto yyfl_16_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_D = yy_1_2;
yy_2_1 = yyv_D;
get_field_align(yy_2_1, &yy_2_2);
yyv_Align = yy_2_2;
yy_0_2 = yyv_Align;
*yyout_1 = yy_0_2;
return;
yyfl_16_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Sign;
yy yy_0_1_1;
yy yyv_Size;
yy yy_0_1_2;
yy yy_0_1_3;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 13) goto yyfl_16_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign = yy_0_1_1;
yyv_Size = yy_0_1_2;
if (yy_0_1_3[0] != 3) goto yyfl_16_3;
yy_0_2 = ((yy)1);
*yyout_1 = yy_0_2;
return;
yyfl_16_3 : ;
}
{
yy yyb;
yy yyv_D;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yyv_D = yy_0_1;
yy_0_2 = ((yy)2);
*yyout_1 = yy_0_2;
return;
yyfl_16_4 : ;
}
yyErr(2,320);
}
get_align(yyin_1, yyin_2, yyout_1)
yy yyin_1;
yy yyin_2;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Sign;
yy yy_0_1_1;
yy yyv_Size;
yy yy_0_1_2;
yy yyv_Mode;
yy yy_0_1_3;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yy_1_2;
yy yy_1_3;
yy yyv_AMode;
yy yy_1_4;
yy yy_2_1;
yy yyv_Align;
yy yy_2_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 13) goto yyfl_17_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yyv_Sign = yy_0_1_1;
yyv_Size = yy_0_1_2;
yyv_Mode = yy_0_1_3;
yyv_S = yy_0_2;
yy_1_1 = yyv_Sign;
yy_1_2 = yyv_Size;
yy_1_3 = yyv_Mode;
td_map_triple_to_mode(yy_1_1, yy_1_2, yy_1_3, &yy_1_4);
yyv_AMode = yy_1_4;
yy_2_1 = yyv_AMode;
map_mode_to_align(yy_2_1, &yy_2_2);
yyv_Align = yy_2_2;
yy_0_3 = yyv_Align;
*yyout_1 = yy_0_3;
return;
yyfl_17_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 5) goto yyfl_17_2;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_S = yy_0_2;
yy_0_3 = ((yy)4);
*yyout_1 = yy_0_3;
return;
yyfl_17_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_17_3;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_S;
if (! test_one(yy_1_1)) goto yyfl_17_3;
yy_0_3 = ((yy)1);
*yyout_1 = yy_0_3;
return;
yyfl_17_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_17_4;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_S;
if (! test_greater_two(yy_1_1)) goto yyfl_17_4;
yy_0_3 = ((yy)4);
*yyout_1 = yy_0_3;
return;
yyfl_17_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_C;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 2) goto yyfl_17_5;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_C = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_S = yy_0_2;
yy_0_3 = ((yy)2);
*yyout_1 = yy_0_3;
return;
yyfl_17_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 9) goto yyfl_17_6;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_S;
if (! test_greater_two(yy_1_1)) goto yyfl_17_6;
yy_0_3 = ((yy)4);
*yyout_1 = yy_0_3;
return;
yyfl_17_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 9) goto yyfl_17_7;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyv_S = yy_0_2;
yy_0_3 = ((yy)2);
*yyout_1 = yy_0_3;
return;
yyfl_17_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 8) goto yyfl_17_8;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_S;
if (! test_greater_two(yy_1_1)) goto yyfl_17_8;
yy_0_3 = ((yy)4);
*yyout_1 = yy_0_3;
return;
yyfl_17_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_Fields;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 8) goto yyfl_17_9;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_Fields = yy_0_1_2;
yyv_S = yy_0_2;
yy_0_3 = ((yy)2);
*yyout_1 = yy_0_3;
return;
yyfl_17_9 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_I;
yy yy_0_1_1;
yy yyv_AMode;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Align;
yy yy_1_2;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 10) goto yyfl_17_10;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_I = yy_0_1_1;
yyv_AMode = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_AMode;
map_mode_to_align(yy_1_1, &yy_1_2);
yyv_Align = yy_1_2;
yy_0_3 = yyv_Align;
*yyout_1 = yy_0_3;
return;
yyfl_17_10 : ;
}
{
yy yyb;
yy yy_0_1;
yy yyv_Q;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_D;
yy yy_1_2;
yy yy_2_1;
yy yy_2_2;
yy yyv_Align;
yy yy_2_3;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
if (yy_0_1[0] != 12) goto yyfl_17_11;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Q = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_S = yy_0_2;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_D = yy_1_2;
yy_2_1 = yyv_D;
yy_2_2 = yyv_S;
get_align(yy_2_1, yy_2_2, &yy_2_3);
yyv_Align = yy_2_3;
yy_0_3 = yyv_Align;
*yyout_1 = yy_0_3;
return;
yyfl_17_11 : ;
}
{
yy yyb;
yy yyv_TpDescr;
yy yy_0_1;
yy yyv_S;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yyv_TpDescr = yy_0_1;
yyv_S = yy_0_2;
yy_1_1 = ((yy)"get_align called for unexpected type");
compiler_error(yy_1_1);
yy_0_3 = ((yy)0);
*yyout_1 = yy_0_3;
return;
yyfl_17_12 : ;
}
yyErr(2,338);
}
get_address_size_and_align(yyout_1, yyout_2)
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = ((yy)4);
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_1;
*yyout_2 = yy_0_2;
return;
}
}
int test_unsigned(yyin_1)
yy yyin_1;
{
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_19_1;
return 1;
yyfl_19_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_19_2;
return 1;
yyfl_19_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_19_3;
return 1;
yyfl_19_3 : ;
}
return 0;
}
map_mode_to_align(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_20_1;
yy_0_2 = ((yy)1);
*yyout_1 = yy_0_2;
return;
yyfl_20_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_20_2;
yy_0_2 = ((yy)1);
*yyout_1 = yy_0_2;
return;
yyfl_20_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_20_3;
yy_0_2 = ((yy)2);
*yyout_1 = yy_0_2;
return;
yyfl_20_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_20_4;
yy_0_2 = ((yy)2);
*yyout_1 = yy_0_2;
return;
yyfl_20_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_20_5;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_20_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_20_6;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_20_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_20_7;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_20_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_20_8;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_20_8 : ;
}
{
yy yyb;
yy yyv_X;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
yyv_X = yy_0_1;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_20_9 : ;
}
yyErr(2,402);
}
td_map_abstract_machine_mode_to_size(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_21_1;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_21_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 3) goto yyfl_21_2;
yy_0_2 = ((yy)8);
*yyout_1 = yy_0_2;
return;
yyfl_21_2 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 6) goto yyfl_21_3;
yy_0_2 = ((yy)2);
*yyout_1 = yy_0_2;
return;
yyfl_21_3 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 7) goto yyfl_21_4;
yy_0_2 = ((yy)2);
*yyout_1 = yy_0_2;
return;
yyfl_21_4 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 8) goto yyfl_21_5;
yy_0_2 = ((yy)1);
*yyout_1 = yy_0_2;
return;
yyfl_21_5 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 9) goto yyfl_21_6;
yy_0_2 = ((yy)1);
*yyout_1 = yy_0_2;
return;
yyfl_21_6 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 4) goto yyfl_21_7;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_21_7 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 5) goto yyfl_21_8;
yy_0_2 = ((yy)4);
*yyout_1 = yy_0_2;
return;
yyfl_21_8 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 11) goto yyfl_21_9;
yy_0_2 = ((yy)0);
*yyout_1 = yy_0_2;
return;
yyfl_21_9 : ;
}
yyErr(2,429);
}
td_max_of_fields(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Fields;
yy yy_0_1_1;
yy yyv_Field;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Max1;
yy yy_1_2;
yy yy_2_1;
yy yyv_Tp;
yy yy_2_2;
yy yy_3_1;
yy yyv_Descr;
yy yy_3_2;
yy yy_4_1;
yy yyv_Size;
yy yy_4_2;
yy yy_5_1;
yy yy_5_2;
yy yyv_Max;
yy yy_5_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_22_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Fields = yy_0_1_1;
yyv_Field = yy_0_1_2;
yy_1_1 = yyv_Fields;
td_max_of_fields(yy_1_1, &yy_1_2);
yyv_Max1 = yy_1_2;
yy_2_1 = yyv_Field;
get_field_type(yy_2_1, &yy_2_2);
yyv_Tp = yy_2_2;
yy_3_1 = yyv_Tp;
get_tp_descr(yy_3_1, &yy_3_2);
yyv_Descr = yy_3_2;
yy_4_1 = yyv_Descr;
td_map_to_size(yy_4_1, &yy_4_2);
yyv_Size = yy_4_2;
yy_5_1 = yyv_Max1;
yy_5_2 = yyv_Size;
max(yy_5_1, yy_5_2, &yy_5_3);
yyv_Max = yy_5_3;
yy_0_2 = yyv_Max;
*yyout_1 = yy_0_2;
return;
yyfl_22_1 : ;
}
{
yy yyb;
yy yy_0_1;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_22_2;
yy_0_2 = ((yy)0);
*yyout_1 = yy_0_2;
return;
yyfl_22_2 : ;
}
yyErr(2,451);
}
td_last_offset_plus_fieldsize(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Fields;
yy yy_0_1_1;
yy yyv_Field;
yy yy_0_1_2;
yy yy_0_2;
yy yy_1_1;
yy yyv_Offset;
yy yy_1_2;
yy yyv_Size1;
yy yy_1_3;
yy yy_2_1;
yy yy_2_2;
yy yyv_Size;
yy yy_2_3;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 2) goto yyfl_23_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yyv_Fields = yy_0_1_1;
yyv_Field = yy_0_1_2;
yy_1_1 = yyv_Field;
get_field_offset_and_size(yy_1_1, &yy_1_2, &yy_1_3);
yyv_Offset = yy_1_2;
yyv_Size1 = yy_1_3;
yy_2_1 = yyv_Offset;
yy_2_2 = yyv_Size1;
c_plus(yy_2_1, yy_2_2, &yy_2_3);
yyv_Size = yy_2_3;
yy_0_2 = yyv_Size;
*yyout_1 = yy_0_2;
return;
yyfl_23_1 : ;
}
yyErr(2,465);
}
get_field_offset_and_size(yyin_1, yyout_1, yyout_2)
yy yyin_1;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_Width;
yy yy_0_1_3;
yy yyv_Offset;
yy yy_0_1_4;
yy yy_0_2;
yy yy_0_3;
yy yy_1_1;
yy yyv_Descr;
yy yy_1_2;
yy yy_2_1;
yy yyv_Size;
yy yy_2_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_24_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Ident = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_Width = yy_0_1_3;
yyv_Offset = yy_0_1_4;
yy_1_1 = yyv_Tp;
get_tp_descr(yy_1_1, &yy_1_2);
yyv_Descr = yy_1_2;
yy_2_1 = yyv_Descr;
td_map_to_size(yy_2_1, &yy_2_2);
yyv_Size = yy_2_2;
yy_0_2 = yyv_Offset;
yy_0_3 = yyv_Size;
*yyout_1 = yy_0_2;
*yyout_2 = yy_0_3;
return;
yyfl_24_1 : ;
}
yyErr(2,475);
}
get_field_type(yyin_1, yyout_1)
yy yyin_1;
yy *yyout_1;
{
{
yy yyb;
yy yy_0_1;
yy yyv_Ident;
yy yy_0_1_1;
yy yyv_Tp;
yy yy_0_1_2;
yy yyv_Width;
yy yy_0_1_3;
yy yyv_Offset;
yy yy_0_1_4;
yy yy_0_2;
yy_0_1 = yyin_1;
if (yy_0_1[0] != 1) goto yyfl_25_1;
yy_0_1_1 = ((yy)yy_0_1[1]);
yy_0_1_2 = ((yy)yy_0_1[2]);
yy_0_1_3 = ((yy)yy_0_1[3]);
yy_0_1_4 = ((yy)yy_0_1[4]);
yyv_Ident = yy_0_1_1;
yyv_Tp = yy_0_1_2;
yyv_Width = yy_0_1_3;
yyv_Offset = yy_0_1_4;
yy_0_2 = yyv_Tp;
*yyout_1 = yy_0_2;
return;
yyfl_25_1 : ;
}
yyErr(2,485);
}
compute_field_offset_and_next_free_offset(yyin_1, yyin_2, yyin_3, yyout_1, yyout_2)
yy yyin_1;
yy yyin_2;
yy yyin_3;
yy *yyout_1;
yy *yyout_2;
{
{
yy yyb;
yy yyv_N1;
yy yy_0_1;
yy yyv_N2;
yy yy_0_2;
yy yyv_N3;
yy yy_0_3;
yy yy_0_4;
yy yy_0_5;
yy_0_1 = yyin_1;
yy_0_2 = yyin_2;
yy_0_3 = yyin_3;
yyv_N1 = yy_0_1;
yyv_N2 = yy_0_2;
yyv_N3 = yy_0_3;
yy_0_4 = ((yy)0);
yy_0_5 = ((yy)0);
*yyout_1 = yy_0_4;
*yyout_2 = yy_0_5;
return;
}
}
