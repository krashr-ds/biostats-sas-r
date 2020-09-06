/* Getting Your Feet Wet With SAS
   Example 2.6 Box Plotting: Distribution of Ages
   Reading p. 41; Code p. 62      */
  
/* A sample of 51 individuals are selected for participation
   in a study of cardiovascular risk factors.  The following
   data represent the ages of enrolled individuals, measured
   in years.  Create a box plot of the continuous data.      */
  
options ps=64 ls=80;
data in;
	input age;
	label age='Age in years';
	
cards;
60
62
63
64
64
65
65
65
65
65
65
66
66
66
66
66
67
67
67
68
68
68
70
70
70
71
71
72
72
73
73
73
73
73
75
75
75
75
76
76
77
77
77
77
77
79
82
83
85
85
87
run;

title 'Summary Statistics - Age';

ods graphics off;
proc univariate plot;
	var age;
run;

proc sgplot;
  vbox age;
run;


   

/* Read the box and whisker plot.
   What is the min? max? range? Q1? Q2/median? Q3? 
   Read the stem and leaf plot. What is the distribution? 
   What is the optimum number of unique stems for a stem and leaf plot? 
   
   Challenge: Modify this code to describe some other type of 
   continuous data.  Examples: weights, BMIs, cholesterol measurements. */
