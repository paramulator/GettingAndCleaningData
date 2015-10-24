#### CodeBook.md
You are in the repo for the Coursera *Getting and Cleaning Data* class project.  The class project requires that the source data, which is spread across multiple individual text files, be consolidated into a single file adhering to the principles of tidy data.  This document provides references to the raw source data, and describes the final tidy dataset.  See the [README.md] () file in this repo for details on the process to generate the tidy dataset.   

***

#### Contents
* [References] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#references)
* [Variable Names] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#variable-names)
* [Feature Selection] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#feature-selection)
* [Transformations] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#transformations)
* [Naming Convention] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#naming-convention)
* [Output Variables] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md#output-variables)

***

#### References
For an understanding of the source data, this [link] (http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions) describes it in a bit more detail than does the Coursera project link.  In addition, look at the [features_info.txt] (https://github.com/paramulator/GettingAndCleaningData/blob/master/UCI%20HAR%20Dataset/features_info.txt) file contained in this repo for a deeper discussion of individual feature calculations.

***

#### Variable Names
The raw data contains a listing of "features" that were recorded during the experiments.  These features form the basis for column labels that will be used in the final tidy dataset.  The features were given descriptive character strings that on their own could not be used as valid R variable names.  Therefore, some transformations were applied to (1) remove special characters, (2) reduce everything to lower case, (3) eliminate spaces and (4) remove any duplicate occurances of "body" from the name.  The resulting names are long and they certainly are not pretty, but see [here] for advice given regarding what not to do with the names.  

Examples: 
  + Raw feature label "t**B**ody**A**cc**J**erk**-**mean**()-Z**" was converted to R variable name: "tbodyaccjerkmeanz".
  + Raw feature label "f**B**ody**B**ody**G**yro**M**ag**-**std**()**" was converted to R variable name "fbodygyromagstd".

***

#### Feature Selection
The assignment calls for keeping only those variables that represent time interval means and standard deviations of feature data collected for each subject and activity combination.  Feature variables that included "mean" or "std" in their labels were kept.  Feature variables that included "meanfreq" or "angle" were dropped because these were not based on simple mean or standard deviation calculations.  All other feature variables were dropped as well.  The result is a set of 66 feature variables.

Examples:  
  + Feature variable "tbodyaccjerk**mean**z" was kept.
  + Feature variable "fbodygyromag**std**" was kept.
  + Feature variable "fbodyaccmagskewness" was dropped.
  + Feature variable "tgravityaccmagarcoeff3" was dropped.

***

#### Transformations
The test and train data each contain a subject ID and an activity ID number.  The activity ID number was used to pick up the descriptive "activitylabel" text string from the activities reference dataframe.  The final tidy dataset includes "subjectid" and "activitylabel" on each row of data and drops the activity ID.

The test and train data were joined together into one dataset.  This dataset was ordered by "subjectid" and activitylabel.  Within each of these combinations the mean value of each of the 66 features was computed.  The text string "mean" was pre-pended to each feature variable name in the final tidy dataset.

Examples:
  + Summary feature variable "**mean**tbodyaccjerkmeanz" was created.
  + Summary feature variable "**mean**fbodygyromagstd" was created.

***

#### Naming Convention
Feature variable names in the final tidy dataset are pieced together by concatenating strings from this table according to what was measured, which device was used, which axis was recorded, etc.

Substring in variable name | Description
--- | ---
"mean" | Summary statistic of feature computed across each combination of Subject ID and Activity.  Only the mean is available.
"t", "f"  | Domain component of this feature: t=time, f=frequency 
"body", "gravity" | Force component of this feature
"acc", "gyro" | Samsung smartphone device signals included in this feature: acc=accelerometer, gyro=gyroscope
"jerk", "" | Is jerk motion included in this feature? 
"mean", "std" | Interval statistic calculated over moving windows of time included in this feature: mean=mean, std=std. deviation
"x", "y", "z", "mag" | Axis component or magnitude included in this feature: x=x-axis, y=y-axis, z=z-axis, mag=magnitude

Examples:
  + "mean" + "t" + "body" + "acc" + "jerk" + "mean" + "z" = "meantbodyaccjerkmeanz"
  + "mean" + "f" + "body" + "gyro" + "mag" + "std" = "meanfbodygyromagstd"

***

#### Output Variables

Variable Name | Type | Valid Range | Units of Measure | Description | Code for Missing | Transformation
----------- | ----------- | ----------- | ----------- | ----------- | ----------- | -----------
subjectid | Integer | 1, 2, …, 30 | N/A | Subject ID number | NA | N/A
activitylabel | Factor |  | N/A | Activity label | NA | N/A
meantbodyaccmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodygyromeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyromeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyromeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrostdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrostdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrostdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodyaccmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantgravityaccmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodyaccjerkmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meantbodygyromagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyromagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meantbodygyrojerkmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodyaccmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkmeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkmeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkmeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkstdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkstdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkstdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodygyromeanx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyromeany | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyromeanz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyrostdx | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyrostdy | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyrostdz | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodyaccmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodyaccjerkmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | g's rescaled  to valid range
meanfbodygyromagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyromagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyrojerkmagmean | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
meanfbodygyrojerkmagstd | Numeric | [-1, 1] | Unitless | See naming conventions  | NA | rad/sec rescaled to valid range
