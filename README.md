# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate R capabilities to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzip the file in current working directory of R or RStudio.

In this project, you can find the file "run_analysis.R" that does the following:
- 1 Merges the training and the test sets to create one data set.
- 2 Extracts only the measurements on the mean and standard deviation for each measurement.
- 3 Uses descriptive activity names to name the activities in the data set.
- 4 Appropriately labels the data set with descriptive variable names.
- 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Afte execution, the program will output the results in a file named "UCIHARDataset_tidy.txt"
