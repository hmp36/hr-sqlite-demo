queries.sql


-- Headcount by department
SELECT d.name AS department, COUNT(e.id) AS headcount
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name;

-- Average salary by department
SELECT d.name AS department, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name;

-- Attrition rate by department
SELECT d.name AS department,
       COUNT(a.employee_id) * 1.0 / COUNT(e.id) AS attrition_rate
FROM employees e
JOIN departments d ON e.department_id = d.id
LEFT JOIN attrition a ON e.id = a.employee_id
GROUP BY d.name;

-- Active employees only (filters out attrition)
SELECT e.name, d.name AS department, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.id
LEFT JOIN attrition a ON e.id = a.employee_id
WHERE a.employee_id IS NULL;

-- Attrition timeline (monthly exits)
SELECT strftime('%Y-%m', a.exit_date) AS month, COUNT(*) AS exits
FROM attrition a
GROUP BY strftime('%Y-%m', a.exit_date)
ORDER BY month;
