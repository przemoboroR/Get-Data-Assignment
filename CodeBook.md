# Get-Data-Assignment

Codebook for Course Project in Getting and Cleaning Data Course

Data, which I was working on is well described in ~\Get-Data-Assignment\UCI HAR Dataset\README.txt and ~\Get-Data-Assignment\UCI HAR Dataset\features_info.txt 

I uploaded to R text files with data about measurements, subject and activites in both training and test sessions and combined them altogether into "mergedData" data frame.
Then I extracted only columns with the measurements on the mean and standard deviation for each measurement into "extractedStats" data frame.
After renaming variables I created table "MeansOfStats" - independent tidy data set with the average of each variable for each activity and each subject.
Below description of all used variables in R.

"choose"							- final logical vector stating which columns (with mean and std only) to choose
"choose_Freq"						- logical vector stating which columns not to choose because they contain weighted average of frequencies
"choose_mean"						- logical vector stating which columns to choose because they contain mean of measurements
"choose_std"						- logical vector stating which columns to choose because they contain standard deviation of measurements
"col.names"							- features.txt loaded into R
"descriptiveActivityNames"			- activity_labels.txt loaded into R
"extractedStats"					- as mentioned above extracted columns with the measurements on the mean and standard deviation for each measurement
"MeansOfStats"						- final data set
"mergedData"						- data set created for Step 1 of the Project
"test"								- X_test.txt loaded into R
"test_activities"					- y_test.txt loaded into R
"test_subject"						- test_subject.txt loaded into R
"train"								- X_train.txt loaded into R
"train_activities"					- y_train.txt loaded into R
"train_subject"						- train_subject.txt loaded into R
"var.names"							- character vector used to give descriptive names to the columns of resulting data set

