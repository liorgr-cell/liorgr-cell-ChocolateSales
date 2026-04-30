library(ggplot2)
library(dplyr)

Chocolate_USA_DB <- read.csv ("C:/Users/PC/OneDrive/Final_Chocolate_Master_USA-step 6.csv")

ggplot(Chocolate_USA_DB, aes(x = Boxes.Shipped, y = Clean_Price, color = Product)) +
  geom_point(alpha = 0.5, size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1.2) +
  labs(
    title = "Demand Curve Analysis: Price vs. Quantity",
    subtitle = "Comparison of Chocolate Products Elasticity (2022-2025)",
    x = "Quantity Demanded (Boxes)",
    y = "Unit Price (USD)",
    color = "Product Type"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 11),
    legend.position = "bottom"
  )

ggsave("Demand_Analysis_Graph.png", width = 12, height = 8, dpi = 300)