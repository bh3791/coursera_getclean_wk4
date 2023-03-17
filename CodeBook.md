# CodeBook

This codebook describes the background to the source data, as well as a high level description of the processing steps involved in the script, and a description of the variables in the data tables created by the script.

## Experimental Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

======================================

\- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

\- Triaxial Angular velocity from the gyroscope.

\- In this project we select only the MEAN mean() and STANDARD DEVIATION std() variables, resulting in 66 floating point variables out of the original 561 variables.

\- Its activity label.

\- An identifier of the subject who carried out the experiment.

## The run_analysis.R Script

The script run_analysis.R performs the following tasks:

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each measurement. This is done using grep() to select only the variable names that match mean() and std(). All other variables are discarded.

3.  Uses descriptive activity names to name the activities in the data set. These are rendered in lower case and come from the activity_labels.txt file.

4.  Appropriately labels the data set with descriptive variable names. Variable names are read in from the features.txt file and cleaned up to replace special characters.

5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script produces two data tables, one named main_set and one named summary_table. The summary table is written out at the end.

## The data in main_set and summary_table

The data format of each of the tables main_set and summary_table is the same. The summary table contains the mean values for each measure by subject and activity. The following list describes the columns in the data sets:

1.  subject - an integer number for the experimental subject. There are 30 of them in the dataset.
2.  activity - a string that describes one of 7 activities. The options are:

| activity           |
|--------------------|
| walking            |
| walking_upstairs   |
| walking_downstairs |
| sitting            |
| standing           |
| laying             |

The rest of the variables (columns) in the dataset are numeric type and are as follows. In the main_set, the variables are provided. In the summary_table, the variables are named the same but are averaged by mean() and grouped by the subject and activity. As mentioned above, the time-domain variables have 'time\_' prepended. The frequency domain variables have 'freq\_' prepended.

| column number | **column (variable) name**    |
|:--------------|:------------------------------|
| 3             | time_bodyacc_mean_x           |
| 4             | time_bodyacc_mean_y           |
| 5             | time_bodyacc_mean_z           |
| 6             | time_bodyacc_std_x            |
| 7             | time_bodyacc_std_y            |
| 8             | time_bodyacc_std_z            |
| 9             | time_gravityacc_mean_x        |
| 10            | time_gravityacc_mean_y        |
| 11            | time_gravityacc_mean_z        |
| 12            | time_gravityacc_std_x         |
| 13            | time_gravityacc_std_y         |
| 14            | time_gravityacc_std_z         |
| 15            | time_bodyaccjerk_mean_x       |
| 16            | time_bodyaccjerk_mean_y       |
| 17            | time_bodyaccjerk_mean_z       |
| 18            | time_bodyaccjerk_std_x        |
| 19            | time_bodyaccjerk_std_y        |
| 20            | time_bodyaccjerk_std_z        |
| 21            | time_bodygyro_mean_x          |
| 22            | time_bodygyro_mean_y          |
| 23            | time_bodygyro_mean_z          |
| 24            | time_bodygyro_std_x           |
| 25            | time_bodygyro_std_y           |
| 26            | time_bodygyro_std_z           |
| 27            | time_bodygyrojerk_mean_x      |
| 28            | time_bodygyrojerk_mean_y      |
| 29            | time_bodygyrojerk_mean_z      |
| 30            | time_bodygyrojerk_std_x       |
| 31            | time_bodygyrojerk_std_y       |
| 32            | time_bodygyrojerk_std_z       |
| 33            | time_bodyaccmag_mean          |
| 34            | time_bodyaccmag_std           |
| 35            | time_gravityaccmag_mean       |
| 36            | time_gravityaccmag_std        |
| 37            | time_bodyaccjerkmag_mean      |
| 38            | time_bodyaccjerkmag_std       |
| 39            | time_bodygyromag_mean         |
| 40            | time_bodygyromag_std          |
| 41            | time_bodygyrojerkmag_mean     |
| 42            | time_bodygyrojerkmag_std      |
| 43            | freq_bodyacc_mean_x           |
| 44            | freq_bodyacc_mean_y           |
| 45            | freq_bodyacc_mean_z           |
| 46            | freq_bodyacc_std_x            |
| 47            | freq_bodyacc_std_y            |
| 48            | freq_bodyacc_std_z            |
| 49            | freq_bodyaccjerk_mean_x       |
| 50            | freq_bodyaccjerk_mean_y       |
| 51            | freq_bodyaccjerk_mean_z       |
| 52            | freq_bodyaccjerk_std_x        |
| 53            | freq_bodyaccjerk_std_y        |
| 54            | freq_bodyaccjerk_std_z        |
| 55            | freq_bodygyro_mean_x          |
| 56            | freq_bodygyro_mean_y          |
| 57            | freq_bodygyro_mean_z          |
| 58            | freq_bodygyro_std_x           |
| 59            | freq_bodygyro_std_y           |
| 60            | freq_bodygyro_std_z           |
| 61            | freq_bodyaccmag_mean          |
| 62            | freq_bodyaccmag_std           |
| 63            | freq_bodybodyaccjerkmag_mean  |
| 64            | freq_bodybodyaccjerkmag_std   |
| 65            | freq_bodybodygyromag_mean     |
| 66            | freq_bodybodygyromag_std      |
| 67            | freq_bodybodygyrojerkmag_mean |
| 68            | freq_bodybodygyrojerkmag_std  |
