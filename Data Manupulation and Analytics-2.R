# Step 1: Install and Load Package
install.packages("dplyr")
library(dplyr)

# Load dataset
data("starwars", package = "dplyr")
View(starwars)

# Step 2: Select relevant columns
starwars_data <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

View(starwars_data)

# Step 3: Filter species with more than two characters
filtered_data <- starwars_data %>%
  group_by(species) %>%
  filter(n() > 2)

# Step 4: Create new columns
processed_data <- filtered_data %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 50 ~ "Underweight",
      mass >= 50 & mass < 80 ~ "Normal",
      mass >= 80 & mass < 100 ~ "Overweight",
      mass >= 100 ~ "Obese",
      TRUE ~ "Unknown"
    )
  )

View(processed_data)

# Step 5: Average height for species-gender
avg_height <- processed_data %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height_m, na.rm = TRUE))

View(avg_height)

# Step 6: Top three species with highest average height
top_species <- avg_height %>%
  group_by(species) %>%
  summarize(avg_height = mean(avg_height, na.rm = TRUE)) %>%
  arrange(desc(avg_height)) %>%
  slice_head(n = 3)

View(top_species)