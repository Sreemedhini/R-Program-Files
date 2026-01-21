# Given closing prices
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124,
                    128, 130, 129, 131, 135, 134, 136, 137, 140, 138,
                    139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# Calculate daily returns (percentage change)
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100

# Identify days with highest and lowest returns
highest_return_day <- which.max(daily_returns) + 1
lowest_return_day <- which.min(daily_returns) + 1

# Calculate cumulative return over the month
cumulative_return <- (tail(closing_prices, 1) / head(closing_prices, 1) - 1) * 100

# Print results
cat("Daily Returns (%):\n", round(daily_returns, 2), "\n\n")
cat("Day with Highest Return: Day", highest_return_day,
    "(", round(max(daily_returns), 2), "% )\n")
cat("Day with Lowest Return: Day", lowest_return_day,
    "(", round(min(daily_returns), 2), "% )\n\n")
cat("Cumulative Return over the Month:",
    round(cumulative_return, 2), "%\n")


