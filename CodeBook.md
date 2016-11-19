## About the Raw Data
The data is on 'Human Activity Recognition Using Smartphones Data Set'. Raw Data is downloaded from the UCI Machine Learning Repository. As the document reveals, the raw data was obtained from 30 subjects, each performing six activities while wearing a smart phone (Samsung Galaxy S II) on their waist. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The data was divided into two sets: training and test sets. Further computation was done on each of the obtained values thereby generating new feature elements. Thus, for each record, following are provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

A full description is given on the [UCI website.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The downloaded data comprises the following files that are useful for our project:

* 'README.txt': Gives detail about the dataset. 
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': Gives a list of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Note:** Each feature vector is a row in the text file. Moreover, features are normalized and bounded within [-1,1].

## About the Tidy Data
As stated above, the Raw Data has 561 columns in each of the two sets of data - train dataset and test dataset. The desired tidy data (which the given R script obtains) has the following feature:
* The two datasets are merged together.
* Tidy dataset comprises average of mean and standard deviation values for each subject-activity pair. 
* Each Column has a descriptive name.
* The activities in the data set have descriptive names. (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

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

## Description of the variables
First two columns of the tidy data comprise:
* **SubjectID**: Identifies the subject who performed the activity for each feature vector. It ranges from 1-30
* **ActivityName**: Identifies the activity to which the feature vector corresponds

Other variables follow a nomenclature that makes them descriptive. Each variable denotes mean of  SubjectID - AcitivityName pair. Given below are details about various elements of variable names:
* **'t'**: Time domain signals
* **'f'**: Frequency domain signals (value obtained by applying Fast Fourier Transform to time domain signals)
* **Body**: Body component of the signal (eg. BodyAcc denotes body component of acceleration signal)
* **Gravity**: Gravity component of the signal
* **Acc**: Linear acceleration signal (value obtained from accelerometer)
* **Gyro**: Angular velocity signal (value obtained from gyroscope)
* **Jerk**: Time derivative of the signal
* **Mag**: Magnitude of the three dimensional signal
* **mean()**: Mean value
* **std()**: Standard deviation
* **meanFreq()**: Weighted average of the frequency components 
* **-XYZ**: Suffixes to denote three axial signals in -X, -Y and -Z directions

A complete list of variables in the tidy dataset is given below:

1. SubjectID
2. ActivityName
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X
47. fBodyAcc-std()-Y
48. fBodyAcc-std()-Z
49. fBodyAcc-meanFreq()-X
50. fBodyAcc-meanFreq()-Y
51. fBodyAcc-meanFreq()-Z
52. fBodyAccJerk-mean()-X
53. fBodyAccJerk-mean()-Y
54. fBodyAccJerk-mean()-Z
55. fBodyAccJerk-std()-X
56. fBodyAccJerk-std()-Y
57. fBodyAccJerk-std()-Z
58. fBodyAccJerk-meanFreq()-X
59. fBodyAccJerk-meanFreq()-Y
60. fBodyAccJerk-meanFreq()-Z
61. fBodyGyro-mean()-X
62. fBodyGyro-mean()-Y
63. fBodyGyro-mean()-Z
64. fBodyGyro-std()-X
65. fBodyGyro-std()-Y
66. fBodyGyro-std()-Z
67. fBodyGyro-meanFreq()-X
68. fBodyGyro-meanFreq()-Y
69. fBodyGyro-meanFreq()-Z
70. fBodyAccMag-mean()
71. fBodyAccMag-std()
72. fBodyAccMag-meanFreq()
73. fBodyBodyAccJerkMag-mean()
74. fBodyBodyAccJerkMag-std()
75. fBodyBodyAccJerkMag-meanFreq()
76. fBodyBodyGyroMag-mean()
77. fBodyBodyGyroMag-std()
78. fBodyBodyGyroMag-meanFreq()
79. fBodyBodyGyroJerkMag-mean()
80. fBodyBodyGyroJerkMag-std()
81. fBodyBodyGyroJerkMag-meanFreq()

