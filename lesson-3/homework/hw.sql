-- Task 1: Employee Salary Report
/*
WITH TopEmployees AS (
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary,
        NTILE(10) OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT 
    Department,
    AVG(Salary) AS AverageSalary,
    MAX(CASE 
        WHEN Salary > 80000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END) AS SalaryCategory
FROM TopEmployees
WHERE SalaryRank = 10
GROUP BY Department
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;
*/

-- Task 2: Customer Order Insights
/*
SELECT 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        WHEN Status = 'Cancelled' THEN 'Cancelled'
    END AS OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        WHEN Status = 'Cancelled' THEN 'Cancelled'
    END
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;
*/

-- Task 3: Product Inventory Check
WITH RankedProducts AS (
    SELECT 
        ProductID,
        ProductName,
        Category,
        Price,
        Stock,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS PriceRank
    FROM Products
)
SELECT 
    Category,
    ProductName,
    Price,
    IIF(Stock = 0, 'Out of Stock', 
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM RankedProducts
WHERE PriceRank = 1
ORDER BY Price DESC
OFFSET 5 ROWS FETCH NEXT 2147483647 ROWS ONLY;
