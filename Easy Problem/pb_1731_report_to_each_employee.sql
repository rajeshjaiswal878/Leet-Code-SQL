/*
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the primary key for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null).


For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The query result format is in the following example:



Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+

Result table:
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.


Problem Link:https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
*/

# My Solution

SELECT
       e.employee_id,
       e.name, COUNT(e1.reports_to) AS reports_count,
       ROUND(AVG(e1.age)) AS average_age
FROM Employees AS e
CROSS JOIN Employees AS e1
ON e.employee_id <> e1.employee_id AND e1.reports_to = e.employee_id
GROUP BY e.employee_id
ORDER BY e.employee_id

# 2nd Solution(Leet Code Best Solution)
Select e.employee_id     as employee_id,
       e.name            as name,
       count(*)          as reports_count,
       round(avg(f.age)) as average_age
from employees e
join employees f
on e.employee_id = f.reports_to
group by 1
order by 1



