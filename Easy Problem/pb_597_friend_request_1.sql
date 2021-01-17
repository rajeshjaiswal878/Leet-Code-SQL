/*
Write an SQL query to find the overall acceptance rate of requests,
which is the number of acceptance divided by the number of requests.
Return the answer rounded to 2 decimals places.

Note that:

The accepted requests are not necessarily from the table friend_request.
In this case, you just need to simply count the total accepted requests
(no matter whether they are in the original requests),
and divide it by the number of requests to get the acceptance rate.
It is possible that a sender sends multiple requests to the same receiver,
and a request could be accepted more than once. In this case,
the ‘duplicated’ requests or acceptances are only counted once.
If there are no requests at all, you should return 0.00 as the accept_rate.
The query result format is in the following example:



FriendRequest table:
+-----------+------------+--------------+
| sender_id | send_to_id | request_date |
+-----------+------------+--------------+
| 1         | 2          | 2016/06/01   |
| 1         | 3          | 2016/06/01   |
| 1         | 4          | 2016/06/01   |
| 2         | 3          | 2016/06/02   |
| 3         | 4          | 2016/06/09   |
+-----------+------------+--------------+

RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
| 3            | 4           | 2016/06/10  |
+--------------+-------------+-------------+

Result table:
+-------------+
| accept_rate |
+-------------+
| 0.8         |
+-------------+
There are 4 unique accepted requests, and there are 5 requests in total. So the rate is 0.80.


Follow up:
Could you write a query to return the acceptance rate for every month?
Could you write a query to return the cumulative acceptance rate for every day?


Problem Link: https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/
*/

# My Solution

select coalesce(round((select count(distinct requester_id, accepter_id) from RequestAccepted) /
             (select count(distinct sender_id, send_to_id) from FriendRequest), 2),0.00) as accept_rate;

# Update Acceptance by Month
SELECT
    COALESCE(ROUND(ASR.CNT/RST.CNT,2),0.00) AS ACCEPT_RATE
FROM
(SELECT
    MONTH(accept_date) AS MNTH,
    count(distinct requester_id, accepter_id) AS CNT
FROM RequestAccepted
GROUP BY 1) AS AST JOIN
(SELECT
    MONTH(request_date) AS MNTH,
    count(distinct sender_id, send_to_id) AS CNT
FROM RequestAccepted
GROUP BY 1) AS RST
ON AST.MNTH=RST.MNTH;


# Update Acceptance by EACH DAY
SELECT
    COALESCE(ROUND(ASR.CNT/RST.CNT,2),0.00) AS ACCEPT_RATE
FROM
(SELECT
    accept_date AS DAY,
    count(distinct requester_id, accepter_id) AS CNT
FROM RequestAccepted
GROUP BY 1) AS AST JOIN
(SELECT
    request_date AS DAY,
    count(distinct sender_id, send_to_id) AS CNT
FROM RequestAccepted
GROUP BY 1) AS RST
ON AST.DAY=RST.DAY;

