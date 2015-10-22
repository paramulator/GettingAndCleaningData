#### GettingAndCleaningData
Repo for the Coursera Getting and Cleaning Data class project.  This project involves reading multiple source data files from the wearable computing project and then transforming it all into a single tidy dataset.  A reference to wearable computing is [here](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand) and a full description of the raw source data is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  See also the Codebook.md file contained in this repo for details about the source data and the resulting tidy data. 
***
#### Contents of repo
File            | Description
----------------|---------------------------------------------------------------------
README.md       | Detailed logic for creating the tidy dataset, and related info.
Codebook.md     | Detailed description of source data, transformations, and resulting tidy data.
run_analysis.R  | R script to read source data and produce a tidy dataset

#### Contents of this document
* Data processing flow
* R script inputs
* R script outputs
* R script logic
* Session info
* Packages
* Some useful links

#### Data processing flow

#### R script inputs

#### R script outputs

#### R script detailed logic

#### Session Info

 setting | value
 --------|--------------------------------
 version | R version 3.2.1 (2015-06-18)
 system  | x86_64, mingw32             
 ui      | RStudio (0.99.484)          
 language | (EN)                        
 collate  | English_United States.1252  
 tz       | America/Chicago             
 date     | 2015-10-21                  

#### Packages 

 package |    * version date|       source 
 --------|------------------|------------------
 assertthat |   0.1 |     2013-12-06 CRAN (R 3.2.1)
 DBI |          0.3.1 |   2014-09-24 CRAN (R 3.2.1)
 devtools |   * 1.9.1 |   2015-09-11 CRAN (R 3.2.2)
 digest |       0.6.8 |   2014-12-31 CRAN (R 3.2.1)
 dplyr |      * 0.4.3 |   2015-09-01 CRAN (R 3.2.2)
 lazyeval |     0.1.10 |  2015-01-02 CRAN (R 3.2.1)
 magrittr |     1.5 |     2014-11-22 CRAN (R 3.2.1)
 memoise |      0.2.1 |   2014-04-22 CRAN (R 3.2.1)
 R6 |           2.1.1 |   2015-08-19 CRAN (R 3.2.2)
 Rcpp |         0.12.1 |  2015-09-10 CRAN (R 3.2.2)

#### Useful links regarding tidy data and variable naming references
* Tidy data course notes for this class: http://jtleek.github.io/modules/03_GettingData/01_03_componentsOfTidyData
* How to share data with a statistician: https://github.com/jtleek/datasharing
* The Elements of Data Analytic Style: https://leanpub.com/datastyle
* Hadley Wickham's paper on tidy data: http://vita.had.co.nz/papers/tidy-data.pdf
* 18 months of CTA advice for this class: https://thoughtfulbloke.wordpress.com/2015/08/31/hello-world

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

References
  Tidy data by HW
  Tidy data slides
  Reference to course notes about this project
  

You should also include information about which system (Mac/Windows/Linux) you used the software on and whether you tried it more than once to confirm it gave the same results. Ideally, you will run this by a fellow student/labmate to confirm that they can obtain the same output file you did.
