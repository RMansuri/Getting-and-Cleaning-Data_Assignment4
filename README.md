Getting and cleaning data week4 Assignment: To create a tidy dataset from data collected from accelerators Smartphones.

• Location of source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Below are the datasets that were used from the above link (Location Source):
• 'features.txt': List of all features.
• 'activity_labels.txt': Links the class labels with their activity name.
• 'train/subject_train.txt': Each row identifies the subject who performed the activity for each sample.Its range is from 1 to  30.
• 'train/X_train.txt': Training set.
• 'train/y_train.txt': Training labels.
• 'test/subject_test.txt': Each row identifies the subject who performed the activity for each sample.Its range is from 1 to  30.
• 'test/X_test.txt': Test set.
• 'test/y_test.txt': Test labels.

Below are the steps involved:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

R Script procedure followed:

1.	Set the folder location to a local directory where files are saved. (in the run_analysis.R, change the Directory in setwd to local directory where you saved the source data)
2.	Read in the Subjects datasets for Test and Train and merge subject datasets together.
3.	Read in the X datasets for Test and Train merge X datasets together.
4.	Read in the Y datasets for Test and Train merge Y datasets together.
5.	Read in Features dataset that has list of all features and set column names to more descriptive names and extract only mean and std in features dataset.
6.	Read in Activities_label dataset that has list of activity labels and set column names to more descriptive names.
7.	In X data set, keep only the features selected in features (only mean and std variables).
8.	Merge Y dataset with activity by Activity_id.
9.	Merge all datasets(X, Y and Subject) to one dataset table.
10.	Write the dataset to a txt file to your local directory.
11.	Average of each variable for each activity and each subject is calculated and dataset is written to txt file in local directory.




