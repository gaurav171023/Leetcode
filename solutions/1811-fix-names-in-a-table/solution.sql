SELECT 
  user_id,
  CONCAT(UCASE(LEFT(LOWER(name), 1)), SUBSTRING(LOWER(name), 2)) AS name
FROM Users
ORDER BY user_id;

