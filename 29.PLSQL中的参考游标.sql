select * from emp;
declare
  type cur_ref is ref cursor;
  cur_emp cur_ref;
  var_emp emp%rowtype;
begin
  --��ӡ���deptnoΪ20��ȫ����Ա����Ϣ
  open cur_emp for select * from emp where deptno=20;
  loop 
    fetch cur_emp into var_emp;
    dbms_output.put_line('����:'||var_emp.ename||',н��:'||var_emp.sal);
  exit when cur_emp%notfound;
  end loop;
  close cur_emp;
  --��ӡ���deptnoΪ30��ȫ����Ա����Ϣ
  open cur_emp for select * from emp where deptno=30;
  loop 
    fetch cur_emp into var_emp;
    dbms_output.put_line('����:'||var_emp.ename||',н��:'||var_emp.sal);
  exit when cur_emp%notfound;
  end loop;
  close cur_emp;
end;
/