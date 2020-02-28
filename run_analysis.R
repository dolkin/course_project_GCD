library(tidyverse)
setwd("C:/R/Getting and Cleaning Data/week4/Course Project")

## loads feature data sets and put them into each variables
features <- read.table("./data/features.txt")
activity_labels <- read.table("./data/activity_labels.txt")

## loads test data sets, put them into each variables and gives descriptive variable names
subject_test <- read.table("./data/test/subject_test.txt")
y_test <- read.table("./data/test/y_test.txt")
x_test <- read.table("./data/test/X_test.txt")
colnames(x_test) <- features$V2
colnames(subject_test) <- "subject_sn"
colnames(y_test) <- "activity_type"

## binds test data sets into one data set and gives descriptive variable names
test_df <- cbind(subject_test, y_test, x_test)  #binds the data sets into one data set
for(i in 1:6) {
  label <- as.character(activity_labels$V2)  #makes a vector with activity lables
  test_df[which(test_df$activity_type == i), 2] <- label[i]  #gives the values of activity type lables
}

## loads train data sets, put them into each variables and gives descriptive variable names
subject_train <- read.table("./data/train/subject_train.txt")
y_train <- read.table("./data/train/y_train.txt")
x_train <- read.table("./data/train/X_train.txt")
colnames(x_train) <- features$V2
colnames(subject_train) <- "subject_sn"
colnames(y_train) <- "activity_type"

## binds train data sets into one data set and gives descriptive variable names
train_df <- cbind(subject_train, y_train, x_train)  #binds the data sets into one data set
for(i in 1:6) {
  label <- as.character(activity_labels$V2)  #makes a vector with activity lables
  train_df[which(train_df$activity_type == i), 2] <- label[i]  #gives the values of activity type lables
}

## binds test data set and train data set 
df <- rbind(test_df, train_df)

## finds the mean and std variable and extracts
col_list <- data.frame(col = names(df)) %>%  #makes a dataframe with a variable of names of the whole data set
  mutate(no = 1:nrow(col_list),  #gives the order number as a variable
         is_mean = str_detect(col, "mean()"),  #finds variables include "mean" text and gives logical values
         is_std = str_detect(col, "std()"))  #finds variables include "std" text and gives logical values
is_mean_no <- col_list[which(col_list$is_mean == TRUE), ][, 2]  #extracts the order number with mean variables
is_std_no <- col_list[which(col_list$is_std == TRUE), ][, 2]  #extracts the order number with std variables
col_no <- c(1, 2, is_mean_no, is_std_no)  #unites the order number of mean and std variables with the subject and the activity variables
df_extract <- df[, col_no]  #extracts the mean and std variable

## creates a tidy data set with the average of each variable for each activity and each subject
df_extract_gather <- df_extract %>% 
  gather(measurement, value, -subject_sn, -activity_type)  #turns into a narrow-typed data set for each measurement
df_tidy <- df_extract_gather %>% 
  group_by(subject_sn, activity_type, measurement) %>%  #makes groups along with subjects, activities and measurements
  summarise(mean = mean(value))  #calculates the average values

## creates a txt file with the tidy data
write.table(df_tidy, "tidy_data.txt", row.name = FALSE)