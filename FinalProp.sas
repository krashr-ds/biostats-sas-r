/* SAS Multivariate Linear & Logistic Regression
   Proposed Models Based on Exploratory Analysis of Framingham Data
   K Rasku 5/31/20 
*/

libname hca202 "~/hca202";

/* Use Period 3, May wish to include HDLC in model. */
data work.frmgham1;
    set hca202.frmgham;
    where period = 3;
run;

/* Data previously plotted & pre-analyzed using r. */

proc format;
    value sexF
        1 = 'Male'
        2 = 'Female';
    value cursmokeF
        0 = 'Not current smoker'
        1 = 'Current smoker';
run;

/* apply 'sticky' formats */
data work.frmgham2;
    set work.frmgham1;
    format  sex sexF.
            cursmoke cursmokeF.;
            
    /* Body Mass Index (kr/(M*M) */
    label bmi = 'Body Mass Index (kg/m**2)';
run;

/* Regression: Time to Any CHD x Age Systolic BP and Glucose */
/* Model has good fit, low power (explains 9.32%)            */
ods graphics / imagemap=on;
proc reg data=work.frmgham1 plots(only)=cp;
    model timechd = age sysbp glucose / selection=stepwise;
run;
ods graphics off;

ods graphics / imagemap=on;
proc reg data=work.frmgham1 plots(only)=cp;
    model timechd = age sysbp glucose;
run;
ods graphics off;

/* Regression: Time to Hypertension x Age Systolic BP, Glucose, BMI */
/* Good fit, Good power - This model explains 47.3%, predictably Systolic BP has largest effect. */
ods graphics / imagemap=on;
proc reg data=work.frmgham1 plots(only)=cp;
    model timehyp = age sysbp glucose bmi / selection=stepwise;
run;
ods graphics off;

ods graphics / imagemap=on;
proc reg data=work.frmgham1 plots(only)=cp;
    model timehyp = age sysbp glucose bmi;
run;
ods graphics off;

/* Logistic Regression: Outcome Any CHD */
/* c = .689 */
proc logistic data=work.frmgham2;
    class   sex (param = reference ref = 'Male')
            cursmoke (param = reference ref = 'Not current smoker');
    model anychd = age sex sysbp glucose ;
run;


/* Logistic Regression: Outcome Hypertension */
/* c = .902 */
proc logistic data=work.frmgham2;
    model hyperten = sysbp glucose bmi ;
run;


