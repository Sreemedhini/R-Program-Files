# Initialize customer purchases list
customer_purchases <- list(
  Alice = c(200, 150, 300),
  Bob = c(100, 80, 150),
  Charlie = c(250, 300, 100)
)

# Function to add a new customer
add_customer <- function(name, purchases) {
  customer_purchases[[name]] <<- purchases
}

# Function to remove a customer
remove_customer <- function(name) {
  customer_purchases[[name]] <<- NULL
}

# Calculate total purchase for each customer
total_purchases <- sapply(customer_purchases, sum)

# Find highest and lowest total purchases
highest_customer <- names(which.max(total_purchases))
lowest_customer <- names(which.min(total_purchases))

# Print results
cat("Total Purchases:\n")
print(total_purchases)

cat("\nCustomer with Highest Purchase:", highest_customer, "\n")
cat("Customer with Lowest Purchase:", lowest_customer, "\n")






