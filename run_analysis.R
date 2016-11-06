library(plyr)
library(dplyr)
if(!file.exists("datafile.zip")) {
  Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(Url, destfile = "datafile.zip",method = "curl")
}
activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt")
X_training  <- read.table("UCI HAR Dataset/train/X_train.txt")
y_training <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

training_sensor <- rbind(subject_train,subject_test)
train_initial <- cbind(X_training, subject_train)
test_initial <- cbind(X_test, subject_test)

train_sensor <- cbind(train_initial,y_training)
test_sensor <- cbind(test_initial,y_test)

sensor_data <- rbind(train_sensor,test_sensor)
activity_labels <-dplyr::rename(activity_labels, Activity_ID = V1,Activity_name = V2)

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
activity_labels[,2] <- as.character(activity_labels[,2])

sensor_labels_row <- rbind(features, c(562,"Subject")) 
sensor_labels <- rbind(sensor_labels_row, c(563,"Activity_ID"))[,2]

names(sensor_data) <- sensor_labels

mean_data <- sensor_data[,grepl("mean",names(sensor_data))]

std_data <- sensor_data[,grepl("mean|std|Subject|Activity_ID", names(sensor_data))]


merged_data <- join(std_data, activity_labels , by = "Activity_ID", match = "first") 


merged_data <- merged_data[,-1]


tidy_dataset <- ddply(merged_data,c("Subject",Activity = "Activity_name"), function(x) colMeans(x[ 1:66],na.rm= FALSE))

write.table(tidy_dataset,"tidy_dataset.txt")



