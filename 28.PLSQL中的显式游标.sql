select * from emp;
rollback;

--使用while循环打印输出
declare
  cursor cur_emp is select * from emp;
  var_emp emp%rowtype;
begin
  if cur_emp%isopen then --先判断游标是否已经打开
    null;
  else
    open cur_emp; --游标已经打开
  end if;
  
  fetch cur_emp into var_emp; --先要fetch游标一行数据给var_emp，以保证cur_emp%found为true
  
  while cur_emp%found loop --采用while循环获取游标中的数据  
    dbms_output.put_line('姓名:'||var_emp.ename||',薪资：'||var_emp.sal); --打印获取的数据
    fetch cur_emp into var_emp; --再次获取
  end loop;
  close cur_emp;
end;
/

--使用for循环打印输出
declare
  cursor cur_emp is select * from emp;
begin 
  for var_emp in cur_emp loop
    dbms_output.put_line('姓名:'||var_emp.ename||',薪资：'||var_emp.sal); --打印获取的数据
  end loop;
end;
/

--update数据表里面的数据
declare
  cursor cur_emp is select * from emp where sal<2000;
begin
  for var_emp in cur_emp loop
    update emp set sal=2000 where emp.sal=var_emp.sal;
  end loop;
end;
/

declare
  cursor cur_emp is select * from emp where sal<2000 for update of sal;
begin
  for var_emp in cur_emp loop
    update emp set sal=2000 where current of cur_emp;
  end loop;
end;
/

--带参游标的使用
declare
  cursor cur_emp(v_dept emp.deptno%type) is select * from emp where deptno=v_dept;
begin
  for var_emp in cur_emp(&v_dept) loop
    dbms_output.put_line('姓名:'||var_emp.ename||',薪资：'||var_emp.sal); --打印获取的数据
  end loop;
end;
/

