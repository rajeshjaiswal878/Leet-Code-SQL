/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table,
the query should return 200 as the second highest salary.
If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Link To Problem: https://leetcode.com/problems/second-highest-salary/
*/

SELECT
       MAX(SALARY) AS SECONDHIGHESTSALARY
FROM  EMPLOYEE
WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE)