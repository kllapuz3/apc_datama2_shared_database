CREATE TABLE mi182_kllapuz3.commodities (
	id serial NOT NULL,
	employee_id int4 NOT NULL,
	com_num int4 NOT NULL,
	com_type varchar(50) NOT NULL,
	com_validity timestamp NOT NULL,
	com_quantity int4 NOT NULL,
	com_brand varchar(50) NULL,
	com_worth int4 NOT NULL,
	CONSTRAINT commodities_pkey PRIMARY KEY (id),
);

ALTER TABLE mi182_kllapuz3.commodities ADD CONSTRAINT commodities_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES mi182_kllapuz3.employee(id);
ALTER TABLE mi182_kllapuz3.employee ADD CONSTRAINT employee_fk FOREIGN KEY (id) REFERENCES mi182_kllapuz3.commodities(id);

CREATE TABLE mi182_kllapuz3.employee (
	id serial NOT NULL,
	emp_num int4 NOT NULL,
	emp_fname varchar(50) NOT NULL,
	emp_lname varchar(50) NOT NULL,
	emp_initial varchar(50) NOT NULL,
	emp_address varchar(50) NOT NULL,
	emp_dob timestamp NOT NULL,
	CONSTRAINT employee_pkey PRIMARY KEY (id),
	CONSTRAINT employee_fk FOREIGN KEY (id) REFERENCES mi182_kllapuz3.commodities(id)
);

INSERT INTO mi182_kllapuz3.employee(id, emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob)
VALUES 
(1, 1, 'Steve', 'Cruz', 'K', 'Mandaluyong City', '211021'),
(2, 2, 'Chris', 'Reyes', 'A', 'Pasay City', '231221');

INSERT INTO mi182_kllapuz3.commodities(id, employee_id, com_num, com_type, com_validity, com_worth, com_quantity, com_brand)
VALUES
(1, 2, 1, 'TypeA', '060821', 100, 50, 'BrandA'),
(2, 1, 2, 'TypeB', '060821', 99, 49, 'BrandB');


CREATE OR REPLACE PROCEDURE mi182_kllapuz3.changemods(empid integer, ctype character varying[10])
LANGUAGE plpgsql
AS $$
BEGIN
update commodities
set com_type = ctype
where employee_id = empid;
commit;
end;
$$
;

call mi182_kllapuz3.changemods(1, 'TypeZ')