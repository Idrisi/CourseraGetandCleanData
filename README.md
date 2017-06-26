# Coursera Getting and Cleanining Data Project

In order to run this code, the source data (at the end of this document) must be unzipped in a working directory "data" folder using the following path:
"./data/UCI HAR Dataset/"

Script code: https://github.com/Idrisi/CourseraGetandCleanData/blob/master/run_analysis.R

The code completes the following:
1. Merges the training and the test sets from the source data set above to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The end result is a tidy dataset showing the mean and standard deviation measurements for six activities completed by each subject in the study. This tidy data set follows the following principles:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

A codebook for the attributes present in the tidy data results is available and defines the attribute names and types. Further information on the original attributes are here: and orginal study can be located here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The orginal study can be located here:
https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf

Source dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
