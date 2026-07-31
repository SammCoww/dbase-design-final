SELECT DISTINCT c.Customer_Name AS Customer_Name, p.Product_Name, p.Price
FROM Customer c
JOIN Purchase pu ON c.Customer_ID = pu.Customer_ID
JOIN Item i ON pu.Purchase_ID = i.Purchase_ID
JOIN Product p ON i.Product_ID = p.Product_ID
WHERE p.Price > 100
ORDER BY c.Customer_Name;

SELECT c.Customer_ID, c.Customer_Name,
       SUM(i.Quantity * p.Price) AS TotalSpent
FROM Customer c
JOIN Purchase pu ON c.Customer_ID = pu.Customer_ID
JOIN Item i ON pu.Purchase_ID = i.Purchase_ID
JOIN Product p ON i.Product_ID = p.Product_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY TotalSpent DESC;

SELECT Product_ID, Product_Name, Stocked_Amount
FROM Product
WHERE  Stocked_Amount < 20
ORDER BY Stocked_Amount ASC;
