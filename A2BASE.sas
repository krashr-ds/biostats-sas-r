/* Base Assignment 2; Erin Griffin Ph.D*/
/* Updated Nov 2020 */

libname hca202in "/courses/d70e69e5ba27fe300" access=readonly;

libname hca202 "~/hca202";data hca202.frmgham;

set hca202in.frmgham;run;

 

proc univariate data=hca202.frmgham alpha=0.05 CIBASIC;

Title 'Proc Univariate Alpha=.05';

var age bmi sysbp ldlc;

run;

 

/* Increase alpha to 0.1 (90% CI).*/

 

proc univariate data=hca202.frmgham alpha=0.1 CIBASIC;

Title 'Proc Univariate Alpha=.1';

var age bmi sysbp ldlc;

run;
