SELECT DISTINCT c.Name AS CustomerName, p.ProductName, p.Price
FROM Customer c
JOIN Purchase pu ON c.CustomerID = pu.CustomerID
JOIN Item i ON pu.PurchaseID = i.PurchaseID
JOIN Product p ON i.ProductID = p.ProductID
WHERE p.Price > 100
ORDER BY c.Name;

SELECT c.CustomerID, c.Name,
       SUM(i.Quantity * p.Price) AS TotalSpent
FROM Customer c
JOIN Purchase pu ON c.CustomerID = pu.CustomerID
JOIN Item i ON pu.PurchaseID = i.PurchaseID
JOIN Product p ON i.ProductID = p.ProductID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;

SELECT ProductID, ProductName, AmountInStock
FROM Product
WHERE AmountInStock < 10
ORDER BY AmountInStock ASC;
