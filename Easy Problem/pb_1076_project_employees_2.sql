/*
Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.


Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table.


Write an SQL query that reports all the projects that have the most employees.

The query result format is in the following example:



Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Result table:
+-------------+
| project_id  |
+-------------+
| 1           |
+-------------+
The first project has 3 employees while the second one has 2.

Problem Link: https://leetcode.com/problems/project-employees-ii/
*/

# My Solution:
WITH CTE AS
(
    SELECT PROJECT_ID,COUNT(1) AS CNT  FROM PROJECT GROUP BY 1
)
SELECT
    PROJECT_ID FROM CTE WHERE CNT=(SELECT MAX(CNT) FROM CTE);

#2ND SOLUTION:
SELECT
    PROJECT_ID
FROM
(
SELECT
    PROJECT_ID,
    DENSE_RANK() over (ORDER BY COUNT(1) DESC) AS RNK
FROM PROJECT
) CTE
WHERE RNK=1;

#3RD SOLUTION:
SELECT project_id FROM Project
GROUP BY 1
HAVING COUNT(*) = (
    SELECT COUNT(*) FROM Project
    GROUP BY project_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)