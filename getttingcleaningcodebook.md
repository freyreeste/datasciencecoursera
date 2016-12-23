---
title: "GettingCleaningProjectCodeBook.md"
author: "Esteban Freyre"
date: "22 de diciembre de 2016"
output: 
  html_document: 
    keep_md: yes
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

##The code book

For almost any data set, the measurements you calculate will need to be described in more detail than you can or should sneak into the spreadsheet. The code book contains this information. At minimum it should contain:

##Data Fields:

##Identifiers

subject - The ID of the test subject
activity - The type of activity performed when the corresponding measurements were taken

##Measurements
*
        +tBodyAccMeanX
        +tBodyAccMeanY
        +tBodyAccMeanZ
        +tBodyAccStdX
        +tBodyAccStdY
        +tBodyAccStdZ
        +tGravityAccMeanX
        +tGravityAccMeanY
        +tGravityAccMeanZ
        +tGravityAccStdX
        +tGravityAccStdY
        +tGravityAccStdZ
        +tBodyAccJerkMeanX
        +tBodyAccJerkMeanY
        +tBodyAccJerkMeanZ
        +tBodyAccJerkStdX
        +tBodyAccJerkStdY
        +tBodyAccJerkStdZ
        +tBodyGyroMeanX
        +tBodyGyroMeanY
        +tBodyGyroMeanZ
        +tBodyGyroStdX
        +tBodyGyroStdY
        +tBodyGyroStdZ
        +tBodyGyroJerkMeanX
        +tBodyGyroJerkMeanY
        +tBodyGyroJerkMeanZ
        +tBodyGyroJerkStdX
        +tBodyGyroJerkStdY
        +tBodyGyroJerkStdZ
        +tBodyAccMagMean
        +tBodyAccMagStd
        +tGravityAccMagMean
        +tGravityAccMagStd
        +tBodyAccJerkMagMean
        +tBodyAccJerkMagStd
        +tBodyGyroMagMean
        +tBodyGyroMagStd
        +tBodyGyroJerkMagMean
        +tBodyGyroJerkMagStd
        +fBodyAccMeanX
        +fBodyAccMeanY
        +fBodyAccMeanZ
        +fBodyAccStdX
        +fBodyAccStdY
        +fBodyAccStdZ
        +fBodyAccMeanFreqX
        +fBodyAccMeanFreqY
        +fBodyAccMeanFreqZ
        +fBodyAccJerkMeanX
        +fBodyAccJerkMeanY
        +fBodyAccJerkMeanZ
        +fBodyAccJerkStdX
        +fBodyAccJerkStdY
        +fBodyAccJerkStdZ
        +fBodyAccJerkMeanFreqX
        +fBodyAccJerkMeanFreqY
        +fBodyAccJerkMeanFreqZ
        +fBodyGyroMeanX
        +fBodyGyroMeanY
        +fBodyGyroMeanZ
        +fBodyGyroStdX
        +fBodyGyroStdY
        +fBodyGyroStdZ
        +fBodyGyroMeanFreqX
        +fBodyGyroMeanFreqY
        +fBodyGyroMeanFreqZ
        +fBodyAccMagMean
        +fBodyAccMagStd
        +fBodyAccMagMeanFreq
        +fBodyBodyAccJerkMagMean
        +fBodyBodyAccJerkMagStd
        +fBodyBodyAccJerkMagMeanFreq
        +fBodyBodyGyroMagMean
        +fBodyBodyGyroMagStd
        +fBodyBodyGyroMagMeanFreq
        +fBodyBodyGyroJerkMagMean
        +fBodyBodyGyroJerkMagStd
        +fBodyBodyGyroJerkMagMeanFreq

##Activity Labels
*
        +WALKING (value 1): subject was walking during the test
        +WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
        +WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
        +SITTING (value 4): subject was sitting during the test
        +STANDING (value 5): subject was standing during the test
        +LAYING (value 6): subject was laying down during the test

##Information about the summary choices made

##Information about the experimental study design used
description of how collected the data

1. Merging the training and the test sets to create one data set.
  Reading files
        +Reading trainings tables
        +Reading testing tables
        +Reading feature vector
        +Reading activity labels
        +Assigning column names
        +Merging all data in one set
2. Extracting only the measurements on the mean and standard deviation for each measurement
        +Reading column names
        +Create vector for defining ID, mean and standard deviation ignoring letter case
        +Making nessesary subset from the merged data
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
        +Making second tidy data set
        +Writing second tidy data set in txt file

any other information about how you did the data collection/study design. For example, are these the first 20 patients that walked into the clinic? Are they 20 highly selected patients by some characteristic like age? Are they randomized to treatments?
