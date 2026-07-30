-- 1. Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    ShippingAddress VARCHAR(255)
);

-- 2. Create Credit Card Table (1:N with Customer)
CREATE TABLE Credit_Card (
    CreditCardNumber VARCHAR(19) PRIMARY KEY,
    NameOnCard VARCHAR(100) NOT NULL,
    CVV VARCHAR(4) NOT NULL,
    ExpirationDate DATE NOT NULL,
    Pin VARCHAR(4),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Create Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    AmountInStock INT NOT NULL DEFAULT 0,
    Price DECIMAL(10, 2) NOT NULL
);

-- 4. Create Purchase Table (1:N with Customer and Credit Card)
CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    CreditCardNumber VARCHAR(19) NOT NULL,
    Timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (CreditCardNumber) REFERENCES Credit_Card(CreditCardNumber)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- 5. Create Item Table (Weak Entity / Associative Table with Composite PK)
CREATE TABLE Item (
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (PurchaseID, ProductID),
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
