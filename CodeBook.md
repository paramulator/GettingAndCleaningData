This document provides references to the raw source data, and describes the variables in the final tidy dataset.  See the [README.md] (https://github.com/paramulator/GettingAndCleaningData/blob/master/README.md) file in this repo for details on the process to generate the tidy dataset.   

***

#### Contents
* [Source Data] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#source-data)
* [Fixing Up Variable Names] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#fixing-up-variable-names)
* [Feature Selection] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#feature-selection)
* [Transformations] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#transformations)
* [Output Variable Naming Conventions] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#output-variable-naming-conventions)
* [Output Variables] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#output-variables)

***

#### Source Data
For an understanding of the source data, this [link] (http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions) describes it in a bit more detail than does the Coursera project link.  In addition, look at the [features_info.txt] (https://github.com/paramulator/GettingAndCleaningData/blob/master/UCI%20HAR%20Dataset/features_info.txt) file contained in this repo for a deeper discussion of individual feature calculations.

***

#### Fixing Up Variable Names
The raw data contains a listing of "features" that were recorded during the experiments.  These features form the basis for column labels that will be used in the final tidy dataset.  The features were given descriptive character strings that on their own could not be used as valid R variable names.  While the variable naming convention of the output dataset pretty much follows the conventions of the feature labels, some transformations were applied to (1) remove special characters, (2) reduce everything to lower case, (3) eliminate spaces and (4) remove any duplicate occurances of "body" from the name.  The resulting names are long and they certainly are not pretty, but see [here] (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) for advice given regarding what not to do with the names.  In particular look in Part 6 for the sections "Should I decompose the variable names" and "A few more thoughts".  Look at [Output Variable Naming Convention] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#output-variable-naming-conventions) in this document as well as the [Source Data] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#source-data) references to learn how to interpret the variable names.     

Examples: 
  + Raw feature label "t**B**ody**A**cc**J**erk**-**mean**()-Z**" was converted to R variable name: "tbodyaccjerkmeanz".
  + Raw feature label "f**B**ody**B**ody**G**yro**M**ag**-**std**()**" was converted to R variable name "fbodygyromagstd".

***

#### Feature Selection
The assignment calls for keeping only those variables that represent time interval means and standard deviations of feature data collected for each subject and activity combination.  Feature variables that included "mean" or "std" in their labels were kept.  Feature variables that included "meanfreq" or "angle" were dropped because these were not based on the same mean or standard deviation calculations used for the other kept features.  All other feature variables were dropped as well.  The result is a set of 66 feature variables.

Examples:  
  + Feature variable "tbodyaccjerk**mean**z" was kept.
  + Feature variable "fbodygyromag**std**" was kept.
  + Feature variable "fbodyaccmagskewness" was dropped.
  + Feature variable "tgravityaccmagarcoeff3" was dropped.

***

#### Transformations
The test and train data each contain a subject ID and activity ID numbers.  The activity ID number was used to pick up the descriptive "activitylabel" text string from the activities reference dataframe.  The final tidy dataset includes "subjectid" and "activitylabel" on each row of data and drops the activity ID.

The test and train data were joined together into one dataset.  This dataset was ordered by "subjectid" and activitylabel.  Within each of these combinations the mean value of each of the 66 features was computed.  The text string "mean" was pre-pended to each feature variable name in the final tidy dataset.

Examples:
  + Summary feature variable "**mean**tbodyaccjerkmeanz" was created.
  + Summary feature variable "**mean**fbodygyromagstd" was created.

***

#### Output Variable Naming Conventions
Feature variable names in the final tidy dataset are pieced together by concatenating substrings from the table below according to how each feature was defined in the raw source data.  Generally speaking, a variable name can be constructed by picking a substring from each row and concatenating them in row order.  There are slight variations to this with the magnitude variables but after looking over all the variable names in the output dataset you'll get the idea.

Substring in variable name | Description
--- | ---
"mean" | Summary statistic of the feature computed across each combination of Subject ID and Activity.  Only the mean is available.  Every feature variable in the output tidy dataset begins with "mean".
"t", "f"  | Domain component of this feature: t=time, f=frequency. 
"body", "gravity" | Force component of this feature.
"acc", "gyro" | Samsung smartphone device signals included in this feature: acc=accelerometer, gyro=gyroscope.
"jerk", "" | Is jerk motion included in this feature? 
"mean", "std" | Interval statistic calculated over moving windows of time included in this feature: mean=mean, std=std. deviation
"x", "y", "z", "mag" | Axis component or magnitude included in this feature: x=x-axis, y=y-axis, z=z-axis, or mag=magnitude.

Examples:
  + "mean" + "t" + "body" + "acc" + "jerk" + "mean" + "z" = "meantbodyaccjerkmeanz"
  + "mean" + "f" + "body" + "gyro" + "mag" + "std" = "meanfbodygyromagstd"

***

#### Output Variables
Here is the list of 68 variables contained in the final output tidy dataset.  They are listed here in the order in which they appear in the data.

Variable  | Type | Range | Units | Description | Missing Code | Transformation
----------- | ----------- | ----------- | ----------- | ----------- | ----------- | -----------
subjectid | Integer | 1, 2, …, 30 | N/A | Subject ID number | NA | N/A
activitylabel | Factor | WALKING, WALKING_UPSTAIRS,  WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  | N/A | Text label describing activity performed | NA | N/A
meantbodyaccmeanx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccmeany | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccmeanz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccstdx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccstdy | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccstdz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccmeanx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccmeany | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccmeanz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccstdx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccstdy | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccstdz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkmeanx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkmeany | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkmeanz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkstdx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkstdy | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkstdz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyromeanx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyromeany | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyromeanz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrostdx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrostdy | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrostdz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkmeanx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkmeany | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkmeanz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkstdx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkstdy | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkstdz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccmagmean | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccmagstd | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccmagmean | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantgravityaccmagstd | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkmagmean | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodyaccjerkmagstd | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyromagmean | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyromagstd | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkmagmean | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meantbodygyrojerkmagstd | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccmeanx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccmeany | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccmeanz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccstdx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccstdy | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccstdz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkmeanx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkmeany | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkmeanz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkstdx | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkstdy | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkstdz | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyromeanx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyromeany | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyromeanz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyrostdx | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyrostdy | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyrostdz | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccmagmean | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccmagstd | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkmagmean | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodyaccjerkmagstd | Numeric | [-1, 1] | g's rescaled  to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyromagmean | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyromagstd | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyrojerkmagmean | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel
meanfbodygyrojerkmagstd | Numeric | [-1, 1] | rad/sec rescaled to range | [See Naming Conventions][1] | NA |Mean by subjectid and activitylabel


1 g = 9.8 meters per second per second

rad/sec = radians per second

[1]: https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#output-variable-naming-convention
