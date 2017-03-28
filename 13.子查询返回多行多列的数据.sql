--1、找到ALLEN或CLARK的工资
select ename,sal from emp where job='MANAGER';
--2、连接dept表，查询部门名称
select e.ename,e.sal,d.dname from emp e,dept d where job='MANAGER' and e.deptno=d.deptno;
--3、使用emp表统计信息，在From子句之后编写统计的子查询。
select e.ename,e.sal,d.dname,temp.count,temp.avg
from emp e,dept d,(
   select deptno dno,COUNT(empno) count,ROUND(AVG(sal),2) avg
   from emp
   group by deptno) temp
   where job='MANAGER'
   and e.deptno=d.deptno
   and e.deptno=temp.dno;