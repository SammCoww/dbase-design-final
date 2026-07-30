CREATE TABLE Customer (
    Customer_ID                 INT AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE Credit_Card(
    Credit_Card_Number          VARCHAR(19) PRIMARY KEY
);



CREATE TABLE Product (
    Product_ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name                VARCHAR(150) NOT NULL,
    Price                       DECIMAL(10,2) NOT NULL,
    Stocked_Amount              INT NOT NULL DEFAULT 0
);

CREATE TABLE Purchase (
    Purchase_ID                 INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID                 INT NOT NULL,
    CC_Number                   VARCHAR(19) NOT NULL,
    Purchase_Timestamp          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Purchase_Status             VARCHAR(30) NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (CC_Number) REFERENCES Credit_Card(Credit_Card_Number)
);


CREATE TABLE Item (
    Purchase_ID                 INT NOT NULL,
    Product_ID                  INT NOT NULL,
    Quantity                    INT NOT NULL DEFAULT 1,
    PRIMARY KEY (Purchase_ID, Product_ID),
    FOREIGN KEY (Purchase_ID) REFERENCES Purchase(Purchase_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);