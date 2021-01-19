/*

Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 |
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |

Problem Link: https://leetcode.com/problems/biggest-single-number/
*/

# My Solution
SELECT MAX(num) as num
from (
         select num
         from my_numbers
         group by num
         having count(num) = 1
     );

# 2nd Solution
select IF(count(num)=0,NULL,num) as num
from
(select num
from
my_numbers
group by num
having count(num)=1
order by num desc limit 1) t1

# 3rd Solution
SELECT IFNULL(

(SELECT num
FROM my_numbers
GROUP BY 1
HAVING COUNT(*) = 1
ORDER BY num DESC
LIMIT 1)

,NULL) AS num