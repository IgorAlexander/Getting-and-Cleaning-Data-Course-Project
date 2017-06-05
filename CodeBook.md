## Raw dataset description
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Raw dataset source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## In the Raw Dataset, for each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## To clean up de data, the script performs the next steps:
 *Previously, you need to download the raw datasource and extract it*.
* Step 1 - Read and combine input data ("test/X_test.txt"; "train/X_train.txt").
* Step 2 - Read and combine classification data ("train/y_train.txt"; "test/y_test.txt").
* Step 3 - Read and combine subjects ("train/subject_train.txt"; "test/subject_test.txt").
* Step 4 - Define column names of the dataframes.
* Step 5 - Merge X, Y and Subject dataframes in a single data frame.
* Step 6 - Replace "Activity" column of the dataframe with activity names instead of ids.
* Step 7 - Extracts only the measurements on the mean and standard deviation for each measurement.
* Step 8 - Creates an independent tidy data set with the average of each variable for each activity and each subject.
* Step 9 - Writing the result in a file named "UCIHARDataset_tidy.txt"


## Tidy Data after transformation of the raw data
Activity:

	LAYING; SITTING; STANDING; WALKING; WALKING_DOWNSTAIRS; WALKING_UPSTAIRS

Subject:

	1...30

Average of each variable for each activity and each subject:

*The variable will look like: "attr1-function-attr2"*
For example:
    tGravityAcc-std()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyGyroJerk-std()-Z
    tBodyGyroJerkMag-mean()