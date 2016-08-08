## Code Book

This code book describes the variables and transformations used to clean up the 
data set and prepare a tidy data that can be used for later analysis.

### Transformations

The experiments were carried out with a group of 30 volunteers, and the obtained
data was divided into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data.

The original data sets corresponding to training and test were merged into one 
data set containing a 561-feature vector with time and frequency domain, 
variables, a subject variable with the volunteers labels, and an activity
variable containing the activity labels.

From this combined data set, only the features containing mean and standard 
deviation (std) calculations were selected for each measurement.

The activity labels in the data set were replaced by the descriptive activity 
names of the 6 different activities performed during the experiments: 1-`WALKING`,
2-`WALKING UPSTAIRS`, 3-`WALKING DOWNSTAIRS`, 4-`SITTING`, 5-`STANDING`, 
6-`LAYING`.

In order to use descriptive variable names, the abbreviations were replaced by 
their full form.

Following these transformations, the tidy data set was created by grouping the
measurements by activity-subject pairs and summarizing by calculating the 
average.


### Variables

The tidy data set contains 68 variables:

`subject`- contains integer values between 1 and 30 that identify the subject
who performed the activity.

`activity_name`- each row identifies the activity performed by the subject.

The other 66 variables represent the average of the mean and std of the time
and frequency signals recorded in the experiments. The 180 observations in the 
data set represent all the possible combinations of the 30 volunteers performing
the 6 different activities.

