select * from emp;
--������ͼ
create or replace view myview as select * from emp where deptno=30;
--�鿴��ͼ
select * from myview;
--����ͼ�����������
insert into myview values(8888,'SOFT','developer',7839,sysdate,10000,200,30);
--�޸���ͼ���������
update myview set sal=20000 where empno=8888;
--ɾ����ͼ���������
delete myview where empno=8888;
--ɾ����ͼ
drop view myview;