CREATE DATABASE lesson9;

USE lesson9;

CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

;with cte as(
	select 
	EmployeeID, 
	ManagerID,
	JobTitle,
	0 as level
	from Employees
	where ManagerID is NULL

	union all 

	select e.EmployeeID, e.ManagerID, e.JobTitle, level+1
	from Employees as e
	inner join cte as c
		on e.ManagerID = c.EmployeeID
	
)
select * from cte
order by level


select * 
from Employees as e
join Employees as m
	on e.ManagerID = m.EmployeeID

--=================================
-- Finding N! 

DECLARE @N INT = 10
;with cte
as (
	select 1 as n, 1 as f
	union all 
	select n+1, f*(n+1)
	from cte 
	where n < @N
) 
select n, f from cte
option (MAXRECURSION 0);

-- ========================================================

DECLARE @k INT = 10
;with cte
as (
	select 1 as position, 1 as value, 1 as next_value
	union all 
	select position+1, next_value, value+next_value
	from cte 
	where position < @k
) 
select position, value, next_value from cte
option (MAXRECURSION 0);





