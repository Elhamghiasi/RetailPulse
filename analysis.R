# Tiny Sales Analysis Project
# This project uses only base R.

# Read the dataset.
sales <- read.csv("data/sales.csv")

# Calculate revenue for each product.
sales$revenue <- sales$units_sold * sales$price

# Calculate simple business results.
total_revenue <- sum(sales$revenue)
average_revenue <- mean(sales$revenue)
best_product <- sales$product[which.max(sales$revenue)]

# Display the results in the console.
print(sales)
cat("\nTotal revenue: $", total_revenue, "\n", sep = "")
cat("Average revenue per product: $", average_revenue, "\n", sep = "")
cat("Best-performing product: ", best_product, "\n", sep = "")

# Save the completed table.
write.csv(sales, "sales_results.csv", row.names = FALSE)

# Create and save a simple bar chart.
png("sales_chart.png", width = 900, height = 600)
barplot(
  sales$revenue,
  names.arg = sales$product,
  main = "Revenue by Product",
  xlab = "Product",
  ylab = "Revenue ($)",
  col = "steelblue",
  las = 2
)
dev.off()
