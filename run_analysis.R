library(stringr)
# Import data
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

# Format activities to be lower case and thus tidy
activity_labels$V2<-tolower(activity_labels$V2)

#Add measurement names to test data
names(x_test)<-features$V2

#Combine test data
test<-cbind(y_test,subject_test,x_test)

#Create a tidy name for the subject variable
names(test)[2]<-"subject"

#Attach tidy formatted activity names and create a tidy variable name
test_labeled=merge(x=test,y=activity_labels,by="V1",all.x = TRUE)
names(test_labeled)[564]<-"activity"

#Create variable to indicate that these observations come from the test dataset
test_labeled$V1<-"test"

#Add measurement names to train data
names(x_train)<-features$V2

#Combine train data
train<-cbind(y_train,subject_train,x_train)

#Create a tidy name for the subject variable
names(train)[2]<-"subject"

#Attach tidy formatted activity names and create a tidy variable name
train_labeled=merge(x=train,y=activity_labels,by="V1",all.x = TRUE)
names(train_labeled)[564]<-"activity"

#Create variable to indicate that these observations come from the train dataset
train_labeled$V1<-"train"

# Combine train and test datasets
labeled_data<-rbind(test_labeled,train_labeled)

#Create a tidy name for the source variable
names(labeled_data)[1]<-"source"

# Extract only the measurements on the mean and standard deviation for each measurement
data <-labeled_data[,grep(".*-mean\\().*|.*-std().*|activity|subject|source",names(labeled_data))]

# Make the measurement variable names tidy
names(data)<-gsub("-mean\\()-","Mean",names(data))
names(data)<-gsub("-mean\\()","Mean",names(data))
names(data)<-gsub("-std\\()-","Std",names(data))
names(data)<-gsub("-std\\()","Std",names(data))

# Format subject variable as a factor
data$subject <-as.factor(data$subject )


library(plyr)
# Create a second tidy dataset with the average of each variable for each activity 
#   and each subject 
df2 <- ddply(data, .( subject,source,activity), summarize
             ,tBodyAccMeanX=mean(tBodyAccMeanX)
             ,tBodyAccMeanY=mean(tBodyAccMeanY)
             ,tBodyAccMeanZ=mean(tBodyAccMeanZ)
             ,tBodyAccStdX=mean(tBodyAccStdX)
             ,tBodyAccStdY=mean(tBodyAccStdY)
             ,tBodyAccStdZ=mean(tBodyAccStdZ)
             ,tGravityAccMeanX=mean(tGravityAccMeanX)
             ,tGravityAccMeanY=mean(tGravityAccMeanY)
             ,tGravityAccMeanZ=mean(tGravityAccMeanZ)
             ,tGravityAccStdX=mean(tGravityAccStdX)
             ,tGravityAccStdY=mean(tGravityAccStdY)
             ,tGravityAccStdZ=mean(tGravityAccStdZ)
             ,tBodyAccJerkMeanX=mean(tBodyAccJerkMeanX)
             ,tBodyAccJerkMeanY=mean(tBodyAccJerkMeanY)
             ,tBodyAccJerkMeanZ=mean(tBodyAccJerkMeanZ)
             ,tBodyAccJerkStdX=mean(tBodyAccJerkStdX)
             ,tBodyAccJerkStdY=mean(tBodyAccJerkStdY)
             ,tBodyAccJerkStdZ=mean(tBodyAccJerkStdZ)
             ,tBodyGyroMeanX=mean(tBodyGyroMeanX)
             ,tBodyGyroMeanY=mean(tBodyGyroMeanY)
             ,tBodyGyroMeanZ=mean(tBodyGyroMeanZ)
             ,tBodyGyroStdX=mean(tBodyGyroStdX)
             ,tBodyGyroStdY=mean(tBodyGyroStdY)
             ,tBodyGyroStdZ=mean(tBodyGyroStdZ)
             ,tBodyGyroJerkMeanX=mean(tBodyGyroJerkMeanX)
             ,tBodyGyroJerkMeanY=mean(tBodyGyroJerkMeanY)
             ,tBodyGyroJerkMeanZ=mean(tBodyGyroJerkMeanZ)
             ,tBodyGyroJerkStdX=mean(tBodyGyroJerkStdX)
             ,tBodyGyroJerkStdY=mean(tBodyGyroJerkStdY)
             ,tBodyGyroJerkStdZ=mean(tBodyGyroJerkStdZ)
             ,tBodyAccMagMean=mean(tBodyAccMagMean)
             ,tBodyAccMagStd=mean(tBodyAccMagStd)
             ,tGravityAccMagMean=mean(tGravityAccMagMean)
             ,tGravityAccMagStd=mean(tGravityAccMagStd)
             ,tBodyAccJerkMagMean=mean(tBodyAccJerkMagMean)
             ,tBodyAccJerkMagStd=mean(tBodyAccJerkMagStd)
             ,tBodyGyroMagMean=mean(tBodyGyroMagMean)
             ,tBodyGyroMagStd=mean(tBodyGyroMagStd)
             ,tBodyGyroJerkMagMean=mean(tBodyGyroJerkMagMean)
             ,tBodyGyroJerkMagStd=mean(tBodyGyroJerkMagStd)
             ,fBodyAccMeanX=mean(fBodyAccMeanX)
             ,fBodyAccMeanY=mean(fBodyAccMeanY)
             ,fBodyAccMeanZ=mean(fBodyAccMeanZ)
             ,fBodyAccStdX=mean(fBodyAccStdX)
             ,fBodyAccStdY=mean(fBodyAccStdY)
             ,fBodyAccStdZ=mean(fBodyAccStdZ)
             ,fBodyAccJerkMeanX=mean(fBodyAccJerkMeanX)
             ,fBodyAccJerkMeanY=mean(fBodyAccJerkMeanY)
             ,fBodyAccJerkMeanZ=mean(fBodyAccJerkMeanZ)
             ,fBodyAccJerkStdX=mean(fBodyAccJerkStdX)
             ,fBodyAccJerkStdY=mean(fBodyAccJerkStdY)
             ,fBodyAccJerkStdZ=mean(fBodyAccJerkStdZ)
             ,fBodyGyroMeanX=mean(fBodyGyroMeanX)
             ,fBodyGyroMeanY=mean(fBodyGyroMeanY)
             ,fBodyGyroMeanZ=mean(fBodyGyroMeanZ)
             ,fBodyGyroStdX=mean(fBodyGyroStdX)
             ,fBodyGyroStdY=mean(fBodyGyroStdY)
             ,fBodyGyroStdZ=mean(fBodyGyroStdZ)
             ,fBodyAccMagMean=mean(fBodyAccMagMean)
             ,fBodyAccMagStd=mean(fBodyAccMagStd)
             ,fBodyBodyAccJerkMagMean=mean(fBodyBodyAccJerkMagMean)
             ,fBodyBodyAccJerkMagStd=mean(fBodyBodyAccJerkMagStd)
             ,fBodyBodyGyroMagMean=mean(fBodyBodyGyroMagMean)
             ,fBodyBodyGyroMagStd=mean(fBodyBodyGyroMagStd)
             ,fBodyBodyGyroJerkMagMean=mean(fBodyBodyGyroJerkMagMean)
             ,fBodyBodyGyroJerkMagStd=mean(fBodyBodyGyroJerkMagStd)
             
)
# Export the table

write.table(df2,file="./gettingCleaning.txt",row.names = FALSE)


