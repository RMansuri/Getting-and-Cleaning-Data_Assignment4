The code book file describes the variables, data cleaning, formatting of variables etc..
The data source where the data was retrieved is from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
And the data for this assignment was posted on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
In R code we are performing the following steps in order to get the tidy and readable data. 
1.	Reads the X_train, Y_train and Subject_train from the train folder and saves it to trainData, trainLabeland trainSubject respectively.
2.	Reads the X_test, Y_test and Subject_test from the test folder and saves it to testData, testLabeland testSubject respectively.
3.	Merging testData and trainData to get the merged dataset i.e. joinData then
merging testLabel and trainLabel to get the merged dataset i.e. joinLabel then
4.	merging testSubject and trainSubject to get the dataset i.e. joinSubject.
5.	Then reading the features.txt file from the destination folder and storing the variable Features. The information on the measurements on the means and Stdev we extracted.
6.	From the jointdata of means and stdev “()” and “-“ are removed. Then the 1st letters of mean and stdev were capitalized. 
7.	Activity_labels.txt file and stored in the data activity. Then the activity names were transformed into lowercase, removed the underscores, and capitalize the 1st letter which appeared right after the underscore.
8.	Merged joinsubject, joinlabel and joindata by column subject to obtain the merged dataset i.e “cleaned data”. The cleaned data was written out as “merged_data.txt” on the destination folder as a flat file.
9.	A second independent dataset with average of each measurement for each activity and subject was created i.e. “Result data”. The file was written out as "data_with_means.txt on the destination folder as a flat file.
