# Write your MySQL query statement below
SELECT e.name as Employee FROM Employee e inner join Employee m on e.managerID=m.id where e.salary>m.salary
