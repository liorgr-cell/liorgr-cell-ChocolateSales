# liorgr-cell-ChocolateSales
Multi-year economic analysis of US chocolate sales (Kaggle) using SQL, R, and Excel. Focusing on price elasticity.
# 📊 US Chocolate Market Analysis: Price Elasticity of Demand

## 👤 About Me
Hi, I'm Lior, a first-year Economics undergraduate student at Ben-Gurion University of the Negev. I am passionate about data analysis, applying economic theories to real-world datasets, and translating raw numbers into actionable business insights.

## 🎯 Project Objective
The primary goal of this analysis was to take a broad dataset of global chocolate sales and extract meaningful data to understand the **Price Elasticity of Demand**. By doing so, I aimed to compare how consumers react to price changes across different types of chocolate relative to one another.

## 🌍 Scope and Focus
While the initial dataset contained a massive variety of chocolates across multiple countries, I strategically narrowed the focus to ensure a precise and relevant analysis:
* **Market:** United States (US) market only.
* **Products:** Selected 5 distinct categories to highlight contrasting elasticities:
  1. Drinking Coco
  2. 85% Dark Chocolate
  3. 99% Dark Chocolate
  4. 70% Dark Chocolate
  5. Peanut Butter Cubes

## 🛠️ Data Processing & Methodology (SQL)
1. **Extraction & Cleaning:** I extracted the data from the main database using SQL. A critical step was identifying extreme outliers in unit prices. I refined and cleaned the data to significantly reduce price variance, ensuring a reliable foundation for elasticity modeling.
2. **Master Table Aggregation:** After cleaning and normalizing the individual product data, I merged all the processed datasets into a single, structured **Master Table** using `UNION ALL`. This streamlined the workflow for the visualization phase.

## 📈 Visualization (R & ggplot2)
Using R, I transitioned from the SQL Master Table to a clear visual representation of the demand curves. The graph is specifically designed to emphasize the differences in price elasticities between the products, visually distinguishing steep (inelastic) curves from shallow (elastic) ones.

## 💡 Key Conclusions
* **The "Normal Good" Behavior:** The analysis revealed a clear pattern: the more a product is perceived as a standard, "normal" daily good (e.g., Drinking Coco), the smaller the change in quantity demanded when prices increased. Consumers absorbed the price hikes with minimal drop in purchasing volume (Highly Inelastic).
* **Price Sensitivity:** Conversely, more specific or premium chocolates showed higher sensitivity, where price increases led to sharper drops in demand.

## 🧠 Real-World Deviations & The Snob Effect
While the visualization follows the fundamental Law of Demand, it's crucial as an economic analyst to acknowledge real-world behavioral deviations:
* **The Snob Effect:** In certain premium categories (like 99% Dark Chocolate), pure rational elasticity might not always apply. Markets can experience the "Snob Effect" (or Veblen-good behavior), where a higher price might occasionally *increase* or sustain demand because the high cost signals prestige, exclusivity, and status to a specific consumer niche.

## 🛠️ The Data Journey & Workflow

The raw dataset for this project was initially sourced from **Kaggle**. 
📂 [Click here to view the dataset file used in this project](./Chocolate_Sales.csv)

Below is a step-by-step breakdown of how the data was extracted, cleaned, and transformed for this economic analysis:
### Step 1: Isolating the US Market Data
The original Kaggle dataset contained sales records from multiple countries worldwide. To ensure the price elasticity model isn't skewed by foreign exchange rates or differing cultural consumption habits, my very first step was to filter the "noise" and extract only the data relevant to the **United States**.
```sql
-- Creating a dedicated working table strictly for the US market
CREATE TABLE USA_Chocolate_Sales AS
SELECT *
FROM Global_Chocolate_Sales
WHERE Country = 'USA';

### Step 2: Data Standardization & Feature Engineering
Raw datasets often contain formatting that prevents immediate mathematical operations. Instead of overwriting the original raw data, I followed data integrity best practices by creating new, clean columns (`Clean_Price` and `Formatted_Date`).

The original price column contained text characters (the `$` sign), preventing numeric calculations. I used SQL string manipulation to strip this symbol and convert it to a precise numeric format.
```sql
-- Step 2a: Adding new columns to preserve the original raw data
ALTER TABLE USA_Chocolate_Sales
ADD Clean_Price DECIMAL(10,2),
ADD Formatted_Date DATE;

-- Step 2b: Populating the new columns with standardized data
UPDATE USA_Chocolate_Sales
SET 
    -- Removing the '$' symbol and casting as a decimal
    Clean_Price = CAST(REPLACE(Unit_Price, '$', '') AS DECIMAL(10,2)),
    
    -- Formatting the date to a standard SQL DATE structure
    Formatted_Date = CAST(Date AS DATE);
