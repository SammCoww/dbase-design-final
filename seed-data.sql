-- Customers
INSERT INTO Customer (Customer_ID, Customer_Name, PhoneNumber, ShippingAddress) VALUES
(1, 'Alice Johnson', '555-0101', '101 Main St, Austin, TX 78701'),
(2, 'Brian Smith', '555-0102', '202 Oak Ave, Denver, CO 80202'),
(3, 'Carla Gomez', '555-0103', '303 Pine Rd, Miami, FL 33101'),
(4, 'David Lee', '555-0104', '404 Cedar Blvd, Seattle, WA 98101'),
(5, 'Emma Wilson', '555-0105', '505 Maple Dr, Boston, MA 02108'),
(6, 'Frank Brown', '555-0106', '606 Elm St, Chicago, IL 60601');

-- Credit cards (test values only)
INSERT INTO Credit_Card
    (Credit_Card_Number, NameOnCard, CVV, ExpirationDate, Pin, Customer_ID)
VALUES
('4111111111111111', 'Alice Johnson', '123', '2028-06-30', '1234', 1),
('5500000000000004', 'Brian Smith', '456', '2027-11-30', '4567', 2),
('340000000000009',  'Carla Gomez', '789', '2029-03-31', NULL, 3),
('6011111111111117', 'David Lee', '234', '2028-09-30', '2345', 4),
('4000000000000002', 'Emma Wilson', '567', '2027-12-31', NULL, 5),
('4222222222222222', 'Frank Brown', '890', '2029-01-31', '8901', 6);

-- Products
INSERT INTO Product (Product_ID, Product_Name, Price, Stocked_Amount) VALUES
(1,  'Wireless Mouse',       25.99, 150),
(2,  'Mechanical Keyboard',  89.99, 60),
(3,  'USB-C Hub',             34.50, 200),
(4,  '27-inch Monitor',      249.99, 25),
(5,  'Webcam 1080p',          45.00, 80),
(6,  'Laptop Stand',          39.99, 75),
(7,  'Noise-Canceling Headset', 129.99, 40),
(8,  'Portable SSD 1TB',     109.99, 35),
(9,  'Desk Lamp',             29.95, 90),
(10, 'Ergonomic Chair',      299.00, 15);

-- Purchases
INSERT INTO Purchase
    (Purchase_ID, Customer_ID, CC_Number, Purchase_Timestamp, Purchase_Status)
VALUES
(1,  1, '4111111111111111', '2026-01-05 09:15:00', 'Delivered'),
(2,  2, '5500000000000004', '2026-01-12 14:30:00', 'Shipped'),
(3,  1, '4111111111111111', '2026-02-03 11:45:00', 'Delivered'),
(4,  3, '340000000000009',  '2026-02-18 16:20:00', 'Pending'),
(5,  4, '6011111111111117', '2026-03-01 10:05:00', 'Shipped'),
(6,  5, '4000000000000002', '2026-03-14 13:10:00', 'Pending'),
(7,  6, '4222222222222222', '2026-04-02 08:40:00', 'Delivered'),
(8,  2, '5500000000000004', '2026-04-15 17:55:00', 'Cancelled'),
(9,  3, '340000000000009',  '2026-05-06 12:25:00', 'Shipped'),
(10, 5, '4000000000000002', '2026-05-21 15:35:00', 'Pending');

-- Purchase items
INSERT INTO Item (Purchase_ID, Product_ID, Quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 6, 1),
(3, 4, 1),
(3, 5, 1),
(4, 1, 3),
(4, 2, 1),
(5, 7, 1),
(5, 8, 2),
(6, 3, 2),
(6, 9, 1),
(7, 10, 1),
(7, 6, 1),
(8, 5, 1),
(9, 4, 2),
(9, 7, 1),
(10, 1, 1),
(10, 8, 1),
(10, 9, 2);
