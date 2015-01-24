## tidyData.txt

This code book represents the description of the data that is produced by running run_analysis.R file on Human movement data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Variables

###Subject
Integer subject code representing subject associated to the reading

###activity_code and activity
The actual activity performed by the human as represented by a code and descriptive value
* 1 WALKING

* 2 WALKING_UPSTAIRS

* 3 WALKING_DOWNSTAIRS

* 4 SITTING

* 5 STANDING

* 6 LAYING

activity_code is Integer
activity is a character value

...mean()
Mean value for the given activity and subject associated to a data row. It is computed against the raw mean measurement of Human movements. It is of type decimal.

...std()

Mean value for the given activity and subject associated to a data row. It is computed against the raw standard deviation measurement of Human movements. It is of type decimal.

To get the actual descrition of the raw measurement, refer to features_info.txt file in the actual data set
