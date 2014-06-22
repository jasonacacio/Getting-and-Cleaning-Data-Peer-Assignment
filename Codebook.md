Herein is a brief summary of the process to end up with the fulfuillment of the exercise.

Data for this exercise was taken from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data directly downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Make sure to extract the zip file and rename the folder as data before putting it in the
working directory for the script to work.

The run_analysis.R script performs the following:

- Reads X_train.txt, y_train.txt and subject_train.txt from the "train" folder and store them in xtrain, ytrain and subtrain variables.
- Reads X_test.txt, y_test.txt and subject_test.txt from the "test" folder and store them in xtest, ytest and subtest variables.
- Concatenates test and train data.
- Reads the features.txt file from the "/data" folder and store the data in a variable called features. 
- Extracts the mean and standard deviation.
- Improves the readability of the column names of the subset by removing excess symbols and capitalizing "Mean" and "Std".
- Reads the activity_labels.txt file and stores the data in a variable called activity.
- Improves the readability of the column names in the second column of activity: Names converted to lower-case. Underscores are removed and capitalizes the letter immediately after the underscore.
- Combines joinx, joiny, joinsub (the combined prior-read files) by column to get a new  data frame, cleanedData.
- Names first two columns, "Subject" and "Activity", describing the subject number and a body position from 6 possible actions, respectively. Remaining 66 columns detail measurements that range from -1 to 1 exclusively.
- Creates a second independent tidy data set, using for loops, with the average of each measurement for each activity and each subject. 30 subjects doing 6 activities, resulting in 180 combinations. For each combination, calculates the mean of each measurement with the corresponding combination.
- Writes both the initially merged data (merged.txt) and result (means.txt) in the current working directory.
