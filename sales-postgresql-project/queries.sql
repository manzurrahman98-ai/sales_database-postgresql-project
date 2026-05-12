--Total Sales Revenue
SELECT SUM(amount) AS total_revenue
FROM payments;

--Top Customers (Spending)
SELECT
    c.full_name,
    SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.full_name
ORDER BY total_spent DESC;

--Best Selling Products
SELECT
    pr.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.product_name
ORDER BY total_sold DESC;

--Monthly Revenue
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS revenue
FROM payments
GROUP BY month
ORDER BY month;

--Customers with No Orders
SELECT c.full_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--Stock Alert (Low Stock Products)
SELECT product_name, stock
FROM products
WHERE stock < 20;

--Revenue by Category
SELECT
    cat.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
JOIN categories cat ON pr.category_id = cat.category_id
GROUP BY cat.category_name;

