-- =========================
-- Fetch the top 3 customers with the highest number of orders.
-- =========================

SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;


-- =========================
-- Retrieve orders placed in the last 30 days.
-- =========================

SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

-- =========================
-- Calculate total revenue for each product.
-- =========================

SELECT p.product_id, p.name, SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_line_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC;