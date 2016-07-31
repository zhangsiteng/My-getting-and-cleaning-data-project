#initiate necessary packages
library(dplyr)
library(tidyr)
library(reshape2)
library(data.table)

#then load test data into R,there are no column names in the raw data,so set head=FALSE
test.subject<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",head=FALSE)
test.X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",head=FALSE)
test.y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt",head=FALSE)

#load train data into R
train.subject<-read.table("./data/UCI HAR Dataset/train/subject_train.txt",head=FALSE)
train.X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",head=FALSE)
train.y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt",head=FALSE)

#set the subject&activity colomn name
test.subject<-rename(test.subject,Subject_ID=V1)
test.y_test<-rename(test.y_test,Activity=V1)
train.subject<-rename(train.subject,Subject_ID=V1)
train.y_train<-rename(train.y_train,Activity=V1)

#merge all six data set into one big data set
testdata<-cbind(test.subject,test.y_test,test.X_test)
traindata<-cbind(train.subject,train.y_train,train.X_train)
mydata<-rbind(testdata,traindata)

#calculate only the measurements on the mean and standard deviation for each measurement,and set descriptive name for these variables
mydata<-mutate(mydata,Var_Mean=rowMeans(mydata[,-(1+2)]))
mydata<-mutate(mydata,Var_sd=apply(mydata[,-(1+2)],1, sd, na.rm = TRUE))

#delete redudant columns
mydata<-mydata[,c("Subject_ID","Activity","Var_Mean","Var_sd")]

#set descriptive activity names to replace the Activitiy column in the data set
labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",head=FALSE)
addmatchlabel<-labels$V2[match(mydata$Activity,labels$V1)]
mydata<-mutate(mydata,Activity_labels=addmatchlabel)
mydata<-select(mydata,-Activity)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
MyMeltData<-melt(mydata,id=c("Subject_ID","Activity_labels"),measure.vars = c("Var_Mean","Var_sd"))
MyTidyData<-dcast(MyMeltData, Subject_ID + Activity_labels ~ variable, mean)
MyTidyData<-rename(MyTidyData, MeanOfVar_Mean=Var_Mean,MeanOfVar_sd=Var_sd)

#write the final tidy data into csv file
write.table(MyTidyData,file="My Tidy Data 2.txt",row.names=FALSE)
write.table(mydata,file="My Tidy Data 1.txt",row.names=FALSE)