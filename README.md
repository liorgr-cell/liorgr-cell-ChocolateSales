# liorgr-cell-ChocolateSales
Multi-year economic analysis of global chocolate sales (Kaggle) using SQL, R, and Excel. Focusing on price elasticity and TR optimization.
# Global Confectionery Market Analysis: Economic Modeling & Data Engineering
# Consumer Behavior Analysis: WTP & Price Elasticity Modeling

## 👤 About the Author
I am a **First-year Economics student at Ben-Gurion University of the Negev**. This project bridges the gap between theoretical microeconomic concepts and data-driven market analysis. I specialize in using technical tools to quantify consumer behavior, focusing on demand functions and market characterization.

## 🎯 Research Objective: Mapping the Consumer Mindset
The primary goal of this project is to estimate **Willingness to Pay (WTP)** and analyze **Price Elasticity of Demand** across various product categories. 

Rather than focusing on corporate revenue trends, this study deep-dives into:
* **Demand Sensitivity:** Quantifying how consumers react to price fluctuations in different market segments.
* **Product Characterization:** Using elasticity coefficients to distinguish between **Luxury Goods** (High Elasticity) and **Necessity/Normal Goods** (Low Elasticity).
* **WTP Thresholds:** Identifying the "Price Ceiling" where demand collapses for specific products.

## 🚀 Methodology: From Raw Data to Deep Simulation
The foundational data for this study was sourced from **Kaggle** (`Chocolate_Sales.csv`). 

**The Decision to Augment:**
During the initial audit, it was determined that the raw data provided an insufficient snapshot for a deep-dive study on elasticity. To conduct a robust investigation, I **augmented the dataset** through a controlled SQL-based simulation. This allowed for:
* **Longitudinal Analysis:** Creating a 4-year market progression (2022-2025).
* **Price Variation:** Generating enough data points to observe WTP shifts under simulated inflationary conditions.

**You can view the raw dataset [here](./Chocolate_Sales.csv).**

## 🔍 Data Audit & Technical Challenges
Before modeling, the raw data required a rigorous cleaning pipeline to resolve the following hurdles:
* **Currency Formatting:** Prices were stored as strings with currency symbols (e.g., `$12.50`), preventing mathematical processing.
* **Date Inconsistency:** Reformatting `DD/MM/YYYY` to ISO standard (`YYYY-MM-DD`) to enable temporal logic and simulation.
* **Type Casting:** Explicitly converting text objects into `REAL` and `INTEGER` types to ensure data integrity during high-precision calculations.

## 🛠 Tech Stack
* **SQL (SQLite):** Used for data engineering, cleaning, and creating the augmented research environment.
* **R:** Employed for statistical computation of elasticity coefficients and visualization of demand curves.
* **Microsoft Excel:** Utilized for cross-platform data validation and preliminary descriptive statistics.

## 📁 Repository Structure
* `/data`: Contains the raw `Chocolate_Sales.csv` and the augmented research data.
* `/sql_scripts`: SQL logic for data transformation, WTP simulation, and elasticity calculations.
* `/r_visuals`: (Work in Progress) R scripts for plotting demand curves and WTP distributions.
