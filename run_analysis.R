run_analysis<-function(){

    ### OBTAINING THE DATA FROM THE SOURCE
    
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipname <- "./data/getdata-projectfiles-UCI HAR Dataset.zip"
    
    # Creating the data folder
    if (!file.exists("data")) {
      dir.create("data")
    }
    
    # Unzipping the file
    if (!file.exists(zipname)){
      download.file(fileurl, destfile=zipname, mode="wb")
      unzip(zipname, exdir="./data")
    }
    
    
    ### MERGING THE TRAINING AND TEST SETS TO CREATE ONE DATASET
    
    ### Reading in the features from the features.txt
    
    features<-read.table("./data/UCI HAR Dataset/features.txt",stringsAsFactors=F)
    
    
    ### Reading in the activity labels from the activity_labels.txt
    activity_label<-read.table("./data/UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)
    
    
    ### Reading in the subjects from the testing and training sets
    testing_subjects<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    training_subjects<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    
    ## Adding the subjects from the testing set to the new dataset
    tidy_dataset<-testing_subjects
    ## Adding the subjects from the training set to the new dataset
    tidy_dataset<-rbind(tidy_dataset,training_subjects)
    
    ### Replacing the column name to Subjects
    colnames(tidy_dataset)[1]<-"Subjects"  
    
    
    ### Reading the activities of the subjects from both the testing and training sets
    test_activity<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
    train_activity<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
    
    subject_activity<-test_activity ### Adding the testing activity 
    subject_activity<-rbind(subject_activity,train_activity) ### Appending the training activity
    
    ### Replacing the activities by their name from the activity_label dataframe
    for(i in 1:nrow(tidy_dataset)){
      index<-which(activity_label[,1] == subject_activity[i,1])
      tidy_dataset$Activity[i]<-activity_label[index,2]
    }
    
    ### Reading the 561 feature readings for each subject from both the testing and training sets
    test_feature_readings<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
    train_feature_readings<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
    
    feature_readings<-test_feature_readings ### Adding the feature readings of testing
    feature_readings<-rbind(feature_readings,train_feature_readings) ### Appending the feature readings of training
    
    
    ### Replacing the names of 561 columns with feature readings in the tidy_dataset 
    ### with their feature names from the features dataframe  
    
    for(i in 1:ncol(feature_readings))
    {
      tidy_dataset<-cbind(tidy_dataset,feature_readings[,i])
      names(tidy_dataset)[ncol(tidy_dataset)]<-features[i,2]
    }
    
        
    ### EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION
    
    ## Extracting the columns representing the measurements on the mean and standard deviation
    extract<-grep("(.*)(mean|std)[Freq]?(.*)[/(/)]$|(.*)(mean|std)(.*)()-[X|Y|Z]$",colnames(tidy_dataset),value=T)
    
    ## Sorting the tidy_dataset with the extracted columns
    tidy_dataset<-tidy_dataset[,c("Subjects","Activity",extract)]
    
    
    ### REPLACING THE ACTIVITY LABELS WITH DESCRIPTIVE NAMES
    
    tidy_dataset$Activity<-gsub("WALKING_UPSTAIRS","Walking Up",tidy_dataset$Activity)
    tidy_dataset$Activity<-gsub("WALKING_DOWNSTAIRS","Walking Down",tidy_dataset$Activity)
    tidy_dataset$Activity<-gsub("WALKING","Walking",tidy_dataset$Activity)
    tidy_dataset$Activity<-gsub("SITTING","Sitting",tidy_dataset$Activity)
    tidy_dataset$Activity<-gsub("STANDING","Standing",tidy_dataset$Activity)
    tidy_dataset$Activity<-gsub("LAYING","Laying",tidy_dataset$Activity)
    
    
    ### REPLACING THE COLUMN NAMES WITH DESCRIPTIVE NAMES
    
    ## Striping the parenthesis from the column names
    colnames(tidy_dataset)<-gsub("[/(/)]","",colnames(tidy_dataset))
    
    ## Striping the hyphens from the column names and replacing it with underscores
    colnames(tidy_dataset)<-gsub("-","_",colnames(tidy_dataset))
    
    
    ### AVERAGING THE VARIABLES ACROSS EACH ACTIVITY AND SUBJECT
    
    ## Checking whether data.table package is installed and accordingly the package is loaded 
    
    if(!("data.table" %in% rownames(installed.packages()))){
      
      install.packages("data.table")
      library(data.table)
      
    }else{
      
      library(data.table)
    }
    
    ## Converting the data frame to data table
    tidy_dataset = data.table(tidy_dataset)
    
    ## Grouping the data through the Subjects and the Activity performed by each of the subject and thereafter 
    ## summarizing the data by taking mean of all the remaining columns 
    
    tidy_dataset<-tidy_dataset[,lapply(.SD,mean),by='Subjects,Activity']
    tidy_dataset<-tidy_dataset[order(tidy_dataset$Subjects),]
        
    write.csv(tidy_dataset,"Tidy_Data.csv",row.names=F)
    
    cat("\n### Please find the tidy data in the Tidy_Data.csv file saved in your working directory ###")
    
}