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


-- COMBINED BUSINESS DASHBOARD QUERY
SELECT 
    cat.category_name AS "Category",
    COUNT(DISTINCT oi.order_id) AS "Total Orders",
    SUM(oi.quantity) AS "Units Sold",
    SUM(oi.quantity * oi.unit_price) AS "Revenue",
    ROUND(AVG(oi.unit_price), 2) AS "Avg_Price",
    ROUND(SUM(oi.quantity * oi.unit_price) * 100.0 / 
          SUM(SUM(oi.quantity * oi.unit_price)) OVER (), 2) AS "%_Contribution"
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
JOIN categories cat ON pr.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY "Revenue" DESC;


-- TOP 4 PRODUCTS BY REVENUE
SELECT 
    pr.product_name AS "Product Name",
    cat.category_name AS "Category",
    SUM(oi.quantity) AS "Units Sold",
    SUM(oi.quantity * oi.unit_price) AS "Revenue"
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
JOIN categories cat ON pr.category_id = cat.category_id
GROUP BY pr.product_name, cat.category_name
ORDER BY "Revenue" DESC
LIMIT 5;

-- Customer-wise Purchase History (Example: Customer ID 1)
SELECT 
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total,
    SUM(oi.quantity * oi.unit_price) OVER (PARTITION BY o.order_id) AS order_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.customer_id = 1
ORDER BY o.order_date DESC;
