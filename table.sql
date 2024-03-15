 create table DEPTS (
      deptno   number,
	  name     varchar2(40) not null,
	  location varchar2(40),
	  constraint pk_depts primary key(deptno)
);
