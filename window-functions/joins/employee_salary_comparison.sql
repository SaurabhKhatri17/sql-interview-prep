-- ❓ Problem
-- Find managers whose salary is less than twice
-- the average salary of their employees.

-- ✅ Solution
SELECT
    h.manager_empl_id,
    managers.salary AS manager_salary,
    AVG(employees.salary) AS avg_employee_salary
FROM map_employee_hierarchy h
JOIN dim_employee managers 
    ON h.manager_empl_id = managers.empl_id
JOIN dim_employee employees 
    ON h.empl_id = employees.empl_id
GROUP BY h.manager_empl_id, managers.salary
HAVING managers.salary < 2 * AVG(employees.salary);
