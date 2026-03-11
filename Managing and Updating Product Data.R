# Step 1: Install and load jsonlite package
install.packages("jsonlite")
library(jsonlite)

# Step 2: Set working directory
setwd("path_to_your_directory")

# Step 3: Read existing inventory JSON file
inventory <- fromJSON("inventory.json")

print("Existing Inventory:")
print(inventory)

# Step 4: Create new product
new_product <- data.frame(
  product_id = 105,
  name = "Wireless Mouse",
  category = "Electronics",
  price = 799,
  stock = 50
)

# Step 5: Add new product to inventory
updated_inventory <- rbind(inventory, new_product)

# Step 6: Convert updated inventory to JSON format
json_data <- toJSON(updated_inventory, pretty = TRUE)

# Step 7: Write updated JSON to new file
write(json_data, file = "updated_inventory.json")

# Step 8: Verify updated inventory
verified_data <- fromJSON("updated_inventory.json")

print("Updated Inventory:")
print(verified_data)