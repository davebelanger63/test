run_analysis <- function(x){
      setwd ("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/test/")
      library(reshape2)      
      
      act_lbl <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/activity_labels.txt")
            
       x_tst <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/test/X_test.txt")
       x_tst1 <- x_tst[,c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161,
                     162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 
                     271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)]
       y_tst <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/test/y_test.txt")
      
       activity <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
       y_tst$Activity <- activity[y_tst$V1]

       sbj_tst <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/test/subject_test.txt")
 
       y_sbj_x_tst <- cbind(y_tst$Activity,sbj_tst,x_tst1)
       colnames(y_sbj_x_tst)[1] <- "Activity"
             
       x_trn <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/train/X_train.txt")
       x_trn1 <- x_trn[,c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161,
                          162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 
                          271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)]
       y_trn <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/train/y_train.txt")
       y_trn$Activity <- activity[y_trn$V1]
      
       sbj_trn <- read.table("C:/Users/Dave/AppData/wk3Data/UCI HAR Dataset/train/subject_train.txt")
       
       y_sbj_x_trn <- cbind(y_trn$Activity,sbj_trn,x_trn1)
      colnames(y_sbj_x_trn)[1] <- "Activity"
       
       y_sbj_x <- rbind(y_sbj_x_tst, y_sbj_x_trn)
      head(y_sbj_x, n=100)
       
       colnames(y_sbj_x)[2] <- "Subject"
       colnames(y_sbj_x)[3] <- "Avg_tBodyAcc-mean()-X"
       colnames(y_sbj_x)[4] <- "Avg_tBodyAcc-mean()-Y"
       colnames(y_sbj_x)[5] <- "Avg_tBodyAcc-mean()-Z"
       colnames(y_sbj_x)[6] <- "Avg_tBodyAcc-std()-X"
       colnames(y_sbj_x)[7] <- "Avg_tBodyAcc-std()-Y"
       colnames(y_sbj_x)[8] <- "Avg_tBodyAcc-std()-Z"
       colnames(y_sbj_x)[9] <- "Avg_tGravityAcc-mean()-X"
      colnames(y_sbj_x)[10] <- "Avg_tGravityAcc-mean()-Y"
      colnames(y_sbj_x)[11] <- "Avg_tGravityAcc-mean()-Z"
      colnames(y_sbj_x)[12] <- "Avg_tGravityAcc-std()-X"
      colnames(y_sbj_x)[13] <- "Avg_tGravityAcc-std()-Y"
      colnames(y_sbj_x)[14] <- "Avg_tGravityAcc-std()-Z"
      colnames(y_sbj_x)[15] <- "Avg_tBodyAccJerk-mean()-X"
      colnames(y_sbj_x)[16] <- "Avg_tBodyAccJerk-mean()-Y"
      colnames(y_sbj_x)[17] <- "Avg_tBodyAccJerk-mean()-Z"
      colnames(y_sbj_x)[18] <- "Avg_tBodyAccJerk-std()-X"
      colnames(y_sbj_x)[19] <- "Avg_tBodyAccJerk-std()-Y"
      colnames(y_sbj_x)[20] <- "Avg_tBodyAccJerk-std()-Z"
      colnames(y_sbj_x)[21] <- "Avg_tBodyGyro-mean()-X"
      colnames(y_sbj_x)[22] <- "Avg_tBodyGyro-mean()-Y"
      colnames(y_sbj_x)[23] <- "Avg_tBodyGyro-mean()-Z"
      colnames(y_sbj_x)[24] <- "Avg_tBodyGyro-std()-X"
      colnames(y_sbj_x)[25] <- "Avg_tBodyGyro-std()-Y"
      colnames(y_sbj_x)[26] <- "Avg_tBodyGyro-std()-Z"
      colnames(y_sbj_x)[27] <- "Avg_tBodyGyroJerk-mean()-X"
      colnames(y_sbj_x)[28] <- "Avg_tBodyGyroJerk-mean()-Y"
      colnames(y_sbj_x)[29] <- "Avg_tBodyGyroJerk-mean()-Z"
      colnames(y_sbj_x)[30] <- "Avg_tBodyGyroJerk-std()-X"
      colnames(y_sbj_x)[31] <- "Avg_tBodyGyroJerk-std()-Y"
      colnames(y_sbj_x)[32] <- "Avg_tBodyGyroJerk-std()-Z"
      colnames(y_sbj_x)[33] <- "Avg_tBodyAccMag-mean()"
      colnames(y_sbj_x)[34] <- "Avg_tBodyAccMag-std()"
      colnames(y_sbj_x)[35] <- "Avg_tGravityAccMag-mean()"
      colnames(y_sbj_x)[36] <- "Avg_tGravityAccMag-std()"
      colnames(y_sbj_x)[37] <- "Avg_tBodyAccJerkMag-mean()"
      colnames(y_sbj_x)[38] <- "Avg_tBodyAccJerkMag-std()"
      colnames(y_sbj_x)[39] <- "Avg_tBodyGyroMag-mean()"
      colnames(y_sbj_x)[40] <- "Avg_tBodyGyroMag-std()"
      colnames(y_sbj_x)[41] <- "Avg_tBodyGyroJerkMag-mean()"
      colnames(y_sbj_x)[42] <- "Avg_tBodyGyroJerkMag-std()"
      colnames(y_sbj_x)[43] <- "Avg_fBodyAcc-mean()-X"
      colnames(y_sbj_x)[44] <- "Avg_fBodyAcc-mean()-Y"
      colnames(y_sbj_x)[45] <- "Avg_fBodyAcc-mean()-Z"
      colnames(y_sbj_x)[46] <- "Avg_fBodyAcc-std()-X"
      colnames(y_sbj_x)[47] <- "Avg_fBodyAcc-std()-Y"
      colnames(y_sbj_x)[48] <- "Avg_fBodyAcc-std()-Z"
      colnames(y_sbj_x)[49] <- "Avg_fBodyAccJerk-mean()-X"
      colnames(y_sbj_x)[50] <- "Avg_fBodyAccJerk-mean()-Y"
      colnames(y_sbj_x)[51] <- "Avg_fBodyAccJerk-mean()-Z"
      colnames(y_sbj_x)[52] <- "Avg_fBodyAccJerk-std()-X"
      colnames(y_sbj_x)[53] <- "Avg_fBodyAccJerk-std()-Y"
      colnames(y_sbj_x)[54] <- "Avg_fBodyAccJerk-std()-Z"
      colnames(y_sbj_x)[55] <- "Avg_fBodyGyro-mean()-X"
      colnames(y_sbj_x)[56] <- "Avg_fBodyGyro-mean()-Y"
      colnames(y_sbj_x)[57] <- "Avg_fBodyGyro-mean()-Z"
      colnames(y_sbj_x)[58] <- "Avg_fBodyGyro-std()-X"
      colnames(y_sbj_x)[59] <- "Avg_fBodyGyro-std()-Y"
      colnames(y_sbj_x)[60] <- "Avg_fBodyGyro-std()-Z"
      colnames(y_sbj_x)[61] <- "Avg_fBodyAccMag-mean()"
      colnames(y_sbj_x)[62] <- "Avg_fBodyAccMag-std()"
      colnames(y_sbj_x)[63] <- "Avg_fBodyBodyAccJerkMag-mean()"
      colnames(y_sbj_x)[64] <- "Avg_fBodyBodyAccJerkMag-std()"
      colnames(y_sbj_x)[65] <- "Avg_fBodyBodyGyroMag-mean()"
      colnames(y_sbj_x)[66] <- "Avg_fBodyBodyGyroMag-std()"
      colnames(y_sbj_x)[67] <- "Avg_fBodyBodyGyroJerkMag-mean()"
      colnames(y_sbj_x)[68] <- "Avg_fBodyBodyGyroJerkMag-std()"
      

      y_sbj_x_tmp <- melt(y_sbj_x,id = c("Activity","Subject"))
      
      y_sbj_x_smry <- dcast(y_sbj_x_tmp, Activity + Subject ~ variable,mean)
      tail(y_sbj_x_smry)

      write.table(y_sbj_x_smry, file = "run_analysis_smry.txt", quote = FALSE, sep = "\t", row.names = FALSE)
}
