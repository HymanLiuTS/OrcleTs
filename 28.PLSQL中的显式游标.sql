select * from emp;
rollback;

--ʹ��whileѭ����ӡ���
declare
  cursor cur_emp is select * from emp;
  var_emp emp%rowtype;
begin
  if cur_emp%isopen then --���ж��α��Ƿ��Ѿ���
    null;
  else
    open cur_emp; --�α��Ѿ���
  end if;
  
  fetch cur_emp into var_emp; --��Ҫfetch�α�һ�����ݸ�var_emp���Ա�֤cur_emp%foundΪtrue
  
  while cur_emp%found loop --����whileѭ����ȡ�α��е�����  
    dbms_output.put_line('����:'||var_emp.ename||',н�ʣ�'||var_emp.sal); --��ӡ��ȡ������
    fetch cur_emp into var_emp; --�ٴλ�ȡ
  end loop;
  close cur_emp;
end;
/

--ʹ��forѭ����ӡ���
declare
  cursor cur_emp is select * from emp;
begin 
  for var_emp in cur_emp loop
    dbms_output.put_line('����:'||var_emp.ename||',н�ʣ�'||var_emp.sal); --��ӡ��ȡ������
  end loop;
end;
/

--update���ݱ����������
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

--�����α��ʹ��
declare
  cursor cur_emp(v_dept emp.deptno%type) is select * from emp where deptno=v_dept;
begin
  for var_emp in cur_emp(&v_dept) loop
    dbms_output.put_line('����:'||var_emp.ename||',н�ʣ�'||var_emp.sal); --��ӡ��ȡ������
  end loop;
end;
/

