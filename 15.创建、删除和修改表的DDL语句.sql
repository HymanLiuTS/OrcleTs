--������mydept
create table mydept(dept_id number constraint pk_dept_id primary key,dept_name varchar2(20));
create table mydept(dept_id number,dept_name varchar2(20),constraint pk_dept_id primary key(dept_id));
--ɾ����
drop table mydept;
--�޸ı�
create table mydept(dept_id number,dept_name varchar2(20));
select * from dept;
--����һ��
alter table mydept add loc varchar2(30);
--������
alter table mydept rename column loc to location;
--�޸���������
alter table mydept modify location varchar2(10);
--ɾ���ֶ�
alter table mydept drop column location;
--��������Լ��
alter table mydept add constraint pk_dept_id primary key(dept_id);
--ɾ������Լ��
alter table mydept drop constraint pk_dept_id;
--�������Լ��
alter table mydept add constraint fk_dept_id foreign key(dept_id) references dept(deptno);