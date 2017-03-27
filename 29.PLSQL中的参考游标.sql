select * from emp;
declare
  type cur_ref is ref cursor;
  cur_emp cur_ref;
  var_emp emp%rowtype;
begin
  --打印输出deptno为20的全部成员的信息
  open cur_emp for select * from emp where deptno=20;
  loop 
    fetch cur_emp into var_emp;
    dbms_output.put_line('姓名:'||var_emp.ename||',薪资:'||var_emp.sal);
  exit when cur_emp%notfound;
  end loop;
  close cur_emp;
  --打印输出deptno为30的全部成员的信息
  open cur_emp for select * from emp where deptno=30;
  loop 
    fetch cur_emp into var_emp;
    dbms_output.put_line('姓名:'||var_emp.ename||',薪资:'||var_emp.sal);
  exit when cur_emp%notfound;
  end loop;
  close cur_emp;
end;
/