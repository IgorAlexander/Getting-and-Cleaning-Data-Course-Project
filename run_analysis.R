# This script assumes that you have already downloaded the data and extracted it
# Read both train and test data into dataframes

x_train <- read.table("UCI HAR Dataset/train/X_train.txt" , header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt" , header = FALSE)
x_test  <- read.table("UCI HAR Dataset/test/X_test.txt"   , header = FALSE)
y_test  <- read.table("UCI HAR Dataset/test/y_test.txt"   , header = FALSE)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt" , header = FALSE)
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt"   , header = FALSE)

# 1. Merges the training and the test sets to create one data set
# 4. Appropriately labels the data set with descriptive variable names.

# Merge train and test's dataframes for X, Y and subject

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Define column names of the dataframes

features_data    <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
x.column_names   <- as.character(features_data[,2])
y.column_names   <- c("Activity")
sub.column_names <- c("Subject")

names(x)         <- x.column_names
names(y)         <- y.column_names
names(subject)   <- sub.column_names

# Finally, merge X, Y and Subject dataframes in a single data frame

df.merged <- cbind(x, y, subject)

# Free up the memory

rm(
	x,
	x_train,
	x_test,
	y,
	y_train,
	y_test,
	subject,
	subject_train,
	subject_test
	)

# 3. Uses descriptive activity names to name the activities in the data set

# Read activity labels

activity.data         <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activity.column_names <- c("Activity_ID","Activity_Label")
names(activity.data)  <- activity.column_names

# Replace "Activity" column of the dataframe with activity names instead of ids.

df.tidy <- merge(df.merged, activity.data, by.x = "Activity", by.y = "Activity_ID")

drops   <- c("Activity")
df.tidy <- df.tidy[ , !(names(df.tidy) %in% drops)]

# Free up the memory

rm(
	df.merged,
	activity.data
	)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Obtain column names tha refers only mean and std

mean_std.names <- names(df.tidy[ , grep("mean|std", names(df.tidy))])

# Extract data measurement on the mean and standard deviation for each measurement. 

mean_std.data <- df.tidy[ , mean_std.names]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of
#  each variable for each activity and each subject.

df.tidy_avg <- aggregate(mean_std.data, by = list(df.tidy$Activity_Label,df.tidy$Subject), mean)

names(df.tidy_avg) <- c("Activity_Label","Subject", names(mean_std.data))

# Exporting data

write.table(df.tidy_avg, file = "UCIHARDataset_tidy.txt", sep = ",", row.names = FALSE)
