Abstract: Summarized set of sensor readings from the output of an experiment at University of California - Irvine upon wearers of Samsung Galaxy S II smartphones.

Experiment Information:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source Data:
The source data was collected from eight related data sets embedded within a common folder (UCI HAR Dataset). 
There were separate training and testing data sets, each containing three pertinent files, included in the output: 
sensor data (561 features containing various attributes of 22 sensed forces for each 2.56 second observation 
within each subject's recorded activity), subject data (the numeric ID of each participant out of the 30 subjects) 
and activity data (the numeric ID of the activity that was being performed while the measurement was being taken). 
A reference file contained a sequential listing of the 561 feature descriptions to interpret the sensor data, 
and another reference file paired activity data IDs to verbal descriptions.

 
Data Set Information:
The enclosed data set contains a mean, by participant and activity, of the means and standard deviations of 17 
sensed forces. Eight of the forces contain three dimensions each, leading to a total of 66 features (33 mean and 
33 standard deviation).

Keys:
SubjectNbr is a numerical identifier of the anonymous subject whose relevant data are presented.
ActivityCode is the Activity Type for which the data were collected. There are six values for this variable: 
LAYING, STANDING, SITTING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS. 

Sensor readings:
tBodyAcc (x,y,z)
tGravityAcc (x,y,z)
tBodyAccJerk (x,y,z)
tBodyGyro (x,y,z)
tBodyGyroJerk (x,y,z)
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc (x,y,z)
fBodyAccJerk (x,y,z)
fBodyGyro (x,y,z)
fBodyAccMag
fBodyBodyAccJerkMag
fBodyBodyGyroMag
fBodyBodyGyroJerkMag
