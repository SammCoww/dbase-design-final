-- Products (Product_ID: 1-5 -- in insert order)
INSERT INTO Product (Product_Name, Price, Stocked_Amount) VALUES
('Wireless Mouse',      25.99, 150),
('Mechanical Keyboard', 89.99, 60),
('USB-C Hub',           34.50, 200),
('27" Monitor',         249.99, 25),
('Webcam 1080p',        45.00, 80);
 
-- Purchases (Customer_ID / CC_Number must match rows above)
-- Purchase_ID: 1-4 -- in insert order
INSERT INTO Purchase (Customer_ID, CC_Number, Purchase_Status) VALUES
(1, '4111111111111111', 'Shipped'),
(2, '5500000000000004', 'Pending'),
(1, '4111111111111111', 'Delivered'),
(3, '340000000000009',  'Pending');
 
-- Items (Purchase_ID / Product_ID must match rows above)
INSERT INTO Item (Purchase_ID, Product_ID, Quantity) VALUES
(1, 1, 2),   -- Purchase 1: 2x Wireless Mouse
(1, 3, 1),   -- Purchase 1: 1x USB-C Hub
(2, 2, 1),   -- Purchase 2: 1x Mechanical Keyboard
(3, 4, 1),   -- Purchase 3: 1x 27" Monitor
(3, 5, 1),   -- Purchase 3: 1x Webcam 1080p
(4, 1, 3),   -- Purchase 4: 3x Wireless Mouse
(4, 2, 1);   -- Purchase 4: 1x Mechanical Keyboard
