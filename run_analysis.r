run_analysis <- function() {

    library(data.table)
    library(dplyr)

    print("Step 1 of 9 - Loading feature list")
    ColData <- read.csv("./UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
    ColLabel <- vector("character")
    for (CDRow in 1:length(ColData[,1])) {
        ColLabel[CDRow] <- as.character(ColData[CDRow,2])
    }

    print("Step 2 of 9 - Loading training data")
    REDataTr <- read.csv("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(REDataTr) <- ColLabel

    print("Step 3 of 9 - Loading test data")
    REDataTe <- read.csv("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(REDataTe) <- ColLabel

    print("Step 4 of 9 - merging files")
    REData <- rbind(REDataTr, REDataTe)
 #   colnames(REData) <- ColLabel

    print("Step 5 of 9 - Selecting desired columns")
    RESubData <- REData[,c(
                           "tBodyAcc-mean()-X",
                           "tBodyAcc-mean()-Y",
                           "tBodyAcc-mean()-Z",
                           "tBodyAcc-std()-X",
                           "tBodyAcc-std()-Y",
                           "tBodyAcc-std()-Z",
                           "tGravityAcc-mean()-X",
                           "tGravityAcc-mean()-Y",
                           "tGravityAcc-mean()-Z",
                           "tGravityAcc-std()-X",
                           "tGravityAcc-std()-Y",
                           "tGravityAcc-std()-Z",
                           "tBodyAccJerk-mean()-X",
                           "tBodyAccJerk-mean()-Y",
                           "tBodyAccJerk-mean()-Z",
                           "tBodyAccJerk-std()-X",
                           "tBodyAccJerk-std()-Y",
                           "tBodyAccJerk-std()-Z",
                           "tBodyGyro-mean()-X",
                           "tBodyGyro-mean()-Y",
                           "tBodyGyro-mean()-Z",
                           "tBodyGyro-std()-X",
                           "tBodyGyro-std()-Y",
                           "tBodyGyro-std()-Z",
                           "tBodyGyroJerk-mean()-X",
                           "tBodyGyroJerk-mean()-Y",
                           "tBodyGyroJerk-mean()-Z",
                           "tBodyGyroJerk-std()-X",
                           "tBodyGyroJerk-std()-Y",
                           "tBodyGyroJerk-std()-Z",
                           "tBodyAccMag-mean()",
                           "tBodyAccMag-std()",
                           "tGravityAccMag-mean()",
                           "tGravityAccMag-std()",
                           "tBodyAccJerkMag-mean()",
                           "tBodyAccJerkMag-std()",
                           "tBodyGyroMag-mean()",
                           "tBodyGyroMag-std()",
                           "tBodyGyroJerkMag-mean()",
                           "tBodyGyroJerkMag-std()",
                           "fBodyAcc-mean()-X",
                           "fBodyAcc-mean()-Y",
                           "fBodyAcc-mean()-Z",
                           "fBodyAcc-std()-X",
                           "fBodyAcc-std()-Y",
                           "fBodyAcc-std()-Z",
                           "fBodyAccJerk-mean()-X",
                           "fBodyAccJerk-mean()-Y",
                           "fBodyAccJerk-mean()-Z",
                           "fBodyAccJerk-std()-X",
                           "fBodyAccJerk-std()-Y",
                           "fBodyAccJerk-std()-Z",
                           "fBodyGyro-mean()-X",
                           "fBodyGyro-mean()-Y",
                           "fBodyGyro-mean()-Z",
                           "fBodyGyro-std()-X",
                           "fBodyGyro-std()-Y",
                           "fBodyGyro-std()-Z",
                           "fBodyAccMag-mean()",
                           "fBodyAccMag-std()",
                           "fBodyBodyAccJerkMag-mean()",
                           "fBodyBodyAccJerkMag-std()",
                           "fBodyBodyGyroMag-mean()",
                           "fBodyBodyGyroMag-std()",
                           "fBodyBodyGyroJerkMag-mean()",
                           "fBodyBodyGyroJerkMag-std()"
                          )]

    print("Step 6 of 9 - Assigning activity types")
    ActTypeSet <- read.csv("./UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE)
    ATDataTr <- read.csv("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(ATDataTr) <- c("ActivityCode")
    ATDataTe <- read.csv("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(ATDataTe) <- c("ActivityCode")
    ATData <- rbind(ATDataTr, ATDataTe)
    ATData <- data.frame(apply(ATData,1,function(x) as.character(ActTypeSet[x,2])))
    colnames(ATData) <- c("ActivityType")
    NmData <- cbind(ATData,RESubData)

    print("Step 7 of 9 - Assigning subject ID")
    SDataTr <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(SDataTr) <- c("SubjectNbr")
    SDataTe <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="", colClasses="numeric")
    colnames(SDataTe) <- c("SubjectNbr")
    SData <- rbind(SDataTr, SDataTe)
    FullData <- cbind(SData,NmData)

    print("Step 8 of 9 - Grouping results")
    FDGrp <- group_by(FullData,SubjectNbr,ActivityType) 
    FDSum <- summarise_each(FDGrp,funs(mean))

    print("Step 9 of 9 - Writing output file")
    FDOut <- file("./GCDp1Out.txt","w")
    write.table(FDSum,FDOut,row.name=FALSE)
    close(FDOut)
}


