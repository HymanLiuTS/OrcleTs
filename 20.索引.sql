select * from emp;
--查询sal大于2000的所有人员的信息
select * from emp where sal>2000;
--创建b树索引
create index emp_sal_inx on emp(sal);
--查询部门号为30的所有人员
select * from emp where deptno=30;
--创建位图索引
create bitmap index emp_deptno_bitinx on emp(deptno);

