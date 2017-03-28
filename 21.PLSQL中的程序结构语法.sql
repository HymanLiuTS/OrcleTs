select * from emp;

declare
  v_sal number;
begin
  select sal into v_sal from emp where empno=7499;
  if v_sal<2000 then
   update emp set sal=2000 where empno=7499;
  end if;
end;
/

declare
   v_ename emp.ename%type;
   v_sal emp.sal%type;
begin
   select ename,sal into v_ename,v_sal from emp where empno=7839;
   if v_sal>= 5000 then
     dbms_output.put_line(v_ename||'薪水高');
   elsif v_sal < 2000 then
     dbms_output.put_line(v_ename||'薪水低');
   else
     dbms_output.put_line(v_ename||'薪水一般');
   end if;
end;
/

declare
   v_ename emp.ename%type;
   v_sal emp.sal%type;
begin
   select ename,sal into v_ename,v_sal from emp where empno=7839;
   case 
   when v_sal>=5000 then
     dbms_output.put_line(v_ename||'薪水高');
   when v_sal<2000 then
     dbms_output.put_line(v_ename||'薪水低');
   else
     dbms_output.put_line(v_ename||'薪水一般');
   end case;
end;
/

declare
  v_num number:=1;
begin 
  loop
    dbms_output.put_line(v_num);
    exit when v_num=10;
    v_num:=v_num+1;
  end loop;
end;
/

declare
  v_num number:=1;
begin
  while v_num<10 loop
    dbms_output.put_line(v_num);
    v_num:=v_num+1;
  end loop;
end;
/

declare
  v_num number:=1;
begin
  for  v_num in 1..10 loop
    dbms_output.put_line(v_num);
  end loop;
end;
/

declare
  v_num number:=1;
begin
  for v_num in 1..10 loop
    if v_num >6 then
      goto endtag;
    end if;
  dbms_output.put_line(v_num);
  end loop;
  <<endtag>>
  dbms_output.put_line('循环结束');
end;
/