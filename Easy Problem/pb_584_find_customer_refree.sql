/*
Given a table customer holding customers information and the referee.

+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+
Write a query to return the list of customers NOT referred by the person with id '2'.

For the sample data above, the result is:

+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
Problem Link:https://leetcode.com/problems/find-customer-referee/
*/

# My Solution

select name from customer where referee_id != 2 or referee_id is NULL;

# 2nd Solution

SELECT name
FROM Customer
WHERE COALESCE(referee_id, 0) != 2;

# 3rd Solution
SELECT name
FROM customer
WHERE IFNULL(referee_id, 0) <> 2
