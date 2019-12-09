-- DROP SCHEMA kllapuz3;

CREATE SCHEMA kllapuz3 AUTHORIZATION datama2mi182;

-- DROP SEQUENCE kllapuz3.commodities_id_seq;

CREATE SEQUENCE kllapuz3.commodities_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE kllapuz3.employee_id_seq;

CREATE SEQUENCE kllapuz3.employee_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;
-- Drop table

-- DROP TABLE kllapuz3.commodities;

CREATE TABLE kllapuz3.commodities (
	id serial NOT NULL,
	employee_id int4 NOT NULL,
	com_num int4 NOT NULL,
	com_type varchar(50) NOT NULL,
	com_validity timestamp NOT NULL,
	com_quantity int4 NOT NULL,
	com_brand varchar(50) NULL,
	com_worth int4 NOT NULL,
	CONSTRAINT commodities_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE kllapuz3.employee;

CREATE TABLE kllapuz3.employee (
	id serial NOT NULL,
	emp_num int4 NOT NULL,
	emp_fname varchar(50) NOT NULL,
	emp_lname varchar(50) NOT NULL,
	emp_initial varchar(50) NOT NULL,
	emp_address varchar(50) NOT NULL,
	emp_dob timestamp NOT NULL,
	CONSTRAINT employee_pkey PRIMARY KEY (id)
);

ALTER TABLE kllapuz3.commodities ADD CONSTRAINT commodities_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES kllapuz3.employee(id);

ALTER TABLE kllapuz3.employee ADD CONSTRAINT employee_fk FOREIGN KEY (id) REFERENCES kllapuz3.commodities(id);

CREATE OR REPLACE VIEW kllapuz3.employee_commo
AS SELECT commodities.id,
    commodities.com_num,
    employee.emp_fname,
    employee.emp_lname
   FROM kllapuz3.commodities
     JOIN kllapuz3.employee ON commodities.employee_id = employee.id
  ORDER BY commodities.id;