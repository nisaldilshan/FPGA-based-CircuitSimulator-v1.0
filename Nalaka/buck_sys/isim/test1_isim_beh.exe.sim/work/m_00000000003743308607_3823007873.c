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
static const char *ng0 = "C:/Users/Nisal Dilshan/Desktop/FYP/ISE projects/buck_sys/top.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {10, 0};
static int ng4[] = {0, 0, 0, 0};
static int ng5[] = {50, 0};
static unsigned int ng6[] = {10U, 0U};
static int ng7[] = {1, 0};
static int ng8[] = {100, 0};
static unsigned int ng9[] = {0U, 0U};
static unsigned int ng10[] = {1U, 0U, 0U, 0U};
static int ng11[] = {2, 0};
static unsigned int ng12[] = {465U, 0U, 0U, 0U};
static unsigned int ng13[] = {7U, 0U};



static void Initial_50_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(50, ng0);

LAB2:    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2336);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 14);
    xsi_set_current_line(52, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2496);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 7);
    xsi_set_current_line(53, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2656);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(54, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2816);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 7);
    xsi_set_current_line(55, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 2976);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);
    xsi_set_current_line(56, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3136);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);
    xsi_set_current_line(57, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3296);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(58, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3456);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(59, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3616);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(60, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 3776);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 41);
    xsi_set_current_line(61, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 3936);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 41);

LAB1:    return;
}

static void Always_64_1(char *t0)
{
    char t8[8];
    char t20[16];
    char t28[16];
    char t30[16];
    char t34[16];
    char t36[16];
    char t37[16];
    char t39[8];
    char t40[8];
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
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t35;
    char *t38;

LAB0:    t1 = (t0 + 5104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 6168);
    *((int *)t2) = 1;
    t3 = (t0 + 5136);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(64, ng0);

LAB5:    xsi_set_current_line(65, ng0);
    t4 = (t0 + 2816);
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

LAB12:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
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

LAB18:    t10 = (t8 + 4);
    t13 = *((unsigned int *)t10);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(72, ng0);

LAB24:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 7, t5, 32);
    t6 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 7, 0LL);

LAB22:
LAB13:    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3936);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t14 = (t13 >> 9);
    *((unsigned int *)t8) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 9);
    *((unsigned int *)t6) = t16;
    t9 = (t5 + 8);
    t10 = (t5 + 12);
    t17 = *((unsigned int *)t9);
    t21 = (t17 << 23);
    t22 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t22 | t21);
    t23 = *((unsigned int *)t10);
    t24 = (t23 << 23);
    t25 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t25 | t24);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t26 & 4294967295U);
    t27 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t27 & 4294967295U);
    xsi_vlogtype_concat(t20, 41, 41, 2U, t8, 32, t2, 9);
    t11 = ((char*)((ng9)));
    t12 = (t0 + 3136);
    t18 = (t12 + 56U);
    t19 = *((char **)t18);
    t29 = ((char*)((ng9)));
    xsi_vlogtype_concat(t28, 41, 32, 3U, t29, 12, t19, 4, t11, 16);
    t31 = (t0 + 3776);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    xsi_vlog_get_part_select_value(t30, 41, t33, 40, 9);
    xsi_vlog_unsigned_minus(t34, 41, t28, 41, t30, 41);
    t35 = ((char*)((ng10)));
    xsi_vlog_unsigned_multiply(t36, 41, t34, 41, t35, 9);
    xsi_vlog_unsigned_add(t37, 41, t20, 41, t36, 41);
    t38 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 41, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3776);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 9);
    *((unsigned int *)t8) = t14;
    t15 = *((unsigned int *)t6);
    t16 = (t15 >> 9);
    *((unsigned int *)t5) = t16;
    t7 = (t4 + 8);
    t9 = (t4 + 12);
    t17 = *((unsigned int *)t7);
    t21 = (t17 << 23);
    t22 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t22 | t21);
    t23 = *((unsigned int *)t9);
    t24 = (t23 << 23);
    t25 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t25 | t24);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t26 & 4294967295U);
    t27 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t27 & 4294967295U);
    t10 = ((char*)((ng11)));
    memset(t39, 0, 8);
    xsi_vlog_unsigned_multiply(t39, 32, t8, 32, t10, 32);
    t11 = (t0 + 3616);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 32, t39, 32, t18, 32);
    t19 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t19, t40, 0, 0, 32, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlog_get_part_select_value(t20, 41, t4, 40, 9);
    t5 = ((char*)((ng12)));
    xsi_vlog_unsigned_multiply(t28, 41, t20, 41, t5, 9);
    t6 = ((char*)((ng9)));
    t7 = (t0 + 2976);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng13)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_multiply(t8, 13, t10, 4, t11, 13);
    t12 = ((char*)((ng9)));
    xsi_vlogtype_concat(t30, 41, 38, 3U, t12, 13, t8, 13, t6, 12);
    xsi_vlog_unsigned_add(t34, 41, t28, 41, t30, 41);
    t18 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t18, t34, 0, 0, 41, 0LL);
    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(65, ng0);

LAB14:    xsi_set_current_line(66, ng0);
    t18 = ((char*)((ng6)));
    t19 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 4, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 7, t5, 32);
    t6 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 7, 0LL);
    goto LAB13;

LAB16:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB18;

LAB20:    xsi_set_current_line(69, ng0);

LAB23:    xsi_set_current_line(70, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 7, 0LL);
    goto LAB22;

}

static void Cont_89_2(char *t0)
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

LAB0:    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 15U;
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
    xsi_driver_vfirst_trans(t5, 0, 3);
    t18 = (t0 + 6184);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_90_3(char *t0)
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
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 5600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 25);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 25);
    *((unsigned int *)t6) = t11;
    t12 = (t5 + 8);
    t13 = (t5 + 12);
    t14 = *((unsigned int *)t12);
    t15 = (t14 << 7);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 | t15);
    t17 = *((unsigned int *)t13);
    t18 = (t17 << 7);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t19 | t18);
    t20 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t20 & 65535U);
    t21 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t21 & 65535U);
    t22 = (t0 + 6360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 65535U;
    t28 = t27;
    t29 = (t3 + 4);
    t30 = *((unsigned int *)t3);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 15);
    t35 = (t0 + 6200);
    *((int *)t35) = 1;

LAB1:    return;
}

static void Cont_91_4(char *t0)
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

LAB0:    t1 = (t0 + 5848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 9);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 9);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 65535U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 65535U);
    t14 = (t0 + 6424);
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
    t27 = (t0 + 6216);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void work_m_00000000003743308607_3823007873_init()
{
	static char *pe[] = {(void *)Initial_50_0,(void *)Always_64_1,(void *)Cont_89_2,(void *)Cont_90_3,(void *)Cont_91_4};
	xsi_register_didat("work_m_00000000003743308607_3823007873", "isim/test1_isim_beh.exe.sim/work/m_00000000003743308607_3823007873.didat");
	xsi_register_executes(pe);
}
