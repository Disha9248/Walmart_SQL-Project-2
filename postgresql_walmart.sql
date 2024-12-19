-- Walmart project
-- Exportated data from dataframe


-- ************* PROBLEM STATEMENTS ***********

-- 1) What are the different payment methods, and how many transactions and
--    items were sold with each method?
-- 2) Which category received the highest average rating in each branch?
-- 3) What is the busiest day of the week for each branch based on transaction
--    volume?
-- 4) How many items were sold through each payment method?
-- 5) What are the average, minimum, and maximum ratings for each category in
--    each city?
-- 6) What is the total profit for each category, ranked from highest to lowest?
-- 7) What is the most frequently used payment method in each branch?
-- 8) How many transactions occur in each shift (Morning, Afternoon, Evening)
--    across branches?
-- 9) Which branches experienced the largest decrease in revenue compared to
--    the previous year?

SELECT *
FROM walmart_table;

-- ************* SOLUTION *************

-- 1) What are the different payment methods, and how many transactions and
--    items were sold with each method?

SELECT DISTINCT(payment_method)
FROM walmart_table;

SELECT payment_method, 
       SUM(quantity) AS sold_items,
	   COUNT(invoice_id) AS transactions
FROM walmart_table
GROUP BY payment_method;

-- 2) Which category received the highest average rating in each branch?

WITH highest_average AS (
	SELECT category,
	       "Branch",
		   ROUND(AVG(rating)::NUMERIC,2) AS average_rating
	FROM walmart_table
	GROUP BY category,"Branch"
	ORDER BY "Branch",average_rating DESC
),
highest_average2 AS (
	SELECT *,
	       RANK() OVER(PARTITION BY "Branch" ORDER BY average_rating) AS rank
	FROM highest_average
)

SELECT category,
	   "Branch",
	   average_rating
FROM highest_average2 
WHERE rank = 1;



-- 3) Which is the busiest day of the week for each branch based on transaction
--    volume?

WITH busiest_day AS (
	SELECT COUNT(invoice_id) AS transactions,
	       -- EXTRACT(WEEK FROM CAST(date AS DATE)) AS week,
		   -- EXTRACT(DAY FROM CAST(date AS DATE)) AS day,
		   TO_CHAR(CAST(date AS DATE),'day') AS day,
		   "Branch"
	FROM walmart_table
	GROUP BY day,"Branch"
	ORDER BY "Branch",  transactions DESC
),
busiest_day2 AS (
	SELECT *,
	       DENSE_RANK() OVER(PARTITION BY "Branch" ORDER BY transactions DESC)AS rank
	FROM busiest_day
)

SELECT day,"Branch",transactions
FROM busiest_day2
WHERE rank = 1;


-- 4) How many items were sold through each payment method?

SELECT payment_method,
       SUM(quantity) AS items_sold
FROM walmart_table
GROUP BY payment_method;

-- 5) What are the average, minimum, and maximum ratings for each category in
--    each city?

SELECT "City",
        category,
		ROUND(AVG(rating)::Numeric,2) AS average_rating,
		MIN(rating) AS minimum_rating,
		MAX(rating) AS maximum_rating
FROM walmart_table
GROUP BY "City",category
ORDER BY "City";

-- 6) What is the total profit for each category, ranked from highest to lowest?

SELECT category,
       ROUND(SUM(total_price * profit_margin)::Numeric,2) AS total_profit
FROM walmart_table
GROUP BY category
ORDER BY total_profit DESC;

-- 7) What is the most frequently used payment method in each branch?

WITH payment_counts AS (
	SELECT payment_method,
	       COUNT(payment_method)AS method_count,
		   "Branch"
	FROM walmart_table
	GROUP BY "Branch",payment_method
	ORDER BY "Branch",method_count
),
ranked_methods AS ( 
    SELECT  "Branch",
	        payment_method,
	        method_count,
	        RANK() OVER (PARTITION BY "Branch" ORDER BY method_count DESC) AS rank
    FROM payment_counts
)

SELECT 
    "Branch",
    payment_method,
    method_count
FROM ranked_methods
WHERE rank = 1;
       


-- 8) How many transactions occur in each shift (Morning, Afternoon, Evening)
--    across branches?

SELECT 
        CASE WHEN EXTRACT(HOUR FROM CAST(time AS TIME)) BETWEEN 6 AND 11 THEN 'Morning'
	        WHEN EXTRACT(HOUR FROM CAST(time AS TIME)) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS shifts,
		COUNT(quantity) AS transactions,
		"Branch"
FROM walmart_table
GROUP BY shifts,"Branch"
ORDER BY "Branch",shifts;


-- 9) Which branches experienced the largest decrease in revenue compared to
--    the previous year?

WITH revenue_compare AS (
	SELECT EXTRACT(YEAR FROM CAST(date AS DATE)) AS year,
	       ROUND(SUM(total_price)::Numeric,2) AS Revenue,
		   "Branch"
	FROM walmart_table
	GROUP BY year,"Branch"
	ORDER BY "Branch",year
),
revenue_compare2 AS(
	SELECT 
	    "Branch",
	    MAX(CASE WHEN year = 2022 THEN revenue ELSE 0 END) AS revenue_2022,
	    MAX(CASE WHEN year = 2023 THEN revenue ELSE 0 END) AS revenue_2023
	FROM revenue_compare
	GROUP BY "Branch"
)

SELECT "Branch"
  --       revenue_2022,
		-- revenue_2023
FROM revenue_compare2
WHERE revenue_2022 > revenue_2023;

-- SELECT COUNT("Branch")
-- FROM revenue_compare2
-- WHERE revenue_2022 > revenue_2023;


