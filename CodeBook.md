This document describes the source data, the final tidy dataset, and the transformations required to make the source tidy.

References to raw data


  
Code Book

  Variable Name | Format | Unit of Measure | Description                    | Valid Range | Code for Missing | Transformation 
  --------------|--------|-----------------|--------------------------------|-------------|------------------|---------------
  subjectid     | integer|       N/A       | ID for each human subject      | 1 - 30| NA | N/A
  activitylabel | character|     N/A       | description of each activity performed   | WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING| NA | N/A 


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
