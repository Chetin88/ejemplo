
/* Drop Triggers */

DROP TRIGGER TRI_EMPLE_emp_no;
DROP TRIGGER TRI_new_table_emp_no;



/* Drop Tables */

DROP TABLE EMPLE CASCADE CONSTRAINTS;
DROP TABLE DEPART CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_EMPLE_emp_no;
DROP SEQUENCE SEQ_new_table_emp_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_EMPLE_emp_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_new_table_emp_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE DEPART
(
	dept_no number(2,0) NOT NULL,
	dnombre varchar2(14),
	loc varchar2(14),
	PRIMARY KEY (dept_no)
);


CREATE TABLE EMPLE
(
	emp_no number(4,0) NOT NULL UNIQUE,
	apellido varchar2(10),
	oficio varchar2(10),
	dir varchar2(50),
	fecha_alt date,
	salario number(10,0),
	comision number(10,0),
	dept_no number(2,0) NOT NULL UNIQUE,
	PRIMARY KEY (emp_no)
);



/* Create Foreign Keys */

ALTER TABLE EMPLE
	ADD FOREIGN KEY (dept_no)
	REFERENCES DEPART (dept_no)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_EMPLE_emp_no BEFORE INSERT ON EMPLE
FOR EACH ROW
BEGIN
	SELECT SEQ_EMPLE_emp_no.nextval
	INTO :new.emp_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_new_table_emp_no BEFORE INSERT ON new_table
FOR EACH ROW
BEGIN
	SELECT SEQ_new_table_emp_no.nextval
	INTO :new.emp_no
	FROM dual;
END;

/




