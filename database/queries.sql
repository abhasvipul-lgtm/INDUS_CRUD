-- =========================
-- INSERT CUSTOMERS
-- =========================

INSERT INTO customers (name, email, phone) VALUES
('Vipul Abhas', 'abhasvipul@gmail.com', '9876543210'),
('John Doe', 'johndoe@emdomain.com', '9876543211'),
('Sam', 'sam@emdomain.com', '9876543212'),
('Han solo', 'hansolo@emdomain.com', '9876543213'),
('Seb', 'seb@emdomain.com', '9876543214');

-- =========================
-- INSERT PRODUCTS
-- =========================


INSERT INTO products (name, category, price, stock_quantity) VALUES
('Headlights', 'Automotive', 12000.00, 20),
('Fan', 'Electronics', 799.99, 10),
('Monitor 22" FHD', 'Electronics', 9999.00, 50),
('Chair', 'Home', 5999.00, 15),
('Lamp', 'Electronics', 1500.00, 8);

-- =========================
-- INSERT ORDERS
-- =========================

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, CURRENT_TIMESTAMP - INTERVAL '5 days', 'fulfilled', 10000.00),
(1, CURRENT_TIMESTAMP - INTERVAL '10 days', 'fulfilled', 9999.00),
(3, CURRENT_TIMESTAMP - INTERVAL '15 days', 'unfulfilled', 700.00),
(1, CURRENT_TIMESTAMP - INTERVAL '20 days', 'fulfilled', 5999.00),
(4, CURRENT_TIMESTAMP - INTERVAL '2 days', 'fulfilled', 1500.00),
(5, CURRENT_TIMESTAMP - INTERVAL '1 day', 'payment_pending', 12000.00),
(2, CURRENT_TIMESTAMP - INTERVAL '25 days', 'fulfilled', 9999.00),
(3, CURRENT_TIMESTAMP - INTERVAL '8 days', 'cancelled', 5999.00),
(4, CURRENT_TIMESTAMP - INTERVAL '12 days', 'fulfilled', 799.99),
(5, CURRENT_TIMESTAMP - INTERVAL '30 days', 'fulfilled', 1500.00);


-- =========================
-- INSERT ORDER_LINE_ITEMS
-- =========================

INSERT INTO order_line_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 10000.00),
(2, 3, 1, 9999.00),
(3, 2, 1, 700.00),
(4, 4, 1, 5999.00),
(5, 5, 1, 1500.00),
(6, 1, 1, 12000.00),
(7, 3, 1, 9999.00),
(8, 4, 1, 5999.00),
(9, 2, 1, 799.99),
(10, 5, 1, 1500.00);

-- =========================
-- INSERT ORDER_LINE_ITEMS
-- =========================

INSERT INTO payments (order_id, payment_method, payment_status, amount) VALUES
(1, 'Credit Card', 'Paid', 10000.00),
(2, 'UPI', 'Paid', 9999.00),
(3, 'Debit Card', 'Pending', 700.00),
(4, 'Cash', 'Paid', 5999.00),
(5, 'Credit Card', 'Paid', 1500.00),
(7, 'Debit Card', 'Paid', 9999.00),
(8, 'Cash', 'Paid', 5999.00),
(9, 'UPI', 'Paid', 799.99),
(10, 'Credit Card', 'Paid', 1500.00);