-- 1️ Retrieve All Customers With Their Orders (Include Customers Without Orders)
-- SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
-- FROM Customers AS c
-- LEFT JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID;

-- 2️ Find Customers Who Have Never Placed an Order
-- SELECT c.CustomerName
-- FROM Customers AS c
-- LEFT JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerName
-- HAVING COUNT(o.OrderID) = 0;

-- 3️ List All Orders With Their Products
-- SELECT *
-- FROM OrderDetails AS od
-- JOIN Products AS p
--     ON od.ProductID = p.ProductID;

-- 4️ Find Customers With More Than One Order
-- SELECT c.CustomerName
-- FROM Customers AS c
-- LEFT JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerName
-- HAVING COUNT(o.OrderID) > 1;

-- 5️ Find the Most Expensive Product in Each Order
-- SELECT od.OrderID, MAX(od.Price) AS MaxPrice
-- FROM OrderDetails AS od
-- JOIN Products AS p
--     ON od.ProductID = p.ProductID
-- GROUP BY od.OrderID;

-- 6️ Find the Latest Order for Each Customer
-- SELECT c.CustomerName, MAX(o.OrderDate) AS LatestOrderDate
-- FROM Customers AS c
-- JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerName;

-- 7️ Find Customers Who Ordered Only 'Electronics' Products
-- SELECT c.CustomerName
-- FROM Customers AS c
-- JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID
-- JOIN OrderDetails AS od
--     ON o.OrderID = od.OrderID
-- JOIN Products AS p
--     ON od.ProductID = p.ProductID
-- GROUP BY c.CustomerName
-- HAVING COUNT(DISTINCT p.Category) = 1 AND MAX(p.Category) = 'Electronics';

-- 8️ Find Customers Who Ordered at Least One 'Stationery' Product
-- SELECT c.CustomerName
-- FROM Customers AS c
-- JOIN Orders AS o
--     ON c.CustomerID = o.CustomerID
-- JOIN OrderDetails AS od
--     ON o.OrderID = od.OrderID
-- JOIN Products AS p
--     ON od.ProductID = p.ProductID
-- WHERE p.Category = 'Stationery'
-- GROUP BY c.CustomerName;

-- 9️ Find Total Amount Spent by Each Customer
SELECT c.CustomerName, SUM(od.Price * od.Quantity) AS TotalSpent
FROM Customers AS c
JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY c.CustomerName;
