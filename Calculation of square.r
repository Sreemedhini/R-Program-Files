# Function to calculate square
calculate_square <- function(number)
{
  return(number^2)
}

# Test inputs
num1 <- 4
num2 <- -3
num3 <- 0
num4 <- 5.7

# Print results
cat("Square of 4:", calculate_square(num1), "\n")
cat("Square of -3:", calculate_square(num2), "\n")
cat("Square of 0:", calculate_square(num3), "\n")
cat("Square of 5.7:", calculate_square(num4), "\n")
