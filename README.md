Steps used to create gettingCleaning.txt:

# Import data
# Format activities in activity_labels.txt to be lower case and thus tidy
# Add measurement names to test data (X_test.txt) from features.txt
# Combine test data (y_test.txt,subject_test.txt,x_test.txt)
# Attach tidy formatted activity names from activity_labels.txt and create a tidy variable name
# Repeat above 3 steps for train data
# Combine train and test datasets
# Extract only the measurements on the mean and standard deviation for each measurement
# Make the measurement variable names tidy
# Create a second tidy dataset with the average of each variable for each activity 
#   and each subject 
# Export the table
