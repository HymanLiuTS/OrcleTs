--创建表mydept
create table mydept(dept_id number constraint pk_dept_id primary key,dept_name varchar2(20));
create table mydept(dept_id number,dept_name varchar2(20),constraint pk_dept_id primary key(dept_id));
--删除表
drop table mydept;
--修改表
create table mydept(dept_id number,dept_name varchar2(20));
select * from dept;
--增加一列
alter table mydept add loc varchar2(30);
--重命名
alter table mydept rename column loc to location;
--修改数据类型
alter table mydept modify location varchar2(10);
--删除字段
alter table mydept drop column location;
--增加主键约束
alter table mydept add constraint pk_dept_id primary key(dept_id);
--删除主键约束
alter table mydept drop constraint pk_dept_id;
--增加外键约束
alter table mydept add constraint fk_dept_id foreign key(dept_id) references dept(deptno);