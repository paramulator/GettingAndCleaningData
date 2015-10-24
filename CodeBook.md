#### CodeBook.md
You are in the repo for the Coursera *Getting and Cleaning Data* class project.  The class project requires that the source data, which is spread across multiple individual text files, be consolidated into a single file adhering to the principles of tidy data.  This document provides references to the raw source data, and describes the final tidy dataset.  See the [README.md] () file in this repo for details on the process to generate the tidy dataset.   

***

#### Contents of this document
* References to source data
* Converting feature labels to valid R variable names
* Selection of specific features
* Transformations
* Attributes common to all transformed features
* Naming convention for variables in output tidy dataset 
* Tables of specific variables in the output tidy dataset

***

#### References to source data
For an understanding of the source data, this [link] (http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions) describes it in a bit more detail than does the Coursera project link.  In addition, look at the [features_info.txt] (https://github.com/paramulator/GettingAndCleaningData/blob/master/UCI%20HAR%20Dataset/features_info.txt) file contained in this repo for a deeper discussion of individual feature calculations.

***

#### Converting feature labels to valid R variable names
The raw data contains a listing of "features" that were recorded during the experiments.  These features form the basis for column labels that will be used in the final tidy dataset.  The features were given descriptive character strings that on their own could not be used as valid R variable names.  Therefore, some transformations were applied to (1) remove special characters, (2) reduce everything to lower case, (3) eliminate spaces and (4) remove any duplicate occurances of "body" from the name.  The resulting names are long and they certainly are not pretty, but see [here] for advice given regarding what not to do with the names.  

Examples: 
  + Raw feature label "t**B**ody**A**cc**J**erk**-**mean**()-Z**" was converted to R variable name: "tbodyaccjerkmeanz".
  + Raw feature label "f**B**ody**B**ody**G**yro**M**ag**-**std**()**" was converted to R variable name "fbodygyromagstd".

***

#### Selection of specific features
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

#### Naming convention for feature variables in output tidy data set
Feature variable names in the final tidy dataset are pieced together by concatenating strings from this table according to what was measured, which device was used, which axis was recorded, etc.

Component | Levels | Description
---- | --- | ---
Summary Stat | Mean (only) | Summary statistic of feature computed across each combination of Subject ID and Activity
Domain | t=time, f=frequency  | Domain component of this feature 
Force | body, gravity | Force component of this feature
Device | acc=accelerometer, gyro=gyroscope | Samsung smartphone device signals included in this feature 
Jerk | jerk, "" | Is jerk motion included in this feature? 
Interval Stat | mean, std=std. deviation | Interval statistic calculated over moving windows of time included in this feature
Axis or Magnitude | x, y, z, mag | Axis component or magnitude included in this feature

Examples:
  + "mean" + "t" + "body" + "acc" + "jerk" + "mean" + "z" = "meantbodyaccjerkmeanz"
  + "mean" + "f" + "body" + "gyro" + "mag" + "std" = "meanfbodygyromagstd"

***

#### Table of specific variables in the output tidy dataset

##### Grouping variables

  Variable Name | Format | Unit of Measure | Description                    | Valid Range | Code for Missing | Transformation
  --------------|--------|-----------------|--------------------------------|-------------|------------------|---------------
  subjectid     | integer|       N/A       | ID number for each human subject      | 1 - 30| NA | N/A
  activitylabel | character|     N/A       | Text description of each activity performed   | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING| NA | N/A 

##### Feature Variables

Feature Variable | Summary Stat: mean(only) | Domain: t=time, f=freq | Force: body, gravity | Device: acc, gyro | Jerk: Yes, No | Interval Stat: mean, std | Axis: x, y, z | Magnitude: Yes, No
----------- | --------- | ----------- | ------------ | ----------- | --------- | ----------- | ------------ | -----------
meantbodyaccmeanx | mean | time  | body  | acc |  | mean | x | 
meantbodyaccmeany | mean | time  | body  | acc |  | mean | y | 
meantbodyaccmeanz | mean | time  | body  | acc |  | mean | z | 
meantbodyaccstdx | mean | time  | body  | acc |  | std | x | 
meantbodyaccstdy | mean | time  | body  | acc |  | std | y | 
meantbodyaccstdz | mean | time  | body  | acc |  | std | z | 
meantgravityaccmeanx | mean | time  | gravity | acc |  | mean | x | 
meantgravityaccmeany | mean | time  | gravity | acc |  | mean | y | 
meantgravityaccmeanz | mean | time  | gravity | acc |  | mean | z | 
meantgravityaccstdx | mean | time  | gravity | acc |  | std | x | 
meantgravityaccstdy | mean | time  | gravity | acc |  | std | y | 
meantgravityaccstdz | mean | time  | gravity | acc |  | std | z | 
meantbodyaccjerkmeanx | mean | time  | body  | acc | Yes | mean | x | 
meantbodyaccjerkmeany | mean | time  | body  | acc | Yes | mean | y | 
meantbodyaccjerkmeanz | mean | time  | body  | acc | Yes | mean | z | 
meantbodyaccjerkstdx | mean | time  | body  | acc | Yes | std | x | 
meantbodyaccjerkstdy | mean | time  | body  | acc | Yes | std | y | 
meantbodyaccjerkstdz | mean | time  | body  | acc | Yes | std | z | 
meantbodygyromeanx | mean | time  | body  | gyro |  | mean | x | 
meantbodygyromeany | mean | time  | body  | gyro |  | mean | y | 
meantbodygyromeanz | mean | time  | body  | gyro |  | mean | z | 
meantbodygyrostdx | mean | time  | body  | gyro |  | std | x | 
meantbodygyrostdy | mean | time  | body  | gyro |  | std | y | 
meantbodygyrostdz | mean | time  | body  | gyro |  | std | z | 
meantbodygyrojerkmeanx | mean | time  | body  | gyro | Yes | mean | x | 
meantbodygyrojerkmeany | mean | time  | body  | gyro | Yes | mean | y | 
meantbodygyrojerkmeanz | mean | time  | body  | gyro | Yes | mean | z | 
meantbodygyrojerkstdx | mean | time  | body  | gyro | Yes | std | x | 
meantbodygyrojerkstdy | mean | time  | body  | gyro | Yes | std | y | 
meantbodygyrojerkstdz | mean | time  | body  | gyro | Yes | std | z | 
meantbodyaccmagmean | mean | time  | body  | acc |  | mean |  | Yes
meantbodyaccmagstd | mean | time  | body  | acc |  | std |  | Yes
meantgravityaccmagmean | mean | time  | gravity | acc |  | mean |  | Yes
meantgravityaccmagstd | mean | time  | gravity | acc |  | std |  | Yes
meantbodyaccjerkmagmean | mean | time  | body  | acc | Yes | mean |  | Yes
meantbodyaccjerkmagstd | mean | time  | body  | acc | Yes | std |  | Yes
meantbodygyromagmean | mean | time  | body  | gyro |  | mean |  | Yes
meantbodygyromagstd | mean | time  | body  | gyro |  | std |  | Yes
meantbodygyrojerkmagmean | mean | time  | body  | gyro | Yes | mean |  | Yes
meantbodygyrojerkmagstd | mean | time  | body  | gyro | Yes | std |  | Yes
meanfbodyaccmeanx | mean | freq  | body  | acc |  | mean | x | 
meanfbodyaccmeany | mean | freq  | body  | acc |  | mean | y | 
meanfbodyaccmeanz | mean | freq  | body  | acc |  | mean | z | 
meanfbodyaccstdx | mean | freq  | body  | acc |  | std | x | 
meanfbodyaccstdy | mean | freq  | body  | acc |  | std | y | 
meanfbodyaccstdz | mean | freq  | body  | acc |  | std | z | 
meanfbodyaccjerkmeanx | mean | freq  | body  | acc | Yes | mean | x | 
meanfbodyaccjerkmeany | mean | freq  | body  | acc | Yes | mean | y | 
meanfbodyaccjerkmeanz | mean | freq  | body  | acc | Yes | mean | z | 
meanfbodyaccjerkstdx | mean | freq  | body  | acc | Yes | std | x | 
meanfbodyaccjerkstdy | mean | freq  | body  | acc | Yes | std | y | 
meanfbodyaccjerkstdz | mean | freq  | body  | acc | Yes | std | z | 
meanfbodygyromeanx | mean | freq  | body  | gyro |  | mean | x | 
meanfbodygyromeany | mean | freq  | body  | gyro |  | mean | y | 
meanfbodygyromeanz | mean | freq  | body  | gyro |  | mean | z | 
meanfbodygyrostdx | mean | freq  | body  | gyro |  | std | x | 
meanfbodygyrostdy | mean | freq  | body  | gyro |  | std | y | 
meanfbodygyrostdz | mean | freq  | body  | gyro |  | std | z | 
meanfbodyaccmagmean | mean | freq  | body  | acc |  | mean |  | Yes
meanfbodyaccmagstd | mean | freq  | body  | acc |  | std |  | Yes
meanfbodyaccjerkmagmean | mean | freq  | body  | acc | Yes | mean |  | Yes
meanfbodyaccjerkmagstd | mean | freq  | body  | acc | Yes | std |  | Yes
meanfbodygyromagmean | mean | freq  | body  | gyro |  | mean |  | Yes
meanfbodygyromagstd | mean | freq  | body  | gyro |  | std |  | Yes
meanfbodygyrojerkmagmean | mean | freq  | body  | gyro | Yes | mean |  | Yes
meanfbodygyrojerkmagstd | mean | freq  | body  | gyro | Yes | std |  | Yes
