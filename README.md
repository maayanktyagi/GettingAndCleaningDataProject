# Getting and Cleaning Data Project
  This repository contains the final course project for the course Getting and Cleaning Data.
  
  The dataset used for this project is available at this [weblink](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
  The original full description of the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
  
  
  The project directory contains the following files-
    
#### CodeBook.md
   describes the variables along with their descriptions, the data, and any transformations performed to clean up the data.
#### run_analysis.R - 

The r script run_analysis.R completes the following tasks.

1. Download the dataset if it is not already available in the current working directory.
2. Load the activity and 
3. Uses descriptive activity names to name the activities in the data set
4. Merges the training and the test sets to create one data set.
5. Extracts only the measurements on the mean and standard deviation for each measurement. 
6. Uses descriptive activity names to name the activities in the data set
7. Appropriately labels the data set with descriptive variable names. 
8. Creates a tidy dataset which contains average of each variable for each activity and each subject.       


#### tidy_dataset.txt
   contains the resulting output dataset created in 8th step.




To use the run_analysis script - 

1. Download the dataset from this [weblink](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). .
2. Unzip the dataset files.
3. Put the run_analysis.R script in the base directory of the dataset.
4. Execute the run_analysis.R script.

