# Step 1: Install and load required library
install.packages("dplyr")
library(dplyr)

# Step 2: Create Customers dataset
customers <- data.frame(
  CustomerName = c("Alice","Bob","Charlie","David","Eva"),
  Email = c("alice@email.com","bob@email.com",
            "charlie@email.com","david@email.com",
            "eva@email.com")
)

# Step 3: Create Purchases dataset
purchases <- data.frame(
  CustomerName = c("Alice","Charlie","Eva","Frank","Bob"),
  Amount = c(120,200,150,300,180),
  Date = c("2025-02-01","2025-02-05","2025-02-10",
           "2025-02-15","2025-02-18")
)

# Step 4: Left Join
left_result <- left_join(customers, purchases, by = "CustomerName")
View(left_result)

# Step 5: Right Join
right_result <- right_join(customers, purchases, by = "CustomerName")
View(right_result)

# Step 6: Inner Join
inner_result <- inner_join(customers, purchases, by = "CustomerName")
View(inner_result)

# Step 7: Full Join
full_result <- full_join(customers, purchases, by = "CustomerName")
View(full_result)