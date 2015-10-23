#### GettingAndCleaningData
This is the repo for the Coursera *Getting and Cleaning Data* class project.  This project involves reading multiple source data files from the wearable computing project by Anguita et al., 2013, and then transforming it into a single tidy dataset.  An R script was written to perform all of data processing activities.  

The wearable computing project involved the collection of data generated by the built-in gyro and accelerometer of a Samsung smartphone.  The smartphone was worn by 30 different human subjects while they performed 6 different activities like walking, standing, sitting, etc.  A vector of 561 "features" was captured at time intervals during the performance of each activity.  See the [Codebook.md] (https://github.com/paramulator/GettingAndCleaningData/blob/master/CodeBook.md) file contained in this repo for details about the source data and the resulting tidy dataset.   

A reference to wearable computing is [here](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand) and a description of the raw source data for this project is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

***

#### Contents of this document
* Instructions for running the R script
* Script details 
    +   Inputs
    +   Outputs
    +   Logic
* Dev environment
* Package dependency
* Some useful links
* Citation

***

#### Instructions for running the R script
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

#### Script details   
The script is [here] (https://github.com/paramulator/GettingAndCleaningData/blob/master/run_analysis.R)

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
A single **WIDE format** tidy dataset is generated as a text file and is placed in the "UCI HAR Dataset" folder.  The text file is called "courseProjectStep5.txt" and will have a column header row, 180 data rows, and 66 columns.  The first two columns indicate subject ID and activity label.  The remaining columns are means of 64 specific feature variables. 

<br>  

##### Logic overview
* Step 0
    + Establish pointers to the external data and each of the required files in the "UCI HAR Dataset" folder.
    + If the folder does not exist, download the external data as a zip file and unzip it into the "UCI HAR Dataset" folder.
    + If a text file called "courseProjectStep5.txt" exists in the UCI folder, remove it.
* Step 1
    + Read the reference data files for features and activites.  Features were given descriptive labels and need to be cleaned up before they can be used as valid variable names.   
* Step 2
    + Process the 3 files in the test folder by reading them, column-bind them, and subsetting the columns down to just those features that represent means and standard deviations of the raw time interval data.  The result will be a tidy dataset with one variable per column and one observation per row.  Do the same for the 3 files in the train folder.    
* Step 3
    + Row-bind the test and train tidy datasets results together into a single data frame
* Step 4
* Step 5
* Validation

***

#### Dev environment
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

#### Package dependency 
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
