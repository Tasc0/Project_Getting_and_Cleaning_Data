subject	ID -  Who performed the activity for each sample.
activity - 	Activity name
featDomain - Time domain signal or frequency domain signal (Time or Freq)
featInstrument - Measuring technology (Accelerometer or Gyroscope)
featAcceleration - 	Acceleration signal (Body or Gravity)
featVariable - 	Variable (Mean) (SD)
featJerk - 	Jerk signal
featMagnitude - Magnitude of the signals calculated
featAxis - 	3-axial signals in the X, Y and Z directions
featCount - 	Count of data points used to calculate average
featAverage - 	Average of each variable x each activity x each subject

## Data structure:

Classes ‘data.table’ and 'data.frame':	11880 obs. of  11 variables:
 $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity        : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ featDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
 $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
 $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
 $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
 $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
 $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
 $ count           : int  50 50 50 50 50 50 50 50 50 50 ...
 $ average         : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
 - attr(*, "sorted")= chr  "subject" "activity" "featDomain" "featAcceleration" ...
 - attr(*, ".internal.selfref")=<externalptr> 
 
 ## Key Variables
 
 [1] "subject"          "activity"         "featDomain"       "featAcceleration" "featInstrument"  
[6] "featJerk"         "featMagnitude"    "featVariable"     "featAxis"

## Summary

subject                   activity    featDomain  featAcceleration       featInstrument
 Min.   : 1.0   LAYING            :1980   Time:7200   NA     :4680     Accelerometer:7200  
 1st Qu.: 8.0   SITTING           :1980   Freq:4680   Body   :5760     Gyroscope    :4680  
 Median :15.5   STANDING          :1980               Gravity:1440                         
 Mean   :15.5   WALKING           :1980                                                    
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                                                    
 Max.   :30.0   WALKING_UPSTAIRS  :1980                                                    
 featJerk      featMagnitude  featVariable featAxis      count          average        
 NA  :7200   NA       :8640   Mean:5940    NA:3240   Min.   :36.00   Min.   :-0.99767  
 Jerk:4680   Magnitude:3240   SD  :5940    X :2880   1st Qu.:49.00   1st Qu.:-0.96205  
                                           Y :2880   Median :54.50   Median :-0.46989  
                                           Z :2880   Mean   :57.22   Mean   :-0.48436  
                                                     3rd Qu.:63.25   3rd Qu.:-0.07836  
                                                     Max.   :95.00   Max.   : 0.97451 
                                                     
                                                     
 
 
