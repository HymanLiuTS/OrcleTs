select * from emp;

--�򵥵Ĵ�ӡ����
create procedure print_proc
as
begin
  dbms_output.put_line('Hello World!');
end;
/

--���εĲ�ѯ����
create or replace procedure query_by_empno(v_empno  emp.empno%type)
as
  v_ename emp.ename%type;
  v_sal emp.sal%type;
begin
  select ename,sal into v_ename,v_sal from emp where empno=v_empno;
  dbms_output.put_line('������'||v_ename||',н��:'||v_sal);
end;
/
--���ε��޸Ĺ���
create or replace procedure update_by_deptno(v_deptno emp.deptno%type,v_multiple number)
as
begin
  update emp set sal=sal*v_multiple where deptno=v_deptno;
end;
/
--���쳣����Ĵ洢����:
create or replace procedure insert_emp(v_empno emp.empno%type,v_ename emp.ename%type,v_job emp.job%type,v_mgr emp.mgr%type,v_sal emp.sal%type,v_deptno emp.deptno%type)
as 
 v_count number;
begin
  select count(*) into v_count from emp where empno=v_empno;
  if v_count>0 then
   raise_application_error(-20789,'����ʧ�ܣ��ò����Ѿ�����');
  else
   insert into emp values(v_empno,v_ename,v_job,v_mgr,sysdate,v_sal,null,v_deptno);
  end if;
exception
  when others then
      dbms_output.put_line('sqlerrm='||sqlerrm);
      rollback;
end;
/


begin
 --print_proc();
 --query_by_empno(7566);
 --update_by_deptno(30,1.5);
 insert_emp(7499,'Hyman','salesman',7698,3000,30);
end;
/