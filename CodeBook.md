---
title: "Tidying data - Human Activity Recognition Using Smartphones"
output: html_document
---

## 1. Study design
#### This part will describe how the data was collected. 

The data comes from the following authors:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The data was collected via an experiment performed on 30 subjects from which they collected sensoral data via smartphones during 6 different activities. We received the following link to a zip file with all the necessary data in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file contains a README file with all information about what can be found in the other files in the zip file. 

However, as part of the Getting and Cleaning Data course of Coursera the data needed to be used to create a tidy data set which combines the test and training data from the experiment. We did this by performing 5 consecutive steps:
1. Merge the training and test sets
2. Retain only those measurements that contain a mean or standard deviation of a measurement
3. Get the appropriate labels for the activity variable
4. Make the variables as descriptive as possible
5. Make the tidy data set containing the Subject, the Activity and the average of each measurement for the combination subject/activity

The next part will describe all the variables in the resulting tidy data set.


## 2. Code book
#### Overview of the different variables in the resulting tidy data set.

The file contains 81 variables and 180 observations. The 81 variables are :

* subject -- The number that can be linked to the volunteer. 
     This is a categorical variable. Values can be from 1 to 30 as there were 30 volunteers.
* activity -- The activities that were performed by the volunteers.
     This is a categorical variable with 6 activities:
     - WALKING
     - WALKING_UPSTAIRS
     - WALKING_DOWNSTAIRS
     - SITTING
     - STANDING
     - LAYING
* tbodyaccmeanx -- the average of the average time domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* tbodyaccmeany -- the average of the average time domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* tbodyaccmeanz -- the average of the average time domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* tbodyaccstdx -- the average of the standard deviation of the time domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* tbodyaccstdy -- the average of the standard deviation of the time domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccstdz -- the average of the standard deviation of the time domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccmeanx -- the average of the average of the time domain signal of the gravity acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccmeany -- the average of the average of the time domain signal of the gravity acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccmeanz -- the average of the average of the time domain signal of the gravity acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccstdx -- the average of the standard deviation of the time domain signal of the gravity acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* tgravityaccstdy -- the average of the standard deviation of the time domain signal of the gravity acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccstdz -- the average of the standard deviation of the time domain signal of the gravity acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkmeanx -- the average of the average Jerk time signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkmeany -- the average of the average Jerk time signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkmeanz -- the average of the average Jerk time signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkstdx -- the average of the standard deviation of the Jerk time signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkstdy -- the average of the standard deviation of the Jerk time signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkstdz --the average of the standard deviation of the Jerk time signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyromeanx -- the average of the average time signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyromeany -- the average of the average time signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyromeanz -- the average of the average time signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrostdx -- the average of the standard deviation of the  time signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrostdy -- the average of the standard deviation of the  time signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrostdz -- the average of the standard deviation of the  time signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkmeanx -- the average of the average Jerk time signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkmeany -- the average of the average Jerk time signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkmeanz -- the average of the average Jerk time signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkstdx -- the average of the standard deviation of the Jerk time signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkstdy -- the average of the standard deviation of the Jerk time signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkstdz -- the average of the standard deviation of the Jerk time signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccmagmean -- the average of the average magnitude of the time signal of the body acceleration from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccmagstd -- the average of the standard deviation of the magnitude of the time signal of the body acceleration from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccmagmean -- the average of the average magnitude of the time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tgravityaccmagstd -- the average of the standard deviation of the magnitude of the time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkmagmean -- the average of the average magnitude of the Jerk time signal of the body acceleration from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodyaccjerkmagstd -- the average of the standard deviation of the magnitude of the Jerk time signal of the body acceleration from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyromagmean -- the average of the average magnitude of the time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyromagstd -- the average of the standard deviation of the magnitude of the time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkmagmean -- the average of the average magnitude of the Jerk time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* tbodygyrojerkmagstd -- the average of the standard deviation of the magnitude of the Jerk time signal of the body gyroscope from the three-dimensional directions. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmeanx -- the average of the average frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodyaccmeany -- the average of the average frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmeanz -- the average of the average frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccstdx -- the average of the standard deviation of the frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccstdy -- the average of the standard deviation of the frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccstdz -- the average of the standard deviation of the frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmeanfreqx -- the average of the mean frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodyaccmeanfreqy -- the average of the mean frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmeanfreqz -- the average of the mean frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeanx -- the average of the average Jerk frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeany -- the average of the average Jerk frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeanz -- the average of the average Jerk frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkstdx -- the average of the standard deviation of the Jerk frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkstdy -- the average of the standard deviation of the Jerk frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkstdz -- the average of the standard deviation of the Jerk frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeanfreqx -- the average of the mean frequency of the Jerk frequency domain signal of the body acceleration from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeanfreqy -- the average of the mean frequency of the Jerk frequency domain signal of the body acceleration from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccjerkmeanfreqz -- the average of the mean frequency of the Jerk frequency domain signal of the body acceleration from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodygyromeanx -- the average of the average frequency domain signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyromeany -- the average of the average frequency domain signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyromeanz -- the average of the average frequency domain signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyrostdx -- the average of the standard deviation of the frequency domain signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyrostdy -- the average of the standard deviation of the frequency domain signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyrostdz -- the average of the standard deviation of the frequency domain signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyromeanfreqx -- the average of the mean frequency of the frequency domain signal of the body gyroscope from the x direction. This is a continous variable in the range between -1 and +1 as this variable was normalized. 
* fbodygyromeanfreqy -- the average of the mean frequency of the frequency domain signal of the body gyroscope from the y direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodygyromeanfreqz -- the average of the mean frequency of the frequency domain signal of the body gyroscope from the z direction. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmagmean -- the average of the average magnitude of the frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmagstd -- the average of the standard deviation of the magnitude of the frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodyaccmagmeanfreq -- the average of the mean frequency of the magnitude of the frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodyaccjerkmagmean -- the average of the average magnitude of the Jerk frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodyaccjerkmagstd -- the average of the standard deviation of the magnitude of the Jerk frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodyaccjerkmagmeanfreq -- the average of the mean frequency of the magnitude of the Jerk frequency domain signal of the body acceleration from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyromagmean -- the average of the average magnitude of the frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyromagstd -- the average of the standard deviation of the magnitude of the frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyromagmeanfreq -- the average of the mean frequency of the magnitude of the frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyrojerkmagmean -- the average of the average magnitude of the Jerk frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyrojerkmagstd -- the average of the standard deviation of the magnitude of the Jerk frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
* fbodybodygyrojerkmagmeanfreq -- the average of the mean frequency of the magnitude of the Jerk frequency domain signal of the body gyroscope from all angles. This is a continous variable in the range between -1 and +1 as this variable was normalized.
