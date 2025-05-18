-- CREATE DATABASE lesson4;
-- GO

-- USE lesson4;
-- GO

-- CREATE TABLE [dbo].[TestMultipleZero]
-- (
--     [A] [int] NULL,
--     [B] [int] NULL,
--     [C] [int] NULL,
--     [D] [int] NULL
-- );
-- GO

-- INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
-- VALUES 
--     (0,0,0,1),
--     (0,0,1,0),
--     (0,1,0,0),
--     (1,0,0,0),
--     (0,0,0,0),
--     (1,1,1,0);
-- GO

-- SELECT * 
-- FROM TestMultipleZero
-- WHERE A!=0 OR B!=0 OR C!=0 OR D!=0;
-- GO

-- CREATE TABLE TestMax
-- (
--     Year1 INT,
--     Max1 INT,
--     Max2 INT,
--     Max3 INT
-- );
-- GO
 
-- INSERT INTO TestMax 
-- VALUES
--     (2001,10,101,87),
--     (2002,103,19,88),
--     (2003,21,23,89),
--     (2004,27,28,91);
-- GO

-- -- Option 1
-- SELECT Year1,
--        CASE 
--            WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
--            WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
--            ELSE Max3
--        END AS MaxValue
-- FROM TestMax;
-- GO

-- -- Option 2 (Note: GREATEST is not supported in SQL Server)
-- SELECT 
--     Year1,
--     GREATEST(Max1, Max2, Max3) as MaxValue
-- FROM TestMax;
-- GO

-- CREATE TABLE EmpBirth
-- (
--     EmpId INT IDENTITY(1,1),
--     EmpName VARCHAR(50),
--     BirthDate DATETIME
-- );
-- GO
 
-- INSERT INTO EmpBirth(EmpName,BirthDate)
-- SELECT 'Pawan', '12/04/1983'
-- UNION ALL
-- SELECT 'Zuzu', '11/28/1986'
-- UNION ALL
-- SELECT 'Parveen', '05/07/1977'
-- UNION ALL
-- SELECT 'Mahesh', '01/13/1983'
-- UNION ALL
-- SELECT 'Ramesh', '05/09/1983';
-- GO

-- SELECT * 
-- FROM EmpBirth
-- WHERE (DAY(BirthDate) BETWEEN 7 AND 15) AND MONTH(BirthDate) = 5;
-- GO

-- CREATE TABLE letters
-- (
--     letter CHAR(1)
-- );
-- GO

-- INSERT INTO letters
-- VALUES ('a'), ('a'), ('a'), 
--        ('b'), ('c'), ('d'), ('e'), ('f');
-- GO

-- -- Putting 'b' to the first row
-- SELECT * 
-- FROM letters
-- ORDER BY 
--     CASE letter
--         WHEN 'b' THEN 1
--         ELSE 2
--     END,
--     letter;
-- GO

-- -- Putting 'b' to the last row
-- SELECT * 
-- FROM letters
-- ORDER BY 
--     CASE letter
--         WHEN 'b' THEN 1
--         ELSE 0
--     END,
--     letter;
-- GO

-- Putting 'b' to the random position
SELECT * 
FROM letters
ORDER BY 
    CASE letter
        WHEN 'a' THEN 1
        WHEN 'b' THEN 4
        WHEN 'c' THEN 3
        WHEN 'd' THEN 5
        WHEN 'e' THEN 6
        WHEN 'f' THEN 7
        ELSE 100
    END;
