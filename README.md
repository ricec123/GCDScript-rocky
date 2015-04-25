# GCDScript-rocky
Modifies an existing group of files related to wearable tech readings and tidies them to a desired format

===========================================
Summary - Human Activity Wearing Smartphone
Coursera - Getting and Cleaning Data
Course Project
April 2015
===========================================

To execute this script in R, download the following zipped dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source and explanation of that dataset are accessible at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Unzip the dataset

Set the working directory in R to the directory that contains "UCI HAR Dataset";
for instance, given a structure "/Users/UserName/Documents/GCD/UCI HAR Dataset", set the working directory to "/Users/UserName/Documents/GCD".

Run the script by entering 'run_analysis()' on the R command line. There are 9 steps within the script, each displayed within the execution:
- Loading feature list
- Loading training data (IO-intensive, may take a bit on some machines)
- Loading testing data (IO-intensive, about 40% of the data volume from step 2)
- Merging the two files
- Selecting desired columns
- Assigning activity types
- Assigning subject ID
- Grouping results
- Writing the output file

The output file is named "GCDp1Out.txt" and is located in the working directory.
