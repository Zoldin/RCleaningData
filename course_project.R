      #in the R working directory please copy  UCI HAR dataset that can be downloaded from 
      #https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions
      #please extract zip file on the file location where  an R working directory is set
      #working directory can be checked with getwd()  command
      #if UCI HAR data set exists on you working directory you can sumbit the code


      # import the train data set
X_train<-read.table('./UCI HAR Dataset/train/X_train.txt')

      #check number of observations for data set subject_train and number of columns 
str(X_train)
dim(X_train)

      #import volunteer id's
subject_train<-read.table('./UCI HAR Dataset/train/subject_train.txt')

      #check number of observations for data set subject_train and number of columns 
str(subject_train)
dim(subject_train)

names(subject_train)<-c("volunteer_id");

      #import target variable(activity id)
y_train<-read.table('./UCI HAR Dataset/train/y_train.txt')

      #check number of observations for data set y_train and number of columns 
str(y_train)
dim(y_train)

names(y_train)<-c("activity") #---> rename activity label

      # add variable volunteer_id (from data set subject_train) and activity (from y_train data set) to data set X_train
      # all variables are saved in data set train_final
train_final <-cbind(X_train,subject_train,y_train)

      #check number of observations for data set train_final
dim(train_final)


      # import the test data set

X_test<-read.table('./UCI HAR Dataset/test/X_test.txt')

      #check number of observations for data set X_test and number of columns 
str(X_test)
dim(X_test)

      #import volunteer id's
subject_test<-read.table('./UCI HAR Dataset/test/subject_test.txt')

      #check number of observations for data set subject_test and number of columns 
str(subject_test)
dim(subject_test)

names(subject_test)<-c("volunteer_id");


      #import target variable(activity id)
y_test<-read.table('./UCI HAR Dataset/test/y_test.txt')

      #check number of observations for data set y_test and number of columns
str(y_test)
dim(y_test)

names(y_test)<-c("activity");


      # add variable volunteer_id (from data set subject_test) and activity (from y_test data set) to data set X_test
      # all variables are saved in data set test_final
test_final <-cbind(X_test,subject_test,y_test)

      #check number of observations for data set train_final
str(test_final)


      # merge data sets train_final and test_final
      # merge is done with rbind
final_data_set<- rbind(train_final,test_final)

dim(final_data_set)

      # import variable names
variable_names<-read.table('./UCI HAR Dataset/features.txt',stringsAsFactors=FALSE)

      # rename variables in final data sets with names from data set variable_names.
names(final_data_set)<- c(variable_names$V2,"volunteer_id","activity")

      # choose only variables with mean and std
      # regular expressions are used 
      # only names with mean and std are taken
      # if in a variable name with mean angle stands on the beggining exlude that from further selection
      # if in a variable name with mean Freq stands exclude that from further selection
var_name_subset<- grep("^[^angle](.*)mean[^Freq]|std",variable_names$V2,value=TRUE,ignore.case=TRUE)

      #only variables with names that are represented in a var name subset are included in a data set
final_data_set_subset<-subset(final_data_set, select=c(as.character(var_name_subset),"volunteer_id","activity"))

      #load activity names from activity_labels.txt 
activity_descriptions<-read.table('./UCI HAR Dataset/activity_labels.txt');

names(activity_descriptions)<-c("activity_id","activity_label");

    #redefine activity variable
    #integer value were replaced with activity labels
    #factor function is used
    #labels from activity_descriptions data set were used
final_data_set_subset$activity <-factor(final_data_set_subset$activity,ordered=TRUE,labels=activity_descriptions$activity_label);


nondescriptive_var_names<-names(final_data_set_subset)

      #variable names transaformation
      #use descritpive names
      # std() and mean() were replaced without brackets
      # - was replaced with _
      # BodyBody was replaced with Body
      # Mag was replaced with magnitude
      # f(for FFT transformations) and t(for in time) at the beggining were replaced with f_ ie t_
      # upper cases were replaced with lower cases

nondescriptive_var_names<-gsub("mean\\(\\)","mean",nondescriptive_var_names)
nondescriptive_var_names<-gsub("std\\(\\)","std_dev",nondescriptive_var_names)
nondescriptive_var_names<-gsub("-","_",nondescriptive_var_names);
nondescriptive_var_names<-gsub("BodyBody","Body",nondescriptive_var_names);
nondescriptive_var_names<-gsub("Mag","_magnitude",nondescriptive_var_names);
nondescriptive_var_names<-gsub("^f","f_",nondescriptive_var_names);
nondescriptive_var_names<-gsub("^t","t_",nondescriptive_var_names);
nondescriptive_var_names<-tolower(nondescriptive_var_names);

    #label column names with proper names
names(final_data_set_subset)<-c(nondescriptive_var_names);

str(names(final_data_set_subset))

    #for each volunteer_id and activity we are calculatin average value for each numeric variable in a data set
    #aggregate function was used
    #parameters are final_data_set_subset. Mean values were calculated for each volunteer_id and activity (by statement)
    #mean values are calculated for each variable in final_data_set_subset (for activity and volunteer_id we are not calculating mean,
    #those are group by columns)

data_set_mean<-aggregate(final_data_set_subset[!names(final_data_set_subset)  %in% c("activity","volunteer_id")], 
             by=list(final_data_set_subset$volunteer_id,final_data_set_subset$activity),FUN=mean, na.rm=TRUE)

    #at the end we will rename variables - we'll add avg at the end of a variable name so that we know that those values are
    #avergaes values
names(data_set_mean)<-paste(names(data_set_mean),c("_avg"),sep="")

    #first and the second columns are volunteer_id and activity so we will rename those two columns
names(data_set_mean)[1]<-c("volunteer_id");
names(data_set_mean)[2]<-c("activity");


