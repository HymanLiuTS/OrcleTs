--1���ҵ�ALLEN��CLARK�Ĺ���
select ename,sal from emp where job='MANAGER';
--2������dept����ѯ��������
select e.ename,e.sal,d.dname from emp e,dept d where job='MANAGER' and e.deptno=d.deptno;
--3��ʹ��emp��ͳ����Ϣ����From�Ӿ�֮���дͳ�Ƶ��Ӳ�ѯ��
select e.ename,e.sal,d.dname,temp.count,temp.avg
from emp e,dept d,(
   select deptno dno,COUNT(empno) count,ROUND(AVG(sal),2) avg
   from emp
   group by deptno) temp
   where job='MANAGER'
   and e.deptno=d.deptno
   and e.deptno=temp.dno;