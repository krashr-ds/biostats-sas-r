/* Assignment 1; Code by Erin Griffin PhD */

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
set hca202in.frmgham;
run;

proc contents data=hca202._all_ details;run;


/*Problem #1*/
/*summary*/
proc means data=hca202.frmgham alpha=0.05 clm mean median;
var CURSMOKE AGE BMI SEX SYSBP LDLC;
run;

/*Problem #2*/
proc sort data=hca202.frmgham; by sex; run;
proc means alpha=0.05 clm mean median;
var CURSMOKE AGE BMI SEX SYSBP LDLC;
by sex;
run;

/*Problem #3*/
proc means alpha=0.1 clm mean median;
var CURSMOKE AGE BMI SEX SYSBP LDLC;
by sex;
run;
