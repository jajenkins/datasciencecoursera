Code Book  - Getting_Cleaning datasets coursera course June 2015  Jeff Jenkins

Variables/transformations:
sub_test – storing subject_test.txt"
y_test - storing Y_test.txt
x_test - storing Y_test.txt 
testdata – combines the data in the previous 3 files

sub_train – storing subject_test.train
y_train - storing Y_train.txt
x_train x_test - storing X_test.txt 

traindata – combines the data in the previous 3 files


rawdata – holds the merged rows of the combined test/train files

variables – stores features.txt data
perform make.names function on variables elements
	add Subject, Activity columns

rawdata -load the variable names into column headers 


#                    Section 2 of Project steps

means – stores rawdata variable names that contain ‘mean.’
stddev – stores rawdata variable names that contain ‘std.’


colsinclude – combines means & stddev lists

data – stores the selected columns from rawdata (those that match colsinclude index)


#                    Section 3 of Project steps
actlabels – stores activity_labels.txt
include activity labels (y_test, y_train vectors)
data – convert the activity numbers column to activity labels


#                    Section 4 of Project steps
performed earlier in the script under the comment:
#    read the header names  &
#    load the variable names into column headers

#                    Section 5 of Project steps
intdata – aggregates data frame measurements by Activity, Subject, getting the mean for each grouping
	copy activity label column into Activity column

finaldata – stores relevant columns from intdata
	
