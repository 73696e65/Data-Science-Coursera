library(plyr)

## absolute path for filenames, could be different
train_set_file <- "UCI HAR Dataset/train/X_train.txt"
test_set_file  <- "UCI HAR Dataset/test/X_test.txt"

train_set_labels_file <- "UCI HAR Dataset/train/y_train.txt"
test_set_labels_file  <- "UCI HAR Dataset/test/y_test.txt"

train_set_subject_file <- "UCI HAR Dataset/train/subject_train.txt"
test_set_subject_file  <- "UCI HAR Dataset/test/subject_test.txt"

features_file <- "UCI HAR Dataset/features.txt"
activity_labels_file <- "UCI HAR Dataset/activity_labels.txt"

## extract table information
initial <- read.table(train_set_file, nrows = 1)
classes <- sapply(initial, class)

## read train / test data
trainDF <- read.table(train_set_file, header = FALSE, comment.char = "", colClasses = classes)
testDF  <- read.table( test_set_file, header = FALSE, comment.char = "", colClasses = classes)

## read features and assing names to data sets
features <- read.table(features_file)
names(trainDF) <- names(testDF) <- features[,2]

## read subject information
train_set_subject <- read.table(train_set_subject_file, col.names = c("Subject"))
test_set_subject  <- read.table(test_set_subject_file, col.names = c("Subject"))

## read activity codes
train_set_activity_code <- read.table(train_set_labels_file,
        col.names = c("Activity"), colClasses = c("character"))
test_set_activity_code  <- read.table(test_set_labels_file,
        col.names = c("Activity"), colClasses = c("character"))

## read activity label name
activity_label <- read.table(activity_labels_file,
    col.names = c("ActivityCode", "ActivityLabel"), colClasses = c("character", "character"))

## append subject, activity code
trainDF <- cbind(train_set_subject, train_set_activity_code, trainDF)
testDF  <- cbind(test_set_subject,  test_set_activity_code, testDF)

## merge the training and the test sets to create one data set.
merged <- rbind(trainDF, testDF)

## rename the activity codes to the labels
replace_map <- activity_label$ActivityLabel
names(replace_map) <- activity_label$ActivityCode
merged$Activity <- revalue(merged$Activity, replace_map)

## extract only subject, activity and measurements on the mean and standard deviation
indices <- grep('std\\(\\)|mean\\(\\)', names(merged))
mean_std <- merged[, c(1, 2, indices)]

## create tidy data set with the average of each variable for each activity and each subject
split_table <- split(mean_std[3:68], list(mean_std$Activity, mean_std$Subject))
output <- data.frame(sapply(split_table, colMeans))

## save output to the text file
write.csv(output, file = "output.txt")