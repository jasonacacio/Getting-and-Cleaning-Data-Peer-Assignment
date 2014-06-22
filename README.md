Getting-and-Cleaning-Data-Peer-Assignment
=========================================

Files needed for the Coursera Getting and Cleaning Data Course Peer Assignment

Included is the setup instructions as to how to perform this analysis properly:

* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder as "data".
* Put "data" and run_analysis.R in the same working directory.
* Type source("run_analysis.R") in R
* The working directory will generate two output files:
  - merged.txt: which contians the merged data; as a means of verifying the result
  - means.txt: which contains the tidy data set as specified by course assignment

The code is broken down into 5 phases:

1. Merge training and test sets;
2. Extract measurements on the mean and standard deviation for each as well as improving readability of output file;
3. Name the activities in the data set;
4. Labels the data set with descriptive activity names;
5. Create an independent tidy data set with the average of each variable for each activity and each subject, then write the appropriate text files.

Code book is provided separately within the repository.
