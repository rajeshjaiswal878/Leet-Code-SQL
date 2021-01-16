/*
Suppose that a website contains two tables, the Customers table and the Orders table.
Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

Problem Link :https://leetcode.com/problems/customers-who-never-order/
*/

# My Solution

SELECT
       C.NAME AS CUSTOMERS
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.ID=O.CUSTOMERID
WHERE O.ID IS NULL

# 2ND Solution
SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (SELECT CustomerID FROM Orders)
