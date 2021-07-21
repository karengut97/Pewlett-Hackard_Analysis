-- DELIVERABLE 1
-- Number of retiring employees by title
-- Resultes go into a new table for retirements title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirements_title
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


-- Use Distinct with Orderby to remove duplicate rows
-- Results go into new table for unique titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirements_title as rt
ORDER BY rt.emp_no ASC, 
	rt.to_date DESC;

-- Retrieve number of employees who are retiring by their most recent title
-- Results go into a new table for retiring titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;

-- DELIVERABLE 2
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE de.to_date = '9999-01-01' AND 
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

