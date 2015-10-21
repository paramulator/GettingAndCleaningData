# P U R P O S E ----------------------------------------------------------------
# 
# This program reads a series of source text files associated with the wearable
# computing project.  The source files have been downloaded from the internet 
# into the current working directory for this project.  The code produces a 
# single dataframe that adheres as much as possible to the priciples of tidy 
# data.  As a final step, the dataframe is exported as a single text file.
# 
# The following code will produce a tidy dataframe in the ** WIDE ** format.
# 
# Most of the processing is done using the "dplyr" package along
# with the technique of pipelining a dataframe from one step to the next
# via the binary "%>%" operator.  Use of this operator is evident throughout
# the code.
# 
# I N P U T S ------------------------------------------------------------------
# 
# There are no inputs for this program.  References to all external data sources
# are hard-coded. 
# 
# O U T P U T S ----------------------------------------------------------------
# 
# A single ** WIDE FORMAT ** text file conforming to the standards of tidy data.
# 
# L O G I C --------------------------------------------------------------------
# 
# The steps for putting together a tidy dataset differ slightly from the steps
# outlined in the assignment.  The following approach constructs tidy data
# at intermediate steps before putting the "train" and "test" data together.
# This approach is slightly more efficent and gives the same net result.  It is
# more efficient because unnecessary columns are dropped before "train" and 
# "test" are concatenated thus reducing storage requirements. 
# 
# Step 0.  Prepare source file pointers and download data (if needed).
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
#          to raw human activitiy IDs.  Read the test data and produce a second 
#          dataframe, using the same methods.
# Step 3.  Once the training and test dataframes are constructed, concatenate 
#          these together to form a single, longer dataframe.
# Step 4.  Group the concatenated data by human subject id and activity label, 
#          and summarize it by finding the mean of each feature variable within 
#          each subject and activity combination.
# Step 5.  Export the summarized data to a text file in the current working 
#          directory.
#===============================================================================


# L I B R A R I E S ------------------------------------------------------------

library(dplyr)  # Used for pipelining and data manipulation operations.


# U T I L I T Y   F U N C T I O N S --------------------------------------------
 
makeNames <- function(charString){
    # Description: 
    #   Converts feature labels to valid, tidy R variable names.
    # 
    # Argument:  
    #   charString - raw feature label.
    #   
    # Returns:
    #   a character string representing a valid, tidy R variable name.

    c1 <- make.names(charString)  # Convert invalid symbols to "." throughout. 
    c2 <- make.unique(c1)  # Append a serial number to only duplicate names.
    c3 <- gsub("[\\.]+", "", c2)  # Compress out the dots.
    c4 <- tolower(c3)  # Make everything lower case.
    c5 <- gsub("bodybody", "body", c4) # Eliminate duplicate "body" text.
    c5  # The result is a tidy variable name.
}

buildDataSet <- function(subFile, actFile, featFile, actXref, featXref){
    # Description: 
    #   This function standardizes the work required to convert raw "test" 
    #   or "train" source files into tidy datasets.
    # 
    # Arguments:
    #   subFile  - path to the raw human subject ID file.
    #   actFile  - path to the raw activity ID file.
    #   featFile - path to the raw feature file.
    #   actXref  - pre-built activity cross reference dataframe.
    #   featXref - pre-built features cross reference dataframe.
    #              
    # Returns:
    #   A **WIDE FORMAT** tidy dataset with one column per feature, one row per 
    #   observation. It contains descriptive column names, descriptive activity 
    #   labels, and an ID variable for each human subject in the data. 
                         
    # Display input files.  
    print("Files to read")
    print(subFile)
    print(actFile)
    print(featFile)
    
    # Build subjects dataframe.  
    subjects <- read.table(subFile, colClasses = "integer", 
                           col.names = "subjectid")
    print("Subjects processed: rows, columns")
    print(dim(subjects))
    
    # Build activities dataframe.  
    activities <- read.table(actFile, colClasses = "integer", 
                             col.names = "activityid")
    print("Activities processed: rows, columns")
    print(dim(activities))

    # Build features dataframe and only keep mean, std dev variables.  
    features <- read.table(featFile, colClasses = "numeric",
                           col.names = featXref$featureVar) %>%
        select(matches("(mean){1}|(std){1}"), 
               -matches("(meanFreq)|(angle)"))
    print("Features processed: rows, columns")
    print(dim(features))
    
    # Put subjects, activity labels, and features together.  
    dataSet <- bind_cols(subjects, activities, features) %>%
        inner_join(actXref, by = "activityid") %>%
        select(subjectid, activitylabel, everything(), -activityid)
    print("Concatenated dataset processed: rows, columns")
    print(dim(dataSet))
    
    # Return the concatenated dataframe.  
    dataSet
}


