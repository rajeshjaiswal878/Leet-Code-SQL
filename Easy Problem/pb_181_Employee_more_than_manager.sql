/*
The Employee table holds all employees including their managers.
Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table,
write a SQL query that finds out employees who earn more than their managers.
For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+
 */
# METHOD 1
 SELECT
        E1.NAME AS EMPLOYEE
 FROM EMPLOYEE E1
    WHERE E1.SALARY > (SELECT E2.SALARY FROM EMPLOYEE E2 WHERE E2.ID=E1.MANAGERID);

 # METHOD 2
 SELECT
        E1.NAME AS EMPLOYEE
 FROM EMPLOYEE E1
 JOIN EMPLOYEE E2
 ON E2.ID=E1.MANAGERID
 AND E1.SALARY>E2.SALARY;