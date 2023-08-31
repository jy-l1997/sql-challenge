drop table if exists departments cascade;
drop table if exists titles cascade;
drop table if exists employees cascade;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;

create table departments (
	dept_no varchar(20) primary key not null,
	dept_name varchar(255) not null
);

create table titles (
	title_id varchar(20) primary key not null,
	title varchar(255) not null
);

create table employees (
	emp_no int primary key not null,
	emp_title_id varchar(20) not null,
	birth_date date not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	sex varchar(20) not null,
	hire_date date not null,
	constraint fk_emp_id
	foreign key(emp_title_id)
		references titles(title_id)
);

create table dept_emp (
	emp_no int not null,
	dept_no varchar(20) not null,
	primary key(emp_no, dept_no) not null,
	constraint fk_emp_dept
	foreign key (emp_no)
		references employees(emp_no),
	foreign key (dept_no)
		references departments(dept_no) 
);

create table dept_manager (
	dept_no varchar(20) not null,
	emp_no int not null,
	primary key (dept_no, emp_no) not null,
	constraint fk_manager
	foreign key (dept_no)
		references departments(dept_no),
	foreign key (emp_no)
		references employees (emp_no)
);

create table salaries (
	emp_no int primary key not null,
	salary int not null,
	constraint fk_emp_no
	foreign key (emp_no)
		references employees(emp_no)
)