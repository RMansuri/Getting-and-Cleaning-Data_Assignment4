#1. Setting working directory, then merging train and test datasets

setwd("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/")
 <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/train/X_train.txt")
dim(TrainData) 
head(TrainData)
trainLabel <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/train/subject_train.txt")
testData <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/test/X_test.txt")
dim(testData)
testLabel <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/test/y_test.txt")
jointData <- rbind(TrainData, testData)
dim(jointData)
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) 
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) 

#2. Extracting only the measurements on the mean and standard deviation for each measurement

features <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/features.txt")
dim(features) 
meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStd) 
jointData <- jointData[, meanStd]
dim(jointData) 
names(jointData) <- gsub("\\(\\)", "", features[meanStd, 2]) # removing "()"
names(jointData) <- gsub("mean", "Mean", names(jointData)) # Capitalizing M for Means
names(jointData) <- gsub("std", "Std", names(jointData)) # capitalizing S for Standard Deviations
names(jointData) <- gsub("-", "", names(jointData)) # removing Hypens "-" in column names 


# 3. Using descriptive activities names in the data set
activity <- read.table("C:/Users/Name/Documents/MOOC/GettingData/Ass4/Data/activity_labels.txt")

activity[, 2] <- tolower(gsub("_", "", activity[, 2]))

substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))

substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"


#4. Appropriately labels the data set with descriptive activity names

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, jointData)
dim(cleanedData)

write.table(cleanedData, "merged_data.txt") 


#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "data_with_means.txt") 


