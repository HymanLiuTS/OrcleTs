--表级实现创建主键
create table mydept(id number, dept_name varchar2(20),constraint pk_id primary key(id));
drop table mydept;
--列级实现创建主键
create table mydept(id number constraint id_pk primary key,dept_name varchar2(20));
drop table mydept;
--非空约束
create table mydept(id number not null,dept_name varchar2(20) not null);
drop table mydept;
--表级实现唯一性约束
create table mydept(id number,dept_name varchar2(20),constraint id_un unique(id));
drop table mydept;
--列级实现唯一性约束
create table mydept(id number constraint id_un unique,dept_name varchar2(20));
drop table mydept;
--表级实现检查约束
create table mydept(id number,dept_name varchar2(20),constraint id_ck check(id>0));
drop table mydept;
--列级实现检查约束
create table mydept(id number constraint id_ck check(id>0),dept_name varchar2(20));
drop table mydept;
--表级实现外键设置级联删除
create table myemp (id number,name varchar2(20),dept_id number,constraint fk_dept_id foreign key(dept_id) references mydept(id) on delete cascade);
drop table myemp;
--表级实现外键设置级联置空
create table myemp (id number,name varchar2(20),dept_id number,constraint fk_dept_id foreign key(dept_id) references mydept(id) on delete set null);
drop table myemp;
 --列级实现外键设置级联删除
create table myemp(id number,name varchar2(20),dept_id number constraint fk_dept_id references mydept(id) on delete cascade); 
drop table myemp;
--列级实现外键设置级联删除
create table myemp(id number,name varchar2(20),dept_id number constraint fk_dept_id references mydept(id) on delete set null);