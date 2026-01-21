# Initialize team scores
team_scores <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# Function to add a new team with scores
add_team <- function(team_name, scores) {
  team_scores[[team_name]] <<- scores
}

# Function to remove a team
remove_team <- function(team_name) {
  team_scores[[team_name]] <<- NULL
}

# Calculate average score for each team
average_scores <- sapply(team_scores, mean)

# Rank teams based on average scores (highest to lowest)
team_ranking <- sort(average_scores, decreasing = TRUE)

# Print results
cat("Average Scores of Teams:\n")
print(average_scores)

cat("\nTeam Ranking Based on Average Scores:\n")
print(team_ranking)






