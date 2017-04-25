/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Nisal Dilshan/Desktop/FYP/ISE projects/buck_sys1/top.v";
static unsigned int ng1[] = {131U, 0U};
static unsigned int ng2[] = {59524U, 0U};
static unsigned int ng3[] = {131072U, 0U};
static unsigned int ng4[] = {59U, 0U};
static int ng5[] = {50, 0};
static unsigned int ng6[] = {0U, 0U};
static int ng7[] = {1, 0};
static int ng8[] = {100, 0};
static unsigned int ng9[] = {655360U, 0U};
static int ng10[] = {0, 0};
static unsigned int ng11[] = {1U, 0U};



static void NetDecl_32_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7056);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31U);

LAB1:    return;
}

static void NetDecl_33_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7120);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31U);

LAB1:    return;
}

static void NetDecl_34_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 5104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7184);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31U);

LAB1:    return;
}

static void NetDecl_35_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 7248);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31U);

LAB1:    return;
}

static void Always_37_4(char *t0)
{
    char t8[8];
    char t20[8];
    char t26[8];
    char t30[8];
    char t38[8];
    char t78[16];
    char t79[16];
    char t80[16];
    char t81[16];
    char t82[16];
    char t83[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    int t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;

LAB0:    t1 = (t0 + 5600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 6912);
    *((int *)t2) = 1;
    t3 = (t0 + 5632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 2728);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng5)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB8;

LAB9:    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB16;

LAB15:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB16;

LAB19:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB18;

LAB17:    *((unsigned int *)t8) = 1;

LAB18:    memset(t20, 0, 8);
    t10 = (t8 + 4);
    t13 = *((unsigned int *)t10);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t10) != 0)
        goto LAB22;

LAB23:    t12 = (t20 + 4);
    t21 = *((unsigned int *)t20);
    t22 = *((unsigned int *)t12);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB24;

LAB25:    memcpy(t38, t20, 8);

LAB26:    t70 = (t38 + 4);
    t71 = *((unsigned int *)t70);
    t72 = (~(t71));
    t73 = *((unsigned int *)t38);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(51, ng0);

LAB43:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);

LAB41:
LAB13:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t0 + 3208);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    xsi_vlog_get_part_select_value(t78, 64, t11, 47, 16);
    xsi_vlog_unsigned_minus(t79, 64, t7, 32, t78, 64);
    t12 = (t0 + 1848U);
    t18 = *((char **)t12);
    xsi_vlog_unsigned_multiply(t80, 64, t79, 64, t18, 32);
    xsi_vlog_unsigned_add(t81, 64, t4, 64, t80, 64);
    t12 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t12, t81, 0, 0, 64, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlog_get_part_select_value(t78, 64, t4, 47, 16);
    t5 = (t0 + 2168U);
    t6 = *((char **)t5);
    xsi_vlog_unsigned_multiply(t79, 64, t78, 64, t6, 32);
    t5 = (t0 + 3528);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    xsi_vlog_unsigned_minus(t80, 64, t79, 64, t9, 64);
    t10 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t10, t80, 0, 0, 64, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlog_get_part_select_value(t78, 64, t4, 47, 16);
    t5 = (t0 + 3528);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    xsi_vlog_get_part_select_value(t79, 64, t7, 47, 16);
    xsi_vlog_unsigned_add(t80, 64, t78, 64, t79, 64);
    t9 = (t0 + 2008U);
    t10 = *((char **)t9);
    xsi_vlog_unsigned_multiply(t81, 64, t80, 64, t10, 32);
    t9 = (t0 + 2888);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t18 = (t0 + 2328U);
    t19 = *((char **)t18);
    xsi_vlog_unsigned_multiply(t82, 64, t12, 32, t19, 32);
    xsi_vlog_unsigned_add(t83, 64, t81, 64, t82, 64);
    t18 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t18, t83, 0, 0, 64, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng11)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 2, t4, 2, t5, 2);
    t6 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 2, 0LL);
    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(41, ng0);

