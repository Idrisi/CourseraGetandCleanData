## Clear environment

rm(list=ls())

##Load libraries
library(data.table)

## Read the activities data
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE)

## Read the features data
features <- read.table("./data/UCI HAR Dataset/features.txt", header=FALSE)

## Build dataframe for train
dtrain.x <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
dtrain.y <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
dtrain.subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)


## Build dataframe for test
dtest.x <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
dtest.y <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)
dtest.subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

## Merges the training and the test sets to create one data set.
ds.x <- rbind(dtrain.x, dtest.x)
ds.y <- rbind(dtrain.y, dtest.y)
ds.subject <- rbind(dtrain.subject, dtest.subject)

## Extracts only the measurements on the mean and standard deviation for each measurement.
ds.x.mean.std <- ds.x[, grep("-(mean|std)\\(\\)", features[, 2])]
names(ds.x.mean.std) <- features[grep("-(mean|std)\\(\\)", features[, 2]), 2]

## Uses descriptive activity names to name the activities in the data set.
names(activities) <- c('act_id', 'act_name')
ds.y[, 1] = activities[ds.y[, 1], 2]
names(ds.y) <- "Activity"
names(ds.subject) <- "Subject"
ds.tidy <- cbind(ds.subject, ds.y, ds.x.mean.std)

## Appropriately labels the data set with descriptive variable names.
names(ds.tidy) <- gsub('Acc',"Accelerometer",names(ds.tidy))
names(ds.tidy) <- gsub('Gyro',"Gyroscope",names(ds.tidy))
names(ds.tidy) <- gsub("BodyBody", "Body", names(ds.tidy))
names(ds.tidy) <- gsub('^t',"time",names(ds.tidy))
names(ds.tidy) <- gsub('^f',"freq",names(ds.tidy))
names(ds.tidy) <- gsub('\\-mean\\(\\)\\-',".Mean.",names(ds.tidy))
names(ds.tidy) <- gsub('\\-std\\(\\)\\-',".STD.",names(ds.tidy))
names(ds.tidy) <- gsub('\\-mean\\(\\)',".Mean",names(ds.tidy))
names(ds.tidy) <- gsub('\\-std\\(\\)',".STD",names(ds.tidy))

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
ds.tidy2<-aggregate(. ~Subject + Activity, ds.tidy, mean)
write.table(ds.tidy2, file = "tidydata.txt",row.name=FALSE)