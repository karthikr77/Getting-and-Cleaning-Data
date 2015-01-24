#1.Merges the training and the test sets to create one data set.
###Read the data sets ###
###Ensure that the files from ...\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset is working folder if not set it using setwd()
Xtest<-read.table(".\\test\\X_test.txt")
Ytest<-read.table(".\\test\\Y_test.txt")
Xtrain<-read.table(".\\train\\X_train.txt")
Ytrain<-read.table(".\\train\\Y_train.txt")
XMerged<-rbind(Xtest,Xtrain)
YMerged<-rbind(Ytest,Ytrain)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
###Get the variables so that mean variables could be found ###
features<-read.table("features.txt")
names(XMerged)<-features[,2]
##mean is mean(), standard deviation is std()
##use grepLogical (grepL) to get logical vector of mean and std
mean_std_cols<-grepl("-mean",features[,2]) | grepl("-std",features[,2])
XMeanStd<-XMerged[,mean_std_cols]

#3.Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("activity_labels.txt")
library(plyr)
YLabelled<-join(YMerged,activity_labels)

#4.Appropriately labels the data set with descriptive variable names. 
names(YLabelled)<-c("activity_code","activity")
XMeanStdActivity<-cbind(YLabelled,XMeanStd)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###Get the subject column merged###
subject_train<-read.table(".\\train\\subject_train.txt")
subject_test<-read.table(".\\test\\subject_test.txt")
subjectMerged<-rbind(subject_test,subject_train)
names(subjectMerged)<-c("Subject")
XMeanStdActivitySubject<-cbind(subjectMerged,XMeanStdActivity)
###Frame tidy data set with the averages by subject 03_04_reshapingData###
library(reshape2)
XMeanStdActivitySubject_Prepare<- melt(XMeanStdActivitySubject,id.vars=c("Subject","activity")) 
XMeanStdActivitySubject_Tidy <- dcast(XMeanStdActivitySubject_Prepare, Subject + activity ~ ..., mean) 
###Tidy to contain nrow(unique(XMeanStdActivitySubject[,c("Subject","activity")]))
write.table(XMeanStdActivitySubject_Tidy,".\\tidyData.txt",row.names=FALSE)
##done


