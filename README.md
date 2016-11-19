## About the Project
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data collected for the purpose are usually not in a format suitable for applying algorithms. The objective of this project is to prepare tidy data that can be used for later analysis. The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Following is the link to the data used in the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files in the given Repository
* **TidyDataSet.txt:** This file contains the tidy dataset obtained after the analysis.
* **run_analysis.R:** This is an R script that downloads the dataset and performs the required analysis. End result is the above TidyDataSet.txt file.
* **CodeBook.md:** The CodeBook describes what were the steps involved in the analysis. It also contains information about different variables. 
* **README.md:** This is the file you are reading. It gives a brief introduction about the project and apprises the reader of various files in this repository and also describes the analysis performed on the data.

## Analysis Done
The R script performs following analysis on the Raw Data to yield the Tidy Data:

1. Loads the required packages - tidyr and dplyr
2. Downloads and unzips the files.
3. Reads the required tables into R.
4. Replaces the numbers representing activity labels for each feature vector by the names of the activities. The activity_labels.txt provides the correspondence for replacing the numbers by names. The objective is to make the activity labels descriptive. This operation is performed for each dataset (test and train).
5. Prefixes the SubjectID (obtained from subject_test.txt and subject_train.txt) to activity name for each respective feature vector and prepends it to the respective dataset. This is to make grouping and calculating averages easier.
6. Gives descriptive names to each of the columns (variables). This is done by using variable names given in features.txt. These names are descriptive as they clearly describe the variables. (Refer Description of Variables section below.)
7. Merges the two datasets.
8. Subsets the desired dataset by obtaining a logical vector that stands TRUE for column names with word mean or std in it and for column name equal to Activity_Name.
9. Groups the obtained dataset by Activity_Name.
10. Obtains mean for each column grouped by Activity_Name.
11. Splits the Activity_Name back into SubjectID and ActivityName. This is essential to ensure that each column comprises of one variable only (definition of Tidy Data).
12. Sorts data first by SubjectID and then by ActivityName.
13. Write the dataframe into a separate text file as `TidyDataSet.txt`.

