select * from emp;
--��ѯsal����2000��������Ա����Ϣ
select * from emp where sal>2000;
--����b������
create index emp_sal_inx on emp(sal);
--��ѯ���ź�Ϊ30��������Ա
select * from emp where deptno=30;
--����λͼ����
create bitmap index emp_deptno_bitinx on emp(deptno);

