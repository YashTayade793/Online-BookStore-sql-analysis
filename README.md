# Online-BookStore-sql-analysis
End-to-end SQL analysis of an online bookstore database using joins, aggregations, window logic, and inventory metrics to derive business insights.
# 📚 Online Book Store Database Analysis (SQL)

## 📌 Project Overview
This project demonstrates the application of relational database concepts and SQL queries to analyze data from an online bookstore. The analysis is structured across two tiers—**Basic Operations** and **Advanced Business Problems**—focusing on extracting meaningful insights regarding inventory management, customer behavior, sales revenue, and product performance.

The dataset models a real-world e-commerce scenario featuring three core tables: `books`, `customers`, and `orders`.

---

## 🗂️ Database Schema & Architecture
The database consists of the following interconnected tables:
* **`books`**: Tracks inventory metadata including `Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, and `Stock`.
* **`customers`**: Stores demographic info including `Customer_ID`, `Name`, `Email`, `City`, and `Country`.
* **`orders`**: Captures transactional logs including `Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, and `Total_Amount`.

---

## 🔍 Key Business Questions Addressed

### Part 1: Core Operations & Filtering
1. **Genre Segmentation:** Extracted all titles categorized under 'Fiction'.
2. **Historical Filtering:** Identified books published post-1950.
3. **Geographic Distribution:** Filtered user demographics specifically targeting customers based in Canada.
4. **Time-Series Analysis:** Isolated transaction volumes specifically for November 2023.
5. **Inventory Aggregation:** Calculated total aggregate stock across the entire catalog.
6. **Value Tracking:** Identified the highest-priced book item in stock.
7. **Bulk Purchases:** Filtered orders containing multiple quantities of a single book.
8. **High-Value Orders:** Isolated transactions yielding more than $20 in revenue.
9. **Financial Revenue:** Summarized total gross sales revenue, cleanly rounded to two decimal places.

### Part 2: Advanced Analytical Queries & Joins

#### 📈 Total Units Sold by Genre
Aggregates sales performance by calculating physical volume metrics across different book genres.
```sql
SELECT B.Genre,
       SUM(O.Quantity) AS Total_Books_Sold
FROM orders AS O
INNER JOIN books AS B
   ON O.Book_ID = B.Book_ID
GROUP BY B.Genre;
