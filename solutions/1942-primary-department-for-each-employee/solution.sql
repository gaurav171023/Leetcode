SELECT e.employee_id, e.department_id
FROM Employee e
JOIN (
    SELECT employee_id, 
           CASE 
               WHEN COUNT(*) = 1 THEN MIN(department_id)  -- only one department
               ELSE MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)  -- primary
           END AS department_id
    FROM Employee
    GROUP BY employee_id
) t
ON e.employee_id = t.employee_id AND e.department_id = t.department_id;

