USE lesson10;

CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

INSERT INTO Shipments (N, Num) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 4), (15, 4), 
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), 
(23, 4), (24, 4), (25, 4), (26, 5), (27, 5), (28, 5), (29, 5), 
(30, 5), (31, 5), (32, 6), (33, 7);


SELECT * 
FROM Shipments

;WITH numbers AS (
    SELECT 34 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 40
)
INSERT INTO Shipments(N, Num)
SELECT n, 0
FROM numbers;


SELECT AVG(Num) AS Median
FROM (
    SELECT Num,
           ROW_NUMBER() OVER (ORDER BY Num) AS rnk,
           COUNT(*) OVER () AS total_count
    FROM Shipments
) AS table1
WHERE rnk IN (
    (total_count + 1) / 2,  
    (total_count + 2) / 2    
);


USE lesson10

WITH Days AS (
	SELECT 1 AS days
	UNION ALL 
	SELECT days + 1 FROM Days
	WHERE days < 40
),
Adjusted AS (
	SELECT 
	D.days As days,
	S.Num,
	ROW_NUMBER() OVER(ORDER BY ISNULL(S.Num, 0)) AS rnk,
	COUNT(*) OVER() AS total
	FROM Shipments S
	LEFT JOIN Days D
		ON D.days = S.N
)

SELECT * FROM Adjusted
 WHERE rnk IN ((total+1) / 2, (total+2) / 2)
