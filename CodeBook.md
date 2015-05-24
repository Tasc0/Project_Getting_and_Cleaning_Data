



Variable name    | Description
	-----------------|------------
	subject          | Who performed the activity for each sample
	activity         | Activity name
	featDomain       | Time domain signal or frequency domain signal (Time or Freq)
	featInstrument   | Measuring technology (Accelerometer or Gyroscope)
	featAcceleration | Acceleration signal (Body or Gravity)
	featVariable     | Variable (Mean) (SD)
	featJerk         | Jerk signal
	featMagnitude    | Magnitude of the signals calculated using the Euclidean norm
	featAxis         | 3-axial signals in the X, Y and Z directions
	featCount        | Count of data points used to calculate average
	featAverage      | Average of each variable x each activity x each subject
	
## Dataset structure

	
	```
	------------------------------------------------------------------------------------------
	## Classes 'data.table' and 'data.frame':	11880 obs. of  11 variables:
	##  $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
	##  $ activity        : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
	##  $ featDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
	##  $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
	##  $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
	##  $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
	##  $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
	##  $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
	##  $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
	##  $ count           : int  50 50 50 50 50 50 50 50 50 50 ...
	##  $ average         : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
	##  - attr(*, "sorted")= chr  "subject" "activity" "featDomain" "featAcceleration" ...
	##  - attr(*, ".internal.selfref")=<externalptr>
        -------------------------------------------------------------------------------------------	
        ```
        
        
## Key variables
  	
  	
	```
	-------------------------------------------------------------------------------------------

	## [1] "subject"          "activity"         "featDomain"      
	## [4] "featAcceleration" "featInstrument"   "featJerk"        
	## [7] "featMagnitude"    "featVariable"     "featAxis"
	
	```
	
