install.packages("plyr")
library(plyr)

if (!file.info("UCI HAR Dataset")$isdir) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "./UCI HAR Dataset/UCI-HAR-dataset.zip", method="curl")
  unzip("./UCI HAR Dataset/UCI-HAR-dataset.zip")
}

#Get all the features
feat <- read.table("./UCI HAR Dataset/features.txt")

#Load the Activity types

actvty_type <- read.table("./UCI HAR Dataset/activity_labels.txt")

#combine the Test data files

testdataX <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feat[,2])
traindataX <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feat[,2])



#1 merge the training and test data sets
CombDataX <- rbind(testdataX, traindataX)

#2 Get the data set of mean and std deviation
feat_mean_std <- feat[grep("(mean|std)\\(", feat[,2]),]
mean_std_data <- CombDataX[,feat_mean_std[,1]]

#3 descriptive activity names to name the activities in the data set
testdataY <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
traindataY <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))

CombDataY <- rbind(testdataY, traindataY)

actvty_join = arrange(join(CombDataY, actvty_type), activity)
mean_std_data_actvty <- cbind(mean_std_data, actvty_join)

mean_std_data_actvty_final <- select(mean_std_data_actvty, -(activity))


#4 Add descriptive Variable names - these were merged in Step #2



#5 independent tidy data set with the average of each variable
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))

Sub <- rbind(testSub,trainSub)

avg_df <- aggregate(CombDataX, by = list(activity = CombDataY[,1], subject = Sub[,1]), mean)

write.csv(avg_df, file='./UCI HAR Dataset/tidydataresult.txt', row.names=FALSE)
