select * from emp;

declare
 type emp_varray is varray(20) of emp%rowtype;
 v_emps emp_varray;
begin
 select * bulk collect into v_emps from emp where sal>=3000;
 if SQL%notfound then
 dbms_output.put_line('sal��С��3000�������ǣ�'||SQL%rowcount);
 end if;
end;
/

declare
 type emp_varray is varray(20) of emp%rowtype;
 v_emps emp_varray;
begin
 delete from emp where empno=8888;
 if SQL%found then
    dbms_output.put_line('�޸ĵ������ǣ�'||SQL%rowcount);
 end if;
end;
/