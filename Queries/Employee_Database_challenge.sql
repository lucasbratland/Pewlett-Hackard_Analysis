-- Delieverable 1 Part 1 Create the retirement_titles table
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ;
	
--Deliverable 1 Part 2 create the unique_titles table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC ;

--Deliverable 1 Part 3 create the retiring_titles table
SELECT COUNT(ut.title),  ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--Deliverable 2 Part 1 create mentorship_eligibilty table
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;


-----------------------------------------------------------
--Other code used to create extra tables
SELECT ut.emp_no,
	de.dept_no,
	d.dept_name
INTO unique_dept
FROM unique_titles as ut
LEFT JOIN dept_employees as de
ON (ut.emp_no = de.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE de.to_date = '9999-01-01'	


SELECT dept_name, dept_no, COUNT(dept_name)
INTO unique_dept_count
FROM unique_dept
GROUP BY dept_name, dept_no

SELECT udc.dept_name, 
	udc.dept_no,
	CAST(udc.count AS DECIMAL(7,2)) AS "Retiring Count",
	CAST(dc.count AS DECIMAL (7,2)) AS "Total Count",
	CAST(udc.count / dc.count AS DECIMAL(7,2)) AS "Percent Retiring"
FROM unique_dept_count as udc
JOIN dept_count as dc
ON (udc.dept_no = dc.dept_no)

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	de.to_date
INTO currently_employed_total
FROM employees as e
JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE de.to_date = '9999-01-01'

SELECT DISTINCT ON(e.emp_no) e.emp_no, d.dept_name, d.dept_no 
INTO zzzemp_list
FROM employees as e
JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE de.to_date = '9999-01-01'

SELECT dept_name,
	dept_no,
	COUNT(dept_no)
INTO zzzdept_count
FROM zzzemp_list
GROUP BY dept_name, dept_no

SELECT udc.dept_name, 
	udc.dept_no,
	udc.count AS "Retiring Count",
	zd.count AS "Total Count",
	round(CAST(udc.count AS DECIMAL (7,2)) / zd.count * 100,2) AS "Percent Retiring"
--INTO percent_retiring
FROM unique_dept_count as udc
JOIN zzzdept_count as zd
ON (udc.dept_no = zd.dept_no)