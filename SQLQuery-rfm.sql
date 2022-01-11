

-- Số lượng khách hàng
SELECT COUNT(DISTINCT CustomerID) AS number_of_customer
FROM dataCustomerRFM


-- Khách hàng theo ngày đặt hàng cuối cùng, Số lần đạt hàng, Tổng tiền mua hàng
WITH "cte_rfm" AS(
	SELECT CustomerID, DATEDIFF(DAY, MAX(OrderDate), GETDATE()) AS last_order, COUNT(*) AS number_of_order, SUM(Amount) AS total_amount
	FROM dataCustomerRFM
	GROUP BY CustomerID
), "cte_recent" AS (
	SELECT PERCENT_RANK() OVER(ORDER BY last_order) AS recent_percent,
		PERCENT_RANK() OVER(ORDER BY number_of_order) AS frequency_percent,
		PERCENT_RANK() OVER(ORDER BY total_amount) AS monetary_percent
	FROM cte_rfm
)
select *
from cte_recent

SELECT CASE
		WHEN last_order = 25 THEN 1
		WHEN last_order = 26 THEN 2
		WHEN last_order = 27 THEN 3
		WHEN last_order = 28 THEN 4
	END AS recency,
FROM cte_rfm


WITH "cte_rfm" AS(
	SELECT CustomerID, DATEDIFF(DAY, MAX(OrderDate), GETDATE()) AS last_order, COUNT(*) AS number_of_order, SUM(Amount) AS total_amount
	FROM dataCustomerRFM
	GROUP BY CustomerID
)

select *
from cte_rfm

select max(last_order), min(last_order)
from "cte_rfm"

select max(OrderDate), 
from dataCustomerRFM

select PERCENT_RANK() OVER(ORDER BY last_order) AS recent_rank
,
from cte_rfm