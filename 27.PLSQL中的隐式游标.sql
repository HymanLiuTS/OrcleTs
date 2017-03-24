select * from emp;

declare
 type emp_varray is varray(20) of emp%rowtype;
 v_emps emp_varray;
begin
 select * bulk collect into v_emps from emp where sal>=3000;
 if SQL%notfound then
 dbms_output.put_line('sal不小于3000的人数是：'||SQL%rowcount);
 end if;
end;
/

declare
 type emp_varray is varray(20) of emp%rowtype;
 v_emps emp_varray;
begin
 delete from emp where empno=8888;
 if SQL%found then
    dbms_output.put_line('修改的人数是：'||SQL%rowcount);
 end if;
end;
/