# M A I N   P R O G R A M ------------------------------------------------------

# Step 0. File/folder pointers and source data ---------------------------------

# Source and local zip files.
externalZipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localZipFile <- "___UCIHARdataSet___.zip"

# Folder where unzipped data will be placed.
rootFolder <- "UCI HAR Dataset"

# Feature and activity cross reference files
activityFile <- "UCI HAR Dataset//activity_labels.txt"
featuresFile <- "UCI HAR Dataset//features.txt"

# Three training data files for Subject ID, Activity ID, and Feature.
trainSubjectFile <- "UCI HAR Dataset//train//subject_train.txt"
trainActivityFile <- "UCI HAR Dataset//train//y_train.txt"
trainFeatureFile <- "UCI HAR Dataset//train//X_train.txt"

# Three test data files for Subject ID, Activity ID, and Feature.
testSubjectFile <- "UCI HAR Dataset//test//subject_test.txt"
testActivityFile <- "UCI HAR Dataset//test//y_test.txt"
testFeatureFile <- "UCI HAR Dataset//test//X_test.txt"

# The exported text file to contain the final tidy dataset.
exportFile <- "UCI HAR Dataset//courseProjectStep5.txt"

# Remove the export file if it exists.
if (file.exists(exportFile)) {
    file.remove(exportFile)    
}

# If a folder called "UCI HAR Dataset" does not already exist in the current 
# working directory, data will be downloaded from the source and unzipped into 
# this folder.  If the folder already exists it will be assumed that the 
# correct subfolders and files have already been downloaded.
if (!file.exists(rootFolder)) {
    print("Dowloading source data")
    download.file(externalZipURL, localZipFile)
    unzip(localZipFile) 
    file.remove(localZipFile)
}

# Step 1. Process the reference data -------------------------------------------
activitiesXref <- read.table(activityFile, 
                             colClasses = c("integer", "character"),
                             col.names = c("activityid", "activitylabel"))

featuresXref <- read.table(featuresFile, 
                           colClasses = c("integer", "character"),
                           col.names = c("featureid", "featurelabel")) %>%
    mutate(featureVar = makeNames(featurelabel))

# Step 2. Process the train and test data --------------------------------------
trainDataSet <- buildDataSet(trainSubjectFile, trainActivityFile, 
                             trainFeatureFile, activitiesXref, featuresXref)
testDataSet <- buildDataSet(testSubjectFile, testActivityFile, 
                            testFeatureFile, activitiesXref, featuresXref)

# Step 3. Merge the train and test data ----------------------------------------
mergedDataSet <- bind_rows(trainDataSet, testDataSet) %>%
    mutate(activitylabel = as.factor(activitylabel)) 

# Step 4. Summarize the concatenated data, append "mean" to feature variables --
summaryDataSet <- mergedDataSet %>%
    group_by(subjectid, activitylabel) %>%
    summarize_each(funs(mean)) %>%
    setNames(c(names(.)[1:2], paste0("mean", names(.)[3:68])))
    
# Step 5. Export summary data to text file -------------------------------------
print(exportFile)
exportCon <- file(exportFile, open = "w+")
write.table(summaryDataSet, exportCon, row.names = FALSE)
close(exportCon)

# Done!



# Test to recreate exported dataframe:
# testFrame <- read.table(exportFile, header = TRUE)
# dim(testFrame)
# str(testFrame)
# summary(testFrame)



