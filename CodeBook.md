Introduction

Project Background
  Study design
  
Tidy data principles
  Struction of output is *WIDE*
  Each variable you measure should be in one column
  Each different observation of that variable should be in a different row
  There should be one table for each "kind" of variable
  If you have multiple tables, they should include a column in the table that allows them to be linked
  Always encode every piece of information about your observations using text.
  Some other important tips
    Include a row at the top of each file with variable names.
    Make variable names human readable AgeAtDiagnosis instead of AgeDx
    In general data should be saved in one file per table.
    https://github.com/jtleek/datasharing
  
Source Data
  Source files - where they are, what is there 
  Data structure
  # Structure of source data ------------------------------------------------
# 
# Source data files are broken down into several broad categories:
#   - Reference data
#       - A list of all human activities recorded in the data
#       - A list of all features recorded in the data
#   - Training data
#       - Specific human subjects included in the training data 
#       - Specific activities recorded in the training data
#       - Specific features recorded in the training data
#   - Test data
#       - Specific human subjects included in the test data 
#       - Specific activities recorded in the test data
#       - Specific features recorded in the test data
  Variable labels 
  Known issues
    some name components duplicated
    no key to join data together between subjects, activities, and features

Target Data
  Summary measures
  Included / Excluded values
  Structure
  Number of variables
    Grouping varibles
    Feature vribles
  Number of rows
  Variable naming scheme
  Transformations
  Known issues  
  
Code Book
  Variable Name
  Format
    Continuous
    Ordinal
    Categorical
    Missing
    Censored
  unit of measure
  Description
  Valid Range
  Code for Missing
  Transformations

Code to read target data


  
