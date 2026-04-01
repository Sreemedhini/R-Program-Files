#Step1:
# Install packages
install.packages("ggplot2")
install.packages("plotly")

# Load libraries
library(ggplot2)
library(plotly)

#Step2:
# Load dataset
data("iris")
print(iris)

#Step3:
#3.1 Create static scatter plot
p <- ggplot(data = iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Static Scatter Plot",
       x = "Sepal Width",
       y = "Petal Width")

#3.2 Convert to interactive plot
ggplotly(p)

#Step4:
#4.1 Create interactive plot using plotly
plot_ly(data = iris,
        x = ~Sepal.Width,
        y = ~Petal.Width,
        color = ~Species,
        type = "scatter",
        mode = "markers") %>%
  layout(title = "Iris Data Set Visualization",
         xaxis = list(title = "Sepal Width", ticksuffix = " cm"),
         yaxis = list(title = "Petal Width", ticksuffix = " cm"))