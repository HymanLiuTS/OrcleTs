select * from emp;

--����洢����
create or replace function get_income(v_empno emp.empno%type)
return number
as
 v_income emp.sal%type;
begin
 select sal+nvl(comm,0) into v_income from emp where empno=v_empno;
 return v_income;
end;
/

--��plsql�������ʹ�ô洢����
declare
 v_income emp.sal%type;
begin
 v_income:=get_income(7499);
 dbms_output.put_line(v_income);
end;
/
--��sql�����ʹ�ú���
select get_income(7499) from dual;