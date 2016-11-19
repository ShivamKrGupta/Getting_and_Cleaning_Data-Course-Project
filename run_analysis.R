library(dplyr)
library(tidyr)

# Download and unzip the file 
RawDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){dir.create("./data")}
download.file(RawDataURL, destfile = "./data/RawData.zip")
unzip("./data/RawData.zip", exdir = "./data")

# Read the required data into R
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
features <- read.table("./data/UCI HAR Dataset/features.txt", quote="\"", comment.char="")

# Make the activity labels more descriptive by putting names in place of numbers (for train set)
index <- activity_labels$V1
labels <- as.character(activity_labels$V2)

for(i in seq_along(y_train$V1)){
  for(j in seq_along(activity_labels$V1)){
    if(y_train$V1[i] == index[j]){
      y_train$V1[i] = labels[j]
    }
  }
}


# Prepend Subject ID to the names of activity labels (for train set)
subject_train_ch <- as.character(subject_train$V1)
Activity_Name <- paste(subject_train_ch, y_train$V1, sep = "-")

# Name each column
names(X_train) <- features$V2

# bind the Activity_Name at the beginning of the dataset
X_train2 <- cbind(Activity_Name, X_train)


#Repeat the above for test dataset
#Make the activity labels more descriptive by putting names in place of numbers (for test set)
for(i in seq_along(y_test$V1)){
  for(j in seq_along(activity_labels$V1)){
    if(y_test$V1[i] == index[j]){
      y_test$V1[i] = labels[j]
    }
  }
}


# Append SubjectID to the names of activity labels (for test set)
subject_test_ch <- as.character(subject_test$V1)
Activity_Name <- paste(subject_test_ch, y_test$V1, sep = "-")

#Name each column
names(X_test) <- features$V2

# bind the Activity_Name at the beginning of the dataset
X_test2 <- cbind(Activity_Name, X_test)


# Now merge the two data sets together
merged_ds <- rbind(X_train2, X_test2)


# Find the columns with standard deviation and mean along with Activity_Name
subset_logical <- c(grepl("Activity_Name", names(merged_ds))|grepl("mean..", names(merged_ds))|grepl("std..", names(merged_ds)))

# Obtain subset of the data (columns comprising mean and std deviation)
merged_subset <- merged_ds[, subset_logical]

# Obtain average for each variable (column) grouped by Activity_Name
df_withmean <- group_by(merged_subset, Activity_Name) %>% summarise_each(funs(mean))

# Split the Activity_Name column to ensure each column comprise of one variable (tidy data)
df_tidy <- separate(df_withmean, Activity_Name, into = c("SubjectID", "ActivityName"), sep = "-") 

# For greater readability, order the data first by Subject Number and then by Activity Name
df_tidy$SubjectID <- as.numeric(df_tidy$SubjectID)
df_tidy_arranged <- arrange(df_tidy, SubjectID, ActivityName)

# Write the data into a separate file.
write.table(df_tidy_arranged, "TidyDataSet.txt", row.name = FALSE)
