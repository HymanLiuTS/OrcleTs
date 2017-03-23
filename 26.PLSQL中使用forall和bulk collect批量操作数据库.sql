select * from emp;
update emp set sal=5000 where empno in(7499,7566,7654);
declare
 type empno_varray is varray(8) of emp.empno%type;
 v_empno empno_varray :=empno_varray(7499,7566,7654);
begin
 for x in v_empno.first..v_empno.last loop
    update emp set sal=5000 where empno=v_empno(x);
 end loop;
end;
/

declare
 type empno_varray is varray(8) of emp.empno%type;
 v_empno empno_varray :=empno_varray(7499,7566,7654);
begin
 forall x in v_empno.first..v_empno.last 
    update emp set sal=5000 where empno=v_empno(x);
end;
/


declare
  type ename_varray is varray(20) of emp.ename%type;
  v_ename ename_varray :=ename_varray();
begin 
  select ename bulk collect into v_ename from emp where sal>2000;
  for x in v_ename.first..v_ename.last loop
    dbms_output.put_line(v_ename(x));
  end loop;
end;
/