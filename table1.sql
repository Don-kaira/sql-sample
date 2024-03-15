create table EMP (
    empno       number,
	name        varchar2(40) not null,
    surname     varchar2(40),
	jobtitle    varchar2(40),
	manager     number,
	hiredate    date,
	salary      number(8,2),
	commission  number(8,2),
	deptno      number,
	constraint  pk_emp primary key (empno),
	constraint  fk_emp_deptno foreign key (deptno)
	    references DEPTS (deptno)
		
);