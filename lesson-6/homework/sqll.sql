-- INNER JOIN: Lists employees with their department names (only those with a matching department)
-- SELECT
--     e.EmployeeID, e.Name, d.DepartmentName
-- FROM Employees AS e
-- INNER JOIN Departments AS d
--     ON e.DepartmentID = d.DepartmentID;

-- LEFT JOIN: Lists all employees, including those without a department
-- SELECT
--     e.EmployeeID, e.Name, d.DepartmentName
-- FROM Employees AS e
-- LEFT JOIN Departments AS d
--     ON e.DepartmentID = d.DepartmentID;

-- RIGHT JOIN: Lists all departments, including those without employees
-- SELECT
--     d.DepartmentName, e.Name
-- FROM Employees AS e
-- RIGHT JOIN Departments AS d
--     ON e.DepartmentID = d.DepartmentID;

-- FULL OUTER JOIN: Lists all employees and departments, even without matches
-- SELECT
--     e.Name, d.DepartmentName
-- FROM Employees AS e
-- FULL OUTER JOIN Departments AS d
--     ON e.DepartmentID = d.DepartmentID;

-- JOIN with Aggregation: Total salary expense for each department
-- SELECT
--     d.DepartmentID, d.DepartmentName, COALESCE(SUM(e.Salary), 0) AS TotalSalary
-- FROM Departments AS d
-- LEFT JOIN Employees AS e
--     ON e.DepartmentID = d.DepartmentID
-- GROUP BY d.DepartmentID, d.DepartmentName;

-- CROSS JOIN: All possible combinations of departments and projects
-- SELECT
--     d.DepartmentName, p.ProjectName
-- FROM Departments AS d
-- CROSS JOIN Projects AS p;

-- MULTIPLE JOINS: Lists employees with their department and project names, including those without projects
SELECT
    e.EmployeeID, e.Name, d.DepartmentName, p.ProjectName
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects AS p
    ON e.EmployeeID = p.EmployeeID;
