select * from emp;

--定义存储函数
create or replace function get_income(v_empno emp.empno%type)
return number
as
 v_income emp.sal%type;
begin
 select sal+nvl(comm,0) into v_income from emp where empno=v_empno;
 return v_income;
end;
/

--在plsql代码块中使用存储函数
declare
 v_income emp.sal%type;
begin
 v_income:=get_income(7499);
 dbms_output.put_line(v_income);
end;
/
--在sql语句中使用函数
select get_income(7499) from dual;