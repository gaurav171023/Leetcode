WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
next_day_login AS (
    SELECT f.player_id
    FROM first_login f
    JOIN Activity a
        ON f.player_id = a.player_id
       AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT ROUND(
    COUNT(DISTINCT next_day_login.player_id) * 1.0 / COUNT(DISTINCT Activity.player_id),
    2
) AS fraction
FROM Activity
LEFT JOIN next_day_login
    ON Activity.player_id = next_day_login.player_id;

