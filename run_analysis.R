# this script collects, tidies and saves a dataset based on physical
# movement by a group of subjects across various activities. The
# mean and standard deviation columns from a trial and test phases of
# data collection are presented at the end.
library(data.table)
library(tidyr)
library(dplyr)

# change directory to the 'UCR Har Dataset' directory
# e.g. setwd('~/Documents/GitHub/coursera_getclean_wk4/UCI Har Dataset/')

# add features to test data
features <- fread("features.txt", sep = ' ')

# get activity labels and make lower case
activity_labels <- fread("activity_labels.txt", sep = ' ')
activity_labels$V2 <- tolower(activity_labels$V2)

# read in the test data
test_x <- fread("test/X_test.txt", sep = ' ')
test_y <- fread("test/y_test.txt", sep = ' ')
test_subject <- fread("test/subject_test.txt", sep = ' ')

# merge activity and subject
# (3. Use descriptive activity names to name the activities in the data set)
test_x$activity <- activity_labels[test_y$V1,]$V2
test_x$subject <- test_subject

# read in the training data
train_x <- fread("train/X_train.txt", sep = ' ')
train_y <- fread("train/y_train.txt", sep = ' ')
train_subject <- fread("train/subject_train.txt", sep = ' ')

# 3. Use descriptive activity names to name the activities in the data set
train_x$activity <- activity_labels[train_y$V1,]$V2
train_x$subject <- train_subject

# 1. Merges the training and the test sets to create one data set.
full_set <- merge(test_x, train_x, all=T)

# 4. Appropriately labels the data set with descriptive variable names.
names(full_set)[1:561] <- features$V2

# 2. Extracts only the measurements on the mean() and standard deviation std() 
# for each measurement.
cols <- grep('mean\\(\\)|std\\(\\)|^activity|^subject', names(full_set))
main_set <- full_set[, ..cols]
main_set <- main_set %>% select(subject, activity, 1:(length(names(main_set))-2))

# tidy the variable names
names(main_set) <- gsub('^f', 'freq_', 
  gsub('^t', 'time_', 
  gsub('-', '_', gsub('\\)', '', gsub('\\(', '_', 
  gsub('\\(\\)','', gsub(',','_', tolower( names(main_set) ))))))))

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
summary_table <- main_set %>% 
  group_by(subject, activity) %>% 
  summarise(across(everything(), mean), .groups = 'drop')

write.table(summary_table, row.names = F, file="means_by_subject_activity.txt")
