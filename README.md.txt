## run_analysis.R 
The script helps to analyze the Human body movement data set that is described in
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The actual data is avaialble from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The Data Set

* The data set as avaiable on in .zip format when extracted looks like ...\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset
* The base folder in the extract has the name files (activity_labels and features). 
* The sub-folders test and train have the data set for Human actions and its respective subjects

### run_analysis.R Script
The script trims the actual data by using only mean and standard deviation metrics collected, bind the same to actual subject identifiers and the actual activity viz. WALKING, SITTING, LAYING etc. 

The trimmed data is used to identify the mean based on the grouping of subject identifier and actual activity. The final result is stored in a text file
