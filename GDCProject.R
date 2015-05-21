# Getting and cleaning data
# Project submission
# R script

# 1. Merges the training and the test sets to create one data set.
library(plyr)

xTrainOriginal <- read.table("train/X_train.txt")
xTestOriginal <- read.table("test/X_test.txt")
yTrainOriginal <- read.table("train/y_train.txt")
yTestOriginal <- read.table("test/y_test.txt")
subjectTrainOriginal <- read.table("train/subject_train.txt")
subjectTestOrignal <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

xData <- rbind(xTrainOriginal,xTestOriginal)
yData <- rbind(yTrainOriginal, yTestOriginal)
subjectData <- rbind(subjectTrainOriginal, subjectTestOrignal)

# 2. Extract only the measurements on the mean and standard deviation for each measurement

msFeatures <- grep("-(mean|std)\\(\\)", features[,2])
xData <- xData[,msFeatures]
names(xData) <- features[msFeatures,2]

# 3. Use descriptive activity names to name the activities in the data set

yData[,1] <- activities[yData[,1],2]
names(yData) <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names

names(subjectData) <- "Subject"
mergedData <- cbind(xData, yData, subjectData)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

tidyDataset <- ddply(mergedData,.(Subject, Activity), function(data) colMeans(data[,1:66], na.rm = TRUE))
write.table(tidyDataset, "Tidy dataset.txt", row.names=FALSE, sep=",")