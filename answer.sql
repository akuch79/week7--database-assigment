-- Week 7 Assignment: Database Design and Normalization
-- Student Name:
-- Date:
-- SQL dialect: MySQL
-- The prompt provided the required columns but did not include source rows.
-- The rows below are illustrative; replace them with the assignment's sample data if available.

-- ==========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==========================================
-- Each row contains exactly one product for an order. Product is no longer
-- stored as a repeating list, and every field contains a single value.

DROP TABLE IF EXISTS ProductDetail_NF;

CREATE TABLE ProductDetail_NF (
    OrderID       INT          NOT NULL,
    CustomerName  VARCHAR(100) NOT NULL,
    Product       VARCHAR(100) NOT NULL,
    Quantity      INT          NOT NULL,
    PRIMARY KEY (OrderID, Product),
    CHECK (Quantity > 0)
);

-- One row per product in each order (illustrative sample data).
INSERT INTO ProductDetail_NF (OrderID, CustomerName, Product, Quantity) VALUES
    (1001, 'Ava Patel', 'Notebook', 2),
    (1001, 'Ava Patel', 'Pen', 5),
    (1002, 'Noah Kim', 'Backpack', 1),
    (1002, 'Noah Kim', 'Notebook', 3);

-- ==========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==========================================
-- In the 1NF table, CustomerName depends on OrderID alone, not on the full
-- composite key (OrderID, Product). Move it to Orders. Product and Quantity
-- remain in OrderItems, where they depend on the complete key.

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    OrderID       INT          NOT NULL,
    CustomerName  VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID)
);

CREATE TABLE OrderItems (
    OrderID   INT          NOT NULL,
    Product   VARCHAR(100) NOT NULL,
    Quantity  INT          NOT NULL,
    PRIMARY KEY (OrderID, Product),
    CONSTRAINT fk_orderitems_orders
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CHECK (Quantity > 0)
);

-- Insert each order once.
INSERT INTO Orders (OrderID, CustomerName) VALUES
    (1001, 'Ava Patel'),
    (1002, 'Noah Kim');

-- Insert each order's individual products.
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
    (1001, 'Notebook', 2),
    (1001, 'Pen', 5),
    (1002, 'Backpack', 1),
    (1002, 'Notebook', 3);
