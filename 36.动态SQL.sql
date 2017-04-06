drop table myemp;
--动态的创建表格并返回表格行数
create or replace function get_table_count_fun(p_table_name varchar2) return number
as
 v_sql varchar2(200);
 v_count number;
begin
 select count(*) into v_count from user_tables where table_name=upper(p_table_name);
 if v_count=0 then
   v_sql:='create table '||p_table_name||'(empno number,ename varchar2(20) )';
   execute immediate v_sql;
 end if;
 v_sql:='select count(*) from '||p_table_Name;
 execute immediate v_sql into v_count;
 return v_count;
end;
/

declare
 v_count number;
begin
  v_count:=get_table_count_fun('myemp');
  dbms_output.put_line(v_count);
end;
/

--设置占位符
declare
  v_empno myemp.empno%type :=1;
  v_ename myemp.ename%type :='hyman';
  v_sql varchar2(100);
begin
  v_sql:='insert into myemp values(:eno,:enm)';
  execute immediate v_sql using v_empno,v_ename;
end;
/

select * from myemp;
-- 接受更新的字段
declare
 v_sql varchar2(100);
 v_name myemp.ename%type;
 v_no myemp.empno%type;
begin
 v_no:=1;
 v_sql:='update myemp set ename=''Liuzhihui'' where empno=:eno returning ename into :enm';
 execute immediate v_sql using v_no returning into v_name;
 dbms_output.put_line(v_name);
end;
/
--批量接收更新的字段
declare
  type ename_index is table of myemp.ename%type index by pls_integer;
  v_ename ename_index;
  v_sql varchar2(100);
begin
  v_sql:='delete from myemp returning ename into :ena';
  execute immediate v_sql returning bulk collect into v_ename;
  for x in 1..v_ename.count loop
    dbms_output.put_line(v_ename(x));
  end loop;
end;
/
--批量接收查询字段
insert into myemp values(1,'liuzhihui');
insert into myemp values(2,'hyman');

declare
  type ename_varray is varray(100) of myemp.ename%type;
  v_ename ename_varray;
  v_sql varchar2(100);
begin
  v_sql:='select ename from myemp';
  execute immediate v_sql bulk collect into v_ename;
  for x in 1 .. v_ename.count loop
    dbms_output.put_line(v_ename(x));
  end loop;
end;
/

--游标操作中使用动态sql
declare
  cur_emp sys_refcursor;
  v_emprow myemp%rowtype;
  v_empno myemp.empno%type:=1;
begin
  open cur_emp for 'select * from myemp where empno = :eno' using v_empno;
  loop
     fetch cur_emp into v_emprow;
     exit when cur_emp%notfound;
     dbms_output.put_line(v_emprow.empno||' '||v_emprow.ename);
  end loop;
  close cur_emp;
end;
/

declare
  type emp_table is table of myemp%rowtype index by pls_integer;
  cur_emp sys_refcursor;
  v_emps emp_table;
begin
  open cur_emp for 'select * from myemp';
  fetch cur_emp bulk collect into v_emps;
  close cur_emp;
  for x in 1..v_emps.count loop
    dbms_output.put_line(v_emps(x).empno||' '||v_emps(x).ename);
  end loop;
end;
/