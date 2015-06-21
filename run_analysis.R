library(dplyr)

*NOTE: Set working directory to the location where unzipped project data resides

setwd("c:/Users/jeff.jenkins/Box Sync/Documents/R/coursera/Getting-Cleaning_datasets")


#                 Section 1 of Project steps

#read / combine columns test data
sub_test <- read.table("./test/subject_test.txt", header = FALSE, na.strings=c("NA", "NULL"))
y_test <- read.table("./test/Y_test.txt", header = FALSE, na.strings=c("NA", "NULL"))
x_test <- read.table("./test/X_test.txt", header = FALSE, na.strings=c("NA", "NULL"))
testdata <- cbind(sub_test,y_test,x_test)



#read / combine columns train data
sub_train <- read.table("./train/subject_train.txt", header = FALSE, na.strings=c("NA", "NULL"))
y_train <- read.table("./train/Y_train.txt", header = FALSE, na.strings=c("NA", "NULL"))
x_train <- read.table("./train/X_train.txt", header = FALSE, na.strings=c("NA", "NULL"))

traindata <- cbind(sub_train,y_train,x_train)


#merge the rows of the combined test/train files
rawdata <- rbind(testdata, traindata)

#write.csv(rawdata,"rawdata.csv")


#read the header names;  this is Section 4 requirement
variables <- read.table("features.txt", header = FALSE, stringsAsFactors=FALSE)
variables[,2] <-make.names(c(variables[,2]))

variables <- rbind("Subject", "Activity", variables)

#load the variable names into column headers 
colnames(rawdata) <- variables[,2]

#                    Section 2 of Project steps

means <- as.data.frame(grep("mean.", names(rawdata), fixed = TRUE))
stddev <- as.data.frame(grep("std.", names(rawdata), fixed = TRUE))

colsinclude <- c(1,2,means[,1], stddev[,1])

data <- rawdata[,colsinclude]


#                    Section 3 of Project steps
actlabels <- read.csv("activity_labels.txt", header = FALSE, stringsAsFactors=FALSE)
activities <- rbind(y_test, y_train)


activities[,2] <- actlabels[activities[,1],1]
data[,2] <- activities[,2]

#                    Section 4 of Project steps
#performed earlier in the script under the comment:
#    read the header names  &
#    load the variable names into column headers

#                    Section 5 of Project steps

#summary(data)
#finaldata <- group_by(data, data$Subject)
intdata <- aggregate(x = data, by = list(data$Activity, data$Subject), FUN = "mean")
intdata[,4] <- intdata[,1]
finaldata <- intdata[,3:70]
#finaldata <- summarize(data, Subject)        
#finaldata <- group_by(data,Subject)

write.table(finaldata, "projectoutput_JeffJenkins")
