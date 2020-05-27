/* Assignment 4: Logistic Regression */

/* Start Provided Code */
libname hca202 "~/hca202";

/* start with a subset of your data */
data work.frmgham1;
    set hca202.frmgham;
    /* where period = 1; */
run;

proc format;
    value sexF
        1 = 'Male'
        2 = 'Female';
    value cursmokeF
        0 = 'Not current smoker'
        1 = 'Current smoker';
    value diabetesF
        0 = 'Does not have DM'
        1 = 'Has DM';
    value deathF
        0 = 'Alive'
        1 = 'Died';
    value ldlcF
    	0-100 = 'Normal'
    	101-high = 'Elevated';
    value ageGroupF
     	0-35.9 = '0-35'
 		36-45.9 = '36-45'
 		46-55.9 = '46-55'
 		56-65.9 = '56-65'
 		66-75.9 = '66-75'
 		76-85.9 = '76-85'
 		86-95.9 = '86-95'
 		96-high = '95+';
 	value bmiGroupF
 	  	0-18.49 = '0-18.4'
  		18.5-24.99 = '18.5-24.9'
  		25-29.99 = '25-29.9'
  		30-39.99 = '30-39.9'
  		40-high = '40+';
run;


/* apply 'sticky' formats */
data work.frmgham2;
    set work.frmgham1;
    format  sex sexF.
            cursmoke cursmokeF.
            diabetes diabetesF.
            death deathF. 
            bmi bmiGroupF.
            age ageGroupF.
            ldlc ldlcF.;
    if bmi = '0-18.4' then obeseCategory = '1 - Underweight';
    else if bmi = '18.5-24.9' then obeseCategory = '2 - Normal';
    else if bmi = '25-29.9' then obeseCategory = '3 - Overweight';
    else if bmi = '30-39.9' then obeseCategory = '4 - Obese';
    else obeseCategory = '5 - Morbidly Obese';
    
    /* Body Mass Index (kr/(M*M) */
    label bmi = 'Body Mass Index (kg/m**2)';
run;

/* macro variable - simple text substitution */
%let dat = work.frmgham2;
/* END Provided Code */

/* FROM SAMPLE  
proc logistic data=&dat;
    class sex (param = reference ref = 'Female');
    model death (event='Died') = sex;
run;*/

/* MY OLD CODE 
proc logistic data=&dat;
    title 'Assignment 4, Problem 1';
    class sex death;
    model death = sex;
run;
*/

proc logistic data=&dat;
    title 'Assignment 4, Problem 1';
    class sex (param = reference ref = 'Female');
    model death (event = 'Died') = sex;
run;


/* Likelihood of being a SMOKER - Male v. Female (ref) */
proc logistic data=&dat;
    title 'Assignment 4, Problem 2';
    class sex (param = reference ref = 'Female');
    model cursmoke (event = 'Current smoker') = sex;
run;

/* Extra: Factor in being dead */
proc logistic data=&dat;
    title 'Assignment 4, Problem 2a';
    class sex (param = reference ref = 'Female')
          cursmoke (param = reference ref = 'Not current smoker');
    model death (event = 'Died') = cursmoke;
run;


/* Likelihood of being a SMOKER given sex, age and BMI */
proc logistic data=&dat;
    title 'Assignment 4, Problem 3';
    class sex (param = reference ref = 'Female') age bmi;
    model cursmoke (event = 'Current smoker') = sex age bmi;
run;

/* A similar model using diabetes as the outcome, adding LDLC 
   Likelihood of DM given change in sex, age, bmi and LDLC levels */
  /* THIS ONLY WORKS WITH THE FULL DATA SET */
proc logistic data=&dat;
    title 'Assignment 4, Problem 4';
    class sex (param = reference ref = 'Female') 
          ldlc (param = reference ref = 'Normal') 
          age (param = reference ref = '46-55')
          bmi (param = reference ref = '25-29.9');
    model diabetes (event = 'Has DM') = sex age bmi ldlc;
run;



/*Comparators*/


proc freq data=&dat;
    tables sex * death;
    tables sex * cursmoke;
    tables age * bmi * cursmoke;
	tables age * sex * bmi * ldlc * diabetes;
run;



