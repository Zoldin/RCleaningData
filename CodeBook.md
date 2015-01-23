Variable selection and transformation
___________________________________________________________

Final data set that is produced in runanalysis.R contains aggregated variables that were firstly extracted 
from UCI HAR Dataset and after that modified/transformed and aggregated by subject(volunteer_id) and activity label.

Firstly, from 563 variables only variables that are representing mean value or standard deviation of 
signals were extracted from a data set.

This criteria gave us 68 variables (variables that are representing angle between two vector were excluded although
in their names "mean" word is presented, also mean frequency(*meanFreq) was excluded from a final data set)

Before aggregating quantitative variables activity_id(values from 1-6) values in "activity" columns were 
replaced with labels( "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")-

Aggregation(average of each quantitative variable for each activity and each subject) was made with aggregate function. 
Output was produced - 180 observations and 68 columns (activity and volunteer_id are included in output)
Final data set contains 68 variables :
    
      - volunteer_id (subject that was performing 6 activities and wearing a smartphone). 
        Subjects(volunteers) are labeled with id's from 1 to 30.

      - activity. Represents one of 6 subjects activities. It is labeled with values: 
        "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"

      - t_bodyacc_mean_x_avg				    - average value of mean values of the time Body acceleration signals in the x direction by volunteer and activity 
      - t_bodyacc_mean_y_avg				    - average value of mean values of the time Body acceleration signals in the y direction	by volunteer and activity 
      - t_bodyacc_mean_z_avg				    - average value of mean values of the time Body acceleration signals in the z direction	by volunteer and activity 
      - t_bodyacc_std_dev_x_avg				  - average value of standard deviations of the time Body acceleration signals in the x direction	by volunteer and activity 
      - t_bodyacc_std_dev_y_avg				  - average value of standard deviations of the time Body acceleration signals in the y direction	by volunteer and activity 
      - t_bodyacc_std_dev_z_avg				  - average value of standard deviations of the time Body acceleration signals in the z direction	by volunteer and activity 
      - t_gravityacc_mean_x_avg				  - average value of mean values of the time Gravity acceleration signals in the x direction by volunteer and activity 
      - t_gravityacc_mean_y_avg				  - average value of mean values of the time Gravity acceleration signals in the y direction by volunteer and activity 
      - t_gravityacc_mean_z_avg				  - average value of mean values of the time Gravity acceleration signals in the z direction by volunteer and activity 	
      - t_gravityacc_std_dev_x_avg			- average value of standard deviations of the time Gravity acceleration signals in the x direction by volunteer and activity 
      - t_gravityacc_std_dev_y_avg			- average value of standard deviations of the time Gravity acceleration signals in the y direction by volunteer and activity 
      - t_gravityacc_std_dev_z_avg			- average value of standard deviations of the time Gravity acceleration signals in the z direction by volunteer and activity 	
      - t_bodyaccjerk_mean_x_avg			  - average value of mean values of the time body linear acceleration Jerk signals  in the x direction by volunteer and acitivity
      - t_bodyaccjerk_mean_y_avg			  - average value of mean values of the time body linear acceleration Jerk signals  in the y direction by volunteer and acitivity
      - t_bodyaccjerk_mean_z_avg			  - average value of mean values of the time body linear acceleration Jerk signals  in the z direction by volunteer and acitivity
      - t_bodyaccjerk_std_dev_x_avg			- average value of standard deviations of the time body linear acceleration Jerk signals in the x direction by volunteer and acitivity
      - t_bodyaccjerk_std_dev_y_avg			- average value of standard deviations of the time body linear acceleration Jerk signals in the y direction by volunteer and acitivity
      - t_bodyaccjerk_std_dev_z_avg			- average value of standard deviations of the time body linear acceleration Jerk signals  in the z direction by volunteer and acitivity
      - t_bodygyro_mean_x_avg				    - average value of mean values of the time Body gyroscope signals in the x direction by volunteer and activity
      - t_bodygyro_mean_y_avg				    - average value of mean values of the time Body gyroscope signals in the y direction by volunteer and activity
      - t_bodygyro_mean_z_avg				    - average value of mean values of the time Body gyroscope signals in the z direction by volunteer and activity
      - t_bodygyro_std_dev_x_avg			  - average value of standard deviations of the time Body gyroscope signals in the x direction by volunteer and activity
      - t_bodygyro_std_dev_y_avg			  - average value of standard deviations of the time Body gyroscope signals in the y direction by volunteer and activity
      - t_bodygyro_std_dev_z_avg			  - average value of standard deviations of the time Body gyroscope signals in the z direction by volunteer and activity
      - t_bodygyrojerk_mean_x_avg			  - average value of mean values of the time body gyroscope Jerk signals  in the x direction by volunteer and acitivity
      - t_bodygyrojerk_mean_y_avg			  - average value of mean values of the time body gyroscope Jerk signals  in the y direction by volunteer and acitivity
      - t_bodygyrojerk_mean_z_avg			  - average value of mean values of the time body gyroscope Jerk signals  in the z direction by volunteer and acitivity
      - t_bodygyrojerk_std_dev_x_avg			- average value of standard deviations of the time body gyroscope Jerk signals  in the x direction by volunteer and acitivity
      - t_bodygyrojerk_std_dev_y_avg			- average value of standard deviations of the time body gyroscope Jerk signals  in the y direction by volunteer and acitivity
      - t_bodygyrojerk_std_dev_z_avg			- average value of standard deviations of the time body gyroscope Jerk signals  in the z direction by volunteer and acitivity
      - t_bodyacc_magnitude_mean_avg			- average value of mean values of the magnitude of the Body acceleration signals by volunteer and acitivity
      - t_bodyacc_magnitude_std_dev_avg			- average value of standard deviations of the magnitude of the Body acceleration signals by volunteer and acitivity
      - t_gravityacc_magnitude_mean_avg			- average value of mean values of the magnitude of the Gravity acceleration signals by volunteer and acitivity
      - t_gravityacc_magnitude_std_dev_avg	- average value of standard deviations of the magnitude of the Gravity acceleration signals by volunteer and acitivity
      - t_bodyaccjerk_magnitude_mean_avg		- average value of mean values of the magnitude (body linear acceleration,time Jerk signals) by volunteer and acitivity
      - t_bodyaccjerk_magnitude_std_dev_avg	- average value of standard deviations of the magnitude (body linear acceleration,time Jerk signals) by volunteer and acitivity
      - t_bodygyro_magnitude_mean_avg			  - average value of mean values of time magnitude Body gyroscope signals  by volunteer and activity
      - t_bodygyro_magnitude_std_dev_avg		- average value of standard deviations of magnitude Body gyroscope signals  by volunteer and activity
      - t_bodygyrojerk_magnitude_mean_avg		- average value of mean values of the magnitudes of time body gyroscope Jerk signals by volunteer and acitivity
      - t_bodygyrojerk_magnitude_std_dev_avg		- average value of standard deviations of the magnitudes of time body gyroscope Jerk signals by volunteer and acitivity
      - f_bodyacc_mean_x_avg				        - average value of mean values of frequency domain body acceleration signals in the x direction by volunteer and activity 
      - f_bodyacc_mean_y_avg				        - average value of mean values of frequency domain body acceleration signals in the y direction by volunteer and activity 
      - f_bodyacc_mean_z_avg				        - average value of mean values of frequency domain body acceleration signals in the z direction by volunteer and activity 
      - f_bodyacc_std_dev_x_avg				      - average value of standard deviations frequency domain body acceleration signals in the x direction by volunteer and activity 
      - f_bodyacc_std_dev_y_avg				      - average value of standard deviations frequency domain body acceleration signals in the y direction by volunteer and activity
      - f_bodyacc_std_dev_z_avg				      - average value of standard deviations frequency domain body acceleration signals in the z direction by volunteer and activity
      - f_bodyaccjerk_mean_x_avg			      - average value of mean values of the frequency domain body linear acceleration Jerk signals in the x direction by volunteer and acitivity
      - f_bodyaccjerk_mean_y_avg			      - average value of mean values of the frequency domain body linear acceleration Jerk signals in the y direction by volunteer and acitivity
      - f_bodyaccjerk_mean_z_avg			      - average value of mean values of the frequency domain body linear acceleration Jerk signals in the z direction by volunteer and acitivity
      - f_bodyaccjerk_std_dev_x_avg			    - average value of standard deviations of the frequency domain body linear acceleration Jerk signals in the x direction by volunteer and acitivity
      - f_bodyaccjerk_std_dev_y_avg			    - average value of standard deviations of the frequency domain body linear acceleration Jerk signals in the y direction by volunteer and acitivity
      - f_bodyaccjerk_std_dev_z_avg			    - average value of standard deviations of the frequency domain body linear acceleration Jerk signals in the z direction by volunteer and acitivity
      - f_bodygyro_mean_x_avg				        - average value of mean values of frequency domain Body gyroscope signals in the x direction by volunteer and activity
      - f_bodygyro_mean_y_avg				        - average value of mean values of frequency domain Body gyroscope signals in the y direction by volunteer and activity
      - f_bodygyro_mean_z_avg				        - average value of mean values of frequency domain Body gyroscope signals in the z direction by volunteer and activity
      - f_bodygyro_std_dev_x_avg			      - average value of standard deviations of frequency domain Body gyroscope signals in the x direction by volunteer and activity	
      - f_bodygyro_std_dev_y_avg			      - average value of standard deviations of frequency domain Body gyroscope signals in the y direction by volunteer and activity
      - f_bodygyro_std_dev_z_avg			      - average value of standard deviations of frequency domain Body gyroscope signals in the x direction by volunteer and activity
      - f_bodyacc_magnitude_mean_avg			  - average value of mean values of the magnitude of the frequency domain Body acceleration signals by volunteer and acitivity
      - f_bodyacc_magnitude_std_dev_avg			- average value of standard deviations of the magnitude of the frequency domain Body acceleration signals by volunteer and acitivity
      - f_bodyaccjerk_magnitude_mean_avg		- average value of mean values of the magnitude of the frequency domain Body acceleration Jerk signals by volunteer and acitivity
      - f_bodyaccjerk_magnitude_std_dev_avg		- average value of standard deviations of the magnitude of the frequency domain Body acceleration Jerk signals by volunteer and acitivity
      - f_bodygyro_magnitude_mean_avg			- average value of mean values of magnitude of frequency domain Body gyroscope signals  by volunteer and activity
      - f_bodygyro_magnitude_std_dev_avg		- average value of standard deviations of magnitude of frequency domain Body gyroscope signals  by volunteer and activity
      - f_bodygyrojerk_magnitude_mean_avg		- average value of mean values of the magnitudes of frequency domain body gyroscope Jerk signals by volunteer and acitivity
      - f_bodygyrojerk_magnitude_std_dev_avg		- average value of standard deviations of the magnitudes of frequency domain body gyroscope Jerk signals by volunteer and acitivity
        
    
