In SQL, a common yet often subtle error arises when dealing with aggregate functions and grouping.  Consider this scenario: You want to find the average order value for each customer.  A seemingly correct query might be:

```sql
SELECT customer_id, AVG(order_total) AS average_order_value
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY customer_id, order_total; 
```

The issue lies in including `order_total` in the `GROUP BY` clause. This means the average is calculated for each unique combination of customer ID and order total, rather than the average across all orders for each customer.  The correct query would be:

```sql
SELECT customer_id, AVG(order_total) AS average_order_value
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY customer_id;
```