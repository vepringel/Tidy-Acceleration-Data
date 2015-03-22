## The following code will be used for the Course Project of the Getting and Cleaning Data course
## of Coursera. The data set is the data behind the study about Human Activity Recognition Using Smartphones.
## The code will run on the unzipped data stored in your working directory from the following link: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## The code will do the following:
## Step 1: Merge the training and the test sets to create one data set.
## Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
## Step 3: Use descriptive activity names to name the activities in the data set.
## Step 4: Appropriately labels the data set with descriptive variable names.
## Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


## Step 1: Merge the training and the test sets to create one data set.
## Put the different data sets in R variables
## - Test data
Data_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Data_Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## - Training data
Data_X_training <- read.table("./UCI HAR Dataset/train/X_train.txt")
Data_Y_training <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_training <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Concatenate the X data sets together
AllData_X <- rbind(Data_X_training, Data_X_test)
## Concatenate the Y data sets together
AllData_Y <- rbind(Data_Y_training, Data_Y_test)
## Concatenate the Subject data sets together
AllSubject <- rbind(Subject_training, Subject_test)

## Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
## For this we need to have the names of the measurements in the AllData_X data set.
## These names can be found in the features.txt file in the same folder. 
## Load the features.txt file in a R variable:
Measurements <- read.table("./UCI HAR Dataset/features.txt")
## Change the column names from AllData_X to the measurement names
colnames(AllData_X) <- Measurements[,2]
## Select only those measurements that contain a mean or standard deviation
## For this I will be using the select function from the dplyr package
## If you do not have this package already installed then do the following
install.packages("dplyr")
## Call the dplyr package
library("dplyr")
## Use the select function to get only the relevant measurements
AllMeasurements <- AllData_X[,grep("mean|std",colnames(AllData_X))]

## Step 3: Use descriptive activity names to name the activities in the data set.
## The descriptive activity names can be found in the 'activity_labels' file.
Activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
## I will first already put the subjects, the measurements and the activity numbers in one dataset.
## Before I do this I first need to rename the column of the Subject data set to 'Subject'
## Otherwise I will have two columns with the name 'V1'
colnames(AllSubject) <- c("Subject")
## Put all data together
AllData <- cbind(AllSubject, AllMeasurements, AllData_Y)
## Merge AllData with Activity_labels via the common column 'V1'
AllData2 <- merge(AllData, Activity_labels, by.x="V1", all=FALSE)
## Rename the V2 variable that you have added via the merge
names(AllData2)[names(AllData2) == "V2"] <- "Activity"
## Remove the V1 variable in the data set
AllData3 <- AllData2[,-1]

## Step 4: Appropriately labels the data set with descriptive variable names.
## Put the variable names in a different list
Names_Data3 <- names(AllData3)
## There are a few rules that we need to apply:
##   - All names should be lower case when possible
Names_Data3 <- tolower(Names_Data3)
##   - The names should be descriptive (Diagnosis vs Dx)
## I believe that this would not be very helpful in this case as the names would become too long
## to efficiently work with. In combination with the CodeBook.md file, it would be feasible to 
## understand what each variable means.
##   - They should not be duplicated, this is already done
##   - The names should not have underscores or dots or white spaces
Names_Data3 <- gsub("-", "", Names_Data3)
Names_Data3 <- gsub("\\()","",Names_Data3)
## Replace the column names from AllData3 with the new names
colnames(AllData3) <- Names_Data3

## Step 5: From the data set in step 4, create a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
## We will use the summarise_each function from the dplyr package to do this.
AllData4 <- AllData3 %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean(.,na.rm=TRUE)))

## Create a txt file that contains the data from AllData4 and store this in your working directory
write.table(AllData4, "Averages_Activity_Subject.txt", row.names=FALSE)

