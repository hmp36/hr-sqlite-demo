seed.sql

-- Insert departments
INSERT INTO departments (name) VALUES 
  ('HR'), 
  ('Engineering');

-- Insert employees
INSERT INTO employees (name, department_id, salary) VALUES
  ('Alice', 1, 60000),
  ('Bob', 2, 45000),
  ('Charlie', 2, 70000),
  ('Dana', 1, 50000);

-- Insert attrition events
INSERT INTO attrition (employee_id, exit_date, reason) VALUES
  (2, '2025-06-15', 'Resigned'),
  (4, '2025-09-01', 'Retired');
