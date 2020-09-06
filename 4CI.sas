/* Getting Your Feet Wet With SAS
   Example 5.2 Confidence Intervals
   Reading p. 177-180; Code p. 214  */
  
/* We randomly select 12 subjects with diagnosed hypertension and record
   the age at which they were diagnosed.  Ages, measured in years, are 
   recorded on each subject and are listed here.  Generate a 95% 
   confidence interval using SAS for the mean at which patients with 
   hypertension are diagnosed. */
  
options ps=64 ls=80;
data in;
	input age_dx;
	label age='Age at Hypertension Diagnosis';
	
cards;
32.8
40.0
41.0
42.0
45.5
47.0
48.5
50.0
51.0
52.0
54.0
59.2
run;

title 'Summary Statistics - Age at Diagnosis';

proc means n mean std min max alpha=0.05 clm;
	var age_dx;
run;

title 'Frequency Histogram: Age at Diagnosis';
proc chart;
	vbar age_dx/levels=8 space=0 width=9;
run;


/* Based on the output:
   What is the point estimate for Age at Hypertension Diagnosis?
   What is the margin of error?
   
   Re-run the code with alpha=.1 and .01
   How do the numbers change when alpha is changed? 
   
   How does this sample violate the Central Limit Theorem? 
   
   Challenge: Check the distribution of age_dx using what you 
   already know about plotting with proc univariate.               */
