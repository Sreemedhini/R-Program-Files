# Function to get floating point input
getfloatinpt <- function()
{
  input <- readline(prompt = "Enter a number: ")
  return(as.numeric(input))
}

# Test cases
cat("Test Case 1: User input is '42'\n")
result1 <- as.numeric("42")
cat("Output:", result1, "\n\n")

cat("Test Case 2: User input is '100'\n")
result2 <- as.numeric("100")
cat("Output:", result2, "\n\n")

cat("Test Case 3: User input is '7'\n")
result3 <- as.numeric("7")
cat("Output:", result3, "\n")
