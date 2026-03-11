# Step 1: Create vectors

RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma",
          "Esha Nair","Farhan Khan","Gayathri Raj","Harish Kumar",
          "Ishita Menon","Jai Verma")

Programme <- c("B.Tech","B.Tech","B.Tech","B.Tech","B.Tech",
               "B.Tech","B.Tech","B.Tech","B.Tech","B.Tech")

Specialization <- c("CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT")

Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

# Step 2: Create Data Frame
students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)

str(students)
head(students)

# Step 3: Write to CSV
write.csv(students, "students_input.csv", row.names = FALSE, na = "")

# Step 4: Read CSV
students_in <- read.csv("students_input.csv", stringsAsFactors = FALSE)

students_in[,c("Assess1","Assess2","Assess3","Assess4")] <-
  lapply(students_in[,c("Assess1","Assess2","Assess3","Assess4")], as.numeric)

# Step 5: Per-student analytics
students_in$Total <- rowSums(students_in[,c("Assess1","Assess2","Assess3","Assess4")])
students_in$Average <- round(students_in$Total/4,2)

students_in$Rank <- rank(-students_in$Total, ties.method="min")

students_ranked <- students_in[order(students_in$Rank, students_in$RegNo),]

write.csv(students_ranked, "students_by_rank.csv", row.names = FALSE)

# Step 6: Assessment-wise averages
assess_cols <- c("Assess1","Assess2","Assess3","Assess4")

assess_avg <- colMeans(students_in[,assess_cols], na.rm = TRUE)

assess_df <- data.frame(
  Assessment = names(assess_avg),
  Average = assess_avg
)

write.csv(assess_df, "assessment_wise_averages.csv", row.names = FALSE)

# Step 7: Specialization-wise averages
spec_avg <- aggregate(
  students_in[,assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

spec_avg$Overall_Average <- rowMeans(spec_avg[,assess_cols])

write.csv(spec_avg, "specialization_wise_averages.csv", row.names = FALSE)

spec_avg