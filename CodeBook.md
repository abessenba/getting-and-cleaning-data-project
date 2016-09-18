---
title: "Getting and Cleaning Data Codebook"
author: "Ann Bessenbacher"
date: "9/18/2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
This was a course project from the Coursera course: Getting and Cleaning Data taught by Johns Hopkins University as part of the Data Science Specialization.  
The project serves to demonstrate the collection and cleaning of a data set into that of a tidy data set. 
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Study design and data processing
The design of this project was:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   Called tidy.txt that also resides in this repo.


 ###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


 ###Notes on the original (raw) data 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).  The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.  The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3Hz cutoff frequency was used.  From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

##Creating the tidy datafile



 ###Guide to create the tidy data file
1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Place the ```run_analysis.R``` in the folder of ```UCI HAR Dataset``` and make sure the data files needed
   are also in this folder. They are listed in the run_analysis.R and in the short list here:
   (X_test.txt, X_train.txt, Y_test.txt, Y_train.txt, subject_test.txt, subject_train.txt, activity_labels.txt and features.txt) 
3. Set this as your working directory using ```setwd()``` function in RStudio.
4. 4. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.


 ###Cleaning of the data
The run_analysis.R script will combine the test and training data files along with the subject ids and activity codes.  It then labels the variables columns names from the given file.  Next it extracts only those variables that contain either a 'Mean' 'mean' or 'std' for standard deviation. So all variables with the word mean anywhere in the name were chose. Then it assigns labels for the activities by merging the activity label file with the current version of the data set.  The variable names are cleaned and made tidy.  Lastly, a new smaller data set is created by calculating the means of each of the variables for each subject and activity group. This tidy data set is then written out to a text file in the current working directory.
 [link to the readme document that describes the code in greater detail](https://github.com/abessenba/getting-and-cleaning-data-project/blob/master/README.md)

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset: 180 observations of 88 variables
 - Summary of the data: Subject ids range from 1:30 and there are 6 activity labels as seen below along with the 86 means of the variables
 - Variables present in the dataset:

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)


 ###subjectId - Identifies each subject of the study.
 - Class of the variable: int 
 - Unique values/levels of the variable: 1:30
  
 ### activityLabel                    
 - Class of the variable: chr  
 - Unique values/levels of the variable: "LAYING" "SITTING" "STANDING" "WALKING" "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"
 
 ### tBodyAccMeanX                    
 - Class of the variable: number
 - Unique values/levels of the variable: 0.222 0.261 0.279 0.277 0.289 ...
 - Unit of measurement: 3-axial raw signal
 - Naming Schema: mean of the time, body, acceleration signal in the X direction
 
 ### tBodyAccMeanY                    
 - Class of the variable: number
 - Unique values/levels of the variable: 0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: mean of the time, body, acceleration signal in the Y direction
 
 ### tBodyAccMeanZ                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.113 -0.105 -0.111 -0.111 -0.108 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: mean of the time, body, acceleration signal in the Z direction
 
 ### tBodyAccStdX                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.928 -0.977 -0.996 -0.284 0.03 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: standard deviation of the time, body, acceleration signal in the X direction
 
 ### tBodyAccStdY                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: standard deviation of the time, body, acceleration standard deviation signal in the Y direction
  
 ### tBodyAccStdZ                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.826 -0.94 -0.98 -0.26 -0.23 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: standard deviation of the time, body, acceleration signal in the Z direction
  
 ### tGravityAccMeanX                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.249 0.832 0.943 0.935 0.932 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, gravity, acceleration signal in the X direction
  
 ### tGravityAccMeanY                 
 - Class of the variable: number
 - Unique values/levels of the variable: 0.706 0.204 -0.273 -0.282 -0.267 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, gravity, acceleration signal in the Y direction
 
  ### tGravityAccMeanZ                 
 - Class of the variable: number
 - Unique values/levels of the variable: 0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, gravity, acceleration signal in the Z direction
 
 ### tGravityAccStdX                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.897 -0.968 -0.994 -0.977 -0.951 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, gravity, acceleration signal in the X direction
 
 ### tGravityAccStdY                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.908 -0.936 -0.981 -0.971 -0.937 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, gravity, acceleration signal in the Y direction
 
 ### tGravityAccStdZ                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.852 -0.949 -0.976 -0.948 -0.896 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, gravity, acceleration signal in the Z direction
 
 ### tBodyAccJerkMeanX                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0811 0.0775 0.0754 0.074 0.0542 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, acceleration, jerk signal in the X direction
 
 ### tBodyAccJerkMeanY                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, acceleration, jerk signal in the Y direction
 
 ### tBodyAccJerkMeanZ                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, acceleration, jerk signal in the Z direction
 
 ### tBodyAccJerkStdX                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, acceleration, jerk signal in the X direction
 
 ### tBodyAccJerkStdY                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.924 -0.981 -0.986 0.067 -0.102 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, acceleration, jerk signal in the Y direction
 
 ### tBodyAccJerkStdZ                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.955 -0.988 -0.992 -0.503 -0.346 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, acceleration, jerk signal in the Z direction
 
 ### tBodyGyroMeanX                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope signal in the X direction
 
 ### tBodyGyroMeanY                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope signal in the Y direction
 
 ### tBodyGyroMeanZ                   
 - Class of the variable: number
 - Unique values/levels of the variable: 0.1487 0.0629 0.0748 0.0849 0.0901 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope signal in the Z direction
 
 ### tBodyGyroStdX                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.874 -0.977 -0.987 -0.474 -0.458 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope signal in the X direction
 
 ### tBodyGyroStdY                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope signal in the Y direction
 
 ### tBodyGyroStdZ                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.908 -0.941 -0.981 -0.344 -0.125 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope signal in the Z direction
 
 ### tBodyGyroJerkMeanX               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope jerk signal in the X direction
 
 ### tBodyGyroJerkMeanY               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope jerk signal in the Y direction
 
 ### tBodyGyroJerkMeanZ               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope jerk signal in the Z direction
 
 ### tBodyGyroJerkStdX                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.919 -0.992 -0.993 -0.207 -0.487 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope jerk signal in the X direction
 
 ### tBodyGyroJerkStdY                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.968 -0.99 -0.995 -0.304 -0.239 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope jerk signal in the Y direction
 
 ### tBodyGyroJerkStdZ                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.958 -0.988 -0.992 -0.404 -0.269 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope jerk signal in the Z direction
 
 ### tBodyAccMagMean                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, acceleration, magnitude signal
 
 ### tBodyAccMagStd                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, acceleration, magnitude signal
 
 ### tGravityAccMagMean               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, gravity, acceleration, magnitude signal
 
 ### tGravityAccMagStd                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, gravity, acceleration, magnitude signal
 
 ### tBodyAccJerkMagMean              
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, acceleration, jerk, magnitude signal
 
 ### tBodyAccJerkMagStd               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, acceleration, jerk, magnitude signal
 
 ### tBodyGyroMagMean                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope, magnitude signal
 
 ### tBodyGyroMagStd                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.819 -0.935 -0.979 -0.187 -0.226 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope, magnitude signal
 
 ### tBodyGyroJerkMagMean             
 - Class of the variable: number
 - Unique values/levels of the variable: -0.963 -0.992 -0.995 -0.299 -0.295 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the time, body, gyroscope, jerk, magnitude signal
 
 ### tBodyGyroJerkMagStd              
 - Class of the variable: number
 - Unique values/levels of the variable: -0.936 -0.988 -0.995 -0.325 -0.307 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the time, body, gyroscope, jerk, magnitude signal
 
 ### fBodyAccMeanX                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the frequency, body, acceleration signal in the X direction
 
 ### fBodyAccMeanY                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the frequency, body, acceleration signal in the Y direction
 
 ### fBodyAccMeanZ                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.883 -0.959 -0.985 -0.332 -0.226 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the frequency, body, acceleration signal in the Z direction
 
 ### fBodyAccStdX                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency, body, acceleration signal in the X direction
 
 ### fBodyAccStdY                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.834 -0.917 -0.972 0.056 -0.113 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency, body, acceleration signal in the Y direction
 
 ### fBodyAccStdZ                     
 - Class of the variable: number
 - Unique values/levels of the variable: -0.813 -0.934 -0.978 -0.28 -0.298 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency, body, acceleration signal in the Z direction
 
 ### fBodyAccMeanFreqX                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.1588 -0.0495 0.0865 -0.2075 -0.3074 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration mean frequency in the X direction
 
 ### fBodyAccMeanFreqY                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0975 0.0759 0.1175 0.1131 0.0632 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration mean frequency in the Y direction
 
 ### fBodyAccMeanFreqZ                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0894 0.2388 0.2449 0.0497 0.2943 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration frequency in the Z direction
 
 ### fBodyAccJerkMeanX                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the X direction
 
 ### fBodyAccJerkMeanY                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the Y direction
 
 ### fBodyAccJerkMeanZ                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.948 -0.986 -0.991 -0.469 -0.288 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the Z direction
 
 ### fBodyAccJerkStdX                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency of the body, acceleration jerk signal in the X direction
 
 ### fBodyAccJerkStdY                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.932 -0.983 -0.987 0.107 -0.135 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency of the body, acceleration jerk signal in the Y direction
 
 ### fBodyAccJerkStdZ                 
 - Class of the variable: number
 - Unique values/levels of the variable: -0.961 -0.988 -0.992 -0.535 -0.402 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency of the body, acceleration jerk signal in the Z direction
 
 ### fBodyAccJerkMeanFreqX            
 - Class of the variable: number
 - Unique values/levels of the variable: 0.132 0.257 0.314 -0.209 -0.253 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the X direction
 
 ### fBodyAccJerkMeanFreqY            
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0245 0.0475 0.0392 -0.3862 -0.3376 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the Y direction
 
 ### fBodyAccJerkMeanFreqZ            
 - Class of the variable: number
 - Unique values/levels of the variable: 0.02439 0.09239 0.13858 -0.18553 0.00937 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration jerk signal in the Z direction
 
 ### fBodyGyroMeanX                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.85 -0.976 -0.986 -0.339 -0.352 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope signal in the X direction
 
 ### fBodyGyroMeanY                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope signal in the Y direction
 
 ### fBodyGyroMeanZ                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope signal in the Z direction
 
 ### fBodyGyroStdX                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.882 -0.978 -0.987 -0.517 -0.495 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviationof the frequency of the body, gyroscope signal in the X direction
 
 ### fBodyGyroStdY                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviationof the frequency of the body, gyroscope signal in the Y direction
 
 ### fBodyGyroStdZ                    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.917 -0.944 -0.982 -0.437 -0.238 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviationof the frequency of the body, gyroscope signal in the Z direction
 
 ### fBodyGyroMeanFreqX               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.00355 0.18915 -0.12029 0.01478 -0.10045 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope frequency signal in the X direction
 
 ### fBodyGyroMeanFreqY               
 - Class of the variable: number
 - Unique values/levels of the variable: -0.0915 0.0631 -0.0447 -0.0658 0.0826 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope frequency signal in the Y direction
 
 ### fBodyGyroMeanFreqZ               
 - Class of the variable: number
 - Unique values/levels of the variable: 0.010458 -0.029784 0.100608 0.000773 -0.075676 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope frequency signal in the Z direction
 
 ### fBodyAccMagMean                  
 - Class of the variable: number
 - Unique values/levels of the variable: -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean of the frequency body, acceleration, magnitude signal
 
 ### fBodyAccMagStd                   
 - Class of the variable: number
 - Unique values/levels of the variable: -0.798 -0.928 -0.982 -0.398 -0.187 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency body, acceleration, magnitude signal
 
 ### fBodyAccMagMeanFreq              
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0864 0.2367 0.2846 0.1906 0.1192 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration, magnitude frequency signal
 
 ### fBodyBodyAccJerkMagMean          
 - Class of the variable: number
 - Unique values/levels of the variable: -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration, jerk, magnitude signal
 
 ### fBodyBodyAccJerkMagStd           
 - Class of the variable: number
 - Unique values/levels of the variable: -0.922 -0.982 -0.993 -0.103 -0.104 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation frequency of the body, acceleration, jerk, magnitude signal
 
 ### fBodyBodyAccJerkMagMeanFreq      
 - Class of the variable: number
 - Unique values/levels of the variable: 0.2664 0.3519 0.4222 0.0938 0.0765 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, acceleration, jerk, magnitude frequency
 
 ### fBodyBodyGyroMagMean             
 - Class of the variable: number
 - Unique values/levels of the variable: -0.862 -0.958 -0.985 -0.199 -0.186 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope, magnitude signal
 
 ### fBodyBodyGyroMagStd              
 - Class of the variable: number
 - Unique values/levels of the variable: -0.824 -0.932 -0.978 -0.321 -0.398 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the frequency body, gyroscope, magnitude signal
 
 ### fBodyBodyGyroMagMeanFreq         
 - Class of the variable: number
 - Unique values/levels of the variable: -0.139775 -0.000262 -0.028606 0.268844 0.349614 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope, magnitude frequency
 
 ### fBodyBodyGyroJerkMagMean         
 - Class of the variable: number
 - Unique values/levels of the variable: -0.942 -0.99 -0.995 -0.319 -0.282 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope, jerk, magnitude signal
 
 ### fBodyBodyGyroJerkMagStd          
 - Class of the variable: number
 - Unique values/levels of the variable: -0.933 -0.987 -0.995 -0.382 -0.392 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Standard deviation of the body, gyroscope, jerk, magnitude signal
 
 ### fBodyBodyGyroJerkMagMeanFreq     
 - Class of the variable: number
 - Unique values/levels of the variable: 0.176 0.185 0.334 0.191 0.19 ...
 - Unit of Measurement: 3-axial raw signal
 - Naming Schema: Mean frequency of the body, gyroscope, jerk, magnitude frequency
 
 ### angletBodyAccMeangravity         
 - Class of the variable: number
 - Unique values/levels of the variable: 0.021366 0.027442 -0.000222 0.060454 -0.002695 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean angle to the body, acceleration gravity
 
 ### angletBodyAccJerkMeangravityMean 
 - Class of the variable: number
 - Unique values/levels of the variable: 0.00306 0.02971 0.02196 -0.00793 0.08993 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean angle to the body, acceleration, jerk, Mean gravity
 
 ### angletBodyGyroMeangravityMean    
 - Class of the variable: number
 - Unique values/levels of the variable: -0.00167 0.0677 -0.03379 0.01306 0.06334 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean angle to the body, gyroscope mean gravity
 
 ### angletBodyGyroJerkMeangravityMean
 - Class of the variable: number
 - Unique values/levels of the variable: 0.0844 -0.0649 -0.0279 -0.0187 -0.04 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean angle to the body, gyroscope, jerk, mean gravity
 
 ### angleXgravityMean                
 - Class of the variable: number
 - Unique values/levels of the variable: 0.427 -0.591 -0.743 -0.729 -0.744 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean of the angle to the X gravity
 
 ### angleYgravityMean                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.5203 -0.0605 0.2702 0.277 0.2672 ...
 - Unit of Measurement: degree
 - Naming Schema: Mean of the angle to the Y gravity
 
 ### angleZgravityMean                
 - Class of the variable: number
 - Unique values/levels of the variable: -0.3524 -0.218 0.0123 0.0689 0.065 ...
 - Unity of Measurement: degree
 - Naming Schema: Mean of the angle to the Z gravity




