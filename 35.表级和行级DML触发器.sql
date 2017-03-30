create table myemp (empno number constraint empno_pk primary key ,ename varchar2(20),sal number,comm number);
select * from myemp;
--表级触发器
create or replace trigger myemp_trigger before insert or delete on myemp
declare
  v_date varchar2(20);
begin
  select to_char(sysdate,'dd') into v_date from dual;
  if v_date!='01' then
    raise_application_error(-20008,'在每月的1号才能办理离职和入职手续！');
  end if;
end;
/
drop trigger myemp_trigger;
insert into myemp values(1,'Hyman',2000,300);
insert into myemp values(1,'Tom',2000,300);
rollback;
--创建序列
create sequence empno_seq start with 1 increment by 1;
--行级触发器
create or replace trigger myemp_row_trigger before insert on myemp
for each row
declare
  v_empno myemp.empno%type:=empno_seq.nextval;
begin
  :new.empno:=v_empno;
end;
/
