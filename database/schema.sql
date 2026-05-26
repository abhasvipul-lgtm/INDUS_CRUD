-- =========================
-- CUSTOMERS TABLE
-- =========================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- PRODUCTS TABLE
-- =========================

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- =========================
-- ORDERS TABLE
-- =========================

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending',
    total_amount DECIMAL(10,2),

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
);

-- =========================
-- ORDER ITEMS TABLE
-- =========================

CREATE TABLE order_line_items (
    order_line_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_order
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE
);

-- =========================
-- PAYMENTS TABLE
-- =========================

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10,2),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payment_order
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE
);