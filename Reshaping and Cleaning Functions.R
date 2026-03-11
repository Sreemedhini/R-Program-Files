# Step 1: Install and load package
install.packages("tidyr")
library(tidyr)

# Step 2: Create messy dataset
messy_data <- data.frame(
  ID = c(1,2,3,4),
  Name_Age = c("Alice_25","Bob_30","Charlie_28","David_35"),
  Year2019 = c(10, NA, 20, 25),
  Year2020 = c(12, 18, NA, 28),
  City = c("NY","LA","Chicago","Houston")
)

# Step 3: Separate combined column
clean_data <- separate(messy_data, Name_Age, into=c("Name","Age"), sep="_")

# Step 4: Wide → Long transformation
long_data <- gather(clean_data, key="Year", value="Value", Year2019, Year2020)

# Step 5: Fill missing values
long_data <- fill(long_data, Name, .direction="down")

# Step 6: Remove missing values
long_data <- drop_na(long_data)

# Step 7: Unite columns
combined_data <- unite(long_data, "Name_City", Name, City, sep="_")

# Step 8: Long → Wide transformation
final_data <- spread(combined_data, key=Year, value=Value)

View(final_data)