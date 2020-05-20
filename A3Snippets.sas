/* A3 SAS Code - K. Rasku RN
   Derived from A3 Base Code provided by UC Davis */

/* Setup code */
libname hca202 "~/hca202";

/* start with a subset of your data */
data work.frmgham1;
    set hca202.frmgham;
    where period = 3;
run;
  
/* Question 1: Correlation between 3 variables */
proc corr data=work.frmgham1 rank plots(maxpoints=100000)=matrix;
    var diabp cigpday bmi;
run;

/* Question 2: Construct a linear regression model with 
one predictor variable (age) and time between the baseline 
and death (timedth) */

/* Backwards ! 
proc reg data=work.frmgham1;
    model age = timedth;
run; */

proc reg data=work.frmgham1;
	model timedth = age;
run;

/* Question 3: Adjust the base model (above) for the effects 
of angina, heartrate and BMI. */

/* Also Backwards ! 
proc reg data=work.frmgham1;
    model age = timedth angina heartrte bmi;
run; */

proc reg data=work.frmgham1;
	model timedth = age angina heartrte bmi;
run;

/* EC 1: The glm proc: Evaluate the effect of age, sex and 
bmi on time between baseline and death.  */

proc glm data=work.frmgham1;
 class age sex bmi;
 model timedth = age sex bmi /ss3;
run; 

/* EC 2a: The glm proc: Evaluate the effect of age, sex and 
bmi on death (binary).  */

proc glm data=work.frmgham1;
 class age sex bmi;
 model death = age sex bmi /ss3;
run; 

/* EC 2b: glm with solution option REF: Quinn, 1999 */
proc glm data=work.frmgham1;
 class age sex bmi;
 model death = age sex bmi /solution;
run; 

/* EC 2c: More appropriate for a binary outcome, proc logistic */

proc logistic descending data=work.frmgham1;
 model death=age sex bmi;
 units age=10 bmi=5;
 run;
 
