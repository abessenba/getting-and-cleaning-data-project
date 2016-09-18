## Getting and Cleaning Data Course Project
## Submitted by: Ann Bessenbacher
## Date: 9/17/2016

## This script will perform the following steps on the UCI HAR Dataset downloaded and unzipped from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 1. Merge the training and the test sets to create one data set.
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names. 
## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 


## load libraries to use
library(dplyr)  
library(data.table)

## clean local environment
rm(list=ls())

## 1. Merge the training and the test sets to create one data set.
## set working directory if necessary.  I commented this out because the submission
## said to assume the data was in the current working directory
## setwd("~/R/GettingCleaningData/Project/UCI HAR Dataset")

## read in the text data
## read the X_test.txt file data
xtest <- fread("X_test.txt")

## read in the y_test.txt file data
ytest <- fread("y_test.txt")

## read in the subject_tests.txt file data
subjecttests <- fread("subject_test.txt")

## combine the three test tables into one data table by binding the columns
testtable <- cbind(subjecttests, ytest, xtest)

## read in the test data
## read the X_train.txt file data
xtrain <- fread("X_train.txt")

## read the y_train.txt file data
ytrain <- fread("y_train.txt")

## read the subject_train.txt file data
subjecttrain <- fread("subject_train.txt")

## combine the three train tables into one data table by binding the columns
traintable <- cbind(subjecttrain, ytrain, xtrain)

## merge the training and test data sets together
onedataset <- rbind(testtable, traintable)

## read in variable and activity labels
activitylabels <- fread("activity_labels.txt")

## read in the variable labels
variablelabels <- fread("features.txt")

## assign column names to the onedataset
names(onedataset) <- c("subjectId", "activityLabel", variablelabels$V2)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## extracting subset of the complete data set to get only those measurements
## that contain the mean or a standard deviation
subsetdata <- select(onedataset, (1:2), grep("std|[Mm]ean", colnames(onedataset)))



## 3. Use descriptive activity names to name the activities in the data set
## merge with subset data with the activity labels to replace the numbers in the table with
## labels
subsetdata <- merge(subsetdata, activitylabels, by.x = "activityLabel", by.y = "V1")

## copy the new column that came from the activity labels table to the activity column
subsetdata[, activityLabel:=V2]

## remove the extra activity column
subsetdata[,V2:=NULL]

## reorder the columns to have the subject first followed by the activity
setcolorder(subsetdata, c(2, 1, 3:88))



## 4. Appropriately label the data set with descriptive variable names. 
## clean-up the descriptive variable names previously assigned
colnames(subsetdata) <- gsub('[-(),]', "", colnames(subsetdata))
colnames(subsetdata) <- gsub("mean","Mean",colnames(subsetdata))
colnames(subsetdata) <- gsub("std","Std",colnames(subsetdata))



## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 
## group subset of data variables by subject and activity, calculate means
## and sort result by subject and activity
subsetBySubjectActivity <- 
  subsetdata %>%
  group_by(subjectId, activityLabel) %>%
  summarize_each(funs(mean)) %>%
  arrange(subjectId, activityLabel)

## write final tidy data set out to a text file
write.table(subsetBySubjectActivity, "tidy.txt", row.names = FALSE, quote = FALSE)