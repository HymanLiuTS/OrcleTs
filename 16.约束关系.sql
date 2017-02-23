--��ʵ�ִ�������
create table mydept(id number, dept_name varchar2(20),constraint pk_id primary key(id));
drop table mydept;
--�м�ʵ�ִ�������
create table mydept(id number constraint id_pk primary key,dept_name varchar2(20));
drop table mydept;
--�ǿ�Լ��
create table mydept(id number not null,dept_name varchar2(20) not null);
drop table mydept;
--��ʵ��Ψһ��Լ��
create table mydept(id number,dept_name varchar2(20),constraint id_un unique(id));
drop table mydept;
--�м�ʵ��Ψһ��Լ��
create table mydept(id number constraint id_un unique,dept_name varchar2(20));
drop table mydept;
--��ʵ�ּ��Լ��
create table mydept(id number,dept_name varchar2(20),constraint id_ck check(id>0));
drop table mydept;
--�м�ʵ�ּ��Լ��
create table mydept(id number constraint id_ck check(id>0),dept_name varchar2(20));
drop table mydept;
--��ʵ��������ü���ɾ��
create table myemp (id number,name varchar2(20),dept_id number,constraint fk_dept_id foreign key(dept_id) references mydept(id) on delete cascade);
drop table myemp;
--��ʵ��������ü����ÿ�
create table myemp (id number,name varchar2(20),dept_id number,constraint fk_dept_id foreign key(dept_id) references mydept(id) on delete set null);
drop table myemp;
 --�м�ʵ��������ü���ɾ��
create table myemp(id number,name varchar2(20),dept_id number constraint fk_dept_id references mydept(id) on delete cascade); 
drop table myemp;
--�м�ʵ��������ü���ɾ��
create table myemp(id number,name varchar2(20),dept_id number constraint fk_dept_id references mydept(id) on delete set null);