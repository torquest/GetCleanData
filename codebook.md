---
title: Getting and Cleaning Data Codebook
author: Tariq Shaikh
date: 24 Apr, 2015

output:
    keep_md: yes
---
 
## Project Description
The objective of the project is to create a tidy data set from the various files created by the Samsung wearable devices.
It consists of activity types and subjects grouped as Test and Train. The assignment involved combining the files and creating another dataset which calculates the mean for the measure by activity and subject.
 
##Study design and data processing
 
###Collection of the raw data
The raw data files were downloaded from the location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file was downloaded and unzipped to a directory and then the processing is done on it.
There are 6 activity types and 561 types of features in the raw files.
The test and train files are separate before working on them.


 
###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
Description on how to create the tidy data file:
1. Check else download the zip file.
2. Unzip to a directory in this case UCI HAR Dataset
3. Combine the X test and train datasets.
4. Then combine the Y test and train datasets
5. Apply the activity names to the combined data set
6. Apply the mean function to all measures by activity and subject.
 
###Cleaning of the data
There was no cleaning required except for combining of the datasets
 
##Description of the variables in the file

 - Dimensions of the dataset: 180 * 563
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
All variables are means of the measures from the original data.
 
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
