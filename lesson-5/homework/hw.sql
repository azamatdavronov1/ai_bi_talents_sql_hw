CREATE DATABASE lesson5;

USE lesson5;

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');

-- Assign a Unique Rank to Each Employee Based on Salary
SELECT *,
	ROW_NUMBER() OVER(ORDER BY Salary) AS Salary_Rank
FROM Employees
ORDER BY EmployeeID

-- Find Employees Who Have the Same Salary Rank
SELECT *
FROM (
	SELECT *,
		RANK() OVER (ORDER BY Salary) AS Salary_Rank
	FROM Employees
) AS ranked
WHERE Salary_Rank IN (
	SELECT Salary_Rank
	FROM (
		SELECT RANK() OVER (ORDER BY Salary) AS Salary_Rank
		FROM Employees
	) AS sub
	GROUP BY Salary_Rank
	HAVING COUNT(*) > 1
);



-- Identify the Top 2 Highest Salaries in Each Department
SELECT * FROM (
	SELECT 
		*,
		RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS Salary_Rank
	FROM Employees	
) MyTable
WHERE Salary_Rank <= 2

-- Find the Lowest-Paid Employee in Each Department

SELECT * FROM (
	SELECT 
		*,
		RANK() OVER(PARTITION BY Department ORDER BY Salary) AS Salary_Rank
	FROM Employees	
) MyTable
WHERE Salary_Rank = 1

-- Calculate the Running Total of Salaries in Each Department
SELECT Department,
	SUM(Salary) AS sum_by_dep
FROM Employees
GROUP BY Department

-- Find the Total Salary of Each Department Without GROUP BY
SELECT DISTINCT Department,
	SUM(Salary) OVER(PARTITION BY Department) AS sum_by_dep
FROM Employees 

-- Calculate the Average Salary in Each Department Without GROUP BY
SELECT Department,
	AVG(Salary) OVER(PARTITION BY Department) AS avg_by_dep
FROM Employees

-- Find the Difference Between an Employee’s Salary and Their Department’s Average
SELECT *, 
	Salary - avg_by_dep AS Diff
FROM (
	SELECT *,
		AVG(Salary) OVER(PARTITION BY Department) AS avg_by_dep
	FROM Employees
) AS mytable

-- Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT *,
	SUM(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_sum
FROM Employees
ORDER BY moving_sum

-- Find the Sum of Salaries for the Last 3 Hired Employees
SELECT SUM(Salary) AS sum_salary
FROM (
	SELECT Salary,
		ROW_NUMBER() OVER (ORDER BY HireDate DESC) AS rn
	FROM Employees
) AS ranked
WHERE rn <= 3;


-- Calculate the Running Average of Salaries Over All Previous Employees
SELECT *,
	SUM(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
FROM Employees

-- Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
SELECT *,
	MAX(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING)
FROM Employees

-- Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
SELECT *,
	CAST(100 * Salary / SUM(Salary) OVER (PARTITION BY Department) AS DECIMAL(10,2)) AS percent_of_dep
FROM Employees
