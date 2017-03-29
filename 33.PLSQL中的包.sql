select * from emp;
delete from emp where empno=7600;
commit;

create or replace package emp_pack
as
  v_empno emp.empno%type :=10;
  function get_emp_func(p_dno dept.deptno%type) return sys_refcursor;
  procedure insert_emp(v_empno emp.empno%type,v_ename emp.ename%type,v_job emp.job%type,v_mgr emp.mgr%type,v_sal emp.sal%type,v_deptno emp.deptno%type);
end;
/

create or replace package body emp_pack
as
  function get_emp_func(p_dno dept.deptno%type) return sys_refcursor
  as
   v_cur sys_refcursor;
  begin
   open v_cur for select * from emp where deptno=p_dno;
   return v_cur;
  end;
  procedure insert_emp(v_empno emp.empno%type,v_ename emp.ename%type,v_job emp.job%type,v_mgr emp.mgr%type,v_sal emp.sal%type,v_deptno emp.deptno%type)
as 
 v_count number;
begin
  select count(*) into v_count from emp where empno=v_empno;
  if v_count>0 then
   raise_application_error(-20789,'增加失败，该部门已经存在');
  else
   insert into emp values(v_empno,v_ename,v_job,v_mgr,sysdate,v_sal,null,v_deptno);
  end if;
  commit;
exception
  when others then
      dbms_output.put_line('sqlerrm='||sqlerrm);
      rollback;
end;
end;
/

declare
  v_cur sys_refcursor;
  v_emp emp%rowtype;
begin
  v_cur:=emp_pack.get_emp_func(20);
  fetch v_cur into v_emp;
  while v_cur%found loop
    dbms_output.put_line('姓名:'||v_emp.ename||',薪资:'||v_emp.sal);
    fetch v_cur into v_emp;
  end loop;
  close v_cur;
end;
/

declare
begin
  dbms_output.put_line(emp_pack.v_empno);
end;
/