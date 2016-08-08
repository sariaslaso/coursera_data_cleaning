library(stringr)
library(dplyr)

#  1. Merge the training and the test sets to create one data set.

# X values of the training and test sets, 561 features vectors
training_set <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
features_set <- read.table("UCI HAR Dataset/features.txt", 
                           stringsAsFactors = FALSE)

# setting the features as the variable names for the training and test sets
colnames(training_set) <- features_set$V2
colnames(test_set) <- features_set$V2

# y values of the training and the test sets, labels that identify the activity
training_labels <- read.table("UCI HAR Dataset/train/y_train.txt", 
                              col.names = c("activity"))
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", 
                          col.names = c("activity"))

# each row in these data sets identifies the subject who performed the activity
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subject"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           col.names = c("subject"))

data_training <- cbind(subject_train, training_labels, training_set)
data_test <- cbind(subject_test, test_labels, test_set)
raw_data <- rbind(data_training, data_test)


tidy_data <- function(data) {
#  2. Extract only the measurements on the mean and standard deviation for each 
#    measurement.

    extracted_measurements <- str_detect(colnames(data), "(mean|std)\\(\\)")
    extracted_measurements[c(1, 2)] <- TRUE
    data <- data[, extracted_measurements]


#  3. Use descriptive activity names to name the activities in the data set
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                                  stringsAsFactors = FALSE, 
                                  col.names = c("activity", "activity_name"))
    data <- merge(data, activity_labels, by = "activity")
    vars <- colnames(data)
    data <- data[, c(vars[2], vars[length(vars)], 
                     vars[c(-1, -2, -length(vars))])]


#  4. Appropriately label the data set with descriptive variable names.
    colnames(data) <- colnames(data) %>%
        str_replace("^t", "time") %>%
        str_replace("^f", "frequency") %>%
        str_replace("Mag", "_magnitude") %>%
        str_replace("Acc", "_acceleration") %>%
        str_replace("Gyro", "_gyroscope") %>%
        str_replace("Body(Body)?", "_body") %>%
        str_replace("Jerk", "_jerk") %>%
        str_replace("Gravity", "_gravity") %>%
        str_replace_all("\\-", "_")
    
    return(data)

}

tidy_data_mean <- function(tidy_data) {
#  5. From the data set in step 4, create a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

    final_data <- tidy_data %>%
        group_by(subject, activity_name) %>%
        summarise_each("mean")
    
    return(final_data)
}


#call to the functions
tidy_data <- tidy_data(raw_data)
tidy_data_set <- tidy_data_mean(tidy_data)

# write the tidy data set in a file
write.table(tidy_data_set, file = "tidy_data.txt", row.names = FALSE)




