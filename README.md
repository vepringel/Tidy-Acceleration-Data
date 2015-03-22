---
title: "README"
output: html_document
---

# Tidy-Acceleration-Data
This repository contains the script to execute the Course Project for the Getting and Cleaning Data course (Coursera).

The repository contains three different files:

 *  the README markdown document, which describes what steps need to be taken to reproduce the results from the Course Project.
 *  the run_analysis.R code file, which contains the R code that was used to get the tidy data sets for the Course Project.
 *  the CodeBook markdown document, which contains information about the variables that are in the resulting data set. 

================================================================================

The first step to reproduce the Course Project is to download the original data via the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

(Extra information about the data can be found on the website : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

You should unzip this file in the working directory where you will be running the R code.

================================================================================

Now let us get started and open the R script (run_analysis.R) in R or RStudio. I will address some of the base coding steps that are in the R script to show the base steps that were undertaken. The more detailed code with extra information can be found in the R script itself.

The first step is reading in all the data from the test folder and the training folder into R. We do not need the 'Inertial signals' folders for this assignment. An example of reading in the data file can be found underneath. We have used the read.table function for this. Look at ?read.table for more information. 

```{r}
Data_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
```

We were asked to merge all the data from the training set with those of the test set. Actually it will be more a concatenation of the two data sets, so we can use the rbind function. Look at ?rbind for more information. 

```{r}
AllData_X <- rbind(Data_X_training, Data_X_test)
```

We now have a data set with 561 variables and 10299 observations. 


Then we were asked to only consider the measurements that have something to do with the mean or standard deviation of a certain measure. Therefore, we will look at the measurement names and see if we can find 'mean' or 'std' in the variable name. For this part we have been using the dplyr package. You can install and activate the dplyr package via the following code:

```{r}
install.packages(dplyr)
library("dplyr")
```

This package contains certain functions that are addressed by verbs. One of them is the 'select' function. This makes it easy to make a subset of your dataset. 

Finding the measurements with 'mean' or 'std' in the variable name can be done by looking at the regular expressions functions. The 'grep' function searches for patterns in names. We will use this in the following way:

```{r}
AllMeasurements <- AllData_X[,grep("mean|std",colnames(AllData_X))]
```


The third step is to add the activity labels to the activity variable. This variable now consists out of a number between 1 and 6, which can be mapped to the activity labels in the activity_labels.txt file that is in the folder. 

We will merge the merge the labels to our base data set by the number variable:

```{r}
AllData2 <- merge(AllData, Activity_labels, by.x="V1", all=FALSE)
```


The fourth step is to make the variable names more descriptive. Some of the variable names contain odd characters, such as parentheses, which can be removed from the variable name via the gsub function, which replaces all instances of parentheses in the variable name. 

```{r}
Names_Data3 <- gsub("\\()","",Names_Data3)
```

Besides removing odd characters and setting the variable names in lowercase, I did not do any further manipulation on the variable names as I did not believe that it supported a better understanding of the variable itself. For example the variable 'tbodyaccmeanx', which is the mean of the time domain signal of the body acceleration viewed from the x direction. If I would have made this more descriptive we would have a variable name like 'meanoftimesignalbodyaccelerationxangle'. This does not make it easier to work with the variables. Therefore, I choose to leave the variables as they are. The meaning of the variables can be found in the CodeBook.md document.

The final step of the assignment is to make a tidy data set containing the subjects, the activities and the average of all measurements retained in step 2. We have used another dplyr function for this, namely the 'group_by' function to group the data by subject and activity. We then used a summarising function to make the average of all the measurements:

```{r}
AllData4 <- AllData3 %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean(.,na.rm=TRUE)))
```

The '%>%' character is used to combine different functions one after the other, which is called 'Chaining'. It makes coding a bit more efficient and easy to read. 

The output of this code is the requested tidy data set. We can now make a text file from it to have a look at the data set. We will use the write.table function to create the file and store it in your working directory:

```{r}
write.table(AllData4, "Averages_Activity_Subject.txt", row.names=FALSE)
```

You will now find the "Averages_Activity_Subject.txt" file in your working directory. 

==========================================================================================

