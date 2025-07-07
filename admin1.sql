CREATE TABLE Customers4 (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(15),
    address VARCHAR2(255),
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE Categories2 (
    category_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

CREATE TABLE Products4 (
    product_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description CLOB,
    price NUMBER(10,2) NOT NULL,
    stock_quantity NUMBER NOT NULL,
    category_id NUMBER,
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Orders1 (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    status VARCHAR2(20) DEFAULT 'Pending',
    total_amount NUMBER(10,2),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items1 (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price_each NUMBER(10,2),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);
CREATE TABLE Payments2 (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_date DATE DEFAULT SYSDATE,
    amount NUMBER(10,2),
    payment_method VARCHAR2(50),
    CONSTRAINT fk_payments_order FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);

INSERT INTO Categories2 VALUES (1, 'Electronics');
INSERT INTO Categories2 VALUES (3, 'Books');

INSERT INTO Products4 VALUES (1, 'Smartphone', 'Latest 5G phone', 29999.99, 50, 1);
INSERT INTO Products4 VALUES (2, 'Novel - Mystery', 'Bestseller thriller novel', 499.99, 100, 2);

INSERT INTO Customers4 VALUES (1, 'John Doe', 'john@example.com', '9876543210', '123 Street, City', SYSDATE);

INSERT INTO Orders VALUES (1, 1, SYSDATE, 'Confirmed', 30499.98);

INSERT INTO Order_Items VALUES (1, 1, 1, 1, 29999.99);
INSERT INTO Order_Items VALUES (2, 1, 2, 1, 499.99);

INSERT INTO Payments VALUES (1, 1, SYSDATE, 30499.98, 'Credit Card');


