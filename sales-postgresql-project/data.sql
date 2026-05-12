-- =========================
-- CUSTOMERS
-- =========================

INSERT INTO customers (full_name, email, phone, city) VALUES
('Manzur Rahman Emon', 'emon@gmail.com', '01700000001', 'Dhaka'),
('Ayesha Akter', 'ayesha@gmail.com', '01700000002', 'Chittagong'),
('Rahim Uddin', 'rahim@gmail.com', '01700000003', 'Sylhet');

-- =========================
-- CATEGORIES
-- =========================

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home Appliances');

-- =========================
-- PRODUCTS
-- =========================

INSERT INTO products (product_name, category_id, price, stock) VALUES
('iPhone 13', 1, 95000, 10),
('Samsung Galaxy S22', 1, 85000, 12),
('T-Shirt', 2, 500, 200),
('Blender', 3, 3500, 30);

-- =========================
-- ORDERS
-- =========================

INSERT INTO orders (customer_id, status) VALUES
(1, 'Completed'),
(2, 'Pending'),
(1, 'Completed');

-- =========================
-- ORDER ITEMS
-- =========================

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 95000),
(1, 3, 2, 500),
(2, 2, 1, 85000),
(3, 4, 1, 3500);

-- =========================
-- PAYMENTS
-- =========================

INSERT INTO payments (order_id, amount, payment_method) VALUES
(1, 96000, 'Card'),
(2, 85000, 'Cash'),
(3, 3500, 'Mobile Banking');