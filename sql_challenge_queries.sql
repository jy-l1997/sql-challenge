select e.emp_no,
		last_name,
		first_name,
		sex,
		salary
from employees e
join salaries s 
on e.emp_no = s.emp_no 
;

select first_name, 
		last_name, 
		hire_date 
from employees e 
where extract(year from hire_date) = 1986
;

select dm.dept_no,
		d.dept_name,
		dm.emp_no,
		e.last_name, 
		e.first_name
from dept_manager dm 
join departments d 
	on dm.dept_no = d.dept_no 
join employees e 
	on dm.emp_no = e.emp_no 
;

select e.emp_no, 
		e.last_name,
		e.first_name,
		d.dept_name 
from employees e 
join dept_emp de
	on e.emp_no = de.emp_no 
join departments d 
	on de.dept_no = d.dept_no 
;

select first_name,
		last_name,
		sex 
from employees e 
where
first_name = 'Hercules'
and 
last_name like 'B%'
;

select d.dept_name ,
		e.emp_no, 
		e.last_name,
		e.first_name 
from employees e 
join dept_emp de
	on e.emp_no = de.emp_no 
join departments d 
	on de.dept_no = d.dept_no 
where d.dept_name in ('Sales', 'Development')
;

select last_name,
		count(last_name)
from employees e
group by last_name 
order by count(last_name) desc 
;