#1.	View tidy data set
First you need to read data into your computer for viewing.

Use function read.table(head=TRUE) .

The first data set “My Tidy Data 1.txt” is the output from step 4, which contains 4 variables: subject IDs, activity labels, mean of all variables, and standard deviation of all variables.

The second data set “My Tidy Data 2.txt” is the output from step 5. It contains 4 variables: subject IDs, activity labels, average of mean of all variables, and average of standard deviation of all variables (the last two are for each activity and each subject).

These two data sets are tidy data because they all have each variable in one column; each observation in different row. 

#2.	Data processing
In the script, first I load the related data set into R by read.table().

Then merge all six data set into one big data set by cbind() and rbind(), following the step 1 instruction.

Then extracts only the measurements on the mean and standard deviation for each measurement by mutate() function . At the same time set descriptive variable names for my data set.

Then deleting redundant variables except subject, activity, mean and standard deviation as step 2 instructed.

Then I set descriptive activity labels to replace the original activity code using the “activity_labels.txt” data set information, now the “Activity_labels” variable contain descriptive activity names(as step instructed).

Then, I create a second data set using melt() and decast() function from “reshape2 package” to calculate the average of two variables(mean and standard deviation) for each activity and each subject .

Lastly, write data sets into txt files by write.table().

#3.	Variable names
“My Tidy Data 1.txt” is the first data set from step 4 instruction, variable names are as follows:

"Subject_ID" : subject for each measurement.

"Activity_labels": activity name for each measurement.

"Var_Mean" : mean of all original variables, mean of a row.

"Var_sd" : standard deviation of all original variables, sd is short for standard deviation which is commonly used.

“My Tidy Data 2.txt” is the second data set from step 5 instruction, variable names are as follows:

"Subject_ID": subject for each measurement.

"Activity_labels": activity name for each measurement.

"MeanOfVar_Mean": mean of Var_Mean as describe above for each subject and each activity.

"MeanOfVar_sd": mean of Var_sd as describe above for each subject and each activity.

