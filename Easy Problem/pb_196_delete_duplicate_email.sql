/*
Write a SQL query to delete all duplicate email entries in a table named Person,
keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:

Your output is the whole Person table after executing your sql. Use delete statement.
Problem Link:https://leetcode.com/problems/delete-duplicate-emails/
 */


# MY SOLUTION
WITH CTE AS
    (
        SELECT P1.ID FROM PERSON P1 JOIN PERSON P2
        ON P1.EMAIL=P2.EMAIL AND P1.ID>P2.ID
    )
DELETE FROM PERSON WHERE ID IN (SELECT ID FROM CTE)


# 2ND SOLUTION
WITH CTE2 AS
(
SELECT ID FROM (
    SELECT MIN(ID) AS ID FROM PERSON GROUP BY EMAIL) A
)
DELETE FROM PERSON WHERE ID NOT IN(SELECT ID FROM CTE2)