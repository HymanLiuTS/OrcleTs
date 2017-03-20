select * from mydept;
--一 定义存储varchar2(20)，以PLS_INTEGER为索引的索引表
declare
  type info_index is table of varchar2(20) 
  index by pls_integer;
  v_info info_index;
begin
  v_info(1):='coder';
  v_info(10):='tester';
  dbms_output.put_line('v_info(1):'||v_info(1));
  dbms_output.put_line('v_info(10):'||v_info(10));
end;
/

--二、定义存储varchar2(20)，以varcahr2(10)为索引的索引表
declare
  type info_index is table of varchar2(20) 
  index by varchar2(20);
  v_info info_index;
begin
  v_info('姓名'):='Hyman';
  v_info('年龄'):='18';
  dbms_output.put_line('姓名:'||v_info('姓名'));
  dbms_output.put_line('年龄:'||v_info('年龄'));
end;
/

--三、定义存储为rowtype，以BINARY_INTEGER为索引的索引表
declare
  type info_index is table of mydept%rowtype 
  index by binary_integer;
  v_info info_index;
begin
  select * into v_info(1) from mydept where deptnum=1;
  v_info(2).deptnum:=2;
  v_info(2).dname:='软件中试部';
  dbms_output.put_line(v_info(1).deptnum||':'||v_info(1).dname);
  dbms_output.put_line(v_info(2).deptnum||':'||v_info(2).dname);
end;
/