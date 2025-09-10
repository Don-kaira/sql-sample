 create table DEPTS (
      deptno   number,
	  name     varchar2(40) not null,
	  location varchar2(40),
	  constraint pk_depts primary key(deptno)
);

create table EMPLOYEES (  
  empno             number,  
  name              varchar2(50) not null,  
  surname           varchar2(50),
  job               varchar2(50),  
  mobile            number varchar(15),
  email             varchar(30),
  manager           number,  
  hiredate          date,  
  salary            number(7,2),  
  commission        number(7,2),  
  deptno           number,  
  constraint pk_employees primary key (empno),  
  constraint fk_employees_deptno foreign key (deptno) 
      references DEPARTMENTS (deptno)  
);
