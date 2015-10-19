# Packages ----------------------------------------------------------------
library(dplyr)
library(tidyr)

# Helper Functions --------------------------------------------------------
makeNames <- function(charString){
    c1 <- make.names(charString) 
    c2 <- make.unique(c1)
    c3 <- gsub("[\\.]+", "", c2)
    c4 <- tolower(c3)
    c4
}

fixNames <- function(charString){
    c1 <- gsub("bodybody", "body", charString)
    c1
}

buildDataSet <- function(subFile, actFile, featFile, actXref, featXref){
    print("Files to read")
    print(subFile)
    print(actFile)
    print(featFile)
    
    # Build subjects dataframe -----------------------------------------------------------
    subCon <- file(subFile)
    subjectsRaw <- readLines(con = subCon)
    close(subCon)
    subjects <- data_frame(subjectid = subjectsRaw) %>%
        mutate(subjectid = as.integer(subjectid))
    print("Subjects processed")
    print(dim(subjects))
    
    # Build activities dataframe ---------------------------------------------------------
    actCon <- file(actFile)
    activitiesRaw <- readLines(con = actCon)
    close(actCon)
    activities <- data_frame(activityid = activitiesRaw)
    print("Activities processed")
    print(dim(activities))

    # Build features dataframe ----------------------------------------------------------------
    featCon <- file(featFile)
    featuresRaw <- readLines(con = featCon)
    close(featCon)
    features <- data_frame(featuresString = featuresRaw) %>% 
        mutate(featuresString = sub("^[ ]+", "", featuresString)) %>% 
        separate(featuresString, into = as.vector(featXref$featureVar), sep = "[ ]+") %>% 
        select(matches("(mean){1}|(std){1}"), -matches("(meanFreq)|(angle)")) %>% 
        mutate_each(funs(as.numeric)) 
    print("Features processed")
    print(dim(features))
    
    # Dataset ----------------------------------------------------------------
    dataSet <- bind_cols(subjects, activities, features) %>%
        inner_join(actXref, by = "activityid") %>%
        select(subjectid, activitylabel, everything(), -activityid)
    print("Final Dataset created")
    print(dim(dataSet))
    
    dataSet
}

# Activities Cross-Reference ------------------------------------------------
con <- file("UCI HAR Dataset//activity_labels.txt")
activityLabelsRaw <- readLines(con = con)
close(con)

activitiesXref <- data.frame(labelString = activityLabelsRaw) %>%
    separate(labelString, into = c("activityid", "activitylabel"), sep = " ")

# Features Cross-Reference --------------------------------------------------
con <- file("UCI HAR Dataset//features.txt")
featuresRaw <- readLines(con = con)
close(con)

featuresXref <- data.frame(labelString = featuresRaw) %>%
    separate(labelString, into = c("featureid", "featurelabel"), sep = " ") %>%
    mutate(featureVar = makeNames(featurelabel)) %>%
    mutate(featureVar = fixNames(featureVar))

# Training File pointers ------------------------------------------------------
trainSubjectFile <- "UCI HAR Dataset//train//subject_train.txt"
trainActivityFile <- "UCI HAR Dataset//train//y_train.txt"
trainFeatureFile <- "UCI HAR Dataset//train//X_train.txt"


# Test File Pointers ------------------------------------------------------
testSubjectFile <- "UCI HAR Dataset//test//subject_test.txt"
testActivityFile <- "UCI HAR Dataset//test//y_test.txt"
testFeatureFile <- "UCI HAR Dataset//test//X_test.txt"


# Build datasets ----------------------------------------------------------
trainDataSet <- buildDataSet(trainSubjectFile, trainActivityFile, trainFeatureFile, activitiesXref, featuresXref)
testDataSet <- buildDataSet(testSubjectFile, testActivityFile, testFeatureFile, activitiesXref, featuresXref)


# Merge datasets -------------------------------------------------------------
mergedDataSet <- bind_rows(trainDataSet, testDataSet) %>%
    mutate(subjectid = as.factor(subjectid), activitylabel = as.factor(activitylabel)) 


# Summary -----------------------------------------------------------------
summaryDataSet <- mergedDataSet %>%
    group_by(subjectid, activitylabel) %>%
    summarize_each(funs(mean)) %>%
    setNames(c(names(.)[1:2], paste0("mean", names(.)[3:68])))
    

# Create text file suitable for export ------------------------------------
exportFile <- "courseProjectStep5.txt"
exportCon <- file(exportFile, open = "w+")
write.table(summaryDataSet, exportCon, row.names = FALSE, sep = ",")
close(exportCon)


