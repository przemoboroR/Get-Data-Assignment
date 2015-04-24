# Get-Data-Assignment
Assignment for Course Project in Getting and Cleaning Data Course


1. Set working directory, where is the unzipped UCI HAR Dataset.
2. Create data frame "col.names" which contains all features measured in the experiment.
3. Using "col.names" and obvious path to test and training files (both with measurements ("X_") and lists of activities ("y_")), create "test" and "training" 
   data frames by binding "X_" and "y_" text files by columns.
4. Merge "test" and "training" data frames by rows. They have the same number of variables, hence it is possible.
5. Using "grepl()" function create a logical vector "choose" stating which columns contain mean and standard deviation of measurements.
6. Extract data described in "Step 2." of the project using "choose" vector and assign it to "extractedStats" data frame.
