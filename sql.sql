--Top Categories by Revenue:
select category_name_1 as category,
round(sum(grand_total)::numeric,2)
as revenue from data 
group by category_name_1
order by revenue desc
limit 3

--Most Popular top 3 Payment Methods:
select payment_method, 
count(customer_id) as total_orders
from data 
group by payment_method
order by total_orders desc
limit 3

--Top 10 Customers (VIP Customers):
select customer_id,
round(sum(grand_total)::numeric,2) as revenue,
count(item_id) as total_orders
from data 
group by customer_id
order by total_orders desc
limit 10

--Monthly Sales Trends:
SELECT 
    "Year" AS year, 
    "Month" as month, 
    COUNT(item_id) as total_orders,
    ROUND(SUM(grand_total)::numeric, 2) as total_revenue
FROM data
GROUP BY year, month
ORDER BY year, month;

--Order Status Breakdown:
SELECT 
    status,
    COUNT(item_id) AS total_orders,
    ROUND((COUNT(item_id) * 100.0) / (SELECT COUNT(*) FROM data), 2) AS percentage
FROM data
GROUP BY status
ORDER BY total_orders DESC;

--Cancellation Impact
SELECT 
    COUNT(item_id) AS total_orders,
    SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) AS cancelled_orders_count,
    ROUND(SUM(CASE WHEN status = 'canceled' THEN grand_total ELSE 0 END)::numeric, 2) AS total_lost_revenue
FROM data;

--Average Order Value
select round(avg(grand_total)::numeric,2)
as average_order_value from data 

--Discount Effectiveness
select 
case 
when discount_amount=0 then 'NO DISCOUNT'
when discount_amount>0 AND discount_amount<500 then 'LOW DISCOUNT'
when discount_amount>500 AND discount_amount<1500 then 'MEDIUM DISCOUNT'
ELSE 'HIGH DISCOUNT(1500+)'
END AS discount_bracket,
count(item_id) as total_orders,
round(avg(qty_ordered)::numeric,2) as avg_qty_ordered
from data 
group by discount_bracket
order by 2 desc

--Top 10 selling items 
select item_id,
sum(qty_ordered) from data 
group by 1
order by 2 desc
limit 10

--Payment Method Wise Cancellation Rate
SELECT 
    payment_method,
    COUNT(item_id) AS total_orders,
    SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        (SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) * 100.0) / COUNT(item_id), 
        2
    ) AS cancellation_rate_pct
FROM data
GROUP BY payment_method
ORDER BY cancellation_rate_pct DESC;

--Customer Retention Analysis
with customer_summary as (
select 
customer_id,
count(item_id) as total_orders,
sum(grand_total) as revenue_genrated
from data 
group by customer_id
)
select 
case 
when total_orders>1 then 'Repeat_customer(1+order)'
else 'One_time_customer(1 order)'
end as customer_segment,
count(customer_id) as total_customer,
round(sum(revenue_genrated)::numeric,2) as total_revenue
from customer_summary
group by customer_segment 

--Category-wise Net Revenue & Discount Impact
select category_name_1,
round(sum(grand_total)::numeric,2) as revenue,
round(sum(discount_amount)::numeric,2) as discount_given
from data 
group by category_name_1






