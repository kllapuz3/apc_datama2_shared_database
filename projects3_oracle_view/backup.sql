CREATE TABLE MI182_KLLAPUZ3.employee (
	id NUMBER,
	emp_num NUMBER NOT null,
	emp_fname varchar2(50) NOT null,
	emp_lname varchar2(50) NOT null,
	emp_initial varchar2(1) NOT null,
	emp_address varchar2(200) NOT null,
	emp_dob DATE NOT null,
	CONSTRAINT employee_pkey PRIMARY KEY (id)
);

CREATE TABLE MI182_KLLAPUZ3.commodities (
	id NUMBER,
	employee_id NUMBER NOT NULL,
	com_num NUMBER NOT NULL,
	com_type varchar2(50) NOT NULL,
	com_validity DATE NOT NULL,
	com_quantity NUMBER NOT NULL,
	com_brand varchar2(50),
	com_worth NUMBER NOT NULL,
	CONSTRAINT commodities_pkey PRIMARY KEY (id),
	CONSTRAINT commodities_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employee(id)
);

INSERT INTO MI182_KLLAPUZ3.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(1, 1, 'Steve', 'Cruz', 'K', 'Mandaluyong City', '21-OCT-21');

INSERT INTO MI182_KLLAPUZ3.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(2, 2, 'Chris', 'Reyes', 'A', 'Pasay City', '23-DEC-21');

INSERT INTO MI182_KLLAPUZ3.COMMODITIES
(id, employee_id, com_num, com_type, com_validity, com_worth, com_quantity, com_brand)
VALUES(1, 2, 1, 'TypeA', '06-DEC-21', 100, 50, 'BrandA');

INSERT INTO MI182_KLLAPUZ3.COMMODITIES
(id, employee_id, com_num, com_type, com_validity, com_worth, com_quantity, com_brand)
VALUES(2, 1, 2, 'TypeB', '06-DEC-21', 99, 49, 'BrandB');

CREATE VIEW employee_commo AS
SELECT
commodities.id,
commodities.com_num,
employee.emp_fname,
employee.emp_lname
FROM commodities
JOIN employee ON (commodities.employee_id = employee.id)
ORDER BY commodities.id;