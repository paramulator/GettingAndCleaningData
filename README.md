#### GettingAndCleaningData
This is the repo for the Coursera *Getting and Cleaning Data* class project.  This project involves reading multiple source data files from the wearable computing project by Anguita et al., 2013, and then transforming it all into a single tidy dataset.  R is used for all data processing activities.  

The wearable computing project involved the collection of activity-related data generated via the built-in gyro and accelerometer of a Samsung smartphone worn by test subjects.  A reference to wearable computing is [here](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand) and a description of the raw source data is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  See also the [Codebook.md] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md) file contained in this repo for more details about the source data and the resulting tidy dataset.

***

#### Contents of this document
* Instructions for running the script
* R script 
    +   Inputs
    +   Outputs
    +   Logic overview
* Session info
* Packages
* Some useful links
* Citation

***

#### Instructions for running the script
1.  Start an R session.
2.  Execute "library(dplyr)"...  Execute "install.package('dplyr')" first if necessary.
3.  In case the "UCI Har Dataset" folder already exists (because you've already manually downloaded the data), set your working directory to the parent of the UCI folder.
    + If this folder does not exist go to step 3.
4.  Execute the script [run_analysis.R] (https://github.com/paramulator/GettingAndCleaningData/blob/master/run_analysis.R).
  + the script is expecting to find a folder in the current working directory of the R session called "UCI HAR Dataset".  All sub-folders and files are expected to be found here.  If the "UCI HAR Dataset" folder does not exist, the script will create it and populate it with the source data files and folders.
  + An internet connection will be required to download data.
5.  After the script completes locate the file "courseProjectStep5.txt" in the "UCI HAR Dataset" folder.  This is the tidy dataset created from the inputs.
    + Execute the following to read the file into an R dataframe:
        + testFrame <- read.table("UCI HAR Dataset//courseProjectStep5.txt", header = TRUE)
6.  Reference the [CodeBook.md] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md) for details about the contents of the tidy dataset.

***

#### R script   
##### Inputs
There are no parameterized inputs to the R script.  Instead, all references to external data sources and locally downloaded directories and files are hard-coded. 

The raw source data are downloaded from this location:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The structure of the UCI folder and relevant input/output files is as follows:

File/Folder | Brief Description
------------|--------------------
**/UCI HAR Dataset** |root folder for all source data
  features.txt | feature IDs and labels
  activity_labels.txt | activity IDs and labels
  courseProjectStep5.txt | the generated tidy dataset
  **/UCI HAR Dataset/test** | test subset folder
    subject_test.txt | list of subjects
    y_test.txt | list of activities
    X_test.txt | list of features
  **/UCI HAR Dataset/train** | train subset folder
    subject_train.txt | list of subjects
    y_train.txt | list of activities
    X_train.txt | list of features  

<br>

##### Outputs
A single **WIDE format** tidy dataset is generated as a text file and is placed in the "UCI HAR Dataset" folder.  The text file is called "courseProjectStep5.txt".

<br>  

##### Logic overview
* Step 0
  + Establish pointers to the external data and each of the required files in the "UCI HAR Dataset" folder.
  + If the folder does not exist, download the external data as a zip file and unzip it into the "UCI HAR Dataset" folder.
  + If a text file called "courseProjectStep5.txt" exists in the UCI folder, remove it.
* Step 1
  + Read the reference data files for activities and features.  Features are given descriptive labels and need to be cleaned up before they can be used as valid variable names.  This is handled in this step. 
* Step 2
* Step 3
* Step 4
* Step 5
* Validation

***

#### Session Info
The state of the R environment during script development and testing:

 setting | value
 --------|--------------------------------
 version | R version 3.2.1 (2015-06-18)
 system  | x86_64, mingw32             
 ui      | RStudio (0.99.484)          
 language | (EN)                        
 collate  | English_United States.1252  
 tz       | America/Chicago             
 date     | 2015-10-21                  

***

#### Packages 
Packages that were loaded to enable tidy data manipulations:

 package |    * version date|       source 
 --------|------------------|------------------
 dplyr |      * 0.4.3 |   2015-09-01 CRAN (R 3.2.2)

***

#### Useful links regarding tidy data and variable naming references
* Tidy data course notes: http://jtleek.github.io/modules/03_GettingData/01_03_componentsOfTidyData
* How to share data with a statistician: https://github.com/jtleek/datasharing
* The Elements of Data Analytic Style: https://leanpub.com/datastyle
* Hadley Wickham's paper on tidy data: http://vita.had.co.nz/papers/tidy-data.pdf
* 18 months of CTA advice for this class: https://thoughtfulbloke.wordpress.com/2015/08/31/hello-world

***

#### Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

***

The instruction list
Ideally a computer script (in R :-), but I suppose Python is ok too...)
The input for the script is the raw data
The output is the processed, tidy data
There are no parameters to the script
In some cases it will not be possible to script every step. In that case you should provide instructions like:


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


  


