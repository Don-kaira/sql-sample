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
      references DEPTS (deptno)  
);
create or replace trigger  DEPTS_BIU
    before insert or update on DEPTS
    for each row
begin
    if inserting and :new.deptno is null then
        :new.deptno := to_number(sys_guid(), 
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/
create or replace trigger  EMPLOYEES_BIU
    before insert or update on EMPLOYEES
    for each row
begin
    if inserting and :new.empno is null then
        :new.empno := to_number(sys_guid(), 
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/
insert into departs (name, location) values ('Finance','New York');
insert into departs (name , location) values ( 'Ethical Hacker', 'Windhoek');
insert into departs (name , location) values  ( 'Researcher', 'San jose');
insert into departs (name , location) values ( 'analyst', 'Dubai');
insert into departs (name , location) values ('administrator','London');

select from * departs;

insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('Sam moon','Developer', 
    5500, 
  (select deptno 
  from departments 
  where name = 'Development'));

insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('Magda Martin','business Analyst', 
   6500, 
   (select deptno 
   from departments 
   where name = 'Finance'));
insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('emmanuel gone','AWS Cloud', 
    8000, 
  (select deptno 
  from departments 
  where name = 'Development'));

insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('gareth wait','Dev Ops', 
   7000, 
   (select deptno 
   from departments 
   where name = 'Development'));



select table_name "Table", 
       index_name "Index", 
       column_name "Column", 
       column_position "Position"
from  user_ind_columns 
where table_name = 'EMPLOYEES' or 
      table_name = 'DEPARTS'
order by table_name, column_name, column_position
























