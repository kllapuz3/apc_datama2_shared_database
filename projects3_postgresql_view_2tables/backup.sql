CREATE USER klapuz WITH SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
BYPASSRLS
IN GROUP esprit_de_corps
PASSWORD '123';

CREATE DATABASE datama2
OWNER = klapuz;

\c datama2

CREATE TABLE employee (
	id serial CONSTRAINT employee_pkey PRIMARY KEY,
	emp_num int NOT NULL,
	emp_fname varchar(50) NOT NULL,
	emp_lname varchar(50) NOT NULL,
	emp_initial varchar(50) NOT NULL,
	emp_address varchar(50) NOT NULL,
	emp_dob timestamp(6) NOT NULL	
);

CREATE TABLE commodities (
	id serial CONSTRAINT commodities_pkey PRIMARY KEY,
	employee_id int NOT NULL,
	com_num int NOT NULL,
	com_type varchar(50) NOT NULL,
	com_validity timestamp(6) NOT NULL,
	com_quantity int NOT NULL,
	com_brand varchar(50),
	com_worth int NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee (id)
);

INSERT INTO public.employee(id, emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob)
VALUES 
(1, 1, 'Steve', 'Cruz', 'K', 'Mandaluyong City', '211021'),
(2, 2, 'Chris', 'Reyes', 'A', 'Pasay City', '231221');

INSERT INTO public.commodities(id, employee_id, com_num, com_type, com_validity, com_worth, com_quantity, com_brand)
VALUES
(1, 2, 1, 'TypeA', '060821', 100, 50, 'BrandA'),
(2, 1, 2, 'TypeB', '060821', 99, 49, 'BrandB');

CREATE VIEW employee_commo AS
SELECT
commodities.id,
commodities.com_num,
employee.emp_fname,
employee.emp_lname
FROM commodities
JOIN employee ON (commodities.employee_id = employee.id)
ORDER BY commodities.id;