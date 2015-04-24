#run analysis
#setwd("~/GitHub/Get-Data-Assignment") setting directory in which there is unzipped UCI HAR Dataset

#Step 1
#we know that in file "features.txt" there are listed variables names, we'll use them to name
#columns in test and training results tables

col.names <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/features.txt", nrows=561)

test <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/test/X_test.txt", col.names=col.names[,2])
test_activities <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/test/y_test.txt", col.names="Activity")
test_subject <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
test <- cbind(test_activities, test_subject, test)

train <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/train/X_train.txt", col.names=col.names[,2])
train_activities <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/train/y_train.txt", col.names="Activity")
train_subject <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
train <- cbind(train_activities, train_subject, train)

#files are constructed in the same way, we can just merge them by rbind

mergedData <- rbind(test,train)


#Step 2
#creating logical vector stating which columns to select in step 2. 

choose_mean <- grepl("mean..", col.names[,2])
choose_Freq <- grepl("meanFreq", col.names[,2])
choose_std <- grepl("std..", col.names[,2])
choose <- c(TRUE, TRUE, ((choose_mean & !choose_Freq) | choose_std))

extractedStats <- mergedData[choose]

#Step 3
#load descriptive activity names

descriptiveActivityNames <- read.table("~/GitHub/Get-Data-Assignment/UCI HAR Dataset/activity_labels.txt")
names(descriptiveActivityNames) <- c("Activity", "Activity Label")

#name the activities in the data set by using mutate and reference to "descriptiveActivityNames"
library("dplyr")
extractedStats <- mutate(extractedStats, Activity=descriptiveActivityNames[Activity, 2])

#Step 4
#tidious work with giving variables descriptive names

var.names <- names(extractedStats)
var.names <- c("Activity", "Subject", sub("t", "Time.", var.names[3:length(var.names)]))
var.names <- sub("f", "Frequency.", var.names)
var.names <- gsub("Acc", ".Accelerometer.", var.names)
var.names <- gsub("Gyro", ".Gyroscope.", var.names)
var.names <- gsub("Jerk", "Jerk.Signals.", var.names)
var.names <- gsub("Mag", "Magnitude.", var.names)
var.names <- gsub("std", "Standard.Deviation.", var.names)
var.names <- gsub("sTime.d", "Standard.Deviation.", var.names)
var.names <- gsub("mean..", "Mean.", var.names)
names(extractedStats) <- var.names

#View(var.names)

#Step 5
MeansOfStats <- extractedStats %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))








