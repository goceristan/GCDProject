Getting and Cleaning Data
Project submission
CodeBook file

Script: GCDProject.R
Input files: train/X_train.txt, test/X_test.txt, train/y_train.txt, test/y_test.txt, train/subject_train.txt, test/subject_test.txt, features.txt, activity_labels.txt
Output file: Tidy dataset.txt

1. Merges the training and the test sets to create one data set.
The corresponding train and test files for x, y and subject are merged using the rbind() function.

2. Extract only the measurements on the mean and standard deviation for each measurement
Columns with the mean and standard deviation measures are taken from the X dataset and assigned correct names from features.txt.
    
3. Use descriptive activity names to name the activities in the data set  
Getting the activity names and IDs from activity_labels.txt.

4. Appropriately labels the data set with descriptive variable names
Column names are corrected.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Create tidy dataset with all the average measures for each subject and activity type.