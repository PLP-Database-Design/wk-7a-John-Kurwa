-- First Normal Form
CREATE TABLE ProductDetail_2 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail_2 (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Second Normal Form
CREATE TABLE Orders_2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders_2 (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE OrderItems_2 (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems_2 (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
