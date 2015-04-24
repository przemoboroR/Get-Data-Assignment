# Get-Data-Assignment
Assignment for Course Project in Getting and Cleaning Data Course


1. Sets working directory, where is the unzipped UCI HAR Dataset.

2. Creates data frame "col.names" which contains all features measured in the experiment.

3. Using "col.names" and obvious path to test and training files (both with measurements ("X_") and lists of activities ("y_")), creates "test" and "training" 
   data frames by binding "X_" and "y_" text files by columns.
   
4. Merges "test" and "training" data frames by rows. They have the same number of variables, hence it is possible.

5. Using "grepl()" function creates a logical vector "choose" stating which columns contain mean and standard deviation of measurements.

6. Extracts data described in "Step 2." of the project using "choose" vector and assign it to "extractedStats" data frame.

7. With "descriptiveActivityNames" data frame (loaded from file) and package "dplyr" changes activities IDs to their names.

8. Using "names()", "sub()" and "gsub()" changes variables names, making them more descriptive.

9. Using "dplyr" package, creates the table "MeansOfStats" with the average of each variable for each activity and each subject. Firstly, groups by "Activity"
   and "Subject", then summarizes each column by taking respective mean.