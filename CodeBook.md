## CodeBook

The original data for the analysis was downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This document is intended to inform about the different variables in the output file i.e. Tidy_Data.csv that gets generated after running the script.

The variables prefixed with "t" represent a time domain measurement whereas the ones prefixed with "f" represents the measurements that were Fourier Transformed. Each of the measurement have been divided by its range (gyroscope, entropy, etc) and therefore the unit associated with each of the measurements gets cancelled and the left over numeric value just represents a ratio.

| VARIABLES     | DESCRIPTION           | VALUES     |
| ------------- |:---------------------:| ----------:|
| Subjects      | Stores the subject ids| Range 1-30 |
| Activity      | Stores information on the activity performed by the subject | Walking/Walking Up/Walking Down/Standing/Sitting/Laying|
| tBodyAcc_mean_X |  Mean of the body acceleration from X-Axis| Numeric Value|
| tBodyAcc_mean_Y |  Mean of the body acceleration from Y-Axis| Numeric  Value|
| tBodyAcc_mean_Z |  Mean of the body acceleration from Z-Axis| Numeric Value|
| tBodyAcc_std_X  |  Standard Deviation of the body acceleration from X-Axis| Numeric Value|
| tBodyAcc_std_Y  |  Standard Deviation of the body acceleration from Y-Axis| Numeric Value|
| tBodyAcc_std_Z  |  Standard Deviation of the body acceleration from Z-Axis| Numeric Value| 
| tGravityAcc_mean_X | Mean of the gravity acceleration from X-Axis| Numeric Value|
| tGravityAcc_mean_Y | Mean of the gravity acceleration from Y-Axis| Numeric Value|
| tGravityAcc_mean_Z | Mean of the gravity acceleration from Z-Axis| Numeric Value|
| tGravityAcc_std_X |  Standard Deviation of the gravity acceleration from X-Axis| Numeric Value|
| tGravityAcc_std_Y |  Standard Deviation of the gravity acceleration from X-Axis| Numeric Value|
| tGravityAcc_std_Z |  Standard Deviation of the gravity acceleration from X-Axis| Numeric Value|
| tBodyAccJerk_mean_X | Mean of the Jerk signal for body acceleration from X-Axis| Numeric Value|
| tBodyAccJerk_mean_Y | Mean of the Jerk signal for body acceleration from Y-Axis| Numeric Value|
| tBodyAccJerk_mean_Z | Mean of the Jerk signal for body acceleration from Z-Axis| Numeric Value|
| tBodyAccJerk_std_X | Standard Deviation of the Jerk signal for body acceleration from X-Axis| Numeric Value|
| tBodyAccJerk_std_Y | Standard Deviation of the Jerk signal for body acceleration from Y-Axis| Numeric Value|
| tBodyAccJerk_std_Z | Standard Deviation of the Jerk signal for body acceleration from Z-Axis| Numeric Value|   
| tBodyGyro_mean_X | Mean of the angular velocity from X-Axis| Numeric Value|
| tBodyGyro_mean_Y | Mean of the angular velocity from Y-Axis| Numeric Value|
| tBodyGyro_mean_Z | Mean of the angular velocity from Z-Axis| Numeric Value|
| tBodyGyro_std_X | Standard Deviation of the angular velocity from X-Axis| Numeric Value|
| tBodyGyro_std_Y | Standard Deviation of the angular velocity from X-Axis| Numeric Value|
| tBodyGyro_std_Z | Standard Deviation of the angular velocity from X-Axis| Numeric Value|
| tBodyGyroJerk_mean_X | Mean of the Jerk signal for angular velocity from X-Axis| Numeric Value|
| tBodyGyroJerk_mean_Y | Mean of the Jerk signal for angular velocity from Y-Axis| Numeric Value|
| tBodyGyroJerk_mean_Z | Mean of the Jerk signal for angular velocity from Z-Axis| Numeric Value|
| tBodyGyroJerk_std_X |  Standard Deviation of the Jerk signal for angular velocity from X-Axis| Numeric Value|
| tBodyGyroJerk_std_Y |  Standard Deviation of the Jerk signal for angular velocity from X-Axis| Numeric Value|
| tBodyGyroJerk_std_Z |  Standard Deviation of the Jerk signal for angular velocity from X-Axis| Numeric Value|
| tBodyAccMag_mean |  |
| tBodyAccMag_std |  |
| tGravityAccMag_mean |  |
| tGravityAccMag_std |  |
| tBodyAccJerkMag_mean |  |
| tBodyAccJerkMag_std |  |
| tBodyGyroMag_mean |  |
| tBodyGyroMag_std |  |
| tBodyGyroJerkMag_mean |  |
| tBodyGyroJerkMag_std |  |
| fBodyAcc_mean_X |  |
| fBodyAcc_mean_Y |  |
| fBodyAcc_mean_Z |  |
| fBodyAcc_std_X |  |
| fBodyAcc_std_Y |  |
| fBodyAcc_std_Z |  |
| fBodyAcc_meanFreq_X |  |
| fBodyAcc_meanFreq_Y |  |
| fBodyAcc_meanFreq_Z |  |
| fBodyAccJerk_mean_X |  |
| fBodyAccJerk_mean_Y |  |
| fBodyAccJerk_mean_Z |  |
| fBodyAccJerk_std_X |  |
| fBodyAccJerk_std_Y |  |
| fBodyAccJerk_std_Z |  |
| fBodyAccJerk_meanFreq_X |  |
| fBodyAccJerk_meanFreq_Y |  |
| fBodyAccJerk_meanFreq_Z |  |
| fBodyGyro_mean_X |  |
| fBodyGyro_mean_Y |  |
| fBodyGyro_mean_Z |  |
| fBodyGyro_std_X |  |
| fBodyGyro_std_Y |  |
| fBodyGyro_std_Z |  |
| fBodyGyro_meanFreq_X |  |
| fBodyGyro_meanFreq_Y |  |
| fBodyGyro_meanFreq_Z |  |
| fBodyAccMag_mean |  |
| fBodyAccMag_std |  |
| fBodyAccMag_meanFreq |  |
| fBodyBodyAccJerkMag_mean |  |
| fBodyBodyAccJerkMag_std |  |
| fBodyBodyAccJerkMag_meanFreq |  |
| fBodyBodyGyroMag_mean |  |
| fBodyBodyGyroMag_std |  |
| fBodyBodyGyroMag_meanFreq |  |
| fBodyBodyGyroJerkMag_mean |  |
| fBodyBodyGyroJerkMag_std |  |
| fBodyBodyGyroJerkMag_meanFreq |  |






