# Walmart Sales Data Analysis

![Project Pipeline](https://github.com/najirh/Walmart_SQL_Python/blob/main/walmart_project-piplelines.png)

## Project Overview
This project involves analyzing Walmart's sales data to answer several business-related questions using SQL and Python. 
The dataset contains transactional data, including branch details, product categories, payment methods, and ratings. 
The analysis is structured around solving specific queries to derive insights about sales trends, customer behavior, 
and operational performance.

---

##  Steps Followed In This Project

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, Jupyter Notebook, SQL (MySQL and PostgreSQL)
   - **Goal**: Created a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtained Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Placed and downloaded `kaggle.json` file in my local `.kaggle` folder.
      - Used the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.
    
### 3. Download Walmart Sales Data
   - **Data Source**: Used the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)

### 4. Install Required Libraries and Load Data
   - **Libraries**: Installed necessary Python libraries using:
     ```bash
     pip install pandas
     pip install numpy
     pip install sqlalchemy
     pip install psycopg2
     pip install pymysql
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conducted an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Used functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identified and removed duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Droped rows and columns with missing values.
   - **Fix Data Types**: Ensured all columns have consistent data types (e.g. prices as `float`).
   - **Currency Formatting**: Used `.replace()` to handle and format currency values for analysis.
   - **Validation**: Checked for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculated the `Total_Price` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connected to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Executed complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Kept clear notes of each query's objective, approach, and results.

---

## Technologies Used

- **Python**: For preprocessing and exploratory data analysis.
- **SQL Databases**: For querying the dataset (MySQL, PostgreSQL)
- **Python Libraries**: To load and manipulate data in Python.
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key**: For data downloading

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Conclusion

This project provided an excellent opportunity for me as a beginner to develop and strengthen my SQL skills by solving practical data problems. 
By working through various queries, I gained hands-on experience with key SQL concepts such as:

- **Data Aggregation:** Summarizing data using `SUM()`, `COUNT()`, and `GROUP BY`.
- **Ranking and Filtering:** Using window functions like `RANK()` and `ROW_NUMBER()` to rank and analyze data.
- **Date Manipulation:** Extracting and working with date components using functions like `EXTRACT()`,`CAST()` and `TO_DATE()`.
- **Conditional Logic:** Applying conditional filters with `WHERE` and advanced calculations in `CASE` statements.

Through this project, I was able to explore real-world business scenarios, analyze transactional data, and derive meaningful insights. 
It reinforced the importance of SQL as a critical tool for data analysis and equipped me with foundational skills that are invaluable for 
a career in data science and analytics.




