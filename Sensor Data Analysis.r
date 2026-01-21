# Sensor readings for 5 minutes
temperature <- c(28, 31, 33, 29, 34)
humidity <- c(45, 38, 36, 42, 35)
pressure <- c(1012, 1014, 1015, 1013, 1016)

time <- 1:5

# Calculate average readings
avg_temp <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)

# Identify time intervals
condition_minutes <- which(temperature > 30 & humidity < 40)

# Print results
cat("Average Temperature:", avg_temp, "°C\n")
cat("Average Humidity:", avg_humidity, "%\n")
cat("Average Pressure:", avg_pressure, "hPa\n\n")

cat("Minutes where Temperature > 30°C and Humidity < 40%:\n")
cat(condition_minutes, "\n")

# Plot sensor readings over time
plot(time, temperature, type = "l", xlab = "Time (minutes)", ylab = "Sensor Value")
lines(time, humidity)
lines(time, pressure)


