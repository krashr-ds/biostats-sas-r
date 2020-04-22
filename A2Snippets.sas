/* Assignment 2
   
   Using UNIVARIATE and histogram option, estimate the mean, 
   median and confidence interval with alpha = 0.05 for current 
   smoking status CURSMOKE and two of the following variables: 
   AGE, BMI, SYSBP, LDL 										*/

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
set hca202in.frmgham;
label sex='Gender 1=Male 2=Female';
label bmi='Body Mass Index kg/m^2';
run;

proc contents data=hca202._all_ details;run;

/* Part 1 - CURSMOKE, BMI & SYSBP ; 95% CI */
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2';
	var CURSMOKE BMI SYSBP;
	histogram;
run;

/* Part 2 - by SEX ; 95% CI */
proc sort data=hca202.frmgham; by sex; run;
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2-B';
	by sex;
	var CURSMOKE BMI SYSBP;
	histogram / normal;
run;

/* Part 3 - alpha 0.1 ; 90% CI */
proc univariate data=hca202.frmgham alpha=0.1 plot normal;
	Title 'Assignment #2-C';
	var CURSMOKE BMI SYSBP;
	by sex;
	histogram;
run;

/*Proc Freq*/

Proc format;
 Value bmiGroups
  0-18.49 = '0-18.4'
  18.5-24.99 = '18.5-24.9'
  25-29.99 = '25-29.9'
  30-39.99 = '30-39.9'
  40-high = '40+'
  ;
Run;

Proc freq data = hca202.frmgham;
 Tables bmi * sex /missprint;
 Format bmi bmiGroups.;
Run;  

/*data hca202.frmgham;
    set hca202.frmgham;
    length bmiGroup $10.;
    if      bmi  < 18.5             then bmiGroup = '<18.5';
    else if bmi >= 18.5 and age <= 24.9 then bmiGroup = '18.5 - 24.9';
    else if bmi >  24.9 and age <= 29.9 then bmiGroup = '25 - 29.9';
    else if bmi >  29.9 and age <= 39.9 then bmiGroup = '30 - 39.9';
    else if bmi >  40                   then bmiGroup = '40+';

    label bmiGroup = 'BMI Category: Underweight, Normal, Overweight, Obese and Morbidly Obese';
run;


proc freq data=hca202.frmgham;
    tables bmiGroups * sex /missprint;
run;
*/

Proc format;
 Value sbpGroups
  0-90.9 = 'low'
  91-120.9 = 'normal'
  121-140.9 = 'pre-hypertension'
  141-160.9 = 'hypertension'
  161-179.9 = 'severe hypertension'
  180-high = 'hypertensive crisis'
  ;
Run;

proc freq data=hca202.frmgham;
    tables sysbp * sex;
    Format sysbp sbpGroups.;
run;

/* With CHISQ */

Proc freq data = hca202.frmgham;
 Tables bmi * sex /chisq;
 Format bmi bmiGroups.;
Run; 

Proc freq data = hca202.frmgham;
 Tables sysbp * sex /chisq;
 Format sysbp sbpGroups.;
Run; 


/* CMH */
proc freq data= hca202.frmgham;
   tables sex * cursmoke * cvd / cmh;
run;
