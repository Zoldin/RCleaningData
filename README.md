# RCleaningData
Human Activity Recognition Using Smartphones Dataset and "Getting and cleaning the data" Course project
Version 1.0
-------------------------------------------------------------------------------------------------------
Author: Marija Zoldin
-------------------------------------------------------------------------------------------------------

Main task of our course project was to learn how to extract, transform and manipulate with a large data sets. 
Our main goal was to create an independent data set from the data sets that was provided 
via link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Following files were source(UCI HAR dataset) data sets for our independent data set:

  - 'features.txt': List of all features.
  - 'activity_labels.txt': Links the class labels with their activity name.
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels.

In this repository RCleaningData three files are present:

  - Readme.md
  - run_analysis.R
  - CodeBook.md


run_analysis.R is an R script that is doing following:

  1)  It checks does "UCI HAR Dataset" exists in R working directory (if it does not exists you will get red warning at           the beggining of the excution - you need to include "UCI HAR Dataset" in a R working directory)

  2)  Importss train data sets that needs to be "merged": X_train.txt (training data set), subject_train.txt     
      (volunteer_id), y_train.txt (activity_id)

  3)  Before merging three data sets from 2) variables from subject_train.txt and y_train.txt were renamed             
      (volunteer_id and activity_id).

  4)  Merging was done with cbind command. The reason for that is that we wanted merged three data set with column                binding, not row binding. This merged data set was called train_final.

  5)  Steps 2),3) and 4) were repeated for test data sets (X_test.txt,subject_test.txt,y_test.txt). This merged data              set was called test final. 

  6)  Train_final and test_final were merged with rbind command. The reason for that is that we wanted merged three               data set with row binding, not column binding.
      This data set contains 563 variables and 10299 observations - 7352 observations from train_final and 2947 rows              from test data.

  7)  Variable names for a data set created in step 6) were extracted from features.txt file. All variables in a data             set created in a previous step 6) were renamed (except columns names volunteer_id and activity_id)

  8)  Subset from data set from step 7) was created. Beside volunteer_id and activity_id only variables which name                contains mean or std (standard deviation) were extracted in a subset data set.Variables that are representing               angles between vectors were excluded (altough some of them are representing averaging signals). Also weighted               averages of the frequency component (*MeanFreq as an indicator in a variable name) were excluded from the subset.

  9)  Activity_id was replaced with an appropriate name(label). Labels were red from activity_labels.txt

  10)  Variable names were changed in a way that all upper cases were tansformed in lower cases, brackets were removed,            "-" was transformed into "_", "BodyBody" into "Body" etc. 
       Variable names were transformed into decriptive variable names.

  11)  For each volunteer_id and activity_id variable average value for each numeric variable in a data set was     
       calculated. Aggregate function was used. As a result of this aggregation data set "data_set_mean" was          
       created. Variable names were renamed in a way that they contains _avg at the end of their name. 
       This was the data set that was submitted for a part 1 of this assignment. Data set contains 180 observation and             68 variables.

CodeBook.md describes the data sets and variables in a more detail was.




