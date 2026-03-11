# Step 1: Create vectors

BranchID <- c("BR001","BR002","BR003","BR004","BR005",
              "BR006","BR007","BR008","BR009","BR010")

BranchName <- c("Vellore Town","Chennai Central","Mumbai Andheri",
                "Pune Hinjewadi","Delhi Karol Bagh","Noida Sector 18",
                "Kolkata Park St","Hyderabad Hitech",
                "Ahmedabad CG Rd","Jaipur MI Road")

Region <- c("South","South","West","West","North",
            "North","East","South","West","North")

Segment <- c("Grocery","Electronics","Grocery","Home","Apparel",
             "Electronics","Grocery","Home","Apparel","Home")

Q1 <- c(120,140,110,95,150,132,105,128,115,108)
Q2 <- c(115,150,118,100,142,138,107,131,120,112)
Q3 <- c(130,145,122,108,155,136,112,134,125,118)
Q4 <- c(125,160,120,112,158,140,115,137,129,121)

Q3_Sales <- Q3

# Step 2: Create data frame
branches <- data.frame(
  BranchID, BranchName, Region, Segment,
  Q1, Q2, Q3, Q4, Q3_Sales,
  stringsAsFactors = FALSE
)

str(branches)
head(branches)

# Step 3: Write to CSV
write.csv(branches, "branches_input.csv", row.names = FALSE, na = "")

# Step 4: Read CSV
branches_in <- read.csv("branches_input.csv", stringsAsFactors = FALSE)

# Ensure numeric columns
branches_in[,c("Q1","Q2","Q3","Q4")] <- 
  lapply(branches_in[,c("Q1","Q2","Q3","Q4")], as.numeric)

# Step 5: Per-branch analytics
branches_in$Sum <- rowSums(branches_in[,c("Q1","Q2","Q3","Q4")])
branches_in$Average <- round(branches_in$Sum/4,2)
branches_in$Rank <- rank(-branches_in$Sum, ties.method="min")

branches_ranked <- branches_in[order(branches_in$Rank, branches_in$BranchID),]

write.csv(branches_ranked, "branches_by_rank.csv", row.names = FALSE)

# Step 6: Quarter-wise averages
test_cols <- c("Q1","Q2","Q3","Q4")

quarter_avg <- colMeans(branches_in[,test_cols], na.rm=TRUE)

quarter_df <- data.frame(
  Quarter = names(quarter_avg),
  Average = quarter_avg
)

write.csv(quarter_df, "quarter_wise_averages.csv", row.names = FALSE)

# Step 7: Region-wise averages
region_avg <- aggregate(
  branches_in[,test_cols],
  by=list(Region = branches_in$Region),
  FUN=function(x) mean(x, na.rm=TRUE)
)

region_avg$Overall_Average <- rowMeans(region_avg[,test_cols])

write.csv(region_avg, "region_wise_averages.csv", row.names = FALSE)

region_avg