select * from mydept;
drop type project_type;
drop table mydept purge;
--清空回收站
purge recyclebin;
--创建数组projects_varray
create or replace type projects_varray is varray(10) of varchar2(20); 
--使用创建的数组projects_varray创建数据表mydept
create table mydept(deptnum number,dname varchar2(20),projects projects_varray);
--向数据表中插入数据
insert into mydept values (1,'系统软件部',projects_varray('NGP','Pecstart'));
--更新数据表里面的数据
update mydept set projects=projects_varray('GNP','Pecstar','IEMS') where deptnum=1;

--在plsql语句块中使用数组
declare
  type projects_varray2 is varray(4) of varchar2(20); 
  v_projects projects_varray2:=projects_varray2('NGP','Pecstar','IEMS',NULL);
begin
  v_projects(4):='IEEM';
  for x in v_projects.first .. v_projects.last loop
      dbms_output.put_line(v_projects(x));
  end loop;
end;
/
 