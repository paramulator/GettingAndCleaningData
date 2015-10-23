This document describes the source data, the final tidy dataset, and the transformations required to make the source tidy.

References to raw data


  
Code Book

  Variable Name | Format | Unit of Measure | Description                    | Valid Range | Code for Missing | Transformation 
  --------------|--------|-----------------|--------------------------------|-------------|------------------|---------------
  subjectid     | integer|       N/A       | ID for each human subject      | 1 - 30| NA | N/A
  activitylabel | character|     N/A       | description of each activity performed   | WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING| NA | N/A 

 x | Summary | Domain | Force Component | Phone Device | Jerk Motion | Time Interval Statistic | Motion Axis | Magnitude
---|---------|--------|-----------------|--------------|-------------|-------------------------|-------------|-----------
 Feature | Statistic | t=time; f=frequency | body; gravity | acc=accelerometer; gyro | Yes; No | mean; std = standard deviation| x; y; z | Yes; No
meantbodyaccmeanx | mean | time  | body  | accelerometer  |  | mean | x | 
meantbodyaccmeany | mean | time  | body  | accelerometer  |  | mean | y | 
meantbodyaccmeanz | mean | time  | body  | accelerometer  |  | mean | z | 
meantbodyaccstdx | mean | time  | body  | accelerometer  |  | standard deviation | x | 
meantbodyaccstdy | mean | time  | body  | accelerometer  |  | standard deviation | y | 
meantbodyaccstdz | mean | time  | body  | accelerometer  |  | standard deviation | z | 
meantgravityaccmeanx | mean | time  | gravity | accelerometer  |  | mean | x | 
meantgravityaccmeany | mean | time  | gravity | accelerometer  |  | mean | y | 
meantgravityaccmeanz | mean | time  | gravity | accelerometer  |  | mean | z | 
meantgravityaccstdx | mean | time  | gravity | accelerometer  |  | standard deviation | x | 
meantgravityaccstdy | mean | time  | gravity | accelerometer  |  | standard deviation | y | 
meantgravityaccstdz | mean | time  | gravity | accelerometer  |  | standard deviation | z | 
meantbodyaccjerkmeanx | mean | time  | body  | accelerometer  | Yes | mean | x | 
meantbodyaccjerkmeany | mean | time  | body  | accelerometer  | Yes | mean | y | 
meantbodyaccjerkmeanz | mean | time  | body  | accelerometer  | Yes | mean | z | 
meantbodyaccjerkstdx | mean | time  | body  | accelerometer  | Yes | standard deviation | x | 
meantbodyaccjerkstdy | mean | time  | body  | accelerometer  | Yes | standard deviation | y | 
meantbodyaccjerkstdz | mean | time  | body  | accelerometer  | Yes | standard deviation | z | 
meantbodygyromeanx | mean | time  | body  | gyro |  | mean | x | 
meantbodygyromeany | mean | time  | body  | gyro |  | mean | y | 
meantbodygyromeanz | mean | time  | body  | gyro |  | mean | z | 
meantbodygyrostdx | mean | time  | body  | gyro |  | standard deviation | x | 
meantbodygyrostdy | mean | time  | body  | gyro |  | standard deviation | y | 
meantbodygyrostdz | mean | time  | body  | gyro |  | standard deviation | z | 
meantbodygyrojerkmeanx | mean | time  | body  | gyro | Yes | mean | x | 
meantbodygyrojerkmeany | mean | time  | body  | gyro | Yes | mean | y | 
meantbodygyrojerkmeanz | mean | time  | body  | gyro | Yes | mean | z | 
meantbodygyrojerkstdx | mean | time  | body  | gyro | Yes | standard deviation | x | 
meantbodygyrojerkstdy | mean | time  | body  | gyro | Yes | standard deviation | y | 
meantbodygyrojerkstdz | mean | time  | body  | gyro | Yes | standard deviation | z | 
meantbodyaccmagmean | mean | time  | body  | accelerometer  |  | mean |  | Yes
meantbodyaccmagstd | mean | time  | body  | accelerometer  |  | standard deviation |  | Yes
meantgravityaccmagmean | mean | time  | gravity | accelerometer  |  | mean |  | Yes
meantgravityaccmagstd | mean | time  | gravity | accelerometer  |  | standard deviation |  | Yes
meantbodyaccjerkmagmean | mean | time  | body  | accelerometer  | Yes | mean |  | Yes
meantbodyaccjerkmagstd | mean | time  | body  | accelerometer  | Yes | standard deviation |  | Yes
meantbodygyromagmean | mean | time  | body  | gyro |  | mean |  | Yes
meantbodygyromagstd | mean | time  | body  | gyro |  | standard deviation |  | Yes
meantbodygyrojerkmagmean | mean | time  | body  | gyro | Yes | mean |  | Yes
meantbodygyrojerkmagstd | mean | time  | body  | gyro | Yes | standard deviation |  | Yes
meanfbodyaccmeanx | mean | frequency | body  | accelerometer  |  | mean | x | 
meanfbodyaccmeany | mean | frequency | body  | accelerometer  |  | mean | y | 
meanfbodyaccmeanz | mean | frequency | body  | accelerometer  |  | mean | z | 
meanfbodyaccstdx | mean | frequency | body  | accelerometer  |  | standard deviation | x | 
meanfbodyaccstdy | mean | frequency | body  | accelerometer  |  | standard deviation | y | 
meanfbodyaccstdz | mean | frequency | body  | accelerometer  |  | standard deviation | z | 
meanfbodyaccjerkmeanx | mean | frequency | body  | accelerometer  | Yes | mean | x | 
meanfbodyaccjerkmeany | mean | frequency | body  | accelerometer  | Yes | mean | y | 
meanfbodyaccjerkmeanz | mean | frequency | body  | accelerometer  | Yes | mean | z | 
meanfbodyaccjerkstdx | mean | frequency | body  | accelerometer  | Yes | standard deviation | x | 
meanfbodyaccjerkstdy | mean | frequency | body  | accelerometer  | Yes | standard deviation | y | 
meanfbodyaccjerkstdz | mean | frequency | body  | accelerometer  | Yes | standard deviation | z | 
meanfbodygyromeanx | mean | frequency | body  | gyro |  | mean | x | 
meanfbodygyromeany | mean | frequency | body  | gyro |  | mean | y | 
meanfbodygyromeanz | mean | frequency | body  | gyro |  | mean | z | 
meanfbodygyrostdx | mean | frequency | body  | gyro |  | standard deviation | x | 
meanfbodygyrostdy | mean | frequency | body  | gyro |  | standard deviation | y | 
meanfbodygyrostdz | mean | frequency | body  | gyro |  | standard deviation | z | 
meanfbodyaccmagmean | mean | frequency | body  | accelerometer  |  | mean |  | Yes
meanfbodyaccmagstd | mean | frequency | body  | accelerometer  |  | standard deviation |  | Yes
meanfbodyaccjerkmagmean | mean | frequency | body  | accelerometer  | Yes | mean |  | Yes
meanfbodyaccjerkmagstd | mean | frequency | body  | accelerometer  | Yes | standard deviation |  | Yes
meanfbodygyromagmean | mean | frequency | body  | gyro |  | mean |  | Yes
meanfbodygyromagstd | mean | frequency | body  | gyro |  | standard deviation |  | Yes
meanfbodygyrojerkmagmean | mean | frequency | body  | gyro | Yes | mean |  | Yes
meanfbodygyrojerkmagstd | mean | frequency | body  | gyro | Yes | standard deviation |  | Yes

