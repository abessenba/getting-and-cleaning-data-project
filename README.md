# Coursera Course: Getting and Cleaning Data Project

## Introduction

This was a course project from the Coursera course listed above.  The project serves to demonstrate the collection and cleaning of a data set into that of a tidy data set. 
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This repo has one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   Called tidy.txt that also resides in this repo.
   

## Usage

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Place the ```run_analysis.R``` in the folder of ```UCI HAR Dataset``` and make sure the data files needed
   are also in this folder. They are listed in the run_analysis.R and in the short list here:
   (X_test.txt, X_train.txt, Y_test.txt, Y_train.txt, subject_test.txt, subject_train.txt, activity_labels.txt and features.txt) 
3. Set this as your working directory using ```setwd()``` function in RStudio.
4. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

Alternatively, to get a better look at the data you can download the tidy.txt file and read it with the following command:
>tidydata <- read.table(file_path, header = TRUE)
>View(tidydata)

## Dependencies

It depends on the packages: ```dplyr``` and ```data.table``` and you'll want to install those first.
You can find additional information about the variables and data in the CodeBook.md file.