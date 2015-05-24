## How to create the same result:
-------------

## Load packages.

```{r}
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
```

##Set path.

```{r}
path <- "/Users/Tasc0/Dataset.zip"
```


##Get the data
------------

##Download the file.

```{r, eval=FALSE}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, path method= "curl")
```

##List the files here.

```{r}
pathIn <- file.path(path, "UCI HAR Dataset")
list.files(pathIn, recursive=TRUE)
```


##Read the files
--------------

##Read the subject files that will be used.

```{r}
dtSubjectTrain <- fread(file.path(pathIn, "train", "subject_train.txt"))
dtSubjectTest  <- fread(file.path(pathIn, "test" , "subject_test.txt" ))
```

##Read the activity files.

```{r}
dtActivityTrain <- fread(file.path(pathIn, "train", "Y_train.txt"))
dtActivityTest  <- fread(file.path(pathIn, "test" , "Y_test.txt" ))
```

##Read the data files. Then convert the resulting data frame to a data table. Return the data table.

```{r fileToDataTable}
fileToDataTable <- function (f) {
	df <- read.table(f)
	dt <- data.table(df)
}
dtTrain <- fileToDataTable(file.path(pathIn, "train", "X_train.txt"))
dtTest  <- fileToDataTable(file.path(pathIn, "test" , "X_test.txt" ))
```


##Merge the files
------------------------------------

##Concatenate the data tables.

```{r}
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
setnames(dtSubject, "V1", "subject")
dtActivity <- rbind(dtActivityTrain, dtActivityTest)
setnames(dtActivity, "V1", "activityNum")
dt <- rbind(dtTrain, dtTest)
```

##Merge columns.

```{r}
dtSubject <- cbind(dtSubject, dtActivity)
dt <- cbind(dtSubject, dt)
```

##Set key.

```{r}
setkey(dt, subject, activityNum)
```


##Extract only the mean and standard deviation
--------------------------------------------


```{r}
dtFeatures <- fread(file.path(pathIn, "features.txt"))
setnames(dtFeatures, names(dtFeatures), c("featureNum", "featureName"))
```

Subset only measurements for the mean and standard deviation.

```{r}
dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]
```

Convert the column numbers to a vector of variable names matching columns in `dt`.

```{r}
dtFeatures$featureCode <- dtFeatures[, paste0("V", featureNum)]
head(dtFeatures)
dtFeatures$featureCode
```

##Subset these variables using variable names.

```{r}
select <- c(key(dt), dtFeatures$featureCode)
dt <- dt[, select, with=FALSE]
```


##Use descriptive activity names
------------------------------


```{r}
dtActivityNames <- fread(file.path(pathIn, "activity_labels.txt"))
setnames(dtActivityNames, names(dtActivityNames), c("activityNum", "activityName"))
```


##Label with descriptive activity names
-----------------------------------------------------------------

##Merge activity labels.

```{r}
dt <- merge(dt, dtActivityNames, by="activityNum", all.x=TRUE)
```

##Add `activityName` as a key.

```{r}
setkey(dt, subject, activityNum, activityName)
```

## Reshape it from a short and wide format to a tall and narrow format.

```{r}
dt <- data.table(melt(dt, key(dt), variable.name="featureCode"))
```

##Merge activity name.

```{r}
dt <- merge(dt, dtFeatures[, list(featureNum, featureCode, featureName)], by="featureCode", all.x=TRUE)
```

##Create a new variable, `activity` that is equivalent to `activityName` as a factor class.
##Create a new variable, `feature` that is equivalent to `featureName` as a factor class.

```{r}
dt$activity <- factor(dt$activityName)
dt$feature <- factor(dt$featureName)
```

##Seperate features from `featureName` using the helper function `grepthis`.

```{r grepthis}
grepthis <- function (regex) {
  grepl(regex, dt$feature)
}
## Features with 2 categories
n <- 2
y <- matrix(seq(1, n), nrow=n)
x <- matrix(c(grepthis("^t"), grepthis("^f")), ncol=nrow(y))
dt$featDomain <- factor(x %*% y, labels=c("Time", "Freq"))
x <- matrix(c(grepthis("Acc"), grepthis("Gyro")), ncol=nrow(y))
dt$featInstrument <- factor(x %*% y, labels=c("Accelerometer", "Gyroscope"))
x <- matrix(c(grepthis("BodyAcc"), grepthis("GravityAcc")), ncol=nrow(y))
dt$featAcceleration <- factor(x %*% y, labels=c(NA, "Body", "Gravity"))
x <- matrix(c(grepthis("mean()"), grepthis("std()")), ncol=nrow(y))
dt$featVariable <- factor(x %*% y, labels=c("Mean", "SD"))
## Features with 1 category
dt$featJerk <- factor(grepthis("Jerk"), labels=c(NA, "Jerk"))
dt$featMagnitude <- factor(grepthis("Mag"), labels=c(NA, "Magnitude"))
## Features with 3 categories
n <- 3
y <- matrix(seq(1, n), nrow=n)
x <- matrix(c(grepthis("-X"), grepthis("-Y"), grepthis("-Z")), ncol=nrow(y))
dt$featAxis <- factor(x %*% y, labels=c(NA, "X", "Y", "Z"))
```

##Don't forget to check all possible combinations of `feature` are accounted for by all possible combinations of the factor class variables.

```{r}
r1 <- nrow(dt[, .N, by=c("feature")])
r2 <- nrow(dt[, .N, by=c("featDomain", "featAcceleration", "featInstrument", "featJerk", "featMagnitude", "featVariable", "featAxis")])
r1 == r2
```



##Create a tidy data
----------------------

Create a data set with the average of each variable for each activity and each subject.

```{r}
setkey(dt, subject, activity, featDomain, featAcceleration, featInstrument, featJerk, featMagnitude, featVariable, featAxis)
dtTidy <- dt[, list(count = .N, average = mean(value)), by=key(dt)]
```

##Save the tidy data
----------------------

```{r}
write.table(dtTidy, "/Users/Tasc0/UCI_HAR_tidy.txt", row.name = FALSE)
```
