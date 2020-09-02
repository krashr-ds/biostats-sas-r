/* 
   proc corr & proc reg 
   Regression and Correlation: Framingham Data Example
   9/2/2020
   
*/

/* Setup code */
libname hca202 "~/hca202";

/* Create work library copy */
data work.frmgham;
    set hca202.frmgham;
    where period = 3;
run;
  
/* Exploratory - Contents */
proc contents data=work.frmgham;
run;

/* Exploratory - Means */
proc means data=work.frmgham;
  var sysbp bmi age;
run;

/* Scatterplots */
/* proc insight data=work.frmgham;
  scatter sysbp bmi age*
          sysbp bmi age;
run;
quit; */

goptions reset=all;
axis1 label=(r=0 a=90);
proc gplot data=work.frmgham;
  plot sysbp*bmi=1 / vaxis=axis1;
run;
quit;


proc gplot data=work.frmgham;
  plot sysbp*age=1 / vaxis=axis1;
run;
quit;

/* Correlation */

proc corr data=work.frmgham rank plots(maxpoints=100000)=matrix;
    var sysbp bmi age;
run;
quit;

/* Regression */

proc reg data=work.frmgham;
  model sysbp=bmi age;
  output out=bp1res(keep=randid sysbp bmi age 
                       r lev cd dffit)
                       rstudent=r h=lev cookd=cd dffits=dffit;
run;
quit;

proc univariate data=bp1res plots plotsize=30;
  var r;
run;
quit;
