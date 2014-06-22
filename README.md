## READ ME


The Course Project required us to generate a tidy dataset which adheres to the following guidelines:

1. Merge the training and the test sets to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement.

3. Use descriptive activity names to name the activities in the data set.

4. Appropriately label the data set with descriptive variable names.

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  


The submitted R Script "run_analysis.R" includes a function named "run_analysis" which performs all the data processing based on the above guidelines. In order to run the script just type in the following commands onto to your console:
</br>
```{r,message=FALSE}
 source("https://raw.githubusercontent.com/rajithnair/Getting_Cleaning_Data/master/run_analysis.R")
 run_analysis()
```

</br>
In this function each processing step is divided under the below headings.
</br></br>

##### OBTAINING THE DATA FROM THE SOURCE

* The data is obtained from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The code inside this step basically downloads the data into a folder named "data" inside the working directory.

* It is important to note that, the data won't be downloaded if it was previously downloaded and kept in a folder named "data" inside the working directory   
</br></br>

##### MERGING THE TRAINING AND TEST SETS TO CREATE ONE DATASET

* Initially, the features and the activity_labels datasets are loaded as these datasets are common to both testing and the training sets.

* The subjects involved in the test and training are then loaded on to the data frames "testing_subjects" and "training_subjects". The subjects from these data frames are then added to a new data frame called as "tidy_dataset". While adding, the testing subjects are added first and then the training subjects are added later through the function "rbind()". The use of rbind() allows to append the training subjects right after the last row and therefore both the testing and training subjects doesn't get mixed together in the data frame. Now, the tidy_dataset has one column with all the subjects from the test and the training sets and the column is renamed as "Subjects".

*  After adding the subjects, the activity associated with each of the subject is loaded on to the data frames "test_activity" and "train_activity". The activities from these data frames are then added to a new data frame called as "subject_activity" through the rbind() function. Now, the subject_activity data frame holds all the activities represending each subject. The activities are just numbers from (1-6) wherein each number represents an activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The activity of each subject from the subject_activity dataframe is then added to the tidy_dataset dataframe by mapping each activity to their labels from the activity_labels data frame. After this process, the tidy_dataset will have 2 columns i.e. Subjects and Activity. 

* The next step will be the addition of 561 feature readings for each subject in the tidy_dataset data frame. In order to achieve this, the feature readings of the subjects in the test and the training sets are loaded on to the data frames "test_feature_readings" and "train_feature_readings". The readings from these data frames are then added to a new data frame called as "feature_readings" through the rbind() function. Now, the feature_readings data frame holds all the 561 feature readings for each subject. In the feature_readings data frame all the 561 feature readings are organized in 561 columns wherein each column represents a feature and each row represents the reading of an individual subject.

* These 561 columns of the feature_readings data frame are then individually added to the tidy_dataset data frame through cbind() function. While adding, the data in the column is added first and then the column name in the tidy_dataset is replaced by the feature name. This is achieved by matching the column number of the feature_readings data frame to the row number of the features data frame as each column of the feature_readings data frame represent a feature and each row from the features data frame represents a feature. After this process, the tidy_dataset will have 563 columns i.e. Subjects, Activity and the remaining 561 columns named after individual features.

* At this point, the tidy_dataset dataframe will have 10,299 rows and 563 columns with all the test and the training data.
</br></br>

##### EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION

* In this step, the tidy_dataset data frame is sorted by selecting specific columns that represent mean and standard deviation measurements.

* Among 561 feature columns in the tidy_dataset, the columns representing mean and standard deviation measurements are the ones which have one of these patterns at the end of their names i.e. mean()/std()/meanFreq()/stdFreq()/mean()-X/std()-X/mean()-Y/std()-Y/mean()-Z/std()-Z. In order to extract these column names, the grep() function is used with a regular expression representing the above pattern and the grep() returns 79 column names matching to the above pattern.  

* The tidy_dataset is then subsetted with these 79 column names representing mean and standard deviation measurements and the two columns representing subjects and activity. After this process, the tidy_data is left with 81 columns and 10,299 rows.
</br></br>

##### REPLACING THE ACTIVITY LABELS WITH DESCRIPTIVE NAMES

* The Activity column of the tidy_dataset now contains six types of values i.e.(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) representing the six activities.

* These activity labels are then replaced by the more descriptive labels i.e. Walking, Walking Up, Walking Down, Sitting, Standing and Laying. The gsub() function is used to replace these labels.
</br></br>

##### REPLACING THE COLUMN NAMES WITH DESCRIPTIVE NAMES

* In this step, the names of the 79 columns representing mean and standard deviation measurements are tweaked to strip the parenthesis i.e. () and the hyphen i.e. -. The parenthesis is removed but the hyphens are replaced by underscores "_"" for better distinction of column names such as "tBodyAcc-mean()-X".

* Again, the gsub() function is utilized to strip the characters and replace with a new character. After this process, the column names such as "tBodyAcc-mean()-X" is renamed as "tBodyAcc_mean_X".
</br></br>

##### AVERAGING THE VARIABLES ACROSS EACH ACTIVITY AND SUBJECT

* This is the final processing step wherein the 79 columns of the tidy_dataset that represents mean and standard deviation measurements are averaged across each subject and each activity.

* In order to achieve this, the data.table package is used and the tidy_dataset is converted into a data table through the data.table() function.

* After converting the tidy_dataset into a data table, tidy_dataset is subsetted by applying an expression i.e. tidy_dataset[,lapply(.SD,mean),by='Subjects,Activity']. The "by" argument in this expression performs grouping of data with respect to each subject and each activity which results in 180 groups representing 30 subjects and 6 activities for each of the 30 subjects. The remaining part of the expression i.e.lapply(.SD,mean) actually summarizes the data by applying the "mean" function to each of the 180 groups. 

* After this step, the tidy_dataset gets chopped down to 180 rows and 81 columns wherein each row represents an individual group formed by combing the subjects with each activity. Finally, the tidy_dataset data frame is ordered with respect to the subjects (1-30) to get the final version of the tidy_dataset which is then written to the working directory as a csv file named "Tidy_Data.csv".   

* The Tidy_Data.csv file is the one which is submitted for the completion of the course project.









