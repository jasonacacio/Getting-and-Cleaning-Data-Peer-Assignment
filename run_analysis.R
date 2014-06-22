# Step 1: Merge training and test sets

xtrain <- read.table("./data/train/X_train.txt")
ytrain <- read.table("./data/train/y_train.txt")
subtrain <- read.table("./data/train/subject_train.txt")
xtest <- read.table("./data/test/X_test.txt")
ytest <- read.table("./data/test/y_test.txt") 
subtest <- read.table("./data/test/subject_test.txt")
joinx <- rbind(xtrain, xtest)
joiny <- rbind(ytrain, ytest)
joinsub <- rbind(subtrain, subtest)

# Step 2: Extract measurements on the mean and standard deviation for each
# as well as improving readability of output file

features <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinx <- joinx[, meanStdIndices]
names(joinx) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(joinx) <- gsub("mean", "Mean", names(joinx))
names(joinx) <- gsub("std", "Std", names(joinx))
names(joinx) <- gsub("-", "", names(joinx))

# Step 3: Name the activities in the data set

activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
actiLabel <- activity[joiny[, 1], 2]
joiny[, 1] <- actiLabel
names(joiny) <- "Activity"

# Step 4: Labels the data set with descriptive activity names

names(joinsub) <- "Subject"
cleanedData <- cbind(joinsub, joiny, joinx)

# Step 5: Create independent tidy data set with the average
# of each variable for each activity and each subject, then write
# it as a text file.
 
subjectLen <- length(table(joinsub)) # 30
actiLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*actiLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:actiLen) {
        result[row, 1] <- sort(unique(joinsub)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == cleanedData$Subject
        bool2 <- activity[j, 2] == cleanedData$Activity
        result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}
head(result)
write.table(cleanedData, "merged.txt")
write.table(result, "means.txt")
