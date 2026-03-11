# Step 1: Create vectors

PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010")

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair",
          "Eshwar Rao","Farida Sheikh","Gaurav Kumar","Harini Krishnan",
          "Ishita S","Jatin Verma")

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology",
                "Cardiology","Endocrinology","Neurology","Pulmonology",
                "Cardiology","Endocrinology")

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma",
               "Hypertension","Thyroid Disorder","Epilepsy","COPD",
               "Arrhythmia","Type-1 Diabetes")

Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)

Test3_Score <- Test3

# Step 2: Create Data Frame
patients <- data.frame(
  PatientID, Name, Department, Diagnosis,
  Test1, Test2, Test3, Test4, Test3_Score,
  stringsAsFactors = FALSE
)

# Display structure and first rows
str(patients)
head(patients)

# Step 3: Patient-level Sum and Average
patients$Sum <- rowSums(patients[,c("Test1","Test2","Test3","Test4")])
patients$Average <- round(patients$Sum/4,2)

# Step 4: Rank based on Sum
patients$Rank <- rank(-patients$Sum, ties.method = "min")

# Display full dataset
patients

# Sorted by rank
patients_ranked <- patients[order(patients$Rank), ]
patients_ranked

# Step 5: Test-wise average
test_cols <- c("Test1","Test2","Test3","Test4")
test_wise_avg <- colMeans(patients[,test_cols], na.rm = TRUE)
test_wise_avg

# Step 6: Department-wise averages
dept_test_avg <- aggregate(
  patients[,test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)

dept_test_avg$Overall_Average <- rowMeans(dept_test_avg[,test_cols])

dept_test_avg