LAB14:    xsi_set_current_line(42, ng0);
    t18 = ((char*)((ng6)));
    t19 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 32, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 10, t5, 32);
    t6 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 10, 0LL);
    goto LAB13;

LAB16:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB18;

LAB20:    *((unsigned int *)t20) = 1;
    goto LAB23;

LAB22:    t11 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB23;

LAB24:    t18 = (t0 + 2728);
    t19 = (t18 + 56U);
    t24 = *((char **)t19);
    t25 = ((char*)((ng8)));
    memset(t26, 0, 8);
    t27 = (t24 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB28;

LAB27:    t28 = (t25 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB28;

LAB31:    if (*((unsigned int *)t24) < *((unsigned int *)t25))
        goto LAB29;

LAB30:    memset(t30, 0, 8);
    t31 = (t26 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t26);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t31) != 0)
        goto LAB34;

LAB35:    t39 = *((unsigned int *)t20);
    t40 = *((unsigned int *)t30);
    t41 = (t39 & t40);
    *((unsigned int *)t38) = t41;
    t42 = (t20 + 4);
    t43 = (t30 + 4);
    t44 = (t38 + 4);
    t45 = *((unsigned int *)t42);
    t46 = *((unsigned int *)t43);
    t47 = (t45 | t46);
    *((unsigned int *)t44) = t47;
    t48 = *((unsigned int *)t44);
    t49 = (t48 != 0);
    if (t49 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB26;

LAB28:    t29 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB30;

LAB29:    *((unsigned int *)t26) = 1;
    goto LAB30;

LAB32:    *((unsigned int *)t30) = 1;
    goto LAB35;

LAB34:    t37 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB35;

LAB36:    t50 = *((unsigned int *)t38);
    t51 = *((unsigned int *)t44);
    *((unsigned int *)t38) = (t50 | t51);
    t52 = (t20 + 4);
    t53 = (t30 + 4);
    t54 = *((unsigned int *)t20);
    t55 = (~(t54));
    t56 = *((unsigned int *)t52);
    t57 = (~(t56));
    t58 = *((unsigned int *)t30);
    t59 = (~(t58));
    t60 = *((unsigned int *)t53);
    t61 = (~(t60));
    t62 = (t55 & t57);
    t63 = (t59 & t61);
    t64 = (~(t62));
    t65 = (~(t63));
    t66 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t66 & t64);
    t67 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t67 & t65);
    t68 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t68 & t64);
    t69 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t69 & t65);
    goto LAB38;

LAB39:    xsi_set_current_line(46, ng0);

LAB42:    xsi_set_current_line(47, ng0);
    t76 = ((char*)((ng9)));
    t77 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t77, t76, 0, 0, 32, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 10, t5, 32);
    t6 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 10, 0LL);
    goto LAB41;

}

static void Cont_72_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 5848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7312);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6928);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_73_6(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 6096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3208);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 8);
    t8 = (t5 + 12);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 65535U);
    t15 = (t0 + 7376);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 65535U;
    t21 = t20;
    t22 = (t3 + 4);
    t23 = *((unsigned int *)t3);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 15);
    t28 = (t0 + 6944);
    *((int *)t28) = 1;

LAB1:    return;
}

static void Cont_74_7(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 6344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3208);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 16);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 65535U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 65535U);
    t14 = (t0 + 7440);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 65535U;
    t20 = t19;
    t21 = (t3 + 4);
    t22 = *((unsigned int *)t3);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 15);
    t27 = (t0 + 6960);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_75_8(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7504);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 3U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 1);
    t18 = (t0 + 6976);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000002314498999_3823007873_init()
{
	static char *pe[] = {(void *)NetDecl_32_0,(void *)NetDecl_33_1,(void *)NetDecl_34_2,(void *)NetDecl_35_3,(void *)Always_37_4,(void *)Cont_72_5,(void *)Cont_73_6,(void *)Cont_74_7,(void *)Cont_75_8};
	xsi_register_didat("work_m_00000000002314498999_3823007873", "isim/test1_isim_beh.exe.sim/work/m_00000000002314498999_3823007873.didat");
	xsi_register_executes(pe);
}
