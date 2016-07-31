#1.	Information about variables
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

#2.	Information about summary choice
First I merge subject, y and x data sets into a wide data individually for test and train data by using cbind(). 

Then I merge test data and train data into a narrow data set by using rbind(). There I finish the merge step. 

After that I calculate the average of all variables from the big data set and delete unnecessary, in that way I finish the first tidy data set.

For the final data set I first melt the above data set for id: "Subject_ID"&"Activity_labels"y, measure.vars: "Var_Mean"&"Var_sd". Then I use decast() to calculate the average of variables for each activity and each subject. That is what is asked from step 5 instruction.
