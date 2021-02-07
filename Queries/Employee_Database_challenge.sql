-- DELIVERABLE 1: Number of employees retiring
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	de.from_date,
    de.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles
		ON(e.emp_no = titles.emp_no )
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


-- Number of emplouees per title retiring


SELECT COUNT(title) AS count_titles,
title
INTO retiring_tiles
FROM unique_titles
GROUP BY title
ORDER BY count_titles DESC;

-- DELIVERABLE 2: Mentorship Eligibilty
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	titles.title,
	de.from_date,
    de.to_date
INTO mentorship
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles
		ON(e.emp_no = titles.emp_no )
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date= '9999-01-01')
ORDER BY e.emp_no;

SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	birth_date,
	to_date,
	from_date,
	title
INTO mentorship_eligibilty
FROM mentorship
ORDER BY emp_no;