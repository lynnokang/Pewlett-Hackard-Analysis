-- CHALLENGE DELIVERABLE 1 

-- Retrive the emp_no, first_name, and last_name columns of Employees table.
SELECT emp_no, first_name, last_name
FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

SELECT  e.emp_no,
        e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS t
        ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date ASC;

-- Check unique_titles table
SELECT * FROM unique_titles;

-- Retrieve the number of employees by their most recent job title who are about to retire.
-- Number of employees retiring
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
-- Check retiring_titles table.
SELECT * FROM retiring_titles;