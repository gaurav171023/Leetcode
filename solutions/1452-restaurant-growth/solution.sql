WITH daily_totals AS (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    c.visited_on,
    SUM(c2.daily_amount) AS amount,
    ROUND(SUM(c2.daily_amount)/7, 2) AS average_amount
FROM daily_totals c
JOIN daily_totals c2
  ON c2.visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
GROUP BY c.visited_on
HAVING COUNT(DISTINCT c2.visited_on) = 7
ORDER BY c.visited_on;

