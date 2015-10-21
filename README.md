### GettingAndCleaningData
Repo for the Getting and Cleaning Data class project 
***
### Contents of repo
File            | Description
----------------|---------------------------------------------------------------------
README.md       | This document
Codebook.md     | Detailed description of data source, variables, and transformations
run_analysis.R  | Script to read raw data and produce a tidy dataset

Script logic
The instruction list
Ideally a computer script (in R :-), but I suppose Python is ok too...)
The input for the script is the raw data
The output is the processed, tidy data
There are no parameters to the script
In some cases it will not be possible to script every step. In that case you should provide instructions like:

Program Logic converting source to target
  Flowchart
  High level steps
  Diagram showing how files are related
  # 
# Logical steps -------------------------------------------------------------
# 
# The steps for putting together a tidy dataset differ slightly from the steps
# outlined in the assignment.  The following approach constructs tidy data
# at intermediate steps before putting the "train" and "test" data together.
# This approach is slightly more efficent and gives the same net result.  It is
# more efficient because unnecessary columns are dropped before "train" and 
# "test" are concatenated thus reducing storage requirements. 
#       
# Step 1.  Read the reference data files and produce individual dataframes for 
#          each.  As needed, a number of improvements are made to the "features" 
#          dataframe so that feature labels contained in the dataframe
#          can be used as proper R variable names that adhere to tidy
#          data principles.  The details are outlined below in the code.
# Step 2.  Read the training data and produce a training dataframe that adheres
#          to the principles of tidy data.  This step leverages the "features"
#          reference dataframe to construct meaningful column names.  It also
#          references the "activities" dataframe to give meaningful labels
#          to raw human activitiy IDs.
# Step 3.  Read the test data and produce a second dataframe, using the same
#          methods as Step 2.
# Step 4.  Once the training and test dataframes are constructed, concatenate 
#          these together to form a single, longer dataframe.
# Step 5.  Group the concatenated data by human subject id and activity label, 
#          and summarize it by finding the mean of each feature variable within 
#          each subject and activity combination.
# Step 6.  Export the summarized data to a text file in the current working 
#          directory.
#==========================================================================


Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
Step 2 - run the software separately for each sample
Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set
https://github.com/jtleek/datasharing

References
  Tidy data by HW
  Tidy data slides
  Reference to course notes about this project
  

You should also include information about which system (Mac/Windows/Linux) you used the software on and whether you tried it more than once to confirm it gave the same results. Ideally, you will run this by a fellow student/labmate to confirm that they can obtain the same output file you did.
