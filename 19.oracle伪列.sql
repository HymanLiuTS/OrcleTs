--1.1 查询ROWID
select rowid,deptno,dname,loc from dept;
--1.2 删除重复性数据
insert into dept values(60,'soft','shenzhen');
delete from dept where rowid 
not in
(select min(rowid) from dept group by deptno);
--2.1 查询带行号的数据
select rownum,deptno,dname,loc from dept;
--用普通的方式利用rownum进行分页
select * from dept where rownum<=4 and rownum>=3;
--利用子查询和rownum进行分页查询
select * from
(select rownum rn,deptno,dname,loc from dept where rownum<=4)
where rn>=3; 