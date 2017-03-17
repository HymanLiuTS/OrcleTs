declare
 TYPE mydept_type IS RECORD(
   dnum number,
   dname varchar2(20)
 );
 v_dept  mydept_type;
begin
   select deptnum,dname into v_dept from mydept where deptnum=1;
   dbms_output.put_line(v_dept.dnum||':'||v_dept.dname);
end;
/

