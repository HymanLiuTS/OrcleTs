select * from mydept;
--һ ����洢varchar2(20)����PLS_INTEGERΪ������������
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

--��������洢varchar2(20)����varcahr2(10)Ϊ������������
declare
  type info_index is table of varchar2(20) 
  index by varchar2(20);
  v_info info_index;
begin
  v_info('����'):='Hyman';
  v_info('����'):='18';
  dbms_output.put_line('����:'||v_info('����'));
  dbms_output.put_line('����:'||v_info('����'));
end;
/

--��������洢Ϊrowtype����BINARY_INTEGERΪ������������
declare
  type info_index is table of mydept%rowtype 
  index by binary_integer;
  v_info info_index;
begin
  select * into v_info(1) from mydept where deptnum=1;
  v_info(2).deptnum:=2;
  v_info(2).dname:='������Բ�';
  dbms_output.put_line(v_info(1).deptnum||':'||v_info(1).dname);
  dbms_output.put_line(v_info(2).deptnum||':'||v_info(2).dname);
end;
/