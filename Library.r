# Initialize book borrowing system
book_borrowers <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# Function to add a new book with borrowers
add_book <- function(book_name, borrowers) {
  book_borrowers[[book_name]] <<- borrowers
}

# Function to remove a book from the system
remove_book <- function(book_name) {
  book_borrowers[[book_name]] <<- NULL
}

# Calculate total number of borrowers for each book
total_borrowers <- sapply(book_borrowers, length)

# Find book with highest and lowest number of borrowers
highest_borrowed_book <- names(which.max(total_borrowers))
lowest_borrowed_book <- names(which.min(total_borrowers))

# Print results
cat("Total Borrowers for Each Book:\n")
print(total_borrowers)

cat("\nBook with Highest Number of Borrowers:", highest_borrowed_book, "\n")
cat("Book with Lowest Number of Borrowers:", lowest_borrowed_book, "\n")


# Print results
cat("Total Purchases:\n")
print(total_purchases)

cat("\nCustomer with Highest Purchase:", highest_customer, "\n")
cat("Customer with Lowest Purchase:", lowest_customer, "\n")






