select * from emp;
--创建视图
create or replace view myview as select * from emp where deptno=30;
--查看视图
select * from myview;
--向视图里面插入数据
insert into myview values(8888,'SOFT','developer',7839,sysdate,10000,200,30);
--修改视图里面的数据
update myview set sal=20000 where empno=8888;
--删除视图里面的数据
delete myview where empno=8888;
--删除视图
drop view myview;