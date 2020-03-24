Variables:

-subject: indicator for each subject. pulled from subject_test.txt and subject_train.txt

-source: indicator for whether the data comes from the test or tain datasets

-activity: indicator for the activity measurements are for. pulled from y_test.txt and y_train.txt and converted using activity_labels.txt

-measurement variables: average values for each measurement statistic. pulled from X_test.tx and X_train.txt and labeled using featutures.txt. filtered to only include mean and standard deviation statistics.

From feature_info.txt:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
"

Listed for convienience:
 "tBodyAccMeanX"           
"tBodyAccMeanY"            
"tBodyAccMeanZ"            
"tBodyAccStdX"            
"tBodyAccStdY"             
"tBodyAccStdZ"             
"tGravityAccMeanX"        
"tGravityAccMeanY"         
"tGravityAccMeanZ"         
"tGravityAccStdX"         
"tGravityAccStdY"          
"tGravityAccStdZ"          
"tBodyAccJerkMeanX"       
"tBodyAccJerkMeanY"        
"tBodyAccJerkMeanZ"        
"tBodyAccJerkStdX"        
"tBodyAccJerkStdY"         
"tBodyAccJerkStdZ"         
"tBodyGyroMeanX"          
"tBodyGyroMeanY"           
"tBodyGyroMeanZ"           
"tBodyGyroStdX"           
"tBodyGyroStdY"            
"tBodyGyroStdZ"            
"tBodyGyroJerkMeanX"      
"tBodyGyroJerkMeanY"       
"tBodyGyroJerkMeanZ"       
"tBodyGyroJerkStdX"       
"tBodyGyroJerkStdY"        
"tBodyGyroJerkStdZ"        
"tBodyAccMagMean"         
"tBodyAccMagStd"           
"tGravityAccMagMean"       
"tGravityAccMagStd"       
"tBodyAccJerkMagMean"      
"tBodyAccJerkMagStd"       
"tBodyGyroMagMean"        
"tBodyGyroMagStd"          
"tBodyGyroJerkMagMean"     
"tBodyGyroJerkMagStd"     
"fBodyAccMeanX"            
"fBodyAccMeanY"            
"fBodyAccMeanZ"           
"fBodyAccStdX"             
"fBodyAccStdY"             
"fBodyAccStdZ"            
"fBodyAccJerkMeanX"        
"fBodyAccJerkMeanY"        
"fBodyAccJerkMeanZ"       
"fBodyAccJerkStdX"         
"fBodyAccJerkStdY"         
"fBodyAccJerkStdZ"        
"fBodyGyroMeanX"           
"fBodyGyroMeanY"           
"fBodyGyroMeanZ"          
"fBodyGyroStdX"            
"fBodyGyroStdY"            
"fBodyGyroStdZ"           
"fBodyAccMagMean"          
"fBodyAccMagStd"           
"fBodyBodyAccJerkMagMean" 
"fBodyBodyAccJerkMagStd"   
"fBodyBodyGyroMagMean"     
"fBodyBodyGyroMagStd"     
"fBodyBodyGyroJerkMagMean" 
"fBodyBodyGyroJerkMagStd" 

