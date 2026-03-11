# Step 1: Install and load required package
install.packages("tidyr")
library(tidyr)

# Step 2: Create wide-format dataset
wide_data <- data.frame(
  ID = c(1,2,3),
  Year2019 = c(10,15,20),
  Year2020 = c(12,18,24)
)

View(wide_data)

# Step 3: Convert Wide → Long format
long_data <- gather(wide_data, key = "Year", value = "Value", Year2019, Year2020)

View(long_data)

# Step 4: Create long-format dataset
long_dataset <- data.frame(
  ID = c(1,1,2,2,3,3),
  Year = c(2019,2020,2019,2020,2019,2020),
  Value = c(10,12,15,18,20,24)
)

View(long_dataset)

# Step 5: Convert Long → Wide format
wide_dataset <- spread(long_dataset, key = Year, value = Value)

View(wide_dataset)