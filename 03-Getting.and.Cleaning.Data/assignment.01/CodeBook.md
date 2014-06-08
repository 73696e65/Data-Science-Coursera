# Study Design

We have merged the following files from [the archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

- _train/X_train.txt_: Training set

- _test/X_test.txt"_: Testing set

- _train/y_train.txt_: Training Activity Code

- _test/y_test.txt_: Testing Activity Code

- _train/subject_train.txt_: Identifies the subject who performed the activity (training set)

- _test/subject_test.txt_: Identifies the subject who performed the activity (testing set)

Then we have assigned the **ActivityLabel** according **ActivityCode** for each activity (from file _activity_labels.txt_) and retrieved only the measurements on the mean and standard deviation.

We labeled the data appropriately using _features.txt_ file. 

The last step was to create tidy data set with the average of each variable for each activity and each subject.

# Code Book

Output data has the following `dimnames` (dimension names for data frame):

```
[[1]]
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [4] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
[10] "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
[28] "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[34] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"    
[40] "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
[52] "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[58] "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

[[2]]
  [1] "LAYING.1"              "SITTING.1"             "STANDING.1"            "WALKING.1"            
  [5] "WALKING_DOWNSTAIRS.1"  "WALKING_UPSTAIRS.1"    "LAYING.2"              "SITTING.2"            
  [9] "STANDING.2"            "WALKING.2"             "WALKING_DOWNSTAIRS.2"  "WALKING_UPSTAIRS.2"   
 [13] "LAYING.3"              "SITTING.3"             "STANDING.3"            "WALKING.3"            
 [17] "WALKING_DOWNSTAIRS.3"  "WALKING_UPSTAIRS.3"    "LAYING.4"              "SITTING.4"            
 [21] "STANDING.4"            "WALKING.4"             "WALKING_DOWNSTAIRS.4"  "WALKING_UPSTAIRS.4"   
 [25] "LAYING.5"              "SITTING.5"             "STANDING.5"            "WALKING.5"            
 [29] "WALKING_DOWNSTAIRS.5"  "WALKING_UPSTAIRS.5"    "LAYING.6"              "SITTING.6"            
 [33] "STANDING.6"            "WALKING.6"             "WALKING_DOWNSTAIRS.6"  "WALKING_UPSTAIRS.6"   
 [37] "LAYING.7"              "SITTING.7"             "STANDING.7"            "WALKING.7"            
 [41] "WALKING_DOWNSTAIRS.7"  "WALKING_UPSTAIRS.7"    "LAYING.8"              "SITTING.8"            
 [45] "STANDING.8"            "WALKING.8"             "WALKING_DOWNSTAIRS.8"  "WALKING_UPSTAIRS.8"   
 [49] "LAYING.9"              "SITTING.9"             "STANDING.9"            "WALKING.9"            
 [53] "WALKING_DOWNSTAIRS.9"  "WALKING_UPSTAIRS.9"    "LAYING.10"             "SITTING.10"           
 [57] "STANDING.10"           "WALKING.10"            "WALKING_DOWNSTAIRS.10" "WALKING_UPSTAIRS.10"  
 [61] "LAYING.11"             "SITTING.11"            "STANDING.11"           "WALKING.11"           
 [65] "WALKING_DOWNSTAIRS.11" "WALKING_UPSTAIRS.11"   "LAYING.12"             "SITTING.12"           
 [69] "STANDING.12"           "WALKING.12"            "WALKING_DOWNSTAIRS.12" "WALKING_UPSTAIRS.12"  
 [73] "LAYING.13"             "SITTING.13"            "STANDING.13"           "WALKING.13"           
 [77] "WALKING_DOWNSTAIRS.13" "WALKING_UPSTAIRS.13"   "LAYING.14"             "SITTING.14"           
 [81] "STANDING.14"           "WALKING.14"            "WALKING_DOWNSTAIRS.14" "WALKING_UPSTAIRS.14"  
 [85] "LAYING.15"             "SITTING.15"            "STANDING.15"           "WALKING.15"           
 [89] "WALKING_DOWNSTAIRS.15" "WALKING_UPSTAIRS.15"   "LAYING.16"             "SITTING.16"           
 [93] "STANDING.16"           "WALKING.16"            "WALKING_DOWNSTAIRS.16" "WALKING_UPSTAIRS.16"  
 [97] "LAYING.17"             "SITTING.17"            "STANDING.17"           "WALKING.17"           
[101] "WALKING_DOWNSTAIRS.17" "WALKING_UPSTAIRS.17"   "LAYING.18"             "SITTING.18"           
[105] "STANDING.18"           "WALKING.18"            "WALKING_DOWNSTAIRS.18" "WALKING_UPSTAIRS.18"  
[109] "LAYING.19"             "SITTING.19"            "STANDING.19"           "WALKING.19"           
[113] "WALKING_DOWNSTAIRS.19" "WALKING_UPSTAIRS.19"   "LAYING.20"             "SITTING.20"           
[117] "STANDING.20"           "WALKING.20"            "WALKING_DOWNSTAIRS.20" "WALKING_UPSTAIRS.20"  
[121] "LAYING.21"             "SITTING.21"            "STANDING.21"           "WALKING.21"           
[125] "WALKING_DOWNSTAIRS.21" "WALKING_UPSTAIRS.21"   "LAYING.22"             "SITTING.22"           
[129] "STANDING.22"           "WALKING.22"            "WALKING_DOWNSTAIRS.22" "WALKING_UPSTAIRS.22"  
[133] "LAYING.23"             "SITTING.23"            "STANDING.23"           "WALKING.23"           
[137] "WALKING_DOWNSTAIRS.23" "WALKING_UPSTAIRS.23"   "LAYING.24"             "SITTING.24"           
[141] "STANDING.24"           "WALKING.24"            "WALKING_DOWNSTAIRS.24" "WALKING_UPSTAIRS.24"  
[145] "LAYING.25"             "SITTING.25"            "STANDING.25"           "WALKING.25"           
[149] "WALKING_DOWNSTAIRS.25" "WALKING_UPSTAIRS.25"   "LAYING.26"             "SITTING.26"           
[153] "STANDING.26"           "WALKING.26"            "WALKING_DOWNSTAIRS.26" "WALKING_UPSTAIRS.26"  
[157] "LAYING.27"             "SITTING.27"            "STANDING.27"           "WALKING.27"           
[161] "WALKING_DOWNSTAIRS.27" "WALKING_UPSTAIRS.27"   "LAYING.28"             "SITTING.28"           
[165] "STANDING.28"           "WALKING.28"            "WALKING_DOWNSTAIRS.28" "WALKING_UPSTAIRS.28"  
[169] "LAYING.29"             "SITTING.29"            "STANDING.29"           "WALKING.29"           
[173] "WALKING_DOWNSTAIRS.29" "WALKING_UPSTAIRS.29"   "LAYING.30"             "SITTING.30"           
[177] "STANDING.30"           "WALKING.30"            "WALKING_DOWNSTAIRS.30" "WALKING_UPSTAIRS.30"  
```

Each column has the format of "ACTIVITY.SUBJECT_ID", rows are denoted by the measurement name. For more information and explanations please check the Dataset archive (README.md).
