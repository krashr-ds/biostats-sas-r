/* Getting Your Feet Wet With SAS
   Example 2.9 Distribution of Age Classes
   Reading p. 49; Code p. 65      */
  
/* A sample of 51 individuals are selected for participation
   in a study of cardiovascular risk factors.  The following
   data represent the ages of enrolled individuals, measured
   in years.  Organize the subjects into age classes, and 
   summarize the age classes data using SAS.                 */
  
options ps=64 ls=80;
data in;
	input age;

if age le 60 then ageclass = '<60';
	else if 60 le age le 64 then ageclass = '60-64';
	else if 65 le age le 69 then ageclass = '65-69';
	else if 70 le age le 74 then ageclass = '70-74';
	else if 75 le age le 79 then ageclass = '75-79';
	else if 80 le age le 84 then ageclass = '80-84';
	else if 85 le age le 89 then ageclass = '85-89';
else ageclass = '90+';
	
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

title 'Frequency Distribution Table: Age Classes';
proc freq;
	tables ageclass;
run;

title 'Frequency Histogram: Age Classes';
proc chart;
	vbar ageclass/levels=6 space=0 width=10;
run;


/* Is the age class data normally distributed?
   Play with the cards values and re-run the code.
   How does the distribution change?                            
   Change cards values, and then levels, width of histogram. 
   
   Challenge: Can you write your own SAS code to change a 
   continuous variable to categorical?  How about BMI groups, 
   or levels of hypertensive disease?                          */
