#  Pakistan E-Commerce Data Analysis & Cleaning Project

This project focuses on performing comprehensive data cleaning, preprocessing, database migration, and exploratory SQL analysis on a large-scale Pakistani e-commerce dataset. The goal is to extract valuable business metrics, understand sales trends, analyze customer behavior, and evaluate order fulfillment.

---

##  Tech Stack & Tools
* **Language:** Python
* **Data Preprocessing & Visualization:** Pandas, NumPy, Matplotlib, Seaborn
* **Database & ORM:** PostgreSQL, pgAdmin 4, SQLAlchemy
* **Environment:** Jupyter Notebook

---

##  Phase 1: Data Cleaning & Preprocessing (Python)

Raw e-commerce datasets often contain structural inconsistencies, missing records, and data type mismatches. The following data-cleaning steps were performed in Python using **Pandas**:

1. **Handling Missing & Duplicate Values:**
   * Removed empty rows/columns and unneeded default index columns.
   * Filled missing `sales_commission_code` values with `'No code'`.
   * Evaluated and handled missing entries across essential features like `status`, `sku`, and `category_name_1`.

2. **Data Type Correction:**
   * Converted numerical identifier columns (`item_id`, `qty_ordered`, `customer_id`, `Year`, `Month`) to `integer` types.
   * Converted date strings (`created_at`, `working_date`) into proper Pandas `datetime` objects.

3. **String Standardization:**
   * Standardized column names and stripped leading/trailing whitespaces from string columns (`status`, `sku`, `payment_method`, `sales_commission_code`, `bi_status`).

4. **Data Filtering & Outlier Removal:**
   * Filtered out invalid transactions where `price` or `qty_ordered` was less than or equal to `0`.
   * Visualized price distribution using **Seaborn boxplots** to detect anomalies and removed extreme outliers to ensure accurate analytical results.

5. **PostgreSQL Database Migration:**
   * Configured **SQLAlchemy** to automatically create the table schema and stream the cleaned dataset (over 580k+ records) directly into a local **PostgreSQL** database (`Ecommerce`).

---

##  Phase 2: SQL Business Analysis & Insights

Using **pgAdmin 4**, a series of business intelligence SQL queries were executed to extract actionable insights:

* **Top Categories by Revenue:** Identified high-revenue generating product categories.
* **Payment Method Popularity & Cancellation Rates:** Evaluated preferred customer payment methods alongside their associated cancellation rates.
* **VIP Customer Identification:** Ranked top customers based on lifetime transaction value and total order count.
* **Monthly Sales & Revenue Growth:** Calculated month-over-month order volume and total revenue trends.
* **Order Status Breakdown & Financial Loss:** Quantified order distribution (Completed, Canceled, Refunded) and computed total lost revenue due to cancellations.
* **Discount Effectiveness:** Categorized transactions into discount brackets (`NO DISCOUNT`, `LOW`, `MEDIUM`, `HIGH`) to evaluate how discounts impact order quantities.
* **Customer Retention Analysis:** Segmented customers into one-time buyers versus repeat customers to measure revenue contribution per segment.

