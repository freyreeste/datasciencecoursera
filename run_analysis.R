rm(list=ls())

filename <- "data.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# read test data
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject" )
y_test<- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Class")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

# read train data
subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject" )
y_train<- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Class")
X_train<- read.table("UCI HAR Dataset/train/X_train.txt")

# read variable names -- keep only strings (2nd column)
features <- read.table ( "UCI HAR Dataset/features.txt" , col.names = c ( "Column", "Description"), stringsAsFactors=FALSE )[,2]

# clean variable names
features <- gsub ( "\\()", "", gsub( "^t", "Time-", gsub ( "^f", "Frequency-", gsub ( "\\(t", "(Time-", gsub("\\),", ",", gsub("(?<=\\d),(?=\\d)", ":",features, perl = TRUE) ) ) ) ) )

# place variable names to data sets
colnames(X_test) <- features
colnames(X_train) <- features

# merge data and activity class labels
test <- cbind (subject_test, y_test, X_test)
train <- cbind (subject_train, y_train, X_train)

# bind train and test data 
data <- rbind (train, test)

# activities class numbers and labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c ("Class", "Label") )
data$Activity <- labels$Label[match(data$Class,labels$Class)]
data <- data[c(1:2,564,3:563)] # arrange columns to have Activity visible 

# extract columns which contain mean and std values -- ignore letter case
measures_mean<- grep ( "mean", colnames(data), ignore.case = TRUE )
measures_std<- grep ( "std", colnames(data), ignore.case = TRUE)
data_means_std <- data[ c ( 1:3, measures_mean, measures_std ) ]

# reshape2
library (reshape2)

# melt data set
data_melt <- melt(data_means_std, id = c ("Subject", "Class", "Activity") , measure.vars = c(4:89), variable.name = "Features", value.name = "Signals" )

# dcast by Subject & Activity, drop "Class", derive mean for Signals & adjust variable names appropriately
data_tidy <- dcast (data_melt, Subject + Activity ~ Features, mean, value.var = "Signals")
features_tidy <- c ("Subject", "Activity", paste ( "Mean of", colnames(data_tidy[,3:88]) ) )
colnames(data_tidy) <- features_tidy

write.table(data_tidy, "data_tidy", row.name=FALSE)
write.csv(data_tidy, "data_tidy.csv")
